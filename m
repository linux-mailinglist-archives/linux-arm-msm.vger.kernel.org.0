Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38A12333F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 18:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfLQRMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 12:12:10 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39729 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfLQRMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 12:12:09 -0500
Received: by mail-pj1-f67.google.com with SMTP id t101so137787pjb.4;
        Tue, 17 Dec 2019 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rAKJhGTZ2teGS047nD7DJSMUU4bTzFd5ZYgO1gQMDSI=;
        b=rVCCiH8iqK45MkInHDX8rW+EsjB4I4z6t7fiJGxYYRBvglirxBRH8mENdzcofQdt2c
         N2N6powbcWgwV2MzNxcrowboV57ZwSWblKyiD0K8RBPHmCega6k7arVU6GhrWV2DZmZu
         31MBakO4qvm/uy9K79kjBIpuxIOaG+4EUAK+VonL8LXOPBqx76fTiINgWVlIJe+EH/5G
         Xk4a8hblVUiiM1VvjAFuxQJ6758D7Ooc6sOLwoI1WElabi0LJN1ske/SMnrewOCC+JgB
         GzawMGW/BKovcg/JvuDQv1LnoqXJw3P1Vh9sxmBi+bA2ebmJNq3Un47Ss/LLUV0hYBaj
         PslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rAKJhGTZ2teGS047nD7DJSMUU4bTzFd5ZYgO1gQMDSI=;
        b=BPfvmiKXW/pcBw2I2ZXhSachz0t4gpwY5Me/B2PW2SI4XHOYCYVtIpwcvluwDpWMMr
         kRSvgBo1Ode2EyY1JYYSRrg3P6pjOsEfIGMNyk1aPj2DLwphJpcucPy+iqilrhM7QXVq
         dANCkWHn6uDeDZa6XrqETH8jmmPhYBHBUk5cy32BqUWlgd+dt7CJJU8/IwofWgimxX6F
         GCK9cO746/8yt3rmnqCobKLh8yexrGqNZVn5fN/jbvMJl1Lm+LIOOWsECeQpVxA3e0oM
         LD7HGzrCNeaPWjiy9eCffMuT3juJXhtHmLrqZCfYtkUHxk1IQDFDo0Dusdk2Be5PXsB9
         zrlg==
X-Gm-Message-State: APjAAAWLXVktm2riRYzPXL8PhjonEsVn8WDWSvdUUAUpcIAoMdiF4Om6
        5WG199KCI0r3AmKODUVfYs8=
X-Google-Smtp-Source: APXvYqy57GTRRmxzMLM59IPiRty0nYcJe8+XYgCyYjacQ27/tQ8zsT9jUqnRAV6HYvT3YY72iyMGGw==
X-Received: by 2002:a17:90b:1247:: with SMTP id gx7mr6709916pjb.110.1576602729112;
        Tue, 17 Dec 2019 09:12:09 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id p16sm27419021pgi.50.2019.12.17.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 09:12:08 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: Make gcc_gpu_cfg_ahb_clk critical
Date:   Tue, 17 Dec 2019 09:12:05 -0800
Message-Id: <20191217171205.5492-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mark gcc_gpu_cfg_ahb_clk as critical on msm8998 because gpucc cannot be
accessed without it.

Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/gcc-msm8998.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index df1d7056436c..26cc1458ce4a 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2044,6 +2044,7 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
+			.flags = CLK_IS_CRITICAL, /* to access gpucc */
 		},
 	},
 };
-- 
2.17.1

