Return-Path: <linux-arm-msm+bounces-17897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA48AA5FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 01:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03A9A1C20E1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 23:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BA4757F7;
	Thu, 18 Apr 2024 23:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEG4v2rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3525FEED
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713483718; cv=none; b=dCeTrjSmTxE/8UqpzkuXoc7dH4wVCdEw12NDsVUFeRyDdbL5+GOLZ1cD2grVf6yn8M3jUaE0w/Ts9g9+lBT94qti79tfYHmcS6Yc9nHBv5/htA642kDeLJ7yFnLr5N3nHykjW03yNvr4DryQ7R822MZdneTzRQNQRgfuT+pn6H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713483718; c=relaxed/simple;
	bh=+5tyRpFZjPP1SM73nE88cOsgWau4ESrZotbdiOXoto0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGE4xy67p7CdgF23iQwQuNotTa+MhSHrM1WTaVEN7UDMMaok0DGyDPBF+VHR9oWfprzZCtbPgZpm/gid68256giLqJ/e/IoNZkAgCGT0hiqiaMI/+eNNJ3+Pr/rKIYLOBjmcXiPbGjwWd583ImfYNywh+BCnBw3gPQ569w8Lu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEG4v2rw; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ea128e4079so732343a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713483715; x=1714088515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IJ76Ejq6B7Vhl/CGpUW1RVfuowjYIbxdWO91aKguEA=;
        b=QEG4v2rwTMo/MMKD7O0UFibmOQukmuIsz4HpQz+Xq5b10QlO7hYSIwbwnbm4kPw1n0
         /fDpB8zle/dkMj1CCbAehjRqk+lR1Qpt97o/+goFl7oNMD5E0ZolkyVBc6pagDQLWrUK
         YLFQUYqn7do+eHFxgTwUost+xO2W3o+3odEd6yr+05iSO92GsYsbBW2W6xMDn7fxuMI5
         SpeYEQ/GLJfpV9cPOj78Y9KSHmgLXNYtQ3xq0vytOYaCgWBLYAdkwK8OH7bhgbL3vNEF
         iCMRbVGuU/4IJxrSFYgWCfwbgTtuxEi+oLyPusStceKT4AkL5MCJOP4uHIGwU8+mPVWb
         s3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713483715; x=1714088515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IJ76Ejq6B7Vhl/CGpUW1RVfuowjYIbxdWO91aKguEA=;
        b=TbhRrzL8QjBcxUXzAQMNFG7fBwW3uXGbgIR/Dv7DjPfEkRdWyrAYVctBAhAhf18ukU
         skGzFQAoKCn9+KI8VFHRL5fX1SV3D4KjmuUmCZhAcNNc8/SYpsIMrafay2tMh4VEtg6H
         n4m7rAxACVt931H+VNm+Mik69DIdsyy6Y0WlB5YMGEoMsgHIUYL/e7U9RQ/0swmRiWcW
         XPItDv2UsndfS61z6FBHZNc5YafIootmqoSoQaqXqUromafWBII8pvk+r5vmJq1ORQ3o
         1Q1gB0rM+9WnG35kic2bWNFEfcvazhBK2uKF+jzcxNYD+ZvQyGQtgha1mENtFyQNBLa1
         y8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Gm6LYxUv56xGSz1g+Ser6jQ/BvDQugWjGKXW5M0pemGnmvunmYzaOfiOxddQgHJt5qoZEVjQeTet+g5S8JVnkNsvZd1Gcon9ipeOiQ==
X-Gm-Message-State: AOJu0YwfklulMIJwX4F+3zVvCTHAgCZNHb5td4Jn6f3Zqg4/x1ZR4XMk
	mJvvXKC8JmAs81mCcD7ZSnYhJuEp168SAnd+XPy9jn1Xv8Z2Rno5GOhZAcm+yZQ=
X-Google-Smtp-Source: AGHT+IEPPhrny4ZXAVN1iU2b2OjfmoT6zuGx6RKKiOlIUbWTSDXLSdB15t4JfekdzgJZ4+jLDhSH4w==
X-Received: by 2002:a05:6870:92c5:b0:239:e7:a679 with SMTP id g5-20020a05687092c500b0023900e7a679mr596171oak.14.1713483715726;
        Thu, 18 Apr 2024 16:41:55 -0700 (PDT)
Received: from [172.20.10.110] ([209.37.221.130])
        by smtp.gmail.com with ESMTPSA id ld2-20020a056a004f8200b006eaf43bbcb5sm2050444pfb.114.2024.04.18.16.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 16:41:55 -0700 (PDT)
Message-ID: <c5965733-f49b-4245-8d4e-778c94203845@linaro.org>
Date: Fri, 19 Apr 2024 00:41:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic: fix pdphy start() error
 handling
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240418145730.4605-1-johan+linaro@kernel.org>
 <20240418145730.4605-3-johan+linaro@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240418145730.4605-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2024 15:57, Johan Hovold wrote:
> Move disabling of the vdd-pdphy supply to the start() function which
> enabled it for symmetry and to make sure that it is disabled as intended
> in all error paths of pmic_typec_pdphy_reset() (i.e. not just when
> qcom_pmic_typec_pdphy_enable() fails).
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 6560f4fc98d5..5b7f52b74a40 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -475,10 +475,8 @@ static int qcom_pmic_typec_pdphy_enable(struct pmic_typec_pdphy *pmic_typec_pdph
>   
>   	qcom_pmic_typec_pdphy_reset_off(pmic_typec_pdphy);
>   done:
> -	if (ret) {
> -		regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> +	if (ret)
>   		dev_err(dev, "pdphy_enable fail %d\n", ret);
> -	}
>   
>   	return ret;
>   }
> @@ -524,12 +522,17 @@ static int qcom_pmic_typec_pdphy_start(struct pmic_typec *tcpm,
>   
>   	ret = pmic_typec_pdphy_reset(pmic_typec_pdphy);
>   	if (ret)
> -		return ret;
> +		goto err_disable_vdd_pdhy;
>   
>   	for (i = 0; i < pmic_typec_pdphy->nr_irqs; i++)
>   		enable_irq(pmic_typec_pdphy->irq_data[i].irq);
>   
>   	return 0;
> +
> +err_disable_vdd_pdhy:
> +	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> +
> +	return ret;
>   }
>   
>   static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

