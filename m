Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D82D4149138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387459AbgAXWno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33704 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387445AbgAXWnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so1864392pgk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9BRqMxL/+QF9fXGxsodaUnU1nURwqkQVRb7Veb8jqnw=;
        b=jShQ2pX8IQIHGNrvrIOhAsqUK/C01VqaM9/g6/e7k6X2Xc4duWVu1GLO4DYADKLj8h
         DB1G4XhIeSlzDcjW5h0qV2Ri0rmkCIl/+sDXQ/FYpddk2u405IOAnDMRnaomXKuXhIYv
         rlfKquY9Gm+95wPB7AhitjDpdpTbpS0Fl/u1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BRqMxL/+QF9fXGxsodaUnU1nURwqkQVRb7Veb8jqnw=;
        b=tjjwagdwdP3o9pDcVFTpUHF9eLe4hjhkU7rYYCbWVqYQJ/fsSeOIvm0xtQGKLoPDvQ
         YIbkYlmGx2MOUm2u5L+oOIV5olTYCKHfhKkdW3if++2R8lrHXi914zxBVH7Hg2OQ9eCb
         Ng1aU4HGQ2XdVrILiGWnwufuRnqRiJrRhQq0yx4hF6N9gn/LGg9f7h/OtarjqgXHS+01
         b13OpkwYNU6xDW5+ibTZnXrjujclKxecX4lERIPLR77qXao86Ah2kSUssotBzG9uVsZw
         AiH711pSCEWyGvvWx07V71D1VnSZOMVx5FanQeHjsC3EEYF6Sa/Ud8OIjIfrUjMvVeH8
         vlsA==
X-Gm-Message-State: APjAAAWl9zOiZzN4lSUL8IAPA9S2/Kc2z6bME7/Vin0W1r9I9RDpR/47
        6daNIc+5OqOmPfXkFqqkpSlZqg==
X-Google-Smtp-Source: APXvYqwyIr9Hzf7MUy0r0DgFSN19tETtctZT8PEgdV9N562GI+cGiutgSkgp4ilXhVm9KOMG0sXfvw==
X-Received: by 2002:aa7:928b:: with SMTP id j11mr5412125pfa.176.1579905802569;
        Fri, 24 Jan 2020 14:43:22 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:21 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 06/10] arm64: dts: qcom: sdm845: Add the missing clocks on the gpucc
Date:   Fri, 24 Jan 2020 14:42:21 -0800
Message-Id: <20200124144154.v2.6.If8596faf02408cef4bb9f52296b911eb9ba49287@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We're transitioning over to requiring the Qualcomm GPU Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTE: Until the Linux driver for sdm845's gpucc is updated, these
clocks will not actually be used in Linux.  It will continue to use
global clock names to match things up.  Of course, Linux didn't use
the old "xo" clock anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...gpucc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 01354533a61b..e624c91dbd6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1903,8 +1903,10 @@ gpucc: clock-controller@5090000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "xo", "gpll0", "gpll0_div";
 		};
 
 		stm@6002000 {
-- 
2.25.0.341.g760bfbb309-goog

