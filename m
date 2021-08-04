Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B1F3E09C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 23:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239987AbhHDVCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 17:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239861AbhHDVCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 17:02:34 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CBDC061799
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 14:02:21 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id f8so2932748ilr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NjqtwhIzT69tLKAymSZ18OrAY8s/2mcd8Zh8B0GqWaw=;
        b=ZhFrylSiWwzX9cnU058+e5dsOIR6iLTTokF7dtxFN1BV6e98QEkjFz0Oo5Sdj2XBug
         CaWko/QaCAWL850lY9cdQR7hhBPUnMGoTMQgDouFPAhNZ9mEjIaso8ASs7ce5ruOPpRc
         +c6huaIMOANZuU0VeQcSeXXQCxpvJfMetrMjczRJcTCSaZOMNl1/JaVOQv3ozgez+Q8/
         iulQeSwCvPdbRqeO78LegWoE1tnssxWfQOGSNR6MwuK1GhezDHH8+UC8/xlO0+F9FEdE
         Lx95fQt7ZDB+6is+DVAdfyNN9IQa/IFZJP8m4p4K17FYVG75vPPGcoxyCVLvlxnTNZ5m
         U2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NjqtwhIzT69tLKAymSZ18OrAY8s/2mcd8Zh8B0GqWaw=;
        b=nf7AQT6GlnnaX9Da2CKsz62vviRAWw9k9LNbi7GLE27KjlRYLXHyRvzs0tlxy5mH5/
         8dn4vzicsO2UT+lFhbKQhQMfKTt0U2EVZPptjyW+9A6CzUF7KrrtB2INtH1vUXmLFxcf
         kYmkdrQy+l5Tba474jQ5Z/D9SfdKlOJQvZ1FhWfwtdPJJHG9zlXaOMBgxMmWK3+wWxRT
         iQ5v0Y2km+IR/Mki5/ItDu1ChoJDEu6hHXkFu9bc30cqvgheUAD2yabn8SOtG8wuIo/k
         Ne88CKMUf55XwJwREmmhqVVbN/SmyPtKfoWOteu7QliULv46F6r442HwfYN7339rCwVQ
         Xh0A==
X-Gm-Message-State: AOAM5329/8nARs9XbTQfhd9DStDe/DC76nY8XLg4DzWx1wU3pu+XgW2h
        5J3JkRDKl0UeOVbmj7dB5SJ1sQ==
X-Google-Smtp-Source: ABdhPJyxrJ2p1cpMjRNVcbXiTUpcDLT12R1hq0MOO0ygZjDeB82TO2dsXp74XzgBB3/9GPOOYwT/Pw==
X-Received: by 2002:a92:c8ce:: with SMTP id c14mr924242ilq.1.1628110941103;
        Wed, 04 Aug 2021 14:02:21 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id d18sm1687396ile.32.2021.08.04.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 14:02:20 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     robh+dt@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: sc7180: define ipa_fw_mem node
Date:   Wed,  4 Aug 2021 16:02:13 -0500
Message-Id: <20210804210214.1891755-4-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210804210214.1891755-1-elder@linaro.org>
References: <20210804210214.1891755-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define the reserved memory space used for IPA firmware for the
Qualcomm SC7180 SoC.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 9b65896d62dc1..5b10eb4be2b1d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -110,6 +110,11 @@ tz_mem: memory@80b00000 {
 			no-map;
 		};
 
+		ipa_fw_mem: memory@8b700000 {
+			reg = <0 0x8b700000 0 0x10000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@94600000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x94600000 0x0 0x200000>;
-- 
2.27.0

