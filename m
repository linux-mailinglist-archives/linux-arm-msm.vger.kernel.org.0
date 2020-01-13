Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39BB139407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 15:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgAMOyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 09:54:53 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42809 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728643AbgAMOyx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 09:54:53 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so7067124lfl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/4VDJozUtUDRjtxB/kp8itvm7M638W5AdxJEFSJoD5Y=;
        b=jeR/VQc0PulVYOUfup/ulU2nIDU3eIPyVE1weFWd76SjMLSZRil90wY2EOshZQzElQ
         nkdh6c/fMQ38jXiVKrtgxkYluellmr2kx98HQExcEtz4VSZLtdTjRNlW30Cu/iMQ7X8k
         xRYnX5Vji9x/H58DTFq/VVsQkZB6hvVj8yBwTEj/klOgcOawK1ufqLcZmT3nPsub+4ZH
         gLg3/9zmkHJ+o/dVlWO6M6RNSxonmkF/GNAZb2o3/8NXXkgz6ZXp8YEvOCEVL3ifEYM4
         qjpsGeguLTyPjw/iY/1lz0BXq9nyWnboyFX0eNafZyNNNcWd/wG2EnUDK+LPz1r1GoSc
         L3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/4VDJozUtUDRjtxB/kp8itvm7M638W5AdxJEFSJoD5Y=;
        b=Bm9BIu7Bp5i23hajCnAgMHUEWPciLHc537IiO/4Et/uzaEGazDNaeY+avqWNr17/Vd
         SL15GaJRbljb2kGY+JI0yNKzIOPi8jtBGzbiVE5TvvayDFxXc8qgSjjaUN8JSUTbBg9H
         jRCNUrBtCDBMsdO5Dpk9ezvaSEMnK24fTedd/noccJ2cCsnr0CUGXJK4DMLm8IPG32Oh
         eZlf87GUGEGtJSnuiIY96jvQn4/a49UWN1nfDwDKUZNIXIX7zoP81/0vjiV7Tb3e6233
         ylfNOqMzSbbt4ipZp4Sj46tn8X1yhLrwWSWOW+veUXjr2dAa/F7G2jlNBYd964+Oi8qe
         QCFg==
X-Gm-Message-State: APjAAAVP4ew62RxBQhs89L9HnL+x1drx4pLRUAr2vCv7kGv7Meywhnz2
        fU5A4ZugPcYDVpsQeXC/f/e14g==
X-Google-Smtp-Source: APXvYqxXGFZweM5WZczXbpuahrbpAK1LP3x1QwThF2hCHZ3knvtCEIHnQooimEJkoHWuXmCGMGXEXg==
X-Received: by 2002:a19:4849:: with SMTP id v70mr9680953lfa.30.1578927291997;
        Mon, 13 Jan 2020 06:54:51 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id w71sm6822281lff.0.2020.01.13.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 06:54:51 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] MAINTAINERS: Add dt-binding files for Venus
Date:   Mon, 13 Jan 2020 16:54:24 +0200
Message-Id: <20200113145424.4867-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a path to devicetree dt-binding files.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 983d3c97edd1..8c97d1e7ea50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13732,6 +13732,7 @@ L:	linux-arm-msm@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/platform/qcom/venus/
+F:	Documentation/devicetree/bindings/media/*venus*
 
 QUALCOMM WCN36XX WIRELESS DRIVER
 M:	Kalle Valo <kvalo@codeaurora.org>
-- 
2.17.1

