Return-Path: <linux-arm-msm+bounces-91192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFcdIdh9e2kQFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:33:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E46B17D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18A4D301CC7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED8629C351;
	Thu, 29 Jan 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRYcrW8v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cc80/gMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363A261B80
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700806; cv=none; b=AT2MfSQj+kYdp7DVemdqRwzvn3LmFKxDSgFDRQ8N+XEY7nxvW0VbSNJ+8FUrbwfGSRnLihDZtiU7ssYv9GPiShETRoYrWHukguHMmqc6lMqYtGRfGEo1kW/EgV+tTThyNxaDt3QEw7z41e76vSEOKN7DTYwk5m65gaHmU6nwFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700806; c=relaxed/simple;
	bh=vmFjdJkXpkSf4sxX4zdWegiARLgfB7RwzAokglj6eys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXNYDz1fPpr8bH7Eqzer+Hre8/knWSa4HJZoZffujGJZdTIkUZjf+eTqw4gyfVMlhnBhAqPFIJkf/qgNH9sw3ZDitJb5W3DKDECHkkpckBCgtVsx6er9mD+TbcOXMVBe5MOAmQiZve8BBn+ZliwhQCqbDH+XVZe8VXGUlx/3GJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRYcrW8v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cc80/gMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9nWDQ2150478
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A3WZhvHW82SwVlLZqPZVPoXg
	dj0PnghDjl7TbC896NA=; b=oRYcrW8vnuUzL3zTGmJWOdDNlmKyyDgYtHiNnHWI
	wBcI61NV0DOShOVfovRxduTVSII+syyxmlnbL+LA4PXu39DST84r5sWI584rf0qb
	MLNPWO0OroVbGsRxyE1TbWI/UnuN188czEqeDMNyL3QbKQNyrNNQs/QT2JwFXdEc
	H2A1hybvTzZ6kCaaf9pDicI+SqZO0fWpwxfCa/jT45mMUIfH4YO2amQ6dfGUbDS3
	KpFSXnIYbCzLgHnKhNa9Muh0Ook3kaEUh1DOwUp4qL/FlPGNGIFSpQYNYJmV49XM
	DgJecWkQt43EvpjE2jcZXHdZRnZH0+aL175lnVuMelj3jg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3c0tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:33:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f42368322so887741b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769700803; x=1770305603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3WZhvHW82SwVlLZqPZVPoXgdj0PnghDjl7TbC896NA=;
        b=Cc80/gMTEqKhLfFTM8Z+kXN3FZ/DXiuxSZFlE1bwTkM1YBZh6sHLqzuPrSnQ5crj8O
         lKUeGrHkUmEpJaVJJKq7GCeYo+MNEOCDND+2GN9IkHBRM+df5pKyNJzIx/07IIf/3Hiv
         iS1UpZdU9I3d85juPOKJT9w9jdoY9dQqZUnlNEyquOXLBzb0ZsZRpCVvLmjMrnN+eYbz
         VF+JvrDy0/zIb88vBZzzCP3IZo7ZO+D0gkx7blw2F+Eln4PnbNXwzJxi6Ix38Wpi3noG
         cl4dxeDdsyF0vZWOzkZKzdG4Bjw35l2Ne9yEe6yrjQe7+IYiM0kI0Dug2B9L8mqchgjA
         DSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700803; x=1770305603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3WZhvHW82SwVlLZqPZVPoXgdj0PnghDjl7TbC896NA=;
        b=coizsl80uTawei2v2fws26wM+zQLYxNGFWS8XV8weweqrD2jwoibvY+7lVgojyPrsE
         PmIp83pI5wDRXVWXWhvCs1QdLRuQWP2SIiouPhXHcaTq22gdivlZqKorJau0JgpgWw6k
         pNIDq6N20ZPm/CCtRh3/RgNFhgwrG9ewAD7BDAK/vudebm6B5GMG9oPh/Wo3YncK6pPK
         hWG6RXVbl1flFrHxp8kJejSP0SXuqfbPfUR30HlWJt1vTfbTAhrft8mMEFN9A30BO9K9
         EUa5gbZ38Gl2xZdRR++Zv9yl7ZE3AnbCU5mmTPbN6bUT5U4mHsFHTICgsjC5D8ZPFy4x
         jraw==
