Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B0D37099C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 03:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhEBBn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 May 2021 21:43:57 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:49525 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhEBBn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 May 2021 21:43:57 -0400
Date:   Sun, 02 May 2021 01:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1619919785;
        bh=7t4+OnZ/tHUs6smHDPvOJLoDoNjQoDuPdjhxhLCKuwI=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=WKodFOfNITQ7HtUCzgYbMZNvGTvs1bG4ekvk/oLjmNn56ydlgXB5qhp5u5YAC69ce
         257C8u0IoYIuhQ+6OhUBXeZA+K6e5/DJ/QI8yI3yYgZXu3nP4PtgrhrhW9ZjE262my
         8Blacmbo8DcHPaJJO5cSJAGT9gtHLrx5cpU55Nvg=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 3/4] dts: qcom: sdm845-oneplus-common: guard rmtfs-mem
Message-ID: <20210502014146.85642-4-caleb@connolly.tech>
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

The rmtfs_mem region is a weird one, downstream allocates it
dynamically, and supports a "qcom,guard-memory" property which when set
will reserve 4k above and below the rmtfs memory.

A common from qcom 4.9 kernel msm_sharedmem driver:

/*
 * If guard_memory is set, then the shared memory region
 * will be guarded by SZ_4K at the start and at the end.
 * This is needed to overcome the XPU limitation on few
 * MSM HW, so as to make this memory not contiguous with
 * other allocations that may possibly happen from other
 * clients in the system.
*/

When the kernel tries to touch memory that is too close the
rmtfs region it may cause an XPU violation. Such is the case on the
OnePlus 6 where random crashes would occur usually after boot.

Reserve 4k above and below the rmtfs_mem to avoid hitting these XPU
Violations.

This doesn't entirely solve the random crashes on the OnePlus 6/6T but
it does seem to prevent the ones which happen shortly after modem
bringup.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8f3f5c687b4a..96c370b90550 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -46,6 +46,14 @@ vol-up {
 =09};
=20
 =09reserved-memory {
+=09=09/* The rmtfs_mem needs to be guarded due to "XPU limitations"
+=09=09 * it is otherwise possible for an allocation adjacent to the
+=09=09 * rmtfs_mem region to trigger an XPU violation, causing a crash.
+=09=09 */
+=09=09rmtfs_lower_guard: memory@f5b00000 {
+=09=09=09no-map;
+=09=09=09reg =3D <0 0xf5b00000 0 0x1000>;
+=09=09};
 =09=09/*
 =09=09 * The rmtfs memory region in downstream is 'dynamically allocated'
 =09=09 * but given the same address every time. Hard code it as this addre=
ss is
@@ -59,6 +67,10 @@ rmtfs_mem: memory@f5b01000 {
 =09=09=09qcom,client-id =3D <1>;
 =09=09=09qcom,vmid =3D <15>;
 =09=09};
+=09=09rmtfs_upper_guard: memory@f5d01000 {
+=09=09=09no-map;
+=09=09=09reg =3D <0 0xf5d01000 0 0x2000>;
+=09=09};
=20
 =09=09/*
 =09=09 * It seems like reserving the old rmtfs_mem region is also needed t=
o prevent
--=20
2.30.2


