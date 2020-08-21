Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83C324CB64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgHUDYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:24:18 -0400
Received: from mail-co1nam11on2040.outbound.protection.outlook.com ([40.107.220.40]:6785
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727040AbgHUDYQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:24:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGgqyTAl0CYk4FoQckzBjk/L9QqB9sIZf/UxF9cy8gscWiDe6CKO7CHrxLC6hE2Mvp+R9oVUCinEjCvnSW+T1q2Uec6k2lZTPkmm0CTz3p+K3+aTbIy5KXfmURiNjj+jzvmtBItxNAzFc4P35zYO4FoA27gSzTkblGIRfMNdmE1T6Kip7g20h6grHG7XDgKVDM25DT2v3d4hIcoB4QIe99BNZbT7EO5AZS5xZ9zU0KImhJudJqBueaAvxSIAuA4BGlRX/bd0l8eSzSH9CoOWpvu37hqSjyMp49NDbVNfQ0km3i9XDG6uqKMIVclwTatdzsZussvZQLVrLgRq4cqQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL9/r6+ll0NF1Y/kbEJugrkxt8+RNVyCXvxply89DKw=;
 b=D8re5+twJjWFWBn6i4OY6Y8RMyX5QBgVouaafN2CriHQ1lgiNXXvihEYp0QP0tCXytQWGR5vs0Ca7W0mx2AUtINPlIBHEXyCLnDK3JjJby7rwGIc8bZYgNfV4cdrzlz7BgZgGMaPb2/7+WHtQjTrqAvuU7z1SfVy8Co8eP9eYMSwlYq92lxs94C1Q79+qpp2wXckSFyq4jWtoAKsCMahvRv6bqUcT/aJQXcsFWJHsek7cMU0zooQF5HI2cBW8Whhv1+CckZluvj+ZjxuyqA1St91B1PMQAgUoZFNh36Wu7gG1tt8vkRIvnihEbQ9ihEw045NpwLQf5ys0wN8ATOgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pL9/r6+ll0NF1Y/kbEJugrkxt8+RNVyCXvxply89DKw=;
 b=TUZY2Q9UgNdO75wDbqY+CxWMY2idiv7zf9A/9CuA5qm2JmP0SRn/qXFNv6XOD3ToNbFamR5HR6KZUTET3L1ZFmKovkWbmC9rx+U73yVAnUKAJkzmx9phKQ0icj7wmda4FwuKl0E9tCyRMAW17q+GSx8WIZfj4sBIg7aYFhyIl5s=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB5308.namprd03.prod.outlook.com (2603:10b6:5:242::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 03:24:14 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:24:14 +0000
Date:   Fri, 21 Aug 2020 11:18:20 +0800
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
Subject: [PATCH v2 12/15] regulator: sy8106a: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111820.5c6ddb04@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:24:10 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbffe17e-23b7-42bc-1138-08d84581ada4
X-MS-TrafficTypeDiagnostic: DM6PR03MB5308:
X-Microsoft-Antispam-PRVS: <DM6PR03MB530826ADAE22DA2AC56E0A6FED5B0@DM6PR03MB5308.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbG1598npT3dwXkM5rNRKSkRZ9VbnqFisjrxD/9L8RG8ZLRsnMpKz61Q8ZOTNN9agySFGFvL9vea+/pEB/z08K3QI/8JEe5t7HZo9PJUWIFZXG/uQySDzj7j/OIqAhKHbvqBKz1AwBPCE5RemLA4/igJ5IIKbXUGDZe3uGXchakYjqGWPgGnAa2WJADUR0aZBKWgfI8LuSp8ryxWOYeb+M4T1g0SENMWk/XM4BUrPzjuGlsS6kGdWElf+98V5sA4U/gVIjmzinx/QW5BDIJUGyJz8eqhakIE+YXx+W7TYotIXfIDCZrosd114vbQu7SSpnOcLiFrmzPOmid6UGeYuMB9qHfT6lNVVotsAYSkLy398KmqDppezHn0rms+NEnc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(9686003)(2906002)(478600001)(5660300002)(66556008)(66946007)(7416002)(316002)(83380400001)(16576012)(66476007)(110136005)(8676002)(86362001)(956004)(4744005)(4326008)(6486002)(6666004)(26005)(186003)(1076003)(110011004)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mVMGrK/boeQNtSQhfryT2LY8G7gt9RRCMxcp9B4RvyzEsswLW+eFtu1sKt5HOzxxeC0X5X6zY4V2Jsu+96ibe4K0rQd2qaK5/rwRpOzCzPplWKsZveGEhtR0x0ZwIzZJHdg+Eju5hABDGsIVqX8uQzADW4A49pquAW/XykCYvJmbLHJjrh06WC2WPyUSGBM+NajCKKwpjmiG403wdq2bhQAwq7t0jlt/VLlp8uh54xv9vsuIY6fAzPKn/xafBIX7pVM1I8jJllCstXIPa6fMTzRYLn3IB74cdd3yL8seor1P/f9pxBb4dm8iWrq6EXn3CV/u5h7MBGwN305ZFBpZvUksh5Iv+oYNBQJdrRylryCS8Kx40p72NpZ8wOLxyJLA3M+TJajyOA/ZthfJ1ILazYmuRFICRMocxesmu69S+RCLLG7FvcmUt0IldBAMRppyTNw7m/41nJPdQB5SMTBQ/Q2i1FBkTqXYM8iIjLBiIQ9ElGyzsruz0gK2+W1s5Q1czg8LpS3MzuUlg2g9ezgnsR+T3DruAt1+L8fe2KZansnONHrX+c5wxLHlrRiG4IDGHeADmKkwiSphiTIbL559GldkQ92Rr4Ntl4yj3cGearxTaFbnEqVtbzCZpfUAAG+8IL+9/EWkSiPQWN5e/qBA4A==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbffe17e-23b7-42bc-1138-08d84581ada4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:24:14.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bp2+EcRw6hhwnA3iF4j9snzpPXHQk/Vdvko5hpzoreQ8hXEQDIWbPocvwl4TRYF6DN841WbZSEZ7VTVAgfbMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5308
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/sy8106a-regulator.c:126:34: warning: =E2=80=98sy8106a_i2c=
_of_match=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  126 | static const struct of_device_id sy8106a_i2c_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/sy8106a-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/sy8106a-regulator.c b/drivers/regulator/sy81=
06a-regulator.c
index 2222e739e62b..c119f85259a5 100644
--- a/drivers/regulator/sy8106a-regulator.c
+++ b/drivers/regulator/sy8106a-regulator.c
@@ -123,7 +123,7 @@ static int sy8106a_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
=20
-static const struct of_device_id sy8106a_i2c_of_match[] =3D {
+static const struct of_device_id __maybe_unused sy8106a_i2c_of_match[] =3D=
 {
 	{ .compatible =3D "silergy,sy8106a" },
 	{ },
 };
--=20
2.28.0

