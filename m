Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517B044DA20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbhKKQQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbhKKQQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:53 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2084DC06127A
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:14:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so7714807wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SuWrMG0bo45Jb11rqxnKYmyuhg+LmcaZSa2mZISuLUo=;
        b=GydiR3DaW/V1AbZz7Qjk2tGgGH4SDoQUBSgM9fiXZcAcUTcVB7PRy+WGxyN0KmNBT+
         cKRyNDJaPxJdWQPnANcw6oSIWPTlhoLVelG3hhncFWHhPMgsy8tSMSJ7k5J6RT7o5tO9
         toAkqPdAbu2lXvEjdaissEVjpJavm+ss0KrLE78FqFWZS3Vslwrwf0a3u76dJV1NqcTE
         4pVFd0cOHi2w9b3qutSCcnU1JreUvTuPKfEm0GrHaf/2YH73uliVdnP+PIzT5M8nveBX
         KYY5jmiI3P3x50uPWzsmdmfqvbmMmf0MzCHQy7Inqs4DwWu4tMrXXwtvtrIPEdtqBkAO
         Wn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SuWrMG0bo45Jb11rqxnKYmyuhg+LmcaZSa2mZISuLUo=;
        b=RRo/oHSFTUwltu6/w1r3t7kNOek7K8Ln4mnMlv3RhfkV+L03WHCFO4KhA+FAUqtXrO
         weCHQVoR+2Ncxe+AXNMyBIudCVzZQ9Pmkb14pRpAuAUb+GfUf3N01Fe7k9pE4ZpMkaQR
         AdHDNHCoZ/Fo5AAn2/8hMSmuw6vijT9DSsD9WJ6rCF7PetaHYLVKGZFN2grSc7ftvAk/
         cRm3dIKZnvRlW2xRsGWDujdaZn5pI9+IssTRjvqCWzUP9K5pCL1/eFV9vH+ERNkMmxlZ
         SpS6QXkYmzLQLd2UHJbMMIc75QNTJKeEANzlz8SMgiTqXXifM1YDaPkWfclnhV11xCmh
         anow==
X-Gm-Message-State: AOAM5318KESNIUdi6FSWBbhl/z8pozpfXNc9BLckkgOEGTj26dsLMFji
        Ktoq7kTR/EnjkHH7HmXhpJR450s6CnIKjQ==
X-Google-Smtp-Source: ABdhPJzVbiG308qBcsKrFfmsdHrnkozr6PfHvD7Mxb9FBKQCaqXv+LTvmgcE8bxoToQgkEI88jK51w==
X-Received: by 2002:a7b:cd96:: with SMTP id y22mr26672489wmj.121.1636647242352;
        Thu, 11 Nov 2021 08:14:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:14:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 15/18] media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
Date:   Thu, 11 Nov 2021 16:15:39 +0000
Message-Id: <20211111161542.3936425-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add this common format to the various format lists relevant to sdm845.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 7 +++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      | 1 +
 drivers/media/platform/qcom/camss/camss-video.c    | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 22a7d7ad6340..9e54d251793f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -262,6 +262,13 @@ static const struct csid_format csid_formats[] = {
 		10,
 		1,
 	},
+	{
+		MEDIA_BUS_FMT_Y8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
 	{
 		MEDIA_BUS_FMT_Y10_1X10,
 		DATA_TYPE_RAW_10BIT,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 24eec16197e7..de1e81bb97c9 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -94,6 +94,7 @@ static const struct csiphy_format csiphy_formats_sdm845[] = {
 	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8 },
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 165b404761db..3d2f554a4ef7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -118,6 +118,7 @@ static const struct vfe_format formats_rdi_845[] = {
 	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8 },
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
 };
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index f282275af626..54e77d30d452 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -176,6 +176,8 @@ static const struct camss_format_info formats_rdi_845[] = {
 	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
 	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_Y8_1X8, V4L2_PIX_FMT_GREY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
 	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
 	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
-- 
2.33.0

