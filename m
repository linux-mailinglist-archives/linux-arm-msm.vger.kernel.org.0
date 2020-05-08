Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5756E1CBB07
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 00:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgEHW7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 18:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgEHW7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 18:59:25 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE18C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 15:59:25 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so1720128pfx.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gy8mRnKGCdAlapJUNLKgnq4stIzTWpMgvZsJaIARMf4=;
        b=K5ld8pUSdKEuNRDrb6rIvsCRyHYpaDMubCYD4sukObf0hIGmT4kVqWfF36QvqNYGpr
         NxoCH0TZi5eD9+cXXa8WS93UxuRODo8rjVOUshlEwZQABiMryGUnwTLF35PqcIcpj4ku
         bF32L3llPP+k2g9M6lBkn9AY84SaUi3yZ34Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gy8mRnKGCdAlapJUNLKgnq4stIzTWpMgvZsJaIARMf4=;
        b=qkepV4sjbwP4FjK0pSzjKyjqPWVui97ggAJtkm5RJ7NgYTQh38ChnOWHqh5zwiUFk8
         WqnlY3hUz4lV6XCeUUuZnvBfe02+Y1fiv+sOA1wmQISObqaHos7sBOKl+VkL/AOad+vE
         CUvgpBt4Y8h/pR4XABvtwo7Gs5cZt5Zs7yWF5KYJ49nfa6/S0QtbbyzCu0l4Qn3TulCb
         wnqb+U0kPmflh3NMVUxU+9qGxzjtZKsnMAnIgP4eqmlS4SqEBM4usttVU0UjsfEpJCiB
         5828RZ688DT6CPBCDpCTI26EKGyX0hMhULw6Y0pwuvGp0Xn4xLEMw9l/HPzhGh8cPQtY
         04QQ==
X-Gm-Message-State: AGi0PuYkYoG2+oZ9RyVVulLn0cOqyuMofb3jZjPN5L9CBIZkZRWmDKI+
        083azFeqNjjhoPbGeU4kfuziPw==
X-Google-Smtp-Source: APiQypIh2ee0YZT2wE0RprXGN5jO2Gbnro485v/sWkDaPIfiCHYp61N2iTZmNPK4/xQdSaGusoO57A==
X-Received: by 2002:aa7:9251:: with SMTP id 17mr4911760pfp.315.1588978764710;
        Fri, 08 May 2020 15:59:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i72sm3062874pfe.104.2020.05.08.15.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 15:59:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] panel: simple: Add BOE NV133FHM-N62
Date:   Fri,  8 May 2020 15:59:02 -0700
Message-Id: <20200508155859.3.I525ebd471f5340a6a369af7bde06ef04174d2f41@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All info I could find about this panel show that it behaves the same
as the BOE NV133FHM-N61.  However, it definitely appears to be a
unique panel because reading the EDID shows "NV133FHM-N62".  We'll add
a string match for the new panel but until we find something unique
about it we'll just point at the N61's structures.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 7219436499f1..7fb7b257f968 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1173,6 +1173,7 @@ static const struct panel_desc boe_nv101wxmn51 = {
 	},
 };
 
+/* Also used for boe_nv133fhm_n62 */
 static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.clock = 147840,
 	.hdisplay = 1920,
@@ -1186,6 +1187,7 @@ static const struct drm_display_mode boe_nv133fhm_n61_modes = {
 	.vrefresh = 60,
 };
 
+/* Also used for boe_nv133fhm_n62 */
 static const struct panel_desc boe_nv133fhm_n61 = {
 	.modes = &boe_nv133fhm_n61_modes,
 	.num_modes = 1,
@@ -3659,6 +3661,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv133fhm-n61",
 		.data = &boe_nv133fhm_n61,
+	}, {
+		.compatible = "boe,nv133fhm-n62",
+		.data = &boe_nv133fhm_n61,
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
-- 
2.26.2.645.ge9eca65c58-goog

