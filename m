Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157612CD8ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730686AbgLCOWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgLCOWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:22:33 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE2FC061A56
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 06:21:15 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id l11so2989368lfg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 06:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p66zCSnQo3W/z3CB0QSw/3AqqotlN7Qeutdlvdckqlg=;
        b=jgxPxYt/jnVQJAkPwoD8sCDgp0rbl5k06gzoMgH/EW5X8DYc9yOwsP/lDwCmj3c9jl
         /IzFblPeLAVkutMpmgErn9aY3ePsQvzJh7fddmmtCdCIJAAr/IEyR+vGI7XWcNmcPzTe
         eAUkqf4oq5H0jdickE5AbFApp9go3U/wVrcgB2pBYfl9WNzvj+wcQosqatWkwywECvqu
         zlzQTHxccudDIqwntbsFp4ZDy3UrpCteFOyBqPHpaQx8beM2a+lO5U8UxYmEcYm2gMEG
         a/4copilvr2+njmYUEoNOQDUGGvrFtxKzWujF0GxiYoPM2+UOJvA8xiphBGJTEMnkOT1
         zfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p66zCSnQo3W/z3CB0QSw/3AqqotlN7Qeutdlvdckqlg=;
        b=Hee/Z2d5HWOj2gDgN1BthdZshXBVCEuUz/WrK4GIS3VFWyJ9hA3pJEMCNJszAJ3lff
         ZfJr/A5StINVPQxkFWdn4Vp38ArbbUT8Xh6kQy/SHo7v9gNlfIJ08/m6zYBe3W9ORhUI
         Ju0YjhE6DKXUb7evwsSi2uWImLN/CiYiA7MwRJL7ymOUeMxmgHbCNX3UJ+PO8ry0I7c3
         wQnHpJP6o8V7Z/lSsomFAAzlUk2Bb0+WGoRgSVGn0UMW1o+INSfQ3Hmx54EcN6jIxU5s
         GvFRC5nCyHGqdi1n18ubVDTrTndXCSFfMXzmaQiLDsGksgEG/wDc64LtumhUrJx6sURA
         U6HA==
X-Gm-Message-State: AOAM5300ihEObYdp1R2udtBzweMryG+nvVngeCyxCECyH2gFpVrSxyrx
        p/KYkqpoTnj+dnCYPClIbI1QcQ==
X-Google-Smtp-Source: ABdhPJxg2f9wAXCNXZ1VDFa0xkpK4OatejvZM+tKLoCGto8F6ck41iraKMZWHyq6U77d6l2C+k7XsQ==
X-Received: by 2002:a19:5e5e:: with SMTP id z30mr1393142lfi.277.1607005273757;
        Thu, 03 Dec 2020 06:21:13 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id k185sm575716lfd.294.2020.12.03.06.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:21:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/7] arm64: dts: qcom: qrb5165-rb5: add gpu/zap-shader node
Date:   Thu,  3 Dec 2020 17:21:01 +0300
Message-Id: <20201203142105.841666-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
References: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add firmware configuration for Adreno zap shader on qrb5165-rb5.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index ce9d98e2d856..22c1953f4e63 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -430,6 +430,13 @@ &dsi0_phy {
 	vdds-supply = <&vreg_l5a_0p88>;
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sm8250/a650_zap.mbn";
+	};
+};
+
 /* LS-I2C0 */
 &i2c4 {
 	status = "okay";
-- 
2.29.2

