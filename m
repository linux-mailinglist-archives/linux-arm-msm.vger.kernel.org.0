Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4162EAE90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfJaLQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:16:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53812 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbfJaLQw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:16:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id n7so5488590wmc.3;
        Thu, 31 Oct 2019 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9FkS3vnY8rTwRRvDNh5lutxmRI2CZBA9wqCIHbI5rZ0=;
        b=vg+lZfpNhWzyv/pXu5wozvjq3xIj3xNyUJZutrYzcRdSo4PRTg/avwYc3/ulRl/SAK
         fVl3XqVKOo473p8ARz3bpBcGDjs2651rSBjIdxuMCcynJq9t6sSPbL45Psp1lzejHp4q
         zcIZkO/dHyjH2Hon2O3QGyFUQJbQdDqojJspoM7WerqzyGOMkAcOODEARetXTxpMSsfR
         SDb9qNKT79y724sB1cZnYrIgG32a5GCWt8JovUdj6DzAoTq0J4GHQi829sYboVAy0O5k
         gsuxCItj6zdKH5BOummt3dXDqYYDCp99pBkis4VrhnmMoZHwdjunZfn8nQpr3CSC/YE+
         otAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9FkS3vnY8rTwRRvDNh5lutxmRI2CZBA9wqCIHbI5rZ0=;
        b=dLuF1kibMBU4YjpstA+0IHJUeq0sYwgIxpn4i/dRJyLpD1pXNYUHLTw6VOkBLWXCVg
         /eynWIalh6mZpP1fOjde+/gBGWIXbWwIpPX+vgkN5CGRhwKWoXnxCdtDVZZaGU5l8wlH
         rmoosf2mXxz6iwGFAmcBHU3+RLeFIvPr6Jw5Cu5XDliQR8PeS9A6aj0SFpSENWyHhk1O
         YB/UtfeYipofFfhvzOqJU2r7p9gCd2CxoqVwnX6d3Emu70CMsSsDgoAjSQlDaCCA7CBY
         KUDwhpXzEvNj8sOUb3vtSsQnridD1szoRc8lbP4VQwevEv+sRW1PNnWG6we7wIQRS4Yl
         mwIA==
X-Gm-Message-State: APjAAAUwPCGbv7QuzG6ssdNcDr26v2OFEglv5m8VE7ve7LHUvPGo+rtz
        4Lc34iVf+6r+ZSI3A0WVTt1SwOKYwJ4=
X-Google-Smtp-Source: APXvYqxqLeQH/07i5VOT0bRcQbGS2nwfUxiYsaFc0vq7Py9ndCg/jLaP06NUYjb77keqV/YTsPAFtQ==
X-Received: by 2002:a1c:40c1:: with SMTP id n184mr4875508wma.116.1572520609976;
        Thu, 31 Oct 2019 04:16:49 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s17sm3009306wmh.3.2019.10.31.04.16.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:16:49 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH v2 1/5] dt-bindings: iio: spmi-vadc: Add definitions for USB DP/DM VADCs
Date:   Thu, 31 Oct 2019 12:16:41 +0100
Message-Id: <20191031111645.34777-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031111645.34777-1-kholk11@gmail.com>
References: <20191031111645.34777-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some PMICs, like PMI8950, feature two ADCs, at 0x43 and 0x44,
respectively used for USB D+ and USB D- (DP/DM): add the definition
for them as VADC_USB_DP and VADC_USB_DM.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 include/dt-bindings/iio/qcom,spmi-vadc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/iio/qcom,spmi-vadc.h b/include/dt-bindings/iio/qcom,spmi-vadc.h
index 61d556db1542..c4c3914d831c 100644
--- a/include/dt-bindings/iio/qcom,spmi-vadc.h
+++ b/include/dt-bindings/iio/qcom,spmi-vadc.h
@@ -72,6 +72,9 @@
 #define VADC_AMUX_PU2				0x3b
 #define VADC_LR_MUX3_BUF_XO_THERM		0x3c
 
+#define VADC_USB_DP				0x43
+#define VADC_USB_DM				0x44
+
 #define VADC_LR_MUX1_PU1_BAT_THERM		0x70
 #define VADC_LR_MUX2_PU1_BAT_ID			0x71
 #define VADC_LR_MUX3_PU1_XO_THERM		0x72
-- 
2.21.0

