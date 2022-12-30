Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0B56595DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 08:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbiL3Hni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 02:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbiL3Hmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 02:42:45 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA241A23C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:42:29 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id n3so18494091wrc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AFK51349QJ0+Ar/9LyUa3RFs2+XbTP6GGanaFPZqqk=;
        b=4tlJg+Kyqh+spAFYZ6rsYwogBP/vXCAFmaT1XKGDZZDMMUB++fkGLqwyuJbEIJQ7kC
         ooM9OmaNK6b2hAgY/KK7qEKv3KN8nFmeU+93vJ2LVa6oi0VHaw1R57RcGNWHt5jotVl2
         uH0zJPNZBuDIbAZgSC+ZTybWeLsn8RfQGcmmGZc7Ky1ghjsNDfF3X5kv1x4KHheduHL4
         M5FC96CCgsKI3SMPsORry/ecoNGVjM3TBpmb0/4IJrvCh6dEU9aR8ZfWnoWEgl2m7lMX
         EeAMBk+CIYZVUu8Rorz7Mxa7PMpHN9BlBygFbgLDzvpvTORkFcPs2hRcDZASqoSfpO+/
         bBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AFK51349QJ0+Ar/9LyUa3RFs2+XbTP6GGanaFPZqqk=;
        b=EL10drSpWI1EqNkCnJcm+BClVzft1ecTJfcxAw5RqIkUROKZ3UDaTjRhLd0YqDV7W0
         8WPFNnkKatswt5MaL+n+TY474X5rascM4jcf8cIDx74zWcfXHsj1yOi4bYei3VdCfafH
         4mn4GTSOSsyr50cItFuswQ6v43nIbQuJEGQ6dkLyfa3RSNahgWGXlSmuwYxgNLe9Yw+f
         skY6dCzsvpoBeLQE1dV5PLwo0m+hwllj3w5eKJX0vIujQacTRE3AkMmeK/vlECG1JrUW
         CiwyoBTkQjhPw7+hZzqngpTD14oaLZn/2vx6rtYdsc1F5UzDGEA6lCMqR7BOP9MCx2K+
         koCA==
X-Gm-Message-State: AFqh2koXoLlbWykn0gUQD+apBuctpg9FxDP5RioBX4HjN7OBBXUDYrmI
        /GrLSTQaeJdXMQ9M6OtKAVa2Sw==
X-Google-Smtp-Source: AMrXdXvvSxOl/IYJdRtoKk7/wnZsSzRjN8xIDWKHKQKkGCwAPDL65dluoUtz1mfi8uDEAqt1p56Oug==
X-Received: by 2002:a5d:66c6:0:b0:277:ae6c:a94d with SMTP id k6-20020a5d66c6000000b00277ae6ca94dmr13187947wrw.68.1672386147843;
        Thu, 29 Dec 2022 23:42:27 -0800 (PST)
Received: from [192.168.0.28] (2a02-8388-6582-fe80-0000-0000-0000-0007.cable.dynamic.v6.surfer.at. [2a02:8388:6582:fe80::7])
        by smtp.gmail.com with ESMTPSA id a6-20020adfed06000000b0028e8693bb75sm1887655wro.63.2022.12.29.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 23:42:27 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 30 Dec 2022 08:42:05 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm6115: Add missing reg-names
 property for UFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v2-1-dc7a04699579@fairphone.com>
References: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS driver expects the second reg to be named "ice" otherwise the
Inline Crypto Engine won't get enabled.

Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 572bf04adf90..85673d562723 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -704,6 +704,7 @@ opp-202000000 {
 		ufs_mem_hc: ufs@4804000 {
 			compatible = "qcom,sm6115-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x04804000 0x3000>, <0x04810000 0x8000>;
+			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufs_mem_phy_lanes>;
 			phy-names = "ufsphy";

-- 
2.39.0
