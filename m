Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96361651E69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 11:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbiLTKIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 05:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiLTKIT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 05:08:19 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7B8195
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:08:17 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso463335wmb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mREIGBFU8vzwVqBqOlZfgwelsA47LLMd2PKIV7s3Piw=;
        b=oPZJBV6t/rucaYRK40pFeL2LpEcNuywPkeyw5D+2hfejl7LXapIgIpEg75CPzMfmS3
         HRgYe9iMjEpWeEOxMrclkK73a1rQUeC6kj6IoxV9hFevTiXXcXmdgi+82AEIXlHTwN0W
         rq9lEmRLZ87OCnItXAQiUOK5n55UCZATsBWS06LrIXCMscliWUzrIN4yrLFcV/28YOeb
         vm7fumZc5Tcb7L0qaELY+o196ZuW9Ydvm+gi+Z4W1NXRYxbhAyGs8ka96NV92iO8a5am
         1myKV4spIZNn6d0nUSYQ2nVyAvStfJdbnItLPh7h2KB3pYEQxwiVhxP1k125gcPp+/u+
         nWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mREIGBFU8vzwVqBqOlZfgwelsA47LLMd2PKIV7s3Piw=;
        b=kCRBKwRPZOsoAo4XUPwijb+OmkOjXjgn/QwN/j780kkQUORde/DL8f0jyW4MIlOz+0
         6FOgKcwwAaDsaeJCkO4QbUrDuNyBGpirX3yzTHycjAKiTzpSg5j8NxZcmI04Sh0mWi+A
         QH9CCjW6H9IHVpwCxNOiatjHQrB0UtuVdp5vSCfcIlDwd3qwMK7yMnogd2eJ5QYJ726X
         U+KfAL/PWuSuTh1ySQD98c/TB8ibf0EdSaHnaTZwW1yYrsJGOWsj6bS7bp4FrsuTo5+R
         sYC997Q2abB147pXIDKxyMRSXsm2izTsuypBl9QHW+ITUYz5Ng0Zeo8JV8GIHGt51i44
         lF9w==
X-Gm-Message-State: AFqh2ko4RfxvSSCoLmpJr90H9AiJ+z0sNf7L9XB4GATJBnwL/X0TUMnF
        V5uyZhZb6l4x85m+wP0zWBLzyw==
X-Google-Smtp-Source: AMrXdXsbMQ9DcegCKuPWwHTHNv6tyefaFQui3mds1xgfGV5D1rEr97du/vZBczNwqbsWAZ3eeV0z5w==
X-Received: by 2002:a1c:29c1:0:b0:3d2:3f55:f73f with SMTP id p184-20020a1c29c1000000b003d23f55f73fmr1100669wmp.8.1671530896418;
        Tue, 20 Dec 2022 02:08:16 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y7-20020a05600c364700b003d33ab317dasm17226467wmq.14.2022.12.20.02.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:08:15 -0800 (PST)
Message-ID: <78fd7174-9aa4-f067-72ca-514c8fb09ee5@linaro.org>
Date:   Tue, 20 Dec 2022 10:08:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/15] thermal/drivers/tsens: Drop single-cell code for
 msm8939
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
References: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
 <20221220024721.947147-9-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221220024721.947147-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/12/2022 02:47, Dmitry Baryshkov wrote:
> There is no dtsi file for msm8939 in the kernel sources. Drop the
> compatibility with unofficial dtsi and remove support for handling the
> single-cell calibration data on msm8939.
> 
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Maybe its a better idea to just - finally - get the 8939 dtsi upstream.

Is there anything that needs to change in this ? If not I'll just V2 in 
in the next few hours.

tsens: thermal-sensor@4a9000 {
         compatible = "qcom,msm8939-tsens", "qcom,tsens-v0_1";
          reg = <0x004a9000 0x1000>, /* TM */
                <0x004a8000 0x1000>; /* SROT */
          nvmem-cells = <&tsens_caldata>;
          nvmem-cell-names = "calib";
          #qcom,sensors = <10>;
          interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
          interrupt-names = "uplow";
          #thermal-sensor-cells = <1>;
};

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=linux-next-22-12-15-msm8939-no-cpr&id=146087a134306dfb6e1ec48b20b19a278f336b15

---
bod
