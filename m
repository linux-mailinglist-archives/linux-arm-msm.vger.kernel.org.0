Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978DC57489E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238149AbiGNJXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238143AbiGNJXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:23:12 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBEF481F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:21:57 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c15so1500721ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TZbkzMvSZU0C1M4JV0xVgJvuTUUAz1VVtLQNRxdms4A=;
        b=OfCJFx8krvR7N0u27F7RS9zlcFbCK/hXAnuevdwTLHvWPi8HuVSp7IaQCbqwR9Trrr
         IqKylmeaSyDjnWs/Rh5TkzmJHmBdLFOrsiQtuRKt0UW6IAYozzqUN7o+BLejP2q6PX+q
         yHC7e+hyZDm5y+SAKFLGCDBIRoyyDzL6+qWFQWuKfTXIHZZZ4iy10F1PETNHnzSDZoC9
         yvU2URcqyXhsp7zFxirH5DUlIxTypVCZ+NJrHzZ0XG++fjLrPOxC3dpjoztgL/M/9CCD
         Jm8GKbnVts1b0oOUwt44FZZnE/Vn2GdbB8LXeY++o+sANBURr9IqyzWjlOL2SU6JSWiQ
         KQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TZbkzMvSZU0C1M4JV0xVgJvuTUUAz1VVtLQNRxdms4A=;
        b=JQ3uXoPUm1S9zvmAcAsV+eHZk/nYnzSLoFYTpGxUc2Q0JwRmit/cCkyL7ovNCNM94f
         nkOAN2GkYCFqrLgWy1hObeSB/4MImVs6W1xgOaMjSUrzEFbvDlvF2UMZTERQQrjx+7BR
         ++WvaAAfvqVSMzyx0xvw4yUcfHallkeYxcbrI3ihWD9t9vgE3arAvXsap3KEvFgUhdGE
         ZpWUZc0kAzDUn2XD/5u5Lw40/pF5li/AhH9zUdIAiXynjOsuHsSdK2ReCH1hom87ZXka
         KlvFvWRCC22EjXkqlH7g4zD4KYE3vhbJ+a2fKYC+RrULrWwjROuqkp6OHretBKxcWCdb
         F5PA==
X-Gm-Message-State: AJIora/UIP5nYypv8UlD/+RPkzSs2Lq5tJa8mpdWpi7PNQ5M41Wlw1j8
        vVG0lLahR/3RBLy1fVUfNFNn3g==
X-Google-Smtp-Source: AGRyM1uFuAVXyDIgiKh2eo18Tm1/3ynhtp7A6qKUZLGz3dA+UsobViAS6AaRrk5a//97+Zw8k7AZKA==
X-Received: by 2002:a05:651c:243:b0:25d:5b44:197d with SMTP id x3-20020a05651c024300b0025d5b44197dmr4290099ljn.516.1657790515585;
        Thu, 14 Jul 2022 02:21:55 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id r6-20020a2e8e26000000b0025d67053f0dsm179911ljk.135.2022.07.14.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:21:54 -0700 (PDT)
Message-ID: <e8046961-9555-07b7-721c-eeb278cb2ec7@linaro.org>
Date:   Thu, 14 Jul 2022 11:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 16/30] dt-bindings: phy: qcom,qmp-ufs: add missing
 SM8450 clock
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-17-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 07/07/2022 15:47, Johan Hovold wrote:
> Add the missing "qref" clock used by the SM8450 UFS QMP PHY to the
> binding.
> 
> Fixes: e04121ba1b08 ("dt-bindings: phy: qcom,qmp: Add SM8450 UFS phy compatible")
> Fixes: 07fa917a335e ("arm64: dts: qcom: sm8450: add ufs nodes")

The second fixes seems not appropriate here, because you are not fixing
a DTS. A fix for DTS would be a fix for that one.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
