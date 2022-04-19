Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B94A507C2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 23:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358094AbiDSVzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 17:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242939AbiDSVzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 17:55:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3203DA6A
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:52:31 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g18so24159657wrb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gLtsy0Dnuy7K64jx69SEe4Ua3fGdznWFY7ZIp1FollY=;
        b=a1pyI/puus6HMt+kjyQ296US4qUURUnDNuM49j+V3zIzyZgYOrSPhxuWD9eNMq6zGn
         aIjCQcxVItq5SGudKBWrtuqVbLQAUJfOWzL+reIpEY+HjBX9GHHB7maqXWD7MdnwHCqh
         yaskzmQjsVWDhJ0a2br2CFPLcO51kTG/WQ5T+krXhoprDM3KVOlojTSlbu/zfsYKloHZ
         slgWnf0L7d/vsg8gT+ofSLzWIjnQQxyQ7HWWFE9Krfzxp0HNpvHusuk01pvg8QahInGM
         n42I6PDCtJOgMHDD9IqkaNTdCQAz/Yy8qFjZdTy7XYaDpqyhNeN9YsNM95GD76qhmgHx
         GR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gLtsy0Dnuy7K64jx69SEe4Ua3fGdznWFY7ZIp1FollY=;
        b=RFYZ+F7X1u39rUsz2Q5RsbY2aSLDF2Zse+SA0QrY63tbyIwwoYasDRxc5aN63B9Zh0
         3FX/fSTTJATk+dMnhUwTiPkFOedQpbSMBA7YCxpSk/SzPuWaXK9Ju/UHYyTGSNwnabkk
         UX+sHM+L51HG9wEJ6jbQP0ov+K06k8+oCKOV1DN01bGF75AW/yAg+J+phu5CKzE1C4/4
         n0TiGde6HNonboD7ouXRyAfYRFYUGdKQw8vHb/mCqxAxk5dJogAh38NSmxieZpEAdu4c
         nFm/kUguBm+WanYOePCwzdr9sY5kyTCprCIpUTCArvZcoB1VtXsJqovAoqMVJRQyR8Cg
         ATEw==
X-Gm-Message-State: AOAM531dyvWastYYaOxAesdbxiWGeD9vCEgRMi8SC1puySYQH1CDuV1J
        EZkzD9maoo+5zTrFPj1IN/ONDQ==
X-Google-Smtp-Source: ABdhPJx/qcsME7Oq5vBEl72U8V+HeEjZ4gzko2awR0eo0KSBp2FUHwrayljTehUN4irkITsOZWewHg==
X-Received: by 2002:a5d:6b82:0:b0:207:b4c9:2293 with SMTP id n2-20020a5d6b82000000b00207b4c92293mr13209532wrx.33.1650405149890;
        Tue, 19 Apr 2022 14:52:29 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d64ed000000b0020a9e488976sm4841589wri.25.2022.04.19.14.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 14:52:29 -0700 (PDT)
Message-ID: <0574491c-1b32-a6c8-d8ad-7c4c5c4662b2@linaro.org>
Date:   Tue, 19 Apr 2022 22:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 3/4] arm64: dts: Add aqp8039-t2 board
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-4-bryan.odonoghue@linaro.org>
 <Yl8r/c0psJTGhEEA@builder.lan>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Yl8r/c0psJTGhEEA@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 22:39, Bjorn Andersson wrote:
> On Mon 18 Apr 20:09 CDT 2022, Bryan O'Donoghue wrote:
>> +	wcnss_pin_antennae: wcnss_pin_antennae {
>> +		pinmux {
>> +			pins = "gpio1", "gpio2";
>> +		};
>> +		pinconf {
>> +			pins = "gpio1", "gpio2";
>> +			function = PMIC_GPIO_FUNC_NORMAL;
>> +			output-high;
> 
> Could it be that gpio1 and 2 control two power supplies for two antennas
> and that this should have been represented as regulators instead?

Those are the GPIOs responsible for switching between antenna

Off-topic:
When doing antenna diversity switching the WCNSS firmware owns these two 
GPIOs.

The rough algorithm is
for (i = 0; i < 2; i++)
- Switch GPIO[i]
- Send a probe to the WiFi AP
- Wait for a response
- Measure the RSSI

Then decide which antenna has the better signal strength. So actually 
WCNSS owns these two pins.

I have an evil plan to implement ieee80211_ops::get_antenna() in the future.

In theory all we have to do is read the GPIOs inside the callback.

>> +		pm8916_l6: l6 {
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-always-on; /* copy from v3.10 */
> 
> Can you do better than "copy from v3.10"?

Sure. I'll put in a comment why.

---
bod

