Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1416F39C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbjEAV0a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 17:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbjEAV00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 17:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E242726AA
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682976336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mDamfEXI3whq2cw/x9Hd2+R2GXvUBBZU4UUvZz4CPZQ=;
        b=KmK34DoZgicG6LK/GFd3p8VyUSo328aINdi6FCD1RvtQF8lcnUNKe5KXKiAEUSLZRTSWLr
        XOuQPAvpl5UvyKa9erEV9wKVj9ocwPKr0I4wXINCLYnNN++1gwQ8Ald2WZX4I4SMehTWtY
        rDOfBGqZv8GGp53TZLXFO9Ex75fblbU=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-bvI8iZR8M2anKYJBDjSwNg-1; Mon, 01 May 2023 17:25:35 -0400
X-MC-Unique: bvI8iZR8M2anKYJBDjSwNg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-38e0523ba37so1983597b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 14:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682976334; x=1685568334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDamfEXI3whq2cw/x9Hd2+R2GXvUBBZU4UUvZz4CPZQ=;
        b=eJOK9cF2AnPqAUDRE07d+Nn3rpk5Qpj+dbfqX0+e7tb19EcmqkZX6CoBWs4Vgod/Pi
         nYezCGC4+areWlU6tys2rLzMo5SP56C5gxJ3Zk0pBRQqOUAiiqd2sb1k9Pavm0anDHpF
         otX/JJLgc+PCntTrrENsHqLAZweP3WJgXBlhqwIzqzA+O6ut6E7iG7WxR9H9dE/4VM1e
         skN/42ByJmh7nT1VNxn3JuAfdWhFrEWw8enx1nBZS3mCuKe3cJFjC6atrmnFPrqBglvT
         eDsrG7sNRU5qRu7zIpjPLf8sd7+QR4vnCDJVlcFcv+77RSTQHF12ojBUUEb15OjhfLKb
         EYLQ==
X-Gm-Message-State: AC+VfDzWnOBOXe1rORrH1PPn8Ujvj83azfvGoNOFdPAj9AyZUMTlNw/U
        AvbTjSl0NnwrAo5AXEH1PzIcLk/W4Rr51GemR2GzkKgFEg6BmzAzMA2zxF06JJahqLgnu24CH0y
        ruILOD10TXkOc6QM8b4yOJPdagg==
X-Received: by 2002:a05:6808:4345:b0:38e:50:415 with SMTP id dx5-20020a056808434500b0038e00500415mr7011946oib.44.1682976334398;
        Mon, 01 May 2023 14:25:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BYwS+ULQ3y0vZhVcaPo7KzPmc9j3hnqCUWlnnvYXv9iYD7qYyCrXV++03Po9pEsgckmWoVA==
X-Received: by 2002:a05:6808:4345:b0:38e:50:415 with SMTP id dx5-20020a056808434500b0038e00500415mr7011943oib.44.1682976334174;
        Mon, 01 May 2023 14:25:34 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id q5-20020acac005000000b0038756901d1esm11911385oif.35.2023.05.01.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 14:25:33 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: sa8155p-adp: Move mtl nodes into ethernet node
Date:   Mon,  1 May 2023 16:24:46 -0500
Message-Id: <20230501212446.2570364-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501212446.2570364-1-ahalaney@redhat.com>
References: <20230501212446.2570364-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mtl nodes aren't evaluated unless they're under the node with the
compatible. Move them so they're now evaluated in case future patchsets
modify them incorrectly.

An example of this can be seen in the link.

Link: https://lore.kernel.org/linux-arm-msm/20230414145844.wyg6pt623pzqwh5l@halaney-x13s/
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * None
Changes since v2:
    * New patch (me, after realizing this on another platform)

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 46 ++++++++++++------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index b65e0203d783..02d04ce877c9 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -47,29 +47,6 @@ vreg_s4a_1p8: smps4 {
 
 		vin-supply = <&vreg_3p3>;
 	};
-
-	mtl_rx_setup: rx-queues-config {
-		snps,rx-queues-to-use = <1>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-	};
-
-	mtl_tx_setup: tx-queues-config {
-		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-wrr;
-
-		queue0 {
-			snps,weight = <0x10>;
-			snps,dcb-algorithm;
-			snps,priority = <0x0>;
-		};
-	};
 };
 
 &apps_rsc {
@@ -365,6 +342,29 @@ rgmii_phy: phy@7 {
 			device_type = "ethernet-phy";
 		};
 	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <1>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <1>;
+		snps,tx-sched-wrr;
+
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+	};
 };
 
 &qupv3_id_1 {
-- 
2.40.0

