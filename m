Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1FC629B43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 14:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiKON5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 08:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiKON5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 08:57:19 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF92C108A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:57:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j16so24481584lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRDy77pLORMZ/XulovaxWyKY5V8oIS0uLhcTxtOQZjk=;
        b=ih8E8fklramz2fm/5na93sr2QZeV4xQv9SRXu+nQBgU8zxhPDbkNEZfeBguyCyhN6g
         8hLDWOItg8pG3YGEQM376J/9kGr3vNLtamH0ulRHB3BPlD31iqsYjllV4YMXi9EU3rc3
         5p3lDezgSk409+a32ar9zhNxMQbYJSk0xs9KoQaQG3vojprSeNUL7CtnJbeJY46Qlq9r
         tI/Ca+VE4UopJjOdJrEJtJG6SWFnwWuDk0Z85Jm83eyc+u6KuYcXjB6wcf8a4HN3BAtd
         AKCnA6I5DOtrS2HVovVaxrvl/HC2eU5ZOfVLKqjIMf3yTXtPTXpdEr6dfArHbUXBwYYT
         J3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRDy77pLORMZ/XulovaxWyKY5V8oIS0uLhcTxtOQZjk=;
        b=A1I+CapDrSoXamxzNVRI29huHAJzdLVmX5h69o4oO/6kcu9BNQKaNgojxE+UT7jqir
         ZWdO0lnqy/3yeISX9GrdYduc0e38xMYaLUEKU6I6Y7PrbmyA6UZVY/tqv76L1xVbqlNY
         RgK/ReTtVKuLpWInMG5Fd+cje/bmNig17UnBuGbaabxIW5m1ygwbGBv6WOYlysFAbemw
         tdYSVJ2IImTdRq0oJZWxSLh+tSGKUvj6v0FIeoTtcBsJKPwcLDJorTa3isU6ozsq5ibX
         HswHX/NLRi8q5A9jOUIWT0ytgG+feUqgGOQerdIoS9SskqNCrK9BLh+ERBPhXbvmk/Ry
         LHkQ==
X-Gm-Message-State: ANoB5pmrfYkqrhUHfG3DlUGryNWid8sxN0MseHgcFJMlg1ZTRFbpcAgD
        P6ShhLjLF8uSFylsTu8s0554bg==
X-Google-Smtp-Source: AA0mqf7dCyJ6i1FCEJ9EudMl+bRs4RS1CImhCmmrmtULiRsWIYxofVo8G8JZ//VkKlUarOnUPvJhVw==
X-Received: by 2002:a05:6512:2983:b0:4ae:6bbc:e8af with SMTP id du3-20020a056512298300b004ae6bbce8afmr5360869lfb.411.1668520636293;
        Tue, 15 Nov 2022 05:57:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d17-20020a2eb051000000b002770e6c620bsm2437751ljl.106.2022.11.15.05.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:57:15 -0800 (PST)
Message-ID: <76d3c821-a5c1-952e-dc9a-6f1c2f927139@linaro.org>
Date:   Tue, 15 Nov 2022 14:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: SC7280: Remove unused sleep pin control nodes
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
References: <1668510598-19535-1-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1668510598-19535-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/11/2022 12:09, Srinivasa Rao Mandadapu wrote:
> Remove Unused and redundant sleep pin control entries
> in herobrine device tree variants.
> 

And these are redundant because... ? E.g. not referenced anywhere thus
not used?

Use subject prefixes matching the subsystem (git log --oneline -- ...).

Best regards,
Krzysztof

