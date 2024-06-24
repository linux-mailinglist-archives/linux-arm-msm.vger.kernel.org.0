Return-Path: <linux-arm-msm+bounces-23918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2E91482B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDC0B28554D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57541369B1;
	Mon, 24 Jun 2024 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XUPrU3CI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200A13777D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227472; cv=none; b=IcWrgVuL2+y63lyl1FuJhVNQvgTRFwCCWx/5CUv24gXQ2wb9uFhpTwy8WH6uoJUocQZpSWA5Gy6r307OF8cPxAhg+y3WOvOkR5lN7ZpCh6WMoyRA1TxgE52iS1PZrG+tqPZcvGfU+HS9PUrSBqBOFjzIzFCQjmevvMDHP/y2BK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227472; c=relaxed/simple;
	bh=cjWfRPoUM+kGidtez1iF9cnu5CNL0MfmfOCuAcIaZPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2P0/ZY0QtzK1/fNYkOW/4+GzjDfjJkjIhv1vOYaDdmTvhfxLjeoiUe3RQl1X3xilCf+bnGzumXJLQtvrB6nXTKiBv3WqnY9sZ6YNnd2ICHCh8AViTvFI1fTqBofjhwa1+0cWP134PTCAG+XoovXsHZiOLtzQziqd5AbC0kH14Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XUPrU3CI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-356c4e926a3so3920783f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719227469; x=1719832269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDL7t+SO6FpEVHJOT7hEdo87VnVcjGt67Fs7ZWvppOs=;
        b=XUPrU3CIqb4Vo0x3ZTK8cacf+YCn2uHqwidjDYT3aEhZiRcJB1JuLX/i2qjgT3A4AO
         sAinGIaIV1uxq3u/Q63a5w1QXG8YmUpRDCsexwf+QNO0hP9PAJYcOO/GaKwDWT7I9dcM
         Uk8pWxXLs6IbRW67VLsCCmipl9iwBL5TBuaISgi8p69dz8xF29WRap9vbSVhvTLCNFuH
         XSUYmhhSGQQk/bPSXNQhyPetaPx75BRboE4FD2YJTYZ4OcSM7Cf0ppdNzaikMIaMQ2Eq
         0azAroUYWfzCMauiQKQq0l3YLMm0s3hUYozAGmr3LKz2RKRxf/L4Nq9t6KegqZTIvysx
         w3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227469; x=1719832269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDL7t+SO6FpEVHJOT7hEdo87VnVcjGt67Fs7ZWvppOs=;
        b=lUwP7f/wndYENmazafpjhji0EtwP5On71UVNtol/bBxBMMEQUbnBx9NuO99pVHQlAh
         jFe8OnEs2uk4z7QB2n+Fr2ofyys5YtiwBwAu8cy7MjRvyAPXL62v1KKX4hXTU0h2OoZS
         oP7SD5N8Wd+cm+ecWF9osERazXWqUAHbPbyIndz96A4cLEIBu+fGRNaz6Vjb7HinUa0J
         PAI34C7iSTv23WS7eaQZn6hxcfPG9uU4AJ5Hmz6X2L74753CAXVj4UEuTIH0FQd72pEE
         U6Z3nziK1s0uYFmOuv8UB4tMZU6N4bILiRI68XnNuGCBg0OFFTVs5SWmq8ZlVyTRsdeF
         UfNw==
X-Forwarded-Encrypted: i=1; AJvYcCWGaHvQKIhxPfuUKCcE7rjf+WDUUOpZmfdKcPWJSvdINDiu1GH6Z0tyYSzpv/cb8bbFS96biAru3ukfD0bnNtoK16A4rc3LAiMIyQzRWg==
X-Gm-Message-State: AOJu0YwW0a/c20Io+B1TRntvEbypos4eyf0hm7Mb4wJBNCJxtaWRtlmz
	4HV9bdqoQYYbM2BwTG8WeGmXTcruoWQQIoSxUZmUckUIUcKW0TQRoEtYbI0/8+I=
X-Google-Smtp-Source: AGHT+IHsNIFkIn5zWDurXmz+KezncSE1I8CJ5v3+mRHtknDSg8CUWGb3vMtBZIEehl7QbIPVPs+sIg==
X-Received: by 2002:a5d:5f8f:0:b0:366:f41f:8cc7 with SMTP id ffacd0b85a97d-366f41f8d56mr1539592f8f.46.1719227469493;
        Mon, 24 Jun 2024 04:11:09 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3663a2f66bbsm9770082f8f.78.2024.06.24.04.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:11:09 -0700 (PDT)
Message-ID: <ea57a3a1-1037-4d59-a384-50c98e1f9387@linaro.org>
Date: Mon, 24 Jun 2024 12:11:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller
 resets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
 <p6ooqgfwld7stzevozs7huztputc7vpc7652wx6rvg4cly5mj5@fwrzeu6alhgq>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <p6ooqgfwld7stzevozs7huztputc7vpc7652wx6rvg4cly5mj5@fwrzeu6alhgq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2024 12:08, Dmitry Baryshkov wrote:
> On Mon, Jun 24, 2024 at 11:55:29AM GMT, Srinivas Kandagatla wrote:
>> Soundwire resets are missing in the existing dts, add resets for all the 4
>> instances of Soundwire controllers (WSA, WSA2, RX, TX).
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Could you please point out the driver changes?
If you mean, soundwire controller driver, it already has the reset support.


--srini


> 

