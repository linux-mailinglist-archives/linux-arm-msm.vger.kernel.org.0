Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A5D6739EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjASNWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjASNW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:29 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAB44ABCB
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:27 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id b4so2908789edf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBRhMIWBBhe/TliUQy+AZIlgOFFoxbwEkFQWDIwkk3Y=;
        b=gQqyHL5f878YFECkQbVlVt1i2oW5o6NrODjENuIskCss3t4CBgygaVJvMwyvD/opNY
         ua7Yuu8+ofN7SLwaqlAzq5549NtQe2Nb6mUudBeMPDhZd10UqxBjFfj/+pCs7/QxxgEM
         6Ol2dhcex9eW1YDsllnAlCBqthlZz2OEYJqRtBZlgPVgI6kSFIiA7TA1Ts5VM8OZwmmQ
         ZeORDMlRED83SQ7oC6zNR+We8Uf2jOTNkqg+R+3QbI7zAvpVREHhrjNcnhZ/108GE65M
         Qwv6hbc0M9LOlWm/3AK3TYM8ySJ82qIGNMReSU0chyzDHzWhogkw+XZuIKktXwE6zHXG
         liaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBRhMIWBBhe/TliUQy+AZIlgOFFoxbwEkFQWDIwkk3Y=;
        b=ITtSaeXYX2XXiMkLajqYkmK54JDlLT0/L+y0vF4s/orszRAobcg13rl/GcN8fcYnXK
         P5U9FYpdh9LGup7rAmlDepnro7Rn0o5QO2etTNTfrOt4vMuX5YtnUmlZqOt6Vs0B4EzS
         xJvMYGJ2sN912bpohDj0VwihEC+lvcoJh5+pq/vNcne4/YCumfDQewK+2xzFpT52WDzH
         sdDRy1lOkcK1j+LO2xGPlPdTFA7tx957q918sw7eEpbLWVZUM0+3lInqh5TnROUIJEUq
         XhCryNEDaFr2v1Lz5PKjPEy34oUkAQdtLPen1bgZWRDiGuZqn5npPLX4Tp4zl+/5xBdY
         xrVA==
X-Gm-Message-State: AFqh2ko7VljqMoWfoXAgn3fnPQcMf+kg8rpBuJqaEjbWlPAtPfjxwlAX
        8bvlzmqGybldJnLXjz/81Z2gHQ==
X-Google-Smtp-Source: AMrXdXsHXoST2nFKVY17xlSarrqKjeFW7wy8a6//enD4WSTrPdCI41yAuePsNFxPf0CEckaaD83Arg==
X-Received: by 2002:aa7:c3ca:0:b0:499:b674:5a1f with SMTP id l10-20020aa7c3ca000000b00499b6745a1fmr22148197edr.28.1674134546861;
        Thu, 19 Jan 2023 05:22:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/6] ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
Date:   Thu, 19 Jan 2023 15:22:18 +0200
Message-Id: <20230119132219.2479775-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 95705703fe8f..82c795beb8a1 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1489,6 +1489,7 @@ hdmi_phy: phy@4a00400 {
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
 			clock-names = "slave_iface";
 			#phy-cells = <0>;
+			#clock-cells = <0>;
 
 			status = "disabled";
 		};
-- 
2.39.0

