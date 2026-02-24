Return-Path: <linux-arm-msm+bounces-93862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFO9ApITnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:57:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7830181305
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EE1B313EF98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DA26ED59;
	Tue, 24 Feb 2026 02:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkjuwZjK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1uIgjWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F2267B05
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901670; cv=none; b=OvatQMYVA6iZnze/rNmhJwZ1vEDeB+OUixgH7aC8CSFO0YsAcemD5igPxBYLJEe0PsuCguWkeYYFNlHja0Ywt4a0P5rKUTcnghfxDa3l62ARetz/SHDDj8IeTRl3dMlavg9oMtIXnJ0GA70sTa3zmSsKhaBjMbJE0eFZydej0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901670; c=relaxed/simple;
	bh=9V9JkO127PuIaShPxH8QEFhIUGMbTUeY+yKtEJFoC+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPuCk0GGTyDJBkrOfcArulQq3CmdkB376FmgEPy39fl8TSx9QVqrWfXwVc1wLq+PTV5hZzMGL8Mc1KHQmTZXPgk29I6bR/u3eggVKh0qv5/CRTHC+2mXjtKHkJ4wK1hpZMBB9eZThSKNxSsz/5Bwcys1vahHQr7sei0Y6rh7cpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkjuwZjK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1uIgjWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2lvGB820849
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27P8vt/3PU1NEyZL12Qoh4+T
	QwQniBL/QauDntcfqjA=; b=BkjuwZjKpk+fB/G62LSBZt95Xp6Y5PyxzLaLA49M
	2Ilcf3oPeIeBQklLyVEC+CP+t0zPaSDcKpTBUdi5jg0JDQe42eOswXwXdI3r3iOo
	cXxWFA4RQIJjolP1kE4YGfRQXq8a5mrcoiXjOzPLMQRU8lXBXqoTnd96ZAavmf/x
	oFNODArnJiK0lXIrwkTfTve6qopqyX+zCrrWw5V0FjMBahGzQLjcz+8k8xj3/o5z
	yP/Wyotopet0kl1BL7nwELAsa0GcX1IMHc/N/MxMZ6jocbyCSMB2YiDIa4/r025s
	Ee5I1DIz+6proFZPZC+NRMoG5zeTuPjR3DhdJuEtjG2cGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8ac6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so5380907485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901667; x=1772506467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27P8vt/3PU1NEyZL12Qoh4+TQwQniBL/QauDntcfqjA=;
        b=W1uIgjWcNf5u4hwjepvy7IYeLtNNPaY9q+XREgNVnifzUsuIAefqqRkx63jWPcygHl
         BKCRNB7WKd3GgnTpEUyeOrHScZLALSgubMbmZWCcApfY5tjpLym/onbi1NKFNtHlqiem
         LmMT4s1OB77o/4o5B4eUraLl+tS2zQaercF3vuVyoBzkFtzEUuPf6dgzOnwMaElIm/M1
         UFeNaSzZf+Z0ck6cDsOs9YGseoJ/7smFYBNgAFhzCIFAhRzCwWoBARA8dPhPttODSbmo
         u6I+OkkKBuflFOfN7csh81jLyJkk8A2He8D4vLi0UPaXRaZ/MSdixPnFQCOkwX69zCAA
         fvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901667; x=1772506467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27P8vt/3PU1NEyZL12Qoh4+TQwQniBL/QauDntcfqjA=;
        b=iui8WUgmk4WbZ79SLVNddS3vSfZsxzgSlmO3bcnUrJ3/ayIKjoMwkEad9HkQDBmMsV
         DYTu74Y/ywF2MyMUEfZYOiqABQ/7OohAuCjalA+xqP8/tHgEV32C8yn930MQIX0ggfuC
         yB0H7egahqHM2TPx4q6BDYwYgU2zxqQ37t0YbVMoWix1mhJPEMl3546YVdHGAD91xeyA
         hpCeuQBdxa2LB9NSPT0P1ekh8IOY1+6KsCiW3843p6B2lEPDwLx2D8oK3y/h8vu6q/1n
         99l/Qpfxp3dbY/bP0WTZD+4IZ243bzB2fYnjPfYtRQutZeQAogSd5GBNTJYu3WRvM2im
         v+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnLmP8iQwHLSol1uETmEufGyNCKumhXnIta6iBajZv9eKjUhykIVpXwtyw/XeJanxlSnDFzOxrqtKIIE0/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmylFL/+5MN2U3akOvAM5SFL3XFwB/aSVwyTmiH5HOmrhVOB/y
	KRg5xjs4ESE0scXXwwK9k3RXmyefeLEcZyEWDHo4hq9AJ98DZnclw4ukQRARABMMNMHp41I0Iey
	g2aBavVtHiryG4lFZWI0kXr3YI5BoCsIoyTBF653UDDww/iJ8PN8wF7XDcNMBNzXygT29
