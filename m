Return-Path: <linux-arm-msm+bounces-25802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9F92CF8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 12:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1003CB2B941
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4186194A77;
	Wed, 10 Jul 2024 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTw0zjaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23F19408E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607800; cv=none; b=YdBA92IbAT4LQFq/uNx+KBl8+48Kg1Wd6b92BdeSRfTPA+2dBal627E2Ibht4GS/VugkQiakvIB5FBnVXfV18YL/6Nyy3N8WJr9Qo1qdEFoCmMveIjlMjUsS0XHHRxttgdPU19SsBt+NvFgCcEXeFG9VV7XnLg3R5itwy9thz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607800; c=relaxed/simple;
	bh=etA9ynmuuhP2Cxh7NuFkHx0OD2pU8r2OMJpBINpzlRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbHeUa8+ldf0oFGO0LOLc5818c3zaXR0EA0KSRfrT6ZrMUqC6J/hvvGSszrPZwid0ztMJpByhFP9cJt1joAoZh1MvsOKt3woqpAWJAGc82I+uSZuo+5y3d8Hq8U2sj1tfRxE3T+58cw12zo55ihUhNSiuxAkr3KxLlKlakVlp4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTw0zjaN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58f9874aeb4so6967175a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607797; x=1721212597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WR7mw7gKYjGzb9zvVhn0agY8T1HfSSj8ItVRnrEskco=;
        b=zTw0zjaNW0Fp8HjQ3mrz2qXul6xDHM4mm2i96U23lEVgp87j+OrxivvfbwZsDC5881
         7TNufgkWYsK+MBDq3aJpB3P74SNulMDV0n2uhVlJIzmJJuJGtCA9DGnjRdze6y85KrEs
         DywI142Jaq0EvqgWPrHEBdmOHimdyDPymaSySWzOOHa94Dene92O22RYXIDbvbjDgbD/
         m8kM3XjcvSg4wQ8jAaZZCUjGPr1y1uwjh7P4J5rWMcZXAXRD4f35ilgK7IPj8krbHF3g
         +NwnAO0z3foTTOHdem6ogIo+3R1+11VWCTk+26F4+CUGU/pxdQd4Wibv2/EO3wyLgzRA
         gYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607797; x=1721212597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR7mw7gKYjGzb9zvVhn0agY8T1HfSSj8ItVRnrEskco=;
        b=MVj3YPd+fcqEXFH33wYmAId4olU9CaM6F7XbBMWmhz0G4+r5W8G66ZgpMl7NzqpxKI
         emHNJeML+74a4+Eh6e4MXBWZokoPHjvhyjf+df0kmToNgIhHI0eQ731xbLMTzeIP1Aur
         bIbPHYryHWV7RcUrtuS+d7tOSgIXwEjaFNqB16vqU/MLBtReNivPIldAvRRU52xTa8m4
         +8ZrDzjVFy+MMS5SLDxD8wALtc49+UBA5/D8bFooYLAZPPcypmb4eM/ZjjXujyGhcN22
         pDbGjc9dg9ToSHhHNM6Fr2kIdis9D1IbKbodKWLLfdu0vdq7oFHlaEplNwpdo0tHt/gd
         WGDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8DljGZ6xa+6It3vzLzABIt2dRj06hl3cPfSeW/puwbN3uKnuAg9rhmi+wR1Es/tDFKfgRXJNHeVjdgSBydlgb1/44lrA60bENqJy3+g==
X-Gm-Message-State: AOJu0Ywvw5D5EEG1bRum1UZuONiwK0+pOJNPYE3qf6q2VUd04qadji30
	4rhSFI/4Jp0YhRzAcIRvqIlUVHv5gcOMGMHpaLE6BsS6Whk0m9rGQXHFLpuYEL0=
X-Google-Smtp-Source: AGHT+IF2+1yAmmAjs9k5rECEvrjhfdA3+rgkMM/MFm3e+0gJD1Om+NiViIU4ipJrVm142j3aHY8aPw==
X-Received: by 2002:a05:6402:5187:b0:57d:4ca2:fdab with SMTP id 4fb4d7f45d1cf-594ba98f563mr3546243a12.3.1720607797327;
        Wed, 10 Jul 2024 03:36:37 -0700 (PDT)
Received: from [192.168.105.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda30a46sm2050740a12.89.2024.07.10.03.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 03:36:36 -0700 (PDT)
Message-ID: <9c1cd4b3-22a8-4c5c-ad16-a7ef6d44e44d@linaro.org>
Date: Wed, 10 Jul 2024 12:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: Add LID switch
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 10:18 AM, Stephan Gerhold wrote:
> Add gpio-keys for exposing the LID switch state, similar to
> sc8280xp-lenovo-thinkpad-x13s.dts. Only the GPIO number is different.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

