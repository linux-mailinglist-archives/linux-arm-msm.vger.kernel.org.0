Return-Path: <linux-arm-msm+bounces-69556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEFFB2A1B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3749D1B23469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F3F320388;
	Mon, 18 Aug 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFoIhoOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A932039F
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519988; cv=none; b=CHH8Z9BGDwQ0U4MxmgnX9/SOHhczHrSEDalM4+v00qr49P0WM9AwC9Snbc/KUdf4Z2rsagTd9Ym3lAPTe9l6ZfNJsK/F0RJ25OBGEP3UeCvmFeFo4WSBjC8u7pZ+Zwy/DQLa1u1o0abdQ+2XA1qHLImg22K64+0wB7naQqo20u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519988; c=relaxed/simple;
	bh=IxSqomWsfMT5ONL8RJwY3IhvQXdWmnmFEs1c2Jz69U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrecS4NBzLuxNJYGZj8orHcUjpx1ZUWu+jKozxYRN6++twhUPTsleTcNKMt66hLT6qE2TSFGqe/zcFQMQlhOKbNv/Zcj4T0ko0WJmu+eyWLwVYho4YsKqKyEhCDADEsIT66I3SKgGKsiTdp+u5KiLKM/OPG0BABN0dvPBKyfwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFoIhoOg; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b657548so574149a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755519985; x=1756124785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cE7USIQEiKoT28pPaBE7y652DJxGhW0lyIjlfv4ZivY=;
        b=RFoIhoOgdCP3S4R2yELKHH5f4aHaMzbx7VubPaX9OzvPNphAZJOsR8Dc4wpy0IkDVD
         EEtCvVOTLyX9mXGZLv0Dx6uVu0fh0WyDrAzRSK09gkZ6IUsEo77wQxzsSrDVd6gOc7BB
         jRkUwXHLMe++OY87HyPhaZL5G5FSmVu5Qui4zUuA8EZbBTLMMfYCwsY1pr7dTitwka1w
         jiT8vRvw/WqdPoZ/8VW+jLwJdXjyBY8IbYn1cgf/woHxsoaxA1ZbXhqRz+C0z0LL55ZF
         59xJ9Bb5upblMpBpU7iLiVAgySlxpDAV0eWydCymRztYXOk+isYpjAmXWxuuw4hAgxTi
         51HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519985; x=1756124785;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE7USIQEiKoT28pPaBE7y652DJxGhW0lyIjlfv4ZivY=;
        b=t5tbP1u3LYcTvYCCO0xI60Dqj9vCA2NazcHdjaGdikX3YpC5EYOOfXhMwolgqZK0dL
         dcwzzXIF7S2jwmQ6Y+zOKBqYhlYJriR+64O36HTdHXlrB2O+g9xKHhDATumPJDiHB0GO
         jzRwHK4faoMHnTwbbbsj08F+SJQME7juJyJKBdqtLweEM21jbNTCLEdtpn0LNVEgf/2p
         BTXLTT94z9Sy1AuRL8CeMAEcfp1KXXWns+/Nti8c8P51WiTSdl2dJ+zv39yhPc+c+OuA
         irNi7Ilo47Z0WWSFmBIzqOaUaV21fqKS5/tjQPwuOGZvNJvLDLqj/Hbw4bVygTtYWFoQ
         4m6w==
X-Forwarded-Encrypted: i=1; AJvYcCVsowlqRaKb5cnkpGKQABxshFqhMDewjl8yNrg6FXNBtkReHtEGSKcJiuSHT/fl/slTmx3ILbUDWxW2KXpR@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQjsbfuRK4zSxd+1emo2KO+IAH8qZ0926EygTAtgSy2sfkOMj
	ZOeAZTAxlKQkIsROydliX+hpTE5XjvAQqVprQCJeJCxrqaVuvzUZ99HKntnLDMebBdg=
X-Gm-Gg: ASbGncuwC7FMGqwZkeedZPC8agAtLIyxfnWKme+J+FAzrM7BWuGKHRLedW6yblBlOzW
	VU5gb3H5dYSNA6Izj1ovu5gPmn6tmraJxOdN7TXn9AiX0AdB0clPvgsFfdi7zbFSl3L6RVh44sC
	Sn8JMrgEBDkpqDSGi2Qxrre7TUqZyRbEn/I0ff0pt7PigMxafIuh95jx+nfxYN2mZI2yxz9KC4T
	WhwJK1V1v4QDbeShXtYC3Ap1iAQEpau2t8zdQrQdAPN8L5Iuuz5vOKu8mzwbLBZ+IQ6+G8OQYMr
	kRavJNBReLQgZ5BZ7SQv5MBKkj+pMA5LiioIh42ICL7xtfszbzm0iVnU9KQENtsVrz8cXgt3Ywc
	Uk4stltLv9YSG2iHFNRvSIYZUhP+jLZk6TuiAlQoAJo8=
X-Google-Smtp-Source: AGHT+IFta6pWGXS16hHPFjkUsfmlZELxOQU0bejGNHxAQwtH3VHtVtoPjmjK/BYV/E5T/ldNyla1Gw==
X-Received: by 2002:a05:6402:268d:b0:612:e262:929c with SMTP id 4fb4d7f45d1cf-618b04eb2eamr4921132a12.0.1755519984966;
        Mon, 18 Aug 2025 05:26:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618b02b11bbsm7058299a12.53.2025.08.18.05.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:26:24 -0700 (PDT)
Message-ID: <3348983b-97f2-4ca8-813f-b00fe60c59be@linaro.org>
Date: Mon, 18 Aug 2025 14:26:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: qcom: audioreach: add support for SMECNS
 module
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818122240.1223535-7-srinivas.kandagatla@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250818122240.1223535-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 14:22, srinivas.kandagatla@oss.qualcomm.com wrote:
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 790fba96e34d..cc45c94f023f 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -31,6 +31,7 @@ struct q6apm_graph;
>  #define MODULE_ID_MP3_DECODE		0x0700103B
>  #define MODULE_ID_GAPLESS		0x0700104D
>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
> +#define MODULE_ID_SMECNS_V2		0x07001031


Old diff hunk.




Best regards,
Krzysztof

