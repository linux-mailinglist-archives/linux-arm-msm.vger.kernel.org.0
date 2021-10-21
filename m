Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FF74362D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 15:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhJUN1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 09:27:06 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:48830 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbhJUN1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 09:27:05 -0400
Date:   Thu, 21 Oct 2021 13:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1634822686;
        bh=GpiB0I+KGCnyy1lCsiKsCapszoFphoofSjyFZ0nHIGs=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=GI8gqtgkBVeF+qWYT8VchVgCWZ2lYwmrXZWfaef3wHlPyqn8DkyN5A9Z1MRNcsRDT
         o4gCG88KtzttIgHAgdD0ROGmZdC8nvK8ETVs9eVtH2HDNNQFak4Ou52C3pBsl8iGoZ
         1wYHfgpcpf4YiJroAWJX12cF9Ud66+twXDDTUtuA=
To:     Georgi Djakov <djakov@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH RESEND v5 2/5] interconnect: icc-rpm: Add support for bus power domain
Message-ID: <20211021132329.234942-3-y.oudjana@protonmail.com>
In-Reply-To: <20211021132329.234942-1-y.oudjana@protonmail.com>
References: <20211021132329.234942-1-y.oudjana@protonmail.com>
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

Add support for attaching to a power domain. This is required
for Aggregate 0 NoC on MSM8996, which is powered by a GDSC.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 7 +++++++
 drivers/interconnect/qcom/icc-rpm.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qco=
m/icc-rpm.c
index ef7999a08c8b..6b918d082ab6 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
=20
@@ -340,6 +341,12 @@ int qnoc_probe(struct platform_device *pdev)
 =09if (ret)
 =09=09return ret;
=20
+=09if (desc->has_bus_pd) {
+=09=09ret =3D dev_pm_domain_attach(dev, true);
+=09=09if (ret)
+=09=09=09return ret;
+=09}
+
 =09provider =3D &qp->provider;
 =09INIT_LIST_HEAD(&provider->nodes);
 =09provider->dev =3D dev;
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qco=
m/icc-rpm.h
index f5744de4da19..fd06a3b9e3f7 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -77,6 +77,7 @@ struct qcom_icc_desc {
 =09size_t num_nodes;
 =09const char * const *clocks;
 =09size_t num_clocks;
+=09bool has_bus_pd;
 =09bool is_bimc_node;
 =09const struct regmap_config *regmap_cfg;
 =09unsigned int qos_offset;
--=20
2.33.1


