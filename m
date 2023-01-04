Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF09D65D1EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 12:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239170AbjADL4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 06:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239080AbjADLzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 06:55:37 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0861D0EF;
        Wed,  4 Jan 2023 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672833332;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=8WLrAYNpmhMGRLh2je3IT6bWzoPFE2gPgJkXcZhdPjc=;
    b=dG9WXnz6ebOOG/hCfkX/fTo3rjs7YATiiPMbM/JZFzpNmH6ou+boWsPqruyaG6rY03
    9pk8T4T8EJa8RUzjuxBKgVR+AfBo8coAo71/itBr5/kYwghyKyyW2jMHfRuW2i+e1Izc
    6wsixCsryp8GxxSXPhmqksifZQAXcAImFnk88HRz80+CkMhbt0Km13iCbJ29oPL69NgE
    MTYCE5ytF2bmcElPy07pKZZzC5WqB2eqQ0eLxbv3JmXEjbZ9J2r5EONfj1wwPsKyasl3
    ON91Tp3I15Dy5ao+TndF93Q79glvHRpiqFFmD0bPOKOQQwFpUTkwZUQ/Iagx4SpnPw6m
    Dv9g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo02
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z04BtVkzM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 4 Jan 2023 12:55:31 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/4] soc: qcom: socinfo: Add a bunch of older SoCs
Date:   Wed,  4 Jan 2023 12:53:48 +0100
Message-Id: <20230104115348.25046-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104115348.25046-1-stephan@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the new SoCs added in qcom,ids.h to the soc_id array so they show
up correctly in the socinfo sysfs.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/socinfo.c | 74 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 7258527816b0..3b970a80f3aa 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -221,36 +221,62 @@ struct soc_id {
 };
 
 static const struct soc_id soc_id[] = {
+	{ qcom_board_id(MSM8260) },
+	{ qcom_board_id(MSM8660) },
+	{ qcom_board_id(APQ8060) },
 	{ qcom_board_id(MSM8960) },
 	{ qcom_board_id(APQ8064) },
+	{ qcom_board_id(MSM8930) },
+	{ qcom_board_id(MSM8630) },
+	{ qcom_board_id(MSM8230) },
+	{ qcom_board_id(APQ8030) },
+	{ qcom_board_id(MSM8627) },
+	{ qcom_board_id(MSM8227) },
 	{ qcom_board_id(MSM8660A) },
 	{ qcom_board_id(MSM8260A) },
 	{ qcom_board_id(APQ8060A) },
 	{ qcom_board_id(MSM8974) },
+	{ qcom_board_id(MSM8225) },
+	{ qcom_board_id(MSM8625) },
 	{ qcom_board_id(MPQ8064) },
 	{ qcom_board_id(MSM8960AB) },
 	{ qcom_board_id(APQ8060AB) },
 	{ qcom_board_id(MSM8260AB) },
 	{ qcom_board_id(MSM8660AB) },
+	{ qcom_board_id(MSM8930AA) },
+	{ qcom_board_id(MSM8630AA) },
+	{ qcom_board_id(MSM8230AA) },
 	{ qcom_board_id(MSM8626) },
 	{ qcom_board_id(MSM8610) },
 	{ qcom_board_id(APQ8064AB) },
+	{ qcom_board_id(MSM8930AB) },
+	{ qcom_board_id(MSM8630AB) },
+	{ qcom_board_id(MSM8230AB) },
+	{ qcom_board_id(APQ8030AB) },
 	{ qcom_board_id(MSM8226) },
 	{ qcom_board_id(MSM8526) },
+	{ qcom_board_id(APQ8030AA) },
 	{ qcom_board_id(MSM8110) },
 	{ qcom_board_id(MSM8210) },
 	{ qcom_board_id(MSM8810) },
 	{ qcom_board_id(MSM8212) },
 	{ qcom_board_id(MSM8612) },
 	{ qcom_board_id(MSM8112) },
+	{ qcom_board_id(MSM8125) },
 	{ qcom_board_id(MSM8225Q) },
 	{ qcom_board_id(MSM8625Q) },
 	{ qcom_board_id(MSM8125Q) },
 	{ qcom_board_id(APQ8064AA) },
 	{ qcom_board_id(APQ8084) },
+	{ qcom_board_id(MSM8130) },
+	{ qcom_board_id(MSM8130AA) },
+	{ qcom_board_id(MSM8130AB) },
+	{ qcom_board_id(MSM8627AA) },
+	{ qcom_board_id(MSM8227AA) },
 	{ qcom_board_id(APQ8074) },
 	{ qcom_board_id(MSM8274) },
 	{ qcom_board_id(MSM8674) },
+	{ qcom_board_id(MDM9635) },
 	{ qcom_board_id_named(MSM8974PRO_AC, "MSM8974PRO-AC") },
 	{ qcom_board_id(MSM8126) },
 	{ qcom_board_id(APQ8026) },
@@ -278,34 +304,72 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(MSM8510) },
 	{ qcom_board_id(MSM8512) },
 	{ qcom_board_id(MSM8936) },
