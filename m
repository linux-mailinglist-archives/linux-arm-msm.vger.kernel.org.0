Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1818566A65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiGEL6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbiGEL6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:58:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369A617AA4
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:58:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z25so2567241lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+LXRh8XLo5TTKatqai8h5sgh5sYynVOMyrVjObwxb1E=;
        b=s6g6Q0DLjnlJCnTkpPlNJvE2I/RDfbKgLPupJBpng4B8yoQ2x3GzJnOzGkvBEo0NaB
         gliGYhLOHuQW1EvxVW+8AMQYuAgx4Wf8SAJa1o2OhLwhxRXrAHxNGpPltHEK2SbsS6+Z
         J0+QUX/OnHdkXUOfBR1a2kcMaOTQsB062PI8kL4Pb162hluHi+6kgJb2T0/rckWqdWQ6
         n+fZubPlZOAVejJYuUdz/lBPx53WyBu2d5pf0gecLiq12pMVsU5PSMNIrRP+ykqjej74
         GTGOpj001daiiGv5PB4KOVhgzd7qB+pxEaRRfLJYc85HFXM1DR/hJQNYwOTChS2RoIGh
         azAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+LXRh8XLo5TTKatqai8h5sgh5sYynVOMyrVjObwxb1E=;
        b=RSy0nhXsCXKu/h/wasLiVOuAaSRl7Y2k6LICQ659veiSzSRQETGmxnN4Y0TXnG51tI
         20UifSWvHWzgEtC9mNmbCWN1xUJUoNe7n29wPrTeRpeg0uz/EpJKAGaHxCFwHo82uAUx
         YwIffpfo+6uUccGYBUZ/WT7G1HKQe5Lm/qGIOAe7eq5MH3QF2lSWuQBDuISKU0Seq5GC
         Joe1cTHq5I31nW4NgO7w1rPtuIinuJ1wEDnQgH3qgMCPptPUdcCtNrAbPmxBEni/EpYi
         rIrnL9h7cmJohPTV8Ipv7lTa9iRIZEMnd1B96CEXWB9q5F8M+vmnaxoz9301Rc7zxj3v
         iJtQ==
X-Gm-Message-State: AJIora8WJ7jikDo4ZP8pejm9ZnCGFoU136oizL64/+XhWp4SGv/xrQ0x
        ZuK3zpWTaeN7NF0mAjWOux0jCQ==
X-Google-Smtp-Source: AGRyM1sp3XM6fmWLRp/zHlsY3yInJaCeushGtHM0lOg7pgLySV80H65Af1eQ2ZUwxSt/1iIcfm7kvQ==
X-Received: by 2002:a05:6512:22c3:b0:47f:704b:3820 with SMTP id g3-20020a05651222c300b0047f704b3820mr21778416lfu.411.1657022291566;
        Tue, 05 Jul 2022 04:58:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n10-20020a0565120aca00b0047f77c979f3sm5656848lfu.235.2022.07.05.04.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:58:11 -0700 (PDT)
Message-ID: <ce4b0c8e-8cc6-4157-652a-25e50da033c3@linaro.org>
Date:   Tue, 5 Jul 2022 14:58:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/14] arm64: dts: qcom: sm8250: add missing PCIe PHY
 clock-cells
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705114032.22787-1-johan+linaro@kernel.org>
 <20220705114032.22787-3-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220705114032.22787-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 14:40, Johan Hovold wrote:
> Add the missing '#clock-cells' properties to the PCIe QMP PHY nodes.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)


-- 
With best wishes
Dmitry
