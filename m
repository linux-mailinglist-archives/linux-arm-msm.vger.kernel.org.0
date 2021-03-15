Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676E533C0B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhCOQAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbhCOQAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:19 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D43C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:00:19 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x21so17939558eds.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8G+ZMr9j2FN56LuTLUOEMncw3y0hwCnmAUfBw5wAtUk=;
        b=ZrcwjVJi1vggBgAijXS7fWzogqwPZmhxk++3O5LC6YHfIQC5fmWlzXsItY8kIN8+Ou
         7ZcXySy3ZDXD8xZKyeblcsI6hCfRleS1AnuyC9aAijXHAUZgPYFBzlIkdp/PvW6a/QHD
         fPJRGm86o5mwbt+302ZF84Y/KbXI3A4IbmebPuZb3elFr06feJ2FrWdnLHCUegQ1CWZF
         IZ/HZU4Ov1X1w8ezhnmJRHhmom4g3jOFON6waUncjoO1MQQbxQiX+Fw5J/r0W+w80fvt
         QMyKxLuQYgGz3P4l5udx7c2oYPVUEgAJNTFRarxg/GbOYROMOZqkBqtoCYk6irURAMDF
         s2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8G+ZMr9j2FN56LuTLUOEMncw3y0hwCnmAUfBw5wAtUk=;
        b=kRJajz8DxEI0+hxWlXJSfj63D0/KAvVkvdjNdxsHAWiy1/kdgGKhkSvy+pCd9kTkzK
         H1120eH5sSu79j0g6YQ/LuRQIryKEjclgzw2u1dEHInTV4QCSXCjgD/5fnDIq/dcXERa
         ABnDynOoV8YcqLsFDCNpsGOSKwh+68w51f0NPHAolRjHuh32BSos970pciqVvsqOQ+y7
         XQr20y/8Gf9+JZvPArhoFcaPvOAEzCv1hgLbDXleH3B+nW1TDxIzvzh9I0V7RQto2P1i
         BYQtHdbIzoqAaXzO/9vyqpadxXaEbgBdc3vo2UC4jJY3desg0p1TTVJrKmPXeNbKju5j
         teIA==
X-Gm-Message-State: AOAM533DB4/gJk8BBi5qI/EwC1GSotvFFljGJQOzZfrYXuqNT3wGi9aW
        RTwKzGNM77bX6lojBvMgYD/8YQHQBqIiem2n
X-Google-Smtp-Source: ABdhPJz42+lxI2nJbwkATPMxbWO08P0hBO6V4zUWE+szxyjhjLd5DyEDE+xH7b2TDQZF9vMnOJ7Onw==
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr30808206edd.283.1615824017570;
        Mon, 15 Mar 2021 09:00:17 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:17 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 04/22] media: camss: Add CAMSS_845 camss version
Date:   Mon, 15 Mar 2021 16:59:25 +0100
Message-Id: <20210315155942.640889-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add enum representing the SDM845 SOC, which incorporates version
170 of the Titan architecture ISP.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
 - Andrey: Add r-b


 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index e29466d07ad2..63b35ea2ca36 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -66,6 +66,7 @@ enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
 	CAMSS_660,
+	CAMSS_845,
 };
 
 struct camss {
-- 
2.27.0

