Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B1A4A7A5B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347599AbiBBVZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347540AbiBBVY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:24:56 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F331FC06176D
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:24:29 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i65so401766pfc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DfTAOBXCjBVewSGVxZZh4ncHP9166sdZbwT93TYgXSc=;
        b=MAdtHmVuGIVNSqpDp0nNHdN1k+wbqPjJUswbpC3+KEtps5zrt3XBWF44qqWIMoTYhR
         SIk8ubwKkc0SXysg/FtaZc/+YLhzKZnk0vmoE14br2Ubi0XXIwir+hx16G8VN2wn9l4N
         z9XE6p1wwhwuNqvcXcDC13S+e5zDovBkxAKrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DfTAOBXCjBVewSGVxZZh4ncHP9166sdZbwT93TYgXSc=;
        b=waXUvaF6cxJcNIaXym5+L4mTnPc/YF9YkURN8ZHIb6b4N8wKEhT4oZV0A9YO9q3G0z
         m+rTcY6laAAKCE+VaiTtqUjtMwbS3PT1jZSpv/5hAiEaaQfBWMeGQIZV4wC6y2MmUp7K
         KKKX22/g0MDtCIMJ6FXYAHLCrX5Uo/LIo3kIUqURvKWceR6/hbbnOz2sneWWYoJEhuq5
         shXMS9kE0HJlrA6U5+3BGNsbimmmlTRpvpp0zg9/imFmDmSHCtgpNW5OsjZDDDqEDUAw
         CjSENfLFQE+D9DZf0zUftb0E9attqTcRqVV2MCyU0IgHA+ZHfds/Zq5zzqYbwgJ5hl2Z
         4gyg==
X-Gm-Message-State: AOAM530p2miA8x87ag+W8ajM7RTS+diCppFKbqSCnmVVuLwca4I+q1pS
        Ti2zCHmTXwjwYMkgHZ1n28KPPA==
X-Google-Smtp-Source: ABdhPJyEIHWi0WajO1afZwfbNpuVBL+JYwF12qrEy6YYWgEsC2fifgouNPin6CXQPSLoxjPMCOb3qw==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr31506213pfq.17.1643837069500;
        Wed, 02 Feb 2022 13:24:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f1c4:10b6:b4ef:16e5])
        by smtp.gmail.com with ESMTPSA id on9sm7627983pjb.16.2022.02.02.13.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:24:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] arm64: dts: qcom: sc7280: Add the CPU compatible to the soc@0 node
Date:   Wed,  2 Feb 2022 13:23:47 -0800
Message-Id: <20220202132301.v3.13.I7924ce4592e3e75b2293804d8a3f8a4dae44646e@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202212348.1391534-1-dianders@chromium.org>
References: <20220202212348.1391534-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We'd like to start including the CPU name as the compatible under the
"soc" node so that we can get rid of it from the top-level compatible
string.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Probably needs a .yaml file somewhere?

Changes in v3:
- ("sc7280: Add the CPU compatible to the soc@0 node") new for v3.

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 618ae0407cd6..2bfc919d4018 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -573,7 +573,7 @@ soc: soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 		dma-ranges = <0 0 0 0 0x10 0>;
-		compatible = "simple-bus";
+		compatible = "qcom,sc7280", "simple-bus";
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc7280";
-- 
2.35.0.rc2.247.g8bbb082509-goog

