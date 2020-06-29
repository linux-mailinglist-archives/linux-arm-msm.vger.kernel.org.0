Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD8D20E3E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387473AbgF2VT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390101AbgF2VSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:18:52 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFB6C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:52 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id z63so16663301qkb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I8kRZdRWy2CNksnUvA4vMT2OP8+RWTSu608AfsNc9EI=;
        b=Rg6pnT7yfj5lzyQZ8HdjS8EYIb5iXpCetvxP7lOrnqRoZaDYSUrCuIs1gr+r1pOMlG
         E5YZ6C7kjz/ROgjQNK6NMId9M5AMc0UL/6FFdD+m38QU1WqPOGVsIuqcIKYKAAjBklVH
         jKTKlrXj3FzMxdQdyV083PuAk3Q9LGa6bVSTj1TwVxXHSQ8azOxN6ihQh8qjEwswetvD
         hVBdf6ksFfb3azl/a+RsY8SFpU6DSSYO53oaFTcQ4MOZpFEAe9YJJgbh4rvxCDcuQ+ty
         m+F/OeciGyN17eQN/QWpVQBJNlLhLyN6FSHWJ0eyfEJ7JQDoBklpprSbi2xgMJZC2sWs
         MH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8kRZdRWy2CNksnUvA4vMT2OP8+RWTSu608AfsNc9EI=;
        b=LBRnYFzaDncADoVMyknsf4KWW9bjqKn/EXucUZSTSfCCegSr0kN/Oy8JIDHghTAyfb
         WRHHmxr8R08yNQZLOnz2Eg0ehaJDjBJc9g0CBNx3VSsnpYNU9ucYkFNbuKUxB1ysu36a
         mI9et7rMzaG4Vi7lR6labFdhJH+E6yh7fk5KN0+UVywtg7cFDfDYywLPAhRV6ttKJZ0I
         uTFtuYd0U7WwOhApQuVnDFmHGwhy8V3Fyf2Pp/322+T+QQHUTvzSkb2cPI6217wP0TYo
         tzejDgUuhu512l3nir4PwPlUW6XoMc25MF95FHAYGsGYXuHe4iSCqTJxWpEvcP7mcmam
         D56w==
X-Gm-Message-State: AOAM530iwonZdMu6tPIop7QGmBqHS0nm5Oo1ejdlPEAbxo+epL/nwCS8
        RWYfMc7QAesgTjj8l41e+aaMSFctnaY=
X-Google-Smtp-Source: ABdhPJwxd3sF4eWK7ZEDXYCKcDtWgafQp0K5B4mgWjBLrbtRARnR0quNrGVhebTT0Labylj/YCB0IQ==
X-Received: by 2002:ae9:f814:: with SMTP id x20mr16916546qkh.253.1593465531137;
        Mon, 29 Jun 2020 14:18:51 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:50 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 11/13] dt-bindings: power: Add missing rpmpd rpmh regulator level
Date:   Mon, 29 Jun 2020 17:17:17 -0400
Message-Id: <20200629211725.2592-12-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add RPMH_REGULATOR_LEVEL_SVS_L0, used by sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index dc146e44228b..5e61eaf73bdd 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -55,6 +55,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
 #define RPMH_REGULATOR_LEVEL_SVS	128
+#define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
 #define RPMH_REGULATOR_LEVEL_SVS_L2	224
 #define RPMH_REGULATOR_LEVEL_NOM	256
-- 
2.26.1

