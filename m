Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9911472FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 15:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235124AbhLMO6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 09:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbhLMO6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 09:58:30 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34F9C06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 06:58:29 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 133so12160905wme.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HH/24Zvsag5iRgFp5ZNMJb2/h4lApJp4KjXAfpB5th0=;
        b=qvyeirPUX4XQRediRb57GcwkRYqxHjh9DsXNlBj0/eoPxsD5gg82wXsUoWDXitMLod
         GXrbDeSgn9Jikh26sUATpUCGnEwRcr0AeJCwtiB1M2MggJb3H3c8bh7Cknk7U50vj5AS
         DdsfxRYvpkYv62/OoZzavzxUTxStFoUe0IcQ3bmx3CuiNm2JIddYX/wCumihORfetFi1
         h4JKFNowqm+e7mvXbdnuywPzIVWbTY2SbuD5n3hCLN90Ub3W0F12QaDXyTGl7fVLIfCW
         xes1FD/xiZ+M070mU7y7vy/UMkGrvr7Y0tDowxFGpozCIvJLYW/4TgiEZMqTeLBjJUoe
         dfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HH/24Zvsag5iRgFp5ZNMJb2/h4lApJp4KjXAfpB5th0=;
        b=txNbhHTC+9iIAj1Fhjm/tT5a8txcKxzWjSjLYZ5Jj8+2h2rqVQmxvsC20bsYG4DHhh
         b21kGvUMh32tvwOsIVFFlzz7VgHFJu5mQF08frOU1g4tSgjlgGH98KgU94SIz22ahMmy
         M/SLfJD+odwLj2O0QKqHaM7zkiz//g95qr5D7bDHYJiw2xuNOUQPvge8W9wx2tdiM0BT
         6msgu9uSeRYcY6ZX3xuVneLL6angJqzWf/r9Cr9NSGBweqR/7t09k36PvFnN6H/8cwcl
         yFsAfjVzgBUdWgB9oR6yMoBc7uD9TKWOskaWNU1/XImkdVaWlJfDO5X1IKnpyaiZy9B7
         8pww==
X-Gm-Message-State: AOAM5304lI1Ud8OvDF/ANTEYfCjeHcT58MtrKcxDIuqn59jEt/zPnUMn
        HJ/sLqYFnztDfJBpWzejxcclvw==
X-Google-Smtp-Source: ABdhPJybmMOdGVERUiJd5CSvkcNlhCBESDJtrLKEJIswsWzPi7Cd9e6nPNaKcLkvofvnNnsc8Z1//g==
X-Received: by 2002:a05:600c:a55:: with SMTP id c21mr38334485wmq.191.1639407508390;
        Mon, 13 Dec 2021 06:58:28 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o63sm7570112wme.2.2021.12.13.06.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 06:58:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/3] wcn36xx: Fix physical location of beacon filter comment
Date:   Mon, 13 Dec 2021 15:00:30 +0000
Message-Id: <20211213150031.1707955-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213150031.1707955-1-bryan.odonoghue@linaro.org>
References: <20211213150031.1707955-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The comment in the header with respect to beacon filtering makes a
reference to "the structure above" and "the structure below" which would be
informative if the comment appeared in the right place but, it does not.

Fix the comment location so that it a least makes sense w/r/t the physical
location statements.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/hal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
index 9bce71592f743..e9fec110721b5 100644
--- a/drivers/net/wireless/ath/wcn36xx/hal.h
+++ b/drivers/net/wireless/ath/wcn36xx/hal.h
@@ -3459,9 +3459,6 @@ struct wcn36xx_hal_missed_beacon_ind_msg {
 
 /* Beacon Filtering data structures */
 
-/* The above structure would be followed by multiple of below mentioned
- * structure
- */
 struct beacon_filter_ie {
 	u8 element_id;
 	u8 check_ie_presence;
@@ -3471,6 +3468,10 @@ struct beacon_filter_ie {
 	u8 ref;
 } __packed;
 
+/* The above structure would be followed by multiple of below mentioned
+ * structure
+ */
+
 struct wcn36xx_hal_add_bcn_filter_req_msg {
 	struct wcn36xx_hal_msg_header header;
 
-- 
2.33.0

