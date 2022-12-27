Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F65656C1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 15:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiL0Olg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 09:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiL0OlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 09:41:15 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D24CDE
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 06:41:13 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m6so9477728lfj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjyjRmy5puUpAtPf+wBK5e8kuBWUmUhZYIEd38wFUkg=;
        b=iqt9Q+ASROGcthdWWwR1bPD+878wxS0YbGiLwBal2Sjg64M9Sbj6ymHdk5IVGimNbq
         cnerpYMtnDFuMhGVZL85sWlplz8cOKfUUyTDpSSCr9FE1/TD8KjEtIi545iauQlBYXi3
         o49/0L4/4F8TcuHw/T1se3pSlJ0AIqzS+KwRb7RTFIrd062EFAlocDWEZ27VaKwdix5V
         l/SYtZO7cjdPzt2FKsbCpfEpKBP0BjrQHQ/1QKT3kzPv5Jzf6QhaQ9kboLgyDsU6HV49
         i6cS9xYYP5Jl4OUhkdF2eTzruTQL1O7fyDkGad8FQ/N4iWCwm7npxkjwqu1Q0GPeHXir
         bxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjyjRmy5puUpAtPf+wBK5e8kuBWUmUhZYIEd38wFUkg=;
        b=RQhiYlhD7iZNyDqcyuXPqLLeUkG54wCo26M7xq59vSlPqMRegkO5/VWM1C6gKu02BY
         Efbv/aPDo9OUuT/5dMshaXhD93J7HK3DzPPj6h87u7SOAnDxcRA7l8SH6BnYq7z7SbN0
         HDpUi7Ipt7bKH5s16ViE/Vy051laq8e2OhbPUMnYRIHGERniYALOTfezfGJGJtMlG55N
         H3eMe/jaRAC5+viOWPs5ZhEHNBV6fmz4JhdCAE8MQyx/N6r8G7uRQjs0hWCfSp0raf6G
         uHDULoH5vETMzPfHFxwKKkf0Ao1QrH/nCn5aeI5T6i60V0EdKJwSjKA6Quvjsp0mtbUx
         KsHw==
X-Gm-Message-State: AFqh2kre1c4Yac320yuUk1sPEh0js3EWPxN6fHck8F1wIHXAEPdFDBgR
        z4YMcOfVITYaGl4pID0EkyHlwQ==
X-Google-Smtp-Source: AMrXdXsN7VYeo+NLz+OBGeJ/ih1X9X3rq66Kh6o9M+PbOedlYzXTZHk713zzkBLV6AwEia2Mpi60RQ==
X-Received: by 2002:a05:6512:159b:b0:4b5:9138:145b with SMTP id bp27-20020a056512159b00b004b59138145bmr6909852lfb.14.1672152073208;
        Tue, 27 Dec 2022 06:41:13 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512214100b004b5853f0fc6sm2261126lfr.246.2022.12.27.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 06:41:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] media: dt-bindings: qcom,venus: document firmware-name
Date:   Tue, 27 Dec 2022 15:41:02 +0100
Message-Id: <20221227144102.79391-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
References: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Venus Linux driver loads firmware based on firmware-name property and
some DTS already have it:

  msm8996-oneplus3.dtb: video-codec@c00000: Unevaluated properties are not allowed ('firmware-name', 'interconnect-names', 'interconnects' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 4a5c1d55c202..3153d91f9d18 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -26,6 +26,9 @@ properties:
     minItems: 3
     maxItems: 7
 
+  firmware-name:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
-- 
2.34.1

