Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA257B424A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Sep 2023 18:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbjI3QpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Sep 2023 12:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbjI3QpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Sep 2023 12:45:14 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5226EDA
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Sep 2023 09:45:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso241757011fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Sep 2023 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696092305; x=1696697105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OuSsmCweocHw0xEUHsPMkncs3DWhyuvlq0QOPGgJ9Q=;
        b=ll2QEGAPdc70HRn23rXgBNoC+UYgVixIlGjnu+JrHm8cNwFVSl5nzs44NLXKp8nIMR
         2gcyk58x6gNVRUFrXNyMR4HGIymyt0h/c0Sqfa69Rv10wWOp8PMNBXyMv/8EQSS7K+Hc
         ph6m7D+n4KcJk0zmjtbfcKcvxSIINzbgdVHeFWnhNSez3YmDRUnboGQl/zmvv53ckwkJ
         rBrcF1TS+syV5AkHcuQ3kc3IUM4kQd4k52vi0uE6QHAPKiLt3SNwQHGleDaNXQm+F1NP
         rWzX6xxw2GZDOTz8hACNyd0ZtqBeMb/xlavaHBzEGdERvGfUyGoE13tWE5yHIOxxhbBO
         MnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696092305; x=1696697105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OuSsmCweocHw0xEUHsPMkncs3DWhyuvlq0QOPGgJ9Q=;
        b=sCJualHHmIyYWNwihlExMGdJcbtIe18xIALQiYQI3AxVmjGYI3bYEYLy/81QReK5Dk
         JUkefISrpnhUF5muR09BejBXdxmGOft8A1UyylhBfOXawPK6XPgsS1eukyyFBkkYPunz
         MJ79jDRI7gR2M5A1yTF3BgmhpVTSyl0xjL2byExafP75tnzun4CHBiDDScUZPOwUnT/h
         aGDZ0zCVSH7XSvJWZMymLA+DqTzk2WsHLF9hQ5czYUKjtfWp09S0ZboixH+Mk+mMlwOq
         j7CX5XzLh5KLJwp73wCWPHrs+z19uLwUQ5tPZQEXtq0cYv28hPfjZEmTgMy8gsClzQG6
         TPyg==
X-Gm-Message-State: AOJu0YwKCv1EDwf6mngDfzAAV7g6bMAiQZfP2DF9ml5MfUmS4UOuL4Jq
        2GBDxsklUO4RsdJLJ8Mw+oJ2PA==
X-Google-Smtp-Source: AGHT+IEztcIi6uLfQza9ishSim0Sae5baVP8tRWAZ590XGKSfpNLbBNUdsVVExc0/L1tshkqYWv4iA==
X-Received: by 2002:a2e:9b49:0:b0:2c0:10ed:431b with SMTP id o9-20020a2e9b49000000b002c010ed431bmr6392317ljj.23.1696092305499;
        Sat, 30 Sep 2023 09:45:05 -0700 (PDT)
Received: from [192.168.156.60] (public-gprs529506.centertel.pl. [31.61.187.163])
        by smtp.gmail.com with ESMTPSA id k25-20020a2e2419000000b002b9f1214394sm4507731ljk.13.2023.09.30.09.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 09:45:05 -0700 (PDT)
Message-ID: <43473e04-ac33-179e-4343-e5c78eef3faf@linaro.org>
Date:   Sat, 30 Sep 2023 18:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc8280xp: Don't keep display AHB
 clocks always-on
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
 <20230929-topic-8280_ahbdisp-v1-2-72bdc38309b9@linaro.org>
 <ZRfsvAJIdlmOWjf2@hovoldconsulting.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZRfsvAJIdlmOWjf2@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/30/23 11:39, Johan Hovold wrote:
> On Fri, Sep 29, 2023 at 03:38:53PM +0200, Konrad Dybcio wrote:
>> These clocks are consumed by the dispcc[01] clock controllers, so there's
>> no reason to keep them on from gcc probe. Remove that hack.
> 
> Eh, how did you test this patch?
Oehh you're right, I didn't notice that I still had clk_ignore_unused :/

> 
> The GCC_DISP_AHB_CLK clocks are not modelled by the clock driver
> currently so nothing is guaranteeing them to be enabled if we were to
> apply this patch. They just happen to be left on by the bootloader on
> some machines currently (well at least one of them is on one machine).
What fooled me is that despite not being modeled by the clock driver, it 
is defined in bindings and referenced in the device tree.

Another thing I'll fix up!

> So this series is broken and should not be applied.
Agreed, I'll revisit this tonight or next week.

> 
> NAK.
> 
> Also, please CC me on sc8280xp and X13s related patches.
Omitting you was not intentional, sorry!

Konrad
