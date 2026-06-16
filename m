Return-Path: <linux-arm-msm+bounces-113313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h/CAEDygMGpUVgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 03:00:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C768B229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 03:00:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="c7ge/V1F";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Luhk3rd6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113313-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113313-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3BAD3107AEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFD525A640;
	Tue, 16 Jun 2026 00:58:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12E207A20
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571488; cv=none; b=VD6M2SZJwVV11NXBVgqjD9+sR8Z50bKfi+HyYLweyTI9ID1n1XjOmalEb/4oigLsQK5q2hea6D8s1HSsovqGUpM6YgAPGSlUMUGGfaeZKYKxxK3JQS3dqnmHuX+pApYpe26Yjm+z4smaFLIKBu9d+SV6BxMQ/aAEpB55CZi1tMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571488; c=relaxed/simple;
	bh=V2izehxJHiz5lHOcnoDYAHcF/YhGu+nIUCvOKbDgH3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADNSPJ8KOraWl7b7k2VAf9OT+5oCP9o4zyvZdcgvVRWlwPlReCEcv1iGyVtFHIlADaunpTVf9ez6M6Yi4dfPKFp/hERsQSgnNDpgzy21ENslT4g6ZIk4Tiw/dFjFrouJIKbREILZ9jydpDK9Bt7xfQCr5MdKQwaUyZDiZWESU30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7ge/V1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Luhk3rd6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OS2U1593157
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OiyIJgSEwfIFbV0JUiz7Djf4
	fEFq9snfYC04/f9wwkA=; b=c7ge/V1F+A+RO8G2+cW3mG52ytI1zAoYhxSqdq5L
	mgv5DprWep6Y51lqjW0owMchRhC2g45k7MZPsbkMlh0HouPwnQMDWwitCRqFKX+W
	WnIq0g33dKn7UQAi8UsZ+0dIE/INvcdMFEzbfIg710FU5/3ebRGETxvND4VCsvnc
	gU+wjIGLGw3mOKc7A874s0VLqb1XHHPA+oaVjOuMOJ/vZqetKovB3aWcrZKepK0z
	twphHXyrQAOXZHmJF7RE10r4VLEjl2UV0+pOhlgCr1Srz/fvIXdkGTs/XBQFR3dZ
	Jp6lAdo6/BRyV6wl2W1txsEDBe7LfBX4T2dJhtFvvtNyFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73tnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-918622c3c7bso592335285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571484; x=1782176284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiyIJgSEwfIFbV0JUiz7Djf4fEFq9snfYC04/f9wwkA=;
        b=Luhk3rd6Vi9qBXMKrZbKv9r91SZ4/0OvwFUYgr2QaxMPcuIqqpA9vErV8K7a2tzUDy
         gLY/ilB2y34IhvDF5fPdiMlFMqYNfMK9PPaayTYwBH/QaxKWRHkNYIaVhRMSeeF+NiuX
         NZaeD2xYqtyzFZNhWxR5JXwTthLqW1UzoJv6QKZ8UdDMMwMDoPQlEP8FWJb5rmXEAo7F
         ERYgrh8GLQ8CfQIutoSuadP4Ighvq754p/ptJ4cKLiio8dkAh6YDdpbUmBNx0/ae/+S9
         Wq/ecdhrDAFJZXi+uUVOFuwuhjPb6k5IbFPdPKW8+LZzD8sSfY2QDIYdEcul8dBziB0U
         P8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571484; x=1782176284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiyIJgSEwfIFbV0JUiz7Djf4fEFq9snfYC04/f9wwkA=;
        b=XY0ympjCGCM9A4U8zwRlzp+k83RIRLKRO9zk52Y8+kZGWgERRlxSRh3MR15Mkp6hpO
         6nzzZciYfuPiDn21Gty+1BS93rDeEPyLlDaszTiZZAKDsNjuMANfXJ7KptoiQtxc7ehn
         US/xM1XxVajCiImZw4RNKaz3ZUmUa1g9RM45V7TiaCO39eX9JvBiIujzHZQMnbVK6RU8
         oeVA3bTaG7yafVudoQJ4UiNqueRzM6/PZLah34TWsVPGshxW2PspR4prEJAsSxv/rwwQ
         6x8HlR6e+cttWxTkixz2sru8rP7z6ZlNRQsdH84cQXT6th5uzyWcvdLN9YAhnqx4xgvF
         fENQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cAFSV8dvX9ob0E3MpHKCyQV42j6ZbAGnoAIhyTiRiFHODl2gnI632T2pgnYRkD33MGrPa4r9Pu3vqkrVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWMR2pcMUUZ6262zonClWrrQjlLgxrXQIMxjnj04jUzAi4zFZ
	DSEs5AXwKshFNDxlPHD7A5aDiC6w3AI1AUddg1C4Gj2rcDP4imZu1Vj3h+5jzvJ1W2GchLzbWJy
	ynzngqgLwbygV28HuKMy/At8GD3ZBG2DpIpRn27TGDgeCycpeBMSNowxyhljW892o+piL
