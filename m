Return-Path: <linux-arm-msm+bounces-73463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9934B56D65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 016287A367F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE811A8F6D;
	Mon, 15 Sep 2025 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQNPID3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082117A303
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896331; cv=none; b=cT2OBmk5eLFhhKANdC7OBSL1+N1JSowJawpDxplevwfC8Pt+HeCw4fLjChIfPfeEK3CnLN4c/P4zgVVTXbhFpRzyLElZo1MjA1INnRZPEXCRroPD+yqBzm+cb3n4u5CPSKCIwDbFFvgfvOkZKBD6FBCf71TXxI2ZP92FwfU4Hlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896331; c=relaxed/simple;
	bh=fVwiNBmoQdzu12TPo+tBaLZwp7T2wl/KVuYlPKdvW28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGPtxIdz3dJwzKqMIsC2Aw7dvGvFXIivcqQR5YUaieLFVoyz20MWxZ50ahZzLhg2dS+laCsnXnvqZtUifSDdeAOqrI42ImAkOtlguqRwVKPwcEwi3Sr78T+E3hrhwmMCPS0Nt3JfRUjE/4Sx0f+arlvdUYkWm4peoPlPz7oIznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQNPID3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENTUDW009944
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X6INT4dFh36gD5CkZ/5tXn9K
	DSDRdeyRZoyjm8V/Qek=; b=EQNPID3Yu0SAMp/ZbVlqVnzQMfFgsPdHp3Rmpj93
	Vp/lCC9qXrYgY/dqjngrtqeTqw6U/7Vf81wIYI+Fbk/2DV5CdBdQyNS59lyf/i/2
	CzruxkRUUZIpQ3wLkKKvnlxvDh/ip+TGaVYvIxry0Kye0ipJbrP7A4XeAlZd4+Ql
	0cOLzHfIpDIvXrE6H8/FS+Pjrp1m+yZpgkP/6ZZNGGLs4QtYHzTJSoSCNRUEEeL1
	VF+t+FPuZcuyAU57jM1aBs7SvlFWRN+bU0z1eHKYzy7p2SNqVTh+pmN7514K1/91
	s/tIfd/KcJhm5B9hW1aHzOKLKmoA2rRvBgPu7us54lwQOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chawuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:32:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-77d39d8f55aso12808316d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896328; x=1758501128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6INT4dFh36gD5CkZ/5tXn9KDSDRdeyRZoyjm8V/Qek=;
        b=OGYjleiNrmmt7dy+M5NOqgs3sWjX6f4eSn2BfYlXDEmr+CMdGC0ByVpVlii/kVsQvj
         68pDjmRTY/het5Sj+K1rCKMmKtZ89mmgiI8swfp4G+4JbXI7uZU+To2BCloqjyx1jrW4
         T4aeugINhSpjx2fFcDCzGqpImmIz0cAuFGu+7XJvDsF/uQtywhkqVa8taHfPxrb0YGgP
         1QHDR28dmWPTVRueb4ua9H3s7MNPTpdIEBkrlLORMWVgX0sGkpJjHECNQb40RfEl6N0s
         RjHE3JPmXxfDx9KScn9BY/unQc7Z5V9YTzF3Fpz8TFQede7zjMrR4nHVq2xxUV6DnoUJ
         ZGGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJDvak9gEIOb6r3U3LXSsinfVly3Fj5r7CY+THZFz83lfTEi/oYA3ji2vy12wvvMi9jZfAgVCYfmJccxtP@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNUPm0hgsTWYiWNKRsHQmTuSjMZ/2fcMIzu1xqeF3MC71URpU
	Vh9aNtHCmfeihc3wtKaM98QEgaZ43YKNTgWkB0MLi88hS5WjLc+QxSeNqSMM94dQkd2VAGaCqkB
	3sHkQwZSmr5nmS39+A6324cGJ1XgRZjO6A+PziZQ+OOoGVOosXsJOfATsKrNuXK/ZW1yu
X-Gm-Gg: ASbGncuTAamuNd7AaIKLaYycPOpKQH5rLlxKpE8FHkxyqacf4+LM4wxj0cRN4RMq3Ty
	A95aTziWbHcw4WZMRHs5K0jR3APOsmWuacGFqhPqZKORqJ2dNEcba77VaxVvpGJn3w4DxNE8O0I
	M15ZAVZbQZoPdhx6RDw81D71LfSf6QzBG8GaBmk+1UhG6cqOSM9XkvhCSW582WgnH/Xn1m8Yphe
	HpSVi/YB5YgCfvV6QR3XX1S2ZBd44n5RpfxRpTS4EWwJhkksndvaw4BcLjxG7hBuNuvGDQM1CoQ
	GBRYl7LTJoSchj9oPRta0Ijwtkj5SXRPG0uFu2o5lO6W/As1yntgXgozWxft/x4oZWwpPdlUnTl
	5PsAzlEnIDhVCq3lsU/JZK9kmzIqLHYxvX6zlU93pq+DKJkboX0/7
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr167236826d6.1.1757896327657;
        Sun, 14 Sep 2025 17:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1qZzfHrBrw83QUogwWdZ6sXq0A8mz8+e0aG3fK2moYD3Os+D+QtmmTb729sL9JHULQgtuww==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr167236656d6.1.1757896327191;
        Sun, 14 Sep 2025 17:32:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65564951sm3159160e87.130.2025.09.14.17.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:32:06 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:32:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm845-lg-common: Add wifi node
Message-ID: <rfp5oukqbnrzva6ewg4ehilpt4cm2xybmo2adtcbpqsliwfe5q@d5ayeglq7vz5>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-6-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-6-23b4b7790dce@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c75e89 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=H0H2Q2WVq0cUEFHX9e0A:9
 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: JQ8_Pxoptz5XVrMUs9at6kIQSeLtfHC9
X-Proofpoint-GUID: JQ8_Pxoptz5XVrMUs9at6kIQSeLtfHC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXz4mlavtXaoa0
 QzuDhqKakz1dHN6ASg6iu2CJbvg0+lp1hcnUK8zwxFFJSZRE5IF4SNOm3UITXgZuZMaTJfOi7+l
 Sfj1yWn4zRVSZyGBK6qIBQF3G03D92EbWzXSvjtXWhn5nNRziUVHwy2u1CRRPiLSzdG8Ms9VaEw
 nOwOqVGyzRYiv51r4r+afXeOeX4FAQlzX68YYoovhqRRRjQ6Y/2RjDmJQ9/5Sf95ArlRqKT0Hu0
 chHMuDkzAiBFN+0g2pJZT4DP4z8SShD7RkP0sWNolw2TeGSCRNtN/D3fLsD2QErCEqaX8FB3tXM
 Rs8RsuqiwA4XDwBEKWAtEMyLwHagXAXtQCR1RxmomJgvSEdfbC9DsbpfyepqVxatPuGNmveuKlb
 LDOjcSZ/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Sat, Sep 13, 2025 at 04:56:39PM -0700, Paul Sajna wrote:
> Wi-Fi now works with this patch and relevant firmware
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 1bf2f2b0e85de174959ec2467076a95f471a59d4..585582ff4e0bbe8c994328278d5e5dd3a280ddb6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -682,3 +682,16 @@ &uart9 {
>  
>  	status = "okay";
>  };
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> +
> +	qcom,snoc-host-cap-skip-quirk;
> +	qcom,ath10k-calibration-variant = "lg_judy";

Was it submitted for inclusion? Please follow the process described at
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

> +
> +	status = "okay";
> +};
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

