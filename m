Return-Path: <linux-arm-msm+bounces-13491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81118873831
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 14:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3760028314A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA850132C15;
	Wed,  6 Mar 2024 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zufErZF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867A131735
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709733351; cv=none; b=EkZxectdDBk36kwLbVaOJGwWsDqrPD5iu29+nmIDamuHsrwFnXPOaQSXZ8uiJjsJRjAbOAoqznkZ+S+L82C/HUeMe03VNcovBDlqryk9vXzeGwJXCo9m6cDzT3mmoKOhwO9IvYPlvA6uF6PZX8nfPFp8TxGCuG0p3JYFq4oYuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709733351; c=relaxed/simple;
	bh=Esvwv4GmKkRGzYN48ZvM7fQdZPibiAf4YX9bG9qSQJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJJvE6dlLMRMsYNxIa7PLkXjVhgfdElYmoRfTxOS6lub6dAoeLGc/qRLIFJveN9RTiDEsbTNhVsxkEYFoWSB7phvLAbLm3CsedipIbt99quGSs0O8OfgICxcl/Ka8YiNBVaFqt0M2bnVkhncZl0qwVjlx8Hs5sxGjgoV44NqTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zufErZF2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412ee78edbbso12727215e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 05:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709733347; x=1710338147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqeQcb2lk7Isbti9CqhzC6h0iZhvy2vGvXInpl28c0M=;
        b=zufErZF2tckoyq2AJn+Jhh32JfCRaH7dxfdp/d7WuBIyHqGS1Wb4XdQaV2wNvkA5rg
         hfwdDh1YFyoXCUBepvATNtKyisE3x293UJhq56VjStj1wv40TO+AJbUaKyWhkTbgczfM
         94R6KyNawHfCxVnav5RzBMk83ZgRjRx3RXZXl6A9JAVm8sfizxyz9ahqjCxPD4L5jUpn
         fUx7p1tLW4EQR6QavWnJ8I27lpRwLGL6Kq6TKCNa1KBem9Q9vr9cpkkkAzPBQhou5yZv
         rPeMwyqTt2lofjHwZ4WWslT2Ktf3TkTZRQdCl0++WAR8v4ZNUeVqQhaf+8DhpK5g36/E
         mrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709733347; x=1710338147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqeQcb2lk7Isbti9CqhzC6h0iZhvy2vGvXInpl28c0M=;
        b=UOmliVuIvPEGQXVbwa65urZLHp08/y4Zhyy+2QKRmTRDWuNTjA+sAZd4kQ/6TFRJ09
         bmlNs2fJVBDcTSLy2diX+7NsNKeTbf2aYlAERQ0t5VGLh+qYn58rGz7rVyPujRHk1dI9
         M6kcYs8a32re9w1ICzeiquX9SNIsj0loLs7aTdxxd7YMvm7SCxijE8dUDRv9nTD57cd4
         7kHfaT3I8ofzNbwoVgcvXXv9TJs5xOra5V0Cf+dO+AUp0CSwyLIA4hE3tUx7iFoIAUki
         Dd7HWW8i2iMpKj+NhlQroLYpQJwez41hDr3TcH7pU62ASg424k3NxZIlJlw23g7Gch2W
         Fslg==
X-Forwarded-Encrypted: i=1; AJvYcCUMUhrMPHiHEigk9gy5xgTagWEU94qlmdlKopJW9q3Nhg8bYVM4E/C1WpHSJqUDGirj2MwShXrXu/bLb81AkU3pgaPC96S/oMojnxtQuQ==
X-Gm-Message-State: AOJu0YygUFOIOBJnusDwWusL/bBXFMq6z4P7DqGf7DFVkdKMoJZz8j6W
	hkKEq0NlYOw9x3eRmuwm5tzxkGPzmJcokDyFzGjgG640VwQHv7nafkKaDhDUM2E=
X-Google-Smtp-Source: AGHT+IGOBEiwkCooM4Sxrm8AQUC8qi0kWf3U4eptBtTlJ4YxKa+a3fBbBRdx4QqI2Cc2S6bVl3jE4g==
X-Received: by 2002:a05:600c:358c:b0:412:b10d:27da with SMTP id p12-20020a05600c358c00b00412b10d27damr11333800wmq.1.1709733347321;
        Wed, 06 Mar 2024 05:55:47 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id da8-20020a056000196800b0033b87c2725csm17548409wrb.104.2024.03.06.05.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 05:55:47 -0800 (PST)
Message-ID: <4817a5b0-5407-4437-b94a-fc8a1bfcd25d@linaro.org>
Date: Wed, 6 Mar 2024 13:55:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com>
 <20240229-camcc-support-sm8150-v1-4-8c28c6c87990@quicinc.com>
 <18567989-fb60-49ae-92e6-94e1bc2fa1c7@linaro.org>
 <83fd1995-a06e-b76a-d91b-de1c1a6ab0ea@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <83fd1995-a06e-b76a-d91b-de1c1a6ab0ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2024 08:30, Satya Priya Kakitapalli (Temp) wrote:
>>
>> Anyway I suspect the right thing to do is to define a 
>> titan_top_gdsc_clk with shared ops to "park" the GDSC clock to 19.2 
>> MHz instead of turning it off.
>>
>> You can get rid of the hard-coded always-on and indeed represent the 
>> clock in /sysfs - which is preferable IMO to just whacking registers 
>> to keep clocks always-on in probe anyway.
>>
>> Please try to define the titan_top_gdsc_clk as a shared_ops clock 
>> instead of hard coding to always on.
>>
> 
> Defining the gdsc clk allows consumers to control it, we do not want 
> this clock to be disabled/controlled from consumers. Hence it is better 
> to not model this clock and just keep it always on from probe.

Not if you mark it critical

static struct clk_branch cam_cc_gdsc_clk = {
         .halt_reg = 0xc1e4,
         .halt_check = BRANCH_HALT,
         .clkr = {
                 .enable_reg = 0xc1e4,
                 .enable_mask = BIT(0),
                 .hw.init = &(struct clk_init_data){
                         .name = "cam_cc_gdsc_clk",
                         .parent_hws = (const struct clk_hw*[]){
                                 &cam_cc_xo_clk_src.clkr.hw
                         },
                         .num_parents = 1,
                         .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
                         .ops = &clk_branch2_ops,
                 },
         },
};

and then add this to your camss clocks

<&clock_camcc CAM_CC_GDSC_CLK>;

The practice we have of just whacking clocks always-on in the probe() of 
the clock driver feels lazy to me, leaving the broken cleanups we have 
aside.

As a user of the system I'd rather see correct/complete data in 
/sys/kernel/debug/clk/clk_summary

Anyway I'm fine with setting the clock always on, I can always send out 
a series to address this bug-bear myself.

So yeah just fix the cleanup and then please feel free to add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

