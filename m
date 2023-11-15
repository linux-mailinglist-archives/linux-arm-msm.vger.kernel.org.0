Return-Path: <linux-arm-msm+bounces-720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667F7EC851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC68D280A25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257D0381AB;
	Wed, 15 Nov 2023 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmWb2h69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D965A3175C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:20:00 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1120FE5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:19:59 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c595f5dc84so11066741fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065197; x=1700669997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icFERsbKRy7KfOqu0tTtbnE8bN6Q90hl/QIfyS74idg=;
        b=QmWb2h693nxK9kNemXp1n67tsqcifoZNbYkEgbGGc3Zw/CQchcwDj5npLnzlGJBmqY
         J7Ka6tWKEExoSxSNZEXsA3+OiN5i8P5/mk995xZLtZDG0fPvOfhIqoopma345ehMlxZG
         sApULPfNprkzeYx4jG8383XHNtvNefC8igWU81m2twbJC0N1EquVQjZqAkHgil9npB8a
         9IMQxymignKe+1TUgZIwpMs4iFqBlV02id79uh91qsdKZ/EBkfFh9kW522ZZYNmohD37
         Cdsn2M1ZqvUqyr0w5nsuLjqwK/8xCdWKBdazEWgbuOoJW6++pxmq9A1Tjm55MVnOHALX
         4shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065197; x=1700669997;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icFERsbKRy7KfOqu0tTtbnE8bN6Q90hl/QIfyS74idg=;
        b=qVGXR8D9FSmL+8Hi/jzDWpDvrM3bXQ5IdCpVNWxQEisMYPHKh+FLQ+RepyoWxlhLhE
         5JPBYPWjOtMo9N/8R5ML0KSqZDFOnBSfuUNt1ldzKXQd6OyPmKqKP2Wb6p38N0PAcOsx
         t8NRbanuEECdniDhKeEFiFBgUPP7Azgf/QMFxUyX13Bqj7SsPK5L9x1QugW2Ag6OJZh8
         bkF+8ZSmHDosrL4hSUw7joe9RCFS1dmC5Mff90pLGbQ3kxkxtPJX5foNT98DgHWBByNQ
         hWb7jHfbU6RFT/JR29SzWKxBnUnNRO7RCD4sazuXe0tpE4f68tWX7J7egz0Xw/1xV7CP
         0xUA==
X-Gm-Message-State: AOJu0YwtL5JZyUAU/QJzvdCSGwUTDJCSiDIADcAJ4hWYmgMl/MQFo9az
	lV/ZLVMaPfL/HjaxA1KgwWZRhg==
X-Google-Smtp-Source: AGHT+IES8N0nnyIJL4H2hctBPCl60o8JV4reP/XkECqkfH7STBbygsVf2WKbM5aI8v1zxUkoSTMF2Q==
X-Received: by 2002:a2e:9ec9:0:b0:2c6:ec37:fb5 with SMTP id h9-20020a2e9ec9000000b002c6ec370fb5mr2117421ljk.10.1700065197245;
        Wed, 15 Nov 2023 08:19:57 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651c0a0800b002bce77e4ddfsm1699622ljq.97.2023.11.15.08.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:19:56 -0800 (PST)
Message-ID: <9dec865b-36ed-4686-9d25-1e11e3fc25a8@linaro.org>
Date: Wed, 15 Nov 2023 17:19:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: correct LED panic
 indicator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/11/23 10:56, Krzysztof Kozlowski wrote:
> There is no "panic-indicator" default trigger but a property with that
> name:
> 
>    sdm845-db845c.dtb: leds: led-0: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
> 
> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

