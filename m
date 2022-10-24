Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630DA60B3A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbiJXRNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbiJXRNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:13:18 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4057EACA24
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:48:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z24so3331394ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bK2ieUrrvYJmE5hExom0WOv1/p68mSRhbKTtAuxpHNc=;
        b=DU+jDj19WXSoI5bv/Tc44cgMOMyQC8VnbbEjETrwpceV8NfNMV2gIAZoGvUzR9um8J
         Q9T2y1PS8UcKXc5h9XtltiTy4Wej7mHSIqgDBjLPSdwhe4siktaQjzy0vdxAzYE4vGgV
         sd3JzHzqE5LCiaIVHbSNCHuJRDIOg51PYRXr1xUG6pxOrYneAmyQCZGWdX1pzjnK5J42
         MhkDxnP4WpsUS5DyLBpMjlPYydQb5oxUIvo9XOh4nLBTuaByTvrvJT74Cy9+SZshODcM
         cEvMGk7jlCp2rLUZR+3bWM+uWxYAGUsNvpI3cE6pIqK5q8nz3v2js/drqsReWKTfvZlA
         J6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bK2ieUrrvYJmE5hExom0WOv1/p68mSRhbKTtAuxpHNc=;
        b=V2pC2o4WybnSeZsmQPyy2mvKROOutnr7XvUjXjmiU1jWtUON/2AIycMXn7W7Kz9YLk
         6sG9d+JsKRXRgu3yUAPVdejw6egvmRJ1IAJ07lT6d4Oy9ehPAPl78ZQpa2HnHCSGGp6B
         Ob1GWhIZZQDb4PUhvwFfaId+sjzPrcVpavg9n8k+Z8iypIgulezvjdtIPtfxF6qAOoFg
         GypTBdpR5A8tV9Eq0S9lK33ZRu7UVVjIHhwRTLmxXlwi13c7X4uBc3On9Qzw2CMsUGXt
         Irq4Ljeb3Q389XONE3vP2zrQHwYUtzPePuqzY7cjQmSrivSRmoPo8cJX/0azeFQ7CjNb
         4o0A==
X-Gm-Message-State: ACrzQf0cb2Tk+NIFYlsjR5AZeJBiCI8JcU9zyE3gNC0Ulxx8ug/XZjpI
        OB2UiyhIHOA5WoXi4yk2fRkyt8yBs8YyO9WV
X-Google-Smtp-Source: AMsMyM7VdqMiPzoVj8ODiYzF+mma6Pz21IhmI+Gtd5+td2dZX8TYlIiEuOCzbMgdQlFmaA+VehlFJg==
X-Received: by 2002:a2e:a551:0:b0:26f:ced4:af36 with SMTP id e17-20020a2ea551000000b0026fced4af36mr11588306ljn.90.1666618478179;
        Mon, 24 Oct 2022 06:34:38 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i9-20020a2ea369000000b002770fb5722fsm265635ljn.123.2022.10.24.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:34:37 -0700 (PDT)
Message-ID: <88765b48-a386-4390-9a06-658ae3185fa7@linaro.org>
Date:   Mon, 24 Oct 2022 16:34:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 08/13] phy: qcom-qmp-usb: rename PHY ops structure
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-9-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 24/10/2022 13:06, Johan Hovold wrote:
> Rename the PHY operation structure so that it has a "phy_ops" suffix and
> move it next to the implementation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

