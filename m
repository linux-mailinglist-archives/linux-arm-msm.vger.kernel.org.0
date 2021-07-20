Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250CF3CFE0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 17:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239792AbhGTPEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:04:52 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:24685 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239787AbhGTOxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 10:53:25 -0400
Date:   Tue, 20 Jul 2021 15:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1626795238;
        bh=RnMIEFW0cr7ror7ncy8lldAb81ApdL3lOqR9uUsxN48=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=D7bktiGRDFoTLhsP5GS5WcgNCpIZCa1yv1xYjTKuqheYL9sBaGkJoztqGM+YxuEUV
         KTGSyUUjqZDZjuysBdl94a7fKGesku8BZO6miND7p4o55m6eYRYXFXdltu9R0Ovw4e
         Syg/Q7PNoqc4eJ3ObFWPLVyNs94PZA+hjAO1iF8Y=
To:     Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 5/5] arm64: dts: qcom: sdm845-oneplus: add ipa firmware names
Message-ID: <20210720153125.43389-6-caleb@connolly.tech>
In-Reply-To: <20210720153125.43389-1-caleb@connolly.tech>
References: <20210720153125.43389-1-caleb@connolly.tech>
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

Add the correct patch to the ipa firmware now that custom paths are
supported.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 1339bac8afc2..96304f8688ed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -406,6 +406,7 @@ &ipa {
 =09status =3D "okay";

 =09memory-region =3D <&ipa_fw_mem>;
+=09firmware-name =3D "qcom/sdm845/oneplus6/ipa_fws.mbn";
 };

 &mdss {
--
2.32.0


