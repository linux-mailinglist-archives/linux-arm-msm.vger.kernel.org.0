Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9B33430F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhCJQbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:31:45 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:18922 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhCJQbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:31:38 -0500
Date:   Wed, 10 Mar 2021 16:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1615393897;
        bh=1w9g8UPSYWUFEG4mnn/+/PQ6Nlg5fhcUX1MDEdc8uNo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=JWFVdP6byPQhBv9V0SWh5LDJ/pkV7guJ+yAF0jTD4NwhSr66TrlNhSx7zZugT1Hcp
         LoscplDCfEZt6OTtsiiB45hRlGA12TTHqSEnrxc24GAq8hLQAVUlxUUv0H4KEtN87M
         GhUafpyYneiQjr5J4vwlitF6yWrC/HGb4ScWX+0w=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8150: add iommus to qups
Message-ID: <20210310163024.393578-3-caleb@connolly.tech>
In-Reply-To: <20210310163024.393578-1-caleb@connolly.tech>
References: <20210310163024.393578-1-caleb@connolly.tech>
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

Hook up the SMMU for doing DMA over i2c. Some peripherals like
touchscreens easily exceed 32-bytes per transfer, causing errors and
lockups without this.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
Fixes i2c on the OnePlus 7, without this touching the screen with more
than 4 fingers causes the device to lock up and reboot.
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qco=
m/sm8150.dtsi
index 03e05d98daf2..543417d74216 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -583,6 +583,7 @@ qupv3_id_0: geniqup@8c0000 {
 =09=09=09clock-names =3D "m-ahb", "s-ahb";
 =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
 =09=09=09=09 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0xc3 0x0>;
 =09=09=09#address-cells =3D <2>;
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
@@ -595,6 +596,7 @@ qupv3_id_1: geniqup@ac0000 {
 =09=09=09clock-names =3D "m-ahb", "s-ahb";
 =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
 =09=09=09=09 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0x603 0x0>;
 =09=09=09#address-cells =3D <2>;
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
@@ -617,6 +619,7 @@ qupv3_id_2: geniqup@cc0000 {
 =09=09=09clock-names =3D "m-ahb", "s-ahb";
 =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
 =09=09=09=09 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0x7a3 0x0>;
 =09=09=09#address-cells =3D <2>;
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
--=20
2.29.2


