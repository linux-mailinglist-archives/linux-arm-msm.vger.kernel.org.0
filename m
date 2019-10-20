Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71018DDF08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 17:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfJTPIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 11:08:02 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55507 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfJTPIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 11:08:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id g24so1393328wmh.5;
        Sun, 20 Oct 2019 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9FkS3vnY8rTwRRvDNh5lutxmRI2CZBA9wqCIHbI5rZ0=;
        b=rO1pR6/+sCmFzO3gWnN7bFjVY0zguKE/B399D3XubxLHBjx83d36vJXQ7RxkxCAiOb
         QX2F5GtBOycx42bOaTVywJdjpSltOWc5RZNVDSk3EWlKe4VAHaV40MdZB0TKuR2tF0+Z
         cAaLDSOgLB2JDp+yLjkX/T7okFMSDbL4Xxy5kbxbdWGeH/q3VGvinPY2u+LaYfXHopk9
         LjcPz+/h9RPesn5jUdNhgNV60lve3VI/qqNOTi3Ja+LGwToJd92LHEDtLL7d71kvTvT1
         SWVQfgutkadEcjI712fV6AgHj7X1NNtsirCkULr5HKK3BLhbOomiA1ttisT6nHWdnpK0
         WMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9FkS3vnY8rTwRRvDNh5lutxmRI2CZBA9wqCIHbI5rZ0=;
        b=fWN+CJ1GVSok3m0GS+K+QKMEviKv3a9XtFqoMB9jZ0zQZYcQvHke42PxPp3ygkhSin
         NtJ/AnZtD25NTZF3Nm0JizFz3hHWWaqOBe8s7lRdMylAcfBpylTlSH+/vDzPG8rnu/uy
         /l9vJeC7l0Bxt71XLWXiZeW4ZbsW+zYtxww7fbFvcWRtfXrxvzM6W56ZSVaiixUWaPVr
         GH95MIT4bDDTMw4Bf9jaKjwWjIbU+zNLgyXj6xDEPs3vbgPkFL3dh2onKOF9IQ20ioYv
         kqMLEd38BKjDl5Ff+h2Kb0ziZ0PsiZTsK9JKZ9mw9w0a2auwxNRV/zANc7EGsnyFtt2P
         S+jg==
X-Gm-Message-State: APjAAAW+WYAflK2/GyGyKL45LuAbMkyPE1Y7RShjKSjARANnn9R5fSSM
        GzBB8ihtRlfTrGvbBYaaM1/SQtoqhLdSnQ==
X-Google-Smtp-Source: APXvYqzw3RwitOuEQIuHVhR8r9bQMTpVXXHL6lB3sskcD/JrKMBPi1XsqHFde0aT7lsR19Hdg8bPGw==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr16388191wmk.28.1571584079269;
        Sun, 20 Oct 2019 08:07:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id z9sm11921172wrv.1.2019.10.20.08.07.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 08:07:58 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 1/5] dt-bindings: iio: spmi-vadc: Add definitions for USB DP/DM VADCs
Date:   Sun, 20 Oct 2019 17:07:42 +0200
Message-Id: <20191020150746.64114-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191020150746.64114-1-kholk11@gmail.com>
References: <20191020150746.64114-1-kholk11@gmail.com>
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

