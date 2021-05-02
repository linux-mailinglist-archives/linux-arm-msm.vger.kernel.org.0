Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EE7370997
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 03:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhEBBnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 May 2021 21:43:45 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:64143 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhEBBnp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 May 2021 21:43:45 -0400
Date:   Sun, 02 May 2021 01:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1619919772;
        bh=CvSw3JV9plNu6EjH386w84c2cwf+Awbm2otRgqsgPUQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=dN9RVqZmJBfWMbwKnGI8IWWQSBc7pf0hJTyjnWhFx2GuAZQ6vg+y9J/+NMXvX8nIa
         KmAUg79QR0PnzaZEkbLFDl7wzpiQHGP2OUIGddVT0rZfc/5sxc3g56UXbe4LnJ6CY6
         jd2Ab0D3Wra74E+jua9Q6ZHiQjof45bqyG3f9fIY=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/4] arm64: dts: qcom: sdm845-oneplus-common: remove panel reset gpio
Message-ID: <20210502014146.85642-2-caleb@connolly.tech>
In-Reply-To: <20210502014146.85642-1-caleb@connolly.tech>
References: <20210502014146.85642-1-caleb@connolly.tech>
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

Resetting the panel causes issues on fajita, it is also completely
unnecessary for normal use so lets just not bother.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8f617f7b6d34..8f3f5c687b4a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -314,8 +314,6 @@ display_panel: panel@0 {
=20
 =09=09vddio-supply =3D <&vreg_l14a_1p88>;
=20
-=09=09reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_LOW>;
-
 =09=09pinctrl-names =3D "default";
 =09=09pinctrl-0 =3D <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
=20
--=20
2.30.2


