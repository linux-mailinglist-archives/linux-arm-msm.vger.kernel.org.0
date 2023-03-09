Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DFC6B2708
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 15:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjCIOg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 09:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjCIOgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 09:36:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DD0E7CB1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 06:35:58 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h11so2089413wrm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 06:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678372557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIUwTydrTXf3QJzGFWhJQL46gDK6VbddHZPZXYJYKXc=;
        b=y0B9Hcs1/biM3E+xqnr5Xq43Ns5x8o410wTyLFqn8G2jr6ebZkBGkyicTFXrDJXMz6
         M62P5H+1yp5zpItWURpWV8uDMMBkH6uSYBKX1bcIQgCmQN5DfwNlzvgRxLziXO9R/3dr
         hKtETefzMba4ekCbKMwFS+hLVQhprOK7BV6R1b9P/8M5lk4XM3dme4LzgYX2U4Kuygwp
         73uqQ7vFTqNM2cvHLETER3xvnGaPxYYHoljrhYMN7qgkB5D8lJAG6y+cIL+PkpDunqq3
         +vHT5xp8rK2LbZusw7rLpT/KL91qL/PCSS7WEL/U5M5tpNmbVZSPt3cqtUB3hizlScAa
         P3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIUwTydrTXf3QJzGFWhJQL46gDK6VbddHZPZXYJYKXc=;
        b=CNiVUyVk71C+FveE8MBKM18HpNmSQjLf27FPMk3dzqWqe0EHfx3NYB/pI6zNF+Anws
         ApeN8uxN1U36FRYWyuOnO7I/cfsqzSAdblT+tZfLIltTuxrNZB9ELtJZNneTHlam7dzy
         UkLxuGVPYbJxVB+O911rDh0oTQdW3rLa+oCDERTJpstN0GXPTJRqgFYykB/tjZ4BzbvH
         gevrQNPWyQWvW09gfourhmiy6tbW/jd1xS4C5govJI12H3RPw5RpBQkvawAzENDRbVHk
         pJ+PPniMWWE/IZMYOb+AuwSid9EwJyserWi4vYOxyvwzc105W96yeijFPfqECGvOizkA
         8fig==
X-Gm-Message-State: AO0yUKW37y4f5tbttz89RaM/oRvsr2wsD43UllfBgERCBOxKvjD49Bau
        0/QyEXPU0Xk2pL0xP6ry6+HbWg==
X-Google-Smtp-Source: AK7set+SHZrMpols1HtgI6MGWnyUNIzywIdMYQ+O2g1hg5ZYIomGJuwbIh/DpYAURNX8P/gINrp7aA==
X-Received: by 2002:a05:6000:c3:b0:2c5:c4c9:515a with SMTP id q3-20020a05600000c300b002c5c4c9515amr13252782wrx.51.1678372556872;
        Thu, 09 Mar 2023 06:35:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id z4-20020adfd0c4000000b002c5493a17efsm17871405wrh.25.2023.03.09.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:35:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8155p-adp: enable the GNSS high-speed UART
Date:   Thu,  9 Mar 2023 15:35:51 +0100
Message-Id: <20230309143551.200694-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230309143551.200694-1-brgl@bgdev.pl>
References: <20230309143551.200694-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the high-speed UART port that's connected to the GNSS controller
on the board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 459384ec8f23..339fea522509 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		serial0 = &uart2;
+		serial1 = &uart9;
 	};
 
 	chosen {
@@ -400,6 +401,10 @@ &uart2 {
 	status = "okay";
 };
 
+&uart9 {
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
-- 
2.37.2

