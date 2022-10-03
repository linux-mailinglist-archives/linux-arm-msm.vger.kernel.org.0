Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80625F33AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiJCQg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiJCQg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:36:28 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE55F255A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:36:26 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a3so5301036wrt.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=qFcDLqljS7VAsJ33CgVatJ3yiGEzmN/9q8QCzIPkw+k=;
        b=n1WpM4BMPd6PzAkOBCsTR8EfsbtMRbltC5wEiWRE57NM0jRxmi4Deltilzf8n76Hhb
         09aloCVEuZGof3rkgLGmfQvzDZce+0VntmDl8r9/zaEm/4qaQlu/M9fYtw9cuLS0n9p2
         1Ue8eSWgF+fjKrvKNhjmMK+bLA3tau9b492X/4uVaEyrPXZyQOU83zk6q9yWtQvxzM+7
         V+6SmqPayAUAqRBxabM2V45/7QbLtW5gsP+ZMGJaRKOnMwJbj1gRr00WUA6c1yCmMkTM
         VGnItYCkzyLdAzuyjpt6cA8MkPK84TWeLY8hdEpC8lOCxfAlr9HVALW9mGPeUd6jvN20
         /l5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=qFcDLqljS7VAsJ33CgVatJ3yiGEzmN/9q8QCzIPkw+k=;
        b=UVf0OZSh8llautY/z+EvyQQYFK/sTd7Ds7zR/U6uh12VdMxCO8iLuHTNBadSsBLViV
         zgfJs6eHh8QKAT+qA6nu3Y2HSp065AfVCyvE+8aBpEFGyGyM29MJRmTMxmm2sXR0Lp4g
         o7ppkLKFqMs7hXJ+Sst7ev5Z+DXeb2l0cmSB6w5+yQbFtPu6c+ZdYRflGw8gAUMbdDvT
         qtN+CM6KPnJrxOTFTWpTltr1Qskfpy1+1XeKot/dQJcdrAMSOFHraZCdcC+pjxeAmi90
         wwQGz333G5UOyn3PnOEO8Jqrwr1G8zVu8yNfxUgjxLnkIkRzxh8ngcjfmj9JUIxqWVS8
         0KAA==
X-Gm-Message-State: ACrzQf2z2c89ytq/ofyF79QyHdvYqkl2fduDd2rlD4j7b9moxbd1WuvI
        9waWGpIK4ieXZyYR+CfJK+UQvA==
X-Google-Smtp-Source: AMsMyM63Z7Zut2aYCxLlfGwdqT2p0Dz+nNO426nJDDzDPAlAgzbHBsUPJvCJBloHC9S4kZrI6EbjJA==
X-Received: by 2002:adf:fb43:0:b0:22b:64:8414 with SMTP id c3-20020adffb43000000b0022b00648414mr14031269wrs.70.1664814985237;
        Mon, 03 Oct 2022 09:36:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id cc7-20020a5d5c07000000b0022cce7689d3sm13370124wrb.36.2022.10.03.09.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:36:24 -0700 (PDT)
Message-ID: <3c92c215-00d6-e290-f30d-00a738a3a987@linaro.org>
Date:   Mon, 3 Oct 2022 18:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 21/23] ARM: dts: qcom: apq8060-dragonboard: use labels to
 patch device tree
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-22-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-22-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Use labels to add device-specific properties to DT nodes rather than
> duplicating SoC DT structure in the device DT.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 1774 ++++++++---------
>   arch/arm/boot/dts/qcom-msm8660.dtsi           |   51 +-
>   2 files changed, 911 insertions(+), 914 deletions(-)
> 

<snip>

Quite hard to read, but not sure if it can't be done any better...


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
