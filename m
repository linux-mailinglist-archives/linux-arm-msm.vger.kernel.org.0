Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74B9673CAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjASOqs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjASOqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:46:17 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCA58758E
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:43:30 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ud5so6261369ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYSomJedHVK5BgX0m4rXPBquuvOf7ReCuCFfsJfS4GM=;
        b=maYfXj04Xta4w0c1XO9/IR+Q/80pEhaWzVXWYBoOct1f3Sdy80UbFN5a71VtlJwzN6
         qOMGNf1dsLuSi82WDnzTm5AjMdRDrrqK68tjaI0Zd2iVLpzrdsFRK6gn7cbe3CNKZMbi
         9X7MPlHezHVBxbm5JqrG6MzU/4XrbKX5b0LBEFMWblzHSPDiDoK8BDbe66P5ZQUMPtjZ
         vpWuVk6hJP42tUsJsXZ8MfYzpNiTnESTDeEkmG0wM0alylVlXDuHNH3tI23kNTuir3QY
         9VRkVVVGr7WHgFD0yapCyVcvW0w3VhzLpa8VJyVpHvvzUoISzbHVjeeUxrCLuHOogaXM
         EuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYSomJedHVK5BgX0m4rXPBquuvOf7ReCuCFfsJfS4GM=;
        b=NIEPrihjOyhMtdSX0RRXPjhdHAothLzC6ou8Iyny+H1+t4S08W3FcatIF7bPD6w6Sv
         lESVjIIujtkR0P08BUFie+iyavICCm59/MD4UHU802RfBU6MUCE6IyrSlgOjCHqZYBAE
         oLvPSIDveQIWggyqEA+E0Zx5jxB2oR/0799UgTrEu3qRgjikfjb0eE9z4MUN0YY8NSmI
         Qu0Uyy9w2sKpyrSwGOx2QWepTucv3q5wRrHHLl9dx4ZmUOr63oD1JEnphi2mmkw04yVf
         C0B28jh2YmZ3klISZOD+jX/qAEfaYff3SB3mLuzrThR4CikllDpN4YY9nPx5CEGyvq9z
         ko8g==
X-Gm-Message-State: AFqh2krJEEqphnHUaJnhKHIlb/Qi7QbFhfN/rGkkDf69VZ/pfVQ6vlfy
        rIoRa0G/mqkv71xmpZyzmw5W+T2lTitkRV1A
X-Google-Smtp-Source: AMrXdXup0qQiB3Ms0hDsfnIUU0B2wvk2sx0H2sklDz6S7UZmvU+vwHYHlGYSoH9Y5m6ZXk0i+lopRA==
X-Received: by 2002:a17:907:6746:b0:871:2051:637a with SMTP id qm6-20020a170907674600b008712051637amr12847347ejc.60.1674139408688;
        Thu, 19 Jan 2023 06:43:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fn4-20020a1709069d0400b0084d4b907ff8sm13434169ejc.120.2023.01.19.06.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:43:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: [PATCH 1/2] scsi: ufs: ufs-qcom: add basic interconnect support
Date:   Thu, 19 Jan 2023 16:43:25 +0200
Message-Id: <20230119144326.2492847-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119144326.2492847-1-dmitry.baryshkov@linaro.org>
References: <20230119144326.2492847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Brian Masney <bmasney@redhat.com>

The firmware on the Qualcomm platforms expects the interconnect votes to
be present. Let's add very basic support where the maximum throughput is
requested to match what's done in a few other drivers.

This will not break boot on systems where the interconnects and
interconnect-names properties are not specified in device tree for UFS
since the interconnect framework will silently return.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ad1415e10b6..8267a4056120 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -14,6 +14,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/reset-controller.h>
 #include <linux/devfreq.h>
+#include <linux/interconnect.h>
 
 #include <ufs/ufshcd.h>
 #include "ufshcd-pltfrm.h"
@@ -936,6 +937,23 @@ static const struct reset_control_ops ufs_qcom_reset_ops = {
 	.deassert = ufs_qcom_reset_deassert,
 };
 
+static int ufs_qcom_icc_init(struct device *dev, char *pathname,
+		u32 avg_bw, u32 peak_bw)
+{
+	struct icc_path *path;
+	int ret;
+
+	path = devm_of_icc_get(dev, pathname);
+	if (IS_ERR(path))
+		return dev_err_probe(dev, PTR_ERR(path), "failed to acquire interconnect path\n");
+
+	ret = icc_set_bw(path, avg_bw, peak_bw);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set bandwidth request\n");
+
+	return 0;
+}
+
 /**
  * ufs_qcom_init - bind phy with controller
  * @hba: host controller instance
@@ -1005,6 +1023,14 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_get_controller_revision(hba, &host->hw_ver.major,
 		&host->hw_ver.minor, &host->hw_ver.step);
 
+	err = ufs_qcom_icc_init(dev, "ufs-ddr", 4096000, 0);
+	if (err)
+		goto out_variant_clear;
+
+	err = ufs_qcom_icc_init(dev, "cpu-ufs", 1000, 0);
+	if (err)
+		goto out_variant_clear;
+
 	/*
 	 * for newer controllers, device reference clock control bit has
 	 * moved inside UFS controller register address space itself.
-- 
2.39.0

