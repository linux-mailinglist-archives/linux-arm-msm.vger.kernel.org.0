Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E7A6921CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbjBJPSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjBJPSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:18:08 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92B173970
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:18:07 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id a10so4971214edu.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02mVlAKKl5whYqnP1fhbv+HUroK8DSxLT6KvxX0YmEU=;
        b=d80SCFeeuXdzM2sc0gNhKexwi2OYpwvllAanBCtNQFUACaIKCwzcTKOlDp5lYf6Y14
         9WlT9bOY6ck+OsK9+bCwE60vkbmunWSO574f8WHJ1DqQ1vMXo8CaF2gY5N6v09fqENiC
         GNbW4T/3/0y33GHxS+cTuQgMJ/vp+xjDMmASxek7TaDBgADIXZk9M+6mlryf7wel7PJZ
         5TrwR9vpEmiNb/teZs7Rjz7uwYqVuouZWPsTRD8U/NivqPjlvXDE8KW6Z/wmNbvTobvm
         9bxRSX7pACBLWedpPQ6HxhEu45bBq3hRPibIpdUm3vGbJ4P7nHhbHxBEBXIjDmsgeTbL
         ms4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02mVlAKKl5whYqnP1fhbv+HUroK8DSxLT6KvxX0YmEU=;
        b=ZSS1ZDsKOYX39S/fAE8iR7XZ+OumAvrfnm93ReDgl5J2unE/UpicpeCRRvaBW+JDSW
         WVyhaIXMuZk6MHhxuKPzJDtv3inrSX7MZ6KgFvAXjbr7XyRQcGx8Nsi8ThMK291Aj2uS
         TTihn+hLvlPih5tt2rBPO6LJwJ/hu8+qyGW3/x4OPmXXm9GXWDPaCD1ZiYRDEG7FRk+Y
         VIuFHnCwTJfR0VgsdMwQ9aPKjwpaBTWo+H+fl56fu4UfH/LQOF03cXL6S/ebA3zzzJj5
         n4hqKquUZ3YFjaMH3vTggtKHkEA7vvXT5MPv+kgk/4Lj2dpZB9ISgncyuwS9hquAk94T
         JQPg==
X-Gm-Message-State: AO0yUKVXNzknnKSy6k8QjQtoIjFAeyhoCGNoc+EzlGqt+Bd4E1O0F0KQ
        CtZLCwzfg7Yk5Um2TbOe4en82w==
X-Google-Smtp-Source: AK7set/iNkirutTUnbExRgezrYds0gZeyGu3ozG/ELlq3e0A3uK/LBqaiqxq4aGczsJNKJv1AGSCrQ==
X-Received: by 2002:a50:ce41:0:b0:4ab:4b85:a69f with SMTP id k1-20020a50ce41000000b004ab4b85a69fmr2491931edj.1.1676042286235;
        Fri, 10 Feb 2023 07:18:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t18-20020a50c252000000b0049148f6461dsm2321942edf.65.2023.02.10.07.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:18:05 -0800 (PST)
Message-ID: <44fa957a-b47d-d913-917c-a614884d62ca@linaro.org>
Date:   Fri, 10 Feb 2023 17:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sm8350: add dp controller
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-3-636ef9e99932@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v3-3-636ef9e99932@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 16:44, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

