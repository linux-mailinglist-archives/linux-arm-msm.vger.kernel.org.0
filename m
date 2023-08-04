Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC3876FDD1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 11:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjHDJwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 05:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjHDJwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 05:52:12 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E01A9
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 02:52:11 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bb775625e2so13508575ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 02:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142730; x=1691747530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztEtGsHv8LUsy3rYuXtTs4zJ+h/bmJ//A4c7nlgI5hw=;
        b=DF4vOh9oYjsGO5mn6q0HtK0qqUgf67d94y1xNpqbMUE5/ZlvETU4qywX2jSiq2IJdb
         x0xvfCu3TwzjRUiH25JAogM+QJZ2hrT/p4NUXShuFTwm1OqqCAMaGeo3OC2+kbMrdDyN
         tzjgB/w51/f13PYfMIIKiHNDfp7DWSsFnKhN1CcFWUsjkjjS5SSSTUwixiIu83+jqcao
         vfP4bAGcC1xaw0ENAnJGRDfD8Wa8DFq4Ga22c2T0M6Dmy64N1NlrK+BhXPAemHj2j7rP
         6uS9t+eEqAO4qqLpYoVNkAtr1O7whwMHAUXwNFKXcC3/YIvRJN5o5tiEJ62Om8aphw8/
         udVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142730; x=1691747530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztEtGsHv8LUsy3rYuXtTs4zJ+h/bmJ//A4c7nlgI5hw=;
        b=b2qycp6jiBkO6xUn2aPQedXGe/mhtFtNoiSY6NaGY26QKKvf6RRocDKGsw8ZjXqlMY
         3ABTu43z3ij2m75XUPH80pIcy2G3WEe4436/3JoU1YetbuzOxuO+cXfMt7kUux4eO9Oc
         yfMp4RlFuqor0BiqXd/WDzH3wlw7mRZBAw0lqwN3l+m5iowE2Sq4OP81atoHl0Im2XJY
         OlIQYB/HCOYVjxhjOxxxZ0horUd42Knj+skcphCFJOsBDesJuWSAkWJwOflUFjkHU7nH
         gOpq7tr/zZctTCFNQYyXvk9T+vUCXQIaF98WVHSCAZFOjsMDCGboxNVXRMrVHukM5GSS
         hPuw==
X-Gm-Message-State: AOJu0YzOGXsH41KTo6+8lRlM3/jAmmggUldH5zJUPYNQHLnKoNqMwZwh
        S9PwcfTTqbWYE+XFINOEO+I=
X-Google-Smtp-Source: AGHT+IE/WipBRcaU+FY6R8C3CdC0fD2YKmltWH+7ElgTn4fIfxyJjtfY+77F/BZaTL1oP+sWFDhhCw==
X-Received: by 2002:a17:902:f54b:b0:1bc:4df5:8bfe with SMTP id h11-20020a170902f54b00b001bc4df58bfemr1768138plf.20.1691142730365;
        Fri, 04 Aug 2023 02:52:10 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com ([2a01:7d0:4800:7:ed2b:eb02:183:4c01])
        by smtp.gmail.com with ESMTPSA id ja4-20020a170902efc400b001b8013ed362sm1344866plb.96.2023.08.04.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:52:08 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: add support for Telit FE990
Date:   Fri,  4 Aug 2023 11:40:39 +0200
Message-Id: <20230804094039.365102-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Telit FE990 that has the same configuration than FN990:

$ lspci -vv
04:00.0 Unassigned class [ff00]: Qualcomm Device 0308
    Subsystem: Device 1c5d:2015

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index fcd80bc92978..676f3ae33ae9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -595,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN990 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
+	/* Telit FE990, same configuration than FN990 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
-- 
2.37.1

