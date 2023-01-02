Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C40665AF02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 10:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbjABJr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 04:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbjABJq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 04:46:59 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9435F61
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 01:46:55 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id cf42so40915057lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 01:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA7kQDh+q8LLqvaJzUQ1pxNh/UVreqHvbllSI3gMQ94=;
        b=BrTlVag+wMLS+zb0c5TK89k7z+qkm/aYqwmwWz9bsUiAT3Z62wzKJLq8M4JkU+A4Hz
         6EJGrxt7nYwegu6+2lxUm6Q7PT8XUXH6k/a/2Qz4wdS+j7bdW2AB6luaAfQS+xfpDH3g
         VjbhFvCiWrEv4VRROyykOuqRcTdO8AM7mh1c3xaNzo+ibCVZmVEbhclDHxWq8IMecLmT
         LKuvtu0Vu2Clo58zV+i89qaX/uoMrs6RGKIzWPmR4QLTWQndGaGZuJugjIJUmF+lJYMV
         2AtrEzepR3ydjs+mDnacP5CEb4VmSfAmfVEyx54xUzvOxcUsBs29qCexjiUU4U8jKCRi
         gvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA7kQDh+q8LLqvaJzUQ1pxNh/UVreqHvbllSI3gMQ94=;
        b=gKxRFkZ5hjy5kGNLWIa1d5JEGhYep2cbqeRBvNnK8OW986hXIYq5ffDnYP4VfSVf1M
         pgkeueLBK0h3aSOi67ztTni4CIiaipNs8RwxfglCspP75i6rJVRW8Ctyt85uxajo05Vr
         AlXuAdJXtqogQ5HubwH/MYGRHNI4vF7YsBEhRiOAOaAE2wmSDMAP3MePF3gczIFn1MLN
         lSx7pou5eM6oZqQyBqJquPSgmmNZeEAlmGXVYDij1Asn/j1sg92o0YHP4kSmIqCBxAzi
         AM6D7N5305+xjb8N1y3qkBwjW/ml1rfDYohatmwtQIFf9i1CK+8NadWpY+e1MhUDb2+D
         qqjw==
X-Gm-Message-State: AFqh2kohPJVyExoFk18/gj+/j6i8tXnmY5iDvuAi857i1sb9BO14U7Hh
        PDxr7xxJGaUwnzWhA58+9UuJiGT/rUH29/z0
X-Google-Smtp-Source: AMrXdXuuzKl0qfhZQdodBbTe4EhMUgaWxyapsnashOUrDYXDt+6Opf0llUsWMLM5R/o2XhtukI0jAg==
X-Received: by 2002:ac2:4bd3:0:b0:4b4:a460:c995 with SMTP id o19-20020ac24bd3000000b004b4a460c995mr16140912lfq.5.1672652813424;
        Mon, 02 Jan 2023 01:46:53 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x11-20020a0565123f8b00b004b5adb59ed5sm4382143lfa.297.2023.01.02.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:46:53 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/17] arm64: dts: qcom: sc8280xp: Pad addresses to 8 hex digits
Date:   Mon,  2 Jan 2023 10:46:31 +0100
Message-Id: <20230102094642.74254-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102094642.74254-1-konrad.dybcio@linaro.org>
References: <20230102094642.74254-1-konrad.dybcio@linaro.org>
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

Some addresses were 7-hex-digits long, or less. Fix that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
No changes

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..a359ced4b6b4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1765,7 +1765,7 @@ usb_1_ssphy: usb3-phy@8903400 {
 
 		pmu@9091000 {
 			compatible = "qcom,sc8280xp-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
-			reg = <0 0x9091000 0 0x1000>;
+			reg = <0 0x09091000 0 0x1000>;
 
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.39.0

