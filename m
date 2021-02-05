Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA22311658
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 00:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhBEXCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 18:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbhBEKpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 05:45:40 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12F9C0617A9
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 02:44:52 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u14so5510204wmq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omqwj2z9F9rHihQvE5my1Bq8ugVfe2upOvjFAe2eO3E=;
        b=DUta3lZ0jeeI2mfAqLuOr0LoAqSjyP23YOvSA+MGuTzk4YeiWS8LBvmcgwrS5tCvYV
         fnucjozO55ga96eLIstQFcnyycgJgSiRHBXPjGIfIVJtqWTLT8AHvi5U/IWsqoullzsu
         a/bkI/nGkbAkbYEYBkrEMKgd76oXlQ52qYWzKCPSRUkDNSMTO+prsyg0ttXvd43Okgs4
         rY8YKdEx3U1dOy7Ee5b+N2KLj5rvWz68ZF2SsKe+3PuLUyodvTyejV1jIsrbJ2hApeNZ
         MUnBp8pxIqbe6AJU1jK7H0V1GRNKrynctXEho6kmk+BTRmFF4rcToQqSHX/oNp5FZU//
         AMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omqwj2z9F9rHihQvE5my1Bq8ugVfe2upOvjFAe2eO3E=;
        b=ZwBMVeAfNmGB2m+O1+h4Yz4mJa65gUKqmseIlIk5AzWZw/xjw6oMsNS5N116657+tD
         driSLMXPVUugdyrLJSCEqi5V/1FA8TIyC6mtSehvX0kcMy+DXjSuM85kwBLWS7Favyyz
         4eOGigbEzDsdxfd5BRL+B8oCrkhwZf73c1zYIuVYBY8XS1DWL/xKxwlM/AwsW6/+AoTV
         SqODmsN1weP72JATfSyTLmP1JjFuP65n7Qs3ZA5ggIVL68XTg/HsQxAAy0iKwkx9Riml
         NjaHMgF81iH+1y/kp0/cYdHgRNXy4udmHmGyGD9d1ZwMA8fzN/m6LMPxXzax8NsgvAvQ
         0eMg==
X-Gm-Message-State: AOAM5317FstMknrETG9f7dn4KwOpbxSGpuXwp735zSChFeb/DycL2WP0
        XbDrxdyYb3Tk7NxUB0kja3XaGg==
X-Google-Smtp-Source: ABdhPJxPUNLwMwT4bGzn7FeYdysUYRlPlp0U/g7xufG2oYznDmaogyxykCu85IMPt+dilZ2bj9kO0g==
X-Received: by 2002:a1c:7fca:: with SMTP id a193mr3052465wmd.189.1612521891428;
        Fri, 05 Feb 2021 02:44:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:44:50 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Fri,  5 Feb 2021 11:43:53 +0100
Message-Id: <20210205104414.299732-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Function name is comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - Bjorn: Fix function doc name & use kerneldoc format


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..94c9ca7d5cbb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process composite image done interrupt
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

