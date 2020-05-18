Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13211D8A37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 23:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgERVsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 17:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgERVsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 17:48:45 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EBDC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:48:43 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id f189so12150935qkd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N4f7sy046N4O9Xu2U7ii9VWzSrJHNeqxjMTUXW3SrmY=;
        b=BfrhqJodaQneMVl3aAmmSjNLriVaIoX98o9ucrt6CzSWOfGHpzpdl7hgCo1EzUVxHm
         KTwcG62mdu40SqfZw1cqveHX85FlhH+hZnn+Ge9gwijeStWuVa8rUswsmFidxrzIE+eF
         Vi/vsOwykYR2yms5K9ALkYzMOWLhFTp5srjffz0fKSPYjQcGOl5y5Z+jZfl9xy3wL2+E
         cJ+V6al5qTWWAlpQCz/58b/JQ9HUFcpUU6ORXyze9zysx7a+ZD1DKNmhmPj0aGDkP6gM
         ZRwNVFNiwvRKLaoRD6/6Y6xra2ampmGK1hi/k35kFEtZO9mHTEOeCfWtwLRsUfshgOE+
         WLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N4f7sy046N4O9Xu2U7ii9VWzSrJHNeqxjMTUXW3SrmY=;
        b=H4NnGEWh1Ch9tgiqckAUtULzuMCPRZFcuj4ziXy/Cvk5NmhKGqAHyr/y6eXPv00u/6
         DTKHoV3vnTHaqlcHCzQy1nfJGpC7yUm3oTy5c0r3q0XWbUUVg9ujrksi2ig5a/x1YjFc
         HYTY2YyYqa+WZOVVLrYm5sq/qGgfd0MW5jnjWKlBmKFvZS3cEgPGjbY0JK1+P0+rKkc2
         fsl7l/ne6oa68uxGk5MdvggYrIw+YCgyBZMIsJJhk1tS+dSnIdYPVtuY4POF5rZO1nW6
         2DZoYUQUfAAohJAE8bQ0w5qhooD5kKkHQZXgd2i8cQ6aj4fdyt9yjOev/2BmOFwD0B61
         WKhg==
X-Gm-Message-State: AOAM5322cTzs0Yh6gVufJi8P37D0GqR+8Ym/HGrEU5VRd4cFACiHlbXl
        LujU/RV1MZajktnPTH7RmJvtDQ==
X-Google-Smtp-Source: ABdhPJxItb/XfkXTmeN9EHeUdpMv27YwTIR0P3ktyb9EdTa5wklLsgpcsPUT4m8qZcqpNZA35vV8Rg==
X-Received: by 2002:a37:aa93:: with SMTP id t141mr17288698qke.65.1589838522233;
        Mon, 18 May 2020 14:48:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id l184sm9151468qke.115.2020.05.18.14.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 14:48:41 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sdm845-mtp: enable IPA
Date:   Mon, 18 May 2020 16:48:34 -0500
Message-Id: <20200518214834.9630-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable IPA on the SDM845 MTP.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 1372fe8601f5..2f942daeb9d1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -448,6 +448,11 @@
 	clock-frequency = <400000>;
 };
 
+&ipa {
+	status = "okay";
+	modem-init;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.20.1

