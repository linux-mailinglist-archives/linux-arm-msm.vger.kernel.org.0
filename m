Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCF55EDF7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbiI1PAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbiI1PAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:00:13 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF65BF55
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:09 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a8so20752235lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LtgKFbu4xqrBfa/UrtX2sBDc1GeFUYPgf38w51iW7Nk=;
        b=Iv35MiLznn/D0K8UTRyRcqgGBwwGImiPAYgqYnb+ZzlkVb3BcS9NVIUNjDYi5nB3Pb
         WK9EjEtjpWBDVSFuE/lQibiPhn74MWHfsx62bmFd+wjS7yMLouMVm1+sZ0gZ5SGOhM0a
         WoOagqQkrTPRLTvdtTvcAUb9/tEKt1DP2taUN3ghOLOJhHTlV+2ZBvezH8TNRIwzBsEf
         B5JrOa4tRWAdAhi7FRmSnraHrrGcfBPqEuhCFwtU9z1gZaUUxvSBSQTP+8AyVuxms1lS
         hgMN6fhk3oQQAbMwQaLaCYk7HeyOevF4zQ4pwXgahvyGnDV/AwqKONdSNnXXsfU41kDJ
         icmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LtgKFbu4xqrBfa/UrtX2sBDc1GeFUYPgf38w51iW7Nk=;
        b=SKseVA4w74m0E2PSf9CN6353aCMsqfVaiI1Jmphe/t6OQ1xzydsoGlsa3FX59Mfzke
         /j6FUKecHgq5RZfzqoQ2wTTVGgbv3KVHrPcBq/gcNEQIdlyIalcIEe5GN3Qlom7P+Jy4
         BhSp7/O4dhyoe0BjQl4BTfa7+HGmqFtib3p+7HdR1yZZucGWPHxlxYRyfbwKYtZf9+lZ
         y/WgG4UnxmljfCFPFNDsFEBZX6FvIjbl4ksd0EpXRAurrnoxwM7/wMlIx+K0WW7MTgiB
         f7LFvoecqSVX0pp+hdJzDkQZcDiOhzzBHc1GQ8Qa3aAHfRg/L4TJyOA/kPIHdoH+e+7D
         I/QA==
X-Gm-Message-State: ACrzQf38d7hwG1DiZBuhWwkYsWIXrZIHftCbC0Z9xy3mt4UIGqIPGakz
        5BZ+d5TNbNKjxSOHCclwDlsWmw==
X-Google-Smtp-Source: AMsMyM4FREszGlL2+XHKulFWgB1264kaoph75qVa8jSSu2nL5puYWiGKb2yxb9iuFhfkdBFVhDkWoA==
X-Received: by 2002:ac2:57c9:0:b0:49c:3e64:de95 with SMTP id k9-20020ac257c9000000b0049c3e64de95mr13703590lfo.452.1664377207499;
        Wed, 28 Sep 2022 08:00:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
Date:   Wed, 28 Sep 2022 17:59:57 +0300
Message-Id: <20220928145958.376288-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
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

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 810a163ca14f..68ef494ca87a 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1054,6 +1054,10 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>,
+				 <&sleep_clk>;
 		};
 
 		rpm_msg_ram: memory@fc428000 {
-- 
2.35.1

