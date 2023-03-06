Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2EB6AC9A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 18:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjCFRUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 12:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjCFRUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 12:20:51 -0500
Received: from amity.mint.lgbt (vmi888983.contaboserver.net [149.102.157.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D166F1BB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 09:20:17 -0800 (PST)
Received: from amity.mint.lgbt (mx.mint.lgbt [127.0.0.1])
        by amity.mint.lgbt (Postfix) with ESMTP id 4PVlRb4yWFz1S5KB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 12:09:15 -0500 (EST)
Authentication-Results: amity.mint.lgbt (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mint.lgbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mint.lgbt; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :x-mailer:message-id:date:subject:to:from; s=dkim; t=1678122554;
         x=1678986555; bh=VbzUDwgw8Wby0J9gvqa6EvdBS02V72CvMVhm/k21OKA=; b=
        koZJ7DoDrUtqF6AZ/69sCuGLCDTeQcGgEIai26kU+rwwRSVCMP6tfS/NP2goOwhX
        M9Te7Mbw3tj7NG3ZFS01mSFKtTI06XiQziG19VtXWI88CyOqQ4SdM9C4IV/uL23d
        1huZzMVwg8+8iZBk74easxf18jtrODahekokmrcRgR4EFhxTO5bPm2sV79Kho4kA
        D05w73HVL9k2zvc96Oy4HOETaYB4IYwE/svJBTQhmX+fzjoPfySVzN4TkQqHZB4j
        DwQtnkrXRduAysfCbknSkNIkkyFwRxIImfTKME90U+gcgoYSHAcKFx/d1JUU4K2K
        kLxlsHGpGK2iAap8GX4mmg==
X-Virus-Scanned: amavisd-new at amity.mint.lgbt
Received: from amity.mint.lgbt ([127.0.0.1])
        by amity.mint.lgbt (amity.mint.lgbt [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Yvfhk6C104RC for <linux-arm-msm@vger.kernel.org>;
        Mon,  6 Mar 2023 12:09:14 -0500 (EST)
Received: from dorothy.. (unknown [186.105.8.42])
        by amity.mint.lgbt (Postfix) with ESMTPSA id 4PVlRQ0bFjz1S5Jl;
        Mon,  6 Mar 2023 12:09:05 -0500 (EST)
From:   Lux Aliaga <they@mint.lgbt>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, Lux Aliaga <they@mint.lgbt>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 5/6] dt-bindings: arm: qcom: Document xiaomi,laurel-sprout board
Date:   Mon,  6 Mar 2023 14:08:15 -0300
Message-Id: <20230306170817.3806-6-they@mint.lgbt>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306170817.3806-1-they@mint.lgbt>
References: <20230306170817.3806-1-they@mint.lgbt>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Xiaomi Mi A3 (xiaomi-laurel-sprout) smartphone which is
based on the Snapdragon 665 SoC.

Signed-off-by: Lux Aliaga <they@mint.lgbt>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
index 27063a045bd0..4923dafb5d7a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -793,6 +793,7 @@ properties:
       - items:
           - enum:
               - sony,pdx201
+              - xiaomi,laurel-sprout
           - const: qcom,sm6125
=20
       - items:
--=20
2.39.2

