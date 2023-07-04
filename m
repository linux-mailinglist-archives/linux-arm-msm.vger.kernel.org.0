Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEEB746B85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 10:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjGDIHr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 04:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbjGDIH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 04:07:28 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FE6173F
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 01:07:15 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso435416266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688458034; x=1691050034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckr6+/gekGirtr50OHDvvWLDUFdItGBZUEI8k9LrOlw=;
        b=UNiyzEjhJ69LSQbYfLtTq/zgmjbXfjdCu6wtuRmFMo7YCqIrk7zudyJiKR4rW6awIl
         dnJLi00KvdsXpgtREiyEZ0OMm7YfeWrhHt2tzGVoORIJwPag0JkN1Vyv9OFvwHu/evFy
         VrSa2Aryuus+aEtKqcICoA6GSIUy45ropXyB8N6dpD8/xQxyE5hSHMzJONNjTj3EBWCM
         5fZ4rG7hP4vlIs27OdVGvA+jvfi3qPMkdFN0qQmhCsT5sgmoIv/fPJXp0RQ6S3PP0vQu
         Z7AocFqwsIksd5j76OUGrZ5N+JEV+nSBIEBgHVD6uG8tuckPPXv/kU84GOrHpXeDiCbw
         Fc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688458034; x=1691050034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckr6+/gekGirtr50OHDvvWLDUFdItGBZUEI8k9LrOlw=;
        b=inBdAG8GTbB5z9OcxUsFeXId3Evwg4x0IvvliuwLmZ6Mph70BOM3wi3IE0nAzs14Kg
         +I9J7VgIWj7TrSrJpaKDdpHPEfykJydXBfADuJKUzaOGwwwFtE5ZLv8JUwpR5PvrsUUw
         uJTrWG0DuWO7C9sS50h4w53DWtiYKl+kDEz5tjLNfgPP2D4lpAyirm9gDpGV3xx0JMoE
         d1xn9b+9sHA8QtDDKgHSIgPoSHpBPQxHmJBSY3P94A5wGza8y6pE/MVQT+v0ScSn9jDS
         BYnGvJzK/nIlHtn1eTDyXg8DslpPSXvq6+DYGvHXjtEWK0se/+A0SCF8VVaauGl4Tr4I
         4pDg==
X-Gm-Message-State: ABy/qLYgy1b3WYliBiIi5GV3ZwKpRosdzpqKiv6WS/dCwgys7gOu0bXr
        DlNSUOOOM+p5ZI6rReHyjw7tUg==
X-Google-Smtp-Source: APBJJlEABByJGfnIEipqN5UYmx124WgDwPOwjwjrXDp8XkPeDqGP+rQevwMp6ZwRWae2hIQqNmzgFg==
X-Received: by 2002:a17:906:4e52:b0:992:9a5e:3172 with SMTP id g18-20020a1709064e5200b009929a5e3172mr7727541ejw.59.1688458034232;
        Tue, 04 Jul 2023 01:07:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z9-20020a17090655c900b00992d0de8762sm5975404ejp.216.2023.07.04.01.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:07:13 -0700 (PDT)
Message-ID: <7299b735-d613-1306-796c-291f03f3b361@linaro.org>
Date:   Tue, 4 Jul 2023 10:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v12 01/10] cpufreq: blacklist MSM8998 in
 cpufreq-dt-platdev
Content-Language: en-US
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20230217-topic-cpr3h-v12-0-1a4d050e1e67@linaro.org>
 <20230217-topic-cpr3h-v12-1-1a4d050e1e67@linaro.org>
 <20230628155656.GA542106-robh@kernel.org>
 <20230703041701.ntv2f2h7z2welmvn@vireshk-i7>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703041701.ntv2f2h7z2welmvn@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/07/2023 06:17, Viresh Kumar wrote:
> On 28-06-23, 09:56, Rob Herring wrote:
>> On Wed, Jun 28, 2023 at 04:00:40PM +0200, Konrad Dybcio wrote:
>>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>
>>> Add the MSM8998 to the blacklist since the CPU scaling is handled
>>
>> s/blacklist/denylist/ or s/blacklist/blocklist/
> 
> They are already named allowlist and blocklist.

This was about commit msg and subject. They are not named like this.

Best regards,
Krzysztof

