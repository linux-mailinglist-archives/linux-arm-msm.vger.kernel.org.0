Return-Path: <linux-arm-msm+bounces-4250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DA80D3DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38CC41F21682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B585D4E1A4;
	Mon, 11 Dec 2023 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQpYFpDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896CFC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:32:03 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1f33c13ff2so405381266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702315922; x=1702920722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s/UnhJJFhJv72Mo0GfEYdwGM1aW2h/5wD9gbIJDTJ8E=;
        b=WQpYFpDWEDJQ4oDo+6PPYIbPSsM7N+e0QXdC5CgSa5Jo88oXRLu031YG2Pn2dX0pR7
         lg/nVJx92dd0y703E/Y9Pf9z/FL4ChEcp/QneASVNxAiuWWx3kksp00J5CwpFmm7vKKe
         2qox0moch0OXz2AHkikl6VLxxt3JGT/xGofZYKfhMZzBJXLmnFXa9m4t7R4JdSej906E
         GzfRKSdfH5kFCNK2qDY8WwNt/NdiTBlQPvK3bZsMEn5JEv+wMJpcKJKMxZdZEd02RWDd
         Sl0LP2N4ngMbWLGnW5tQu1DOoGUNyyYmFB9yWVQBejb2umYPDF1vDgt+joUAEM/XvLbX
         TyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315922; x=1702920722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/UnhJJFhJv72Mo0GfEYdwGM1aW2h/5wD9gbIJDTJ8E=;
        b=u3rLccnXqGKaegdXVjMGhQhts2LcZ7mggoRYZzuWxIHrn+dW4+8aptPyMNWvRm2kON
         oDoL6JOSrsIGlUa3kX9hxL4sXo2Cl6AXZaILl5eSnXhf3+LzDV1BsqK+uv5braF/j+YB
         XjUiIvEkGqrFpObjqQnjEeBHyyMPbYYSPdrSebkyQlnOxpvwAZiMTBW4JqADEAf0a4Ip
         jPkIKQDx9lVu/m7LqRdYGK3zi47XCiZJYtrtIJn86/lRrtL3LzagA1nFwyq7sH7hxWjS
         o03jeR3ftrc4IeSwZEySYdiAQwsl9iGAFbwgZd3jfbL2N7qnVPlwSSRw20H3ktW9UEIy
         n+Yg==
X-Gm-Message-State: AOJu0YyD4CK++gv2Q3XC1h8xq0ofiC9pSAybsInb5IFIEdWvvlgo9t5D
	5nbOkKRDckonkJ42hNcj37+viQ==
X-Google-Smtp-Source: AGHT+IHReIaY/WQ2l+1mkKbAFPvx2OncWPm7jOMW3JeO0fS+svIC6pbCoCqaSAGs6aNZU8LI3n1mXg==
X-Received: by 2002:a17:907:6d02:b0:a16:3da0:dd36 with SMTP id sa2-20020a1709076d0200b00a163da0dd36mr3238682ejc.48.1702315921972;
        Mon, 11 Dec 2023 09:32:01 -0800 (PST)
Received: from [192.168.36.128] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id vu8-20020a170907a64800b00a1d5c52d628sm5087827ejc.3.2023.12.11.09.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 09:32:01 -0800 (PST)
Message-ID: <b7eafdba-5f10-45f1-bed8-55585fb61e94@linaro.org>
Date: Mon, 11 Dec 2023 18:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
 <20231211-cardstock-elevator-3e19f9d41ac2@spud>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 18:29, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
>> Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
>> RX macro codec, which looks like compatible with earlier SM8550.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I wish you'd send cover letters when you send series of trivial patches
> like this that could be acked in one go.
(+1)

Konrad

