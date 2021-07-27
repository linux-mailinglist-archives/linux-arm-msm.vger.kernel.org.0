Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA88B3D70AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 09:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhG0H5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 03:57:31 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:54786 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235629AbhG0H5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 03:57:31 -0400
Date:   Tue, 27 Jul 2021 07:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1627372647;
        bh=u3G2fqXXeibWLhXcsZ5/K1ahfoesTPk2yC7KcHsatq8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=P7aHOGJuRFe6GY24c87woPSnvd4dK2TzwKgBAkzI5DlnSn4HlQErw0S62KFUnjUdE
         Z/BLKqMOItmzsp4Z9nL1JMCi+7dkeGwmE3yd0o1gzFmlrwmECuWtXRKmHWY+p9Ni4l
         mqi5+RIw+6XCIkueSeUIe73P3R/ZrIOJnmznnwVQ=
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: Change power domain for mdp_smmu
Message-ID: <ziJMQ8GqduRgb0M8oiP0NHbAQYTdBU2gFjzyQxhmts@cp3-web-029.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MDP SMMU is powered by MMAGIC_MDSS_GDSC. Change power-domains to match.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 78c55ca10ba9..dd241dc7c124 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1998,7 +1998,7 @@ mdp_smmu: iommu@d00000 {
 =09=09=09=09 <&mmcc SMMU_MDP_AXI_CLK>;
 =09=09=09clock-names =3D "iface", "bus";
=20
-=09=09=09power-domains =3D <&mmcc MDSS_GDSC>;
+=09=09=09power-domains =3D <&mmcc MMAGIC_MDSS_GDSC>;
 =09=09};
=20
 =09=09venus_smmu: iommu@d40000 {
--=20
2.32.0


