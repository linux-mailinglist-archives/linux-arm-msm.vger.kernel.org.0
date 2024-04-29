Return-Path: <linux-arm-msm+bounces-18809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F128B5C4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 17:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5D91C21276
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4634E8121A;
	Mon, 29 Apr 2024 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SH6ruYFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8B7FBCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403077; cv=none; b=FJ2Q90UM1JuPW+5ZbCl6XzVM57Lfv1QDoF8dGXIYVYfJIJKnBW40+3vNOQGf7xcqOeUi1rglx5+33SrZnmdOBE8D8A8Usmc51qValKYCmcKKilBI50l38/RT4yDIYoGdS6My47NYt5gZn/dizuN3IPYlxrWGgCbuxJr5NIcK+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403077; c=relaxed/simple;
	bh=CF0+bQ9aKZsZc9zLtbJiQgHcvXFtZhReLMYocKgekR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7tmKxE8UmjvWvtIRMOHj9w+krAG6Iuj5XVDCM0UJB6DqwfzlDccXGjtFhL6ERD1DMEnPla0oDegT85qg5J3rEYKBMDcjgq9/r8pmIxXjrTgwqOTxiM249TACub3dzjwUFiTrNwgxFR1jdKQ5srX9SayU+l0vL/K9p084gH83Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SH6ruYFd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-347e635b1fcso3621729f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 08:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714403074; x=1715007874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31VQ8i8rTequ5p8aPySB7cz4A5+WkiVEQODgnvg/Ky4=;
        b=SH6ruYFdvx24ntrp+2YZxIw+aAesp9mYP38ISsyuCN/ga2bBssbqO/bfAhQuZOLQgh
         5XUQ1ErDPdhZWIqTQoYP6Lvzma0q3J2izkKz3pZ4cVKSyNLqbdllFzDQhMdgUiFEWIGr
         WJKYAzTfbna5o60ny0bVZuxh6v7qbhOfZpKb4xL2D87wckTQPPmnxq8HYgV+hooPt/So
         P21pB599C2jdjbHg7JtbZ2O3taY6zuyysi/pY//Eq6nZTFNHIiWFwBPZcYw6pCnd/X/U
         zmd+ZeULdrsAK5znLO9ILwyLrPEMXJMeM43CZfL4p7710W5MC/lRT3UsOJv8DZQY/jpg
         eDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403074; x=1715007874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31VQ8i8rTequ5p8aPySB7cz4A5+WkiVEQODgnvg/Ky4=;
        b=NmA378alZstmDhHENg129GXkZIO/4MbIHfUXO9Y0z4R7pFG6Q5YudhX9Q/BswFLeNm
         NcRYGuYFzpfguzXgAfy7YM+IdPf4DfAXAfTG9w+t07zbrOtV9gZHeYZMxOJ/BZxrYPme
         U7zVaz4oIUWBWMIbSyi1mrNUk0goZPKqFiLjCLfnkW20aw044YBHYntiVPDCNK8Al6VS
         /fZvDIWsDLU6gc6DkdWBLLocyCVyIJQoz5X0pqU6Qmp5Og0fYQ5uuuZNZ9/YPajaNt4k
         CxFBBMhJmgPM8k1p4K8xmzzbD7AmhUJTdIZ+HFWM6S9fIAGueD6FTHqgb8IybIMbAI2M
         7Bsg==
X-Gm-Message-State: AOJu0YwwNvYzAP5BGIBGJ4XN7KZmqo9OUZJRwgWVOOXHv1xQIycnfHne
	9aPWHgRqfRp4IqDM2N+MjnWL22wvS0h8SUT3jDZ7BzKd3Utt4gKYWyfxTGHHIfY=
X-Google-Smtp-Source: AGHT+IH0nxAJQC8gvBRtFB6QxtWcNZSRnogpGqNLRac/ffv7rpxG83nc5lyFsdgVhJDKUej2GoLNdg==
X-Received: by 2002:a5d:6c6e:0:b0:34d:414:5f99 with SMTP id r14-20020a5d6c6e000000b0034d04145f99mr4004372wrz.25.1714403073926;
        Mon, 29 Apr 2024 08:04:33 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm8626102wrt.63.2024.04.29.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 08:04:33 -0700 (PDT)
Message-ID: <557bd418-0e37-44b1-b622-3c824a6a7553@linaro.org>
Date: Mon, 29 Apr 2024 16:04:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, Bjorn Andersson
 <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
 <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
 <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
 <1bbd5175-31a3-4c4c-b2b6-6ee7c65bb17f@linaro.org>
 <312d3cbd-852e-4b93-8bef-c78827712f56@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <312d3cbd-852e-4b93-8bef-c78827712f56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2024 15:52, Konrad Dybcio wrote:
>>>
>>> [   10.404521] clk: Disabling unused clocks
>>> [   10.412141] ------------[ cut here ]------------
>>> [   10.415538] vmem_ahb_clk status stuck at 'on'
> 
> We currently don't support VMEM (which is a small SRAM dedicated to venus)
> upstream, but venus functions without it (albeit I'd expect it to be
> slower or not fully capable without it)

Ah vmem right, indeed.

Just try switching it off Marc, you probably don't need this clock.

---
bod

