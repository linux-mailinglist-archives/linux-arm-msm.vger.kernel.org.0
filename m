Return-Path: <linux-arm-msm+bounces-4757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56114812F90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CC681F22093
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6C441215;
	Thu, 14 Dec 2023 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0YEhtqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C086011A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:59:08 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cb21afa6c1so98809041fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702555147; x=1703159947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBNHMT7LqHLUU6LGBqOeadsJyO5Y3oN/Q3Spl99QuKQ=;
        b=b0YEhtqbm7ZJJYQs3SMtwEhmgmOMf5FH2SSRFIxxNwgcWS5p3ZA65MIr1i6n9B2gIT
         1i2VvFDKGLYbSxnPy6IrJpa1G8eIVtQw9QUM4vG+gExYPrjVtEr9lHG1KNRoefKw/iEL
         p63MtTveRv0UH+87k6AXTRtl4owkz1hXG0dvZ0F7sChtP2AQhURgfVcIIpRFbNcjGFlI
         QioIG8+Mot1y+Vs4rm1k7AXcVsH6rn6Kx3gmvMCSut35SG8D36JDMMFqI13RuRFazpq1
         58vaZEATd0wY/pg+QhVxY1eGpocxiyuKv0Z72ECgnM7bMPn4my777JiB9jjbEMROM9mx
         vrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702555147; x=1703159947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBNHMT7LqHLUU6LGBqOeadsJyO5Y3oN/Q3Spl99QuKQ=;
        b=TOJcKp2sPXvg4vExjd6eJ54YUQtQchrWnuV/QYzGc8KAkOkub041BAEQeVLoIiPT30
         T76OU3sQll6BRTQeLPcIK/Xg2DsldVtqXff+C4G5prPRY4kP/rMI+I7dFQfRfK4Gwh74
         U9xAVlAmATSqc511aO4CnNeLlyu8jioCU5mwJJLzVnQ76Po9nhdRCc28ILIZb/1MgZmn
         37SS/yq1vHSYlrlVELxVJhakSpQl38ril3mYrVTyFEvvyXrMrQxKnQI0FbVZiX3JBfPm
         PT5uLFOeAjtT7yYFUTwM7AN5BemEjuIpmenaU5RVFj8UQU9tGdWRkCb6EaQCcTO+N9dq
         FZgQ==
X-Gm-Message-State: AOJu0Yzl7mRppgcVegviQR+EIoXDgXrE3cQEH8Ia2chY3ugA9M/dnAB7
	VNGUgbu5RQ+RG0Wi4RT6qRSo9g==
X-Google-Smtp-Source: AGHT+IF8sQq2hCKWuHAD9trXlrokL4kEzbH8TJA/EFxemSgc5XKtke2dKBh9a2f1+Ry3QihsMAdJzQ==
X-Received: by 2002:a2e:a7c8:0:b0:2cc:41d4:1c58 with SMTP id x8-20020a2ea7c8000000b002cc41d41c58mr627354ljp.66.1702555147028;
        Thu, 14 Dec 2023 03:59:07 -0800 (PST)
Received: from [172.30.204.158] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002ca0cb6f476sm2037042ljm.60.2023.12.14.03.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:59:06 -0800 (PST)
Message-ID: <be7fe545-3a5f-4af3-89f6-c22326689465@linaro.org>
Date: Thu, 14 Dec 2023 12:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: stats: don't crash if DDR offset contains
 invalid data
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
 <20231209215601.3543895-2-dmitry.baryshkov@linaro.org>
 <3ba4da84-a17e-47ae-8958-2484cd6cbea0@linaro.org>
 <CAD=FV=XX4wLg1NNVL15RK4D4tLvuSzZyUv=k_tS4bSb3=7QJzQ@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAD=FV=XX4wLg1NNVL15RK4D4tLvuSzZyUv=k_tS4bSb3=7QJzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 12/14/23 01:59, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 11, 2023 at 1:11 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 9.12.2023 22:55, Dmitry Baryshkov wrote:
>>> The stats ram on sm8150 platform contains invalid data at the
>>> DDR_DYNAMIC_OFFSET. Most likely this is because the platform didn't
>>> support DDR sleep stats.
>> Interesting. Can you read back DDR_DYNAMIC_OFFSET on 8350/8280 and
>> see if 8150 has correct data in there?
>>
>>> However this platform uses generic
>>> "qcom,rpmh-stats" compatible, which implies presense of the DDR data.
>>> Add safety net to prevent old DTB files from crashing the
>>> qcom,rpmh-stats driver.
>> Yeah I'dve never thought there would be garbage in there..
>>
>> I'd advocate for simply not doing anything wrt sleep stats if DDR
>> stats are unavailable though. The QMP handle can stay, as there
>> may (I don't know) be more data available that we want to export
>> through this driver.
> 
> FWIW, I'm getting a crash on sc7180-trogdor like this too. In kgdb it
> says I'm on line:
> 
> key = readl(ddrd->base);
> 
> ...and
> 
> (gdb) print ddrd->base
> $1 = (void *) 0xffffffc0833a3149
> (gdb) print reg
> $2 = (void *) 0xffffffc0833a3000
> 
> ...so I guess my "stats_offset" must have been 0x149.
> 
> Can we get a fix landed or a revert? Thanks! :-)
Right, I guess we may want to revert it and I'll try to get more
info from Qualcomm folks..

Konrad

