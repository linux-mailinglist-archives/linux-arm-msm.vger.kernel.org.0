Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8893824CB40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgHUDV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:21:26 -0400
Received: from mail-mw2nam10on2044.outbound.protection.outlook.com ([40.107.94.44]:29441
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbgHUDVY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:21:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g12RjynUQGtBLPtvLxofzMQ45pD/S6PalFFN1S+FWp4KYPBQnsGQizSdPlhzLmU8grbWU4Vkg35gLsktIt/yGmvW/aDpaEPGUQcyv/X1V/OeTKwJB8+gLgkn7h0S1CNJAFxnLzuMu9C9rA/nygB9/u3YPzY5dZ7sAqGkHvzv5Z8YeKHDcz/bcJMNcinxYxAxTXmQaLL+HrPKdm6O/XtSBdNIy/ziCe2Xq9B5iRvJRUyXfob4O+w9WgoxuhfHLXvmRh5zK15AC9nxL0A+4v/C9HKk5oiMjKxkag8r3VbQ89vH70MDKUYqldhch9tlNsIKUlFG1c9dnhzyvnQR6wEHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohvAV5OOiKl0ReUg5vjlQe6z3tHePAnxgumjPGXP+nA=;
 b=Wy/zoEJ22so7Zmr0q1dnzJkUgqZKqfEdwxTAlWT8j/CakFvtvVGVZmi1G0goP7b3RRt84Ee5JyRUl4ZlkZlHkDqxvFO5X4ZYRvXlk7lkMOxKlOiR7RFXgOahPjMnp1tAlzbfGMlgcXYCOSFu3eWqhVc/u+1lo5bDLNTIYHf6f7y5jzuxo5U5e2wL5UMDhbEL7DtmgwLK9BTxdIv+taan1FATSilJd0pSXfz28Nt+1h/h6CZaM6tS6Yqsn40Ilr8sYwvlKBaVpIqX4+hW9sz/B/7HGD5vGYPrlCb0lmdwjGhHjKXjPQ+zaBLSYRlsX3b0Blu6g8H19GnpNi48WUUD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohvAV5OOiKl0ReUg5vjlQe6z3tHePAnxgumjPGXP+nA=;
 b=HOgnok7cLW6PETClgThYGxtaZbX5u45wc85UYwGApklYDlg0c9uaBWDb26U/TFG9+/C/S2Mel7ID3U+lzAp+2N/zdT0syCpSt6ZMjX5D54Uxr8lyoStACUhf5OoVECHwfogSg+hEe16F2Bf7y0ngCcM9QRY/qA3t/1t5xPb/zNo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4617.namprd03.prod.outlook.com (2603:10b6:5:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 03:21:22 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:21:22 +0000
Date:   Fri, 21 Aug 2020 11:11:35 +0800
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
Subject: [PATCH v2 00/15] regulator: Fix W=1 build warning when CONFIG_OF=n
Message-ID: <20200821111135.0b958d3a@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:21:19 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e186b9c-fb7f-4160-b199-08d845814771
X-MS-TrafficTypeDiagnostic: DM6PR03MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46171CFF3EC2D841D0E105AEED5B0@DM6PR03MB4617.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jL+vUKPtu0WzZXLBfVAFwYrjyV/DbI2qwj0LlBpxljRqOyOb3+/nFj14hpvALux63uX3Min0h0lZg6aPsoUOVRfXdWJAvrVEm8cZLQoOQUXH6C7PnHbcc4guKehD0lDHML0EFnVT9NO6Jc9N+QzCWVGc4Nm+GFzWU1VyB4yjw1Sl3sZJ4u04UbmHTXk4cIt+vS+6ITSB8nNz0JP1W0CKyDwTuNW+6hUmkMQMz0PpNYE1pspvAo9T8eLxyfYibeUqhvvlv3sS/9vU2J7ESC+spCjftllf8O+dBeep7AB7towvFoTK9EcJW7/nnsp0b42sY5EPv1uB4dVzLT4+JRn+3juZtYZTniUiM7GupOwm2YcwUkPM0+5ByzhWjvz45mik
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39860400002)(346002)(66946007)(478600001)(8936002)(1076003)(7416002)(66556008)(6486002)(52116002)(110011004)(9686003)(4326008)(66476007)(8676002)(6666004)(5660300002)(86362001)(956004)(16576012)(186003)(316002)(26005)(110136005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: AT2F9uteWrhkTMx+5TNZV+GMlHXjnsat8nVlCIgCDAzjGJ0UyXvo85jqwVCFs5tDMSrszb5RhPte7XaO7Cluos/VgqJzqel9UlEdnIbB+33Q5OKmxgQQUIXONZV70e4Z0rBF2Wow4FitccY02FA5CMM63/zU/d71mDgUfFi6FwP8juMReXyTSz2gZbYUxtwv+BVnrODdhS+u2PhZwhKnhkjzX135h0dCwnNdE9ZbsqE3UpLFHQ3vqCSBL0vj4HpEYgDt1prsJNAIyFjhfYduUk3s/fDwDSRLjlqgOgCyStJQdKWW5MOALI/9wsvMqwNF2XTFxsJdl3YQkNmkc5HoA2mNOmDbkdQzTOdVccr/o3rt4sw4umSK7pw9YCHT8RyqrchtlquV4nNoSlDShUNwlIDHwKaOwTn5Uj6lLcoL/jdoubo6iartV+jUE/RwPnYv1ymLxwebVucymvKDlNWO+4pCeuMI/0tnf6KOe4OLfQ7hoo3zUN9AyNEjehwdISiiU3IIycVLVLJi/BsCaf1C8nahkpHjmAzEeR8sxxiE/QFsMdLN7cF8LPg7cRT7umjaIy1W18eNJQDj2ERwp4aMMb9a+qutepjLzmiEDaWurlZyBQyGlZ1ljBEmXHOavoXu0gj1sGUGhlcL3GDewCxzrw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e186b9c-fb7f-4160-b199-08d845814771
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:21:22.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbQ084ZDwM7t7LC2M+uCuMmaoiEz46r/AGB6Drh69r0Q6OJ6dJwb9kTX33etS6S7P9PSqAk0hbKLEM99kg0p6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4617
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixing W=1 build warning when no support for device tree is there.

Since v1:
  - fix the warning with __maybe_unused instead of CONFIG_OF macro
  - add 3 more patches to fix the same issue

Jisheng Zhang (15):
  regulator: 88pg86x: Fix W=1 build warning when CONFIG_OF=n
  regulator: da9210: Fix W=1 build warning when CONFIG_OF=n
  regulator: fan53555: Fix W=1 build warning when CONFIG_OF=n
  regulator: fixed: Fix W=1 build warnings when CONFIG_OF=n
  regulator: ltc3589: Fix W=1 build warning when CONFIG_OF=n
  regulator: ltc3676: Fix W=1 build warning when CONFIG_OF=n
  regulator: max1586: Fix W=1 build warning when CONFIG_OF=n
  regulator: max77826: Fix W=1 build warning when CONFIG_OF=n
  regulator: pwm: Fix W=1 build warning when CONFIG_OF=n
  regulator: stm32-pwr: Fix W=1 build warning when CONFIG_OF=n
  regulator: stm32-vrefbuf: Fix W=1 build warning when CONFIG_OF=n
  regulator: sy8106a: Fix W=1 build warning when CONFIG_OF=n
  regulator: qcom-rpmh: Fix W=1 build warning when CONFIG_OF=n
  regulator: stm32-booster: Fix W=1 build warning when CONFIG_OF=n
  regulator: tps65023: Fix W=1 build warning when CONFIG_OF=n

 drivers/regulator/88pg86x.c             |  2 +-
 drivers/regulator/da9210-regulator.c    |  2 +-
 drivers/regulator/fan53555.c            |  2 +-
 drivers/regulator/fixed.c               | 16 ++++++++--------
 drivers/regulator/ltc3589.c             |  2 +-
 drivers/regulator/ltc3676.c             |  2 +-
 drivers/regulator/max1586.c             |  2 +-
 drivers/regulator/max77826-regulator.c  |  2 +-
 drivers/regulator/pwm-regulator.c       |  2 +-
 drivers/regulator/qcom-rpmh-regulator.c |  2 +-
 drivers/regulator/stm32-booster.c       |  2 +-
 drivers/regulator/stm32-pwr.c           |  2 +-
 drivers/regulator/stm32-vrefbuf.c       |  2 +-
 drivers/regulator/sy8106a-regulator.c   |  2 +-
 drivers/regulator/tps65023-regulator.c  |  2 +-
 15 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.28.0

