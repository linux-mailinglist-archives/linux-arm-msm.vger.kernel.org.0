Return-Path: <linux-arm-msm+bounces-16417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA4898F25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086311C27F1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 19:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DC4134426;
	Thu,  4 Apr 2024 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vu/rY590"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D91612D76B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Apr 2024 19:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712259706; cv=none; b=FMA1PSjIQQjvQZ2xiHCyPXCx+7lHF5/Gu/VwTG/ESvpfqQaCMNUQ714qQ5VmSC/McLj54fbGbjw9Y3ElxZLCIJp1slXPH73SjKxI012OsiqvViBWP36Ke2OxZ+x0SWQThGVvL+sFJMk9PlNtUsVhVf3hMQCDcMihZgD4hEhFOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712259706; c=relaxed/simple;
	bh=aVZcAkeixF4g7qxwWjpSl0cSU4/81MEvk4V1zf7bPjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8QgSMoRKBsChGbZJB6zDP9OfKYaie6OzxAULYm8tS9scQWEXONaXHCjaaXOWLDJ6ZQoC9WZ7jJ0qNz2b1OfsYp25xN4l7cBxwB4BRml8c/LP4ycKpPZHbnn6BJcPKTkhvugHVZZYzQJdG6pDwV+3yIKWqziRkjGDGbiTVU2rpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vu/rY590; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so12800261fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712259703; x=1712864503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hk29yQ8J33vjFT2n+Z8izmlALMtAMOY/5K09yHLiz2A=;
        b=vu/rY590Pyhq+nznz7dKHgYOFFt3l+peBLzFJu5vCajdW+l97TF/bPU/0I4SIg3KmR
         yOJUeuCfIU4Qa0cE9ZT0506rdjshR+iy7VtSm5gK+ZxIgTmczBD4DVWqWmcZpYMSOVTN
         pYhpZmeDzsSLE7vWMMj85fBxSuqvNFJspeYRfpzAsQTD8F0bROl6eVgISMNNn5GlvjE5
         wmvrDhCkgj1SUK5+rdPcgUHwjayLbyNyujV37kWM7cOAP+eHeDvEW4eP4zGiDIEUENsn
         lgHpp1oNSPajmaBBisOh1yNBQXoBNUkDZNJPmYQFJsqCav2SQhTGkR3kP4UiSYGqraq6
         z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712259703; x=1712864503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hk29yQ8J33vjFT2n+Z8izmlALMtAMOY/5K09yHLiz2A=;
        b=pr4uYFD3SNec/1HK6l2Q0eaYjqqRRkix7T3GFUMOovjhuQkxi/cbY7rwckzEdAEvZ/
         Hyagpz2sTHjmrH0QXUFMb3gjB2tZxwyg0F/18gjd7W51thNSxhTHXyGKTzO8oaRzvp/6
         YIX4sb56Y8Gk8+BAOGz8HmX3hDR6ewf+xk0UjtYqzf/i8gvhSUOoD/Fa1GQx5mnGJal5
         gfODgqwBGghJhuQiko8EK72vhJ045L9NPAdVISFUTmCmq5fO04DHrLC4eJ8FXwxav/Pt
         qjCWMbqFAY678LgWcqpQoWUitGfKyDqlOkjyg56hUFMOOrc2v4e3kFvSkZ6XTv9dWN0v
         0AqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUueP0oVIZhOOUpOKB/sKXHUOhxNRjtJbaSAy916/DQSfE5AR8XAOCcqCG+PquxSLWhgPaDL3UHtnWD6mjSSfrhnoTKpu+Gu9FbkYhRzA==
X-Gm-Message-State: AOJu0YyoGKtiei3Xi2fqmye2LJzF3ZfK0wmsuPcoM8DJwJpHjJ7uu4yu
	4La6ZlVP+HuRk2SESWNNs/yXHdFvcpZAqkB8ExZWUoENnKjmonDTd+5wuoyp21c=
X-Google-Smtp-Source: AGHT+IGjdt8eK/21R8SNEkAuKUSS9YVD3OAhgQRK4DIdtp+I52YPNa8vy4Q5T+/BRUqKTzQAx5ppVA==
X-Received: by 2002:a05:651c:210d:b0:2d8:635d:56b9 with SMTP id a13-20020a05651c210d00b002d8635d56b9mr181907ljq.4.1712259702667;
        Thu, 04 Apr 2024 12:41:42 -0700 (PDT)
Received: from [172.30.205.19] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e844e000000b002d46be28dcfsm2239298ljh.127.2024.04.04.12.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 12:41:41 -0700 (PDT)
Message-ID: <8f6236db-0692-44c9-b136-8e0dff714c55@linaro.org>
Date: Thu, 4 Apr 2024 21:41:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add SM8550 Xperia 1 V
Content-Language: en-US
To: neil.armstrong@linaro.org, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-7-fda0db38e29b@linaro.org>
 <05e6f92c-388c-4bc6-a4cd-e9d981166d1c@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <05e6f92c-388c-4bc6-a4cd-e9d981166d1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/12/24 18:26, Neil Armstrong wrote:
> On 12/02/2024 14:10, Konrad Dybcio wrote:
>> Add support for Sony Xperia 1 V, a.k.a PDX234. This device is a part
>> of the SoMC SM8550 Yodo platform.
>>

[...]

>> +/* TODO: Only one SID of PMR735D seems accessible? */
> 
> 
> What's reported by the cpuinfo pmic array  ?

PMK8550 2.1
PM8550 2.0
PM8550VS 2.0
PM8550VS 2.0
PM8550VS 2.0
PM8550VE 2.0
PM8550VS 2.0
PM8550B 2.0
PMR735D 2.0
PM8010 1.1
PM8010 1.1

Not sure if there's only one or the other one is secure?

> 
> <snip>
> 
> With the pcie thing fixed:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

It's gonna be fine with the recent aux clock additions. If you
have no further comments, I'll happily ask for this to be merged ;)

Konrad

