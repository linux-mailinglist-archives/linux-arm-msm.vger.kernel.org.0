Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 890A812A3AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 18:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfLXRlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 12:41:20 -0500
Received: from mail-eopbgr140055.outbound.protection.outlook.com ([40.107.14.55]:40839
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726203AbfLXRlU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 12:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=X/ebVt8YHGyQUkpT5UQiXu3JOl8KXH0Bqo+JJUnlvbMGQVDTnXv9Epde3Ir7HXpAfXMZHBt0MQDo2VO9Ixm6B0N6T7AGytYg1nu62SaZVgzW0vviZKhKtudwLjIeVZz3I4W6Xa0ZLop2Q4dKYkumMXH1NWzgu/nOj3UJoOcPX38=
Received: from VI1PR08CA0236.eurprd08.prod.outlook.com (2603:10a6:802:15::45)
 by AM0PR08MB3380.eurprd08.prod.outlook.com (2603:10a6:208:e4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:40:58 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR08CA0236.outlook.office365.com
 (2603:10a6:802:15::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:40:57 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:40:56 +0000
Received: ("Tessian outbound ca1df68f3668:v40"); Tue, 24 Dec 2019 17:40:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c10677de45ca1696
X-CR-MTA-TID: 64aa7808
Received: from f9466a1bfe07.2
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3724AF7E-573F-4EF7-9CBF-5DCD78F8A484.1;
        Tue, 24 Dec 2019 17:40:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9466a1bfe07.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Dec 2019 17:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqFQUFCfTF8tkh+m8w+ayif8/g4ALYZuAjEDV5XoQr8W26zlDffaJ8bkH+wyi34netPR5ZdISCnrjKvOonyGKKzRd37Ii6AsjyEsBVxTvBnQEudr9I6urJOj/I6ecm+RNfwKrPN6wPyyBO+qwSGBBZAboSpWDxMKit7qIqoINnx+wWvk65iggrmjx6X/rREgdywqd1ofu5iddR6BV6G/ITUo6W4hyAS5G1tiyywoQ08MgLqgkz7sZSANe1uhesbw31h3ZMDrZMUlG5mRQ/GYmN9/fFh7mpNh1DIGLUYXmDyXlwWe5OcxmhQA87wYmqWU2VAWhymC0A8r9Zl0D7EN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=nOa9BRvGz4bkmOEd+oEHqSQVAlEBrR9uz4syv/WRaDC/p31LMZQansmTAZuJXApQzJZkUrXYlnQ18MyG+XvT3viYzdShByo+Zhw2UZEZ8y4qSfC/7PLOR/039HNhpEerMFYzUB3GrwLcRLJL/aFpz5v+Jx56VZc71cIfF6h7yMMjYqjWpNPd+y6fQG/7SD9yO2fv8AmwTnkc7RpMeGD6RDxYEN6QYlnfjk2mf+4A1dw7kUEnPKRKrhJ2biYAoag2aAgYZopZvgMKS+qJz/J2Mh89VPmW3CkC8/9nJ2TuCY9FAPdBRRk2gbm50I+MGadwMkMUfJ+TUXhzm3y0DsaTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=X/ebVt8YHGyQUkpT5UQiXu3JOl8KXH0Bqo+JJUnlvbMGQVDTnXv9Epde3Ir7HXpAfXMZHBt0MQDo2VO9Ixm6B0N6T7AGytYg1nu62SaZVgzW0vviZKhKtudwLjIeVZz3I4W6Xa0ZLop2Q4dKYkumMXH1NWzgu/nOj3UJoOcPX38=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:40:46 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:40:46 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 RESEND 01/35] drm: Remove drm_bridge->dev
Thread-Topic: [PATCH v3 RESEND 01/35] drm: Remove drm_bridge->dev
Thread-Index: AQHVuoFFITDfwI/JfEaH2idcTEq34w==
Date:   Tue, 24 Dec 2019 17:40:45 +0000
Message-ID: <20191224174019.29369-1-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: SN1PR12CA0109.namprd12.prod.outlook.com
 (2603:10b6:802:21::44) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3763305-e175-4494-b6a8-08d788986f33
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|AM0PR08MB3380:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB338002CA4AC4E361049224B88F290@AM0PR08MB3380.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:232;OLM:232;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(66946007)(1076003)(66446008)(64756008)(66556008)(66476007)(5660300002)(71200400001)(86362001)(30864003)(6486002)(81156014)(8676002)(6512007)(81166006)(26005)(186003)(7416002)(52116002)(6506007)(4326008)(2616005)(36756003)(2906002)(966005)(478600001)(54906003)(8936002)(44832011)(6916009)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2672;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dY1BRfpRa6jMQoTq/pEQShAemM4xt4y2M2YpVXBRnLYWftYMH0lwkoTPUCcemPXZFSPtWH/R3reeM9XagUaG8Idolhgvp30GCJCxWD7gLo6/t8IT3z7oPdQ1Vz1pKn/JkpRdoMjCkjbxiXqW0uViWJ298sXBHWR998sbPUgC9PsWBPiaRgjPFA5mq69yXZqRINNlVTjHUojCo0CZuNbQ2f63PzxQXm1fuFPKKG8VsF/Wlxu13X20jG+vCBs8pudQoIP1Wa+nheRjLTbcT5gaX/NIjaWSgTDixVhAL/YVFQypgcic4FFEwodiBkyDys9ZojLBmMxceTrGH1Q5YykMOlloEKj2vwlXa+XplZ4k1q3Dp8SNB6ljRE2mwJ5tsZMBMwMBcO8HXuLoWfBqQ1P7majL01nEPhJLXGW1w4ff9j3Cnd6cRPnKN9sWBE1q7lbV0EcOk/0f8g5qsSX2dSmHfczbsOeJnII7YBJMet0Q46I=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(966005)(6506007)(356004)(5660300002)(1076003)(107886003)(186003)(86362001)(54906003)(316002)(26005)(70206006)(70586007)(76130400001)(30864003)(2616005)(36756003)(4326008)(8676002)(8936002)(6862004)(478600001)(6512007)(450100002)(6486002)(26826003)(81156014)(81166006)(36906005)(336012)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3380;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: d564c367-64a4-476b-9991-08d7889867f2
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6CkisUWuSj3fki2jm0NYaiCVUoqqwXi0ZJg5C8C23U20OXe2iYzSXfrn/In2494mWlLDvILYwQzNrWWrb7N5bNXZbvttppEkrmfxupP/rQcFch1My6wp+BgTm/EYbqakU0eudydG5Zyo+MLG0ledZK7fCwrg3zioRckb5WQYEG3O/b9KWWxYYdc+9m5Nih/6L6JbM/+VOl4cogg6T9gUBKrBOIuGYkDehZkNfQL6QOqfLoiiKa+mxCC1eVyokMJIMQF7JL+J5Q5/JFskhMuHQaYSRbOZDMXcaiuWJHpL9HPIAgta/pwwz6OTh0UBjWDGSjKQMsl15Ley4fl8XrL3EejbfPm5sMyTZXopco4Z2R+VgrujAzLjVIvc5rg3piRCtF7+e4cHOnt8L9arv2MM61flJj6dpQ1eAJSCO4N+Z2aUNQpKrGJoHNGRe2BBTKij3wIQ0hbmbRAy29KBpGmmSp9qjhisMLc+x9Lqs3PPNw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:40:56.1277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3763305-e175-4494-b6a8-08d788986f33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3380
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As suggested in [1], the 'dev' field is a bit repetitive, since it 1:1
follows the setting and NULLing of the 'encoder' field. Therefore, use
drm_bridge->encoder->dev in place of drm_bridge->dev.

[1] https://patchwork.freedesktop.org/patch/343824/

v3:
 - resend as part of drm_bridge_init() series
v2:
 - fix checkpatch complaint about unnecessary parentheses in
 drm_bridge.c

Cc: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c     |  2 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                      |  2 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c                  |  2 +-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  2 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  2 +-
 drivers/gpu/drm/bridge/panel.c                         |  2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c                 |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                       |  6 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c              |  6 +++---
 drivers/gpu/drm/bridge/tc358764.c                      |  4 ++--
 drivers/gpu/drm/bridge/tc358767.c                      |  6 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                  |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                     |  6 +++---
 drivers/gpu/drm/drm_bridge.c                           | 10 ++++------
 drivers/gpu/drm/i2c/tda998x_drv.c                      |  2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                        |  2 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c                   |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                 |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c                    |  3 ++-
 include/drm/drm_bridge.h                               |  2 --
 22 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..009cf1fef8d4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bri=
dge)
 		adv->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
 				DRM_CONNECTOR_POLL_DISCONNECT;
=20
-	ret =3D drm_connector_init(bridge->dev, &adv->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &adv->connector,
 				 &adv7511_connector_funcs,
 				 DRM_MODE_CONNECTOR_HDMIA);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/g=
pu/drm/bridge/analogix/analogix-anx6345.c
index 9917ce0d86a0..5b806d23fcb3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bri=
dge)
 		return err;
 	}