+	{ qcom_board_id(MDM9640) },
 	{ qcom_board_id(MSM8939) },
 	{ qcom_board_id(APQ8036) },
 	{ qcom_board_id(APQ8039) },
+	{ qcom_board_id(MSM8236) },
+	{ qcom_board_id(MSM8636) },
+	{ qcom_board_id(MSM8909) },
 	{ qcom_board_id(MSM8996) },
 	{ qcom_board_id(APQ8016) },
 	{ qcom_board_id(MSM8216) },
 	{ qcom_board_id(MSM8116) },
 	{ qcom_board_id(MSM8616) },
 	{ qcom_board_id(MSM8992) },
+	{ qcom_board_id(APQ8092) },
 	{ qcom_board_id(APQ8094) },
+	{ qcom_board_id(MSM8209) },
+	{ qcom_board_id(MSM8208) },
+	{ qcom_board_id(MDM9209) },
+	{ qcom_board_id(MDM9309) },
+	{ qcom_board_id(MDM9609) },
+	{ qcom_board_id(MSM8239) },
+	{ qcom_board_id(MSM8952) },
+	{ qcom_board_id(APQ8009) },
 	{ qcom_board_id(MSM8956) },
+	{ qcom_board_id(MSM8929) },
+	{ qcom_board_id(MSM8629) },
+	{ qcom_board_id(MSM8229) },
+	{ qcom_board_id(APQ8029) },
+	{ qcom_board_id(APQ8056) },
+	{ qcom_board_id(MSM8609) },
+	{ qcom_board_id(APQ8076) },
 	{ qcom_board_id(MSM8976) },
+	{ qcom_board_id(MDM9650) },
+	{ qcom_board_id(MDM9655) },
+	{ qcom_board_id(MDM9250) },
+	{ qcom_board_id(MDM9255) },
+	{ qcom_board_id(MDM9350) },
+	{ qcom_board_id(APQ8052) },
 	{ qcom_board_id(MDM9607) },
 	{ qcom_board_id(APQ8096) },
 	{ qcom_board_id(MSM8998) },
 	{ qcom_board_id(MSM8953) },
+	{ qcom_board_id(MSM8937) },
+	{ qcom_board_id(APQ8037) },
 	{ qcom_board_id(MDM8207) },
 	{ qcom_board_id(MDM9207) },
 	{ qcom_board_id(MDM9307) },
 	{ qcom_board_id(MDM9628) },
+	{ qcom_board_id(MSM8909W) },
+	{ qcom_board_id(APQ8009W) },
+	{ qcom_board_id(MSM8996L) },
+	{ qcom_board_id(MSM8917) },
 	{ qcom_board_id(APQ8053) },
 	{ qcom_board_id(MSM8996SG) },
+	{ qcom_board_id(APQ8017) },
+	{ qcom_board_id(MSM8217) },
+	{ qcom_board_id(MSM8617) },
 	{ qcom_board_id(MSM8996AU) },
 	{ qcom_board_id(APQ8096AU) },
 	{ qcom_board_id(APQ8096SG) },
+	{ qcom_board_id(MSM8940) },
+	{ qcom_board_id(SDX201) },
 	{ qcom_board_id(SDM660) },
 	{ qcom_board_id(SDM630) },
 	{ qcom_board_id(APQ8098) },
+	{ qcom_board_id(MSM8920) },
 	{ qcom_board_id(SDM845) },
 	{ qcom_board_id(MDM9206) },
 	{ qcom_board_id(IPQ8074) },
@@ -313,6 +377,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SDM658) },
 	{ qcom_board_id(SDA658) },
 	{ qcom_board_id(SDA630) },
+	{ qcom_board_id(MSM8905) },
+	{ qcom_board_id(SDX202) },
 	{ qcom_board_id(SDM450) },
 	{ qcom_board_id(SM8150) },
 	{ qcom_board_id(SDA845) },
@@ -324,10 +390,15 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SDM632) },
 	{ qcom_board_id(SDA632) },
 	{ qcom_board_id(SDA450) },
+	{ qcom_board_id(SDM439) },
+	{ qcom_board_id(SDM429) },
 	{ qcom_board_id(SM8250) },
 	{ qcom_board_id(SA8155) },
+	{ qcom_board_id(SDA439) },
+	{ qcom_board_id(SDA429) },
 	{ qcom_board_id(IPQ8070) },
 	{ qcom_board_id(IPQ8071) },
+	{ qcom_board_id(QM215) },
 	{ qcom_board_id(IPQ8072A) },
 	{ qcom_board_id(IPQ8074A) },
 	{ qcom_board_id(IPQ8076A) },
@@ -337,11 +408,14 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8071A) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
+	{ qcom_board_id(SDM429W) },
 	{ qcom_board_id(SM4250) },
 	{ qcom_board_id(IPQ6000) },
 	{ qcom_board_id(IPQ6010) },
 	{ qcom_board_id(SC7180) },
 	{ qcom_board_id(SM6350) },
+	{ qcom_board_id(QCM2150) },
+	{ qcom_board_id(SDA429W) },
 	{ qcom_board_id(SM8350) },
 	{ qcom_board_id(SM6115) },
 	{ qcom_board_id(SC8280XP) },
-- 
2.39.0

