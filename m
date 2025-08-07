Return-Path: <linux-arm-msm+bounces-68030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F310B1DB20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E7F189A995
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D40264A97;
	Thu,  7 Aug 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DEYHSKUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C42367BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582301; cv=none; b=n2RmgAbh/rpuIKq9VSnayc1P2deZZGbax3BeYRb8BvYenLpibDh4VUiCOekdLko9fqNBMoC/QZ+dw7NFCDV26o1KV79NgQskFUVkydrODPPaBA9Rdgbs7oB6qJ9zV/QkJCBqSrZbbml+DNBL47h6N/FGGkpbhZRudW2eipa0HfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582301; c=relaxed/simple;
	bh=QABidHfaEGH04sZF9GZ8ns14VBHILBUE3waqwEqc90o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3J96rikZ1cgzmfclFFywjVS4IDbus4g/NaycKTGYbrr2dtZqIKcKCtp9L6sn6tq1mezMvpOvWLrohuTv2KUDevQLnOnl/gXeV7iMwV0lVzG7JjfI/91S3snnYrIcmgyz3akbTfl6WQx2lrytsYgcmJcNK7Q0zm50m2R20AtZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DEYHSKUi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-458bc3ce3beso7727735e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582293; x=1755187093; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQgT5tBzxN5qfx3o4Typ3jR8hTsSFK29Qxza7W+WALc=;
        b=DEYHSKUiFTIh5a2+/dOCqGdN/lG5PC0IHFJESrEF6FfWIOJKJ0p17GHXRvZAqukQh4
         yNL307B+9kfElNTUdzX/rNcXlAtCVmk1sYdYBfl4iVABD2WwuL7cMAFSgkAbZM/wNBlI
         0SQBYawv5oeTxAFCldWl4jISMjB1ikCFKUpP5qaz5dCHBpmC9ToD1vSDNuHohNq7dPTR
         H1e6M88orPevHQ3awQxyd+IqaPtwE06gHozI0uLnN5O7T4cSuq9W5qkBRZb7vWI8Gstf
         ebs9x4cri+mP4Ti9qqIO2jqEjCrfV/3HFAne7dQoAN6VM0hShgYXHmSwMWU58FOhVOz+
         XDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582293; x=1755187093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQgT5tBzxN5qfx3o4Typ3jR8hTsSFK29Qxza7W+WALc=;
        b=H14diHOZiDEgwaBSVlFIS3/JOg4TMVeBUyzC8sjLhcLYMMmZdmZ0LO2vwCDrpvBzV7
         KvoTaJJdEozwJoV4AdvCrka7DOR0N4zlXMGCpF26pJNDfBqJWQD1byrBbpiVP5jVZl2P
         vbKjwvTXH2f/ebggXgkbHaNHq+WScVT60902cHqs/8PEUz6xl9SU8+xkqc/pvCihOaD0
         kAKWQql+w3ea9CsRDx1B6+NcQKiFdTHdMwIb9rSJoWg8Qx7AWzlYiEEPojXDCwsnIR9z
         O59VPPImHnst61S8KURb1ACczrfYksSoj+2a3JQKV7M/PPoa8kUsevuh07hvasY2Q5PZ
         vteA==
X-Gm-Message-State: AOJu0YxpVuSfkJSAC9xWnz4+UD2ZvSKZJQDXjGFOZdjxCusdd7uEjkZm
	ZXSy1qYZlQ1/6tNDByGHEMsF5VXeRAXDmTrV6gPee72rcgg1cJpLEtnBt/NVYUzkreiYd6jWz7p
	NSWhX
