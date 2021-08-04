Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C793E096F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 22:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240907AbhHDUek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 16:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhHDUeg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 16:34:36 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71352C061798
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 13:34:23 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 3so1762263qvd.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h3URnXzA6Smvye6C/6i5qyn1fy++8nfwykxUppqU1pk=;
        b=gPbCicQYAGpeNOqDegdPFGk+hOrbEuokmjrQ85DpjFcn16ku6hN+HzbFgTht0V2TJg
         l0MQm4G9tX+9XVaZah6P6fCYi9ojl58ZKP6KUY7myyfRA8B4+ynKi1AayE/nAqMXX5kg
         o5IId1773mDMkbLlYs4uxEJ7XzI0FcXwpivmaH8QVTowcr2is3an07Nya0EyPQG7OE1v
         R6SGuEP6lttOiHoEpbxVilwDi43sJ9cpUU6EVe1GwKpVI9vYfiIwBFl3DXlCCIGHJUEH
         p1Gjhhcbbt3otjWFBMWwEsiV+ZV7ehWsCFaAJQU72eQddr9fpB1fKFv1FaAC4Tv/RgMx
         6e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h3URnXzA6Smvye6C/6i5qyn1fy++8nfwykxUppqU1pk=;
        b=lhAbIxYlYW/vtzuXMHGL+RnU+v7QYT+fgkiQ3toeDNN+W4qXR3jZij+MyVBUGpUEsr
         7kcW5yb97CATlZdRLT5t9+4to8P64naHQbnxx8n5+53sMWIQcmVT7YHzrJqJfbo1LNof
         /ZFalzmJWgCCNpGffH5GBwPwxtD0NsQhS8lWmarhA0W7CYKzWyBPrzxK48tc0JIGlbg+
         kf5z14W5lCq/zISq/k3oF/xg+IftngV0lWsTy5GnKnlAojxvm3NjQtcZCvtP7dtKAb/N
         NyL9h0Hjp1X8s1qecNwawzBp4pINYKFfU35z5coO+bVH5Sq1iheAIp2xhY6ttEdFvoZa
         4B+g==
X-Gm-Message-State: AOAM533CBHUnPzOQzaLN14FPYLPnmBjD3vQpbhgZLe72PDoUUAj0wKxa
        +ZsB7iNtnbLvecxCRxXWdzvAJA==
X-Google-Smtp-Source: ABdhPJwj+0aqaWHXrY6r0IkvWxsOQ0sQh4dja9i2liBox7l0KSX6K0iApH4QeU+AJibo9SkXVFsm4w==
X-Received: by 2002:a05:6214:c6f:: with SMTP id t15mr1413038qvj.52.1628109262339;
        Wed, 04 Aug 2021 13:34:22 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id f15sm1326625qtv.60.2021.08.04.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 13:34:21 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v2] cpufreq: blocklist Qualcomm sm8150 in cpufreq-dt-platdev
Date:   Wed,  4 Aug 2021 16:34:20 -0400
Message-Id: <20210804203420.2641463-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm sm8150 platform uses the qcom-cpufreq-hw driver, so
add it to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

v1->v2: Replaced "blacklist" in subject header with "blocklist".

 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 9d5a38a91f10..231e585f6ba2 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -141,6 +141,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,sc7280", },
 	{ .compatible = "qcom,sc8180x", },
 	{ .compatible = "qcom,sdm845", },
+	{ .compatible = "qcom,sm8150", },
 
 	{ .compatible = "st,stih407", },
 	{ .compatible = "st,stih410", },
-- 
2.25.1