X-Gm-Gg: Acq92OF3gKhdL5ExmAAaN67Vfrzx2GDgcSbc+UjeCi9RNaSUfUhvbuzjw8ZhymdKbmz
	Lh7Q5pjFGhpu82eK1hzqj9wmjhGXe51HIebZkeZ/hOs/6D9ObYaSBrF3jC8mwzC70qOGBUEqZfn
	UBVS5Qncp7dFFlR5FAIK8j3J6MIXZwxE83ICvYJ79qKcBqj0kioaLRBhEw1zgYyvXQBez49auH4
	7iy6lrbbYEPzi0xeg3kXtcxcg73GQ2yDIZQIPyBanEKqPXBlfEJOVbZo2eeLlsoqerhh5h0bx1z
	czVlfnZ5JjkgnvG+TPcvG5IW7sR5ghKZ1xzQbgWLZMw0AY4uo8VeBFFg+5X85r5f2wX4fUj4CKN
	yhuL5YTqn/XPnjZsRezfvYIkuw6UQAXMANcn2A9Yt/+49Nu+m0KQQpMlw9VxLx3SiaiM9ihKI9/
	4F3S+e0jrR9B1DuUHwDSNap2l9vuk5V1yp4Co=
X-Received: by 2002:a05:620a:3185:b0:915:cb5c:7f70 with SMTP id af79cd13be357-917f0a8a62emr1951642585a.29.1781571484374;
        Mon, 15 Jun 2026 17:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:cb5c:7f70 with SMTP id af79cd13be357-917f0a8a62emr1951638485a.29.1781571483893;
        Mon, 15 Jun 2026 17:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fc0sm3153341e87.51.2026.06.15.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:58:01 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Message-ID: <ipemz4xvo5yr4wmrkdepsglxtwa6cgbwayjgoxu5br44yix6w4@jxpc7hz6ugtn>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
X-Proofpoint-ORIG-GUID: OBEG9rOQds4TRs7WljbJlrEMIrnYMDMS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX/6bXs/v96TqL
 Xevs5+2rVtMbdBJ4InCkjLvVoBjOFovmGsMcrKh7PQnxbb6zp5goD5jg1o/dUCYm0kxBSxit6dh
 zVfq60/vq6+YJrl8BOqtPexkePkG39w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXyDGszLLeEMMM
 LgIrkILUw/KryyUXckH5u0dTJwovD+xCZryRewuwol1lc97x2yiTc1128/tFiC/T9W3JevZg1+t
 KPb9TfgVZOYAfzzti/73KWkY+nT7AW02/vZD7V4txBGGfaXmjAGK8ENT0WzNqgMPSlGy1jeFYWB
 0auHeaMHJVcqujHy/Ghsi8XQIusSiS7OTGaAaUY/cCaA2roLdA9i8mlP0sPmeoQCYQINBeYMz52
 9YeCGCgqyAiu+UpuNWH5e6Tmgbc4scCfcdr+SkZnB5tchzqPG21MnyAJE1ewFUY+szsvB9C/iUA
 KZLUtHZvFGEqL6D6sH2Fl97vNWHRo6RHf1nGgL2R6KyWZEmOBnw1Cr91xkCgN5wi676JGTCf7YR
 qeyPr9NMG4km+zPZiONFozNjJDrIHTWs1ovJbntSW1ktbD32RAxwfgoVxQkQBUS19N16hF/6vHi
 6PTszikhNQ0862ZCkbg==
X-Proofpoint-GUID: OBEG9rOQds4TRs7WljbJlrEMIrnYMDMS
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a309f9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=t9ty7G3lAAAA:8 a=q59RblQhM_AjlM9mRcoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113313-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:stephan.gerhold@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,quora.org:email,jxpc7hz6ugtn:mid,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C96C768B229

On Sun, Jun 14, 2026 at 10:51:11PM +0800, Daniel J Blueman wrote:
> In addition to the firmware-loaded codec carveout, some Iris platforms
> need to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from IOVA ranges that earlier
> firmware stages have already mapped through the SMMU.
> 
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.

With no driver changes?

> 
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v2:
> - drop redundant maxItems, keeping the items descriptions (Rob)
> - add Fixes tag and Cc stable for the backport dependency
> v1: https://lore.kernel.org/lkml/20260601041336.9497-1-daniel@quora.org/
> 
>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b5..5abcaee4101c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -80,7 +80,10 @@ properties:
>    dma-coherent: true
>  
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region
>  
>    operating-points-v2: true
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

