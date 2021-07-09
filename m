Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAF83C2802
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhGIRGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:06:42 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:35522 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhGIRGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:06:42 -0400
Date:   Fri, 09 Jul 2021 17:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625850205;
        bh=p3KeN6Ovv4Z8TpSQ+6KBlTBtLTfzq3KeNEJzsQY+/7M=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=HeBG96N1fbWjhmBPAa3b4Ii+tUrmDQLz0ebLnLFsYoGB71RQwpZXRORVyKYarkz/v
         py1S8cYsjCTXFDKQUUNVWaBPys5ig/ged3AINpde/NK3dFvl8mCu2/wSF0xVjIaKdD
         NlTrOe8sLyuaqtvTkUeiALrNpJPTyu2yOAa6o13I=
To:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Dr. Git" <drgitx@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 4/5] remoteproc: qcom: pas: Use the same init resources for MSM8996 and MSM8998
Message-ID: <vLeZQwXb1hJiPeGxsiUgvCzQlWMfMxD56mKqNmpsFQ@cp4-web-014.plabs.ch>
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

The resources for MSM8996 are missing power domains, and adding them
makes the resources identical to the MSM8998 ones. Rename msm8998_adsp_reso=
urce
to msm8996_adsp_resource then use it for both chips. Also add power domains=
 to
slpi_resource_init and use it for both chips.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q=
6v5_pas.c
index a79bee901e9b..7e72d5f0150e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -585,7 +585,7 @@ static const struct adsp_data sm8350_adsp_resource =3D =
{
 =09.ssctl_id =3D 0x14,
 };
=20
-static const struct adsp_data msm8998_adsp_resource =3D {
+static const struct adsp_data msm8996_adsp_resource =3D {
 =09=09.crash_reason_smem =3D 423,
 =09=09.firmware_name =3D "adsp.mdt",
 =09=09.pas_id =3D 1,
@@ -714,6 +714,10 @@ static const struct adsp_data slpi_resource_init =3D {
 =09=09.pas_id =3D 12,
 =09=09.has_aggre2_clk =3D true,
 =09=09.auto_boot =3D true,
+=09=09.proxy_pd_names =3D (char*[]){
+=09=09=09"ssc_cx",
+=09=09=09NULL
+=09=09},
 =09=09.ssr_name =3D "dsps",
 =09=09.sysmon_name =3D "slpi",
 =09=09.ssctl_id =3D 0x16,
@@ -779,21 +783,6 @@ static const struct adsp_data sm8350_slpi_resource =3D=
 {
 =09.ssctl_id =3D 0x16,
 };
=20
-static const struct adsp_data msm8998_slpi_resource =3D {
-=09=09.crash_reason_smem =3D 424,
-=09=09.firmware_name =3D "slpi.mdt",
-=09=09.pas_id =3D 12,
-=09=09.has_aggre2_clk =3D true,
-=09=09.auto_boot =3D true,
-=09=09.proxy_pd_names =3D (char*[]){
-=09=09=09"ssc_cx",
-=09=09=09NULL
-=09=09},
-=09=09.ssr_name =3D "dsps",
-=09=09.sysmon_name =3D "slpi",
-=09=09.ssctl_id =3D 0x16,
-};
-
 static const struct adsp_data wcss_resource_init =3D {
 =09.crash_reason_smem =3D 421,
 =09.firmware_name =3D "wcnss.mdt",
@@ -822,10 +811,10 @@ static const struct adsp_data sdx55_mpss_resource =3D=
 {
=20
 static const struct of_device_id adsp_of_match[] =3D {
 =09{ .compatible =3D "qcom,msm8974-adsp-pil", .data =3D &adsp_resource_ini=
t},
-=09{ .compatible =3D "qcom,msm8996-adsp-pil", .data =3D &adsp_resource_ini=
t},
+=09{ .compatible =3D "qcom,msm8996-adsp-pil", .data =3D &msm8996_adsp_reso=
urce},
 =09{ .compatible =3D "qcom,msm8996-slpi-pil", .data =3D &slpi_resource_ini=
t},
-=09{ .compatible =3D "qcom,msm8998-adsp-pas", .data =3D &msm8998_adsp_reso=
urce},
-=09{ .compatible =3D "qcom,msm8998-slpi-pas", .data =3D &msm8998_slpi_reso=
urce},
+=09{ .compatible =3D "qcom,msm8998-adsp-pas", .data =3D &msm8996_adsp_reso=
urce},
+=09{ .compatible =3D "qcom,msm8998-slpi-pas", .data =3D &slpi_resource_ini=
t},
 =09{ .compatible =3D "qcom,qcs404-adsp-pas", .data =3D &adsp_resource_init=
 },
 =09{ .compatible =3D "qcom,qcs404-cdsp-pas", .data =3D &cdsp_resource_init=
 },
 =09{ .compatible =3D "qcom,qcs404-wcss-pas", .data =3D &wcss_resource_init=
 },
--=20
2.32.0


