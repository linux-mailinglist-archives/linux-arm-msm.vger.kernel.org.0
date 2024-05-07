Return-Path: <linux-arm-msm+bounces-19435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FE8BEECC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3AD1F221C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 21:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF9F73184;
	Tue,  7 May 2024 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FX0U+vNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF654F86
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715116626; cv=none; b=b0PH86IZ365MxSMTYZZbu1OMDWkCEkbU/sUD1ZiBuUgj80EvMoFrDb8j7vbwn+n0O+z6SooOfN5wm3CmKwJdXWKTYgdXPjkeQtZhdwt1bp+nwRcQ/rqvYvg9wDE7ez3Cd/Gy93K3hJxGsFOEl0wNEv3sx4HOg9M+dg7rrlhlS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715116626; c=relaxed/simple;
	bh=Ecwjg3T8TYwyg2JlRh7RQ8tIIO5urNWWdj17N5ZVd2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUGLvKNZV/93RyyQOUpbPSLxFDHE8P9fCeiZrCuglOiRBadtmwLbra/KuxgcNJv7kT12TWssVbAJ7mc7QOv2a+GN7b9YS/e2wEc2NJZDqCUy+DSE+aN0syWU8iet+GJ8R32zfPMmOouP6IESo4lOHmYxNUqUPNS4jiAnI3A+52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FX0U+vNB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51fb14816f6so4527572e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715116623; x=1715721423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmKM6X6SN+uqrqOzykz1rBJY+bzWqLEMd29Ir34tYUg=;
        b=FX0U+vNBG4DXc5qqtxWmyZH/y9WJbfnHuZpzqcXWDhOO0hiR1AUAUXtJIMuw5kMi4k
         OXBP0bIQROnv3dfe4f0pEiT2Jhix1ez6U0G7g7e7CG4lnqR10jW7MAwXPAWG3Qriohso
         tONwAOnvFKVGeA58EjQIGP3AyX7fIGVvkdZ0q+XQpNXSHjuH7Wa7m4ymNNbg66H1/JVe
         71oH3EFxBazoXaxXP1dATFqlIER5dobOC5JEGZfhOJH2p/dm4Gq7vkpTSJ0/EsNmE4U4
         Enbsv8FfsypIZ/EsWQ912qevbcFMk0+V5rPiuabDXyiwm5KJfEblWRjnm1y3H6fjX/0U
         SWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715116623; x=1715721423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmKM6X6SN+uqrqOzykz1rBJY+bzWqLEMd29Ir34tYUg=;
        b=XfvTfI7tDYzzW8n6nT5pLhESmSNEVbnkxLwcE8XCls2+779EgZ1EUtpHDzUMcUmhBK
         lD/6RfjiCHBs93QbVnTE/tL3cT8GPBEbbBCsHfzXyI9z3Fcal/is5IG9n34z3Sii8V6l
         1ScSh26c5liuG9llZiu6GzYLQDvwOiDLNIc63dlyMF5yj1aUnIFXVMdq0egSGgtwEdsN
         XKqNqygjpVcMzGv1gfTN34hjrx/QUWi0csvk8EIO0HeUgMPnfncdAbemNrzlQGcFU2ym
         GOqBG2UtvpF4g7HUBSTiQ+7FZEb+TxUnuVUnie/Kli+uRazHqBPFAs2FzrZDUDGRY1xA
         bpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKFq/5cq4K3OfzV2W+IIvmPsIOoXZjrZhpY9kcV4HxBx0qRwQbBr+yB6NcP4VmFiuFPIdf5aBfYtHtODCMY80YIXjTNDuLaS9zZtm/xQ==
X-Gm-Message-State: AOJu0YxTm1/N31A8tjFo3ZXt+6qkeskAqlVW49qIVr03Uki53UWnzwl6
	tZKW2cAqxiaDEmm+usP4hoYhb+AoNoz/QYrV6YYHBq75oUXGYDj8v3Kv1sFs/Vk=
X-Google-Smtp-Source: AGHT+IGsDXymga87QLgW1PlqoDkL0AzaLEBDCB8pfA6cofTQrcvYSqjGPhXiFyn+uwX/y4y+GSm6mg==
X-Received: by 2002:a05:6512:4845:b0:51d:162e:bf9e with SMTP id 2adb3069b0e04-5217c46c382mr454259e87.15.1715116622848;
        Tue, 07 May 2024 14:17:02 -0700 (PDT)
Received: from [172.30.204.63] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b00515bad4cd0asm2237431lfm.155.2024.05.07.14.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 14:17:02 -0700 (PDT)
Message-ID: <aeaa72f6-b227-4b54-9836-0b8f4dba6ffb@linaro.org>
Date: Tue, 7 May 2024 23:17:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on
 gcc_sdcc2_apps_clk_src
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org>
 <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org>
 <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org>
 <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org>
 <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org>
 <7baef7a173dc4d1ecf8b0dafde565b1a.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7baef7a173dc4d1ecf8b0dafde565b1a.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/24 22:28, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2024-05-07 06:51:04)
>>
>> without PARENT_OPS_ENABLE:
>>
>> [    3.326891] sdhci_msm 8804000.mmc: Got CD GPIO
>> [    3.336839] scsi host0: ufshcd
>> [    3.337105] gcc_sdcc2_apps_clk_src is DISABLED @ set_rate
>> [    3.346339] ------------[ cut here ]------------
>> [    3.351093] gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
>> [    3.351114] WARNING: CPU: 1 PID: 11 at drivers/clk/qcom/clk-rcg2.c:133 update_config+0xc8/0xd8
>>
>> [...]
>>
>> [    3.610523] gcc_sdcc2_apps_clk_src is ENABLED @ set_rate
>>
>>
>> with PARENT_OPS_ENABLE:
>>
>> [    3.331419] sdhci_msm 8804000.mmc: Got CD GPIO
>> [    3.336569] gcc_sdcc2_apps_clk_src is DISABLED @ set_rate
>> [    3.344795] scsi host0: ufshcd
>> [    3.355122] qcrypto 1dfa000.crypto: Adding to iommu group 5
>> [    3.363567] remoteproc remoteproc0: 2400000.remoteproc is available
>> [    3.364729] gcc_sdcc2_apps_clk_src is ENABLED @ set_rate
>>
>> after testing it both ways, I realized it wasn't supposed to make a
>> difference in this regard, but I suppose I can paste both results anyway..
>>
> 
> Can you share your patch that prints the message? What bit are you
> checking in the hardware to determine if the RCG is enabled? Do you also
> print the enable count in software?

I already reset-ed the tree state, but I added something like

if (rcg->cmd_rcgr == the one in the declaration)
	pr_err("gcc_sdcc2_apps_clk_src is %s\n", clk_is_enabled(hw) ? "ENABLED" : "DISABLED");

to drivers/clk/qcom/clk-rcg2.c : __clk_rcg2_set_rate()

Konrad

