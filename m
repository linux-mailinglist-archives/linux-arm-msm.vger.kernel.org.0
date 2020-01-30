Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B84E414E484
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgA3VNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:13:06 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33138 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727920AbgA3VNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:13:05 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so2310785pgk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x+d19VC5GqGDrwah0h0bGrXkFmaAY9eB/iS9cICScuo=;
        b=bymF+xNlsIGFO5AVvycBkMmLMDI0N9JxG/Bf9e+DUzdYKaTxQCQn6cCxkA2xlU1MGQ
         jL3Ocqww4UXSqXcwOpEf4YhwjhY9GQoCIffmfnD0X+Hl0RDO8Cd9rWzI/I6lKgK9KgYt
         di04A74nfJkQ3bC6mWJji/hSv5fOrYlVaKmNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+d19VC5GqGDrwah0h0bGrXkFmaAY9eB/iS9cICScuo=;
        b=MnOGjSOO9ffG1rGzxVLEQpyJqUI54jakR8EKnA+eBxLTS0LlI4W6q1O0f6yQib6vQI
         BfCNLaw3H5avE3dmT2v0VsWr0VbzNwiYpEKi5CMwrnZsXU4gQ9/9IriN/gWV2py39r+n
         TpDyyWqU5f0u7BpIlLmIGt+La3mTyETdKy3XeSMo2fR8r/J/85HQTwtKC79KYIEcrjLL
         EnnRFQ6Ug9hjbucPOY3mnBAFcR4uJ+YssuBJy08+dbaAymtIywFG/CxeKEnCjBjvPxCK
         1Tg5hVnCSGd5mspSmActYK6HlxW9sVWKTzIa59Ka5ueho44GC+jMBCHO8wI3mO+irAcc
         OmQA==
X-Gm-Message-State: APjAAAWUv2W9d37hXc662ENt25GXOb775S2p99Yd1yGNir3N205trZVy
        rPIiZUV/Ck09hjZQsMJzsEVCgg==
X-Google-Smtp-Source: APXvYqyT/IU+WqiG933tteXMVt0zK6C+GD/fPoh8GuJLGi5bjbnMq8BTFHzIssXi/t0dghRGHOgoYw==
X-Received: by 2002:a63:3c08:: with SMTP id j8mr6664743pga.223.1580418785098;
        Thu, 30 Jan 2020 13:13:05 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:13:04 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 14/15] arm64: dts: qcom: sdm845: Add the missing clock on the videocc
Date:   Thu, 30 Jan 2020 13:12:30 -0800
Message-Id: <20200130131220.v3.14.Id0599319487f075808baba7cba02c4c3c486dc80@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We're transitioning over to requiring the Qualcomm Video Clock
Controller to specify all the input clocks.  Let's add the one input
clock for the videocc for sdm845.

NOTE: Until the Linux driver for sdm845's video is updated, this clock
will not actually be used in Linux.  It will continue to use global
clock names to match things up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...videocc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 35d7fcbda43c..3ad08d9deb54 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2607,6 +2607,8 @@ video-core1 {
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,sdm845-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

