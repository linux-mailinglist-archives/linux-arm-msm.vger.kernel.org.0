Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68056375CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 23:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhEFVTT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 17:19:19 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:33534 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhEFVTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 17:19:18 -0400
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Fbmdl2P2vz4wy4y
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 May 2021 21:18:19 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="kkmMzCGc"
Date:   Thu, 06 May 2021 21:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620335894;
        bh=swGFRkl78skPVTJSCaHHFeLlw3u7VBz6phnnlAM9X2o=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=kkmMzCGcSx362pQMTjFLWzrTECflGXKXY9g1u3eE74OU/jqrTVgrhp96YOaYjtkDE
         LWII7MxKWN4P2m+5r6xTvNCQH8d3MSvVs36x/KsZ6o1PZgBq9rVZdmG1GyJfDo/TpI
         3Oy2US7fTjrd7hFhAM83YsA8jlAg9AXWtJ0sEbT4=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 1/3] remoteproc: qcom: pas: Use the same init resources for MSM8996 and MSM8998
Message-ID: <zbAB2sceYHmsYeraZUi4YUKL7lgFMu13w3vHQQYUQ4@cp3-web-020.plabs.ch>
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

The init resources for MSM8996 are missing power domains, and adding them
makes the resources identical to the MSM8998 ones. Remove slpi_resource_ini=
t
and use MSM8998 resources for both chips.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q=
6v5_pas.c
index b921fc26cd04..b1e613187c68 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -689,17 +689,6 @@ static const struct adsp_data mpss_resource_init =3D {
 =09.ssctl_id =3D 0x12,
 };
=20
-static const struct adsp_data slpi_resource_init =3D {
-=09=09.crash_reason_smem =3D 424,
-=09=09.firmware_name =3D "slpi.mdt",
-=09=09.pas_id =3D 12,
-=09=09.has_aggre2_clk =3D true,
-=09=09.auto_boot =3D true,
-=09=09.ssr_name =3D "dsps",
-=09=09.sysmon_name =3D "slpi",
-=09=09.ssctl_id =3D 0x16,
-};
-
 static const struct adsp_data sm8150_slpi_resource =3D {
 =09=09.crash_reason_smem =3D 424,
 =09=09.firmware_name =3D "slpi.mdt",
@@ -803,8 +792,8 @@ static const struct adsp_data sdx55_mpss_resource =3D {
=20
 static const struct of_device_id adsp_of_match[] =3D {
 =09{ .compatible =3D "qcom,msm8974-adsp-pil", .data =3D &adsp_resource_ini=
t},
-=09{ .compatible =3D "qcom,msm8996-adsp-pil", .data =3D &adsp_resource_ini=
t},
-=09{ .compatible =3D "qcom,msm8996-slpi-pil", .data =3D &slpi_resource_ini=
t},
+=09{ .compatible =3D "qcom,msm8996-adsp-pil", .data =3D &msm8998_adsp_reso=
urce},
+=09{ .compatible =3D "qcom,msm8996-slpi-pil", .data =3D &msm8998_slpi_reso=
urce},
 =09{ .compatible =3D "qcom,msm8998-adsp-pas", .data =3D &msm8998_adsp_reso=
urce},
 =09{ .compatible =3D "qcom,msm8998-slpi-pas", .data =3D &msm8998_slpi_reso=
urce},
 =09{ .compatible =3D "qcom,qcs404-adsp-pas", .data =3D &adsp_resource_init=
 },
--=20
2.31.1


