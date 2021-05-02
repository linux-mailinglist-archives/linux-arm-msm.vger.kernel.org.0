Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29DE3709A1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 03:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhEBBoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 May 2021 21:44:11 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:54276 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbhEBBoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 May 2021 21:44:10 -0400
Date:   Sun, 02 May 2021 01:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1619919798;
        bh=1twZjmk0G+fLgXmyNkb7Ue7rlpuc4SbKld7JI01l880=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=d9ixEQ8r4A9EW6+c68ryrPidt0XtsWGl8xbMqCK0iY/qtspbeJFU7APBqNkin5sM2
         OkpNi9bb/2pLQTjFY45Z0U56BcM93xqbR0H+SCHIqAnl02TymP5OPKh7OUDspI4zBk
         Lysis1ZfnbbSfBeQ0V+VdlbP/HEdcc3wgF7J57o0=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 4/4] dts: arm64: sdm845-oneplus-common: enable ipa
Message-ID: <20210502014146.85642-5-caleb@connolly.tech>
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

Enable the ipa node so that we can bring up mobile data.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 96c370b90550..a6ec1d0b4263 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -397,6 +397,12 @@ rmi4_f12: rmi4-f12@12 {
 =09};
 };
=20
+&ipa {
+=09status =3D "okay";
+
+=09memory-region =3D <&ipa_fw_mem>;
+};
+
 &mdss {
 =09status =3D "okay";
 };
--=20
2.30.2


