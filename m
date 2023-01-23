Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1D6677C61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 14:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjAWNX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 08:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjAWNX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 08:23:27 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5DC2197D
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 05:23:25 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k16so8996832wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 05:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWI06omnMqNceUtG8KJb2WUeJNmegQhi3FN/6Z1ebzY=;
        b=kYxewxF3YY5x1+++vIOTxnpAGTNbG/KViPKqxc5gokiTsdHeKqMGsWMCPI0eM2ghuU
         VHthTUPgKTUV1ZKgUQxCRgYcOMohV4J6G9AO/seBNZFLKsGyRB9jDpT6GDrNDFYX160x
         adWm/2gOBoUBBA/URyrrO21EWyNvKbv/VwKx0ZpOovZAKIVMngkKl/2xudSooUd+UEWP
         24sizqZHc4SDCGLXygdKaT6UD7TeguLLO2e26I6rNNH/ClQrew1/GM8Cg//Hhyl2oZ8H
         rPIweQwR9GmrzKwmN/lvyxgrHsOujxTnk816LqaQR8nIfiO7ij45pDS/J2FwjE/HBd7H
         j4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWI06omnMqNceUtG8KJb2WUeJNmegQhi3FN/6Z1ebzY=;
        b=4jU21+7LhtZkglIy4LSeBbXEx3A1WRDM8/EiwNbCsHxO63txBU4USmnRE+9Z7jyLjz
         jfoIxRb7+q7X5GxjJ5lENgpnxJXL3zhxIPfm3vJS1qo+CKBdPVYRNZ0N8fT/acy2DbGj
         ygsgSjkXEZYGn1KUHY9HpMz3HAp0GGRnMHo59IrA8hcpdB0pvUKCUk2oT9l8ro+gp86N
         rbKOqPB6B7n/pxXgH44c7ohzfozPqX5IpTV/zLZW+7W9hmVQCT7Tl8vYJgBKINBV9BOM
         41Mwx9fp3u7fhgFixrWA8B8zWtUgg8J5viYTCyjdEbyxyh671lbpSDNFN4nDDOeW1MC2
         5rMA==
X-Gm-Message-State: AFqh2kpxl8MvVxGERY/apn0NRVkP1Ho3g5uVNiEblo+AYqhoSSLkzpbH
        CZymkzyN448siYJootV7/3SdMg==
X-Google-Smtp-Source: AMrXdXvEqTk26rpkj64XjgRaJNm95+WxdojhIs2s8lBudsO1uqhbmoSNsw3wackOkLEtrqe/V0YdBg==
X-Received: by 2002:a05:600c:4d06:b0:3da:f0a:83d7 with SMTP id u6-20020a05600c4d0600b003da0f0a83d7mr23428035wmp.8.1674480204173;
        Mon, 23 Jan 2023 05:23:24 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f23-20020a7bc8d7000000b003d1f3e9df3csm10751788wml.7.2023.01.23.05.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:23:23 -0800 (PST)
Message-ID: <45800033-e2ae-09c8-b8a2-e97afb6508fd@linaro.org>
Date:   Mon, 23 Jan 2023 13:23:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 0/6] Add MSM8939 SoC support with two devices
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20230123023127.1186619-1-bryan.odonoghue@linaro.org>
 <42baa874-c926-9111-b0b3-2df2562d8de6@linaro.org>
 <Y86CPmgvAi+kChQI@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y86CPmgvAi+kChQI@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/01/2023 12:49, Stephan Gerhold wrote:
> It's only required though because you forgot to drop the DT schema patch
> (3/4) when I suggested half a year ago that you make the MSM8939
> cpufreq-qcom-nvmem changes together with the CPR stack [1]. :/

Didn't forget, tested that and as I recall there are side-effects 
removing 8939 from drivers/cpufreq/cpufreq-dt-platdev.c - not all 
processors were booted.

> Anyway, it looks like qcom-cpufreq-nvmem.yaml requiring "cpr" power
> domain unconditionally is a mistake anyway for multiple platforms.
> [2] was recently submitted to fix this so that patch should allow you to
> drop the dummy nodes. 😄
> 
> [1]:https://lore.kernel.org/linux-arm-msm/Ysf8VRaXdGg+8Ev3@gerhold.net/
> [2]:https://lore.kernel.org/linux-arm-msm/20230122174548.13758-1-ansuelsmth@gmail.com/

8939 _is_ a CPR device, I think qcs404 comes from msm893x IP.

To me it makes more sense to stub CPR in the DTS than to, wrongly 
declare the 8939 a non-CPR device.

---
bod
