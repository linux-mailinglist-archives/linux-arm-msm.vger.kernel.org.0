Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D109682368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 05:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjAaEjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 23:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjAaEjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 23:39:03 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675DA3B641
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 20:38:24 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id bg12so5278498oib.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 20:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/GKVYrgbIBQHH6fmUv9pOZxtXQP4w6AX+T7K+xd4AM=;
        b=c/fjOBx7+hWIUANgvprYAZdZDNNykXdzcLGb/O9jVHhsJzCNtyCiAaX92yen+hsRuX
         uD9uhR17iks9wh2+1P1K7zvEYJIT2qhTrjVsGicg/aufDTcLN39FYm7UCXLsQEMamtGg
         3Tcikor14qM7xKLcN3zEfQpB+DJN1xyjnL2kx5fCduUS39Ren7ZvF0ozIjdASMiX3AgG
         801AOGAyFOz8iIk2N0vwgUcB2Z0iPolKdC2uR7Gi0XS6uFa1TV6qpsI9dlyQqYPh7RCN
         0mNJJt7HeWR5nwIF5mZ2cBkPKhmwQHkI3xk1sPfuyuTB8ccUB52WsC+opfLwPst+PQWO
         Tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/GKVYrgbIBQHH6fmUv9pOZxtXQP4w6AX+T7K+xd4AM=;
        b=kanvD6kPlN6xLKWt9gCz7TiEqgKzJ0YliRPUuPUjp3GCBh0Vs0YlWLEpFHWAMHgDjA
         fCNRUzpovxe+nwJNwF6NMDF3L10fmcpZmLrXTXyPtofriRqfgHRqza4T+P4klIjJvlSv
         tR4vYBHuz9geOrgbYNuoFRrVN96f4lgPakEZzsj7RNMgU6rJpBr1OQhqDm9t3yKmkOyY
         yGqgTJLsiFqKr6Ws4W00V5bb595hUnroxVesglDo0GajX9+6VkFBcMC1yIayaVgWqURu
         MB/ZDugisqN50i0BVj4cKAztQt0uAlCJwhVtBS6YQX7EhQTTFSrRGUz/74m3JIIEl6KR
         hguw==
X-Gm-Message-State: AFqh2krw3RYjQ8eO18H9gbNmx4OyRQw2LrH7fZVsqVyughaFNX+dWX0/
        rKfUnGAbviJ5FOYvCUy7tBYXsw==
X-Google-Smtp-Source: AMrXdXu1wZjJMPpCW0mNp5fuRR4nUE+0+et1glRZXOH1PYRu3drdI4L6/IVoLzV8Sv1dr/pzNRxOjw==
X-Received: by 2002:a05:6808:23c4:b0:367:29d:20c2 with SMTP id bq4-20020a05680823c400b00367029d20c2mr30414178oib.44.1675139903503;
        Mon, 30 Jan 2023 20:38:23 -0800 (PST)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id c82-20020acab355000000b003645b64d7b3sm5519939oif.4.2023.01.30.20.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 20:38:23 -0800 (PST)
From:   Steev Klimaszewski <steev@kali.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc8280xp: Define uart2
Date:   Mon, 30 Jan 2023 22:38:15 -0600
Message-Id: <20230131043816.4525-4-steev@kali.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131043816.4525-1-steev@kali.org>
References: <20230131043816.4525-1-steev@kali.org>
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

From: Bjorn Andersson <bjorn.andersson@linaro.org>


Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
Changes since v1:
* Changed subject line
* Move node to the correct place based on address
* Add my Signed-off-by
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fa2d0d7d1367..eab54aab3b76 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1207,6 +1207,20 @@ spi2: spi@988000 {
 				status = "disabled";
 			};
 
+			uart2: serial@988000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00988000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
 			i2c3: i2c@98c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0098c000 0 0x4000>;
-- 
2.39.0

