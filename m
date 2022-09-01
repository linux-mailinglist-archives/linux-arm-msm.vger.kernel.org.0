Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE2345A9C7E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 18:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbiIAQF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 12:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbiIAQFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 12:05:25 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C462AC55
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 09:05:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m7so16203882lfq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=fwg3fIYthgTs88ncHATwwlsyo02fA/7My937oz1s3nQ=;
        b=VEBB4UnOUDi9ZpiH7kvO452gEURhNXsGVfcP+RlG+xSsUqxQPSY3L2kryzWbWzuBLi
         guuYPeEQQWMD/8NcpemJFDAaFno5yCEOtIGrJ8PhKoKKlH8kJPmaKIv+P/L998YqY7Vq
         3YcprWCk7l4HXdlNLLdV+4IrlL0Ku8lLH/xSrOtbMiLhZL9fTYSs76Vh/EIlYlIu8T52
         T7YiMkRSF0WVhWRoa0bf7SCAxJFofogmENZcDCr41FUWEfxMIif9sEJcdUO1tWVuC0La
         O2APX0nLEXNJfOHF584Olva5pWnDP12as8KbZ21ODA4w1BD+nkHNDld+nEvsG2HoxVD7
         u1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fwg3fIYthgTs88ncHATwwlsyo02fA/7My937oz1s3nQ=;
        b=sDSr4/EABCPMDD67e74H106z1knP8gmKtriEMufWSosKVRBPoVo+wIAYvCTj9M0kvF
         riMWhcY2+1SuG3OZqJWOpTgC5i/gH+n2yPGJ30oTO7BRqxjMB8FxlpPtotDCaZDSg5SY
         kkhCzoyzteQdDnKRz2fHDmGQhdkcPDF2NcXRPx26niVuzIdIO75GPRHwxmQZ1LFbSqvk
         +fd+0odgpEFHwG0nK6Kc6HJLBe+VRk8wm1FCnJcvktJejb0YkyDj9UxDRFqE9u7UJuTd
         KZy13mAl65NXjanKMvmUvrlrGFwkbOiXg1SAKW/Iqel5nYyK3ZiYfIhXlU9olkm+l2S+
         O8IA==
X-Gm-Message-State: ACgBeo3OyEXx4191/2lhoBp22+9HeYCGx5rUAJw60KZHKMJTcHDJi2ES
        ar+Qt7fCcqWJZ9kCRt76pCY9SQ==
X-Google-Smtp-Source: AA6agR70lkkzNRz9aGzp3iTtVpGqYq69wcsA6toTWrvnOGTTZqhXtvwQfMz9XAYOtNadleqhcE6cmg==
X-Received: by 2002:ac2:4a81:0:b0:494:832d:621d with SMTP id l1-20020ac24a81000000b00494832d621dmr3292954lfp.413.1662048322122;
        Thu, 01 Sep 2022 09:05:22 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id x6-20020a056512078600b0049480c69d98sm919177lfr.239.2022.09.01.09.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:05:21 -0700 (PDT)
Message-ID: <b8990062-7721-7bb6-9a92-a364ca7ae460@linaro.org>
Date:   Thu, 1 Sep 2022 19:05:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/14] arm64: dts: qcom: sm6115: Add GCC node
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-4-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> Add support for the main clock bundle on the SM6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

This needs squashing, because one patchset per device node on first
submission does not make sense.

Please squash all your 1-7, 8-10 patches.

Best regards,
Krzysztof
