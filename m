Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EE552B5C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 11:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbiERJT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 05:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbiERJTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 05:19:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56C81498ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 02:19:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id p4so1127808lfg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dj1d7TBWTM4EvNYi+u8WCo4dU6gJLS3xEb0YOid6KaU=;
        b=soImDP324wce3hTglw183pIBiP9wnQZmmtlD+2Vmx0bmMLCBz6Vn1aSdJU7SUZjk8Y
         kFVtKHgl3iohmeDgSpP2dtt9XbSF/rEgL+o6gjNeJjl7DW9k3z0al3H9aspKor5sm9tA
         ghUCu0rUFRMfqowvhmsoxPURAhFANlEZzxMpBxI4PBJ0PtA6/bYN0GRo2Z/MqecjLpTt
         s0N7VRtB9pJUdnYrzIgqRJ0P/y+borZTAhlYJl396LzYg2jxE4DcswaXlgRioUxZXuPq
         Fl0SozBJq1g73iwRn8QlziN2FYev4G5MN9FVchd1ZHc9PPMTdkeiv1poDU6U9rTRUAGS
         pEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dj1d7TBWTM4EvNYi+u8WCo4dU6gJLS3xEb0YOid6KaU=;
        b=eZ7mVVSLUtz/vEb9F8Mcnk2TxSIVYLoyAdD1UowbdsNDo59cDax0O4v1klWMTehDBy
         AtI77uWU/ZeV0ROxGmN0XtypR98a+PKEersSP5jcsAjpqWw0sWlvmkTGxhYX8LKLD8nP
         p1/UDeHWR2evTNi+a53opr0oiPdehOtDZ407cJ8JGQXfdDpLewztu4jvkCrD0ex7SzWb
         DUiTz87pYj0bsiUdVGs0HoSVk19MU5lBzUH0JBquNIS7OLxR/GE8xAL9DKMMq/CxIaJi
         ljOTcN4g4FZZTqD47solcGeJhNeRZoeUv+pV3MK/gw2mUoA+gQls8LZp08TJsSvablsh
         3r4Q==
X-Gm-Message-State: AOAM533vzKpMoN/JLQWpOSnps/EXv1Y2ZE0RuSfRpRttfKInUQtiQT/V
        q0cfEeMUYFYV/mUtBqhU4GLxMA==
X-Google-Smtp-Source: ABdhPJyiTh1XSjwzviHtvJKWZCIecFgcPt5HA1R8uxTglidoI72iue5gqx++Zns1t/BbqfKllD7oyg==
X-Received: by 2002:a05:6512:2207:b0:477:b7f3:dbbe with SMTP id h7-20020a056512220700b00477b7f3dbbemr1749533lfu.404.1652865592260;
        Wed, 18 May 2022 02:19:52 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id y17-20020a197511000000b0047255d21188sm146728lfe.183.2022.05.18.02.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 02:19:51 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: Disable camcc by default
Date:   Wed, 18 May 2022 12:19:43 +0300
Message-Id: <20220518091943.734478-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

At the moment there are no changes in SM8250 board files, which require
camera clock controller to run, whenever it is needed for a particular
board, the status of camcc device node will be changed in a board file.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 26afaa4f98fe..165b08c707d3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3395,6 +3395,7 @@ camcc: clock-controller@ad00000 {
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
 			power-domains = <&rpmhpd SM8250_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
+			status = "disabled";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.33.0

