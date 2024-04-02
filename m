Return-Path: <linux-arm-msm+bounces-16067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458389510B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958F01C2316D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A15626CB;
	Tue,  2 Apr 2024 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uN8gWhGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401B6024B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712055450; cv=none; b=IbEGw39huO0STGUH9eQy625ka0r8+QoX/mppmPGhuCj8DaLBvGZJxJMAziOBoRlBdmm9d3yfOW8BMda3Q52AD7slJGb6ywnaJPvtKtr1qRnWCcS+IBAVHmrT8EqpwPvHs+e6z7KYV8hav5SKan23lrFyKrE4LENhF3M/bsyTmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712055450; c=relaxed/simple;
	bh=gHoQ75tEUAz18cE3RDp8ANaC4trYaLf9aPqTwKkmiAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGs6V9GxO67MlLuXL3/k8v1n/2WKW0OVhNN7BmWoOlEe/5XOmp2y2sPXGtGGjJ5ZTsqJAP+SS8bNZiOU9Vx36Bhk8wQeaLN3hrHpevt03fkTkZxGhn50MVpWv1bvXZfaEDerVW0zNkrdIAjAsJjaFh2f9ks3Swd2TTqwSAlqCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uN8gWhGQ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61428e80f0cso26217737b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712055446; x=1712660246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XfVFqQzepl7vYyy7rpSXU5+T0Oy+bjYY8KU84lsoLRM=;
        b=uN8gWhGQDD1+BrLRRwKbbJgHbBSL1HF2pkAy/J9fDTvZTmrvzGnWiyq3xLvnDhYCEH
         eoG4o8XnYOeuWm4yf7DUMpVnfnfmLGpfDd85e7O1cOOZi9uBJIgjRheVl/gNh/y2aijm
         jXQFLB7S44yRFpTDLRGb+acbGDE0Wv8NVa4wz3GDTuduGxFhCpvd/IXAWMsH7PTtC0xN
         f+wemtwgPuPnjdAAvM/5w2wpxDM0icV6wQEMCwbQoeAY3JP/1HN712QsaerAbrDshBrG
         kE+qBgKHaI2PRiICW2MYv+NGUp8WO8hn+eMs2IWlOfdNANXrPNqb3E720WcQIkKvNQ8n
         tksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712055446; x=1712660246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfVFqQzepl7vYyy7rpSXU5+T0Oy+bjYY8KU84lsoLRM=;
        b=Pf+56rQQ5SuodqdogWTde1xyKSGHPlAwNvoz9AkIiaw3hzl846M247oMlo9VoZiKE5
         QsRxRXkxnkhvmtW+k6WpUbjla7Nan9Ire0bHHSqWNPFpS0CvoctiQHhQNOiP5Om10R9a
         rE+BkXl/ck/KS8NN1p5YzlTyjBCv/Y0gNzSgT9DjUAWK3QNZlHwVzGqSsuoZHPfsXCQi
         XUGUgIlb12rHUSavNXVA+Bp1AmFKOdFg5B0k1VteXrKot3tAJcpL6FYhJ/A1HK6+o2eb
         0pnZKHCvkcbG79VBxclXc14PPS0T/rKx600v9tCY1oniwB8KCzKAY90J0coxLx1sB0qb
         raNg==
X-Forwarded-Encrypted: i=1; AJvYcCW876ol/I9pEUyyzkg6976OQ5WpXe4GG5zhvwS8moDIwturVvG/r72CDoQn/7NgTOhdV04W9HcEo+X+OmpZDP6dZBQ4awyaFvV7Ld2e1Q==
X-Gm-Message-State: AOJu0Yzba18ElmdLI/PJ+fr3wqujLeTYjkbiw7ukT58ItEHJESarOkfK
	UHVzwsGhjsf5b8ZLfuq6k30neccqcRcc4s2cAVH4EsAVoG9s9lw0S3QmeWm8+ooxhzJMSIeB2e+
	oRkAjrAd2WCSaFg6yUSeu6998Hj66iKDmGL0pXw==
X-Google-Smtp-Source: AGHT+IGP7iUCApaJupZ/6tv2Cd+/6crilNBS2gk2mIyPFktAa2R/WouGuZYxpTCouNCX8VebVPyVaFD3DJ7kwBsggxM=
X-Received: by 2002:a05:690c:4482:b0:615:1294:d6b0 with SMTP id
 gr2-20020a05690c448200b006151294d6b0mr3017897ywb.25.1712055446400; Tue, 02
 Apr 2024 03:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-sdhci-mmc-suspend-v1-1-fbc555a64400@8devices.com>
In-Reply-To: <20240321-sdhci-mmc-suspend-v1-1-fbc555a64400@8devices.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:56:50 +0200
Message-ID: <CAPDyKFqJ8yVMvOai2BkqRETy+QOOoFOu-XkrdPcJM17_UixQwA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: pervent access to suspended controller
To: Mantas Pucka <mantas@8devices.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ritesh Harjani <riteshh@codeaurora.org>, 
	Georgi Djakov <djakov@kernel.org>, Pramod Gurav <pramod.gurav@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 15:30, Mantas Pucka <mantas@8devices.com> wrote:
>
> Generic sdhci code registers LED device and uses host->runtime_suspended
> flag to protect access to it. The sdhci-msm driver doesn't set this flag,
> which causes a crash when LED is accessed while controller is runtime
> suspended. Fix this by setting the flag correctly.
>
> Cc: stable@vger.kernel.org
> Fixes: 67e6db113c90 ("mmc: sdhci-msm: Add pm_runtime and system PM support")
> Signed-off-by: Mantas Pucka <mantas@8devices.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-msm.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 668e0aceeeba..e113b99a3eab 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2694,6 +2694,11 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
>         struct sdhci_host *host = dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       host->runtime_suspended = true;
> +       spin_unlock_irqrestore(&host->lock, flags);
>
>         /* Drop the performance vote */
>         dev_pm_opp_set_rate(dev, 0);
> @@ -2708,6 +2713,7 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>         struct sdhci_host *host = dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       unsigned long flags;
>         int ret;
>
>         ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
> @@ -2726,7 +2732,15 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>
>         dev_pm_opp_set_rate(dev, msm_host->clk_rate);
>
> -       return sdhci_msm_ice_resume(msm_host);
> +       ret = sdhci_msm_ice_resume(msm_host);
> +       if (ret)
> +               return ret;
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       host->runtime_suspended = false;
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +       return ret;
>  }
>
>  static const struct dev_pm_ops sdhci_msm_pm_ops = {
>
> ---
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> change-id: 20240321-sdhci-mmc-suspend-34f4af1d0286
>
> Best regards,
> --
> Mantas Pucka <mantas@8devices.com>
>

