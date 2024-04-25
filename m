Return-Path: <linux-arm-msm+bounces-18548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 094458B2025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E121F20FEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA52B85626;
	Thu, 25 Apr 2024 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="QhtKOBzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F56022616
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714044340; cv=none; b=rg1aet5Uz7rmGMcC79Y3ZBSiKXKu5wEsxepx/XASxv/To12ZbltiF2xZtK5beZpJ+CosfrfCBRqXTZzPRAOIlV66SMhAIELpIrnIZx7kP6mfT6GUiA+xTo3Vmn0JgP2kYqoOD1V+2+XlaP+fh6x69STuNZKenlJ5l8QhUdDKtf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714044340; c=relaxed/simple;
	bh=fwNLe0kMBbLWPVEoSUuvx176ZW4tkF/rQ4RzbXjxXRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+SkTWaC7g61dtUEaUjD2X8GbotxZFGRrepXxo2m/uhj4AfttT6v/nh5SInk3HWCpBc1tKcWLblAvNgxgUq+xA9yRLrBgixz6mR0lmarNcV/JO0GGD7LJjc+NerORFp0UUURD6w00MCOFlSn3BDoXIhQiwLPSJ83aKT8eWhFSLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=QhtKOBzl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-347e635b1fcso653055f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714044336; x=1714649136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyppFXNax+/kEzh5AnWfKH+3bLs7/N1pqFNlZERxN4k=;
        b=QhtKOBzlSsmQ1AP7rUg7Rmyf+KAie0Kj4nXdptPfYtXLIPM38q2CUrIyK7AZAzHh5k
         d1Ybe2geJd0Wuv/wbfo7kcL/jnpKhdCLvvcZ1DLubmpbMZuMIDd9P/tjgHkWCoL1Ck58
         ULcpMX4pakZN9XE9udQ7l+WoAxv5/pqwT6zzvSu7YPanLStU535V7vkLfvAQPPEomvPz
         WFm/4bPbie36FjdKwWb02KM9FP4DfnY80Ha/6lNO6srnK2QW72FRvUwC8vWE/+/Ud4Do
         T1yEaLJNeTkdJJnbLswUSD7SryrTLmsr6vFEEenvYS80IJQ7aQe/I6uiLicIkD6l36PV
         HmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714044336; x=1714649136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyppFXNax+/kEzh5AnWfKH+3bLs7/N1pqFNlZERxN4k=;
        b=RmaTaUfv/UJbuxdkahMrDAWlRInp9NkzBriNqcBVYXeyEWJjgMrf+SRztggCoSUvqh
         pYLYCoeEIfzWYwKnLWCchGd8ZwG8Hbi8jtYTg7aN8gFz42sHv8AaPhKdeOtrmf12+LFF
         S5IQKtjcKrS++Ptm4VL3HHRGPbeJLmXPXxr0e0GDhN8Jkia+x0K9853yIru39IL5vzEl
         Y0a90RzYcftMlk+rgsHHczNps1sfoeObxa+Hfx+FlR1Eg+Iei9tJrzaEAJk1gTWL9OZh
         KxEIgPdv8fJOAxma80BF/QGN+7SRLm4Pz8ncHp2nSTd7HySZE4U0BgS4M51UySb7bI/t
         t6wA==
X-Gm-Message-State: AOJu0YzzE4r5oa9G1+gPSEwMJ3vdM8/idXPDrAlWTv3hP7YygkQ8oSlh
	a7t4xvT5HynAuI+ZHZJpmMd1elQ4gY8Bo10OBIXG1twGTGY5uw+r08Yuu6YbooY=
X-Google-Smtp-Source: AGHT+IFFR+7svg+5NdeiakUxLZ03suBxKz7h1mQ4mQSnUeMnn4a0n7ob4+CjYL2JbkCZTANYKUMGEA==
X-Received: by 2002:a5d:60c8:0:b0:347:d352:d5c2 with SMTP id x8-20020a5d60c8000000b00347d352d5c2mr4159132wrt.13.1714044336135;
        Thu, 25 Apr 2024 04:25:36 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600001cb00b0034a21842accsm18995477wrx.86.2024.04.25.04.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 04:25:35 -0700 (PDT)
Message-ID: <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Date: Thu, 25 Apr 2024 13:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
 <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2024 21:56, Konrad Dybcio wrote:

> On 4/10/24 13:13, Marc Gonzalez wrote:
>
>> Video decoder (venus) was broken on msm8998.
>>
>> PH found crude work-around:
>> Drop venus_sys_set_power_control() call.
>>
>> Bryan suggested proper fix:
>> Set required register offsets in venus GDSC structs.
>> Set HW_CTRL flag.
>>
>> GDSC = Globally Distributed Switch Controller
>>
>> Use same code as mmcc-msm8996 with:
>> s/venus_gdsc/video_top_gdsc/
>> s/venus_core0_gdsc/video_subcore0_gdsc/
>> s/venus_core1_gdsc/video_subcore1_gdsc/
>>
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
>>
>> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
>> 0x1028 = MMSS_VIDEO_CORE_CBCR
>> 0x1030 = MMSS_VIDEO_AHB_CBCR
>> 0x1034 = MMSS_VIDEO_AXI_CBCR
>> 0x1038 = MMSS_VIDEO_MAXI_CBCR
>> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
>> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
>> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
>> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
>>
>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
> 
> [...]
> 
> 
>>   static struct gdsc video_top_gdsc = {
>>   	.gdscr = 0x1024,
>> +	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
>> +	.cxc_count = 3,
> 
> Marc, have you verified all three are necessary for stuff to work?
> 
> I'd expect 0x1028/venus core to be absolutely necessary fwiw

Considering the absence of public documentation, these register offsets
mostly boil down to cargo-cult programming.

Thus, using different code on 8996 and 8998 risks provoking the wrath
of the embedded gods. Better, safer to cast the same incantations.

Regards


