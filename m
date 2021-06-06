Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D7239D146
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 22:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFFUTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Jun 2021 16:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhFFUTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Jun 2021 16:19:03 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B12C061787
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jun 2021 13:16:59 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cb9so17670876edb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jun 2021 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O9ZRLR7Ot8Lsx1jsDhH7FGYDbrZdMu5Zb2VpXOb1xQc=;
        b=N1UVhLrqamh+j37H/CDIXyb9wNotOeqY8s7ZhQKgR8OXEErVi8u36Z/aVUfitvBm7q
         vTzY1BNbpCX0npKT5OFB61G8V4MVlPWoxW4Gk5nl+6kvavgIvKjuiVFvbQ2PdrhyhIe3
         UjgpurD7vaZG9U6KniLkS1K81h53Buquee8qH1Xgkkh5vXa/dFmjjuXqpNlbd+VUviP9
         8SNtxBK+1L9V2nUSgTJMyT83z9B2ROutFkqmnjHGljGadKkfeds+lk0ks2ZrdvP/1gAW
         gzGZqV7Pane9zcDf21MzxJipP24NrC9EonsWFHnsvpy3LrQ3TZKUyOXLBat0O6xseh0n
         SISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O9ZRLR7Ot8Lsx1jsDhH7FGYDbrZdMu5Zb2VpXOb1xQc=;
        b=hS81xUMSzXjhCNhmcbKyuxlgn3HJz0RQm0o6vXrm4c1YbYz6rdsH0PFg8l0BonpZs3
         PGmHOX7A6Ib1qwKqg1crq5TJibfJmj1vrysvfW7pj23lLdWS58ysXD5kA/6Lp/Vxq44V
         kHLySWKDSwPv3avZx2LXvn6nkWwPygoT0JvGe/x/Jyldm9JqvcoDU3L0GEbLD18iBMTc
         40Etp4Tq8ei58sK3BqddcpWgjP6mIDY8UjMWxjndjjBAdLEwxL5Nyy39N4jiKe2eGnR6
         W/3FDPfQUh4gAjcD0QCIOq4zU3dKr9rzGzm24i83DxngbS7c/Sk5k8BxsG8MrKBdd4WA
         ggeg==
X-Gm-Message-State: AOAM531kHMCkWx7AWJZ43Umpo6KA53fUvxRWOf6g5rLR0k7yNiz17xZd
        jhNUMh3OAoLgLSavmdLqBvwPEg==
X-Google-Smtp-Source: ABdhPJxn6NWckN7q1uCOM6LS0V8FJjs1rgHxW5ZZ6tI+96nCM4aSmz/RXIcLLRXQ6fatx18IzDKWZw==
X-Received: by 2002:aa7:d5c6:: with SMTP id d6mr16311535eds.290.1623010617652;
        Sun, 06 Jun 2021 13:16:57 -0700 (PDT)
Received: from PackardBell (192038129059.mbb.telenor.dk. [192.38.129.59])
        by smtp.googlemail.com with ESMTPSA id v8sm2211623edc.59.2021.06.06.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 13:16:57 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 271784dc;
        Sun, 6 Jun 2021 20:16:53 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: Add SMP enable-method for MSM8226
Date:   Sun,  6 Jun 2021 22:16:11 +0200
Message-Id: <20210606201612.100752-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606201612.100752-1-bartosz.dudziak@snejp.pl>
References: <20210606201612.100752-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding in enable-method property for MSM8226 SoC SMP support.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 26b886b20b..96912f1a26 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
           - qcom,gcc-msm8660
           - qcom,kpss-acc-v1
           - qcom,kpss-acc-v2
+          - qcom,msm8226-smp
           - renesas,apmu
           - renesas,r9a06g032-smp
           - rockchip,rk3036-smp
@@ -286,7 +287,7 @@ properties:
       Specifies the ACC* node associated with this CPU.
 
       Required for systems that have an "enable-method" property
-      value of "qcom,kpss-acc-v1" or "qcom,kpss-acc-v2"
+      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2" or "qcom,msm8226-smp"
 
       * arm/msm/qcom,kpss-acc.txt
 
-- 
2.25.1

