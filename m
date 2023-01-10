Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0ED66381A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 05:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjAJEVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 23:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjAJEVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 23:21:30 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6428940C0B
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 20:21:29 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d30so11484158lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 20:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLclwd9d+1jNPhnPiOUxrWwaeB2zLFgxQRjSahEcvdU=;
        b=i02xmS18BLCirCOfRf89JjN+5ysqXC0emBObh+Iidvt5jjZoWZFTDc436KCzOe1I3I
         y7ujK5GVY8pizW1fWDhKlQZL+P8zHq+FK6mufItURFwfkjdMwpuU64qWmtxvmbwv3TqB
         usExuCuiFWoOXru746+WxGKyV+KdPiezgp76Gk+E6DxTMLWmnQFhdfXWcWVCgCy4rz38
         01cnuYNOQ+eU3sTRnzceDQv2IgWadU2fWJlpWq8aSFLbS6TW24rtEfP7Od+2uCgxEunn
         aQVtO34R2hRnlWndzKvK/uDVucXrylPCXGEc76X4XafschKZBgzTveuMOzXNVQctJWwR
         AvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLclwd9d+1jNPhnPiOUxrWwaeB2zLFgxQRjSahEcvdU=;
        b=ROlrzDBxYrqMhJz3vRvCVsLOdwYj2r7QXIj+UQE8fbqwddVYTi5d2P306LA4V8sYvt
         aQeX8DWqQxX1KJU7yCAv+sYRDQBRluZt3Yvgu8EEnyXMQwHIW9p4KR6V4kKDBoShtFy7
         lSK+pf7oo17PWI1HTCSjX7YhftiQfTH+bhhsdG79ow0y7bfewcTh3mY/0NWSJ03Fxx/P
         T6ETVuFlk0yN3ZU66zl3OJP3uddBSlkU5/RVmj4VK+XOVe/lICtPCsox5MAIo4nTl2nN
         vMgkzAzvr5HwPAMnXGLopkAKQb+Pe/OhTi5KxEkTeVqqfBLMT9vs/LhSCuyWC/Aw6d5a
         Qlkg==
X-Gm-Message-State: AFqh2kp+lyOLasgCzXIFa2OV2CnRKttpv6d0IW8eD0Jp/l9eTys5H2I5
        FwumPiABwPPPUfV0V6niKvbPwg==
X-Google-Smtp-Source: AMrXdXv8GHwwGF7z7dzRWBdzqVY1gRzdPQELpZUm8JxS3TpQ7bP+6wnr+V2C8sPN0VgRBvBTIuetZw==
X-Received: by 2002:ac2:43a4:0:b0:4cb:3a60:65cb with SMTP id t4-20020ac243a4000000b004cb3a6065cbmr7019378lfl.6.1673324487689;
        Mon, 09 Jan 2023 20:21:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d5-20020ac241c5000000b004b581ab4c77sm1946932lfi.78.2023.01.09.20.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 20:21:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sdm845: make DP node follow the schema
Date:   Tue, 10 Jan 2023 06:21:26 +0200
Message-Id: <20230110042126.702147-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the #clock-cells (probably a leftover from the times before the DP
PHY split)

Fixes: eaac4e55a6f4 ("arm64: dts: qcom: sdm845: add displayport node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: dropped the opp-table rename, handled by a patch by
Krzysztof.

---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8b403eea8e67..f4a552ab383e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4603,7 +4603,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.39.0

