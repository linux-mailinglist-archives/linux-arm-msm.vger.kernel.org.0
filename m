Return-Path: <linux-arm-msm+bounces-290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633E7E6B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7FF6B20BAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 13:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC9B1DFC7;
	Thu,  9 Nov 2023 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQJSCPKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDB01D55F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 13:31:05 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1229930CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 05:31:05 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40839652b97so5725515e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 05:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699536663; x=1700141463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7wSwsJDVC+WFzVhVIJKKG6kw5XK1WEXSl+1a+Sx190=;
        b=pQJSCPKsdvs+fLj7nRr1UkQOIaMhVssnuKSJi/Gm/m38ytCDaHkHBmZTSzDeFGI8g5
         92M+nD2/sj/EYcdinYTquRW5PoRE+Jpn/b37VSTPhNgyF52rMGwKNucz20UBV6xlYPGb
         2uePFK1hf75Qu8wxhrwCJNLAKamS2ExLA9PaDTh61iLLDneFaws3dmaYmspiSu8lFyl3
         tLq8XIdoZVDyBcUvj1mikkUMi4DJ/vhCv8oy8rtx6wrIbX+WXj8bhrEgAJN2yzmiXZE/
         gpCd9nG33VfBP4w47+022ZmwgnmFLA2gk4JJ1XVKVqbmKAOcIDvfoCBop9KNdFaDeEp3
         gr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536663; x=1700141463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7wSwsJDVC+WFzVhVIJKKG6kw5XK1WEXSl+1a+Sx190=;
        b=Xm7bL3QbFwO3MnbwPWoQ2WrHDqSSEuEomdK0e66puQsUVNEK7uiMx28XBxjYX4hvza
         EumA7kRxm6MMVbDz8MSsZt0sJKFC7n2ZPlRYGkZez9UFThIGw0OwO7L3Li2BbjW3Ih6G
         5dzAxRWTt2HpCPqWWJ4zzVCTvkfVQd6lL1QLGIPXH83SI/xOPW1VpMDVVyvS/IG9JEeb
         pcnXrDhEzBuYBAn6MWa/Invntow7pStWNrPebBYnlJP7naFCDcvsUtYiEWUkyHk92zin
         D9MTBq/4/2Xq2JrB2umxLSlL3I78aG3FATGjXDSlLa/ZXtM9/7J5QKgy9TgyFly4KuZW
         XFvA==
X-Gm-Message-State: AOJu0YwHQ3p9cC58Y7XSmqdTE08ikX2XAg36ezXYuN6JrwlOHlBQG830
	FSsLRLi9HPLgowgY/PHBdKxjXw==
X-Google-Smtp-Source: AGHT+IGlzYfCp7R2ALAusnJakOcIsFFY60CLzrvOpftGcSSMR7es7S+xeCW6gPM1nWx4ps1AB5k1BQ==
X-Received: by 2002:a05:6000:1842:b0:32f:7ebe:3e5a with SMTP id c2-20020a056000184200b0032f7ebe3e5amr5224216wri.50.1699536663530;
        Thu, 09 Nov 2023 05:31:03 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d640d000000b0032d96dd703bsm7425418wru.70.2023.11.09.05.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:31:03 -0800 (PST)
Message-ID: <038711cb-321d-47f0-82ad-44965116a4a9@linaro.org>
Date: Thu, 9 Nov 2023 14:30:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sm8250: Add wakeup-source to usb_1
 and usb_2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
 andersson@kernel.org, dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231109004311.2449566-1-bryan.odonoghue@linaro.org>
 <20231109004311.2449566-2-bryan.odonoghue@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231109004311.2449566-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/23 01:43, Bryan O'Donoghue wrote:
> To test out a different GDSC change I wanted to have a USB keypress resume
> a system in suspend.
> 
> Adding wakeup-source to usb_1 and usb_2 "just works" for me on rb5.
> Consistent with qcm2290 and sa8775p add wakeup-source to the dtsi for the
> SoC.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Maybe we could make it the default in qcom glue somehow..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

