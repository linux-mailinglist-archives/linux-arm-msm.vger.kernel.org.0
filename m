Return-Path: <linux-arm-msm+bounces-66274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F26B0F129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 639587A86A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8072E3386;
	Wed, 23 Jul 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk+5+Yf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2E92C1581
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270073; cv=none; b=Pq7xEgUsrNhXzN8KvtP0PbvfnQS70ISRKaNPb+fbD2ny+2fFtf/SHY40ib0pPvmTH5RMj8C4ho56i9RW1e/T1o0ZIgumIF+hTlfgKAM+JuQjM/qRhW4Gs0x9h9lkc/yQWERLc+7l4BrbDJkflrNr/3PoTZcaWpdszrablXcUiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270073; c=relaxed/simple;
	bh=fIii8CPzLaxr+8Q5TdczIHeQub3SFOIbm0DUglnoY6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrxdKdX01mrjcFBkp6Lr0MHd7MCFIw+nT8dBS8SMGQf/7D82MPK7uvdmcsyEI5Cw336xEp92FubSIRbl+2Y7CRxnKIAmKYsT7QxQwk5wUCO3ogB0DrtsUAnx6nR7WCbnJe2YBsjOSunO+IqxIZabNJm7+bcyTi/x5nSjiPIIlLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk+5+Yf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N96Z83024768
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qeCD6Fkh/pxEJMi+BNUYGUh2
	1k7BC1qEIuPfYClcWP4=; b=Sk+5+Yf9/zu8AjawB2THbFdcbUeTOntlSJqFsGcY
	zcr5uUjBMo80gum1G35qgwKVAEUtR6CeiTxwMvvxjg5FPXmoxATLNbN1roDm8bLR
	08XOFT3Ez9QlzcZ9TBXkIz3wMQuJ9LCXOP/xdrfj157ULaABdEJIx+yNDf3KGhWG
	BNgeVFknqc7sX7TkeOwhkOTR/XNS+UptLu9/eEnJh0fd/Z4E3ys5HiZ3I5szQOjt
	yevdWsEjzIbAikVIIRrpLBxI8HJ55Vl3K+3ymwkVqoQI6/M1Y9DhKj/1dzD2Z51F
	YC7jQtbKjlxazl3yP6+dt8jziOBoUb5vl2ELaLTlVO9VFw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dmsm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:27:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab979413fso125238986d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270070; x=1753874870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeCD6Fkh/pxEJMi+BNUYGUh21k7BC1qEIuPfYClcWP4=;
        b=ks6768IS4WX4ldrouluOfNyfZyC8bF/HxjAas1up5S/p5k+uGFXyLttEZpVQsUCByn
         R94YcpbfnZUBBgTNmSqSfU+0pNYWgVivskz8HWpd3IKliQfjTA4xj2ajSg1IYS8WefgL
         MizvBRjSLhf38XvEocS3myt+tNVhdggfFyWj84iepUV9dbqfTzUnjagDSes7Olxp7cLe
         bQHldDkrdkL5SITXw6VPSRE1MTm74MEmQ2qIwMI5MUuXdDdho0ggNq3gmSw+lfMae2ot
         gXHvrm+c8VgqZy+N2dF0TxqMOMfJSBKZYHRWxgsiK8Uj3tWInZ5wu1UcRK+ezKA9surD
         YfDw==
X-Forwarded-Encrypted: i=1; AJvYcCVOITstKIOorlAzKE40VrUIlmbQfEvxg5k7llD9LGiPlw2HuJz/H66DdH+e9Aapj/ALPMcIdr9xNiamXvRN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqqhd0ExmGXrT+Ey0PmKOJOxRGUKZUKkU/BKTuE9RGNOlC/oJw
	47f+xJNvyHPokErMgdIV1nHbD69AQ9Qj4WQohU14nH2E9DKd//hTW+tlbWQB9HX/c/DZD/Iybmg
	y1R+itSodSkyDZQgbJG0LrMSq5jKxBJUZl7bg/Q+WR2uV6nairAMlJHENaBskahPDQ+A6
X-Gm-Gg: ASbGnctoFbooiQPuujYe6OztcdV/NGT86Ysn41hlYGXNV0KpqbhMyLPcLus5uN3EBcX
	ZNEeFGXieaIt6/Fgq6G3YGe0cIue7hfimKL/UB+erm09ygS9jCv1NKugoPib/NWy7Zn7N4qTsFE
	geSNYa78hu1dDPAipndNOf6Ld15aELofmZKPGsHmlUrZq3RPVpCpAFRJRsiX80s2sGilRbKPciO
	wDeH4It1zLo6o5c0WeoHjw/PgMPNIHXOhiPND5d+W9nNOVq+du0+5no4wKt59yzqKufUeGoDAdt
	NxM9Jg0VzAwc039ukvPnPCrgvG99H+9srHAU/DL05yS4dnFOCFFMJq8twKzG4pP7KUANeaHEQ2R
	En27NPiDgfFEsHAwbAaQRI5vGlVgI32hoIHzLOrQEWaLg1wd61rlP