X-Gm-Gg: AZuq6aI1LLdB+zILikXc7yjOhVKZR8x1PVs+qq71D1VrCTT5ys5DxYautgxEkokb3IL
	AD+l5VKD8Bl0pimyT+vebJ2QpYwOUKiCkIYlIjIRFinxaCAIruY+MQ9iJDJzkNH0MrhEhzEQSEZ
	SpkdFTh5z9AoSN5/dEHFKfmLKwW02CuOG6hzAiNX7kPcVUkQMo47ogjVQJ5YeC3AExYGLrM4dIv
	UDyWh+c3wDPLU15iooqlAlHUfBAUSwa64bb9AqTMnVocuUt0SPELF4aN20bKG1kaNt+gm/w5weo
	85TVQ4U+eAX5A/HcOtCpSmu9vSdR+6/jRC0+JPt/UazHFei6cPkRanh0YQuTaq6pE5jNXhydGtM
	DN2bmw8raDbvFdI810kMZ7VhbNabbOChMP/4lMHsgfIEq5S/6P6wZfoLR9etmV+y2V7HMHnLvWg
	LfUxvQO07rqlUMTeace6HQjgoi5wvVayJ9tlU=
X-Received: by 2002:a05:620a:370a:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cb7bfe7d0emr2010287585a.33.1771901667229;
        Mon, 23 Feb 2026 18:54:27 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cb7bfe7d0emr2010285985a.33.1771901666793;
        Mon, 23 Feb 2026 18:54:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1ff7asm19077641fa.26.2026.02.23.18.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:54:24 -0800 (PST)
Date: Tue, 24 Feb 2026 04:54:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcs615-ride: Drop redundant
 non-controllable supplies
Message-ID: <nv6lfzsbuovujvcyo27igxzvgksxaaskmcsvlkpiwhfrandswv@nbdeelzc5fv7>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
 <20260223-qcom-dts-supplies-v1-2-f90ac885b3fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-qcom-dts-supplies-v1-2-f90ac885b3fd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNCBTYWx0ZWRfX99UvsxJRuZ8n
 3JSPrESzCaEkCtuQMesAPBYmdzSQ0zY1iWpnb0yv4c7otx7gblItJtNxsU3UqNKVqUpxzniuybK
 eKvu5VXrPmT2Gy697Mi69wpGTFqzWhUETcgXaQbGkwgAEBTuio/mY+gYnscOCxTK3HLjm7kZfW+
 RLPPeQgz5fynt/LRYD1cbEb986kwAXpnkY17PAf3/IKO9oT6O0glVysgfrdVLIQhO9C0HPSHQro
 Rc/l2BhjOBISG2MI6vNBD5DuQP9eJiERMSGfc2KviMsNGDfDE3JC1R2aRYXfjTsDwYK5n31V8Sw
 x/1K1XY/riz10RxsG+FyF0bKslhYaUTMBVBgeyiRUdsv4xCMRt/EmEPEHqbk9QytpGpxQfoE8D6
 IDWziBADYSeC55DgeQQYCGGyE66A65HeMKHfJ0gtwBOTqI+YYblMm/+GggPKUDi6lKdJ8F/uO3b
 SqWphuaUNK0dnBiegYA==
X-Proofpoint-GUID: jjq6c_CtHk1LD9-r8dFLfvZ8TUeUymqO
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d12e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YQIQ00YL77e8QyTPvtEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jjq6c_CtHk1LD9-r8dFLfvZ8TUeUymqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93862-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7830181305
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:54:18PM +0100, Krzysztof Kozlowski wrote:
> Drop completely redundant non-controllable chain of "regulator-fixed"
> supplies, which serve no purpose except growing DTS and kernel boot
> time.  They represent no added value and because of being completely
> transparent for any users of DTS (except the bloat), they should not be
> represented in DTS, just like we do not represent every transistor
> there.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

