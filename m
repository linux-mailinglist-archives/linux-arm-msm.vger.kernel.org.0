Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFDC24CB6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 05:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgHUDYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 23:24:34 -0400
Received: from mail-co1nam11on2076.outbound.protection.outlook.com ([40.107.220.76]:37568
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727040AbgHUDYc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 23:24:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBf95kVgF0sHMz09iUrqTPLF02sEltg06RmdjBU0jpCGhp/aMJhFfUsu375aPllzxPFmCXz2+z92FycNvaLL0IQbxFzdlNULSqiCVpz3XhJf/aoLWai7QDHNV4AK7EcBBUX2avCwApTice/WFQFz+K0v56qoK/6TPEFBcGHFi6AuheqdXjBw4CLmEikvNKvbLBEb/ghSfiW7eKn8wl/li8Bntj/DJoXvXJVKnrrke5R/N9yvj6cfm+7TPwcxbmc4TqdD8dj44F3cx3vv+tgkNNZwdMxvxT9O1ifXwhfag3y5/Dsq9QSVhey7PA1ORPBeoyV9jo+EIggRFh3cA/gTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tj3s7SRjf75wzTK5bzLKsJPYFVtVnMBXOPHUf/ySg8=;
 b=QrO0kv01iALsadFmnsq8EFoBhF6BjebpcVcnAVcVrTY2O3X1XFUy76RH3Xr0FxZMvTS3MuzzSwb5hP5m8Bl5UzcK9OMBEaWNWil30znq24S2Yv2VUuIvZa+KxYaiUDxFz/A6Kg0fAavRqHJckvCdlQh4rZCYvjDPx+mu/SrfD3W88+SFcajO1Ij5hLtOiq2y34Huwh8oRIrUIDioJDmdKsJT+M+2O2UU6TJYlmh1Ub00BlVxc4Wm+Iigx5XYvfcyddUp4YUmA4lFCWuJ52dEFYS9WaHLgw3CGRn1Xv8UAYLZKySN/TE+yzfH9KaGbjMTnvMXXgMZXAIEiPBxMyhREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tj3s7SRjf75wzTK5bzLKsJPYFVtVnMBXOPHUf/ySg8=;
 b=bOPQowneyyyXRaahzZB+mnbrD+75b5Ud29+w0aFO7DGjAX6ZwVjP25tnduGgbsHwezGqYPsDWkZxuqDsIPSbXd+OTo5xD/5cDLGDAVaZv+bDB4KlftL/MRpLCfNTmsJIDxvpMA00OOxnOzbmlXsdM6hzjzRXV8ni8kpETug16sc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB5308.namprd03.prod.outlook.com (2603:10b6:5:242::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 03:24:31 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 03:24:31 +0000
Date:   Fri, 21 Aug 2020 11:20:09 +0800
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
Subject: [PATCH v2 15/15] regulator: tps65023: Fix W=1 build warning when
 CONFIG_OF=n
Message-ID: <20200821112009.58ee8511@xhacker.debian>
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
Received: from 255.255.255.255 (255.255.255.255) by TY2PR06CA0043.apcprd06.prod.outlook.com (2603:1096:404:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 03:24:27 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 199c562a-186d-4f10-79d4-08d84581b7ae
X-MS-TrafficTypeDiagnostic: DM6PR03MB5308:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5308B778A5332F4D2EA75A2FED5B0@DM6PR03MB5308.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ku+7YAOY2Z5d59qAsjCEHsnyENGCwFBmqhsM22JOGp/dOvFpymVJOIElffyEoSPMq9x8uL/EbF0huisUCBHLNh+lZlSQ2lbRsaPM1ZUzO41r1O0jzZtdgdyUk6YOC9+W7NzOosyOF55DjfT6GfS+rP+GVeRZP7ZmwFLnE5agqTrzuVWh7Rcu41GsRNz5MUjtD9m/+N2tJvTXVueZ8JM6Ul8jsHtHfLgxCturkAorN5iADvXoJmsVNkel7LJze5uhbVqT4aMEuJ+Z7fcsZd4a/KMGP9G3GeXvOOexXgY26eycEnIQ3NqPfLOObgdZpsk8yOidDtgAsdrOOQceVvFPMSkD6FepOKPB1pMjIXRU8uZ1qtQ+FkFFYP47A70gbzk/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(9686003)(2906002)(478600001)(5660300002)(66556008)(66946007)(7416002)(316002)(83380400001)(16576012)(66476007)(110136005)(8676002)(86362001)(956004)(4326008)(6486002)(6666004)(26005)(186003)(1076003)(110011004)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HLULFGt7TmQxigPKqASfsQ9bqfdplMpHE+m5iMkXUvYTv4MMOulhBujJ32TctsOglR9CjIl3VyanjiKWr30KrZ8Mobb3FUCtyLJE5DDTTC61vOqy4TggqXHzPo3cnsFg7AkuaxtdD1EAoZ7UBMTUXZOa9UoAsFYeUlZJqj4PjlLI1WH8//anJSnC6N9xm7nJ/LjcwnyocIDFpwg84M+sd3Z0KWGJBL5gbto+SOoIZTwChSGtHpfyZSRFC7Hw5SSXvQHBj+x+0C9PL3JsgtR4CZBMYiK0QlQtThbLsiYAI7I+fbBGkITEcg3+4AXvSx8gfcxy7FtcFZy5zDb3CYKF2M8VEjYR/3yE97JI2IiIbzo5UboZIpJcTotDmy28J5wrHnx5sXXCErF/7LDJGFdEbwSSvnEzS8mCr1vJ9TEP0GdhwwNGjmPtZlx+P+wtw+KbH6/VgeDQOvh8PyVdf1kil8/2Oqgmf11ln8vYkLyTgeLCYyFc4LZTmEBflE9Cor2FF7TKeuZvcvubZyqfC+0fMsuasd+k7PoRsdXHgv5/xqUNozFbIw1vz815oGcNyv7bKnEXKzyPVhuOaE+9z1vpbFSTa8evLw30sM7H75tnwwoxcsOEtBUstPz06e8ti2CUnSQPifkyhSRQuPxDVmUzpg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199c562a-186d-4f10-79d4-08d84581b7ae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 03:24:31.0326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkeDlqZo7hkTLjgMHUDm2JksuP5NghPLz3bnsQoGO+r0MY14gSC5fFMpKz4dc8jRNnkOpNSbTrFmtzobTOyeiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5308
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix below warning when CONFIG_OF=3Dn:

drivers/regulator/tps65023-regulator.c:319:34: warning: =E2=80=98tps65023_o=
f_match=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  319 | static const struct of_device_id tps65023_of_match[] =3D {
      |                                  ^~~~~~~~~~~~~~~~~

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/tps65023-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps=
65023-regulator.c
index 795d459ff3cf..f25806531c7e 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -316,7 +316,7 @@ static int tps_65023_probe(struct i2c_client *client,
 	return 0;
 }
=20
-static const struct of_device_id tps65023_of_match[] =3D {
+static const struct of_device_id __maybe_unused tps65023_of_match[] =3D {
 	{ .compatible =3D "ti,tps65020", .data =3D &tps65020_drv_data},
 	{ .compatible =3D "ti,tps65021", .data =3D &tps65021_drv_data},
 	{ .compatible =3D "ti,tps65023", .data =3D &tps65023_drv_data},
--=20
2.28.0

