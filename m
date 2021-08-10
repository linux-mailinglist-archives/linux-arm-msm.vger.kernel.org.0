Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9AF3E7DB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 18:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhHJQpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 12:45:11 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:47800 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhHJQpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 12:45:10 -0400
Date:   Tue, 10 Aug 2021 16:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628613885;
        bh=B2PX5wvlb3kCxkvzl+Fw5xV8foetR0ZfrdHlzKAEUHk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=PBLB+iTcceCVAKi0SXrIe+S7R+SRAd7SL3lAX5ln65KZpHNpuLdoHsIFKlOLfu/GP
         lecARNeVXkb8tbmyn1X/tZeQPnFDFe+yd/njcgMvCT/lJYy5vtf/Sj8Dk5xQFR6bYe
         pjLRUlcj0aSVkqS5I1vUcPJhg+bHtBiQd/oot1lY=
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        sivaprak@codeaurora.org, Vladimir Lypak <junak.pub@gmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 2/4] mailbox: qcom-apcs-ipc: Add compatible for MSM8953 SoC
Message-ID: <20210810164347.45578-3-sireeshkodali@protonmail.com>
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

MSM8953 has an APCS block similar to MSM8916 but with different clocks
which are spread over 2MB IO region next to it.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom=
-apcs-ipc-mailbox.c
index 03bdc96dc457..82822b7a6230 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -163,6 +163,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match=
[] =3D {
 =09{ .compatible =3D "qcom,ipq8074-apcs-apps-global", .data =3D &ipq8074_a=
pcs_data },
 =09{ .compatible =3D "qcom,msm8916-apcs-kpss-global", .data =3D &msm8916_a=
pcs_data },
 =09{ .compatible =3D "qcom,msm8939-apcs-kpss-global", .data =3D &msm8916_a=
pcs_data },
+=09{ .compatible =3D "qcom,msm8953-apcs-kpss-global", .data =3D &msm8994_a=
pcs_data },
 =09{ .compatible =3D "qcom,msm8994-apcs-kpss-global", .data =3D &msm8994_a=
pcs_data },
 =09{ .compatible =3D "qcom,msm8996-apcs-hmss-global", .data =3D &msm8996_a=
pcs_data },
 =09{ .compatible =3D "qcom,msm8998-apcs-hmss-global", .data =3D &msm8998_a=
pcs_data },
--=20
2.32.0


