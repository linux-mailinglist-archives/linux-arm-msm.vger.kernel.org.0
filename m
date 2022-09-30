Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF7D5F1202
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbiI3SxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbiI3Sw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B005716DDE7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:55 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a8so8153566lff.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=e+txumJrTg3NbIgJt42pEv48jMVT9OfpHxOP8nlI4eI=;
        b=nOd2/Lv5zvyJjCozAncCLSIU9wKzp9s2Q7TT6PjF/+/xMwKcmWuNPO3CBuoUdGfWGM
         JyMhFgsPtNjjprg90Ye+ts9Uhr99BL+JaHrbo1A5vxSActHjKZRME8RAvaii/zeGHLxQ
         WmDB76b33IqkYw2zYnPZkRzK2iIwYWjkr3h4WyzIieNENrDHStfWKbBbelIW6hAbA4kD
         bMpsn8QfBte18PbGQpx33YKSDJKhxDoTo0CSBsVgZKEgTelV5N4Gv6XyMC5DaqJWiJ7/
         cCmEXmKpUPcATNZMt6YGEBqi1eaK6MfJ03k+V9guYP2uoAfqPG0MUuRo0nbid+gAXHiz
         2epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=e+txumJrTg3NbIgJt42pEv48jMVT9OfpHxOP8nlI4eI=;
        b=GeSNf/aTgsMYC1QPte5bepDECCjtnYvXtuF8rA2LEvS5LwznRZTpLO9WLXYDy62qXs
         tgacZjxAwL03TjBBKUyjXr2s+8ZA6GiC7Zh1nxeCpcyElNHRsdMoy++ztVk68p3mh+EQ
         gOaGwySw0cBuMToE2L5w5nWFZvpHHf518dnnMJKoIynDcDfPehUXGZnGhgojJz94gBlE
         gNQZoPtvgjs6HbASaDVmTGSw1YokZh12Rpm1Y1UFNKsdM3Rm5gx3JiQxIvKRV+DXnWHU
         HnYz6xQwto01JiNfBH3BqYRAwBiCJ9mtm45pdsy0XDEbQiYL1RQlZtJkwt+1p5oz4jxx
         We7w==
X-Gm-Message-State: ACrzQf20r4to+eRBFMqNKP14FWPpsDG2gmn9eNReYky7c81bXIcx/0HC
        ZeaREWETY0oPVIrr9/kfVvs1or7fNzfqng==
X-Google-Smtp-Source: AMsMyM5ErMjCI46XODlbU8m/rNJcueoVSZW1inTjXDRY0MRTmTLS5eFvc8bwvZ2ZmQsKMgq4Z2uKTw==
X-Received: by 2002:a05:6512:3502:b0:496:272:6258 with SMTP id h2-20020a056512350200b0049602726258mr3495629lfs.429.1664563973979;
        Fri, 30 Sep 2022 11:52:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 23/23] ARM: dts: qcom: msm8660: drop qcom, prefix from SSBI node name
Date:   Fri, 30 Sep 2022 21:52:36 +0300
Message-Id: <20220930185236.867655-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 60edb4bd5bbb..a5e02301178f 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -333,7 +333,7 @@ ebi2: external-bus@1a100000 {
 			status = "disabled";
 		};
 
-		qcom,ssbi@500000 {
+		ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.35.1

