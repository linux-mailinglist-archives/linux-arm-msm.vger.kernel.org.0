Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E6749F183
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345764AbiA1CzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345652AbiA1CzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:55:00 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFE0C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:55:00 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id v67so9775169oie.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZFOGW+nVn/EM1Z2BztmM+/jCRAogoevTBkpE6moeqjw=;
        b=HdaemvutluNp99sWBlcuaC1SxIFeOm3iywNN8TxBxGmC62cU911Ph2uHk4jsJU7vqY
         S6Lqs1ibqhqQ0VOetBb7NOuUAkTRN6ewV2zYblA6uxhpSr4ZNiZzsvJShmsf8PQGwXRJ
         B8SvZAD5yKdQ7G1QwWL8v/kCPmuWxLNHmBM3/tu0MkC2ZES2V7u6e1b5g9NI/Pz4fkNw
         iuMzWiq8diKFZtwomPbEWZvTz5e17SMdd9JmmCYTyMdnqrMxXUUMH690uJs/DyFcVhe3
         opbiv2mJVOxuBH5ORq9/uj3wEJmsIaZleoW5sQeVkjV2SsMUtkZO7fNVcR0wgKKSJcTF
         syUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZFOGW+nVn/EM1Z2BztmM+/jCRAogoevTBkpE6moeqjw=;
        b=MHc/RItn8Clj/M4VhaNz76RsFUDaljBuI8diWISjS6HBvPWQPL9Zjag8uSZEliw1I7
         OvkTr1/A5pdaNIivNU3I+NmeHTs5mXBrgMu9+xfXd6e+LiMDM5kLcfmXxUGDNfOac60W
         4zUX5/ho1EuaME8+P84la39RNZMR46KAOHy7BoZm1d9595FVxj+fqu1+74XkLv3/RpBS
         uGD3vxTsncDverBtaIfKzBgz3TLDVlpaMVe5xs7d7p57iZaHz7pid+c8IVG6H2IHVW1o
         NMIyfPP8wyWR48CXBX2h6B9hp3JbhRvjSBWOoOkyEiVWk3OuesZPO5/I6td4CmFKLGm7
         ma5w==
X-Gm-Message-State: AOAM533iQ47aYnXDQLl0/Z0jXqDA1u9zjm0va7b0XZYeyvMggcFqm+cQ
        X9G6JBlDsteEsRJoSrI6Slndiw==
X-Google-Smtp-Source: ABdhPJzK2qMTXj7NERh/AtWEIFGTW3DUbZtlsOUyoBZqt+PngY65GEw549w2aJ2kvxJIo8FmPw5UqA==
X-Received: by 2002:aca:ad0c:: with SMTP id w12mr4128987oie.287.1643338499659;
        Thu, 27 Jan 2022 18:54:59 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:59 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances
Date:   Thu, 27 Jan 2022 18:55:13 -0800
Message-Id: <20220128025513.97188-14-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the audio, compute, sensor and modem remoteproc and specify
firmware path for these on the Qualcomm SM8450 QRD.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index b68ab247e6ae..9526632d4029 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -346,6 +346,26 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8450/adsp.mbn";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8450/cdsp.mbn";
+};
+
+&remoteproc_mpss {
+	status = "okay";
+	firmware-name = "qcom/sm8450/modem.mbn";
+};
+
+&remoteproc_slpi {
+	status = "okay";
+	firmware-name = "qcom/sm8450/slpi.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 };
-- 
2.33.1

