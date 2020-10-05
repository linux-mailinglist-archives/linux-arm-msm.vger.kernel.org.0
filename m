Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838EB2838C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgJEPD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgJEPD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:28 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C8AC0613A8;
        Mon,  5 Oct 2020 08:03:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so10006287wrn.0;
        Mon, 05 Oct 2020 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tlH8tFGN06glbZKMWD61GjMvPfq2+LXNjuTVVLpB//g=;
        b=s9SJz8A70o7kQXfyEHA2+fqpr1v0t6DJkIOB3/DT7NoCYKzxu7ONMJyLAqIW6u7Qro
         XVpKabWOskzSu3rq8yxAHkWWIMMqE3v0qOC2NOcIm0mUejN+4TEiHSYhPQ2lboJ8PFCF
         Lf5CUP3vnJs/Ejeh59V59qmDhBHKn4K3QNxGxBiPNDW6uqd1aeoUvRiAu3M7CCmdTCRA
         yAWGm1aczWV/3JsGDsgVwYRYFYxgufXjoNwPmqk5IRduUNZ+d+pRSnVSXNzDvL6ETjFz
         ZIZmTW+kPFNPHbj4cNWdyY/T7l6gmuco1xIpVxqA3jMmNxO3IVB8eMzZeN9gnKJ5mbiw
         U1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlH8tFGN06glbZKMWD61GjMvPfq2+LXNjuTVVLpB//g=;
        b=WqZw+1uUYZ5la8fH9VffB/DXJZr59ROXUN9lzvoUzx4Iba5uey+J+tL8mRH3J7LEv+
         qpsntlEemL2cqU9ZaOZ9uUJaY0tzVocTOsEteKV+hyLd4OfA6FE3uAa6dM4FJ0N1BoAx
         eI1p9FkS+BmTeFX45AMmy0fsDOEasoxYojlwq808WcG+7lByRA4KCnf+WNJE8UxysFvc
         7GmpnHzoap/XlK+oT1UtX3F0+1utcl57qmT6vx3P/0/npGOSwiWdzRkrNUp65jH6j+qz
         /b9SJ4Iq+ltmGmRGg6/2QHeMoTFaJGdXTXkFMFGCxf84RqlR0LU3ORo4S3bYks6I99/0
         Dz8A==
X-Gm-Message-State: AOAM531gXtKlUb8bGdVcYlbptHNGA7FVjOOKA8Fs6sMvz6Bd2Taqpff8
        hyHYzQ2ZMLI8elxL7beJmvg=
X-Google-Smtp-Source: ABdhPJwKU8vlzAt0OEbt2AoXNmvxhtk218aJRlJH7VFsGPITYJGlL3qz2XiXRITp9PEuMq2rEHAsgg==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr18280179wrq.297.1601910206921;
        Mon, 05 Oct 2020 08:03:26 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:26 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: qcom: pm8994: Add temperature alarm node
Date:   Mon,  5 Oct 2020 17:03:02 +0200
Message-Id: <20201005150313.149754-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index ea2a3d53f859..7825208b0d8b 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -36,6 +36,15 @@ pwrkey {
 
 		};
 
+		pm8994_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm8994_vadc VADC_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8994_vadc: adc@3100 {
 			compatible = "qcom,spmi-vadc";
 			reg = <0x3100>;
-- 
2.28.0

