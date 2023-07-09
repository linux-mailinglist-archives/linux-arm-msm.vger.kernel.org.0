Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2163F74C0DE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 06:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjGIETg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 00:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjGIETd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 00:19:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F60E5C
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 21:19:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb41682472so4687151e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688876370; x=1691468370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtSrYaIq7E+bfiv9WFvstL0iH9rSn8rZct5gFh+ctJE=;
        b=Oi+ZYvxf8GX903TXcsqddTN2aEv9XgWgEYuAeZwyo3CINQZHOdFoRSZ9zDhjVruoBR
         0z90xv5U/ezAKYsy+rHpHqmkU18orLxkW8fO0yECZuF5Mw2xovMBQrWXF/c3GpXBf6PR
         QbLnEPsou5nZcPe9GpRXAOP1zsXy+g62SWGxQ1XCeyyrngbmx5oIfX+UcxJscF+AqLbU
         WbuBbbGuAz+pk2rka5Z8b6y0oC3g9DaRmj01jkqxusCkzp03dH2hQqlg2Gb3gkiKVf2s
         ieFK9CDrwFwsKERFnUHAlrd+E4YlXgT0/YZGX/eyNcxc/fUSzRoyqFsiDaPq8DIAm5go
         snDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688876370; x=1691468370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtSrYaIq7E+bfiv9WFvstL0iH9rSn8rZct5gFh+ctJE=;
        b=EEE6pk+uTbFz29G208V+IIvXKDFsd7Ko9XmVCfkAxKFNeuc2ArK7mj97NTHGRADdf2
         T6pKcYxyEK8YiHRZxWEPWnyfkQJe/fbwQwWH6o6V7mZodCDXYVB42Wc2K8LlUWSbEV60
         86Yx0Mg4NA4V5k2MIXcHVNSYn08HqCUj4DUxYdZNgJW1AKwm9V7krTsyHC0vTLEvrKT9
         mDNogcyhxg6uA0//XfhiqoADBeLpNP5MlL+fjUIibqoc91PZEwKT6o6ImFzVS6beOs61
         eapIdVqxc3nJ7vkX/Ft5PeXnJOvgKahpuKkVI+dicrcf+uRhEn6ioVKtVA7pVg0U1xO1
         xImQ==
X-Gm-Message-State: ABy/qLZh4Xzc7d0qlBsF47ZnqTF8eaHMsDEPUZPotzujtQDq4e6QqyJh
        2dGrtSUgkQSR+LCcOL2Z/lSUdQ==
X-Google-Smtp-Source: APBJJlGXNNcq7x7vL8+xDsC8wx/7kapblUcToH8V0brzlPbiAMw2LC6KWslkuQrRQ/SWEyq4fYFtCA==
X-Received: by 2002:a05:6512:3c9f:b0:4fb:829b:196e with SMTP id h31-20020a0565123c9f00b004fb829b196emr8752428lfv.2.1688876370646;
        Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/5] arm64: dts: qcom: qrb5165-rb5: enable displayport controller
Date:   Sun,  9 Jul 2023 07:19:25 +0300
Message-Id: <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the onboard displayport controller, connect it to QMP PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index a03f334a3d01..210c60025c32 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -656,6 +656,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
@@ -1436,3 +1445,7 @@ pm8150b_typec_sbu_out: endpoint {
 		};
 	};
 };
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.39.2

