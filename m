Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73803CFE0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 17:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238104AbhGTPEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:04:43 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:34168 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241743AbhGTOxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 10:53:19 -0400
Date:   Tue, 20 Jul 2021 15:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1626795223;
        bh=a/cXIJple0tXhCo8wBmyM+liGV06lwy6xissR4KIOBE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=e5PSRNYVIfDTCyWKFDdtWRV/a1CHmQ6s52JrLyxXS9rbHzfboI5GOSvtNzvZnBWcV
         VCtwbsy8K5xipPFOva8gx7eiSn8BNhQ5xQQq5zzs6BlYwOF35MdXmrIdQsjpEhxOkH
         KUCJjs5/nplTVb5VpmyJpLmCUZSvkNe21BMEdoYo=
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
Subject: [PATCH 1/5] arm64: dts: qcom: sdm845-oneplus: fix reserved-mem
Message-ID: <20210720153125.43389-2-caleb@connolly.tech>
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

Fix the upper guard and the "removed_region", this fixes the random
crashes which used to occur in memory intensive loads. I'm not sure WHY
the upper guard being 0x2000 instead of 0x1000 doesn't fix this, but it
HAS to be 0x1000.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Fixes: e60fd5ac1f68 ("arm64: dts: qcom: sdm845-oneplus-common: guard
rmtfs-mem")
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 4d052e39b348..eb6b1d15293d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -69,7 +69,7 @@ rmtfs_mem: memory@f5b01000 {
 =09=09};
 =09=09rmtfs_upper_guard: memory@f5d01000 {
 =09=09=09no-map;
-=09=09=09reg =3D <0 0xf5d01000 0 0x2000>;
+=09=09=09reg =3D <0 0xf5d01000 0 0x1000>;
 =09=09};

 =09=09/*
@@ -78,7 +78,7 @@ rmtfs_upper_guard: memory@f5d01000 {
 =09=09 */
 =09=09removed_region: memory@88f00000 {
 =09=09=09no-map;
-=09=09=09reg =3D <0 0x88f00000 0 0x200000>;
+=09=09=09reg =3D <0 0x88f00000 0 0x1c00000>;
 =09=09};

 =09=09ramoops: ramoops@ac300000 {
--
2.32.0


