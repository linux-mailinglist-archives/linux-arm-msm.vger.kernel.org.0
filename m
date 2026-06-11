Return-Path: <linux-arm-msm+bounces-112826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I+NgHwlCK2oR5QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:17:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DED675CBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SrbWffD6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bJvbh4z9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4EF13289BA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 23:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEAD377EDA;
	Thu, 11 Jun 2026 23:16:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57F538B14B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219815; cv=none; b=I4abzEVkpin7V0Kqz6YkC+xmaYVEM+zWDg6l/h9T2ivcZoNS7UnlTBMwyOBvi+5/ZCuqRrYt8dg6LMZWQSY1HzrXZzcztmnompORPY7SqiwCEkTRyXDYFv2qfnAfbx3jbxunjGXUwiZ+Bp1uhGsx7O3thxqpxp55kekemApp554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219815; c=relaxed/simple;
	bh=P8JpD7l/V9dvoH6kAgeapktGWvVCy6U0HHGolaseEd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efHb97BKlX+dQhQomiNR9RuxR2T3TRNGsuc2YrgC/rrhhQ3u0Hyq5k/PlZUkKyU6BjjQYr/G4Amqa/wVG4o72YNHfFG668eNQU0gqhrzA153rtkoinYQOVR4MTZ2qG+htbyIKZ7/6x2sGIE1vQXA/5xUIq5h5g86E4M3lrKpqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrbWffD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJvbh4z9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMT9cZ1825303
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ChdffMZ8Z7dmt1yvyVudKKwh
	HXnbOd1KVRltY/AFG6Y=; b=SrbWffD6kKfvJC7xGem34vqYMnXA4ekztGaqu1bR
	/IP1SkTZ5wmZA6L+dL2qx0zMEwUyDsqtDJIJLoyDysz2V33aoZHAUGSqssQSn2MB
	OAOObJLfaOkUtnUtyaAB5bwqRiofUEJAjO/aJLLGDxA14PzMzGQCjTg3Jtp+sn3f
	eGYlO3pY1Tztm/YJ651anSByBlf61vloWaswjM/f1BK+USuPwRZHk6fyvkF5r0a3
	AOBqE5Fhy+VjprRQ4Fwj4er+bKW7Sj+ZjvnuNuKPlib5ubVPN8IHp337a9QBiBRI
	/nTLV4zT+3MdkN4kSe3eC4uG0RsYq+aj24V141pc2xVMmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1659cwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:16:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175aa1a54bso6229521cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781219809; x=1781824609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ChdffMZ8Z7dmt1yvyVudKKwhHXnbOd1KVRltY/AFG6Y=;
        b=bJvbh4z9bsSb7J0wR27wlNe+uZ6X6NR8XUCFcWApBBNAJZaNAfT4po2HCXNk0YrvqR
         vPMIvyJSQy7K/id12F6wjwxA3RnK4rwnWaXriMhRWXt+EBSc29ropdPH75xjv2L298XG
         v9iutJJtvj3cBIIsIe2rLHK0CjSlmrU16x2yJjSm9/OR6pyb61bg4GUy8z5n5XsmsuET
         iGP8K19L36nLmPod/uF1u6mkMY83irIIwgdAx5BFp8+uq7pycsEWFM6Yim1xgHGjTZIk
         qJAw58TtWyIC4Yq06FZ5/gZgikoWBRq7yXyEPs7A4Sh9NaCWsKLGZMxFo4O9K2A+zz2M
         4okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219809; x=1781824609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChdffMZ8Z7dmt1yvyVudKKwhHXnbOd1KVRltY/AFG6Y=;
        b=CwajTzeJ+iB6qlwyWon06KMIMi5l6fgvWq9OSnvcTDHFcfoK13vxyr6GzqsI4gTRtf
         6C1Inyw1i9fIHB4AlakJAJu0lmWH92A+52DzKxDm312ifVY2clNatpHsH7/9nIbquX6y
         dK5a9YOLcB/2t3Wv2Ub0bDTOuQsdKAxudzn9qfk0YSbrEIrfw7w2iu7/dxbdryHEMy4Q
         Yua6fWMVGcWYBrBFjshrotLpz+v6s5IyBCVBH4vS7YYFGQNSQ45E8BEyg0vcHh4DL/ST
         J6VJZ7cQbvMDnIAXMhCDp+3rxX435wZdOEYbWs7gjZZ1v/DKC0VZTJs0C4ac9A742rBV
         admw==
