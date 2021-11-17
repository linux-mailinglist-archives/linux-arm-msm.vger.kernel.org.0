Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D49D4545CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 12:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhKQLlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 06:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236850AbhKQLlI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 06:41:08 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFD1C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 03:38:10 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o29so1905773wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Yj1E+7leUXuCLv33wLKqEaM7WfS5ZHoS6sCkflnwxs=;
        b=SMhMAYe8bLUcp5dWmlcj6BilmsccoCNaDkawsWLk/jQaRX2RJ2p0J6tgoqCsJGhTox
         t4J1O2R48iP7kXNh7vDOHP5D7ez6/4cLFSl4BQJbC9fR2oqG1Ku//MV17lU2ljGqbuUj
         SB+o0Y6ScsbN52w0crjBHl59SpDo0kGVspINZZGL+VyiTeoeaOKzCD+rOIfx4UN4/q30
         CWNoYqWGeaGZAFA/B6gzI/xpFwnTUcVJt0tjKs37cQaoX5YreqL5iPkezjeJ348nbdAl
         W2oU5e4zGFh0Z6EwiAFONoy1b2WmhIwbSKF5OVczNzV5GaTfJ0vu+vGSScaa/Qq0MnhO
         i7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Yj1E+7leUXuCLv33wLKqEaM7WfS5ZHoS6sCkflnwxs=;
        b=P7TVJAQoNlbJ2a/KA7EVjNtT4Ftkd4Ii0rs6PBv9VhLGOpmdhy/BM6WYMBHz1uH3be
         qYDonz+wAbKhqZKaK4aOb5W3gOgWb95P6CDJgsQg2/2IQ9+3fSyO/urr1XXSJATPI1ki
         54KTge6AhfSTK8fSkh6J3wzApwOypdD6bqQ40tRdBKT+NIBpfp17I9VjDvfLgAx423dc
         y9DpsW2IvxFL22P9ov0MYi0ndDOLa0612P4KpATNcxz2jK731ekugVnCiCom/2+n6s0n
         dLvBIVhGhX4/Y1X2OOCle0KndWQRBlyTHUZacqeHRPVfcLH7z5BcLHuaufVY9MdPI8Ky
         ywoA==
X-Gm-Message-State: AOAM531RmPIPfpXOdbkfhFNtLQSgFBu0kF7kbJntEh+YXYy+5C1zV1uW
        4UrSjMPcchnv7Ghbl6uxmk/GQg==
X-Google-Smtp-Source: ABdhPJyaLzUnAjPg9EjuinF1Qv7XY8txM/DgNF7EjNWsZbhWJZVHeG/n7+4frZw0kBAjF+Lnri77TA==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr16396171wmk.93.1637149088633;
        Wed, 17 Nov 2021 03:38:08 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id t8sm6560453wmq.32.2021.11.17.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 03:38:08 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8916: Remove clock-lanes property from &camss node
Date:   Wed, 17 Nov 2021 12:37:59 +0100
Message-Id: <20211117113800.260741-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211117113800.260741-1-robert.foss@linaro.org>
References: <20211117113800.260741-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock-lanes property is no longer used as it is not programmable by
the CSIPHY hardware block of Qcom ISPs and should be removed.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index f8d8f3e3664e..faf86ce165a8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -248,7 +248,6 @@ ports {
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 2>;
 				remote-endpoint = <&ov5640_ep>;
 				status = "okay";
@@ -284,7 +283,6 @@ camera_rear@3b {
 
 		port {
 			ov5640_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
-- 
2.32.0

