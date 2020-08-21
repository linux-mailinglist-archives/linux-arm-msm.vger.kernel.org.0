Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F004924CB43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgHUDVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:21:33 -0400
Received: from mail-mw2nam10on2070.outbound.protection.outlook.com ([40.107.94.70]:22272
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbgHUDVb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:21:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2+XmJNffEED3IY6m+acraKW2+9OEodBrdkQVqIYReguhOVeCW3+kOnZNWeqnOwUckMR3z9BqNMokAzEGISk6wqayM1R7H4gDBdVaqlfE1GqgaKvEPGN1FseZ9HyLeQyz/sVWmojVLakTNQ74Yjby7kQ9a2m9xvtL1OjZtExUgmpegS7l3nzysQoan5T8Qlzy58Vw7AJECvM+JM1MUMAyG6XSpDbmsdOigbt5C9jFuR/2cF/0AeVZsIJGfoWDNOxKYDxLDScptJuUKHkiH+mmDsa46HPYMnzOKZZ8kX4bnlITwkxxfFpj1Y2pt8PqS6cue4Xl6ExEuoHlOt0u9nJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfV4mxwKqyeAKVXUe2OK/ZKUOFBIRp7DuSMjz6hb7Cw=;
 b=Sf2YohprQsjmRr/1pIrqY1mu5eCNmkd8jfPutV8+8sdrZAdn21QlWybSVDJ06Bp0rbrQH2s1cUVjZ2sHsbmlfVB6g0TuQlF4sT2iW3NFnAoI62wWDnOLT3w9EEw3DTPmzqcMjrFrF6kCw2gcOeGZI1GrMj4NcxnIRFwiO8bOtpC/XWyTBEUfQ/ke0fKU987qvgCBdjwVGWmVLL19ZHEYCRIOA4TwFh4/FlANjDsepDpgvZ/RiShcdLIsMPBECABc5LbFAO8TtnTwyY5dKs/q+boaSp0NRtXe1yGcL+kNMq4Gte19xE2OQtwf3U2kcPecpqoz8aUvwAt4tOIzx4WPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfV4mxwKqyeAKVXUe2OK/ZKUOFBIRp7DuSMjz6hb7Cw=;
 b=HMkYOpVhbaUzPmvVV1faOTEe1U6pbhqMT883pgqSZXrTfxUHg0Wr7stjUr0hWhavfL9sHoyVPg8mzt4gdiuckCqyWzzGHwCm1nI7KImvOcTisGJ6yIvqs3Xaz78oG4BDWSif7aFwn97/m3McFk0VJomayjc66qllIeH4eBGyoLY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:21:29 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:21:29 +0000
Date:   Fri, 21 Aug 2020 11:17:55 +0800
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
Subject: [PATCH v2 11/15] regulator: stm32-vrefbuf: Fix W=1 build warning
 when CONFIG_OF=n
Message-ID: <20200821111755.4c461039@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:21:26 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eff0eff-e219-4567-f1ca-08d845814bb1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617F9671E1C40482ED53469ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlarCBdAFdEOesLDKHbTTlPWfrY3LpsOfP10DJukCnSZJ7N7YW5gcZvE1kRxYmFCBgpRQYvT3XWfLtTN/r/0dKfVJTO2FVBSszw0VpqE67a3WOo3b3RZKK40DBTgkCrV+TB5GXLsO047tBfzEUcmRY7E5yc7GnP/9NC5Hgq4U8PzHQipFM31JzBE8WKBKRDiBoQMeRqpAaHKwxLJEM8LBdrGTJmEYYbnmopPfe5msN/5KwjRe377Ve6WdCn4UvG8HKn14ExCa/bk9NtUF+m8LfK01k2mBA/MTcQpYyJMOHQBhEVMD47q9zEWfCQNLjLsXsfSB6+MwTaGb5S0kzTSPwPgHz3HVi6Tuu+wPLpzJVh+GhN2lUj+DFkt1q+XrR4W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5EtHmIOLi6oTiHBvzXx1Cwf5Ah/em6LJtYdin1AjBx8lRxaXytO+rB8B9tbiy5iMFho4sgNqq0klzRW8T/Y657W0n1lEHDy1K6Lfy+oZlZ/JEDPUoEcyfMwZisFt8Zawr2awoGTW34RcKVYgXptI0sUetrs+viIOgVUuhw0y/J1xeY8rbIWOQLbstW083aiNVYs0jJP6c1q9tP7TkO88F0q1xrbRf9sBlwL3RC6xLUVh7i9UraCtf3ra9w0xMvkL5Ru57RmqY1AsmUsJihaySsHv2V2NVhtlfgJopTQhnj2JxjpkMqcYs0V+4w6qI53h6eJ4UO+7iwbh8H5EwPZZhD2uE0r/VeaaP7FMw9uMfGqmPOYFCRIx5xWAu5TNzslbXLIUfuGdSLcuOz7o+PDXVS2v2+0N30wiHgf1frAtAl8EYP932IWmQXTNRjako3n1fTxpNk+LJlEarfi8E8JnfITkV3q218mXqg4WToCZ+Lgn4zsdl6T+nQhv6VMnCbpKQjDBUKg3NTO8hp2IXDpHLWIEQqa3jnNxbZTipOo7sWJi6gojO/mdsk4L2xaZSz34ZKfmPLVWtsZ7BJ5fMrJhLPrw80TWhZsh5zfHHGVYXJ+j48tx/tfab0KP39sQ4RmsY64B6FtqPTYQjaA7qZg1Vg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eff0eff-e219-4567-f1ca-08d845814bb1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:21:29.8824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ/KZa+qJnS8l0aOwmmrxuxjWMdb7CCR08utrYQ/1v+qXRuJwb+GQha/riCU9PIRxBc3lF1x6G4gAvv5tItLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/stm32-vrefbuf.c:287:34: warning: =E2=80=98stm32_vrefbuf_o=
f_match=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  287 | static const struct of_device_id stm32_vrefbuf_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/stm32-vrefbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vr=
efbuf.c
index 992bc18101ef..161622ea7259 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -284,7 +284,7 @@ static const struct dev_pm_ops stm32_vrefbuf_pm_ops =3D=
 {
 			   NULL)
 };
=20
-static const struct of_device_id stm32_vrefbuf_of_match[] =3D {
+static const struct of_device_id __maybe_unused stm32_vrefbuf_of_match[] =
=3D {
 	{ .compatible =3D "st,stm32-vrefbuf", },
 	{},
 };
--=20
2.28.0

