Return-Path: <linux-arm-msm+bounces-88260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE080D08B28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B10A3006706
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72062332EBA;
	Fri,  9 Jan 2026 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjnBgW18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaXUURkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AE7339848
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955775; cv=none; b=prOTAdktii6Hy3c6QZO/y4w7wvWGFSdthwcFbSQVe0XAuMaBBIUng0BHnnqmxcfAz2zHP68nZQUy/fJqg/LjfvpkXPrmzPAOMPLbRLhdmMHEreDKj1Q86wmLj4ldHMVDjpBNPv9nO7oFMayKqlEGib+LQJQY78xny/tnBS+dKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955775; c=relaxed/simple;
	bh=b3H6qKbIKCO0gP1++LTaVcskDS3sOVqVKZEw8Z9jCh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR0X+XJ7NewLPx5rtp3QJDtUF1UpqRJ9lMu+sS4JZ89CW+XDuf1KcZWaPo7UmbZO61q6H5a4/DT3O4gRL8CZYRi6mXHYIOe5OGrfY8/Un4EoO444BiXeGbx9n/9hH1OUPVIEN/g4Ff/ek+IxbpEN4JGwkEs8GX2mPNVfBbRJvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjnBgW18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaXUURkM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098M33u3727466
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF51mEvG4UeNNiUkScsa3C3kNkmiu6kc2Haqu7j3LQo=; b=bjnBgW18HM23IIIg
	7yplMCrIxwbp1qRc/Bd1WZ2lxgTTlWOAmjwnYMIDZDKeB1+ptlfmtrGrsICQKk8I
	F0Wf/uwFgqHhKpY9t+ZqgKLbVzNptZLd/mbLO6iJ1NhX52QrTLl3SeeReuwr/Dt1
	ugFsnRAaBrK17g01HIz44SFVFqNnLYKScw28ImjwuE/5PVKqSHW4Uk9uKKmBPB8h
	JrTt/VfR8kK7j5I2rdjvPexJ5jIRfaKdeM+IB6P65z20qJLfmryOGDyqdTJMuGog
	TzQ68twuu1a7c/vRtPFho8P+ySC+DLgi/cnlNBk4MptIXUJlWv4cz+Ih5ZWZs954
	GabsaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhqtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 10:49:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88882c9b4d0so11898036d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767955772; x=1768560572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gF51mEvG4UeNNiUkScsa3C3kNkmiu6kc2Haqu7j3LQo=;
        b=ZaXUURkMDp/YaURIvAKgK6qZNeREEBz3wgnBHZQBQt1AY1HTfmjrsMwdgQhGkyoE6z
         hYx9wLbfNSTzv97l9ZjPT4QLsm+TmFNv17RvGvjpM/YzpK8Y+b65kpCHz/0QR1GSIvTj
         Z2DgHljKvTvCCAN4lKUZQRhoroYEka164vehxDWklatgofPbQaDGPuunVbmu7S0tmhb4
         x4HLdnE0A2bD8U9xQqbg36vU2B1lwuu2gLDCxWTevkQ+bMgHbZQuOyfk8lezhGgA83kV
         NcdJXwvfPfgs+6fdFOXUaU1XkTv+WcMvv7Gq1bLGJ9tli832KScGF4iW+dp7MkOhjxkh
         Po9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955772; x=1768560572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gF51mEvG4UeNNiUkScsa3C3kNkmiu6kc2Haqu7j3LQo=;
        b=BlH6j5VWLZ9txtBfj9oaExteJrjGlmHl03XXLl0+2XsV6sJVj2UrVsVyTkgtSnp40m
         mDBcutTUGA7/OZKy67x1TXAcNAJ0EcLaIHRrEvipXWB7XMiPiWO6Bv0xhZwCxG7wlnBU
         B5H03orD49M2iuAVJffM43R19xX4lKRL/oA2rND/e553gejfDcrmBBDGZ9M/p/ULDKa/
         RPr/SjVSqT66wmY+NaZHqfRZd4mYq8vkZKiY6YqrCuI9RbXM3Lrl8yushU/aKu6nG4Cj
         Wycnb/FftriesI8uVl6Y1+pKPuKZqbqbSB8uzEVmDSmPeYd39jPaLs6dLG3Ik9OGsLuF
         4Yeg==
