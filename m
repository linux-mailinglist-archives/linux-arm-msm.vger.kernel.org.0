Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79744D72D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbfJOKLG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:06 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36120 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727625AbfJOKLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id m18so19644043wmc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
        b=vGMW97MJ6WdyPk02rAJYW5hBe109q7xTv+F9Pm2vjuApqi+XlsgeMuCb+B4BmrL4zg
         8AlHifAmBgeR844Yp8XFZMS/NpBbhFvIM0gq/6PDxYYEE+DAU1NaRGwmQT1VxOLioYVL
         X/qKOx+WpVZpXZlIwvtp1bobfoeuVz1X0GtW9vy3MSKSXY+QvTLMsqIFPbj2TGFPrMjE
         AdF7tP9j4YSi4IL95oeg/UHYvoOsR6MtPqZXmJmgOw4KdYwwvpZ2ZSt41N678XK0Y4yQ
         4FC1YqpdurRJQKS0KqlZcQSYCu4RCi8tZjJ4yVyRQJiGNy95+YGY6wMQm4bySqFDzFAm
         S62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
        b=UA+4xVj0oYmN1/JFwcuQUw0mBJ9ZqzKouX2vJqwbT7X99qcpZbNquEp7dR1LlfwQtb
         QWI1CFjZF5kRf6LNhKxeM3SMBAw40+faZDBV1A/Bdz/T/eKVWLaga/U4JiGl9/cn+L9O
         8L8QEU5rookT9gz0JirKw4vY5079/AaKaRovbfByfd/2VF+QUAZ1lC5pnI3eEI14uNIW
         lckVnOCKLR88Nvz6Dh//VsfaVgKMq3yYI8O5zoFP45S5LL1W69fqakKsfrTwbwTqU/2C
         RHGs6XPTPnO9Al3OzzcVWyjT9jZWBVHwS7zAOxDsGCCe3xIcp3axgzX0gmZu+/hEho6S
         zwkA==
X-Gm-Message-State: APjAAAWYjV8w1YUMOZZCZeX4AC4XQuWwBNKxL7kPTiNSuUNvca7NDNii
        wikSJjdVYsexGvmyw2h3GO5qrIcISL6Iyw==
X-Google-Smtp-Source: APXvYqyPVLnjDiYl87POHRW8VN0tUihEAxvO/+0++G1lbLs4ypFF2T1OQn38A+5OS4GmxLtWwsmxdQ==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr15633501wml.38.1571134263669;
        Tue, 15 Oct 2019 03:11:03 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:03 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/7] dt-bindings: msm/mdp5: Document optional TBU and TBU_RT clocks
Date:   Tue, 15 Oct 2019 12:10:53 +0200
Message-Id: <20191015101058.37157-3-kholk11@gmail.com>
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

These two clocks aren't present in all versions of the MDP5 HW:
where present, they are needed to enable the Translation Buffer
Unit(s).

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 4e11338548aa..43d11279c925 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -76,6 +76,8 @@ Required properties:
 Optional properties:
 - clock-names: the following clocks are optional:
   * "lut"
+  * "tbu"
+  * "tbu_rt"
 
 Example:
 
-- 
2.21.0

