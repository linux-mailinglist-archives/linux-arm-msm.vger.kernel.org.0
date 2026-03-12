Return-Path: <linux-arm-msm+bounces-97217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK42C8C8smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:16:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0947272630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FBF230880DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8420345752;
	Thu, 12 Mar 2026 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSsLW5/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZO0ZpIIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F43C554A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321287; cv=none; b=T4tFcAWONX26djvaZSmplsQnmkn1HCANV5RG6R8JqZFazr6oIhtJQXjjc25IQ4/L6hBuSxGk1BMVFCTh0DJ8Fh6zp4FQZjAbnAi4U1FBCZ/BcWxYjXZb4ot7dbxC1Gbvt03JLykFfUvYkjIXOIiF2U5T4PsiRcGCnmxsF00mVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321287; c=relaxed/simple;
	bh=ePrBOIgh1g3/NiYzYd+xgOop9K7VpKCJ57VPnRxbi64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ13U9P6VluKbGGCwri3emIMrxFug3TpElK4gj/SkDeuJHMamnLOFubkZmWsxkqITpuyVD7DDWmkI6LAmdOE87rwgZAf1ay+6QCiPyBsQ43RdjKmH59WatFDQYANkcLyM6Jzh9X6j5YpECcux6c+RY0AojfklRCteSEg/e3k5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSsLW5/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZO0ZpIIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CALh2w4026710
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ldanf7ZxN5751Df+TS+u/IOh
	H1KN8mIyUIiBDd3ib+8=; b=eSsLW5/cKmIVP3E6e5WHjMOF3pbd4IXixBZcmSw4
	Fse2NC1+CUhq5V4mXfpBiL3TYbQgjtvzgEMG8HHhAfnVzGicDKoUnHkIIXkxsOMR
	KV7T/ihHNzmFWqS/SLAmEvyBUKRWvBPpz7mbRr8qdkr/MXOcFEk3DNue9nLIViIB
	5qaMMib6MVm8R/Muxskz+udLr++ZyTPBnrvPzCgIS9OgsCdAPJuiWo/K1a2/Rl8C
	AsY4yawI0ROzG3t1Av5ZHOniX49b5qMy7ZPtSj7aeCdhfuIMoFT5/JlPq4/91cr5
	fTH2coKcs+j8obAsWyg6zmJvTBtG8MFS4EqYccnBkcF/DQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54t4j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:14:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so604006485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773321282; x=1773926082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldanf7ZxN5751Df+TS+u/IOhH1KN8mIyUIiBDd3ib+8=;
        b=ZO0ZpIIxvmkLLmsikN02eIc65ac2YUeumCXdOuYE7X6pHxnOvH59aeViNKLUwXQLwX
         b/EaRPkxXebFvMkPOkr/GqqcaWujkdQUvMSWrpgB7ReXUS+JKvQsdKp6Pd0MJxozJoa6
         Gpu8o1fcQ5QdOTNY9kz78+NdYThQlmmyzUG+JAPRpI9kp0/cIfKZEnSu1t3NqPK0OFH2
         98OVM9VbTajTrkei3IVTxoHLUFqEeQFU6YX8hwkPorIBfaQq2x9OrntUV5JmCLoENiOV
         2fUQFVK54TGR9a4ZO38/L/a7jKQ+sywuVcWn4iARiBu03ss/2RcJzo8W2RlcYqrTCzTM
         tI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321282; x=1773926082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ldanf7ZxN5751Df+TS+u/IOhH1KN8mIyUIiBDd3ib+8=;
        b=m8JA9YNRC7LfNUMkZN7dqXyX6jHQup7MWo1TTH5AqIiCGRTd89O/cHU+F+cXKnOjXK
         INWwVKAuuChmc3hLjMPYofubUSXXpmK6A4zU3Ec2C6AV46kmhHPpmMbQi9l05Zi4yUu9
         VmSeZAF93d/jTp9sa4qrwtW9peWXkZkKvtDPhKscNeDPZnWo1HwRJ3kX5AENbRxReORR
         GRRdqTszz4wdusN7sCSvUlH6f4siuVK6fMeLKKlJvYWJUgXBxxgVf4OlVvkK8Y/1AUKy
         pgkTNUVHO+iNMu0aNJLNsTy2Vc9Ac4RF5+2NSoypbAs2Tfb2gP0ngUZc04pKK3/Hq4Sw
         UgSg==
