Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD9B7461EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 20:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbjGCSQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 14:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjGCSQI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 14:16:08 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CC8E6B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 11:16:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso7584715e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408164; x=1691000164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfbq0gETnI1sgMFmbHrdDFl/8/rFlwdeWeNPy1LZMAk=;
        b=DyUggfEIdkP+zEhWECWn3vTa6gXyOFU9JIQ7hglnUTo1f7fQ6ekt+EV8pgkAYM+Jqf
         kRzL3Brc9MwA3lln/K4xWNuIBlLrkexczZhd4mDKkAia9xe1A0tjxADUmYDSBPqW6d1h
         E7DfxqSpDMkQArzT4/AgXRfTkfg6yNSjRXgwf5fRlrOQrX5dxkTriCF+VBzWjYO9rSv4
         X0SFrTGjs6zw3vDh99ytBEL/MoD5M6TMlizOm7DUR031HFbqBPK+g9gxKZVEqnMPCoZP
         vIJahMZv/da1p+w0+idh6HtVbiJ6uKZhmGLaZGrBChoJW0HSNJdmF+VNGJUDXewvyvZL
         RqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408164; x=1691000164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfbq0gETnI1sgMFmbHrdDFl/8/rFlwdeWeNPy1LZMAk=;
        b=PVkLZSRvHa1vGe5iwoq0eVSzcjQk52RXURuW2Fdr3c2PrvnaMD8hLNTw4P01fGPVdf
         W/mO6/ZQX5vQu6jR4wo5hYpAVNh3LcqH1e5ZiYGyaXd+iEVV9i46Owp7hcNnDXtSoP4h
         Bt6P6oiDckYifuwafxPFzRVpVC7c98m8TKWuvKzHKp62rthtQqwKMTFll9LPcVDj1SK5
         3HTQupqs+mg/U86Py3rPprxgAm17OIxeftWHgVmZ0Jqq9X9T+Tij71S8xa4xQN6D6ZFa
         Xd52OQhMJOcIjc2FSajl1rnaVwTzuL/8+ttYmpPVrI56Vw/NPivjYT+krOp3AbkrhoBz
         aoKg==
X-Gm-Message-State: ABy/qLbow6RXgVfZocPW720i+uUB9rPzTchUUZ09d5pi5oWZB5ntJUQr
        xW5/kY1nq7d17YRPX01HzL8J8HbZ+4ANDGgtRatwJg==
X-Google-Smtp-Source: APBJJlEd6e6YYV2peNdIjMzoqqPTLL2+ZbtH8QHhIBO9CiowXKyJWLK4BqfjRZRngtj72+4U1C1Ubg==
X-Received: by 2002:a19:7418:0:b0:4f9:5d2a:e0f6 with SMTP id v24-20020a197418000000b004f95d2ae0f6mr6907671lfe.14.1688408164399;
        Mon, 03 Jul 2023 11:16:04 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:16:04 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 20:15:56 +0200
Subject: [PATCH v3 3/4] dt-bindings: display/msm: dsi-controller-main:
 Allow refgen-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v3-3-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=960;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UEARP/nzfff11sHWpuDiJ7VAKYi5TYY87h31tjxPZWc=;
 b=2TMqshCBAOBb1jGz8NS6X0REmrqcs64ytZcs8i+mMynKuIQDOWTOhDG/OmtTBPmumuHXIAZkK
 nMkhkBhtndwBN90jKKlwxo8uAZAwxLRYbbcbgtS0ZfB+daC1S74bqu3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSI host needs REFGEN to be enabled (if it's present on a given platform).
Allow consuming it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 01848bdd5873..76270992305a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -166,6 +166,10 @@ properties:
     description:
       Phandle to vdd regulator device node
 
+  refgen-supply:
+    description:
+      Phandle to REFGEN regulator device node
+
   vcca-supply:
     description:
       Phandle to vdd regulator device node

-- 
2.41.0

