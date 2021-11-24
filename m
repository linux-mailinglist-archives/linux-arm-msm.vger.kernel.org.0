Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377CD45CBA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350074AbhKXSAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350099AbhKXSAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:47 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFB1C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id p18so3231489wmq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SuWrMG0bo45Jb11rqxnKYmyuhg+LmcaZSa2mZISuLUo=;
        b=sglImkKtxlMBmZOZvRs1PZgED27DTeGlOb3wkQIGVCKDj5QPNjNVURn1C11F7pS3YO
         5lKRmg7lufwHQLZYFVjiBpYxK0duDglejIlCYoAo00Y65gpAjbk+MmH4X2DPVkPkoebW
         mJ1pmJz72ifh0HOL+L02lM9MPwU2+Ka2Yf6wRwprf73+mRlcOh2Mk1Z5C7P2tuzwj9RY
         RevkVuR95AORQYkJULRcyktisHZ6x/d/3lxXC49LiOd7FK7YnGW5BEcWSE7X8eEKGU8u
         Mk7pHbQemMrL3B9IMXoLGTjvtlCuGEBkZ3SzN2oE7fNBwF1zNUbWZBYMbJuqHWfJzzK+
         LUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SuWrMG0bo45Jb11rqxnKYmyuhg+LmcaZSa2mZISuLUo=;
        b=3ljdsRygm+CMAFx+Xujvsih+Ldb+bnTc41dddUEcGqdqqLwKEn63eoKS7lgHh2JLXn
         lGbFLWTF9uAfeiVYaNLuHflb1bUKdZhd14dNPf619QF7/DSBaUsbdv0Khc5IavLJ/mEG
         k9rIeUCfZp6l1RaoWX8q1Wx490Qghrj1ls8cKZi6VuwVnVxR/YVyGdVoudcGjTYhkY+k
         Fo0FjXGSajDkTMhcSjtBibvcLjrty4RbOG3HaaW769ktlANVG+ERTHkSsNMjWyVb7aol
         TQ34JLoSI3Pm+Moh8MfB4H82WiF6vx07dFs0TlTZ6wBRbogYKPtQ2C2BfAs+jBgU44If
         7OxQ==
X-Gm-Message-State: AOAM531Pfw1KqliIZy5eEstLgNnq5KctX9BQoRXzapKWpWyz1AfRwiGp
        Enlk7kKlqMeCycSk1k/W2y+3S3Q8Refypuuc
X-Google-Smtp-Source: ABdhPJysnqCsSv4fmVpZfv794YhFPbYPseSnBKbff6zmYLfptGkvC3LR7jlZDJx50fBAF9LrpDd3VQ==
X-Received: by 2002:a05:600c:501f:: with SMTP id n31mr18068305wmr.101.1637776654723;
        Wed, 24 Nov 2021 09:57:34 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:34 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 15/19] media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
Date:   Wed, 24 Nov 2021 17:59:17 +0000
Message-Id: <20211124175921.1048375-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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

