Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F1748793F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 15:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239397AbiAGOv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 09:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbiAGOv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 09:51:56 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0237BC06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jan 2022 06:51:56 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id s19so5720536qtc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jan 2022 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nl5vAeNGSOns35uL+fkC4uu+J6bk11HauJCQV7waYU=;
        b=C/yvRfk+luoRHRR7kHkAThuRQYp4xm78a5kqIhQ8UpMeNBe0eGmcD1kQ7myXnJWzXD
         Oc42tbOu6W//pMLS0RGc4l/yNqSmsIdk8WcpzutVWaYfhLGVSG/l5x5zu/t+SunX4i0r
         ufP5oiYWU+ohl1aNtMR43P6ArASJUA+rBwf9NRMzzb8w/5h5qDGWEBke1mIjFSBViS9g
         grsrZhMmuMCpotC6ymi092bmB9rl5cpdcymiOxkZyNmY0pPAnVp1GlYke9XK+NXR9xsW
         AQBIkMDX+K5MhSQwkSS5u2nHOIXO6OAmqTKeS+wBLdUN5iEHzL1etCH04z38tIMIEaA2
         xw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nl5vAeNGSOns35uL+fkC4uu+J6bk11HauJCQV7waYU=;
        b=a27hfx+Hxsz6d6AtMySHVs3U2XbNOhTU5k697fBOa1RaWm3sZ3o9awA1n0hnEh4Ga+
         bwdeofOxPCtxdm5aifN5bGa1DTtt60Zim3g7Z1vPIJE6WYzFYMrTD4LgD2yw02y+wrip
         Cbb4ILLwJ5yMQLCzubUSpM8WDV25mYgFsiwy5+rV8KhrnqPT98a+XxchHjqxEDYfIGMO
         V9i/T4hXzxpe+FG+rQTQdVm/ME0qwgiJU9VR7kEbKdJoJ9iacsYpgxIp2nPz6wPnMnhs
         G+ZI8ePaNx+guVx1kRGVgFtwkk7XY53t7mx3IO/0UlB3SB7JaHbO7kmtp+ZdVLeQBC3O
         T0IQ==
X-Gm-Message-State: AOAM532srL5unPx+vTEmUSzVs++jsj6WyOhmlb+DjAEt0OzK3BK6sOrw
        X32nZj/81MlKq4pzhWH/W4q2pJvCdbIH7Q==
X-Google-Smtp-Source: ABdhPJw+X70xUw0SSMUFrYRmkB6I8xJ9Ys/8V5scbKprm7qM3U7XyJoaBel6NBHVbSQjcZTvZULcnA==
X-Received: by 2002:a05:622a:1010:: with SMTP id d16mr8179622qte.81.1641567115127;
        Fri, 07 Jan 2022 06:51:55 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id az16sm3776899qkb.124.2022.01.07.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 06:51:54 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        rafael@kernel.org, herbert@gondor.apana.org.au
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update email address
Date:   Fri,  7 Jan 2022 09:51:54 -0500
Message-Id: <20220107145154.458779-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update my email address in the MAINTAINERS file as  the current
one will stop functioning in a while.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb18ce7168aa..afcdd7588822 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15751,7 +15751,7 @@ F:	Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
 F:	drivers/cpufreq/qcom-cpufreq-nvmem.c
 
 QUALCOMM CRYPTO DRIVERS
-M:	Thara Gopinath <thara.gopinath@linaro.org>
+M:	Thara Gopinath <thara.gopinath@gmail.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -15868,7 +15868,7 @@ F:	include/linux/if_rmnet.h
 
 QUALCOMM TSENS THERMAL DRIVER
 M:	Amit Kucheria <amitk@kernel.org>
-M:	Thara Gopinath <thara.gopinath@linaro.org>
+M:	Thara Gopinath <thara.gopinath@gmail.com>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1