=20
-	err =3D drm_connector_init(bridge->dev, &anx6345->connector,
+	err =3D drm_connector_init(bridge->encoder->dev, &anx6345->connector,
 				 &anx6345_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/g=
pu/drm/bridge/analogix/analogix-anx78xx.c
index 41867be03751..7463537950cb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bri=
dge)
 		return err;
 	}
=20
-	err =3D drm_connector_init(bridge->dev, &anx78xx->connector,
+	err =3D drm_connector_init(bridge->encoder->dev, &anx78xx->connector,
 				 &anx78xx_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdn=
s-dsi.c
index 3a5bd4e7fd1e..32863e3ad537 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *br=
idge)
 	struct cdns_dsi *dsi =3D input_to_dsi(input);
 	struct cdns_dsi_output *output =3D &dsi->output;
=20
-	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
+	if (!drm_core_check_feature(bridge->encoder->dev, DRIVER_ATOMIC)) {
 		dev_err(dsi->base.dev,
 			"cdns-dsi driver is only compatible with DRM devices supporting atomic =
updates");
 		return -ENOTSUPP;
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge=
/dumb-vga-dac.c
index cc33dc411b9e..67ad6cecf68d 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
=20
 	drm_connector_helper_add(&vga->connector,
 				 &dumb_vga_con_helper_funcs);
-	ret =3D drm_connector_init_with_ddc(bridge->dev, &vga->connector,
+	ret =3D drm_connector_init_with_ddc(bridge->encoder->dev, &vga->connector=
,
 					  &dumb_vga_con_funcs,
 					  DRM_MODE_CONNECTOR_VGA,
 					  vga->ddc);
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/dri=
vers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index e8a49f6146c6..c914f01e4707 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bri=
dge)
 	drm_connector_helper_add(connector,
 				 &ge_b850v3_lvds_connector_helper_funcs);
=20
-	ret =3D drm_connector_init(bridge->dev, connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, connector,
 				 &ge_b850v3_lvds_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/=
nxp-ptn3460.c
index 57ff01339559..3999bb864eb9 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bri=
dge)
 	}
=20
 	ptn_bridge->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
-	ret =3D drm_connector_init(bridge->dev, &ptn_bridge->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.=
c
index f66777e24968..4ba4e9d9537a 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge)
 	drm_connector_helper_add(connector,
 				 &panel_bridge_connector_helper_funcs);
=20
-	ret =3D drm_connector_init(bridge->dev, connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, connector,
 				 &panel_bridge_connector_funcs,
 				 panel_bridge->connector_type);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridg=
e/parade-ps8622.c
index 10c47c008b40..c32af9c2bbcc 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridge)
 	}
