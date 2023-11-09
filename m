Return-Path: <linux-arm-msm+bounces-291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE27E6B40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 681EAB20BBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 13:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BB81DFD5;
	Thu,  9 Nov 2023 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ze5365LL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8AC1DDD2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 13:32:46 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C8230D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 05:32:45 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507c5249d55so1118928e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699536763; x=1700141563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZ70LYAYE9xQrDLEMVJLJF6eR1PCaiutjX/36P8JvJE=;
        b=Ze5365LLA1UY+kykLgiQS1kfMukCLjwMxzIu/yLWWCdCvoSPyny/iGnSC5bdSH4Y8B
         RlXn36XqrTiXT34/OsdH9WlKEp5lo+bAqPXMIo0OqV1RXO0noeBinzubGSmg56/SGtkW
         phXBEe+zhwJgckapgjMzCv7j4Hyoel49itRNQT4yQVUGvpayYgij8TwJzvShyACuF7SF
         ccDDme6khnhUZsiL7yT7+Xwx2ppDr9nUmFxM7SCoEJxoyZ86T4eUKWkwwf3nLmESnEih
         Oze4EYovh4enBQgFMhebz7NYoJ3XrVf9httSc205TujVyE9xYXCz2rZeDHXw3N+EnOZ4
         YQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536763; x=1700141563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ70LYAYE9xQrDLEMVJLJF6eR1PCaiutjX/36P8JvJE=;
        b=q89zwLqjKOa5rqs9jDfrvKDkkYLbmaL1wcYoe8lvPFwFe/EVYxYaZb7OrrOL1E+QIL
         n0wiE5OB6FzT7bwjsbfOLlNLpbDFqemn3y8IekcVfuCwLISk9D2ez3ZG151ADqBGwl16
         yizlJfDqQko09Re2EIhOOWCc98bJfvWUmyzRwuR18gQcA2JZ0UeYCp0UZp/exwhTC9jO
         XQZbjyYUtX+8XTv141nYcuh+0fJEfNiaw9CLypI8HJBghKVwiu0X+VY1Gwn5lgCepGuW
         Ny2oa5xxXUc3pMrzYcqDHmlxbu8+x/zRarprJxva8aSCP5Eft40SqfImbfBokOUZrECH
         Zr6A==
X-Gm-Message-State: AOJu0YwNmhBg5wtjqz9SoXKFFRnzeMi5jUkp+X7wtSwGozM2yOsoZPQz
	jrMrCGJYXXp5F+W6TWgQvSvPpQ==
X-Google-Smtp-Source: AGHT+IHC3LcqD5UK3SBl8IfD15Q1HWMFZopZvCjS0WqaNSQXQeVCGjyalRlm1cFSxUGAHStE05i5PQ==
X-Received: by 2002:ac2:5637:0:b0:507:a0d7:bd19 with SMTP id b23-20020ac25637000000b00507a0d7bd19mr1435455lff.13.1699536763675;
        Thu, 09 Nov 2023 05:32:43 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d640d000000b0032d96dd703bsm7425418wru.70.2023.11.09.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:32:42 -0800 (PST)
Message-ID: <ac253acc-ae03-460a-b982-0a9f780ddb5a@linaro.org>
Date: Thu, 9 Nov 2023 14:32:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: camss: Add sc8280xp support
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/23 12:30, Bryan O'Donoghue wrote:
> V4:
> - Drops all _src clocks and _SRC indexes in series.
>    True enough the CAMCC driver has all of the appropriate SET_PARENT flags
>    so there's no need to represent _src clocks. - Konrad
Thanks, and if you have any manhours left, doing so for the
already-supported SoCs would be great as well..

Konrad

