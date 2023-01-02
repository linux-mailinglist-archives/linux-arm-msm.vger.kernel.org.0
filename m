Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C601F65AEEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 10:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbjABJrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 04:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjABJrL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 04:47:11 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFD9F51
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 01:47:07 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so40901812lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFH5sK94uUGkYsnyydALAXbzDgDXUUC+E+qx1E7ySAM=;
        b=SJe8rHz/YDTIXCHCDE7saOduaDb0NOvFy3Es2bU/6RG0SYmKkxwoXBEp3+lID3Ugd0
         iugtcTjCMM0XpFW1oWHG/Ir4XsCMXeq27kfQ2zza8S9SgdlxqnLdxxtY4sqU3E8vUtXo
         0qCeJAkcvX67Q2WkVIhPbVcGILApL5lhHWp0+K0Mcv+iqn3sVE21/TswKiqy8xb7Ed8y
         YYGTw4O0PvyUvapDqhExfr9WBXZmYSqE2uOHyjabl/wkBykh3zRoefKVE74pcMMJKdKx
         /cUWRL4vizEgjo9jm7vG2itaLzwnTJyd3o6jlReyTNoj4NWHhZoR7ijZywSuIZTR/bjf
         vZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFH5sK94uUGkYsnyydALAXbzDgDXUUC+E+qx1E7ySAM=;
        b=4lC/0IXDAwhost9FAG62/QEyXbQJeKzQlobVat9eZU6PkS/7dQpOXkWmteJrwNDzL6
         we86PSFskc/oR2u3U6acdt98LJcHXDXYk+N5dlMFQCKYsQACs54TGP3yoDfvOkcmN3SE
         c1AEA6aPmBYKm84Eo49HhIf0uav1kQ7iB7e7VtYsytpn2ZJtDPvPxF14OWSxVI2EKZ0H
         Rw1o6bM8AhnxWTEFVHNB7kb3jDb7+kZFK6ee6yGC23YiOcD63drLVSLlGlJfLtJaHC5t
         tbuGjEOgMIexYmb9JAE+UW0ajtmZe5ivjXWs4W3A6kw5WV//04c87SWkzMMG/L6LKmko
         1ZvQ==
X-Gm-Message-State: AFqh2kqr4VLC3Wn7t+Zs0jblqjJIXYgEVCI20NBTNXjyzUKiE6SyWLHj
        AtW39GE1B/VV41KNhbR+7N7/cT9BRM0Ze/Xd
X-Google-Smtp-Source: AMrXdXsJ1M2wiSOxFS23TOD7mPMvDEgFfoTHHxBYRO/noBgof+DZcXeFOgGbXoX9y/Jpt1YlWL0k0g==
X-Received: by 2002:a19:ac41:0:b0:4cb:3471:ab94 with SMTP id r1-20020a19ac41000000b004cb3471ab94mr1212271lfc.31.1672652827246;
        Mon, 02 Jan 2023 01:47:07 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x11-20020a0565123f8b00b004b5adb59ed5sm4382143lfa.297.2023.01.02.01.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:47:06 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/17] arm64: dts: qcom: sm6115: Pad addresses to 8 hex digits
Date:   Mon,  2 Jan 2023 10:46:42 +0100
Message-Id: <20230102094642.74254-18-konrad.dybcio@linaro.org>
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

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index b3ed6ec16205..76dab4c2e8ed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -831,9 +831,9 @@ ufs_mem_phy: phy@4807000 {
 			status = "disabled";
 
 			ufs_mem_phy_lanes: phy@4807400 {
-				reg = <0 0x4807400 0 0x098>,
-				      <0 0x4807600 0 0x130>,
-				      <0 0x4807c00 0 0x16c>;
+				reg = <0 0x04807400 0 0x098>,
+				      <0 0x04807600 0 0x130>,
+				      <0 0x04807c00 0 0x16c>;
 				#phy-cells = <0>;
 			};
 		};
-- 
2.39.0

