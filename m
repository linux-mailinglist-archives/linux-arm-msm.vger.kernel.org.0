Return-Path: <linux-arm-msm+bounces-911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D67EF03B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96651F28466
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7533119441;
	Fri, 17 Nov 2023 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdSQzL/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027CC127
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:24:48 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50aa2abfcfcso37276e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700216686; x=1700821486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o73LkhBrE6yDY1mbFZM2m+HTDKhAaqVyfeh8KQogz8A=;
        b=OdSQzL/IcwLWgDPFqxppbbMUGDB9JYS9klZTWFlcXrDeLoPAEZFX527eGPP9oXYVWW
         trHEDtEq93Ci2gacknqmrjVWDm00JKZGSFmpHw0BrbltWANgmGoAbWYv146j69zi5NPU
         sjInknUBWQmt1QhZGa1nlzo/MZE20ZCrayC5ExPic88bKQL9yp44jIfEFYQrBq13nbVY
         IxLPxNVFksW1ki0h3L1INNki21PzfwVfmiWxmAJFlMR6USS9OUOHFJ2Emm9oMlHa7nWQ
         A/uZI4oabF0mx8KjL0s0xmH48/lp7MfnGSTZQ6+uvRpgIfvwClJTtKCTyvL0W54pLHJ0
         uE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700216686; x=1700821486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o73LkhBrE6yDY1mbFZM2m+HTDKhAaqVyfeh8KQogz8A=;
        b=DybmlozqqMNPQYFjAiarI7t4dXMZWosm2zzPcVkYPBCQ60RkkKxrEfYh3tMAVtoCyq
         5kaUfya3HGCWtGMgXGToSD2F+Iku114KVzFMGL2LgaKejZ/X7DdAo0ChMo7IbcuAUEeU
         IpvG90LeYMEt6v6xJWtPcx8P/N8gymqObnjP/SnAeopAVbxLqM8VD6QjnDf4UiZ1U16t
         jf3d9rHCj47NJp83qQRYtgtHQi72+4rJQVgcK4zYtiZ/bRUZjypw0vi0AvBRoKDuQ8r8
         6TIBf42Jk9TsPZW4undBnZuBiO4uEA6A9aqwJ28qlhsApnehw0eNcN+uvaRLMQWHoi7F
         d4lw==
X-Gm-Message-State: AOJu0YyBhfHceQoWieCpXEUdx7i7vr15bRFbQ2gtlo0ZM1UNF/39dkZ7
	4/ucNKrq9JwnHvhyjycCI45Oww==
X-Google-Smtp-Source: AGHT+IG/gL9yn8RBag2pQ5TmNhywUp7z0stEM0uETbIbEKL2FmgUsAlBhAtPzVHqbIv9HZX8h3ZZvg==
X-Received: by 2002:a05:6512:3f1b:b0:50a:2720:eac2 with SMTP id y27-20020a0565123f1b00b0050a2720eac2mr14371838lfa.4.1700216686107;
        Fri, 17 Nov 2023 02:24:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d14-20020ac25ece000000b00509447753c5sm181454lfq.308.2023.11.17.02.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 02:24:45 -0800 (PST)
Message-ID: <a66be060-9941-4c4b-84bb-1fcc554791ce@linaro.org>
Date: Fri, 17 Nov 2023 12:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] arm64: dts: qcom: sm8550: remove address/size-cells
 from mdss_dsi1
To: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, -cc=kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-6-quic_tengfan@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231117101817.4401-6-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2023 12:18, Tengfei Fan wrote:
> Address/size-cells will cause dtbs check warning, because mdss_dsi1 node
> have not ranges and child also have not reg, so remove address/size-cells.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