X-Gm-Message-State: AOJu0Yw2u55QOrVOkRLrSPiWnEzTRgAKS8l6+hQq7C4S9XOHNpYkzWZs
	H6MKaQhyrSMXj+MeGNLrAUGqVDOBGRJveQQaXQddlYNJXoqpRAg/PFTqAqJMQhLSQs034b807D2
	9EAPVp8Ek5ik8Jzephdk2lpHKLm9nvzZYvJeNR6HT+gDk3vki2zGuZEAqR2V3oB+E3v2e
X-Gm-Gg: AY/fxX6hvtJ1Lx31RXFNpKm3newLES70zDmqhmZmJpWxqhayid6pNByvmBrxD2waXDZ
	FdmXwis2u4zTzHltG/uwzK1ktckpgV4GzE8GdWqVIUebghTHz4pXdSZjD7XLjr2KOG5l2+7sccE
	lG3hM2t25eyk1XXHOJnsl0PXKyugz32FDz8Kbu0Ftg4bSuq9hjpifG2KSAm1PMQOYX0Mb06bwAq
	Nn6RmglRy9nfgos4VOnV9Rr7k8UyQ6pT+gulHV6kcaI6nuWatf2yygh4tmzZiIqOuFQCouikaNa
	bTg9+k/Xpn99L/50hDw8suQuLi6w+3V4JTXFisGfGi3vyK6Ps2yoTN6ZXWP0iBpczW02adG2qx7
	tYL2UKgnsUlwpLVfLAzd8QOfgvWEIZ/WwSPrMU6gU1pzsaOk/pJaD7fa9Fx2MDUMctT8=
X-Received: by 2002:ac8:5d4d:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4ffb4a54ff2mr101486131cf.9.1767955772370;
        Fri, 09 Jan 2026 02:49:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE34C1rSk2bsxT2qW4/hAMnMPSjiOmm8OXFZ84ylaKTmq5w3ox6qX+TvXPP+TFiQ98bJ1mxWw==
X-Received: by 2002:ac8:5d4d:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4ffb4a54ff2mr101485991cf.9.1767955771995;
        Fri, 09 Jan 2026 02:49:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4454sm10039009a12.3.2026.01.09.02.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:49:31 -0800 (PST)
Message-ID: <bc08f938-a315-4797-931b-5c11d402670b@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:49:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: edp: Fix NULL pointer dereference for phy v6
 (x1e80100)
To: Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260109045214.5983-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109045214.5983-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960dd3d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Bah9ZvdxITrzPEqZxngA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CCW5q7jolXO3J9wSGENIrVAeS7_jP2J5
X-Proofpoint-ORIG-GUID: CCW5q7jolXO3J9wSGENIrVAeS7_jP2J5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OCBTYWx0ZWRfXyF5NEnR9h1NN
 uWXkZwWaL0DRr1G0H18POvsKF1XBiaDzckowcmlcfwD69fzDkLv62wLKYEcCdd21oL6Nnr/95N4
 +SyNSzFUj96cUn9Y5WJO1DjXsRM8kJllTySPj6wVvhk4dwIWE9Os8GV6R7ltzt6Q9Dut3M5wBoM
 CoZapH2Vfe02NamvuNTLllJ5W4MXhl/kCAqPRXYgvIAqc6Y8pz4/loMj9yHB3E2QK0YzddqkE5q
 JE2ipG7f50atObyissSc+REkr0POmC95BJFwoImKP2ipN6c+yZOtPOLc8WTvPKwBEbQq+gmg26F
 1Xn5xxJASDlVUZisa+fTS0CJWfDO7egErC/UlQ4NH/OwRXyQdNXmtUrkM1jWxHz0KR1KYYDc7sV
 pmmAgfQogLeEubvtPw4heajmwBKbLLAQ5vp7peeKPURl/y3ZTYevuFfCTGbmfiJgHFoaaKuAtyx
 V3jQGbFooY7pSZ7c2Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090078

On 1/9/26 5:50 AM, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 13feab99feec..a17492db21d8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -613,6 +613,11 @@ static int qcom_edp_phy_com_resetsm_cntrl_v6(const struct qcom_edp *edp)
>  				     val, val & BIT(0), 500, 10000);
>  }
>  
> +static int qcom_edp_com_clk_fwd_cfg_v6(const struct qcom_edp *edp)
> +{
> +	return 0;
> +}
> +
>  static int qcom_edp_com_bias_en_clkbuflr_v6(const struct qcom_edp *edp)
>  {
>  	/* Turn on BIAS current for PHY/PLL */
> @@ -758,6 +763,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>  	.com_power_on		= qcom_edp_phy_power_on_v6,
>  	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
>  	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
> +	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v6,

Let's just point it to the existing qcom_edp_com_clk_fwd_cfg_v4

Konrad

