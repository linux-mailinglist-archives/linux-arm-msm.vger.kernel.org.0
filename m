Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07B95524AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 21:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244712AbiFTTly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 15:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244590AbiFTTlx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 15:41:53 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3ED01C122
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:41:50 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id es26so14806249edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sEUI2YgJeyDPI47V6RGt0fYdsBueMJxQ+51x+bPWfXk=;
        b=t4uI+sFquTqOp8Ekf5vDFNUJIZQ2JiTt+PZKS4lhjldYnhigTwUmKYa/CLJJQGjipr
         cJtLZdqsy/zIP+EUpoU8fKSy61fQ+/X551Nep+Paroj8FB7c4obubL9X9I5qHI1SlEJp
         UIE6BPcW+tAPmwYMWGkqcMmAdQ2Spd5D44S4Pr4/wuc8TqzkmSwIYY+jlvFqpieMQlKM
         P6VCi60+oo1snCMBbYd8rlcwLqHgF6NP19BNyXhnI14Q18jKmx+QdlDu9oaW9U8YwC5s
         04lZHLFzIRzv6IGAEyjtY5rFKZC2ACP1id8364eECusOqKDMQDus2j/Lv9lXAVMGLyvf
         mVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEUI2YgJeyDPI47V6RGt0fYdsBueMJxQ+51x+bPWfXk=;
        b=If1906QK6u/2puyG7p97FGCR+E7jEFXtJF6eHzPH4rsIvvvxaU8FOzHpbf0uWCa+u/
         5Nx0Vat+Nk+gFaRhXNLaus4i0KMtgEtnscKjDqgUFLmw4hqfImsKHk/mrytPdHeAI7eB
         ajd9PxjT6XeZFCGw4rAuY/29xR2P96KyG6x44E5Md04zQELW9mf7Prf6y6UO6v3D4H3w
         CZBB2ryDMTyUFP5J6T0dVn4tUzZgmDMQAvgHMsv1OT0LO2+/nSBxMj8/nP+9ISyfhqmC
         ezRcL2xE+vS41uzbJhqnb4pp6HjOaUVKBfeC06LTdCSScZ4uhLm11ElxTyO5DnUMuZdk
         j9Vg==
X-Gm-Message-State: AJIora9SATPNrCY8hF/0OLL1ryrlyebGbPlfwTSoahqV1sddXJ+ZJyq1
        L8zmg0WXx6Tmeiv3oRMF224rDw==
X-Google-Smtp-Source: AGRyM1scAVu7vTSEgbiRLCuBIayZlj7HVQWoDuynLy+Uu1q2Kg8/F1hdn1mAdxVUHySH9O31TrhWkQ==
X-Received: by 2002:a50:fb9a:0:b0:435:6c0e:3342 with SMTP id e26-20020a50fb9a000000b004356c0e3342mr17380428edq.337.1655754109503;
        Mon, 20 Jun 2022 12:41:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o18-20020a056402439200b0042fbc23bfcesm11448549edc.46.2022.06.20.12.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 12:41:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH 01/13] dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
Date:   Mon, 20 Jun 2022 21:41:42 +0200
Message-Id: <165575403865.144830.4698856147792054347.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504131923.214367-2-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org> <20220504131923.214367-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 May 2022 15:19:11 +0200, Krzysztof Kozlowski wrote:
> Add compatible for qcom,sm8450-aoss-qmp with qcom,aoss-qmp as a
> fallback.  This fixes dtbs_check warnings like:
> 
>   sm8450-hdk.dtb: power-controller@c300000: compatible:0: 'qcom,sm8450-aoss-qmp' is not one of
>     ['qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sdm845-aoss-qmp',
>      'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp']
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
        https://git.kernel.org/krzk/linux-dt/c/cd3cd7d63543e4f963a0c823cd8fa29f4fe12f2a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
