Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C823AD182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbhFRRyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:54:19 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:41706 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbhFRRyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:54:17 -0400
Date:   Fri, 18 Jun 2021 17:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1624038694;
        bh=RuYNzlY95bzbDf7R2SMZM/U4vzLJWo+O2oM4PbjonDY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=dJro9oT0atacZDwkNlzZ08mOeqmdaENvGUp5pxvfhrrYudKl+h8X2NcpCnnQO+Afb
         Uhr6n7oRPbBrRH7Szpc/BqXtQeQ8ACsY33bl/bue7FVnjHCj8uqk5keUvIAzf94mFv
         vSieEmE87TxGAYBodqgfuU0VQ6R8ttzM6hfB7aw0=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [RESEND PATCH v2 4/6] arm64: dts: qcom: sdm845-oneplus-common: add haptics
Message-ID: <20210618175041.323495-5-caleb@connolly.tech>
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

Enable the pmi8998 SPMI haptics driver and configure the play rate for the
hardware.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8f617f7b6d34..d4c857c1a73f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -423,6 +423,12 @@ pinconf {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+
+=09qcom,wave-play-rate-us =3D <4255>;
+};
+
 &qupv3_id_1 {
 =09status =3D "okay";
 };
--
2.31.1


