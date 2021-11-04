Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7553544520E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 12:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhKDLSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 07:18:09 -0400
Received: from mail-4318.protonmail.ch ([185.70.43.18]:19975 "EHLO
        mail-4318.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDLSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 07:18:08 -0400
Date:   Thu, 04 Nov 2021 11:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1636024529;
        bh=dxv8tLH49ZU8FUAl83ntsTkN/OPH8j/yTkPqyb84NMA=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=wqkG6uoka5TSr/C9hMgAThs5uYHqBZPcIKiyOeG6edIS0ntpI4tR85bjBPf5mBw39
         w2OzT0jr9LG07kylB9L7XYCCzvXhWLvFKKPi9Ov9Az11SV8F/mUobnLhzOXgx8iuzF
         i4KSjpnRdS38NHWvLo7HFvnFr3EJ1FmlW9WMBfKs=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996-xiaomi-common: Change TUSB320 to TUSB320L
Message-ID: <20211104111454.105875-1-y.oudjana@protonmail.com>
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

This platform actually doesn't have TUSB320, but rather TUSB320L.
The TUSB320 compatible string was used due to lack of support for
TUSB320L, and it was close enough to detect cable plug-in and
direction, but it was limited to upstream facing port mode only.
Now that support for TUSB320L is added[1], change node name and
compatible to match and allow it to be properly reset and have
its mode set to dual-role port.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Dce0320bd3872038569be360870e2d5251b975692
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 01e573f0dfbf..7a9fcbe9bb31 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -207,8 +207,8 @@ &blsp2_i2c3 {
 =09status =3D "okay";
 =09label =3D "TYPEC_I2C";
=20
-=09typec: tusb320@47 {
-=09=09compatible =3D "ti,tusb320";
+=09typec: tusb320l@47 {
+=09=09compatible =3D "ti,tusb320l";
 =09=09reg =3D <0x47>;
 =09=09interrupt-parent =3D <&tlmm>;
 =09=09interrupts =3D <63 IRQ_TYPE_EDGE_RISING>;
--=20
2.33.1


