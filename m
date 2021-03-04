Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F4932D252
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 13:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239913AbhCDMGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 07:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239923AbhCDMGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 07:06:19 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C79C0613D8
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 04:05:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id r17so48830200ejy.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 04:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MrNAsI+lksN55P1mxUhC9GJybtgueSqHXzFIdFJpas8=;
        b=o37s/FxFXOSLE+73D3deZsq+RzFtc01V0JsX3ykLMA3Usyh7yG6slLHgKKfFAV0EUy
         +6c9lYwlc4F/cj4h248YwLSmO1TrF/sV2C8+RJKXEvWawEkHa8qn8GMro/6cXkze6xBx
         Uc7fgqUjZq9FWJExdnGYAYwtFBWHbQSly+x7m9x/99plshiQaC4XohJr/F/fptzx2Mkg
         VbW/Dischn1Rt57/b5D/pCrZOonWiPKrfXdYu6w5P/jX1FcwaiYQnR5iLWrj9yhMS2lA
         BwNK2jRbqtvvZw9utABldwh9K93Lo99bDQ8asK9k5TG0ABHD3bSG0mv4rQhwWrsX8IzU
         3PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MrNAsI+lksN55P1mxUhC9GJybtgueSqHXzFIdFJpas8=;
        b=Hs+rSXja72hv2YDDDTWE6p1Azgpmu+jJIZlBE9vi658ELO4DCOJiwiwTq9MslNgFmO
         S0hTp7FuXx8EPK/RurGS7hU7Hpenf12ec7GURGMnUcDtG1utNdCv64imAhEN57eux19/
         U9U4teQ6o3bo2u8hy9WfThFcb3YEeSh4tEL9C+H0GqshPkp5uHuaYuhm0eqpNy0SDaJm
         a+mf1Po/uFiD08U6zHIpTFbVyIDdaiSyElP9sY73I+8Ig4uP1ALAEL58vgkIqyqbJBxy
         SAqNx4/2jUUT4+V6k+6sc6DqqX6SL9vrQfnaDUS+sCC5BohjHvfeRTU/6RM8qjkURAQ7
         7caw==
X-Gm-Message-State: AOAM531sXymWGbeYYvEJ0OiNuBrpzNIeBecWFTgO8bt6a9lCwwmdT2qI
        vCQsQKf0MMat2KY4zp9NYtGfSw==
X-Google-Smtp-Source: ABdhPJwsRMy/dkEUr2PWym26wS6vzZ0RRkPgvmw3q2sv1o4CfTdjuuZB9YCeAPMmdswg9eSfW/4QJA==
X-Received: by 2002:a17:906:23e9:: with SMTP id j9mr3775393ejg.78.1614859537516;
        Thu, 04 Mar 2021 04:05:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:37 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 04/22] media: camss: Add CAMSS_845 camss version
Date:   Thu,  4 Mar 2021 13:03:10 +0100
Message-Id: <20210304120326.153966-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
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
index 3a0484683cd6..46e986452824 100644
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

