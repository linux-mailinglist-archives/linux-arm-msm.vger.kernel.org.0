Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34A462D872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 11:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239237AbiKQKwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 05:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234851AbiKQKwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 05:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8228013F61
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x6n9un+DF1STb0f8Wt45FFfORAUWPZZjfWdP+jBOFAw=;
        b=IGz8/5Yx70KGnfHXmFSM3h2LAPA9ScSjg9V6BfDkK2CDmGiPRmEb4BDfAAgwehcLYmdil9
        VkyJ9Tgil6ARowkDEddwAxTk8CpM67+1sHa9QldpgPue11TAiIlHw6lARG+yY0C/1iuNXI
        ku4oY1VC/ok8KrhjHZNg1HOCsLSUPP4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-YMwVhKv8OzifxKDlhpu-Dg-1; Thu, 17 Nov 2022 05:50:28 -0500
X-MC-Unique: YMwVhKv8OzifxKDlhpu-Dg-1
Received: by mail-qt1-f200.google.com with SMTP id w27-20020a05622a191b00b003a56c0e1cd0so1320232qtc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 02:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6n9un+DF1STb0f8Wt45FFfORAUWPZZjfWdP+jBOFAw=;
        b=EGlBDEDgtXP4ho1J22/yjFIXna1LEGgvpnVeqeSvI72hNs79ZXB7IkD5CNWH+J7nsd
         ILGYpgmwgUYafw0syvHGag6b4JyEOKcrIBGlMk/2MDggvkaiYhJcoo4Mit0gBSyjlUjK
         6MiHrzBOrTzbEt+YnW/+sV5Jdj48SPoiEtVDzN6GEXX1LOeSBckCWd7JxGNES4BBevhC
         +n44Z6J4vqg9LJTxR21PDTTWEh4FyFOx8GwwCO1+1BTk09bsGBOAUHR/aOyWm+o11M1f
         NYYLLxISzMJGK5KzhfUyEIbxTjB8EoJPLv4ZKvz98tKxoQqsTwRn2tAaz/KSsmPFYFyA
         /+xQ==
X-Gm-Message-State: ANoB5pkkRnraW8VKlRBvIzOHWvXTmc4mtw2gldKr8VH/nuxlO9iXpagl
        /UoKqvSNTPkVAwf/DG+A6PzFEsj+3aXl9iYfTeqqqngtwdPGuNQG5p8tw2LestXgeregfUpGh67
        26Lj67tH/kFNJbcQp7uakS2mv6A==
X-Received: by 2002:ac8:741a:0:b0:3a5:2932:3a77 with SMTP id p26-20020ac8741a000000b003a529323a77mr1561852qtq.591.1668682228225;
        Thu, 17 Nov 2022 02:50:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7q5r/FX9thYRsL+y5bwss1yFZk9BsIvNayz/qC38oOghK204AtAl8ETLODAyxsuBJu8fXOWQ==
X-Received: by 2002:ac8:741a:0:b0:3a5:2932:3a77 with SMTP id p26-20020ac8741a000000b003a529323a77mr1561843qtq.591.1668682228025;
        Thu, 17 Nov 2022 02:50:28 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id i15-20020a05620a248f00b006fa9d101775sm236022qkn.33.2022.11.17.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 02:50:27 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 1/2] scsi: ufs: ufs-qcom: add basic interconnect support
Date:   Thu, 17 Nov 2022 05:49:56 -0500
Message-Id: <20221117104957.254648-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117104957.254648-1-bmasney@redhat.com>
References: <20221117104957.254648-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The firmware on the Qualcomm platforms expects the interconnect votes to
be present. Let's add very basic support where the maximum throughput is
requested to match what's done in a few other drivers.

This will not break boot on systems where the interconnects and
interconnect-names properties are not specified in device tree for UFS
since the interconnect framework will silently return.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ad1415e10b6..55bf8dd88985 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -7,6 +7,7 @@
 #include <linux/time.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -936,6 +937,22 @@ static const struct reset_control_ops ufs_qcom_reset_ops = {
 	.deassert = ufs_qcom_reset_deassert,
 };
 
+static int ufs_qcom_icc_init(struct device *dev, char *pathname)
+{
+	struct icc_path *path;
+	int ret;
+
+	path = devm_of_icc_get(dev, pathname);
+	if (IS_ERR(path))
+		return dev_err_probe(dev, PTR_ERR(path), "failed to acquire interconnect path\n");
+
+	ret = icc_set_bw(path, 0, UINT_MAX);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to set bandwidth request\n");
+
+	return 0;
+}
+
 /**
  * ufs_qcom_init - bind phy with controller
  * @hba: host controller instance
@@ -991,6 +1008,14 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 			err = dev_err_probe(dev, PTR_ERR(host->generic_phy), "Failed to get PHY\n");
 			goto out_variant_clear;
 		}
+
+		err = ufs_qcom_icc_init(dev, "ufs-ddr");
+		if (err)
+			goto out_variant_clear;
+
+		err = ufs_qcom_icc_init(dev, "cpu-ufs");
+		if (err)
+			goto out_variant_clear;
 	}
 
 	host->device_reset = devm_gpiod_get_optional(dev, "reset",
-- 
2.38.1

