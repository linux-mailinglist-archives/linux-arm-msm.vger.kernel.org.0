Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0072844A490
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 03:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239194AbhKIC26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 21:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239204AbhKIC2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 21:28:55 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58E4C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 18:26:10 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id b11so4913923pld.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 18:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cUtIpl24Lggy8E41RG8ia5NQqrtzC4GKJnnWF5Zf7Y4=;
        b=TNXVDLeLMVW1i6+8idnFThikZi7Oh98OM81dZHFgy+VjBg1cSD4CDiq3iV6QkNCjmY
         jNgDp0atM+zyOYF5rsq/1Ki2S3llSRuJaPcG7DSmBob6P2ks51YEv4WaWYcKvJYu1CcQ
         wE8Ciw9HByqSlMYj0GCpsDkPZRRtCGrRsy9Y+UjA0Ygse/dEGlJ0ikQY0wFPx//zPjoS
         t1gMef0gLeQ7zf74cQr++qCJys/G3Nguxt6Er9DKFM6XoHmeb4lx8ASCoKT/71VP7QEQ
         v7rEDHOVk17n/nEorN5CsKPeNtQjK4Mh+B2nLzi0TGVcVS3c9XeI7TflMOCO4bV15StW
         JwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cUtIpl24Lggy8E41RG8ia5NQqrtzC4GKJnnWF5Zf7Y4=;
        b=pjIeqzZnXQhV10ZGLHLLWgN3c4i0EpipOyG8I/uFZGM9FxAfllTxzIzK4srslfsZou
         l5PgdMtttxKjA+ulCFNiJaSOIOZlv1qD972YPoUwdAczNJGqgWJM9RWzJEOC2YjnWOec
         Xiai/YQD6XUjM76Lsno8V3NEHFXcNf9PuzXpq8Yp42nftzDstivVyiMOkbKscjSAdO5l
         724EmoXMOKCr0HRTyPNJrJOKw2w79a52NcHcwKvxgDdArUWJweXoHNl+KorTTTr8gi1j
         27b2aGw3xAaNnT2t9+VRR0wmSgKH5JnupwYmafzaysAmqfMVkAxYOokwJ6nxMLBnRW0o
         Xq1A==
X-Gm-Message-State: AOAM531nG33qovcbwPjq1SogSJbti5EFnhQoGcZynOymgZAokJXn8LCV
        Bi5nCVdQEHK8tPHUMYjJ5F7qIg==
X-Google-Smtp-Source: ABdhPJxjhrI3oT1OfkcTVxJUt3MlvPPxmulARdcSjQfwA6tXq2YHh770n8M8q+kR2JHIf/NrNLoJTg==
X-Received: by 2002:a17:90b:105:: with SMTP id p5mr3357519pjz.60.1636424770274;
        Mon, 08 Nov 2021 18:26:10 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id om8sm589619pjb.12.2021.11.08.18.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 18:26:10 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] clk: qcom: smd-rpm: Mark clock enabled in clk_smd_rpm_handoff()
Date:   Tue,  9 Nov 2021 10:25:56 +0800
Message-Id: <20211109022558.14529-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109022558.14529-1-shawn.guo@linaro.org>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The result of clock handoff is that the clock is voted by APSS and
enabled by RPM.  So it should be marked as enabled.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 26c70c2fbd26..6695a43a3d73 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -178,6 +178,8 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
 	if (ret)
 		return ret;
 
+	r->enabled = true;
+
 	return 0;
 }
 
-- 
2.17.1

