Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3AC74C83D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbiCAGPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbiCAGPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CC666203
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:08 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d23so25087497lfv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBWXG+W6ooyrDrEi/Xb8wIpn2PIv0F+2p0J9FTEIZbQ=;
        b=zVlp4+9HjJTRRCjNu56Mb456mXhlh9E2tMIHf3IqFvWQDzf/WYWO4xTypGDygP3Vjy
         My26GtyyYtu0BhhnJrPOgJMDJ6CCWnTuN3C6A2plE9UYhQUlrh5+qEho0s0248qlecjz
         b79pcsUiecelwzM9zKkI9vCwat0keeXF/nGt8K09NqDoVdZXmUtQWNiQgyNaFmgBQ2WR
         2LIStna4Sefia+6ya5xSdg2mTsoobgJZ3EuE0UW2BaZrhy1pmtjYY7iCHUfMU77J6VCx
         gMdXkf3v3Z4keK88IYYYA0qqawd9UoC93oi9yoODU8OC4JabFS+Rzkh0s4QtdxqHpngt
         uSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBWXG+W6ooyrDrEi/Xb8wIpn2PIv0F+2p0J9FTEIZbQ=;
        b=7I5dDMkgXIfEFwUVjh8Wi568c2MZPgfO8qcOV3mv05g5lfqsk26UUhwNpnp1J+SP+R
         IjxXAkHs91TutSKzWIr80BjSx82KgT26G0MftMuIgskgKZW5oc8XqPAQNosa7fq2LyDj
         HOBgzTv++eLMmQotFAKOBq5mnJ9b8p5SPHBbehOoXt7KHmdhpc1o394hNl2+IzkJ3kIa
         LcmvRJuXygk/w6e1O2E4fp9KqP5A/WVlwY5xTaF2nHcs7dfHTFRDgYaKw1q78ubuzSUL
         hfu9pF0+e4Xt/DSb5175TTC6Rx6D+PXnF2E4uTFKUSi187veAX2jwKgvETUBuII3DqWS
         /jeQ==
X-Gm-Message-State: AOAM5323Bk4hwtW8awfGazLSFuNBW0lcr+6gRxrxYy0LHkvDbc8RIsqv
        bG4VStsgpsyjKAGpFgJS90q6ZAmexje1dQ==
X-Google-Smtp-Source: ABdhPJx8D5Nrax7TpJUd1Lpq5KxF46VZze7Y7Bfv38VsT3XemKVqn+MYRAKO0X+MKAoWxulYV2ufTQ==
X-Received: by 2002:ac2:5dd2:0:b0:443:5940:e418 with SMTP id x18-20020ac25dd2000000b004435940e418mr14620820lfq.245.1646115306733;
        Mon, 28 Feb 2022 22:15:06 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: qcom: sm8450-qrd: enable PCIe0 host
Date:   Tue,  1 Mar 2022 09:14:59 +0300
Message-Id: <20220301061500.2110569-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
References: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 host on SM8450 QRD device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 7b6324969a4e..d33e86a375c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -342,6 +342,10 @@ vreg_l6e_1p2: ldo6 {
 	};
 };
 
+&pcie0 {
+	status = "okay";
+};
+
 &pcie0_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
-- 
2.34.1

