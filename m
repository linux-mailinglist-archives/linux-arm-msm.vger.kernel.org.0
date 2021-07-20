Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4886B3CFE16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 17:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240726AbhGTPFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:05:25 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:48598 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239389AbhGTOxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 10:53:41 -0400
Date:   Tue, 20 Jul 2021 15:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1626795227;
        bh=t8DojydpgKrlFaF/reC4F/AKwWgGLBuBD8TTSdpGt7c=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=hlkCq9KKy2ZQ3nNdVgMg9staiv/IPPp6A0ezhebLzmGZdpKNozDStzUQ28gYP3c58
         Anwo8piiEyT67Bc23otsWBOdpduTHKIfnf5GqQqih0AvB1OSCtCrxfj2CpdU9n9PBm
         M5wKHrl0iAh3ARXiPWTsjAtEL08PmwuugbKeUiuU=
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
Subject: [PATCH 2/5] dts: arm64: sdm845-oneplus-common: enable debug UART
Message-ID: <20210720153125.43389-3-caleb@connolly.tech>
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

A labelled diagram showing the location of the Rx and Tx testpoints for
the OnePlus 6 is available on the postmarketOS wiki:

https://wiki.postmarketos.org/wiki/Serial_debugging:Cable_schematics

The device uses 1.8v UART at a baud rate of 115200, bootloader output is
also available here.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index eb6b1d15293d..e81f5cc9f26d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -19,9 +19,14 @@

 / {
 =09aliases {
+=09=09serial0 =3D &uart9;
 =09=09hsuart0 =3D &uart6;
 =09};

+=09chosen {
+=09=09stdout-path =3D "serial0:115200n8";
+=09};
+
 =09gpio-keys {
 =09=09compatible =3D "gpio-keys";
 =09=09label =3D "Volume keys";
@@ -526,6 +531,11 @@ bluetooth {
 =09};
 };

+&uart9 {
+=09label =3D "LS-UART1";
+=09status =3D "okay";
+};
+
 &ufs_mem_hc {
 =09status =3D "okay";

--
2.32.0


