Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE1424CB5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgHUDWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:22:49 -0400
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com ([40.107.94.50]:61505
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727075AbgHUDWr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:22:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5fryBS6zXa41PRphOMR6X/0+6Ja618ChGjFUxLD6YQXWPzLEjwUnFePJHnsaHOt1B/EczbVk0mn2pTfNcHAaktdiqv9yZaCohKRntJVyF3s6R9zsY5NPMdtufBjnUo+B/ksNmaCR2mPjgR1cOIpExRI1v10EhnC36qzTO0FPptlaz2kcIM19fBzKzTu6u7tEug4Esq4h8KecV+tmdQ/gDqPNebOhljEnI57IL3bhLGq1GjYTtjvNJnldE/kIN8KiSqJsYWUpJsRdqJ0osEgW0dXoBUDloJAihMFmJ/Nk6S03rLZ8bcMMcKeVYYiRA/ExigsfzUkEaOnMkSjl6o1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4TkbuXwJ+GIOsk8gxUaGl4+aHu7taJ1o09t3D6xLP8=;
 b=gNugHD0TYNfa5ci6/NyR4rxk3gbCcY3LQj+E+p2hDOppZwR3CO8w5X7VeY+OHICepbxvPiS/AMLcZt9t0GbJPZGnTZ4WWi0exrI2Zqdpd9LBGOSx2zD9N4qFT/EjTk3IShtq7xaHl4U5+MubH40PNNnLlr532xohKvqAnlm+hEbbM5vPhUqOKvuewt7dzPeerBiCgMPd27+rhcOjAGYo5TiTgjyhBUqWYfM/bdyLtY6ZxVuYwHfffZtlp1JIAkitYACBRtE5poj3FApbCGijPP6l43d2yrg4PsNgu2fDTHybmKxl2f74xvUztntG39XWGKcZCYZjM2cmkziBkwz2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4TkbuXwJ+GIOsk8gxUaGl4+aHu7taJ1o09t3D6xLP8=;
 b=jgSZs45EzoIp2vzp84IL9BdHGoOpWYMktNgFNIq4DFWT0I9ekQhkJEVmJxhH5qW8GpQDsOPzbdoU9fCfgNSh8nkfnIi+bvMFxpbrrPnWpnMaGDytXN25LadtFmHS1309jn50eFFJPybB/8p2i8C2R6U/e8910TMpqgtsBqUyjDw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:45 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:45 +0000
Date:   Fri, 21 Aug 2020 11:12:10 +0800
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
Subject: [PATCH v2 01/15] regulator: 88pg86x: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111210.0a0bed94@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:22:41 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86f78c2a-0058-4906-d308-08d845817897
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617D28456FF7C59339A7B35ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLhYUulhkRgyNq0sWyTKGwEnj60koL4Re7aN8G0RxX+1mWxpz75YJJeZX48TCG64J1e7lJjkJw/zLU4WLWpCc8dUPPH9wdYDnrZfEPmg4puJF0i7ekgncHyxVnkVXiu2GKBMqLHyBaystEcVhJBW0xRsdg2Yv6/Xqgt0P/ib+x16Inp7drEaBa5NJyW9XV4++c0Eqru6SMcV2ngVfFOzNXxWVXOV4p78fAipgWL++xnBQqJdjcXJq6lZmzK2VyPbKP+SIZo+Y/c90le6XxiLAkZrzmPxcQZnNIvN0ckqR3PW22s+daI8T9EcCWimVJAmiV+5lX6/rNgwr5bHH6nPw1DzQzOMKTkjcxl1Y3Hg9jTNEZg7QA8vsZFgqaaX1B1K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: d/EzE77ZHjjq05LdNIT93jtWiKc46AHtIwhPFtnNzok1AojEn0MqH9Drcf4503L35IdkodPtnXkxrQcngPFA9IsD7XyFIV4ma49/8aJEOK7/8GlToWFa14t8hdzVvcbQCyogZljbapL9sWpPqiPgI8dMkv2BFWvp67FTTEQLCEYfLySLsBnygIr0iuk7gXtxlIIKGlml/v1CQElmk5fNx6nosVHQiTAHdZ1qqBmLvbeh0eogNgKlwaU7DFm3Cxu62nhyMu6XEsf6mtz5mx93qadnkxZLs42Jp49SIe2u9GMnM3G3qR6LyrFm5p/sTkdOv2K8aHCGMCAEfjO0IuezAZCwuMBgNcn5CLU8KhGcMIRToF0cvEGeAEQ80vdogR0jSDtRcVBJbzpP5A3rZ8HYmF0pRe9vmOpD7wPIglgztBX1ws+zzatFh2hJK1ip3S6TLZ3ie1Eh3WtRKf1CK5MCT2C6BdfXxlTGAF7YLJX3wCqDAVopwGxjgHDCafNJnIUQVeldAGzJXhkSXZHEomhUI5MZfTDY4NuttsegkFRQcxgOMfmRQowoSQlMeSHsJP1RP3aYN6WVrQ79k0kyHTes0AIYw39femhaeX7mq4sIUMWxhIRpthN/g6tDYk5tsSAXKXTDPm50J33dKcqfJK6q5g==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f78c2a-0058-4906-d308-08d845817897
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:45.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khxxMgVT9Sj0aCJ4Yf8HZ8SpUJxVOQAOLVilUK2J9kmU4c3wW7QmkNEonvLrqClky54YjsixvvqXexmRn21zcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/88pg86x.c:87:34: warning: =E2=80=98pg86x_dt_ids=E2=80=99 =
defined but not used [-Wunused-const-variable=3D]
87 | static const struct of_device_id pg86x_dt_ids [] =3D {
   |                                  ^~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/88pg86x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/88pg86x.c b/drivers/regulator/88pg86x.c
index 71cfa2c5de5e..e995e7379a04 100644
--- a/drivers/regulator/88pg86x.c
+++ b/drivers/regulator/88pg86x.c
@@ -84,7 +84,7 @@ static int pg86x_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
=20
-static const struct of_device_id pg86x_dt_ids [] =3D {
+static const struct of_device_id __maybe_unused pg86x_dt_ids[] =3D {
 	{ .compatible =3D "marvell,88pg867" },
 	{ .compatible =3D "marvell,88pg868" },
 	{ }
--=20
2.28.0

