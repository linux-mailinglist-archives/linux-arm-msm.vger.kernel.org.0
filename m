Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7913A5F3EDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 10:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbiJDIxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 04:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiJDIxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 04:53:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72EF3640D
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 01:52:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so20185016lfy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DzV3Cl/JqVe17h5x8IVBSmRxjaPmJ9ee1dQEbfudykI=;
        b=f566QG+EhAMGYZBgHzz7lz9pTrgzDtv4Dvxp6E9NMzrrkcQY4iVikhXDkOY9Dti541
         ihtE/2e6yM8Lkbx8kSxyZUcieXwqC9iFqo67kbX45coWDunsPCP9KDtDEn8BeTFLWzT1
         d22IWfduIaPddZLCQJTtVp7mjEK6Jb5mfJYqzaSnFeoWZkCFX4LvOpq2NUUURtKZZAXu
         e+cv5evV1+g01PnSsWvAV4JGyrzZFrSbbMM3vVvzJlZhiNRXKFNoYwvTjw7hDeBGp0DL
         4QeJhOylDT7hj6eKYSvxQUAGVBzNLN1wACaA9ZfWDaoYP1FClNjcQ43XSN9AiBOyY1U0
         ijDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DzV3Cl/JqVe17h5x8IVBSmRxjaPmJ9ee1dQEbfudykI=;
        b=ECtREfbjg+RL25kwVWdL0mg1lHshP9FImqM2rABlXP3oFk++6JfwGT7QelkP0xSPij
         e3emGFbAHV0tCAQv3T2z6M8Mh1e2zlv4urGOcxdQnFKZx2EQM7YkIALSlpNBRjLRNDLD
         SDW3mNNL9F9XGR9L9DJHF5IQlhZ3dnJHhasTJptSU9wo1HUNJaDmfJqpk2KZNzm3Gqvx
         Nj5RnYHJ9XRTEhmmIQFGIbNY5BM9R+qTQ3lJGTwzzjqpIc/Zw0qeF0rmSqZJx7NpzRlu
         1wV3i+45SqA5WT8Wzibx55h5LY48wgfK18mQxGl4tIYsUVHUTiSKakHiNvfIjU7p9QUT
         pfBQ==
X-Gm-Message-State: ACrzQf34YBytn6GI5vubD4rsJyB0dP5ztHDPlYkF9aomvsa9zQSlQuIH
        yhkGu0DTE26UzRHeOc3x5tP8gQ==
X-Google-Smtp-Source: AMsMyM4xh/fVj+647XrbTgB5Ojx/qjzGdjRDF7Z8srIOqD5XH5jHtz8PGWEe0Y5NDjPSyMH+RjhsNg==
X-Received: by 2002:ac2:5bcf:0:b0:4a2:4521:634 with SMTP id u15-20020ac25bcf000000b004a245210634mr2367863lfn.201.1664873574992;
        Tue, 04 Oct 2022 01:52:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u20-20020a05651206d400b0049f54a976e3sm1835139lff.58.2022.10.04.01.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:52:54 -0700 (PDT)
Message-ID: <275e32d1-b294-f249-ffef-9b2602463763@linaro.org>
Date:   Tue, 4 Oct 2022 10:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 02/11] arm: dts: qcom: mdm9615*: add
 SPDX-License-Identifier
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v2-2-87fbeb4ae053@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-2-87fbeb4ae053@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2022 10:08, Neil Armstrong wrote:
> Replace the licence blob by a clean SPDX-License-Identifier

typo: license

Please mention that the text of license is MIT, even though comment said
about X11.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>




Best regards,
Krzysztof

