Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942F3D72DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbfJOKLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51516 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730047AbfJOKLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so20204758wme.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
        b=qSTQcxLV7utjjgxWnjpUDSKrGcqHyirT803FXxRmFjRBpo3nJvYYRZSoKowE2vU6Eb
         cVNVFjOYn/oRpsN6CRXydjBAYxYMVYXwufIggaWs0K8JiAtMDFxeIsIXBi9waJwla6T5
         Cc4T3MvsIp9DdBEk7BxcCiJAAp6Jd576yiJjuYU6EBwcv+3ehvpshZX3kf4XpFpGQVuU
         NzA1UgWgosF6sEdm8+xss2QDWvrUzBqs0oj5duZ+F3OBCZvSqf2QiOF3TNk9nsZOvwNa
         NtH1acXumxrh3d8NaYA9Tdrrkplf5l0OAKUDz8RYVgryukn7FLQhZ4MP/PKP4erpWbnO
         b5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
        b=XSNvAEATzYE4TPxYbAKKVYFGa+6HhfOkipI8fnWuqRYNXN1gZqiO/5G5TGB+qTTL++
         YSFk2nc+fQZxr623K8mARSGIRpbiLYBN3FbCyKEH8tiZIlIC/94MmMPxDT2WgCt4CFwn
         xbPSJ0RlxFwBPRg8aENV7QjFgk85yiVoLHht0+RggKR8rq3QP29vD3/8wtp01mxJPWN1
         5mDHpZZC3aZmKV/LIDZB/IWG67a+G/RgUTcoYj8jxe669ZT1BQ+uX2E5YhFtv+zwc/sw
         4HVGc8aP6WMBO8lLf/jQ3Q5qtBB2VyjTBlwdW+OVBoSlckMyVkTda9ngiWaR5lrC/vaK
         k0AA==
X-Gm-Message-State: APjAAAUTDIbShsROR3JZsxqMBLcHiUsO8J6bmHe0NFu2a7DxsT6MsUDd
        4vzMXXVIdrZggrvcbI+FXG26dfiqjnK3tA==
X-Google-Smtp-Source: APXvYqwaT28ROh8W7H79jlgiIgSfuIxdnPW47q5u676fq4bJzk89FhRhR06TPi4ewvwrxDk1OGt4wA==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr17440290wmh.148.1571134266579;
        Tue, 15 Oct 2019 03:11:06 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:06 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B compatible
Date:   Tue, 15 Oct 2019 12:10:56 +0200
Message-Id: <20191015101058.37157-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

On family B SoCs, the 28nm PLL has a different iospace address
and that required a new compatible in the driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index af95586c898f..d3ba9ee22f38 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -83,6 +83,7 @@ DSI PHY:
 Required properties:
 - compatible: Could be the following
   * "qcom,dsi-phy-28nm-hpm"
+  * "qcom,dsi-phy-28nm-hpm-fam-b"
   * "qcom,dsi-phy-28nm-lp"
   * "qcom,dsi-phy-20nm"
   * "qcom,dsi-phy-28nm-8960"
-- 
2.21.0

