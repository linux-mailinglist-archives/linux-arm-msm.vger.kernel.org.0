Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53D02E70B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 13:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgL2Msx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 07:48:53 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:60338 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgL2Msx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 07:48:53 -0500
Date:   Tue, 29 Dec 2020 12:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609246048;
        bh=twZZPr2dzdNuhHX8PkG+BAW/NBGqPo1TB2+khwxpUvE=;
        h=Date:To:From:Reply-To:Subject:From;
        b=vq0GJZgX+5Vel7s4cBLWvXWuG5i/V75+Oe86TnIf+TM97ROQiuBVIvWsuPjcPNn0A
         x4WU7IpNz2OBhuKdJtsTgiJsNe0QlwnjwCnvWEH3eG6pP3pYeUkaNhEU2HkEq9BDa1
         nIlQ4yQjfyi4k9Dpt6RNaABtCJ2jvPLT4VnL5fHM=
To:     "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: pm8994: Add resin node to PON
Message-ID: <8WhEzfSgoSe_f8OT9eH_6hLGTqY9k_Cy9ZLr84OJsFctROAlbUEz552XibQxt684Um8E5NS1_0qxIn3tRVSs0ui1mVUKhBFmUjJ_dannvrQ=@protonmail.com>
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

From: Yassine Oudjana <y.oudjana@protonmail.com>
Date: Sun, 27 Dec 2020 21:23:40 +0400

Add resin as a child node of PON.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qco=
m/pm8994.dtsi
index 5ffdf37d8e31..334774a38602 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -58,6 +58,14 @@ pwrkey {
 =09=09=09=09linux,code =3D <KEY_POWER>;
 =09=09=09};

+=09=09=09resin {
+=09=09=09=09compatible =3D "qcom,pm8941-resin";
+=09=09=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+=09=09=09=09debounce =3D <15625>;
+=09=09=09=09bias-pull-up;
+=09=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09=09=09};
+
 =09=09};

 =09=09pm8994_temp: temp-alarm@2400 {
--
2.29.2

