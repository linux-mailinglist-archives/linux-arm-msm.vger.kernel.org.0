Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE3424CB52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgHUDWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:22:17 -0400
Received: from mail-dm6nam11on2086.outbound.protection.outlook.com ([40.107.223.86]:13665
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727891AbgHUDWQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:22:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9obGZlwptm47gYhr44j+h9JyMSU0i5J2pRb0n7mIer9cz+UlOEhFg0rAZV3bAR7kwG+1Z0BhDv61uP/48bJLcxMHjVLV47M85eSKJM3+XHCM7KostBCk0YDfT/jSaRRbxkfQmutjS9an6fBVd1J1/RbhA6aOwsytxFg0FGbUzcFxutKcHCh2TAJX2MguSuVui/Gt8pARRxQoP0qJllISpQeQ79JU1ev7tz6Z4SfxCNWpcOOgK95e40JkKbIfruHoNFOLwJUMHkkHOIqgRZt3HjkfHnZq4KPG6LJnYgn0gifCJQAgpLtOo7IbVHZsfl/W0gHmIkZcqk4JIGFGH5xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTmvjlVtgfq1yK2IitGGD8aYtPi75tv4zJFYz3/H+Ug=;
 b=meT+x6AJlrofhtrR9UPLVCj0IenXUmGQzX+yAcukBCaj69FxQnQf8tdQefiOcZut9dpl2Udxl2xownAe3PxrC9qMmcpRPceU7bpd6sNt+VlD/WOIHbBvxJRQt+qBsaefnBUIBzHixxsO56WmvZkHqe8L7jwVLkHF4K4FjFMNMCbQ4FenvbDCMiEINCXNtV2aKQhY/+mpU74gJXiKlhzFGFpmlV1rDC5eiNwRMQmXirod0lm3qSr5vAl3xxMrylV58V/V7ZF9RnAsXvFy1czv18CMvomql1G6m+ktnczKOufxS3R9BvdgecuZ+cvu3Ba2LxgDaatb+cz8hS7dg3Zh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTmvjlVtgfq1yK2IitGGD8aYtPi75tv4zJFYz3/H+Ug=;
 b=OJ42hnMzzdtYhMyBS8+x5iPtcJ/ikvmIaZ5P84Bw/2w1M0xVgd//eXcf4dMxXCJ3BTwS2nvjyld5NJ/+9roBlsFnOpRfNa0RM48cl2iD3S4gYGtfI4uPveLFSppD4mMvJndeci5OUSSM2INvI+C7eAYWIvDJb8fPXDUcTHlrJks=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:14 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:14 +0000
Date:   Fri, 21 Aug 2020 11:12:35 +0800
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
Subject: [PATCH v2 02/15] regulator: da9210: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111235.14473a88@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:10 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23f29cc4-406b-4063-b2ef-08d845816636
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB461782B28B5549B1ACDA01F0ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VeQqKZdW4QaoyzP1jfXdBHeYt/9MuDvoiO1ikCcGU3JDJlNBarrM4Bk4GQYxIvIUtqeCLwqWZEz8DRy15+eudHfYMCp1WT36lKw/bn9Bo5IHKT6crGozOXN83xKSS8I9a5BXrfCgEVIKWVv91UYev+0QWNig0jk6cpZEcalbrve/jIKbkWlpdlboMp1932UzYHCsClc3YgmjLgg3pn7atCNYFtNBTXE3A4EVVAMoCwBSKBkbzZHq6oL20yfXsrjE2Or+StAzSi414Bz/YkswptlvW0BUvHcBYvlMT7YDhOdHpwYtZtGTL/lRtzzoYFCTr0c6u1hj8X87zjnRY442nLIiCwVvoPMjPHyjri388l78W7tW2jfCI1T9Wkv/0+UD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KHCHJuOXlakqF2+bK69ydyD27i5DzpcONE6hHHVWWh4RSKuhEerhJ4LWIns02nBF8QMjeJ5fADeUhYYANrStTPAE+gOLf3MNmgofjrodoqNo0++YRPdnOUkBYwftkZtQ3f2lHNmSEd6yzKzR/QoYSeJpNS0sqgiSnDaGz14DzVweruRI3Q0+nHZhZh3+zXqiF+ITDDwQdL8hOTnMYV2MfXsDv+7uGv0k8lhTchzKWhUb21o8D6ywtoAWcEzXBhvwb+/9PuFKg9F9TeQH1bT4SEWsNbbTauiUPrhN0v99t/MMA9gB4g1aXOSx2P/t23wUKxkD3/4ahlcW5oWULwiN0yk6WC5VNdXJ1xFlk6iKPRnZ7nrELJGHnilCbN+J4/VylSIz74j+1Xi9yRFDwZmPpzvkjkKDCvPVNLvJPuNWSXbltosCXQIEBfmd86Gztm/0lJaaywoG3bGEsakoWQdavnN+VwdXkUIqJliaqFUC3X1YLMUXjxUpLeFznloRHvIswucumUqrE6AJIG8zB2s9j1E59aArprtFz3xFH701sMpdOX7LSY0BROe+7RIvroSeri+bbCUzO/w8HCk6DPJSQQx8AAST0XftovPMiNEbLyMbvTJGnMER/hf5VFxi/dCI3ui4IPLwnRgQDBxV9msq0g==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f29cc4-406b-4063-b2ef-08d845816636
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:14.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOflTQWWlL3g18qIyxRMpvZ2MGn22M/plAzYV4RB7fGnQrtq3GSapcY/hQM9XAj7vnw3wxxhQZ7GNYn7fSwTWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/da9210-regulator.c:128:34: warning: =E2=80=98da9210_dt_id=
s=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  128 | static const struct of_device_id da9210_dt_ids[] =3D {
      |                                  ^~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/da9210-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9210-regulator.c b/drivers/regulator/da921=
0-regulator.c
index 0cdeb6186529..2aea442b62fe 100644
--- a/drivers/regulator/da9210-regulator.c
+++ b/drivers/regulator/da9210-regulator.c
@@ -125,7 +125,7 @@ static irqreturn_t da9210_irq_handler(int irq, void *da=
ta)
  * I2C driver interface functions
  */
=20
-static const struct of_device_id da9210_dt_ids[] =3D {
+static const struct of_device_id __maybe_unused da9210_dt_ids[] =3D {
 	{ .compatible =3D "dlg,da9210", },
 	{ }
 };
--=20
2.28.0

