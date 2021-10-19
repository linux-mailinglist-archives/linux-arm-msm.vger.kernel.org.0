Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E49C433739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 15:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhJSNlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 09:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhJSNlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 09:41:40 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E78C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 06:39:27 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id om14so14736910pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fu/N0/wfJM/gNSAgQFxGKP2CBqPDLA0sLqKbjnA3xdY=;
        b=Sle7GBCUBcaMrbCqc/kapDupfY68tIlY5S++TgCSHHZtBhc1aMcV4FYyztVYS9amR0
         uz0NjpiwpgL+O/IXtUAcO172eGrG8HyoURZwHUnT9A0wLAuhLcodsbY8lLbBbmKCNDv3
         m1xKhoXeNsOv95UOslEfSRjdGhq9c3w7Gb2AsKXr2COj27uewgC/QpIJnK5sh206FCVq
         qD/v+FyXnLLL0/+FfqC6xu4pfzukqdu1MP7iL3E85eh6uX1ShdL2VpuYTSWr/yZngBzX
         D1GmfNxFVxTZDuktj7pAs5WuKf8s25kbKsUSavW8hgUvpQJiDdk3yLYOTtWbrxfrIGcV
         ZAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fu/N0/wfJM/gNSAgQFxGKP2CBqPDLA0sLqKbjnA3xdY=;
        b=zuN2dflHRFjx9RjySgkI/bGWGNGjafATVelGTHV1esyvDIiWP0CSa7lnVneI9IXCBG
         zzSu8WC5iCbAeP326vxUxbCVAihmluQGfI3kd5jEj4Y0/JJoTJjzezWT4rgbEiTMnx+Z
         +6Ygp/iO5EYc/6ePmLpbqFbZjCrb733cNbDCfqPttvVEhG7p+agblE5a2KCUkHTIdiEv
         LzSvYVdsfGPK6yrOEsyFfZM3k5zbMdR9Ub4pbif9OmZiDnABh8HzEyv6YZrzm+TW+gxJ
         newTJjsp+DHBqiQBqTvFMMjrG+zGmBrIz79EJ5QS6nynkGnTmHdcHsQpszSxxkDVrBN+
         RlnQ==
X-Gm-Message-State: AOAM530DL3jbmAuRMGgge+e/cTg46hdweN0Gj2qYJyEdBupvnBwAhV5i
        oo0E+r55LUtiYUXqAxFAsAmJ
X-Google-Smtp-Source: ABdhPJwZyYaewx1KbnTgde48SxICfHFIR6T6egzKlyy+QHDPCrs3EolfNClqU6G512RRJMFKemEndA==
X-Received: by 2002:a17:902:64d6:b0:13e:a5a9:c6d6 with SMTP id y22-20020a17090264d600b0013ea5a9c6d6mr34024953pli.52.1634650766905;
        Tue, 19 Oct 2021 06:39:26 -0700 (PDT)
Received: from localhost.localdomain ([202.21.43.8])
        by smtp.gmail.com with ESMTPSA id g11sm16020033pgn.41.2021.10.19.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:39:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] MAINTAINERS: Update the entry for MHI bus
Date:   Tue, 19 Oct 2021 19:09:01 +0530
Message-Id: <20211019133901.173966-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since Hemant is not carrying out any maintainership duties let's make
him as a dedicated reviewer. Also add the new mailing lists dedicated
for MHI in subspace mailing list server.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Added Hemant's Reviewed-by tag

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..8ae357d746c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12191,7 +12191,8 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-M:	Hemant Kumar <hemantk@codeaurora.org>
+R:	Hemant Kumar <hemantk@codeaurora.org>
+L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
-- 
2.25.1

