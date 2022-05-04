Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A57E51AC10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376366AbiEDSGP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357456AbiEDSGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:06:09 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3914FC7C
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:21:21 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id c19-20020a4a3813000000b0035ea4a3b97eso295464ooa.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORNPzRgYv7YnV5Fde8tTKS8ROVdrDUKlmliJj1FHZuo=;
        b=g8IyPtmt4/LHdH3ytClVEo0NkSuL5GdZYSYGabLd3MJIiBFuxruqO1CfgPHDBvuFhR
         4qPpFhLcuq/s3U7p8JgycBU7NCO2wWwJGn23mtqfHOJUyPyNKSQQ8JHsxq4cu+ar+Qqe
         wSv++IE/PdQ9B0P5xRMd9142XGt7Xyz62AIR7UjqGnVq0ZIQNQgm/4ePP6I5lkZBRRTR
         yj1XZK2PobPThZE1SqOgZJkhN/KLs/rjMNAd6BIU+p9+j6dZk+jVthzJvuEMPPuN+z9U
         LdXKS0jdmpOq62JXBtAdyXn9falbeznu5Pk0/PQXit1sPl1DJyV33DO6XuWtk6MyNjTk
         3Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORNPzRgYv7YnV5Fde8tTKS8ROVdrDUKlmliJj1FHZuo=;
        b=GXSAkSy7nUwdb7kOxoGrUm5hIf0fiJvb3T3ht6b6KUEhll6sQknS//W/tkngspwTJf
         bw15PDXTd/CYh7GcOTQ3udjbHIJq0U9aDGKV4me6WKfOREug6OacOyQkyKDXyuqsWhgl
         eMqebEWa8M0ESNXdoCJ8ldBh25211HPU6b+Fs7bKQevkyJAR+/NuB1RIWPBxstnXihKz
         IGeRTm6Lzr24t/1ZXgUzPWhVtlWKPvrt4moeT2GjtPncVVrKxvrbt/Dvj51XJtwrO7Og
         YSh+xjj/du/WRtXPiuP8QhdSRTEbjr1UI5ATz4ptG6vPZ9Ovm+QWL2JIOjrSKYyLZOq/
         U/cg==
X-Gm-Message-State: AOAM532pbSaaPgmqZXeglDHU9S5FOyDdOZ9iX8rs/JNqjyxaFpz71IOe
        rl1Bu3dXxd/ZQI74SArxhdBsMQ==
X-Google-Smtp-Source: ABdhPJwMqSVDuAvnYy73jmRdQoEIfgo5fv1st0dqy1v9VMmqrrghT+nr0jbtij52v7QbgZqqgS+nsw==
X-Received: by 2002:a4a:d047:0:b0:321:1ab0:e461 with SMTP id x7-20020a4ad047000000b003211ab0e461mr7583384oor.20.1651684880902;
        Wed, 04 May 2022 10:21:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870b14700b000ead8b89484sm5785452oal.5.2022.05.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:21:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: llcc: Add sc8180x and sc8280xp support
Date:   Wed,  4 May 2022 12:21:06 -0500
Message-Id: <165168485227.3730817.14981788668130390818.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220502215406.612967-1-bjorn.andersson@linaro.org>
References: <20220502215406.612967-1-bjorn.andersson@linaro.org>
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

On Mon, 2 May 2022 14:54:04 -0700, Bjorn Andersson wrote:
> These patches adds support for the LLCC instance found in the sc8180x and sc8280xp.
> 
> Bjorn Andersson (2):
>   dt-bindings: arm: msm: Add sc8180x and sc8280xp LLCC compatibles
>   soc: qcom: llcc: Add sc8180x and sc8280xp configurations
> 
> .../bindings/arm/msm/qcom,llcc.yaml           |  2 +
>  drivers/soc/qcom/llcc-qcom.c                  | 60 +++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h            |  2 +
>  3 files changed, 64 insertions(+)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: msm: Add sc8180x and sc8280xp LLCC compatibles
      commit: d0d8cb7b94b8d23e9721cbbec5c7b00c04ae6514
[2/2] soc: qcom: llcc: Add sc8180x and sc8280xp configurations
      commit: ec69dfbdc426f22a9557e5c5408d7902fe0e0144

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
