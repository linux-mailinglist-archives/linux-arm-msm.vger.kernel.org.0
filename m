Return-Path: <linux-arm-msm+bounces-22560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD99906835
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF8E1C22011
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 09:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261FD13DDA4;
	Thu, 13 Jun 2024 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kQumoIDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4306913D8B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718269871; cv=none; b=b+PwWbR66JLaS4nwbYMNtcFD15UYhnvDhNczI1AJIVr9BokZTBrHo3XioRUUWQYoxFfBlSD5CFL96vyYlCi699/vgc5u+wGiLKQjB6Dk3ngiEbxdyN9iuDfl7zDWaQof7mVTiVx2iB+wmjQejHiSBlReOeoVwCxdQUk5XcjDYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718269871; c=relaxed/simple;
	bh=XbkxxAE0o+n8aBNZeIkGPbKXffCFUoK/zqH/o0Uwb4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2T6h28vMAzv9kv3Ujq/IasJrkYkI8hwvfDiQPcO7alaxkJlnAdVEk5aMapXr8mf36RP8yFrX1Z4vM8tHfddYGk4mhdbigM18b63vaYCw+2MYo2pYyMGFq4Rpji4m7titXiUyVZm4CwYMpvFKhenk4WIB/01matL2Jrehw+rG/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kQumoIDA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52962423ed8so988015e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718269867; x=1718874667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ssbYSRQgHiqW8KXtbPaweqL5MRA5/R+69ZodellWjGg=;
        b=kQumoIDAp4N9txyjFS0rq8Ioa0g/ZpizZgqoMMQA4TT17vXUGczTmGgwILs3+nemoG
         3yt1zByjh1ut9WYXGAYPcCMSEz+uFf8i2uXC7CowSt7cAx6WZmSzPaAU4MfGzTe1Sbcs
         j6ceWB6+fXR3JfQljb5NqZ/oTf9IjEx03iSPABwfvM+XA4+DDOtLq5lwtWiizQskZFdu
         jAP89s9THoBxCDKV9PtmeIwaFP2WXbHNNz259YyWQUi3Nr3XsNScrV9SAhwaFCim1ylR
         gQTc/TmGnM2D4ehw5JUjjIgBCSNte1K2H/fphLS0dtBO1nvUPehJOzLTLWDOTbe1RyWF
         IoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718269867; x=1718874667;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssbYSRQgHiqW8KXtbPaweqL5MRA5/R+69ZodellWjGg=;
        b=QKjijPC6Cf2iR/GwtUWC2JsZam91rP7tmNHsAOUhgOXOFHyL9m7y5H6JvUMWER6XNM
         wHqFJSg2MvfQ8XLL9+frGu7AMulKPTtFAFg/aNDt4n3FSdVOex2Guk0SzPCmP/Yrdmwa
         KY3JQVmGonw7Y69KqZGPU2UguQ2OQYPMiFczCVLGBGXVI1te3W1QTRT1tIyrec305pdI
         TV6fkXlbmvr4HzECnn7eVqQuDbnYPMZkwJodYs3k8QWw8Ujj/yAc4HbxvxLACegC9/2b
         mV5Rd78ZQQVKXXSGa5bLQcWrwUwSa4bXNjdINwP99+t88ppE32jwuR+uSL0RuymKvFMM
         t++A==
X-Forwarded-Encrypted: i=1; AJvYcCWziFlmZbdlUHt4x2a6rd6snSgsW0iuyBe4lh4w4ELFB6O90r5t2IXPJ51W4bVCxz/U8GOmDaHN0s2IPKSVEZZogCGor+jfgRwbzoHHng==
X-Gm-Message-State: AOJu0YwYpOM8m8co2KxO1d60NRCc841CPceDGYWb7Z5Ah+jiiKhFWcqv
	05+pECsXfVWEtw6DniECvlQfp/1Flf1pj4Jsp+WUwawA3+U54qbNHn11QrHvYkM=
X-Google-Smtp-Source: AGHT+IGZckTwTpPwJpRSZbj+Ai6kyEIH4Kh4Mxy/9XGztt/MuSZp3E6p1vdUrofR1qJZ34Tm1k6n9A==
X-Received: by 2002:a05:6512:2349:b0:52c:898b:d6cd with SMTP id 2adb3069b0e04-52c9a3b8f30mr3546072e87.12.1718269867352;
        Thu, 13 Jun 2024 02:11:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320c16sm16121435e9.38.2024.06.13.02.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 02:11:06 -0700 (PDT)
Message-ID: <9e9cbc0b-f9fd-439c-93d1-054179f7b07f@linaro.org>
Date: Thu, 13 Jun 2024 11:11:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: fix DAI used for
 headset recording
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240611142555.994675-1-krzysztof.kozlowski@linaro.org>
 <20240611142555.994675-2-krzysztof.kozlowski@linaro.org>
 <90f5ad41-7192-4c01-90c0-ad9c54094917@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <90f5ad41-7192-4c01-90c0-ad9c54094917@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2024 09:45, Konrad Dybcio wrote:
> 
> 
> On 6/11/24 16:25, Krzysztof Kozlowski wrote:
>> The SWR2 Soundwire instance has 1 output and 4 input ports, so for the
>> headset recording (via the WCD9385 codec and the TX macro codec) we want
>> to use the next DAI, not the first one (see qcom,dout-ports and
>> qcom,din-ports for soundwire@6d30000 node).
>>
>> Original code was copied from other devices like SM8450 and SM8550.  On
>> the SM8450 this was a correct setting, however on the SM8550 this worked
>> probably only by coincidence, because the DTS defined no output ports on
>> SWR2 Soundwire.
> 
> Planning to send a fix for that?
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Not really, because microphone works on these targets and changing it
would require testing. I don't have boards suitable for testing, so
let's just leave it.

Best regards,
Krzysztof


