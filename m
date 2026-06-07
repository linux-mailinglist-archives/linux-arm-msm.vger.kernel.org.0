Return-Path: <linux-arm-msm+bounces-111628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VYrhIADoJWrXNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:52:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5B651C12
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:51:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iFYQQzJ0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gFZjKPLG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111628-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111628-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC4CE3001A4C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B8932BF44;
	Sun,  7 Jun 2026 21:51:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44BD32B13F
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:51:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869116; cv=none; b=IRmmAukhgXqr1z/reRojArnAzlGLgiHhOuvQ7wzvEvNuN4FCJNaHBHWJ2MozZWMUyut3SNds+dvezISl6NcqK/HxnUrKHUVS914IrIhCEt8t6yE2+nLu2Z7z4Kv+7zA/FZgTNK8Sho0wzagVw9tjybqqp3Xpsg8qwt02k+BUnEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869116; c=relaxed/simple;
	bh=PJIHbeqTJsIe0PZwZEkydMC+Kjr73lehc/ylb/OIGBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWta3OKbcs0UmgnIt/pPCCLON4YH5bAARgnv5gN3CKPsRPZ7+5QiTNHMhTRoCM5BgOX6aU7a/prsKYcc72DGB6DrwFgyIc3ZOxCwMbQoTCUpR2zHRixhXstsRvN8dlkBufS9DyPbuZgqWNtd213eaJVdp1pD6OivHg6ldXSFklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFYQQzJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFZjKPLG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El1Mu866187
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rKDkQFtFQoRGgaiav3QWTOql
	+e2ZOVLUtvHFYymj/iY=; b=iFYQQzJ0q1l5Z3ghS2HW47KRQtbTEC3jmw/v2qB8
	YMcNMTP3ZPDsMAUQ1Zob4kt325WqrlRpiKEPgWtRM3YS73XSGj+TYTL6W/Mwi7EE
	VoeU2iO7mWYHtZjMkHCxCTUUHTt9GHAGASFnutanY2TRqNe45Zfwmupy+TMFDv4s
	EU4dOiI2+pmu8iR8hRlOs/pi+rWidkxF6kG5VoFe9qXHPAd1fI/K5KN/6hpV4ydx
	eNW416mGNWEUKN2xU0qzqFD/+Vj9ApabEJKk3pNwkM0f4Fz7JZcTVSqv9UsWIHPs
	MGWGbr70AYCFefBRXIIYR1bD7ccuNiiz4hKXJWUbTk9Apw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4x3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:51:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175bf22b1bso53509121cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869112; x=1781473912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKDkQFtFQoRGgaiav3QWTOql+e2ZOVLUtvHFYymj/iY=;
        b=gFZjKPLGgdkGqDBoJMxA/SM1y4KOiVlnR2oVp7mheGqBOye7mUfeh7zsqqCRBNtbTg
         wyy9jBGVAIGVqeQpv2iEsw1bRV6AVbyspVorSIaCYnUR9sHi+UbzYn+SglILFMviYWz9
         6V7q5JXEOwh0RWHAtSiTHOoKYjRYgeOVJr8XOG3TJv+ZH6Sc2VYXP5y/Q1mABOkk/Px/
         KGXbLvy9omthgZaCSlrIK4ce6gA7Kji2P8Sdh/Li28gVpq+MO7+czJJNJBvrLvs2VVa5
         64tx8dTE4qzdfWgSnKY2/6c9/+xBTmKRK3591ecxuUz23INB1ZNdws0nuDgPYfHjrZwc
         ub9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869112; x=1781473912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKDkQFtFQoRGgaiav3QWTOql+e2ZOVLUtvHFYymj/iY=;
        b=OP9+eVjiUKM5CM4JHAXNJ42Ev4/SngRlDGWmWo7LSFxM5LnrEXKUNlVG9guJ4mwFjn
         RLAeYl80lLjyWUdwwIiBNRnCEhmjI3wBg+sPuo2IB6TRWs5Gh2lfYg0oY5lhpQ3+AqiS
         SOSL4NXu3pceqdUGDzjxkTrLID012QJVNkmsk3PSdbgU92SdfaRuyyY77OUrr7jDBPm6
         sxPT4ezcxqKi2rDZDYG7KhOOypiJblv9Y0E7v225Jiq2udIGKdaZId0BLKysgT/cbWRN
         oCm6m6Vhkd9E4Xw2XslJXxlpiiB4AfBK/8j+TyE5yrkMHVBU8YNNHyLepOfj6NX266vs
         1KHw==
