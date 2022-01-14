Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3521C48E1A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 01:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238491AbiANAnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 19:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbiANAno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 19:43:44 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA60C06173F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 16:43:44 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id ie23-20020a17090b401700b001b38a5318easo12672015pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 16:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LT+Vm4rzQkk47lugUpAeU8Aw0wC+LkjKsmIBgeDejg=;
        b=M52J4hq6RxIIbN21Vg65/n9UCDqSBjaQ4fbrXsn+GQPgCvQX5VTMUNl7+jfFgUnm/X
         y4458WxGx4CXxklfB7lepyCwO85RmpbtNNQZ9LCjF/IHoKKqTk5DH0JdE4U/9J2jnx3I
         +AzTvjl4VxEKiyGG2L4FMLUp1RD4AUabeML2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LT+Vm4rzQkk47lugUpAeU8Aw0wC+LkjKsmIBgeDejg=;
        b=LM/BJaVZIihVhQtyqoIwGekVER5vZ3aY9E1S2NWup5AmF2/l6l8L0dFFTQgEXndQVv
         tYN9yB8cRioKKLyby6skjuhsMx01pg7mJ0gwh32ctq0kYXOG/o1qg+SVSHx8MK96qvLk
         8IqWyvAI8uMmYB3HHt5paxR7zlr1UZMJrQZNhzBFi9FuJrDIIUeAvJD0uGwrAv2fH4kN
         D6LeoJxaiEWvJ+x0bcXGPKMb2MpXiLJ5Ps+fMwGPaVn9/K62ar1+1T5oOTXjTu+vF+yZ
         SYxFiSezy7p2HZUmnzHFtVTY3C03gJ1Y3cOr7P5T6fi40L1FIcLEBPFsmHi3Y67NqhzC
         Qtpg==
X-Gm-Message-State: AOAM533ZGtbG3/e8IedFGIkZ2jmuwKCtm2LF691CK8YfUX99eFbiNn9X
        08qfCoU/p6Kwct+Y368lP+9yzQ==
X-Google-Smtp-Source: ABdhPJxgxNnaoZZRzk4weku2Sp6EHxGfy7/c7stTjDEkbQ9+wP4d2oL6pe1uoG7zyeZRZaFCNnuLPA==
X-Received: by 2002:a17:902:d3c1:b0:14a:8d01:9d30 with SMTP id w1-20020a170902d3c100b0014a8d019d30mr1979443plb.56.1642121023532;
        Thu, 13 Jan 2022 16:43:43 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:cf6e:9fa9:a398:4c9])
        by smtp.gmail.com with ESMTPSA id j4sm4061498pfj.217.2022.01.13.16.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 16:43:43 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, mka@chromium.org, swboyd@chromium.org,
        pmaliset@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: qcom: sc7280: Fix gmu unit address
Date:   Thu, 13 Jan 2022 16:43:00 -0800
Message-Id: <20220113164233.1.I19f60014e9be4b9dda4d66b5d56ef3d9600b6e10@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114004303.905808-1-dianders@chromium.org>
References: <20220114004303.905808-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When processing sc7280 device trees, I can see:

  Warning (simple_bus_reg): /soc@0/gmu@3d69000:
    simple-bus unit address format error, expected "3d6a000"

There's a clear typo in the node name. Fix it.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 937c2e0e93eb..eab7a8505053 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1790,7 +1790,7 @@ opp-550000000 {
 			};
 		};
 
-		gmu: gmu@3d69000 {
+		gmu: gmu@3d6a000 {
 			compatible="qcom,adreno-gmu-635.0", "qcom,adreno-gmu";
 			reg = <0 0x03d6a000 0 0x34000>,
 				<0 0x3de0000 0 0x10000>,
-- 
2.34.1.703.g22d0c6ccf7-goog

