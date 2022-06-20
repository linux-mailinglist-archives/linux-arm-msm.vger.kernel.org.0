Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA07551317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239354AbiFTIo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 04:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239463AbiFTIo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 04:44:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2865F59
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:44:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id s12so19673137ejx.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jbuHCNS3OsbuB14zXqMTZbn7sAxDckRnnJ+WYM/cbbU=;
        b=ZwIA/Qnhfi5xfKT8y1yrsJWbevwCN531zW4mLOETfhklOrPrrS2Woo/IZvNDMyK10K
         Hw03XC0h/p0Pg3mrHR5NNfwwQwIij7axyWSaRZ7jeaEWLDuY9084KYkjWJUcqbiJQ229
         KCHq/Q/vAnBQw9cS8Cy9mH0oDrVbUutadMVZvUskc7UbOfJPwN8Z+9HaMrampohjlUKq
         8/Mqjst62TXFkPyTj8s3xpAxJa92JK3CdEAR61DyXar4JXvqufqztippkeYoAv489GSv
         xYPiQCmsWpB0guNChxqyA9TmLHdgUERvChIzb5Lgj2yO4fT6qMy2aQOj4klrEkOkyGo7
         0mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jbuHCNS3OsbuB14zXqMTZbn7sAxDckRnnJ+WYM/cbbU=;
        b=G0zKnXGQuilDr1AcN5hGElx2MRRqNJH0PO93JWDJZJeV/Ut7V1hOHurYP1XstdLkfN
         yxH/1GgKPYFC31gNMgXo1TPCODed3MKDXduEZ8WVziUNAXrRgWoMQmW6WTS4qUQJ1igh
         29rBfs63G7aCmuVohZWKeMBR1iF2D6+NlBaRGHw3wutPAsvWloV9HB0ZnM3deGLI+Ot5
         HKWP0IK9wUnZpaRCZcwsXPODH30v6/rrPz+klaLuoR8whoFI4erc6fbAaI5mErOMFuBt
         Jco3mb0cmYt2+1Wj6ay8RbjkYJBA/XnqhNsiE7NegHBR6tYqgy1ed1aH/NVin2fqQlPd
         G2Xw==
X-Gm-Message-State: AJIora+YmFkx0cgwocsYvYCGQJFrpLYHzlBdQZXIkgZY9W64zLysz6XT
        ycCbDBkaTg5yomUOx4fngZwsMQ==
X-Google-Smtp-Source: AGRyM1usrRAbvRtTfJyeMHsqxR2asoTm2C1H1HtsyIpxxvE11PA+G3nY2Tb2OC3QKDrmw34xMlcEtg==
X-Received: by 2002:a17:906:1109:b0:711:da3b:bdcb with SMTP id h9-20020a170906110900b00711da3bbdcbmr18922623eja.210.1655714666082;
        Mon, 20 Jun 2022 01:44:26 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id dz12-20020a0564021d4c00b00434ed381701sm10069136edb.35.2022.06.20.01.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:44:25 -0700 (PDT)
Message-ID: <012d0f02-05a7-ce34-6a24-3e3e2f59f404@linaro.org>
Date:   Mon, 20 Jun 2022 10:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
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

On 20/06/2022 03:02, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required. Also add the XO clock to the list of the clocks used
> by the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
