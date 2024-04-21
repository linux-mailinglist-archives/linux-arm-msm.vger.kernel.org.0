Return-Path: <linux-arm-msm+bounces-18078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B48ABF6D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 15:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08CD2280ECB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1212B168B1;
	Sun, 21 Apr 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVG+tIgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220C14006
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713707725; cv=none; b=TkghLbe7YjnQvC0af9Gl0WyZaIsXd5Dy9EUMwnI8BoKvaXqHr/QgbNfvO+CzsbO7iIWgEuvesw/tS2Dl7KxHtY5E3WludNrUjQ4SCKAjb26cnRrIrC6oioXQ/G4TYL/DYATZJwje0AHUBPIpbxUdjWA7SPYoWen5kmAvPymr89I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713707725; c=relaxed/simple;
	bh=5WY9ZmFX/po3yro2cTpsxF7cNgrPQao7dI88pEgGP5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8ypyo+slNVtNq39EoO2HcWe4HXE0doshK6Siu16QE5Fks5xt3k6q5z0NFqDd1adpuqoPxrwF5NIcX870I9H81i5Gp/RxF4x4y1mmA8Xl3THRKoFbBO3FEBfq2UfDQOmY0BhzJd+xZ9kl02sA1On47SrPFI+jYgyOIiKqiIL1po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVG+tIgD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-343f62d8124so2878044f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713707722; x=1714312522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9PnemVxUHccS6J/FssdoCvoHybmMHnNiHLkwhHSyMCQ=;
        b=rVG+tIgDMaEOvchA8IAfTpDTBbWrW1MDtnykhOBNHuDwweH17amxUp08hWD7eUuFFg
         xYpRMMMtQI0fKFTPKdof54WPKdo+U4btMOIsOHugXonJJsMTidsFZapIk0vGCpkpEVHG
         JfW3Vvwu5eLqmAGSM/XtYkgRUU/HKydxMzuW/IiL6mX+Cm/LRjB/7QE/rQ5B0jTIwIgU
         kHDTEAai97xGwDV+QVBwxMbmRkqaPCwva5bcvVsQ/ZRLvAAy5lVT9N0xoFo1QvGkN3RC
         p4nC6GhV0zV9jeWr4ekwGqSFkknBo/foISoMriTCRO4ecLMtPIFJInC54WZA9Tv3gUob
         2xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713707722; x=1714312522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PnemVxUHccS6J/FssdoCvoHybmMHnNiHLkwhHSyMCQ=;
        b=GOq5dHfoPZyOpaxModwoFWtb38Rl3tPaVIFqmIeon8p62iWAcKsCVe6RGQ329PsO1g
         lhm2HKpEBM7FOx94FQDw+8KLQP+wYWmOLsOELt7lWTR58K2lYEzlJUL2fahpJ2fjiEp7
         hbESaEToKSKpzSQPeWU7fBKS81bJTUxGYe2yMryW59w8atXSpGLXJvsAA8Gw9wljFK/P
         Y61MIK3zho9wBRi88SSaiJ0w76VgEE4XqKTS4deM96KQ9kI3fMRyQfVujtuPahGer6c9
         upXfiJCDav/63IiVQhM1V5xI0u3Bbg5/oUworCmfRlsUaF/C3hVE5sPDbQk1AwChCqv2
         u6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVb8Zp+gEXq824JZ+7lSn/7V4MgBtfYkmpusGFavzAf97Um1hF580e1xspVKErPrGlYeYYDRqVsxip9rQjoY/YK09gEVaqAtk8xcR3DYw==
X-Gm-Message-State: AOJu0Ywq/ZxKhfQ3aZaK1uCnVTiSewQrLx3kePOXfRCmlqG/zJWL90p5
	Zy81hOUOHj8X6297MC2WkI7uIODMUN3vHl4itKSGssq6WrPxgXN+RU+bNyYxj3NtmvkstRmFV5H
	Y
X-Google-Smtp-Source: AGHT+IF92LowgyQdnK/1ouTrIMFjwYmHLzLofktgLfCSyNrPIX2W6jSk4kkOv/zildJrGb18GHlgvA==
X-Received: by 2002:a05:6000:d05:b0:345:72af:769b with SMTP id dt5-20020a0560000d0500b0034572af769bmr4483039wrb.38.1713707721689;
        Sun, 21 Apr 2024 06:55:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id j1-20020a05600c1c0100b00419ea5fb0cbsm5523580wms.42.2024.04.21.06.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 06:55:21 -0700 (PDT)
Message-ID: <af2701c5-034c-46fb-810b-81d5345f4084@linaro.org>
Date: Sun, 21 Apr 2024 15:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: defconfig: qcom: enable X1E80100 sound card
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240403094422.15140-1-krzysztof.kozlowski@linaro.org>
 <6sfk3n65fbq444ezbuj53litc3lizuhqbmk6mwyngja3orw4fu@ez2bqiub5235>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6sfk3n65fbq444ezbuj53litc3lizuhqbmk6mwyngja3orw4fu@ez2bqiub5235>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2024 20:13, Bjorn Andersson wrote:
> On Wed, Apr 03, 2024 at 11:44:22AM +0200, Krzysztof Kozlowski wrote:
>> Enable the sound machine driver for Qualcomm X1E80100 sound card, used
>> on several boards with X1E80100 (e.g. X1E80100 CRD).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
> 
> I'm completely lost on your strategy for these sound card drivers!
> 
> Why is x1e a separate driver when we're shoehorning in qc*6490 into the
> sc8280xp?

Because x1e is different. It has 4 speakers. sc8280xp does not have four
speakers.

> Why does Srini answer me that the compatible should contain the device
> name (qcom,qcs6490-rb3gen2-sndcard) while you're at the same time adding
> a platform-based compatible for x1e.

That's defconfig change... But yeah, probably x1e sound card should be
tied to the board model. I prepared and sent the patches much earlier,
before qcom,qcs6490-rb3gen2-sndcard came to discussion.

For most of the boards I would just go with generic soc compatible. I
think I provided rationale qcs6490 discussion.

Best regards,
Krzysztof


