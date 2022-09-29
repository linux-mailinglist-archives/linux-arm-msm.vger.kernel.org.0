Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60FB5EF23B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbiI2JhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbiI2JhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:37:04 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB6B145C9D
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:36:42 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j16so1404661lfg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YboU7EJWX9s/eCKMNyU4MN70itKOnGmUbie/p84rbqI=;
        b=JuHnP7zGLpDgnUtkUD1REAPRC0Y2S44WRa2xDgQH2rm7j8wRYSFLZgJD18dkNRHEe6
         kHPbUGFIMs3vn1q6J84rOm0DiQadRN/iRnx0FMnMM+8174ypbIfpcMYrCM9jaTQcD0T6
         pHWnpEu2UsTb7pYGv31+X6MPH33bABPYKRDD4BMGON3A7zUO/tiKlzM73XqhhLkCUpJR
         SKeF0NPzxoR+iWSMYMEEg2h41UiKL8/zV/L//wmk9IrOcmUnO3RV2t1TZ/xOlrkL4cy9
         E/oLC18xRQZEwJE9+JCtA4gdNNtTLD+poq/GfzcdpvZIBPbCBbQuW91Zfc9roedF1MCZ
         3Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YboU7EJWX9s/eCKMNyU4MN70itKOnGmUbie/p84rbqI=;
        b=zepN7q4L9YuGuNFA26m533V4vVZ/4oFryAj4ib84l7sSz5IZfFyoNhwFusI9UPNmP5
         qfOg8wjiIbIgx8Adpqt2JjBNXiQ17ghxYlJrTXoOj7GcmFmAkVQwDMKmCW9m6SoGPVV6
         a3E73A+o6EsNPpxuH+QFiyrvnnjZSpwy/EK1fMIMx/3RZ81lx+288Lme/1MJwm9Cs6/M
         lCN8YVTOwPznI96yd2sedq0WG6eUCGKE/oXV975ftMEvVNE+Pn9BMgTUw0qrimWiD7Ve
         IKrGAtILndncP+YveN45yl8agiozM/dLUBIFGCoqczJ1mK/zkk1nKirwheo78lvwrUrq
         gLrQ==
X-Gm-Message-State: ACrzQf2ZQDJT0zJu0/9a2rAP05qtMW+PXt9ppUZ0h3msLMvQ0IPTxakb
        ci8mLmj4Vp7cLTOloPYm0GF2uw==
X-Google-Smtp-Source: AMsMyM4cbUx3bEAc/nOwmW2NfB+K9ZpERD1j5UJsF0wbx7S/BgpUDvdacDKkJe+a3ToJ2swNATd+ag==
X-Received: by 2002:a05:6512:3b9b:b0:499:b2b7:c3c1 with SMTP id g27-20020a0565123b9b00b00499b2b7c3c1mr972536lfv.54.1664444200826;
        Thu, 29 Sep 2022 02:36:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p13-20020ac24ecd000000b00499cf3e3ebesm732365lfr.121.2022.09.29.02.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:36:40 -0700 (PDT)
Message-ID: <30009f48-4f31-b6b4-f444-85bc91836d14@linaro.org>
Date:   Thu, 29 Sep 2022 11:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: change HDMI PHY node name
 to generic one
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
 <20220924094347.178666-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924094347.178666-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:43, Dmitry Baryshkov wrote:
> Change HDMI PHY node name from custom 'hdmi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

