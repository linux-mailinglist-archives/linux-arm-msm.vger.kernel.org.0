Return-Path: <linux-arm-msm+bounces-411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8247E79DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 08:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E6DF1C20CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 07:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8137462;
	Fri, 10 Nov 2023 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U8E/T1ja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58D6FCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 07:51:58 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC59386BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 23:51:56 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso293333966b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 23:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699602715; x=1700207515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYwsC1o7VQwRR69I0rPmEx1znTL885Hc1MLu1V1JF/I=;
        b=U8E/T1japIgY9pcduxoawsI1vz4ug/3Rr5hNox7wINtNm+I8Dxmp6lONbqbAfUoxyD
         K7jkXYDO5NAG79qsXp3VNOsuHGTytsB7WVFZyezp5/gY9Ug0pk0mUjQ0tZRUATlp7foe
         IlItjiIWisZJ/AttN8T+wElzPdTAX8XvH1uc2HlSH6eJ7w9v+SsFvKfQQJLxNJoyBFGZ
         YY4nfu8RbzVgGn6GiHvTtfbY4ZEJwPQOYh3EBpqC/YtrdX3UEtLZWJTK3gXCogEIP9to
         K1B79zjR2g+i+cFhPeIwBHvMLiU8I1GGAGU2AduMcyX29+FaO/tjYEy2MasWMHS/Lo7+
         cuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699602715; x=1700207515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYwsC1o7VQwRR69I0rPmEx1znTL885Hc1MLu1V1JF/I=;
        b=MB86iaJFHmrN/ZEQe1FrhA2NddvkZT8JVGsKxFWy9avJGy5mWV/NK5Ow0wckPkmEZp
         nhlP51NqYvUGp2yOpIAe0v1VOBNiah14N+UFH1vvxvG7WkgOo8hJtG87Df4sXZz+rdeH
         nsiOl9m32uu+R0px2F+jtui26YoDbHnUG/772oTk8CabgOltKc6rESOnO+mNu+gGa0mV
         gzVc7U0ymUsGVos5tYa36nmVO8cLJOJOyowQQefKxfA4zzfHrCvteE4Uh5ST9VyiCryA
         3SeCl/XjNjjWU+kkOgHJrK6WUae2rLZaPgd6sU8083YB82miuvR6e6tbQpG/MrWa5Int
         G8GQ==
X-Gm-Message-State: AOJu0YxJrTzHvFTO9+OlyxT8fch+hM/E2alAcNoLKAp1MOPMv1tf8wXa
	t3SUZNsAi4pLqHo4MHtbcejBXW9p3KG22hp7+Hw=
X-Google-Smtp-Source: AGHT+IHg/QIYw2OXgB9dNLxcdZx17IiOhf1etl/okla58xuEi5GbbWBry0ifJh1A/gw0zxUPxwbjtg==
X-Received: by 2002:a17:907:3e20:b0:9dd:7b77:a37c with SMTP id hp32-20020a1709073e2000b009dd7b77a37cmr6453189ejc.57.1699602715505;
        Thu, 09 Nov 2023 23:51:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id p27-20020a056402501b00b0053f9578ec97sm793876eda.56.2023.11.09.23.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 23:51:55 -0800 (PST)
Message-ID: <f400ae74-0fbc-4f68-8306-cb31d9df10b7@linaro.org>
Date: Fri, 10 Nov 2023 08:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Update the videocc resets for
 sm8150
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-2-quic_skakitap@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231110065029.2117212-2-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2023 07:50, Satya Priya Kakitapalli wrote:
> Add all the available resets for the video clock controller
> on sm8150.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


