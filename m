Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC3F3AF886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhFUWeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhFUWeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:34:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3793C061283
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z22so27354706ljh.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pl85yJPQ8UWWXJ4GoZSz05OqJVvyRpSXlOX5oJ9CbE0=;
        b=zIZNEtQC22piu1oOY/ASJ6inohtioGWMbhHGNwKmnkg+6S/zgVXtgw3YYIm6KRmP7D
         2yQ+iV2uCIm7l2AsLFnTvfAptHFR7kZGrn47hI61YYqso7ykfC0HB6FlLPh7WTjbgJUu
         lA27VdWWiL5tFBNCvlEGIYuvH1FYQqSwllKOQtjzoRkIHRiuJkTNV9LEiJZuKLspFiv1
         +XxMW6ymZVbLE+RC+aKxtEFjpUXZwG+6uvo6kfJECwE9jgE5A8gK3fdFrkzUypwirFYW
         u0CyisCXrQiw1gQpxDWdumJ3GCAWqi9X31v2gYEgXFNfRqqGOEuutu89S3R72hsZkt+G
         W96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pl85yJPQ8UWWXJ4GoZSz05OqJVvyRpSXlOX5oJ9CbE0=;
        b=eU5QO+YmT91G58+SKk53ZEF5FZU0ql15PMhlpn/dUWk4/hMshZJNlde0WSVchGNYmE
         detNVG96Ua5mf8UMNJi5atX9x+C6fWQPihXTJoEqvTLQ1GlU2gwoq1wNgxV+i/+QJ0l0
         Vbr5Vgdwf24+8XigFiRnd7XQxyW2SB6ULMq+T73Bjyhiiml9fCz2T/vZt96iB/D0MJ0M
         /2Hf2wFPj6Krwd+ktIVVcadF8q9Rr6vcWOeBXkQvvNJlJQkEVvRLTJWdKFGFn0GAOmtP
         1h9wyz0lwt1M6VHkZKy2GwKreVVrO7diTPg2nOD5a3EyRtlEaTRCTH1bhEWf2jPgd7Yd
         asqw==
X-Gm-Message-State: AOAM531DFSk+ign6jaoRjHtv8I6WTXYFxlwLXY2YQRpSK3uiWiVopB6L
        LDBMc02QvCc4KnLU2QnIA+CO3Q==
X-Google-Smtp-Source: ABdhPJxjoVCplwPuJvjbPzknCoMLW1t50J1MCoASlafBc+Ph6ulmOtfGcOvFbeHinnh6DsqSmvnOig==
X-Received: by 2002:a2e:2a41:: with SMTP id q62mr372448ljq.371.1624314708998;
        Mon, 21 Jun 2021 15:31:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm2516025ljf.72.2021.06.21.15.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:31:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 6/7] Bluetooth: hci_qca: add power sequencer support to qca6390
Date:   Tue, 22 Jun 2021 01:31:40 +0300
Message-Id: <20210621223141.1638189-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCA6390 uses on-chip power sequencer (and power management unit) to
supply power to both WiFi and BT parts. Since this sequencer is
supported by a separate driver, use it as a single "vin" regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bb04da08468a..deea38033248 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1856,7 +1856,10 @@ static const struct qca_device_data qca_soc_data_wcn3998 = {
 
 static const struct qca_device_data qca_soc_data_qca6390 = {
 	.soc_type = QCA_QCA6390,
-	.num_vregs = 0,
+	.vregs = (struct qca_vreg []) {
+		{ "vin", 1000 },
+	},
+	.num_vregs = 1,
 	.capabilities = QCA_CAP_NEEDS_BT_ENABLE,
 	.name = "qca6390",
 };
-- 
2.30.2