X-Gm-Message-State: AOJu0Yx8p8KH1FEd1blogPUSwxgv7eAxWiShdyjnXurxnxG56lHbM9O/
	pphKxcefjp84w3tKioRpXWXlFWnWwkiirDFSvO+NVyADY0Xx2WN/jwxFFGJnY+6iT/YhW7eTfs0
	ZgKwE70QWnAiQZzTwxi1oR5uob3FuitR3kjdaGU7M9KUPxwER03zUc9t0/GfiF5DBkp3Q
X-Gm-Gg: AZuq6aLEFqp3iGb/fB96JGCuGjodZ7+0VNWELR4sl9RxfxCoylJSwsanxisNcj9ADjH
	W7SCkuZDuJy+ZgD8vhyUg0LTgIsIYf6czRkJmn+IPKL3w88WFDiM6iHNhGSLNOGqd2GrCGjjBIe
	3aVYEb1E5D8ODqHXeAsdLxSwSnSTpYuYzyIPovaX5Ccl8I386RaIGcAzjooAj02remU5j/59xlr
	G5ziF1G/bBayq9RBZSOKeM/40IHIlF5G8qyb26JyhtxmTnEbFO7ZbT9DZmCTctjPRifbOrHs3BT
	vZnmfYMKO/hoIo5pS7n3M7qWKLwQI1kp3EGLR2OB2H1du0PnoLYOmdKTSUfvnXGsG4wUKf2MTtm
	HhUjEfm6gmtCKMCPKDatKR/o30a2dx7mWKAwC
X-Received: by 2002:a05:6a00:a882:b0:81f:40e5:34b6 with SMTP id d2e1a72fcca58-82369178aebmr9012147b3a.15.1769700803336;
        Thu, 29 Jan 2026 07:33:23 -0800 (PST)
X-Received: by 2002:a05:6a00:a882:b0:81f:40e5:34b6 with SMTP id d2e1a72fcca58-82369178aebmr9012116b3a.15.1769700802804;
        Thu, 29 Jan 2026 07:33:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6a5desm5336352b3a.28.2026.01.29.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:33:22 -0800 (PST)
Date: Thu, 29 Jan 2026 21:03:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: pd-mapper: Fix element length in
 servreg_loc_pfr_req_ei
Message-ID: <20260129153317.u6umalf235gjdhuy@hu-mojha-hyd.qualcomm.com>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
 <20260129152320.3658053-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129152320.3658053-2-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b7dc4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-BAboINuH9KO5_suxkYA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 87jy_outngELwEdK2-iUZElz15_iy4T4
X-Proofpoint-GUID: 87jy_outngELwEdK2-iUZElz15_iy4T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwOCBTYWx0ZWRfX3ZhqfP4B/nAy
 Q/0kC9TYu3cyUuXRRNzCKYBmRJ6MUlqU7r+5mHwBEwDGA3yqjwPoNy1rtqn9LVmKw4V0mzWvuX1
 FsIi1TCUa2J89jgnfBFOzG1pcBYw3C5KYEFdugouWGRnA7CYQWmZGKKbaTnREcJecK+HkoBO9aa
 xLnMjEJ4rDSSSMcxYL0UNYw/XbCbtkrMQVNOqgcZ1rm2B30gFDlcKC/AGJP2dBW2SS+chSLXQ0S
 4+2lPsVR66/PR+oYd2bbtlq+ZK2FEY559eVl4WqVjP/9rX4idc5wRIoK3Mn1R5L2+d4jXe+RwHQ
 lBImhYFOVeiP4p9ThMuvfJON4aInSev8tnN539zb61cfco1L0nunE1I39rmPDJ0NaH9sSbdziyq
 E/xYArEWp7WOxfU7aZwIaclfStx7+rkIVl8Y7hnu7GwzdqFdElElOPtKLpBMkvTiuvt9od6FM7Y
 YGGFiEWha9h5SCzwG3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18E46B17D8
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 08:53:20PM +0530, Mukesh Ojha wrote:
> It looks element length declared in servreg_loc_pfr_req_ei for reason
> not matching servreg_loc_pfr_req's reason field due which we could
> observe decoding error on PD crash.
> 
>   qmi_decode_string_elem: String len 81 >= Max Len 65
> 
> Fix this by matching with servreg_loc_pfr_req's reason field.
> 
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Just realized that, this should be first patch as it is a fix patch.
Let me know, if it needs to be corrected.


