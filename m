Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE416C85EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 20:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbjCXT1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 15:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjCXT1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 15:27:16 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D094B1B327
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 12:27:15 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r11so11959490edd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679686034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqZs2i/FLy+ED4dLZjowRQFkaHxvBAh+o8hN0bmWyLI=;
        b=KVn8cXn6sXVrxXuf8nrF+qMJiC96QpfFwWzGi0AJOMIXNA1WbuNvCCIOwSHeyY7QuY
         2aGiXOkDBP1efMYKns1u4VjrdsX6UBZaVSVMGrcmOeB50NcFvurY90jzSuzriCWhmopr
         XyQ23MoNZT1HAnni3RE5Sk4UCeFIgfsZpRIdj6m1hDT3jjWaKajUB6dNoi4jitu/3SqA
         mdRpebq18inaSa6zisiVZksSO7XbFDvZ1r2H9Ci+c/CUKYM0RW95Go5QvZZg156S5X6S
         EAbyWkd6Sek4ooGqTwrfTJCkOUy1lbNh9i4uUG4maTTUI3jNi3t4MUI78wdKzQ3YtM8l
         nBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679686034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqZs2i/FLy+ED4dLZjowRQFkaHxvBAh+o8hN0bmWyLI=;
        b=M7cVYZtFJEA2l4UwxHruijvKRyi7sH3Lfgk1voqNCzxw+nmHVUpnnwrjIKaPvdGHK8
         0ZKRkeuDTon5tBTYJJpm6nMzEQZpzj8MMxdKvd9XiZCh/1JcsXFfbk6l4ivuBmO+hpkh
         yckzwFMuL0O0iF6aHOVPEIjM3F0ttRtKJdrY2aInHma7RaKWCThCAU7CRGKCZB2Z7Nmh
         I5DzbyArawRnof+O1lXmrwiiOu62Els2OVC/I0HkUhJAU0VSrBOi0JGI5lSYbm5Mv3ei
         h3weW6MGmiNbvdLBtwLcMhZO9NdCBgEoYJzKf9lGBz3L2gyh0Q5fjk+OF8D6WyEPOI9V
         pGcQ==
X-Gm-Message-State: AO0yUKVZTAHJi5qBfasFgTNgJSMBRffnsW7hWhEvlMqz++9Dbiu8OoGy
        swiH4n+0W2FRqUS3a0yZDoNmmg==
X-Google-Smtp-Source: AK7set9TEoYzluKH8HHNN0BPwpvbjgxekVvQlU++HyMqrJZpjHWj9ML3a63GwAtC8Qcp8LL/1FOyoQ==
X-Received: by 2002:a05:6402:a53:b0:4bf:b2b1:84d8 with SMTP id bt19-20020a0564020a5300b004bfb2b184d8mr10928336edb.19.1679686034296;
        Fri, 24 Mar 2023 12:27:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588? ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170907985300b008c327bef167sm10682737ejc.7.2023.03.24.12.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 12:27:13 -0700 (PDT)
Message-ID: <fdd51d3d-a1fd-c3a9-c578-59a11c5213de@linaro.org>
Date:   Fri, 24 Mar 2023 20:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid
 properties in cluster-sleep nodes
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
 <20230324174518.2arvdglqqixmxqcp@ripper>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324174518.2arvdglqqixmxqcp@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 18:45, Bjorn Andersson wrote:
> On Fri, Mar 24, 2023 at 10:28:47AM +0100, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
> 
> Is that because idle-state-name and local-timer-stop should not be
> defined for domain-idle-states or are you just clearing out the
> dtbs_check warning?
> 
> According to cpu-capacity.txt local-timer-stop seems to have been a
> property relevant for clusters in the past, was this a mistake in the
> binding or did something change when this was moved to
> domain-idle-states?

I cannot find anything about local-timer-stop in cpu-capacity.txt. Where
do you see it?

Best regards,
Krzysztof

