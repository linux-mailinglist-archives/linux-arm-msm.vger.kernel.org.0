Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EC3517769
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 21:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387122AbiEBT3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 15:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387104AbiEBT3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 15:29:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45907108
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 12:26:07 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq30so26969294lfb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c49kkjx2fy3MeTzrRmuPxxWXGx08IMe9Dcd+JXOLX+0=;
        b=ldKKAQaCKDk3JYBAnt8LZZq+oZEJAvlRntWJKHrZN3CMLHaRRx2FFLg33P53PKeECW
         GIYN9xd59ElMgy4QBk0iQRlcn1fvHSZIrb1EvQ69x7yth+65yU0s0acjtEl39/RsTPpx
         82Vv++LUMTK/IdtthjuSYFDdzn3fm57kspHKrhkpLVxV9re05K5FWDZ6brjsO+YyiW8R
         qIgyDozn5aC5//ae4aZnuRPvmPlZUHsU1BSPW6EsohO5R55tIGe2qEpUDktMt49WaMih
         p+XqSg1lhYXWhzha6mmiXxf9q6tlRmb1R6bLgPn9kxuBkoP4AmzJ1ms0lqINH0C9qYmM
         EScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c49kkjx2fy3MeTzrRmuPxxWXGx08IMe9Dcd+JXOLX+0=;
        b=NVjVbAMS7BDTSNL+GUgwvECiJ8D3kRo8kKTF5dgV0MTmAj5ZZd1hR2oYcoSleU6Gjh
         O1svai9I3MDhcfiVJRaxubI1RPDhxxUmUOIfxD5hJhO8bCQFbjwu2K463qlQu2cDZkzG
         5nqSpRkz+MIlcfkVZacIWa1edwDwdt5DwujeOWznfxJvRlPZOhoI1HnzLHP9By4JrhwC
         9QYjB9gu9snPjzPSF12InpsUdf4kfDI4ga1p+W4RKj2fF+SG+r0Hmy6Ts/eGYJVEFHiM
         cnpOMHE+9MlqbgS5ZfNYSwxB5jFs5dwN1ckRzJsKVQ+5MDpLFtadQ6JWupSnaXUbLUbr
         w5rw==
X-Gm-Message-State: AOAM5327nOyhusjCSSQl1MUh12uxEAbKmilckPedNoU0dXdQl+fonmtl
        QjMes3/Caq38FBQcqrRjkYzMsQ==
X-Google-Smtp-Source: ABdhPJy5HcOII9BlPXWeu0agiEN4labVOEKtXx6T72OsY7RsgNY4IM8RgwHrmm6SCAcPbK8KZBKqfQ==
X-Received: by 2002:a19:6915:0:b0:471:f9a9:7777 with SMTP id e21-20020a196915000000b00471f9a97777mr9943439lfc.428.1651519565644;
        Mon, 02 May 2022 12:26:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020ac24c0c000000b0047255d2119fsm771489lfq.206.2022.05.02.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 12:26:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2] arm64: dts: qcom: sm8450 add ITS device tree node
Date:   Mon,  2 May 2022 22:26:04 +0300
Message-Id: <20220502192604.272686-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

Add device tree node corresponding to the ITS part of GICv3.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Fixed subject to mention sm8450,
 - Reordered properties to follow recommended order.
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 5f17540669b0..c8eeef5bedde 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1693,6 +1693,16 @@ intc: interrupt-controller@17100000 {
 			reg = <0x0 0x17100000 0x0 0x10000>,     /* GICD */
 			      <0x0 0x17180000 0x0 0x200000>;    /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			gic_its: msi-controller@17140000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x17140000 0x0 0x20000>;
+				msi-controller;
+				#msi-cells = <1>;
+			};
 		};
 
 		timer@17420000 {
-- 
2.35.1

