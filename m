Return-Path: <linux-arm-msm+bounces-52973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D0A77EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 17:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCBA13AC2C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 15:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A74F20ADF9;
	Tue,  1 Apr 2025 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb/UNMfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4B20409F;
	Tue,  1 Apr 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520865; cv=none; b=YnyyHQSSuOVhK4fMwDX8ttxoRGF1VWvM9LDLuzfmwp7kV2N6go0YjG6Jik2CEc1/p6lb2MUEJDQjx7ouNNblbTqy8Gt3svhP5ZrjMl/phJj2GAmntCCSt7+sQt7jI3GxsTOkov6AF20+MxmiMrFmTuct8gczjkCO+zBmmNlEt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520865; c=relaxed/simple;
	bh=jQM5LYTrm8cwwpf+pooAEeXApBKMb8+AbqbOZUyXBf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lq1aaiL5Lh1kXc2ir/tsEKwfHhAaFKwzkzTnjuHZXGtz4Cmpj4vnfbZqqgndfbryDvNrNqFNvFOkzVyNz6eNGdrVf3QGqx5kI1ZnyoGzkqaFb29XooAIDXOO+wXkZ2hGn20G7haYKsx4SmDRL/0gh7+vtRMlqv2CWCFqhDSY8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb/UNMfp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so32512295e9.2;
        Tue, 01 Apr 2025 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743520862; x=1744125662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QmY1VXbfg7Iw7RJbZONgQ7DZi2sp2JKT25/dy1CZn8=;
        b=lb/UNMfpQAMQFjASEBNNMDZg5lrbCrAj0nCTxcuksN6Kj+tIsx1fNx2YzoZznqCekO
         RLLDSprwOYOlhe5nTDFw44on23zcEHqxXVyeAPT2YvjIN4dfkejJDSlWCTVGLq/L37TU
         Y10JyV5+N8mmi6TgTumD1QzhqF5QNKLmAJwZgO6jxcvG+bntNcTghHLiys00W7wvNtB9
         fP3DVWEn1rAOKYqrHfacrbq/CiaBgRWeIiBF2xEtMa1kTMYaEojxtSEMSIT00cQDzyG9
         7tkaLs6k+vzl0u8mdi5ac7hf2rA8c0GSIRSCV751/3Sv+1tml96YaKf5bMKiYYe9Cik1
         AkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520862; x=1744125662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6QmY1VXbfg7Iw7RJbZONgQ7DZi2sp2JKT25/dy1CZn8=;
        b=dKfTo2nh2m68kZVSspkCl8Ww9lQKOOfkIeAhBWXDOb4KpqirM12MDG9Zj8oboudIVp
         q/LfIYSOLAFgC7r00sri3cRomwOpHXnRoQRLc99i8pw1H7L5NFWtRMikrzBQnh0YgMP4
         08w+q2PrhNMGVGts9m/H129Wvj2S7Ft0GFrswXx67X/2Y7jAYgdwodbIs3sN8DTl//Lp
         rc7e7G4UYnT1nICphPhsUCCTZv/QX7lG3t41V3hcghO/ZUdfi7wLPyKIYfNPmIW1d7D4
         W67+qlmyrjcXz31m8pr/HVQt3E1lJdoN/WuvgQPofcWtW4dUeqJblVdS2f9xfQw+h4af
         MpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyLa06C2FjqG4qhRJesxf908gG2BrINw+bt3fMwwZBIn2YIV4kN2QXPGWWi6pN9QBjHWgb7tgl8X/pg+zN@vger.kernel.org, AJvYcCV5PZ51d70MKtXS+N+wL3gSlzxo2hYSz1YKIKKzMexODeqkDQS4RJUfg9ph8qgTsUf2cbOGNx9QpKJH4D0e@vger.kernel.org
X-Gm-Message-State: AOJu0YyODce94kOqJMGTT46EntDGZNDqAlV8gLKRWDhJth5kYsQrUykK
	eh9sA/asSKsvvpE39Dc/86neHhdEYo7rMzQz0MktncO/wIsm3WY=
