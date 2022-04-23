Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05FB50CCB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 19:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbiDWRsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 13:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236675AbiDWRs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 13:48:29 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1582A1C45A9
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:45:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bv19so22050694ejb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tv8k2QNg8f0WWAxqQErrRdjZaMld74wjV/Sdmm45yvw=;
        b=QA1CN7Yo/6gnRE7FGNyHY399Llyw07eMEHEMEHOzviC8T/cQspbvxBnPM4mpVMqez+
         zlPAjJPV0XqL7Q9eUgAW51B/x2l2XVOkvzIKe796mUooQW2ycNZjpuel5iSt3AfvdPr+
         LWB95jcBP17l5/2gvWrw6LkrUsfTFxGc2k/JLebkHKM9fRM1zwNygoC54umq7gLFXCFw
         u776JpgOYMB1eFrdESimVciRNOJDxZK/CVC2McdODSJ7JcNMtf9ONdXycitO8DoipcpN
         UWVQUG5Q4K7fIlUL2UhBtalPPvPuMfWuazTwtrQsz7rhu/jmhsr9NNy1kwnYVFA28r23
         /YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tv8k2QNg8f0WWAxqQErrRdjZaMld74wjV/Sdmm45yvw=;
        b=Nqlb4IRP7t6bSc5+gKheOMNvqziGFpypAxaxJm27naFmgMKLvQtJEfw1QW9+k3WEY+
         6ojC5eSIt+/dTL8FgxecDaSLcAVSy8hRSaiscaTMyLOhtDFVx10xKLq/Y0p+80newynn
         h63tUjOsaiyvsl0mTzW1jYEE3gP/2qOVt+aOfFlqANDCK1Bj00ZcYaaea2yp6wroDTP2
         nRtCCgyTNuYkJF1HhVfi9PzdjX5fdCuITCW4ovdNZmBuBp6FkZ81szTRcE0uEhipJ1tR
         OO+TQG0SlPQdL194suFzJcYfABp1sCA825gBMbl3bgfm2uczpvCo+KL/MMHEx8BH2fqx
         WxkA==
X-Gm-Message-State: AOAM533RTt+FpXDC4URcxzOTXV3Bb6M+Z3lJNJit7bA6Eiz+u3ihsMen
        Eh7KRcv4iL/45J6qIfMfoBQexg==
X-Google-Smtp-Source: ABdhPJwtFCxar+dccJDt2FfSCA7OH7G26P7gbrmnXI+xFS4WCiwHqfZZI/jbOn2J+8dol6tfCtMcMQ==
X-Received: by 2002:a17:906:7304:b0:6e0:6918:ef6f with SMTP id di4-20020a170906730400b006e06918ef6fmr9090867ejc.370.1650735929711;
        Sat, 23 Apr 2022 10:45:29 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e22-20020a50d4d6000000b00425d4753b2esm917752edj.74.2022.04.23.10.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:45:29 -0700 (PDT)
Message-ID: <219696e6-2ae9-3265-8735-d612408df841@linaro.org>
Date:   Sat, 23 Apr 2022 19:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: replace deprecated perst-gpio
 with perst-gpios
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220422211002.2012070-1-dmitry.baryshkov@linaro.org>
 <20220422211002.2012070-8-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422211002.2012070-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 23:10, Dmitry Baryshkov wrote:
> Replace deprecated perst-gpio properties with up-to-date perst-gpios
> in the Qualcomm device trees.
> 

You also replaced wake-gpio in one case.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
