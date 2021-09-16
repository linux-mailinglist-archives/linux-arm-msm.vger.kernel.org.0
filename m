Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776F340DDB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239086AbhIPPPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238593AbhIPPPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:15:06 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66601C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:13:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x27so19955159lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r6++NSxwGGnl70RkhdwAH+9fCPvZuOp1mFnX26u+t1E=;
        b=HpOh9ABvp0ObwZ6hxFGOp+2rjK2YaZKbxbN4dTuG51fCrmF5I/nSXzH7lDbXNDy2hu
         0YjMpuaU2Rv0P3nuJU/ymQ22WVZmGEMp6TvG8Q48fddvGpBaKFweY8wWOwrsd4pSepvb
         UH1ZTFwSTTZ11yTTSY/Iy9q6HE2BcD4sDLcgu6d9fC5M2LZlaR9Zr+Hio/D29aOp7jJz
         PiP0m509Fac37n0wg2zBoRHS33KUwiQurdDAcK5paZnFTCJszUC5yh47Djs+tH89PTPS
         qjK3kXX8C3cT1hpTlOtY1iuphraRMkWcphzkAxqOpR1TEiHLP/AA6Gaiby1OU1aCkFFP
         PsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r6++NSxwGGnl70RkhdwAH+9fCPvZuOp1mFnX26u+t1E=;
        b=OCDm3h8g46XNLkFT/u+/TZk8PfaswNdi8BARsePZ1xTBXHVMfBIQW199G9KPB2CrQF
         56k4dZqRJHv51fUPjSCUU1eWMKGV5LZqHH+Z0axG94zAgFoSbExXuc1JdteiISPYVf4z
         eETX3c6DJBpCEHRg23eip72U0+7LnGVWaZKaWG24oOXMDrZCGYctqpcXxg8oTZa3xsFG
         Aj6jS6wZ0213qSfxh+ZXInkK8VNHU4xkNxD+fjYrhafGM7N/7EEWWqoinlvMDBgfFfWG
         RJWJz0tduvy3EGQrnUhs1q4W/ztYZBJMtqKgrYgg5Y9wPlqth3ggUqGR65t+8SmlwfCp
         vfmw==
X-Gm-Message-State: AOAM530PMt+Bdtq0qoyKSA2h3gjJfvxgd+Oq6ceehlQ/ZuW1KiZu9eCK
        egHP8m2/f3TfeMZHgh2TSOWJnnNMu+JjFQ==
X-Google-Smtp-Source: ABdhPJymkN7C8EkTFOqrF3ykB384zwXG+VbbsQF3KRbOzqQI8rL19PjS9tEiQKuRXaSQiWjmQR+jew==
X-Received: by 2002:a05:651c:512:: with SMTP id o18mr5470087ljp.199.1631805223518;
        Thu, 16 Sep 2021 08:13:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15sm283799lfe.178.2021.09.16.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 08:13:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom:qrb5165-rb5: enabled pwrkey and resin nodes
Date:   Thu, 16 Sep 2021 18:13:41 +0300
Message-Id: <20210916151341.1797512-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
References: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable powerkey and resin nodes to let the board handle POWER and
Volume- keys properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8ac96f8e79d4..28d5b5528516 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -804,6 +804,16 @@ lt9611_rst_pin: lt9611-rst-pin {
 	};
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.33.0

