Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501D543504F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 18:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhJTQjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 12:39:23 -0400
Received: from mail-4018.proton.ch ([185.70.40.18]:57639 "EHLO
        mail-4018.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhJTQjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 12:39:21 -0400
Date:   Wed, 20 Oct 2021 16:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1634747824;
        bh=d2roxbyt8b4yNeziE8Odnw0Moch2ElML4lV+Hjkivkk=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=TuwzoSevEYLt926RQ3REVkJDqQC8gn20aPBgTIhE0kjTtclmtdnDetQlkGXhlh6F6
         rEjkZni+qo86r2ISypda9IviYklar69e1iYzy+wnACAFZDbNf1lX8qS4muIvmp/Xyk
         FCuFAOIwuaaQB3aU9Esz1aKa8DmnLfJfRqQPn+WU=
To:     Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: enable second wifi channel
Message-ID: <20211020163557.291803-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like the c630, the OnePlus 6 is also capable of using both antenna
channels for 2.4 and 5ghz wifi, however unlike the c630 only the first
channel is used for bluetooth.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index d4355522374a..8bf2430a3af7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -248,6 +248,12 @@ vreg_l20a_2p95: ldo20 {
 =09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
 =09=09};

+=09=09vreg_l23a_3p3: ldo23 {
+=09=09=09regulator-min-microvolt =3D <3300000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
 =09=09vdda_qusb_hs0_3p1:
 =09=09vreg_l24a_3p075: ldo24 {
 =09=09=09regulator-min-microvolt =3D <3088000>;
@@ -647,6 +653,7 @@ &wifi {
 =09vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
 =09vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
 =09vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
+=09vdd-3.3-ch1-supply =3D <&vreg_l23a_3p3>;

 =09qcom,snoc-host-cap-8bit-quirk;
 };
--
2.33.1


