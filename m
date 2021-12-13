Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE11472DC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 14:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237785AbhLMNtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 08:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbhLMNtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 08:49:24 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4185EC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 05:49:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t9so27152850wrx.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uTYixfrhf6bWN82g0Fi5qU9LAYUUaPAtaNL6sw+Jd4U=;
        b=UzkP3u7mSRzndezO5s6DIfYjheCQSdCtQU02g3Q5ETtGqScOMlm5VyzNoy9cUiNM6i
         vaV5b0J+kpEicIiBgpHVFTqJdXYVavg8/2ClSQpUBmZIB8i+3KlSl44I7u/kQLYL1bln
         wAu0+ith3OH2xkKQ6LINlR35Zv2FdwXYZwJONimN0yVstrcDg8bICGoU9rAb7Nvksh9U
         R/jBBC2oRQq0LRZ2AMaIXkA0hwT/Or4zWE3msLK/kDhKK+xoScvB22JH16TcbOZmMbpa
         5Egll1Rbzgh4TjkHx8186xLo+dmPSFqQapSaty8SQmevV/y4/4rncvu+oif0qof18jy7
         2abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uTYixfrhf6bWN82g0Fi5qU9LAYUUaPAtaNL6sw+Jd4U=;
        b=0nqwmk0ntflScl6KjvRqW5J8Vc3p9DLzikbNokIHBz1dOSqwcxPRTZ38m1P4dkmxWE
         VDU6ZGgGv82zC1Ck7CDfSbVS6qvsor3J3TQYLCbmuhnv8dcCmyNh6bCkQXfq2vhZX2Fr
         eKHIDSVKIwKS5YKT0P/+V4OwOcLOz6Kr4/8m7cKeAcXt8j9eHvl8UN6lRrwncPaNpgDH
         OauJx8AUvQp8CW4VcE6i+vT2onN0TvxUa+LWcWZfoo0b48H8bWH5w0J4/uXuWoiv2KXh
         r1+naCx+Onk0ETN6YhVr1kYNaDvcxq4VTLfwNER938Jr8KOBcic5tlQE2X4ndy/nYTpN
         TYMA==
X-Gm-Message-State: AOAM530CU8h4txtgLhK0U2mkVAC2eU2nGg+zuh4uIWw195ptR//ySbev
        8c97/vF/27jcrPiov/MfaUucLy/k9fdEQQ==
X-Google-Smtp-Source: ABdhPJwK6y8wWUO3a3CYfX2jh280i5UfxSv4TZuelqWNn5LWM0hWXZ+LUPFZxc2v+BpnSFWIvbUWOQ==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr16979001wrm.684.1639403362897;
        Mon, 13 Dec 2021 05:49:22 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9sm7366621wmq.1.2021.12.13.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:49:22 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 1/3] wcn36xx: Fix beacon filter structure definitions
Date:   Mon, 13 Dec 2021 13:51:25 +0000
Message-Id: <20211213135127.1656258-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213135127.1656258-1-bryan.odonoghue@linaro.org>
References: <20211213135127.1656258-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The beacon filter structures need to be packed. Right now its fine because
we don't yet use these structures so just pack them without marking it for
backporting.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/net/wireless/ath/wcn36xx/hal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
index 9bea2b01f9aab..9bce71592f743 100644
--- a/drivers/net/wireless/ath/wcn36xx/hal.h
+++ b/drivers/net/wireless/ath/wcn36xx/hal.h
@@ -3469,7 +3469,7 @@ struct beacon_filter_ie {
 	u8 value;
 	u8 bitmask;
 	u8 ref;
-};
+} __packed;
 
 struct wcn36xx_hal_add_bcn_filter_req_msg {
 	struct wcn36xx_hal_msg_header header;
@@ -3480,14 +3480,14 @@ struct wcn36xx_hal_add_bcn_filter_req_msg {
 	u16 ie_num;
 	u8 bss_index;
 	u8 reserved;
-};
+} __packed;
 
 struct wcn36xx_hal_rem_bcn_filter_req {
 	struct wcn36xx_hal_msg_header header;
 
 	u8 ie_Count;
 	u8 rem_ie_id[1];
-};
+} __packed;
 
 #define WCN36XX_HAL_IPV4_ARP_REPLY_OFFLOAD                  0
 #define WCN36XX_HAL_IPV6_NEIGHBOR_DISCOVERY_OFFLOAD         1
-- 
2.33.0