X-Forwarded-Encrypted: i=1; AFNElJ/xwh4TI7SY2gupAvztiTF2RBQB1pl8Nnj3QDS0WSNXHFZpNLeCJj5wT8YNIgnb+P9N1fwnAgFOBiR8SaQu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7YXSVYHzfMmAFoAIgEOpD/qfbUgtqdhPyxbKvsbNCtgm398e
	QQHzi0epDw8oyMWHJvJczpopbfPy+bPhXr/kJpSia76AzvUWWqdwuH076q8zye31tl2VmyBPrGP
	fi6ZkzqalMhCajItwmyj6CGmX8389sYasz+VN3y3bZ2Q2sHoCHD57K68Ppn2Lj/NwqO43
X-Gm-Gg: Acq92OFrPb/ZYKa82buTy7EHXWtRNck9AyqR5dsNljrnwnxlqB9D/sAit+JVLTYxlfe
	ckqo70hRl+apIFyykRh4y0sHUtu1B1SJxaq1KdroZ5V/tHOodfmAgqrdqyOTTlGUpJArB3LTIc1
	E115Ax74oiBcWkWY0yEnrnxelYeRkgus6qsaz683NKYpcIkm193XVmCtJzND559qETvj/Xby07S
	ycVC20iE2F/W0GQhzJ6/+HwWdTor/3I7x6qpBUPAfy+5/C9yL13aWubrgnW6KStbMRb20TKx+wW
	ydU8MiJKsYK9FuzqDWuCGAXqjNO6vkSWlws9CmkVeFog7a6KZnkOUfH2moTvbTX1yWtJGz9l0Ia
	FiMqFUfijIJu23W69Vq9jfQnel8otFt/UzCCLa5ebdB805rIfzSszlNLrz/ZsrqNBYvgaPlQIQ7
	nXIw9oNtOMSj08RZ6Q73Ugdaeia8AFIiYjTbZfobNvjeohvQ==
X-Received: by 2002:a05:622a:251b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51795afe590mr192005131cf.35.1780869112115;
        Sun, 07 Jun 2026 14:51:52 -0700 (PDT)
X-Received: by 2002:a05:622a:251b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51795afe590mr192004861cf.35.1780869111756;
        Sun, 07 Jun 2026 14:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d6282sm41201931fa.30.2026.06.07.14.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:51:49 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:51:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <mjmfhowcfc4vc4h4fbpf2psblnhgbwwt5qmmfb2fnkfaunexyl@c5rwjftmnlx4>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9_ApaDQiuwZX2u7gbQzp3gumgXCe1rH1
X-Proofpoint-GUID: 9_ApaDQiuwZX2u7gbQzp3gumgXCe1rH1
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25e7f8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MCItce8SuK6p_Dj8i7MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX4DDaYY25xWis
 bCWAfYoaSC/IB2WAVA2Jag2ay0y2HXFgyy6G1iVRJvUzitSP6X/LN818yEFg0c6x6Xcv4aI1yuq
 1ajAkP1EmYJM+r7vPAbXrUREAXIxiqVni/OYtKtE7uwe2TcFpZc2Z5TNn4H2m3UxDRC0l7fZrJq
 f0UExUSo75oEbNFAWj/41PnJhKfJD7//J/UhR79Fz6BhJYAtbmT4YJY0eTETmDMK+FXClzaruEV
 XZpcjmi4RXQSRwb5TvaDOuM8d47iI0bqZzLoVxxs/gJ/CwrvkglTH45NFMyPgsBVRDyevVpyo/G
 Ejcm9FK7aPVBh+cv5Pusmc15vZdGPS52DxhHznTduAJUR+rZGF/6SaeuK4ysLNzom57e+i5SIzJ
 EgG5zSn20/M5XSOrrXD+cviyhUigeCLNMzB3LVpO7RGuYrZ7n6P9TmEaQOaNCa9g63KEtnB6RMc
 sMxbperFp9lRLLi3ogg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81F5B651C12

On Wed, Jun 03, 2026 at 07:48:50PM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

