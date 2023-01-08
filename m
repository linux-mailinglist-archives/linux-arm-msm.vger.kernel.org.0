Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A696618E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 20:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236143AbjAHTyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 14:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbjAHTyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 14:54:21 -0500
Received: from amity.mint.lgbt (vmi888983.contaboserver.net [149.102.157.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2BDE0F6
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 11:54:19 -0800 (PST)
Received: from amity.mint.lgbt (mx.mint.lgbt [127.0.0.1])
        by amity.mint.lgbt (Postfix) with ESMTP id 4NqnpL2dxqz1S5FV
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 14:54:18 -0500 (EST)
Authentication-Results: amity.mint.lgbt (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mint.lgbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mint.lgbt; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :x-mailer:message-id:date:subject:to:from; s=dkim; t=1673207657;
         x=1674071658; bh=ONLsUPqi6gcoDHsCIKRtVdHKDiLgbanaPpLa4/u4aME=; b=
        1blMf1xNLxPBSarlA5teNdJONQv+cVsJdSDCjZqE9fLr22UNCGxb58mhO4wdSjVf
        VaZmjc2hKwLrSKRIxBgTbvFUgJathIL1SCDp+uTA100JBeYGS76VrpDo0ee9wKU3
        BaOKWPwSlfrdl2jHCClGCVRUZW6rurdJmLxZBnRfzdDRPJCM/WyLVF4188hns3/A
        hvFOorg4HWTCgU0ui5Mu5nZWZMSzj/7CtHJNWV3FVaI/kLuonkSfGyYnUcJRb/Sx
        PER81CkWCfAg7KqvptIhsHX6057ZxgfEcLk2CUWo6ThgpQfUYAT+h+EbO4z6b/j4
        0GLFbukCGVfuXrYupF/KzA==
X-Virus-Scanned: amavisd-new at amity.mint.lgbt
Received: from amity.mint.lgbt ([127.0.0.1])
        by amity.mint.lgbt (amity.mint.lgbt [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id oLRD4lPbPsME for <linux-arm-msm@vger.kernel.org>;
        Sun,  8 Jan 2023 14:54:17 -0500 (EST)
Received: from dorothy.. (unknown [186.105.5.197])
        by amity.mint.lgbt (Postfix) with ESMTPSA id 4Nqnp93FSJz1S5FK;
        Sun,  8 Jan 2023 14:54:09 -0500 (EST)
From:   Lux Aliaga <they@mint.lgbt>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, keescook@chromium.org,
        tony.luck@intel.com, gpiccoli@igalia.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, Lux Aliaga <they@mint.lgbt>
Subject: [PATCH v6 3/6] phy: qcom-qmp: Add SM6125 UFS PHY support
Date:   Sun,  8 Jan 2023 16:53:33 -0300
Message-Id: <20230108195336.388349-4-they@mint.lgbt>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108195336.388349-1-they@mint.lgbt>
References: <20230108195336.388349-1-they@mint.lgbt>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM6125 UFS PHY is compatible with the one from SM6115. Add a
compatible for it and modify the config from SM6115 to make them
compatible with the SC8280XP binding

Signed-off-by: Lux Aliaga <they@mint.lgbt>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualco=
mm/phy-qcom-qmp-ufs.c
index 318eea35b972..f33c84578940 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -693,6 +693,8 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg =3D=
 {
 static const struct qmp_phy_cfg sm6115_ufsphy_cfg =3D {
 	.lanes			=3D 1,
=20
+	.offsets		=3D &qmp_ufs_offsets_v5,
+
 	.serdes_tbl		=3D sm6115_ufsphy_serdes_tbl,
 	.serdes_tbl_num		=3D ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
 	.tx_tbl			=3D sm6115_ufsphy_tx_tbl,
@@ -1172,6 +1174,9 @@ static const struct of_device_id qmp_ufs_of_match_t=
able[] =3D {
 	}, {
 		.compatible =3D "qcom,sm6115-qmp-ufs-phy",
 		.data =3D &sm6115_ufsphy_cfg,
+	}, {
+		.compatible =3D "qcom,sm6125-qmp-ufs-phy",
+		.data =3D &sm6115_ufsphy_cfg,
 	}, {
 		.compatible =3D "qcom,sm6350-qmp-ufs-phy",
 		.data =3D &sdm845_ufsphy_cfg,
--=20
2.39.0

