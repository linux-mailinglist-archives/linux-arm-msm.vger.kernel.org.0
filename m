Return-Path: <linux-arm-msm+bounces-48823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58CA3EEDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35ECF166AFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFF8201011;
	Fri, 21 Feb 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gC1nUEXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA501FF1DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127094; cv=none; b=YqIS6j7+z09Xfk2jSBSbPNWAUyQrGfC4Z7sBXwnTtIveN0oiiXrvlHuopG5uG3tIfSmFFCfUlAUepTPyqYgzVg6jf6TdwIoCjAoKKXDJ7LfQpFRANuJlaAG1E08StlvrrnKMCs5mGRp+W2nSScGqLWQcVPpO7nw9YwBdaS7CVm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127094; c=relaxed/simple;
	bh=5fKjhI7i7R84ePsbwCMmQ2Uc8yhbr1ef6/GUW2izjCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sasxH0dViha5PeepjpaqfbNK1R1uVq78NO1xpHprI1bq/1yO/+OqGX6E2PkB5XXjwPz2At2p8+fueIe/PpxKnLBRkn7Gnip3sqJey3kyLabrBtfzlK87gar7UU7LfJVsLev4B9+RxFGv8ish0rVkx4KLfmgKDt0hVtEGd09xKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gC1nUEXo; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso358602a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 00:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740127091; x=1740731891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQTi2q1M3Ecydyaf0mJbPcKZ48ZT3K7a4wEqpYuLS6Y=;
        b=gC1nUEXolQnEUnCmdNnpFs5nrkCJgHe4an4PA6V82jJReY3hwfPBajk92sY9RiPHAK
         EhCRMJAqIxUt4u8w52UhQ+ggZK3A1vD9E1i6A91NThLqbkd7ewk29xx3xzGGdCs+XZWI
         scDyku5nlFTq4NyUI870xVDoHX649CobjKwhTJ8eWnY6ZF84wmDZOxF+Yi5E8FOYOZuW
         kl8Tr4dGBywrlipuwr33HovsnCKwJZigWccitrJI/HlunHQgE3Q9uzMqrOXW0qJbrTbR
         581IyM1ozhHLGFuhtunIj/VmD+p2nHQDX2LiZJeoZOpH4A4AmVSxrtRBLtIIpvEDhJsb
         WzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127091; x=1740731891;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQTi2q1M3Ecydyaf0mJbPcKZ48ZT3K7a4wEqpYuLS6Y=;
        b=eAt4a8lH1XgI74eXkMLYCMHeigTuh+ZuGoDTMlOB1EGviRKy/ki+lPE3Dzxg8zYI73
         fw12DTsmofEEaPzl89pRU9HBQ5VUMxV4pikUrxQR4Q0UakGSq0V4zXBfr/2flmWQEmmL
         j4QRU+X2r+bAGEwrISEyD22+TNfK3ASNDQuDMdtz+wZuAGr5SZhRnop3OwE/PPMgvXYF
         wNVeX2/brBG7u/uAXKAAldHdlWp2lNhr1tsrhCzDqFBLZsFMmQB0Cs0qeZBI0aPHTyav
         qErIuvNw0hSPo9+oa+VX1bmUR9CZNJ0wtfyLDM0w9AxHGEAUHXkJ+SIrcPxjmeGGxWcf
         vkQA==
X-Forwarded-Encrypted: i=1; AJvYcCWC4HJEA640oNt5mdRpTX6wh7eIBlmQg135EalkGlkBFb2TaUncfGfPINwgZT89bT08aoLrzqEa6Y7a3Ai5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9fp2ybQuRZ0yVjwhjx4y1eaOJTXK9ChV0cVACmy7osKrSExOs
	ss301E/1yXy0HU1lV6LWzLGoA9ttRnM6XQiY3PCH5GhEjKwcFy0BemYfKZXw84c6HGjAWrrXmoO
	+RhGdQA==
X-Gm-Gg: ASbGncusg5t/e5aTsUG3Wp/guwVSxSFaQDnQpuG5pFAOnFKrZI9UrR2ECppLcW6gc4B
	1BX00Wm+rVivffJPaah1U/ZkTeBkM7ea+WFCUGSObV1MtFN9ubYyRtNOgB1jvCzgf+kE9lZ/GJi
	Qp65iiZu/YrT9U67SPAsbDO/otAwI7TXHU+ka8/4GQVrO0tGfT19qDeivLpf8Ms1uxyAwJHgwae
	EQLzoZaB002/ELZX0pEj+uxzDwlhTizwVJ7d9l7UOBBL+YlQAIqqQTLs/KrATzamV/Hb6ZYu2E5
	gjzJYVcsO0a9gr3DlnICs9K/J/JGtXgpSEyr6BFp6zGFFLPNpqNb+9cE98NHNoqSh/14qc2MMHM
	6M2X8
X-Google-Smtp-Source: AGHT+IH+wsOTuZkkrqo1pReQ5oDSMb7JHPak1mfMXwURX2L/lcM5tuQ5zPYFkh7VyZ3CvvW3Y9tHNg==
X-Received: by 2002:a17:907:2d22:b0:ab3:8bcc:3d97 with SMTP id a640c23a62f3a-abc09a46c73mr89644166b.5.1740127091401;
        Fri, 21 Feb 2025 00:38:11 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb84e8cc53sm1128943866b.62.2025.02.21.00.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 00:38:10 -0800 (PST)
Message-ID: <e4630796-49b9-4a09-b511-fffff1352350@linaro.org>
Date: Fri, 21 Feb 2025 09:38:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750-mtp: Enable CDSP and
 mention MPSS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org>
 <20250220-b4-sm8750-cdsp-v2-3-a70dd2d04419@linaro.org>
 <dihnqsdjqxq7uhomceeiejey7dezfyvhpnyc3zyzhyuyfdjtec@d4ruo5xbxid3>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <dihnqsdjqxq7uhomceeiejey7dezfyvhpnyc3zyzhyuyfdjtec@d4ruo5xbxid3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2025 17:19, Dmitry Baryshkov wrote:
> On Thu, Feb 20, 2025 at 04:44:13PM +0100, Krzysztof Kozlowski wrote:
>> Enable the CDSP on MPT8750 board and add firmware for the modem, however
>> keep it as failed because modem crashes after booting for unknown
>> reasons.
> 
> So the modem crashes on MTP, but does not on QRD?
QRD was not tested - which mentioned in that patch - and I hope someone
will test it and tell me :)

Best regards,
Krzysztof

