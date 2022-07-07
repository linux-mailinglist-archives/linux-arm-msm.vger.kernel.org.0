Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B92E569801
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbiGGCbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbiGGCbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683502F3A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:30 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id e1-20020a05683013c100b0061c1a6b8d11so85105otq.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IrYRnyETgfQTVYXXZDJKeIAmnQrr7pDqknaCi8RKLBU=;
        b=zM+SSWTpQE+v7EYYafIHiYRJlTL8aAAL/SBVDdrY4Krr0nAWcyMvb8BduZ6ViQ26bM
         5AzT0/PSJIO6fXqace/fePiU58mr7etHJZYCEc5KEoZ/3ZxstH4IzdHExHXo7tzQrjrg
         enGiUEr2lJlsSvNm3dZe/VuURr5Y2sUX2z2cMfB5TCitBxKWqx1pUzSKVGF9qScpHUSZ
         xYd7PbbuQ32gQyOfj1MZd1Q0NMOjJseJwGnV6jsct1kvKHGmUasi2az4JvPDzxZwa3P9
         2GMI3pUsVxEBCbRU2c8OQjwhK9+85YbBA4m5YtzOkrC4X6ZiY75FGZKqzfrsNtzvgKU/
         hAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrYRnyETgfQTVYXXZDJKeIAmnQrr7pDqknaCi8RKLBU=;
        b=oJ355oTNPUOqkZIxhSQB8I455UEEKmhAvhJmMU1TPWyGcqypq5o3OVoSnufh5OozUG
         bQnRuJqGGy6SDQ976dmDg1lfAYuTt7PJAizxUioNNG7jPN7E2n2IjIrVNakizLtVdvuZ
         LYkngmn2Cj629tFqQyoqR7oFu7trz87ihP3FJcuiEt+clvuIG8sph+a0yknrRM8gtpfg
         ve2s+/LsIlfbb7NJmBKz1LCUNRbmyQ6JGIEoyQLMvCJY9gBmBBERsN/sy4e/Csy2dKjG
         4ed5LWc6ziNncUtVuMAKwYy7viuEitI/plZFru4eekStCRVX+5p1WGxS5rRsVZ9MqE4e
         fgWA==
X-Gm-Message-State: AJIora+OVqwilkvrWAWVRKWx8NWjmNji6fxGyaUYqn1xhCqQKPGTv1MU
        AJVMR2wnIDYMfPCO3a5I3oqyZg==
X-Google-Smtp-Source: AGRyM1tXQMzI1gbx73efHezzL2dgtilYGkd9ootF2cW6tNo2JVbKsJgpP/rXB5UjvvcbTmSyI44Bvg==
X-Received: by 2002:a05:6830:638d:b0:616:d898:cb14 with SMTP id ch13-20020a056830638d00b00616d898cb14mr18779672otb.193.1657161089713;
        Wed, 06 Jul 2022 19:31:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/4] dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
Date:   Wed,  6 Jul 2022 21:31:07 -0500
Message-Id: <165716107314.864223.13075882102368205283.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220620071936.1558906-2-dmitry.baryshkov@linaro.org>
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org> <20220620071936.1558906-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jun 2022 10:19:33 +0300, Dmitry Baryshkov wrote:
> Add additional GCC clock sources. This includes PCIe and USB PIPE and
> UFS symbol clocks.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
      commit: 2b4e75a7a7c8d3531a40ebb103b92f88ff693f79

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
