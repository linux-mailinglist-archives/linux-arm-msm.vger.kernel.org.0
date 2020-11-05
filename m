Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB1E2A74EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 02:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgKEBdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 20:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732673AbgKEBdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 20:33:00 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73882C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 17:32:59 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 62so70933pgg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 17:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y0j9x45cLRoZVnhsYpBXznSc0k/ZEdmj0hZUG9WZK3c=;
        b=sRMq/6pRIjsGno2xF8BFoX6qKBEzutyY/leovEnjFwgN85hCrsDhi5qDnw5Wmbrh0t
         6nbgOo1T3L8pHfzb+S+YGWohPszN0OAC6WwnNvF+olKDjOKFG8XzauJNWxv1R+jMjlta
         /TE7B6NXftrK4Db36vt8YYHCBIdLVPOkOARfu8Korec6UJqAl6eU3nF6exzw5mCWtJkw
         qz2Le4uhudzdx7OnTUwLAaZzPZMJ+URi6Vbjcb8Bbmook6opQ+TRj+eMAixstH97GpWI
         zToCgQyuYqbylGjLyQL4QwU+dwcwUMmJI5TDwCnjGmsPTzwi/7nbQm9W4kY0QGn5KTmp
         +hRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y0j9x45cLRoZVnhsYpBXznSc0k/ZEdmj0hZUG9WZK3c=;
        b=uVAJ07tc01mxGr3CI9peEPvQuo/nn5z2GedOD0tSQ7/BeeHjqzM/fuZUyoeM0MJMQj
         led6TeD9m1ctoxwBfX+oV/7TfqohtYrBc8CmnOmiKQMmubByiNO2BdOykYm/bvmruOBp
         KtGlWVHYv3vO/mlaZmzft0Lp5w8J9J6uTHix5YfRMc4b+HkKLSVAdCgb3w7+om62kEub
         DKXdXzep8uv9Zqb86WVnsYv60JkjGQB7WwK8wfwa6nNB/DJoF39lOD3WgVDZFwYWWaJF
         KdzEnl2w0Rf+4mrJmI+JN9C6gj8JJmpGyRjMzHBlmALtnv8mTQ5fq//jTPMNE/LPDCsi
         97Wg==
X-Gm-Message-State: AOAM5334Ai9cioTStAjReMc4LaQRakYsr7V5QHfo8LfMiPzRskvNpw8y
        8tpKFheas1JHTl8hH17A7hYP
X-Google-Smtp-Source: ABdhPJy6gSH82vUf24cqhPHpUGiFqpM1OSKMNUyQ2UfoTdKnRMHgEwTpcaFQ3kwG93vicyAwnc0cWQ==
X-Received: by 2002:a63:6647:: with SMTP id a68mr142209pgc.7.1604539979103;
        Wed, 04 Nov 2020 17:32:59 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id m13sm127817pjr.30.2020.11.04.17.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 17:32:58 -0800 (PST)
From:   xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org, cychiang@chromium.org,
        judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        zhouguohui@huaqin.corp-partner.google.com,
        xuyuqing@huaqin.corp-partner.google.com
Subject: [PATCH v1 1/2] ASoC: google: dt-bindings: add new compatible for sc7180-coachz
Date:   Thu,  5 Nov 2020 09:32:41 +0800
Message-Id: <20201105013242.298518-2-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings for coachz in documentation file

Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/google,sc7180-trogdor.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index efc34689d6b5..5857b3464e51 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: google,sc7180-trogdor
+    enum:
+      - google,sc7180-trogdor
+      - google,sc7180-coachz
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.25.1

