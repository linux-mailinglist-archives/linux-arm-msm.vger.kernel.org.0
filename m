Return-Path: <linux-arm-msm+bounces-26455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA7933B84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C0561F21394
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D620C17F369;
	Wed, 17 Jul 2024 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZW0Rk4tl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F2433AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721213596; cv=none; b=o/MeBnro/TI5vrlAVmqhQXSyIKuBGQRhzIhEopiRapXZ4wnVopFfxE26+Ui5Z0CbEuNEVpA3lQfN5GnRkwvb+f/4leTrDXOq/VI4EEXaNgTjJE2u9Nk2MOh/8y6VJiE7hEKjIOGTbaG1Md8THZCk6cWPEA7Or5JZ/cv0+JFTtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721213596; c=relaxed/simple;
	bh=Yyz0hvRoEoO1j+SXUsrzgM/tvU+qrTtOStlqr4YUMOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmFJDS+eo6yZRjo4guXWj3qSyOFM2xZ2GlUWrFNC3QwEmUeZFhAdboqGbWXKbsIciSfARhVUCd5L5uT4S1PQbePk8utkVbbVXe4Hc9qSLfYdac8/7tEXtxxQ3H10eUm+9pJtD2oaVFlP/j1pBi6pA/PqMXeLB6RnnuLJfn2DXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZW0Rk4tl; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a083ba04e7so593662a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721213593; x=1721818393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0u3BVutdlg3A7OrIrYupQbFZ6CRR+UFVFVGoNprDxo=;
        b=ZW0Rk4tlnPIwa1hwFeSaG1Kl2bW/8+ns+otMrbn87dcG95pnhnYsAs4eu1TyC9JJ5r
         5Y1nFJGDclCeE4Pd9jlK6VKxhK0lGlcv3jyejoK0qkE199WqsSDQsOQhOa3iyR64nXpi
         QR4oObTSNCSE69rYSr9RSm5cLNdUv99zlCkTMkJskrIs3gJSRnjO+pGhZcYxcgGloD/6
         T8Rl13zgVfkMpSdR0DRnzPh6ljbq8DuO/RkI2CzVYFnoDlq0f+vZVVvGzF9gVx7GOaCB
         WkdrMJRAkz16/U41KoCOPghGofcLVTm2w5jY2eVWmbw8jS4Lj/STszsCULyVsUP5OniT
         qzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721213593; x=1721818393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0u3BVutdlg3A7OrIrYupQbFZ6CRR+UFVFVGoNprDxo=;
        b=bkoGI4X3T4LFsCTWurSh8IQvV/7rABvdst2qnsmzFTyPKvh0iDLxC/uDlu0m8lZdmm
         pZpR9mmhX2TeMg3EEG1SMIqUne/4pnwXcSyG+XdZEmEm8wSim2Yv8VqE1uHIU3cHQ7wP
         qPUmVkaHuKSXvOJel37bsi0VN4NL4JuTdvQbLmLCEZuNgWjNgIfa2YqLaZ7bPfuKZhGp
         Mf0qIuuZzTnAQpi/84mZ+iPh6VVUcAAsDRaXeMoguwTRmdioUrrnauj8+pwlHbLv4pNR
         h3fvADsQYocy3tEvevOJ1O1dUXQkBig3chy3z2lfzT1ZWY5DnBt8Js209SDy57TVRHhd
         oNfA==
X-Forwarded-Encrypted: i=1; AJvYcCUWzmNmW+eydl0lYvOUifFH4eBP71JC6dvyFWU6TqqCSTnad9HDoj+5debI8koWJ5YeCOP8s30ikVg4wL3BM7kxZfOhc4XjovIcPcZPkg==
X-Gm-Message-State: AOJu0YxTphuhPX/IOzZV7vwRUjfQ9wKynrQ6cT6nGtIOos5FP6NI2Ce9
	9YyVkxPIIMpQcVVrYQXP9ImkzoQJTo5hTHjBVItkNKjQv8vF1wbMcUFFhMv4v38=
X-Google-Smtp-Source: AGHT+IGE8PKdWdKQ0CmFb3axsD/WyHTpwJ07wSanHT11iLxZDrnuLM5PXMhQIeSftRRiTIbWOUilvw==
X-Received: by 2002:a17:907:7701:b0:a6f:a2aa:a4c7 with SMTP id a640c23a62f3a-a79eda04102mr461572866b.3.1721213593565;
        Wed, 17 Jul 2024 03:53:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1e5asm431644766b.109.2024.07.17.03.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 03:53:13 -0700 (PDT)
Message-ID: <7fcc309e-f1c9-4693-a2d1-76df85021dff@linaro.org>
Date: Wed, 17 Jul 2024 11:53:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
 <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
 <f4072105-e0e2-46c8-82ed-92105b43a345@linaro.org>
 <6124f9e9-3fdf-29b1-128f-c58f5ebe1424@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6124f9e9-3fdf-29b1-128f-c58f5ebe1424@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2024 11:36, Satya Priya Kakitapalli (Temp) wrote:
> This clock is PoR ON clock and expected to be always enabled from HW 
> perspective, we are just re-ensuring it is ON from probe. Modelling this 
> clock is unnecessary, and we have been following this approach for  gdsc 
> clock in all the recent chipsets, like for example sm8550 camcc.

Having a difficult time following the logic

- Re-enabling an already enabled always-on clock is necessary
- Modelling the always-on clock in the CCF to park it at XO is
   unnecessary

I think that's a pretty vague argument to be honest.

---
bod

