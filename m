Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECC16739FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjASNWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjASNWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:22:48 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7060466EEA
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:41 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ss4so5545642ejb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5lFrlvCIHoFB2+uziz/1ge4iw3F4JUj7qisClGGYZE=;
        b=BZyQsTr5ZebjrhxCYNrobbQBYaHncBi9ZTdl09BDOy/d3/0CNMz5/ewJezf59QRx2M
         ijZ7Dv9RVwYCeUMqVQ0vIFeOoEF1lmaJ8QbGGPIT/Ab6jV+maIbW4msr6kY0a5wT6QHJ
         05zkUwIjrOah3leYeVOfngbpKLUhbd/F39Apuj825I0KnSPIn1D/FY1VWfiKzk7U/AlS
         OeY+kljH/TsTD/HmKje0dm7kDrXdiWgetHOy+AL/bD3Jgkw8Sdo+vWPuv/mCfJKhdQc2
         cit750FVs8sscTMuSmiIdKBsj5wfQVLhBpV3aHaKWaJspkiwqvFZzm4kbmC9IJqoaJKG
         POcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5lFrlvCIHoFB2+uziz/1ge4iw3F4JUj7qisClGGYZE=;
        b=6SlLRNPpbEB6Tsa0kdTXtPjCt3++sGZZDkjO5MbLPXu80Kf+StWDnHXRfZkFggdrhS
         T7jab4V5X7HdT+ant2tG89ITWRRYUQGd//PKnzIfWbUDAPDm7Ct6tzMsZknp2J4NmYVk
         i7yqWEYk1ZV3axnleTKjKz4LLPwA466QQ8GNJOS0BqhfaRYm2rTew89/uoHSnc7aSuo0
         1J4Ii6mtIY0Jw3CA5PKpie5SWaRdDh6VflH+PQvbw25uWoHMDn2yr/PjSNAsQgTJ+Kfk
         yYZkKHiwK7m73XVtdb7BjYHSlhgmgGCdW9Xi1bKRp2IhIY5wpSXRDnGOwjmI1chzsvmL
         VYcA==
X-Gm-Message-State: AFqh2koxeU1JJyg76G1z/4thiQyc4AIvComUXivoA3ayQzRrGesax0tM
        /jCaVsGd3Fp/LOl6xa7JN7c0lqZ4KzgEkEMF
X-Google-Smtp-Source: AMrXdXte67q8fD3ofpSt16K0O4y/76/t1vXA+qk0uMaBlzCGEPaAUZSL9km91H6eh7t0eNEap7FqfQ==
X-Received: by 2002:a17:906:60d0:b0:877:612e:516e with SMTP id f16-20020a17090660d000b00877612e516emr16289651ejk.61.1674134547974;
        Thu, 19 Jan 2023 05:22:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:22:27 -0800 (PST)
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
Subject: [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
Date:   Thu, 19 Jan 2023 15:22:19 +0200
Message-Id: <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 82c795beb8a1..b7e5b45e1c04 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -867,7 +867,7 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&hdmi_phy>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
-- 
2.39.0

