Return-Path: <linux-arm-msm+bounces-54668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C811A921F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 17:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2271B60045
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 15:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B1F253340;
	Thu, 17 Apr 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldxvb+5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C4025334C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904988; cv=none; b=RZBOhxHeH/GHldfyMC000mDHawOFddlui3WKtU1hPA8CZap1RUH+Pr5yRNjRa/RpDIwhB4sOD6BVYJX9wiW1dXYEjnvV/8grvdKmPPlh2O1I/5WgS2SkVcjhtaBNxqTqTGADITVGLtFAzb4P7o/qZb2ogBOhuMQYAvvzZb3rn9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904988; c=relaxed/simple;
	bh=RQBPpi11Wbl15fTLt1XMrjBtePKSJY4w/7u4fEBGkDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwPsjZbdikkWcW2zQ/YBmWHdEegQPSy0H8BUzD5TQ93u9KVaYDn2BicXfw8wj4asowzDgOAzgan8O7ndZn6j1gbyjoY9KvcmiqQlbCyb3YBPVeXD2YJNdjQ5kFUZSUybnDIU84Fv8jKKHzUFNMl/vpw32fd0K1WLk7mPGzbnsTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldxvb+5y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ede096d73so7082855e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904985; x=1745509785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgKQVpVbH2AFi2dnIi8Lnictk74KrdT3QvbopRNS7bk=;
        b=ldxvb+5ytRGKodgc5hwt0U50tOLjZgVisMwgwW/qpb+Bss595+yYr/t77YfQHOggEf
         8BEhLDpic6sR8sXex/Mx0mkNiqwy1kCHGWvEzly5xazZW9Suu9SVhSyHUCGsAhizZp1m
         3OVd64VIqVKlS2ctjq/LlyTOmOrmC7z3/LXK7yhcqfEvTpfeHhmAArXaZxxvMACjUGe0
         mQ64tDNXMdjux5bFOam4SBlVT+O08v8rSzaSO/54UxTYFdWLDBdTDeDFEp8e9kis6hbt
         NRvmUteTsunWHcN7wkVSCPlKm3pdQXpzW9iq9fkImF58GBEXkoYwHvvgNLgUZX84eMwk
         ZCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904985; x=1745509785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgKQVpVbH2AFi2dnIi8Lnictk74KrdT3QvbopRNS7bk=;
        b=eqGWc5dLGeEaFv2nJNXc9IZuLnuqADTfSkere3dPMErvi0Pct3emnqLJ5euCOnd0VX
         GE+0bOoszcqCzhrz4YDEDPG8G0cbbvlODoxU1T3kQWZITY4Tp1y1bC9ij5+smmzeelUl
         33cN2MbjSpXTbyeNwiVczOxntT+uRAij8rJrl7vZVF8nWdRFhRhgtBuPdbki2qx6j4R1
         aP/KX2g+86jILpdKBmArNnoC7IrzxGm1SjP9QsrlDnzEl+jJwmPuFCK1wpxEGyUy2lWB
         IrwehwneNlpVS3WqqLCcsPeg6YskGG8scaD0d5XMRRSFDacbOmp0NkjrUtVoVHQTiTcX
         si4Q==
X-Gm-Message-State: AOJu0YxG+G2yyixZdIo4RXe2bGgxCfvzAe8bXVjFIuLpC4qn+XwpCAB7
	BUGe/6JQPCjufI8t/lEcow43hkpFUxKQySD9f9NeWcvPx0ezFCclWIBSOlppk5k=
X-Gm-Gg: ASbGnctHvY+MTMSTxS5S/BT0qWaN3Qm7GHFLe1++nCymmTxGm9KN046bTCI7sCbmFX6
	qm340Bh06ipCKZ9CUWR4rFbKkcx5UnyAE9L4Ie1uot7BL3aQsukATIRO9epeWLDBbXYOAsEJoOI
	9ACrLyrmTvAn55YBVUURhZVygbXgzDOv5bZi9UYcMlmXAG6XfIwjTQwUghDk+HVP0cWhi/Kdwli
	JMNt10EJ+KFQQ3voqILMnZb50OnEE4gE9pDhMuIVwOMU37nWNxEWFGSUN9lQH6UwMeiePRIe0GJ
	UkJvaYwVi1+1g2PVU1Du9Hdbu7OaZODPbg3wACLtQ3x4UVM2ubHPDRZJoyTLRoIAQzsF5oaFeNP
	E+pW9Ww==
X-Google-Smtp-Source: AGHT+IFn/JdIHUDojYSpMBQMKdOEObdQ/tZ3UW1OgI5Z7tlfhrFycGT1JClvKcKR6auot121Yka3uA==
X-Received: by 2002:a05:600c:1913:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-4405d6bf358mr58208195e9.29.1744904985194;
        Thu, 17 Apr 2025 08:49:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58d18csm59035655e9.26.2025.04.17.08.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:49:44 -0700 (PDT)
Message-ID: <82415a35-2410-4c5d-aeac-3b4656804369@linaro.org>
Date: Thu, 17 Apr 2025 16:49:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] media: qcom: camss: Add support for TFE (Spectra
 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
 <20250417145819.626733-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250417145819.626733-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/2025 15:58, Loic Poulain wrote:
> +static void vfe_enable_irq(struct vfe_device *vfe)
> +{
> +	writel_relaxed(TFE_IRQ_MASK_0_RST_DONE | TFE_IRQ_MASK_0_BUS_WR,
> +		       vfe->base + TFE_IRQ_MASK_0);
> +	writel_relaxed(TFE_BUS_IRQ_MASK_RUP_DONE_MASK | TFE_BUS_IRQ_MASK_BUF_DONE_MASK |
> +		       TFE_BUS_IRQ_MASK_0_CONS_VIOL | TFE_BUS_IRQ_MASK_0_VIOL |
> +		       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
> +}

We could mix and match writel() and writel_relaxed() but you almost 
certainly want your IRQ enable write to be atomic from CPU to AHB/MMIO 
endpoint reg.

Its simpler to drop the _relaxed() everywhere but, if you want to 
include the relaxed() variants I think you still need writel() @ IRQ 
enable as well as WM start and stop.

---
bod