X-Gm-Gg: ASbGncsTSm6g2jF9seEQ4db7Q8bRFcRalZmXRnP/9aT64yibMW8m+nZ9fNgLMiUvrcq
	wbtDn085g1/C1H/D99FDs+1DnExa2ScwVmca9Fsl1Sh/whCN5c9FDUGotvmdhdgB5GJEBZ3TeWU
	NYQY8yWf+bp3jpX1XKYNt3++/JNBpMqSdeeQcvYNNZRJfY/CUaJN4W9UDGIVpNGo4KYsYZ0VdaK
	znXGP0T0GLQiodvMe/K8WR41PJroRyPW2QEmDIcj/vbj2WOcEubKDl5ynIcmat3VKrGEBn0HILU
	twAtklwgN9mmh5/IBJYDK0PASKQFpV7Hp4+KaFXCVvyKHcGk8+dUffbDaDGtXAwI4n1w48hsMiW
	n2LV3zxohYItaXCBXqIQ=
X-Google-Smtp-Source: AGHT+IEfubvOLWz2zSQ68/6ITVBTyInffdnTLvgA/r+W7bVzXQjsQ/YoKxi+Vly5jpfUYzoGt3YNgw==
X-Received: by 2002:a05:600c:34d0:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43db61d7785mr104914505e9.1.1743520861479;
        Tue, 01 Apr 2025 08:21:01 -0700 (PDT)
Received: from [172.21.167.71] (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm14309214f8f.27.2025.04.01.08.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:21:01 -0700 (PDT)
Message-ID: <82f5fe14-3d98-4bd6-b5b5-852c8350edd8@gmail.com>
Date: Tue, 1 Apr 2025 17:20:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] phy: qcom: pcie: Determine has_nocsr_reset
 dynamically
To: Wenbin Yao <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org,
 abel.vesa@linaro.org, quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
 <20250319094544.3980357-2-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250319094544.3980357-2-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/19/25 10:45, Wenbin Yao wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Decide the in-driver logic based on whether the nocsr reset is present
> and defer checking the appropriateness of that to dt-bindings to save
> on boilerplate.
> 
> Reset controller APIs are fine consuming a nullptr, so no additional
> checks are necessary there.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>


Successfully tested on Snapdragon X1-26-100 on Asus Zenbook A14.

This fixes pcie6a_phy with "qcom,x1p42100-qmp-gen4x4-pcie-phy" as 
compatible, which was not working before.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 018bbb300830..38dbe690f2d5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2969,8 +2969,6 @@ struct qmp_phy_cfg {
>   
>   	bool skip_start_delay;
>   
> -	bool has_nocsr_reset;
> -
>   	/* QMP PHY pipe clock interface rate */
>   	unsigned long pipe_clock_rate;
>   
> @@ -3934,7 +3932,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
>   
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>   	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>   
>   	/* 20MHz PHY AUX Clock */
>   	.aux_clock_rate		= 20000000,
> @@ -3967,7 +3964,6 @@ static const struct qmp_phy_cfg sm8650_qmp_gen4x2_pciephy_cfg = {
>   
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>   	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>   
>   	/* 20MHz PHY AUX Clock */
>   	.aux_clock_rate		= 20000000,
> @@ -4087,7 +4083,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
>   
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>   	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>   };
>   
>   static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
> @@ -4121,7 +4116,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
>   
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>   	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>   };
>   
>   static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
> @@ -4153,7 +4147,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
>   
>   	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>   	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>   };
>   
>   static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> @@ -4456,12 +4449,10 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to get resets\n");
>   
> -	if (cfg->has_nocsr_reset) {
> -		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
> -		if (IS_ERR(qmp->nocsr_reset))
> -			return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> -						"failed to get no-csr reset\n");
> -	}
> +	qmp->nocsr_reset = devm_reset_control_get_optional_exclusive(dev, "phy_nocsr");
> +	if (IS_ERR(qmp->nocsr_reset))
> +		return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> +				     "failed to get no-csr reset\n");
>   
>   	return 0;
>   }