X-Gm-Gg: ASbGnctKkzoWQuug1AC+lFVUWod3K8rr1VUID6QwpXhwU2d3J+R0GY8KLOE3r2CZT1r
	fMtsqNumqAdSp5+5xrgu62SKlXFLdEfb7wnI4n8bz2BqhE7kjByMaG2Sv86DsHGgO/SSFg07606
	isXT1BOB0Fwv+3wzLO+tslyek6Zmxs8W8cN4eeLPeSvC4mcjz090v9l4KPssSNPPUHmj0BtlK4q
	dkb9SOigGzcjTKHQ7IWilnpABYq2Am3LTFIPxGQ5cntOfFwyomu0TxpUNNPkU09d43uGc82zIMp
	70whc4zoTGrRNC526f+3DM8C8CutGUj/dckezCUAGMBHyRDGfosB9npqkyV01jrDsfNf5b/dqbT
	6VI7oGbfYLOzgY9k2mDMnQDyFR6CAzcu9
X-Google-Smtp-Source: AGHT+IEBfpxxvZI8SJ+lglFD+cogAt+bs/wcnRgRAFXHWRDKw9o2UtQYdpJ3Q/ihA9IqrDfDLYSoiQ==
X-Received: by 2002:a05:600c:35d4:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-459e7440902mr60287635e9.6.1754582293450;
        Thu, 07 Aug 2025 08:58:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e5852e28sm97558465e9.9.2025.08.07.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:58:12 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:58:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: [bug report] soc: qcom: icc-bwmon: Add bandwidth monitoring driver
Message-ID: <aJTNEQsRFjrFknG9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Krzysztof Kozlowski,

Commit b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring
driver") from Jul 4, 2022 (linux-next), leads to the following Smatch
static checker warning:

	drivers/soc/qcom/icc-bwmon.c:693 bwmon_intr_thread()
	error: 'target_opp' dereferencing possible ERR_PTR()

drivers/soc/qcom/icc-bwmon.c
    645 static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
    646 {
    647         struct icc_bwmon *bwmon = dev_id;
    648         unsigned int irq_enable = 0;
    649         struct dev_pm_opp *opp, *target_opp;
    650         unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;
    651 
    652         bw_kbps = bwmon->target_kbps;
    653         meas_kbps = bwmon->target_kbps;
    654 
    655         target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
    656         if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
    657                 target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);

Smatch thinks both dev_pm_opp_find_bw_ceil() and dev_pm_opp_find_bw_floor()
can return error pointers.

    658 
    659         bwmon->target_kbps = bw_kbps;
    660 
    661         bw_kbps--;
    662         opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
    663         if (IS_ERR(opp) && PTR_ERR(opp) == -ERANGE)
    664                 down_kbps = bwmon->target_kbps;
    665         else
    666                 down_kbps = bw_kbps;
    667 
    668         up_kbps = bwmon->target_kbps + 1;
    669 
    670         if (bwmon->target_kbps >= bwmon->max_bw_kbps)
    671                 irq_enable = BIT(1);
    672         else if (bwmon->target_kbps <= bwmon->min_bw_kbps)
    673                 irq_enable = BIT(3);
    674         else
    675                 irq_enable = BWMON_IRQ_ENABLE_MASK;
    676 
    677         bwmon_set_threshold(bwmon, bwmon->regs[F_THRESHOLD_HIGH],
    678                             up_kbps);
    679         bwmon_set_threshold(bwmon, bwmon->regs[F_THRESHOLD_MED],
    680                             down_kbps);
    681         bwmon_clear_counters(bwmon, false);
    682         bwmon_clear_irq(bwmon);
    683         bwmon_enable(bwmon, irq_enable);
    684 
    685         trace_qcom_bwmon_update(dev_name(bwmon->dev), meas_kbps, up_kbps, down_kbps);
    686         if (bwmon->target_kbps == bwmon->current_kbps)
    687                 goto out;
    688 
    689         dev_pm_opp_set_opp(bwmon->dev, target_opp);
    690         bwmon->current_kbps = bwmon->target_kbps;
    691 
    692 out:
--> 693         dev_pm_opp_put(target_opp);
    694         if (!IS_ERR(opp))
    695                 dev_pm_opp_put(opp);
    696 
    697         return IRQ_HANDLED;
    698 }

regards,
dan carpenter

