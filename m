Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999DB24CB46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgHUDVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:21:40 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:18209
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbgHUDVj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:21:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX8HxtDksP6FSrt9g6eeWqvRkA1y6UxPnDlA00BmWxCpzVOECU4mpFWlGElTQsmo2YiruiUAHwGIj0s8lYhQM+2w24CjH8ywI8KPLL1kbXSizbt/wu+MPqXc0H9oKPtNK8cvTzQNIK+MIl0wl/lt/z7FN1Lz6uxkXfKBflhM57STrd8E/YKHgVj8n5vnGv21vR0ORmF/I4tKbOURRGQaBlj3mfM33BTYkn1ob71NYs8BPwBFNYPKkhlOXmXBvAeZhUotXILYKtKAv+6EDcmHWOO/7+HmexpC44QidbVCu30ZTDR5brvssPeO/agrjwn/JkpafZNlHS6tWrVeBXkK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpvEYFtVwBBiu6bSpBBjt2MxfhexRDUy3HobQjYfXHE=;
 b=Z8oRX+bW83zjcxSgzI74efOdqNG0OEhyeWO/YQ6Hq7VDYynHJIBDJrZE9KjCOniZvU0PGvPDcDRmCa6FzJqjXeDY4Il7Yqj3xwcu71Yh6FXQrUVqiV02lHAuOmCxw9taM21cn5qryReTtilIhJCsp/1IO8uyLTFygkwrUNZ3mCRPjxPI03BfzxngUCg+qRPY8t6tx6hOLHjqeTO4WDTj+o91PrOw7D6knbwYFkaCR3dXOY/IhA7Ps6MBLtjgZcHTMS8bpjT602PzcILy2QuP/w1ixT0+qfuUTjlRhIZWw5wMTO6uLuVXv2bSeV9it8Ho4FVXhbhV0oDNo5+Vu5RFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpvEYFtVwBBiu6bSpBBjt2MxfhexRDUy3HobQjYfXHE=;
 b=i9tjzEzAjm5o1cHLpWxbebuwHbtGCwexYiZ3sw04wMOQMVOPHRSlVeD1ac09eoLGTthVtEFCnq1773RhViVuIArd/tHRTzC/4StLAAHAW+MuHQZi1xycmakU/niBwuGlPRG/AC0BlA170BDF6H7v3GBDDnbw6GolNf43hri1TpE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:21:37 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:21:37 +0000
Date:   Fri, 21 Aug 2020 11:14:49 +0800
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
Subject: [PATCH v2 05/15] regulator: ltc3589: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111449.7cf580f2@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:21:33 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f36b334-ea89-445b-553d-08d845815028
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4617E5A54AA72CA10D3BE5EFED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pZv7C7gEbTzYBDAAW1aqGiVWuqBnOqTW2UyBqfpExkHWwXGcPkD2bG9j1V524tYsoD1jz7joQs41crFYaXN18umnzh4T5JUJS1FuvXhTcTSrtYerMfQlmo6DkMGGnAzf5/JUXBe5GWWtG5hTouvqomg9FR8ffR6Ul+PoqNsRogwG6/3PWVmQ+7xKlQx+h73JAtX3NkDroRl+It3vWl6sR8Z6xY29hs9idgIFWeJ0nJdnWItzyzgJiPrCUug+az48+iDv3ak/MeCV1XwVh8qSCw9Par6rsu5WxpFLozwxaAmsjtXIyyl+SoqrXPrFkCMqlqe9JfPAhgQrTlPAFfOWKdNlY7/HK+GsLHQVnG33XrrOhendko0momQmaV7LxwR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: nLfNFiBsNdTAL6TVxLWekW6elfzVstuIVt8vlebCbvJK9JS16EmfVGA4SbWDCOWUGdNIJ9VgMZl6gBcmistCQUEok57h7mFrhhC1sV9LBuqf61vTq/5IR7kzxrkgIkhx6VaKSdq7qnHw6YdwjYtA6DNjHcnzW8zt8Me0aMdeYlf8tQY/wKWpQ5aLqvD5xbVKwhHVlDAbZ6jj+FKpg2dkKEmx3k26z++ijwJQM6bIvyqyNVB9sDspaYOow61PJ4vT/baEa+b7mMZkh2m8DoPUmyef6p0f09MTluMxOkHkIZu59cYUQwMeXDIMhwQ5zuq1ALpQgHNm5OTLKvQvTMmVd1YJI1fhNQ4FA9qmexdvd+l8vB46BuxxCwqK/QuSuvc+cGch5FuJhW90+4E0Slywm3in4hyb+Um9/Fy1vsbUX5C+uQRUU9xTRfSD4h+gymzImCNIcy/YE0cy/S4bMtMRpEQwkB99Guhhy5hXRXwoYyRqf4GmLgIJxx9RsLDHKyBxmym0XC+pFZU+GCid5vmf5MIQv/121cTEwFTykanUJAMV3r7s6tHauZcj0jN0nVf3kZ483KZm2SCsOdBI6lCOkUN/1u/4ZVQfI55r0E34oupymD56iUV3aLb/xy6LXZ8PKOb1mmFyU/KNeRJcJLdNgQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f36b334-ea89-445b-553d-08d845815028
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:21:37.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pP3PWr9vVfDjgcbVoPpmLGtVwzMWSmGB3vrSpXX8SguIvWCw+n5GAo3XydabYpe0M08ZVHildOlzBAd5fY3chw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/ltc3589.c:460:34: warning: =E2=80=98ltc3589_of_match=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]
  460 | static const struct of_device_id ltc3589_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/ltc3589.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ltc3589.c b/drivers/regulator/ltc3589.c
index 9a037fdc5fc5..fa563aacf742 100644
--- a/drivers/regulator/ltc3589.c
+++ b/drivers/regulator/ltc3589.c
@@ -457,7 +457,7 @@ static const struct i2c_device_id ltc3589_i2c_id[] =3D =
{
 };
 MODULE_DEVICE_TABLE(i2c, ltc3589_i2c_id);
=20
-static const struct of_device_id ltc3589_of_match[] =3D {
+static const struct of_device_id __maybe_unused ltc3589_of_match[] =3D {
 	{
 		.compatible =3D "lltc,ltc3589",
 		.data =3D (void *)LTC3589,
--=20
2.28.0

