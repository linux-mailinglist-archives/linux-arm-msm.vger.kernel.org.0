Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020933E7DBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbhHJQpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 12:45:52 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:45877 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhHJQpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 12:45:49 -0400
Date:   Tue, 10 Aug 2021 16:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628613891;
        bh=wF6Dy87Du1yG9BeflrMdG3mGQlQUKJJ0TUMrCckTKAc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=AheCFai2visNjRn/5OysJYjT4iBlXvZ8B8+f7d2QZ/Pb9Bk3ERV042s5NN/VQH68A
         9kMTeqEqTonCoJja6FYKY5GBnamRjqpyxkIIIdlHtxHsrIO+kLWhfmozLUOA/ILztv
         PY/3gAmkPFP/voBLO8wa3NPlQWU9raRMpzoXbV+M=
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        sivaprak@codeaurora.org, Vladimir Lypak <junak.pub@gmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 4/4] firmware: qcom_scm: Add compatible for MSM8953 SoC
Message-ID: <20210810164347.45578-5-sireeshkodali@protonmail.com>
In-Reply-To: <20210810164347.45578-1-sireeshkodali@protonmail.com>
References: <20210810164347.45578-1-sireeshkodali@protonmail.com>
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

From: Vladimir Lypak <junak.pub@gmail.com>

Add compatible for SCM on MSM8953.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
---
 drivers/firmware/qcom_scm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index ced1964faf42..3e3d310f9aed 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1290,6 +1290,10 @@ static const struct of_device_id qcom_scm_dt_match[]=
 =3D {
 =09=09=09=09=09=09=09     SCM_HAS_IFACE_CLK |
 =09=09=09=09=09=09=09     SCM_HAS_BUS_CLK)
 =09},
+=09{ .compatible =3D "qcom,scm-msm8953", .data =3D (void *)(SCM_HAS_CORE_C=
LK |
+=09=09=09=09=09=09=09     SCM_HAS_IFACE_CLK |
+=09=09=09=09=09=09=09     SCM_HAS_BUS_CLK)
+=09},
 =09{ .compatible =3D "qcom,scm-msm8974", .data =3D (void *)(SCM_HAS_CORE_C=
LK |
 =09=09=09=09=09=09=09     SCM_HAS_IFACE_CLK |
 =09=09=09=09=09=09=09     SCM_HAS_BUS_CLK)
--=20
2.32.0


