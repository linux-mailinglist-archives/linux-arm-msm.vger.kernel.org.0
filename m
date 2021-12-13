Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85FC472DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 14:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237943AbhLMNt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 08:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbhLMNtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 08:49:25 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A1EC06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 05:49:25 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d24so27278301wra.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 05:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HH/24Zvsag5iRgFp5ZNMJb2/h4lApJp4KjXAfpB5th0=;
        b=xRPXCoCVRYy5uQJ7vpO/MeJlrs/bnkvxiWLaFYiSSGTtmbJT3W+d3JRkPWfuWzJ47g
         TwJ7lWTUk+RLrh2H8SuVZcxtcsoxCv69SbdtxZhDNUp+kawtFsu4ya52Vb6qGPmHL1JK
         M51ilv7ZgqGackFR6py2GYoprLD+Ohen3QwEphwaJUEzab56YURCzrN6KOTaHJroQ03Q
         ANNfAU8eCaLlIKTSF2m5Hiv7Jej7hwxBbuY5jcG4fVmCLecKoXr83b7lJynISX8wsSKw
         idZsNFibARopsaQhKE6js/Kwlvq2TCZaq+/OA0PUHbim/1SzI0p8H/ihh6nC1pOxQzx5
         OfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HH/24Zvsag5iRgFp5ZNMJb2/h4lApJp4KjXAfpB5th0=;
        b=nCgCGver3aGHxRGnk2HW6ZYqQqO4Pv2ZCugS7L65Jv6P3jvarS5wvmc4G08ZDBParC
         5/7l2ipXVbmyRDgVO0MMl5GGzOpmswylN12RaX3uxtoIXIag5YRplh4YXonocv4S5Pmb
         D3yqPiIk3HkxmY2wwYQNC0VflRHRzUlFWMQlxqEwMCf94S14F01+hzlhWpYmN5FGNIbo
         3lyH2pjVcvGUJ9rdSdgEXndx0Iy0onqp7dvIfjIZ69jew/mHI5T0wRZ+wKg0wl3hNiEG
         0GWf76aoVn7pJmDP1x23R0TwsfFbiuJFaaqYy6USaIAjUxXAN2jOoJfmSeKXaSZ9LZat
         X2Yw==
X-Gm-Message-State: AOAM53260K00Ewve+IZ3UhOFbYcrsxad0nqAdIvwRIu0IipXnoP3iU5X
        Gh3LNEPkzp1GDoNuIm35FoACDQ==
X-Google-Smtp-Source: ABdhPJw+xJVA+LsdGvwdw0uxQjprhhYxS7WKkevH1YfIoqTOrxSS9+02z9trfe0GwmlNIN3pEoOqrw==
X-Received: by 2002:adf:ef42:: with SMTP id c2mr31400529wrp.528.1639403363901;
        Mon, 13 Dec 2021 05:49:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9sm7366621wmq.1.2021.12.13.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:49:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     loic.poulain@linaro.org, benl@squareup.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 2/3] wcn36xx: Fix physical location of beacon filter comment
Date:   Mon, 13 Dec 2021 13:51:26 +0000
Message-Id: <20211213135127.1656258-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213135127.1656258-1-bryan.odonoghue@linaro.org>
References: <20211213135127.1656258-1-bryan.odonoghue@linaro.org>
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