X-Forwarded-Encrypted: i=1; AFNElJ+5Vt7TtrTZmsd+xcqvsDs8TXoDMKPE8LmtAGGt3AGqzzjEvsvcy1Ut6zv8ys/WjSekUBiI8eavDHU/FZOC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8EaYYuV0pagHNquZCy4+p5Eb4Zb4rXFkNaqSTvKUbgwnsHLt1
	1KpHNvPJx69YAUBM0gD1CXTgI0rjLAwRlYM291buqfVQcDicmhZdREsGkNkf5gkWTyEBl9vAaxW
	7zsxEFTz1rccp9SIvULBmfE6RYQHSTF6CW19bH2uaHx4v83PY0ObGwxkbW2eACn7T+HsMJqWdmH
	yJ
X-Gm-Gg: Acq92OETZKXop2lVtQ07RPbac+Bqw8KwsLA5B07N7SlEN/Xqy1/2QJZAB+ymUWSSUGs
	46kJtfftT1akQCxACn4t57Sol0RQo7vQpXc8ShmnzhvMDoHZscFA1gct8ZEy9CFnwnnMGD5j0Pb
	FvjmDxKNSShVg3aN78D+BROCthM9JcqFUUHuaRMhOSuA7swi/1zI11eJ5J3Fi6EBRM5NgoEjiCY
	JjyhXO7pdeaGHBE9pTYaJsASGCyIIWzNjzUKbIXX2+uu3xIcKh6Ozt5RgemyA9olKoH56FtmFP6
	ENZID7EyFrTDi+H76H8ys90waD+psxCEZ8GSj6npdxcwQ5+7D9CAvDrQ6dYTEg4nlEccB578kfW
	BK37Kfn9ss25BBeshPgwDg15vxZKZ/W0vyRHNZ9cvucpDhTcGcxEtC9OmAALhDZmefp9UXH4zge
	D8cEbrcwt4Vk+vHBLRabJBhnvBbh85K0udjLE=
X-Received: by 2002:a05:622a:1aa3:b0:517:a023:39a9 with SMTP id d75a77b69052e-517fe5cc7cbmr3573771cf.28.1781219808695;
        Thu, 11 Jun 2026 16:16:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa3:b0:517:a023:39a9 with SMTP id d75a77b69052e-517fe5cc7cbmr3573411cf.28.1781219808273;
        Thu, 11 Jun 2026 16:16:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a134sm13744e87.27.2026.06.11.16.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:16:45 -0700 (PDT)
Date: Fri, 12 Jun 2026 02:16:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
Message-ID: <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMyBTYWx0ZWRfX6xjXzcNe+S2Q
 pXeU0492gLAS22N/kgECm5UaCWq8M3M2lHNnaZDMbRRJu+8ZnAp4aFpg1Uta2C4NzRubSQYxxY+
 X0oFST84pbTPIFyopqrGUGXEQMjw3vn7AtlNbntj82sHa7ijcW2HqX6BLRBoWVeTOFdrNvpRsNI
 sblT2RpruIGb/oIKIecCXsK4TdajcCbL1WF5b4ga14m48eH/4707WS+S87Xc+dHQ4ZfOjx99IRb
 PvMHKTCOBdZMUjCnqeR47RLdT0Yh2A9+mFY+t0ng3yfNb/nScOkL6t9waBG+qfqgpkm84tvnpe2
 yVKfm72mzTO7EIgb3Y+dsjuek8Zh6bNQbXuSmlhtlOpmCSYmXfW9ED5OYPHy98x2sx3jevDqWeg
 B6T3BSV365mJMLccisK6B4q7uLmCNcGs9VnViahdb4t1CRtIs6oWveksNwf/ZMc8Ipmb3M09Soi
 5CV3vWKYLZNtpOEHMDA==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b41e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=deNja2eX8ZM74omoRk4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9M2YVLKZHlPilOGSUas5ZrYlJRu94Bs0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMyBTYWx0ZWRfXwawOsKgJbg0o
 ENNy92lgrrmxz0O9Zu4QqSxijnJ4r/ZJtcDt+0pD0Y/sla9VLsTn/d6NaXuGVaOVNPoEClkI1rU
 WZjgZ3sXtOgR3xxG4Mtzuo51dRnO0Gw=
