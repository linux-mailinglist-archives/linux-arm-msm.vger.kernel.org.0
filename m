Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF0D01F71E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 03:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgFLBwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 21:52:33 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50981 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726265AbgFLBwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 21:52:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591926752; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cgQ3rQPARSswpvg87Oo6JZ0BG0gpNPuTgsQQ63p80OU=; b=cVEkyMbHzMKKjNoVT6SXPlwXuzL6o9UpHPq+STNOwgeLLfwsTyux4d4M+hA6Ay9ecUmvU/gS
 jV/xQqk/OVJdUHuWxQsp24nB5slM/lJqVf59tfMXp/QIbfY56MZF4oFoqUxV2mRcetByNBPd
 3ZEyL6AuKrGIYIlStIXai/4HFRk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ee2dfc986de6ccd44679076 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 01:52:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0E27C4339C; Fri, 12 Jun 2020 01:52:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89964C433CA;
        Fri, 12 Jun 2020 01:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89964C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     sam@ravnborg.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, aravindh@codeaurora.org,
        abhinavk@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v6 2/5] drm: add constant N value in helper file
Date:   Thu, 11 Jun 2020 18:50:27 -0700
Message-Id: <20200612015030.16072-3-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612015030.16072-1-tanmay@codeaurora.org>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chandan Uddaraju <chandanu@codeaurora.org>

The constant N value (0x8000) is used by i915 DP
driver. Define this value in dp helper header file
to use in multiple Display Port drivers. Change
i915 driver accordingly.

Change in v6: Change commit message

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 include/drm/drm_dp_helper.h                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9ea1a397d1b5..4b2cfff5b761 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8085,7 +8085,7 @@ static void compute_m_n(unsigned int m, unsigned int n,
 	 * which the devices expect also in synchronous clock mode.
 	 */
 	if (constant_n)
-		*ret_n = 0x8000;
+		*ret_n = DP_LINK_CONSTANT_N_VALUE;
 	else
 		*ret_n = min_t(unsigned int, roundup_pow_of_two(n), DATA_LINK_N_MAX);
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 2035ac44afde..589132ab9ab6 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1134,6 +1134,7 @@
 #define DP_MST_PHYSICAL_PORT_0 0
 #define DP_MST_LOGICAL_PORT_0 8
 
+#define DP_LINK_CONSTANT_N_VALUE 0x8000
 #define DP_LINK_STATUS_SIZE	   6
 bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