X-Received: by 2002:a05:6214:d88:b0:6fd:8fc:e2fa with SMTP id 6a1803df08f44-7070081a06bmr31455996d6.32.1753270069193;
        Wed, 23 Jul 2025 04:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBXp+ymaI+ImLJaZLkIyrsa+QANloK+ouHSdgzPt73MW0q7/7Z+0I4TmrLTAxziK4A4WlcRw==
X-Received: by 2002:a05:6214:d88:b0:6fd:8fc:e2fa with SMTP id 6a1803df08f44-7070081a06bmr31455526d6.32.1753270068654;
        Wed, 23 Jul 2025 04:27:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9b1bdsm2282861e87.19.2025.07.23.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:27:47 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:27:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: Re: [PATCH v2] pinctrl: qcom: Fix logic error when TLMM reg-names
 property is missing
Message-ID: <nqujsfdojllp74ykhskftdgj6kcvje726av2bgu5xqymiwvzl3@mw2cqji4qzqc>
References: <20250723075024.4604-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723075024.4604-1-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880c736 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QEazjGFzAr2dnAQsEO0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: vnOMYgnmv2Zfvi9fQVBwSPP3zBzxbrFz
X-Proofpoint-ORIG-GUID: vnOMYgnmv2Zfvi9fQVBwSPP3zBzxbrFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NyBTYWx0ZWRfX2FZvsiduZ55w
 JahuTJ1l/CYRRIT/9xIpPvdsg6atb+oq62s81G/VlB/Wb7hoDox9RQG0FP+JvOdQRZUfEqtyDsu
 VHAkytgInERGJ/7alS0WsW1LPz3ueI+JCTz16YEGhuAXDCuxdOyBWUPNyjBorZ6nHRVRXwXUc1k
 /fwu5yqt2n+Yk3G5ghH8nx+GWMmM1gbVgfb7tnksxJ38GFNQUcVblvE4CSjbtVMfEMSqTgn7fLv
 5g36Wx2XCfhjmXiO2umK9ExkANuseDOC95EbFqzzMpIOSC0oUY1tgAlAWdOrwUQ3diV81wMHFzX
 HKU+QHPJYO5mdqHMJFNJIa87/FGinR0mnUUxlCPNW17UsNyZi+QaupZwfMCTulWq0lHfABTO4HC
 zHA+lSAicCW/WW9bCzKvrPA1s19+prlsrhc/xpH3ZbwXTLY4NtrwplbXDgVFOvHQj+/zA3o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230097

On Wed, Jul 23, 2025 at 03:50:24PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
> region without the reg-names property. This is a valid and expected
> configuration. However, the current code incorrectly treats the absence
> of reg-names as an error, resulting in unintended behavior.
> 
> Refactor the logic to handle both cases correctly:
> If only the gpio parameter is provided, default to TLMM region 0.
> If both gpio and name are provided, compare the reg-names entries in the
> TLMM node with the given name to select the appropriate region.
> 
> Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> ---
> - optimize commit message
> - optimize code structure and fix kfree issue
> - rebase on tag: next-20250723
> - Link to v1: https://lore.kernel.org/all/20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com/
> 
> ---
>  drivers/pinctrl/qcom/tlmm-test.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
> index 7d7fff538755..e41fe7e76c80 100644
> --- a/drivers/pinctrl/qcom/tlmm-test.c
> +++ b/drivers/pinctrl/qcom/tlmm-test.c
> @@ -581,10 +581,13 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
>  	int ret;
>  	int i;
>  
> +	if (!strcmp(tlmm_reg_name, "default_region"))
> +		return of_address_to_resource(tlmm, 0, res);
> +
>  	count = of_property_count_strings(tlmm, "reg-names");
>  	if (count <= 0) {
>  		pr_err("failed to find tlmm reg name\n");
> -		return count;
> +		return -EINVAL;

Why? It's better to propagate the error instead of reinventing it.

>  	}
>  
>  	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
> @@ -597,19 +600,16 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
>  		return -EINVAL;
>  	}
>  
> -	if (!strcmp(tlmm_reg_name, "default_region")) {
> -		ret = of_address_to_resource(tlmm, 0, res);
> -	} else {
> -		for (i = 0; i < count; i++) {
> -			if (!strcmp(reg_names[i], tlmm_reg_name)) {
> -				ret = of_address_to_resource(tlmm, i, res);
> -				break;
> -			}
> +	for (i = 0; i < count; i++) {
> +		if (!strcmp(reg_names[i], tlmm_reg_name)) {
> +			ret = of_address_to_resource(tlmm, i, res);
> +			break;
>  		}
> -		if (i == count)
> -			ret = -EINVAL;
>  	}
>  
> +	if (i == count)
> +		ret = -EINVAL;
> +
>  	kfree(reg_names);
>  
>  	return ret;
> 
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