X-Forwarded-Encrypted: i=1; AJvYcCVpjFuN26effPHAsSSmolu5hSVQqW+0BHIjjK7vLnKSFn7rR7NV5mi5gAsPN4ZvkL4URYMzJNGkjXy4bOsJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5tAhKOqzNZrnfqJnGyErAZmtXap9hVCm4XZ6+BjjQEIp/y0+U
	QC7BXdlcsYUEDxRCYjudejpqfUXJ5TPqIQE+JMtRc3v9g7DfTeBeHemeMQBXTpIDLWWSxvkqZ2J
	uk70Het31VQ/KlxfzpW1IR0ur32tH8NceWOLP3V1azOrIfYayfjECfxxv8URYtO4o6FT/
X-Gm-Gg: ATEYQzxhAYyhGuqgytIxKHu/xMpP8j4px/iNk2cNlMThZR6DzspTyya2J33RKEQFgxj
	yhlOuwShvanM/FfGBr/u7Lx93f6I48ZU3Kcol/WStG3m7FxWeE7NNxGrvsqxdDebX6D8+sezsY/
	HAuS9Mwg/RMKMBqn1omqPEFOP62NsGqlPAJu7SGfyy8j5XRlE9F+yuIVu+pDmjQUG5xT1QQGIfR
	bD9cuWqAN9FnyFa/yCjb3NaMB9ixTjApQcMAFVksqLSpKb9KCqS87YgurQocwRNtiVhLyr61iWx
	nZt8J5SZtLiHnEeCzkSiC5bo7tKhyIsjMFDtLDNvn4/ks1G47efhF/mkH9Ky0vxa/e/9Jc3dxsZ
	VAk8CRv86l/hB9/O5zbqh8NygoiByKy4yTubU1FUfuvHSs5V9KoBtXCnQh2eDN1xzNPPwKAm1RT
	cHsEohMki6tkv4pZ+s25vHbXOcz0FZCIHt1Cc=
X-Received: by 2002:a05:620a:404f:b0:8cb:678b:4877 with SMTP id af79cd13be357-8cda1ac6db9mr705918985a.57.1773321282196;
        Thu, 12 Mar 2026 06:14:42 -0700 (PDT)
X-Received: by 2002:a05:620a:404f:b0:8cb:678b:4877 with SMTP id af79cd13be357-8cda1ac6db9mr705915385a.57.1773321281622;
        Thu, 12 Mar 2026 06:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e7d9sm948962e87.35.2026.03.12.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:14:40 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:14:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] clk: qcom: camcc-sc8180x: Refactor to use
 qcom_cc_driver_data
Message-ID: <oouftqosryziap5gkojd4sx3zwc3ecpdocxfndhrxxrk4yto4h@zdqnxr75hyip>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-12-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-12-val@packett.cool>
X-Proofpoint-GUID: HLqJ_27sHbAJoi8xyNWes74IFNWA6R0x
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2bc42 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ma-uBWqLQOsuroI5m_MA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HLqJ_27sHbAJoi8xyNWes74IFNWA6R0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNSBTYWx0ZWRfX2p8MOGqp8qMY
 guI+gWTIu7SCgfuutZl68U/BBpEfQjySVGhfD1vK8CDOuu1vg8Ndx2zu5bK6K6DSoOIG+oE1r8p
 9r9htsX3j+Mo/FDof7rqpNLPGvGyAQUhozKKYp5202hy45spu28sm+ckum7w6hTg55wQnBnNrc5
 ERE+t5hSky2Tf3fXkV52OYsP9RmdfXp2iR/zQ2TBPExe1BOU7SzptLpsB/FygKZDQUlG9ny04+u
 z4QJBo0cV5cDjT2HCQKBkFR1/QayjsSQHlOw2FLzjjPD1g9OWTZ/w5w7hEDOvsNDBpSysFVzPom
 n0mxBKRQcw7/6kmPPU2DZO7BFUPhwVkhNGO3kxy6xsXamWPL1oyqpPwh2I3mcN4Roz9mO11fn6t
 hgQfxUWIrzZNJSJ2r9WFYtKoSSgAdW56LD3CfX0hnzm9KNqF1PKPXGFCXaXNrX5dqui53IpgZbj
 YBLBrxo8gHPcnGVgwXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120105
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97217-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0947272630
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:12:16AM -0300, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 67 +++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

