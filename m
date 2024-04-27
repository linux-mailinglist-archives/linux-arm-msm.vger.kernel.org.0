Return-Path: <linux-arm-msm+bounces-18709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F018B4359
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 02:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC187282D5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 00:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D1C2AF0E;
	Sat, 27 Apr 2024 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwzuDhkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97728DB7
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 00:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714178884; cv=none; b=tf+mNFJjjamKj4yl6hCFT1Pe8WPCTrtGqgPiFfvQzQGiPnnisYsgG+zrTdzH9ak+KEnbghuUk+t+NAYA7bJZ/2jKhQE2Goxr9E46toCIwFhiDHS10Q0B5kahi6adRVCktAmkf61rTvLQA4iUtTsImYStw0ycV74vsZTVHfq+FQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714178884; c=relaxed/simple;
	bh=JIkQ7bjEYerzpEkRf+P2gcJGNyrfqbQRm58Iol7ctvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=edDefNCEceLZnzSoYU6h1P677Nnyb+6qXqbQQV3QfdiS9KXImVfGlNdk/7Yx/cchI0ZajLQNwbVX06WZoFPWaEZ3YVP2Z6tadS0zyXjU9cAXKflOTLPHofL+Y78idcZpX9kewTKQS0idJxC6tm/RJNxZXzZXuxcpmJOCEUJzUmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwzuDhkE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5723edf0ae5so2959322a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714178881; x=1714783681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zMnYuuseHj6T9Txy4PL5QKe+p/vQsriDzZKXx0Leon8=;
        b=zwzuDhkEetG40rw7Ny9A8OK77gK/z/igS/fGU41I4MXgXzznr9A/fLh568Ncsy4teR
         D5wRGmhE1vbCgvYZA6gyv+bH7e6tckdAORiPai6VcL8j5ZmkyyN9bOfGSz/8KIPyxC4I
         IaEAi99kZWBxC8zjqpR9BIRk1QZl5QIcTkUsmVh9mv4Nb3Dua1nA4iDkO06ukIF2GYVH
         nT00FstRBsf5O3EIOsRkfXut2LApU9RitBGoEIcciNc1OfZIstTgnLm4ldpVTzYJz/EZ
         p4iZE6fKoTodFvM0EyHvEdhtnvgasfbFT3u3Syshs17eikOOt3DWoAWsyRkKOe45UAyz
         kJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714178881; x=1714783681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMnYuuseHj6T9Txy4PL5QKe+p/vQsriDzZKXx0Leon8=;
        b=ZdMXS2keMRKX2D1+eht8Mud0E/BXoYfb5k/cFL7/TvLppTQebazGCFVj7iptP377qD
         PjUdWNfcAiyUU1z6HkEdVgWxPJDcErPDNpoVoWMGhM1LXVxJZ50e2kV+0xg+B7ac7ZbB
         xQR4513wdn9KvjLRom01JoqeiBi7tWpKhADYGrbrHIw+1KztcZ02XWQgi2+XdG9p3cQ9
         6h5EW4bYo79Jkqv+S4fuqA7fp07v381L/lbUgkmAvKH4wt6V3RWQTgiC6MU8vqCXxn45
         bH+LIIgfbfwMCDYOHi+G50gUsWL/uMqMD1YmYWwsAu5J6EjTKDhtuK42A8ec7CR7kC1V
         L3EA==
X-Gm-Message-State: AOJu0YxcRUzjURsjxYe02NYB9tybA1RD6QzF2OG/L9EfyjeldJXON7UM
	zLRepBf+AeNR/LjmNVfHqsYr5TDURCu4Hwhum/tm+7Rc61W+rqVPh+7C8BaKwzM=
X-Google-Smtp-Source: AGHT+IHxhjAHwNZShHkxvJw+LX4E7HbPdpvwGbxudfkDavBOALlqbhcMmzj0VdQCaNSGgWA0mM4iaA==
X-Received: by 2002:a17:906:1757:b0:a52:2441:277 with SMTP id d23-20020a170906175700b00a5224410277mr683105eje.66.1714178881284;
        Fri, 26 Apr 2024 17:48:01 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090615c900b00a555be38aaasm11092278ejd.164.2024.04.26.17.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 17:48:00 -0700 (PDT)
Message-ID: <2f4eaba9-9e82-48e2-bb17-4e09e947a700@linaro.org>
Date: Sat, 27 Apr 2024 02:47:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Marc Gonzalez <mgonzalez@freebox.fr>,
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
 <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2024 1:25 PM, Marc Gonzalez wrote:
> On 15/04/2024 21:56, Konrad Dybcio wrote:
> 
>> On 4/10/24 13:13, Marc Gonzalez wrote:
>>
>>> Video decoder (venus) was broken on msm8998.
>>>
>>> PH found crude work-around:
>>> Drop venus_sys_set_power_control() call.
>>>
>>> Bryan suggested proper fix:
>>> Set required register offsets in venus GDSC structs.
>>> Set HW_CTRL flag.
>>>
>>> GDSC = Globally Distributed Switch Controller
>>>
>>> Use same code as mmcc-msm8996 with:
>>> s/venus_gdsc/video_top_gdsc/
>>> s/venus_core0_gdsc/video_subcore0_gdsc/
>>> s/venus_core1_gdsc/video_subcore1_gdsc/
>>>
>>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h
>>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h
>>>
>>> 0x1024 = MMSS_VIDEO GDSCR (undocumented)
>>> 0x1028 = MMSS_VIDEO_CORE_CBCR
>>> 0x1030 = MMSS_VIDEO_AHB_CBCR
>>> 0x1034 = MMSS_VIDEO_AXI_CBCR
>>> 0x1038 = MMSS_VIDEO_MAXI_CBCR
>>> 0x1040 = MMSS_VIDEO_SUBCORE0 GDSCR (undocumented)
>>> 0x1044 = MMSS_VIDEO_SUBCORE1 GDSCR (undocumented)
>>> 0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
>>> 0x104c = MMSS_VIDEO_SUBCORE1_CBCR
>>>
>>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>
>> [...]
>>
>>
>>>   static struct gdsc video_top_gdsc = {
>>>   	.gdscr = 0x1024,
>>> +	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
>>> +	.cxc_count = 3,
>>
>> Marc, have you verified all three are necessary for stuff to work?
>>
>> I'd expect 0x1028/venus core to be absolutely necessary fwiw
> 
> Considering the absence of public documentation, these register offsets
> mostly boil down to cargo-cult programming.
> 
> Thus, using different code on 8996 and 8998 risks provoking the wrath
> of the embedded gods. Better, safer to cast the same incantations.

I don't think many maintainers believe in such embedded gods and would rather
see the thing tested and answered considering it's more or less deterministic..

Konrad

