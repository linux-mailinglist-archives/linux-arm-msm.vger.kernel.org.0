Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B506564B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 19:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbiLZS6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 13:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiLZS6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 13:58:14 -0500
X-Greylist: delayed 165 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Dec 2022 10:58:12 PST
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1D2F19;
        Mon, 26 Dec 2022 10:58:12 -0800 (PST)
Received: from email.seznam.cz
        by smtpc-mxd-695c6957-dx4vg
        (smtpc-mxd-695c6957-dx4vg [2a02:598:64:8a00::1000:4c7])
        id 2872a1429e521e1928751f35;
        Mon, 26 Dec 2022 19:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1672080905;
        bh=sF418OTjmsBOk6rSBgdD2lu6q1BI77ExaEDILPUNV3s=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=iIeQEaiNLo2iocKNYq7sujwj2NxiKO5hGqrWh4AZ94BdSckFSUAXqbWPBnOnDMZkd
         20wXo20yA8J6LC5an4gTieBfUt86AmWBwK1+0dwxirIrSfPsHjylKb0M2hjiyqYcgQ
         5/TLDACkYAnB2lhIDTBoGAZm4qumj9HgJMww4KbdrUDND9jGhNsJg4yUpdkaz8tKz8
         ukhvfOKkDSgJj14JgabXvEnMvgNpa4k8xmREli4DOVnyJkxTMdNA6f/S07LIfI5+m3
         z4d0CIziomAKw4W9TXGHTM3xQ/D51ZUFe/oh06cp3VcheLqi1+eWlgse4SjP+u9KfE
         WQNM28TK/Cnyg==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
        by email-relay17.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
        Mon, 26 Dec 2022 19:55:04 +0100 (CET)  
From:   Petr Vorel <pevik@seznam.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem
Date:   Mon, 26 Dec 2022 19:54:39 +0100
Message-Id: <20221226185440.440968-3-pevik@seznam.cz>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221226185440.440968-1-pevik@seznam.cz>
References: <20221226185440.440968-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Petr Vorel <petr.vorel@gmail.com>

It's disabled on downstream [1] thus not shown on downstream dmesg.

Removing it fixes warnings on v6.1:

[    0.000000] OF: reserved mem: OVERLAP DETECTED!
[    0.000000] dfps_data_mem@3400000 (0x0000000003400000--0x0000000003401000) overlaps with memory@3400000 (0x0000000003400000--0x0000000004600000)

[1] https://android.googlesource.com/kernel/msm.git/+/android-7.0.0_r0.17/arch/arm64/boot/dts/lge/msm8992-bullhead.dtsi#137

Fixes: 976d321f32dc ("arm64: dts: qcom: msm8992: Make the DT an overlay on top of 8994")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 123ec67fb385..4bceb362a5c0 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -15,6 +15,9 @@
 /* cont_splash_mem has different memory mapping */
 /delete-node/ &cont_splash_mem;
 
+/* disabled on downstream, conflicts with cont_splash_mem */
+/delete-node/ &dfps_data_mem;
+
 / {
 	model = "LG Nexus 5X";
 	compatible = "lg,bullhead", "qcom,msm8992";
-- 
2.39.0

