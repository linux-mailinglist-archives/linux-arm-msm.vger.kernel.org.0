Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2A163C015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 13:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbiK2Mcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 07:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234303AbiK2Mcb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 07:32:31 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5835E3ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 04:32:29 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id n1so11949925ljg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LySOg5YSwp1qBO2C1Mp1oip25m1mN4U6Hh8RpfMuxEY=;
        b=ekokT4vG23f+uEi6WmaWiC00GycTSBm20sCsH5PGum6ojDlXjZPI+dL2hIyWp1z6dC
         ahw4RIOqEcny2leBOldh6V2BG9RNJ0dwBMAjv8mmeF84O//4iW6PV8I9f4E+lNvdWG4h
         U3jEeRgxDzF8lG/8Opyl10+qqN3QkVbk6WNX8QsZ8lwYA30dVED17TZeVGnwBQwpDPLj
         pID6F14tllAJdCA2InLKQbffrXpCaku5cZofiFckwxOg0IUpOriwnBiOKiMsPaefwedJ
         TpA2rImSFqhIkTVq2yGJkZW2+vnjRTE+0OU7drzGZh7mlNHT71jve6EYkG6k4oXWwZe6
         Cz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LySOg5YSwp1qBO2C1Mp1oip25m1mN4U6Hh8RpfMuxEY=;
        b=LkR4p590ndoGdCbbvyoTr0HH6RGI6mH1gnSjMNsARk5kR5GHUAvFWZgcCB02vKnXQy
         niNYjs9HvILMZhnv6RzTYODi42T7f5hPyUGHMipM7Q4MgEPn5JGjqYHBJyUAreCUVExZ
         voE+OicAHIwfyuAGE414+pLzz9b/kuQzQvW6KErbwl63G8bPz3qZPt/pXt+MZiaQIE8h
         Yj/rIY2RY3wtCdMojrS0GmWe1rqTZrS6ZMFaJGCmnWI+K3Y/68SR9gnP1h5JLdj8E0CL
         BEVFhipKWODgrjZquGfTU5fvhQG04i6VjL+3GTqX4Fhh6tjKlobtXqAn4VAJJSgneB0U
         xW0w==
X-Gm-Message-State: ANoB5pm3MmDY3pfleszrHrI8/ZS3gI4c8lVg2dlO6O96wgq2YIgAAOmA
        X/ZBFNj8Lee534zkNoG2e9lxvg==
X-Google-Smtp-Source: AA0mqf4RmYLfszhyGnAXZzHrl/Ru8cK2UMAAKnpznCpZWxZL77hxq2Xw5Dl7MspATUunI6r/eaOSeg==
X-Received: by 2002:a05:651c:90a:b0:277:309:73cb with SMTP id e10-20020a05651c090a00b00277030973cbmr19066323ljq.371.1669725147906;
        Tue, 29 Nov 2022 04:32:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512360a00b004917a30c82bsm2158677lfs.153.2022.11.29.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 04:32:27 -0800 (PST)
Message-ID: <17d67d48-c63c-600a-79fd-0f8ef50f5691@linaro.org>
Date:   Tue, 29 Nov 2022 13:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sc7280: Add DT for
 sc7280-herobrine-zombie
Content-Language: en-US
To:     Owen Yang <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Matthias Kaehlcke <mka@google.com>,
        Abner Yen <abner.yen@ecs.com.tw>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Bob Moragues <moragues@google.com>, Harvey <hunge@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221129194620.v9.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <20221129194620.v9.2.I80aa32497bfd67bc8a372c1418ccc443ccf193e4@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129194620.v9.2.I80aa32497bfd67bc8a372c1418ccc443ccf193e4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/11/2022 12:47, Owen Yang wrote:
> Add DT for sc7280-herobrine-zombie
> 
> Tested-by: Owen Yang <ecs.taipeikernel@gmail.com>
> 
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
> 
> Changes in v9:
> - Update "Series-version" to right number "9".

How is this a change? So now you should send v10 with saying
"series-version to v10". Then immediately v11 with same changes?

> 
> Changes in v8:
> - Change Patch 1 commit log description to "Add entries in the device tree binding for sc7280-zombie.".

Why do you put patch #1 changes here?

> 
> Changes in v7:
> - Add "Tested-by" in commit log.
> 

Why Tested-by? And where did you add it? Point us...

Best regards,
Krzysztof