=20
 	ps8622->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
-	ret =3D drm_connector_init(bridge->dev, &ps8622->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &ps8622->connector,
 			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c
index b70e8c5cf2e1..6ca297d78a26 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_bridge *=
bridge,
 static int sii902x_bridge_attach(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x =3D bridge_to_sii902x(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	drm_connector_helper_add(&sii902x->connector,
@@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, void *dat=
a)
=20
 	mutex_unlock(&sii902x->mutex);
=20
-	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
-		drm_helper_hpd_irq_event(sii902x->bridge.dev);
+	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.encoder)
+		drm_helper_hpd_irq_event(sii902x->bridge.encoder->dev);
=20
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/br=
idge/synopsys/dw-hdmi.c
index dbe38a54870b..99274ca0fdf6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *b=
ridge)
=20
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
=20
-	drm_connector_init_with_ddc(bridge->dev, connector,
+	drm_connector_init_with_ddc(bridge->encoder->dev, connector,
 				    &dw_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
@@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
 		dev_dbg(hdmi->dev, "EVENT=3D%s\n",
 			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
-		if (hdmi->bridge.dev)
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		if (hdmi->bridge.encoder)
+			drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
 	}
=20
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc3=
58764.c
index 96207fcfde19..e35e17b1f396 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *bridge)
 static int tc358764_attach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	ctx->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
@@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bridge)
 static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
=20
 	drm_connector_unregister(&ctx->connector);
 	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc3=
58767.c
index 3709e5ace724..ab1524c00777 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge=
)
 {
 	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc =3D bridge_to_tc(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	/* Create DP/eDP connector */
@@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		dev_err(tc->dev, "syserr %x\n", stat);
 	}
=20
-	if (tc->hpd_pin >=3D 0 && tc->bridge.dev) {
+	if (tc->hpd_pin >=3D 0 && tc->bridge.encoder) {
 		/*
 		 * H is triggered when the GPIO goes high.
 		 *
@@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 			h ? "H" : "", lc ? "LC" : "");
=20
 		if (h || lc)
-			drm_kms_helper_hotplug_event(tc->bridge.dev);
+			drm_kms_helper_hotplug_event(tc->bridge.encoder->dev);
 	}
=20
 	regmap_write(tc->regmap, INTSTS_G, val);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi86.c
index 9a2dd986afa5..8a4e64cfca1e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridg=
e)
 						   .node =3D NULL,
 						 };
=20
-	ret =3D drm_connector_init(bridge->dev, &pdata->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &pdata->connector,
 				 &ti_sn_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti=
-tfp410.c
index aa3198dc9903..76229367e2f4 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridge)
=20
 	drm_connector_helper_add(&dvi->connector,
 				 &tfp410_con_helper_funcs);
-	ret =3D drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
+	ret =3D drm_connector_init_with_ddc(bridge->encoder->dev, &dvi->connector=
,
 					  &tfp410_con_funcs,
 					  dvi->connector_type,
 					  dvi->ddc);
@@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_struct *wo=
rk)
=20
 	dvi =3D container_of(work, struct tfp410, hpd_work.work);
=20
-	if (dvi->bridge.dev)
-		drm_helper_hpd_irq_event(dvi->bridge.dev);
+	if (dvi->bridge.encoder)
+		drm_helper_hpd_irq_event(dvi->bridge.encoder->dev);
 }
=20
 static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c2cf0c90fa26..258094169706 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -119,13 +119,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
=20
-	if (previous && (!previous->dev || previous->encoder !=3D encoder))
+	if (previous && previous->encoder !=3D encoder)
 		return -EINVAL;
=20
-	if (bridge->dev)
+	if (bridge->encoder)
 		return -EBUSY;
=20
-	bridge->dev =3D encoder->dev;
 	bridge->encoder =3D encoder;
=20
 	if (previous)
@@ -137,7 +136,6 @@ int drm_bridge_attach(struct drm_encoder *encoder, stru=
ct drm_bridge *bridge,
 		ret =3D bridge->funcs->attach(bridge);
 		if (ret < 0) {
 			list_del(&bridge->chain_node);
-			bridge->dev =3D NULL;
 			bridge->encoder =3D NULL;
 			return ret;
 		}
@@ -152,14 +150,14 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (WARN_ON(!bridge))
 		return;
=20
-	if (WARN_ON(!bridge->dev))
+	if (WARN_ON(!bridge->encoder))
 		return;
=20
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
=20
 	list_del(&bridge->chain_node);
-	bridge->dev =3D NULL;
+	bridge->encoder =3D NULL;
 }
=20
 /**
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998=
x_drv.c
index a63790d32d75..17a66ef3dfd4 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bridge *b=
ridge)
 {
 	struct tda998x_priv *priv =3D bridge_to_tda998x_priv(bridge);
=20
-	return tda998x_connector_init(priv, bridge->dev);
+	return tda998x_connector_init(priv, bridge->encoder->dev);
 }
=20
 static void tda998x_bridge_detach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_ds=
i.c
index 32e94bcb4a69..276a77c020c7 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -989,7 +989,7 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *=
bridge)
 static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct mcde_dsi *d =3D bridge_to_mcde_dsi(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp=
/edp_bridge.c
index b65b5cc2dba2..301dd7a80bde 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge=
,
 		const struct drm_display_mode *mode,
 		const struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev =3D bridge->dev;
+	struct drm_device *dev =3D bridge->encoder->dev;
 	struct drm_connector *connector;
 	struct edp_bridge *edp_bridge =3D to_edp_bridge(bridge);
 	struct msm_edp *edp =3D edp_bridge->edp;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/h=
dmi/hdmi_bridge.c
index ba81338a9bf8..07c098dce310 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
=20
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
-	struct drm_device *dev =3D bridge->dev;
+	struct drm_device *dev =3D bridge->encoder->dev;
 	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
 	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config =3D hdmi->config;
@@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
=20
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev =3D bridge->dev;
+	struct drm_device *dev =3D bridge->encoder->dev;
 	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
 	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config =3D hdmi->config;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/=
rcar_lvds.c
index 2cf44b91853c..83538125a722 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -622,7 +622,8 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
 	if (!lvds->panel)
 		return 0;
=20
-	ret =3D drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
+	ret =3D drm_connector_init(bridge->encoder->dev, connector,
+				 &rcar_lvds_conn_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret < 0)
 		return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 694e153a7531..695d0898df38 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -380,8 +380,6 @@ struct drm_bridge_timings {
  * struct drm_bridge - central DRM bridge control structure
  */
 struct drm_bridge {
-	/** @dev: DRM device this bridge belongs to */
-	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
--=20
2.24.0