X-Proofpoint-GUID: 9M2YVLKZHlPilOGSUas5ZrYlJRu94Bs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110233
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112826-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mn453je73fm6:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 13DED675CBB

On Thu, Jun 11, 2026 at 04:59:46PM +0530, Ajay Kumar Nandam wrote:
> Add machine-driver support for Qualcomm Shikra EVK variants by matching
> dedicated compatible strings and applying board-specific audio behavior.
> 
> Shikra platforms are available as CQM, CQS, and IQS variants with
> different audio components and processing architectures:
> 
> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>   PM4125 + Rouleur codec components.
> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>   on CPU only and no DSP is involved.
> - CQS uses modem-DSP based audio processing.
> - IQS uses a third-party MAX98091 codec with modem-DSP support.
> 
> Introduce variant-specific handling so codec controls, DAPM widgets, and
> clock programming match the board design and avoid invalid clock setup on
> variants where it is not applicable.

To me it looks like several independent changes being squashed into one
commit.

> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/common.c   |  2 ++
>  sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>  sound/soc/qcom/sdw.c      |  3 ++
>  3 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index f42c98ded..32d6c09b2 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -3,6 +3,7 @@
>  // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>  
>  #include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,qaif.h>
>  #include <linux/module.h>
>  #include <sound/jack.h>
>  #include <linux/input-event-codes.h>
> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  	}
>  
>  	switch (cpu_dai->id) {
> +	case QAIF_CDC_DMA_RX0:
>  	case TX_CODEC_DMA_TX_0:
>  	case TX_CODEC_DMA_TX_1:
>  	case TX_CODEC_DMA_TX_2:
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e5d23e244..4c985f81c 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>  	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>  };
>  
> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +};

No speakers?

> +
> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +};
> +
> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +};

No controls for CQM/CQS variants? Why? Or rather why do we need
kcontrols for IQS?

> +
>  struct snd_soc_common {
>  	const char *driver_name;
>  	const struct snd_soc_dapm_widget *dapm_widgets;
> @@ -49,6 +68,7 @@ struct snd_soc_common {
>  	bool codec_sysclk_set;
>  	bool mi2s_mclk_enable;
>  	bool mi2s_bclk_enable;
> +	bool dsp_bypass;
>  };
>  
>  struct sc8280xp_snd_data {
> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	int mclk_freq = sc8280xp_get_mclk_freq(params);
>  	int bclk_freq = sc8280xp_get_bclk_freq(params);
>  
> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
> +	if (data->snd_soc_common_priv->dsp_bypass)
> +		return 0;
> +

How are e.g. MI2S signals configured / routed?

>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  					       SND_SOC_CLOCK_IN);
>  
>  		if (data->snd_soc_common_priv->codec_sysclk_set)
> -			snd_soc_dai_set_sysclk(cpu_dai,
> +			snd_soc_dai_set_sysclk(codec_dai,
>  					       0, mclk_freq,
>  					       SND_SOC_CLOCK_IN);
>  		break;
> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>  	int i;
>  
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> +		if (link->no_pcm == 1 || link->num_codecs > 0) {
>  			link->init = sc8280xp_snd_init;
>  			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>  			link->ops = &sc8280xp_be_ops;
> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>  	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>  };
>  
> +static const struct snd_soc_common shikra_cqm_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_cqm_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
> +	.dsp_bypass = true,
> +};
> +
> +static const struct snd_soc_common shikra_cqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_cqm_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
> +	.mi2s_bclk_enable = true,
> +	.codec_sysclk_set = true,
> +};
> +
> +static const struct snd_soc_common shikra_iqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls = shikra_iqs_controls,
> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,
> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +};
> +
>  static struct snd_soc_common sm8450_priv_data = {
>  	.driver_name = "sm8450",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>  	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>  	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>  	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>  	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>  	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 6576b47a4..0be743cec 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -4,6 +4,7 @@
>  
>  #include <dt-bindings/sound/qcom,lpass.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,qaif.h>
>  #include <linux/module.h>
>  #include <sound/soc.h>
>  #include "sdw.h"
> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>  	switch (id) {
>  	case LPASS_CDC_DMA_TX3:
>  	case LPASS_CDC_DMA_RX0:
> +	case QAIF_CDC_DMA_VA_TX0:
> +	case QAIF_CDC_DMA_RX0:
>  		return true;
>  	default:
>  		break;
> -- 
> 2.34.1

-- 
With best wishes
Dmitry

