Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D8A24CB4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgHUDWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:22:12 -0400
Received: from mail-dm6nam11on2075.outbound.protection.outlook.com ([40.107.223.75]:2848
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbgHUDWJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:22:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFNmUUCFD466sfrrr6V/0vgv2uoOl2xRoVYRYn6PXaj21ZkVeixmFCYCISTHTaPaUBLiz6ZgWYVATo9pZVCHiFRzEJtLYIATPL6NU58aP3IyinELZ0xAVm+ca/HWkfDllUPqE7Y5w1RMmE2/u/ThCv02m7mPKtyb4qsqKDgjZ3f0aTUnPv61TXFivmhG8JdOlEfmk0j98DQtqPfOC3GAWHcRqT3+jGZFSZGVg/CTI/fuO/Lt23+pXfbB9Evg50P4HFknQFxVMkUddOWA0blypyc8HfTKxqCYnL5NjSf/91mjpUdOwdgszi5MASLZMuCN7/JmPbYGNq+RnBZA2HaCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYQhASLP/p0283xryrOrj49o7Zm5uRC7pxlXYFOngZc=;
 b=fsQheppNT4y0qrV5KtTL9jUxxmYW1KDGonav/+5ioZ7rckk6Apma5nEjRp/ttd2dNF97rjKezeajRVfxVOD/uSq3pd4NpXQo1jug3rUZFY6OEl5bLmvV0PHDS3FsWE3WSliZ30X6uwdXQFu6PZog8vLF/J6HPBs5+tycagExSVJaEog4mwFP1VuPQOi1svWUsgL0mnvnmAYrufCkibNfyUpFJnYXZpf+YYDPqKATOrq4/EQkI1Kes5RM2kyF/QDi+1RAZtxYRCBoTqwhAOvDYRRQ8sBfjVJpORLdf6UfCljKtF8BrikJW6WKdtwyS7IPzS4HOICa3caLRzzTmwcluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYQhASLP/p0283xryrOrj49o7Zm5uRC7pxlXYFOngZc=;
 b=ml/mwTSjNrXWPdJKv8KsH/7bmQtdKpAM+hzEdoSRLG0+rDkHDNeyK+jTo+e19LioB01nATZCv+h2ZynFII6GIGcJRvLNL8iiCu5g8vhMFZOvJXaFIDhErfUEvHwQt37LR4CPAyoYpCUUFFSeWyGLe8SkgZXIK3lb2TVwJ3hjETI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:07 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:07 +0000
Date:   Fri, 21 Aug 2020 11:17:26 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Icenowy Zheng <icenowy@aosc.io>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/15] regulator: stm32-pwr: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111726.38e0e746@xhacker.debian>
In-Reply-To: <20200821111135.0b958d3a@xhacker.debian>
References: <20200821111135.0b958d3a@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:03 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2be7e95-b984-42f6-d05f-08d845816212
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617F68AC0951B27DF508251ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6Uxyq1M2GNKHSe0vlFcWv6saS+NU1zBNb0to+S9HkMXKDVekfK4s0MQUAtbVxBZlVP6FEFOml3apaD1NGBSXkfFrWSr78wKIZjKzM5COALe5mFliaFoO+3Jk9Z1yC6WtrnanZeyyeyqKoBZnfrv8kpvcHHoRmpuWTgr52NU6bCUVpyYBd4j+4CsaosAU6Ss3S4b8ObSMqZP7363ZOJ+ZLd7Y5qyTvNuy63JvgrPbfPHUXvyykt6I0N7SQNnJNITqrXfE9deZCypEmWIK2l9c8B+N1bWu8kUEAtUEi/rx1U3qcdSDYAaCjL9WRK7pdh83YunDxmm2EwtKQ/YmQctBS7C1YMWjySTlxuNCZfabsLshF2/9Hwf16OHJA3mQgwc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HPOzi/hIufdAq936r8xAC+9e+Jvphb2OYM4uZYaah+/NN5fTTzrq9DS0yyfLFwsE4N7t75R7Q1n89L83pRAWuHyxYsol2Z3gADk4VKWslqhGKSY2ZsB8jYztu529RM7p4NUgNtolc7kpuvEWCsGPPcDhB+wyTLlExfmIGlLqGR3JoiP1EWtzkPaaoIEqqhbMzna1296cd7AWjKgitQ1Tw/G8LvvhxbZfzxS3g8PQsmH1qCiO/9kTYon4qGdfO22eXe1rr4QPeFbpPm0ixP/EIe+tbKJIqo5C2vdeTudHgXbVNpx2uqS+fLmbZ/MZ8K2IIwee0CC4aYzAoWO+8crTBSgqX5m2chGKOVFkQ03LCF80WkNeGGct04Y8lZbCsoMA/io6AX26uWTfZIgYGnbIl9xsRDgkOiP2CjcZt2LIGAK6xztQktNI0FkYiRathS5yVeTRUBkj4vC6Mw62PMATA0zGiLR+NYvFSsLthknBsOS4nsn8UJ3XXyJuvPRleiCASTkVJTJa5GIoNSWcOvzuDAWnPhibhYveVyopzYbBxGzTSGn8iGo+2/tUximyhFlQa06lYJCwaxR6iOPOrEk7Qix88H60aC5d1TAbrl6NP5PCTEiGLYfsOALhY54ZdO+tjwGjbA44qkHyQJ3cD3Y+Sg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2be7e95-b984-42f6-d05f-08d845816212
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:07.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GFbyB2QNiLA9458Wja1xTVxz2qgOq099luO9UUeQ0a8PEgAzwp8fLbZszr9m3+6zrlyfXGE6C4f9P3swVaWsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/stm32-pwr.c:169:34: warning: =E2=80=98stm32_pwr_of_match=
=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  169 | static const struct of_device_id stm32_pwr_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/stm32-pwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
index e0e627b0106e..2a42acb7c24e 100644
--- a/drivers/regulator/stm32-pwr.c
+++ b/drivers/regulator/stm32-pwr.c
@@ -166,7 +166,7 @@ static int stm32_pwr_regulator_probe(struct platform_de=
vice *pdev)
 	return ret;
 }
=20
-static const struct of_device_id stm32_pwr_of_match[] =3D {
+static const struct of_device_id __maybe_unused stm32_pwr_of_match[] =3D {
 	{ .compatible =3D "st,stm32mp1,pwr-reg", },
 	{},
 };
--=20
2.28.0

