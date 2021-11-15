Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09125451664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 22:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347067AbhKOVXD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 16:23:03 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:50867 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350324AbhKOUie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 15:38:34 -0500
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C1C7420111;
        Mon, 15 Nov 2021 21:35:09 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 5/9] backlight: qcom-wled: Override default length with qcom,enabled-strings
Date:   Mon, 15 Nov 2021 21:34:55 +0100
Message-Id: <20211115203459.1634079-6-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115203459.1634079-1-marijn.suijten@somainline.org>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The length of qcom,enabled-strings as property array is enough to
determine the number of strings to be enabled, without needing to set
qcom,num-strings to override the default number of strings when less
than the default (which is also the maximum) is provided in DT.

This also introduces an extra warning when qcom,num-strings is set,
denoting that it is not necessary to set both anymore.  It is usually
more concise to set just qcom,num-length when a zero-based, contiguous
range of strings is needed (the majority of the cases), or to only set
qcom,enabled-strings when a specific set of indices is desired.

Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index ab10910971e9..5306b06044b4 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1520,6 +1520,8 @@ static int wled_configure(struct wled *wled)
 				return -EINVAL;
 			}
 		}
+
+		cfg->num_strings = string_len;
 	}
 
 	rc = of_property_read_u32(dev->of_node, "qcom,num-strings", &val);
@@ -1530,9 +1532,13 @@ static int wled_configure(struct wled *wled)
 			return -EINVAL;
 		}
 
-		if (string_len > 0 && val > string_len) {
-			dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
-			return -EINVAL;
+		if (string_len > 0) {
+			dev_warn(dev, "Only one of qcom,num-strings or qcom,enabled-strings"
+				      " should be set\n");
+			if (val > string_len) {
+				dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
+				return -EINVAL;
+			}
 		}
 
 		cfg->num_strings = val;
-- 
2.33.1

