Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047A92A3810
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 01:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgKCAyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 19:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgKCAyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 19:54:39 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BCBC061A47
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 16:54:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id y184so17961655lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 16:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+q32KKfvQ8vwPBE7D57+tI6W4ETqZSqkktr32GH0s8=;
        b=T9oYo+51Qmf+L8xW6CAko+biH1KogpMHv07lHPjc87E1meKIb/ZMxqYGEB4Vdb23gw
         Xi9RTvX7bWVbmnp2Cpdog375w96TF3a9dJc20JhWKE1h3X0NvWXw2BNqjgmRv4m6RY5l
         adn3PzvX1aOF3cg8MQK2B8FX2YUQfGfAOXlg/FFguSxQs5WyedB2jJESbZI+oXq44lJh
         9sA207EssdI8WH34O1yFfRj++QJnP0cjNa3ZrsMoGSGE+ewXqyRltQ5FEP/0876j024T
         I722Tx2X/5QCKbr86WljSjnSwKrQXLl7NP+IGbXb1iM6CViLwZ3J6rYIukrQr0l3Y5Av
         5BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+q32KKfvQ8vwPBE7D57+tI6W4ETqZSqkktr32GH0s8=;
        b=ZyB83Wp77n2Y32ufgw58gEAoZdjbVR9GrAX/0UXp1l7xJ9o/cKW4wtBdyfJjQpCV4P
         tKx7D6K/6GCYhZk00MdP8zZIbOKKqkWbiLqDKcH8d4tTj8RiLTjL9PTHbam7/n4+KWss
         fIhwP586d1/Xb149DMz0mPuyTyyPNSOQCLcPeuOuqx/7acJ8lh3gk9hsSUPHU8OxFT9U
         ohRPfv3yOzHXTiI+WBHNNrQrUf+zUXSbvjqiXqr2+kvQTJUiLrriC85kmHs5pc9JVSRs
         d6DWdO+pnE8rXgvQjxjaYSF7NkEoqie3RqBuUeKuqMPMidpSWiYfLim8RlXhE9yQ3qA9
         uFHQ==
X-Gm-Message-State: AOAM532ZrLtq0iwgtCQjO6326tf01qsBXjgLCIKjxDDOMZjC9IvYcdl9
        4S5ZL7qguLPPEtzs0FloFsVzTw==
X-Google-Smtp-Source: ABdhPJzKepFbfzkAtAvVLaf0SNVtBmf0GxP7vqsKDhGq3TITzbPCcIJmgN/O0pB3wDNZgxCGMsHU/A==
X-Received: by 2002:ac2:519a:: with SMTP id u26mr7198600lfi.73.1604364876657;
        Mon, 02 Nov 2020 16:54:36 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id x20sm3298976ljj.139.2020.11.02.16.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:54:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RESEND 2/2] arm64: dts: qcom: enable rtc on sm8250-mtp board
Date:   Tue,  3 Nov 2020 03:54:32 +0300
Message-Id: <20201103005432.1181832-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103005432.1181832-1-dmitry.baryshkov@linaro.org>
References: <20201103005432.1181832-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PMIC's RTC device on SM8250-MTP board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index fd194ed7fbc8..c85cab9c9b41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -378,6 +378,10 @@ &i2c15 {
 	/* rtc6226 @ 64 */
 };
 
+&pm8150_rtc {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.28.0

