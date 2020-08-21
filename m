Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D47B24CB4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgHUDWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:22:05 -0400
Received: from mail-mw2nam10on2045.outbound.protection.outlook.com ([40.107.94.45]:29056
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbgHUDWD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:22:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDmjPjDmJURMmJSgwWpDmgoQE27vhONFd376kufMeYIl1P/cdfTuudsVyTd1b4c01UAk7YnmnDnPuThzpMXfkOED9Ju6lYGelv13E3Md7VUWTqDYtHQBf/CgD1RSQreoSv2XccdtjAO+YCufOf692Tcs2rGFSKfI1LqvJfhppmHKolUR1BJWhe0Eayj9jSBLmKogHAS62uJj1TwvGs8ycTu90mPvCB1BGr63gSSIitqA+8xxjUM0ZUwXwVnJ6y+YdSZW/VAcimAFt5kAH8AGno9M3oOOH24iiN8CMbxwzS1pyJnvMZPTsHrWz+hAIkv16af/8xZVVBGAJeVxEwrO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mDWivb176KZlW+P9hfOAZZSmv1v9G4MGktWYC18cH4=;
 b=fG7uMaV2ocHwKp0yzsGDTqeiWOJpZZRcoPxiDY7XIfB3PlUvyk4/UNHod1O9oIvvuiGDZoKKLBBd5imukN5B351p6s+68l5TRQi4vNJSUZR/4h9K4CaqDAJnIKCN5PP1gq9dzB/ViYB5/Qy6Dor2l56j2kWR2M0A0MarnKneSp/4wrCaS5DBecANv1Ns1KJkXqWBNH0k88jyo4sE4GK8ue+6kFNVQD4JbPwB7aftkm0EOdwJHYrckcWDIyZgDIIqAB+oHk2rBEw6KLfQc49y0RUWM4mAOVtgJCTm5q4WAUdxIcte8VG84uuBmkxmKYjesGOLRqobo+NxU7TijodprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mDWivb176KZlW+P9hfOAZZSmv1v9G4MGktWYC18cH4=;
 b=XSbDyjdB7z1finpGKZqjtc+Rfzt60uKncRr50Nnxx3y5vN9zTFFRXIavBvZYdudmJIE5N6wDtBYj4nlglrHctWDWFqqZPLnsOahDybeFLOk0BEuECFwJrFHECuzI19GyR1a3brRW7oIgyc2x4q5Lzqp4Mw7J7iSf5p4ToKH5Z0M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:22:00 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:22:00 +0000
Date:   Fri, 21 Aug 2020 11:16:01 +0800
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
Subject: [PATCH v2 07/15] regulator: max1586: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821111601.26243417@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:21:56 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b05a5f7f-c64a-4e52-01c0-08d845815e09
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46179E2E35407DAE7E6E6F88ED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99NfYGKVtwnvW1pXHoxAhcMAZszplIQK9ynaOsD7WodjWAGwaviTXgtkJCGyD31oTFaxiqqOY5lYZHSN/KkeAk3kIKhOO3YUoFihYVUbd+xn7FFno09DqRXDJZJfr22G8bT2yeOupYKXia+/aSFYZ1NFRhkxMUSqAzK9uPHBhL2jYU5MxycdMIjYMa6iAUWfFmanynIxewQl+iTD1XO3svzFTZrYY6vNCbNmMamOFAGSEkuM+mE2OCkFeHWBVr9fQnLAdYKSnJIrosAMvyYgFp2XGV9Ba4whUlU304NXR7CyZo1KQKl7QPC9Cm60ohOF+g3Wly23pV4CxB428Yln0V03bZnV0E/mCqcTQ/q/aWOKuOl32sXjnAaHWYHTY0yn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(4744005)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Us91wlj3sfidAoiROJnIB8YQnbEpvdVISP+OPU0myoRqAZA3C2RIqlVgDWa20dSlMeSIRNvLKB/u3lRBjx5gqevJEIXsmMwmAsrDP6HY/eXlylIUV2HZaIF0Su+wtYn4fN/vt10N+nmQrwhYbAnln6RJSBsiCh+CgiDf8scDuxfr0/awdKwuZ9rgSXtIULs8eKrAZpr6hIEWIzXFNHBpZ+MhrrkmR1k9TakUMWHFUWIcbN3tq+7cjSBJFpPFiQbFgohLTeBdDeXnTIr5GrckY3vYHm/wOuQCFj49QOsX2tHtO7eKgE5litlgEnvy2U1ECEbqydvwyBOEj5uF5tCBUCMOoPxHPfAdgsESR6lVw7JzsWCPWiip9tTgTp20EuYYbA68znBpl7dBslZG+oHvRxRx8STNibPpqf3MeXS1gttYPnG3t+5ygw2BRyFTEZtsgprjZRrzWEqpNy2lL8ViuQ+OaRGUpsBZHw06Uwc2N8FpFpHpYd3XEJNy6WJG0A8yY8zJmki5QnbA3uk8grSi0MrBGj5cto1vEBNWtbFfyGR7uNpAVkWvCxsyamxn3D8DdueZnT0aUbMoouTX0jyYMOdjfngkKYTUKfSGSe3aCgGrDidmg864eIoYpUOfwVPyIYSyZQzqopmPqD9WNSfCmg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05a5f7f-c64a-4e52-01c0-08d845815e09
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:22:00.6419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeHl/eT55Ue4TZPVMCMR/5BzdZIKjaEgm99McnhHwr3xR9HYqxAaxDWgjed0g3hCm9GtpLHvE4xgJNpZRca1Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/max1586.c:204:34: warning: =E2=80=98max1586_of_match=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]
  204 | static const struct of_device_id max1586_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/max1586.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max1586.c b/drivers/regulator/max1586.c
index f8941025780b..d4958394e608 100644
--- a/drivers/regulator/max1586.c
+++ b/drivers/regulator/max1586.c
@@ -201,7 +201,7 @@ static int of_get_max1586_platform_data(struct device *=
dev,
 	return 0;
 }
=20
-static const struct of_device_id max1586_of_match[] =3D {
+static const struct of_device_id __maybe_unused max1586_of_match[] =3D {
 	{ .compatible =3D "maxim,max1586", },
 	{},
 };
--=20
2.28.0

