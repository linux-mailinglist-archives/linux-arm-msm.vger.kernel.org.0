Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFD612A38A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 18:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfLXRfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 12:35:42 -0500
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:64430
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727453AbfLXRfl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 12:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x41aDXJnAlxs0KStGVeTAshmH8fX6SjrjGl+PROCJ5s=;
 b=5G2KSLeOkNh32sWY6t8nKrMvXiJFXLsVvjy8S/7uBuZnmW3l4p6skehu5cWsnSPgXyd3KFXa3fRCDGvYRx4N2pXyjKtdrThvBDH4EYGMuZ6h9lq2l7EK94Pl6u3mTqCeWY1chhfvLoyJbR+1E3RnUrH+w/RO2eKnEpXPFquxcVg=
Received: from VI1PR08CA0208.eurprd08.prod.outlook.com (2603:10a6:802:15::17)
 by DB7PR08MB3178.eurprd08.prod.outlook.com (2603:10a6:5:24::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.16; Tue, 24 Dec
 2019 17:35:34 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0208.outlook.office365.com
 (2603:10a6:802:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:35:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:35:34 +0000
Received: ("Tessian outbound ca1df68f3668:v40"); Tue, 24 Dec 2019 17:35:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0b3b07c51830b0a
X-CR-MTA-TID: 64aa7808
Received: from 2398bdd0a748.10
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CFAC20EB-812E-4C75-BACB-8D33AAA07E93.1;
        Tue, 24 Dec 2019 17:35:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2398bdd0a748.10
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Dec 2019 17:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAmqDfOKIwXHvLye8tTgVNFmxEUb8nVglGYaBPxAQWfUytqZTLXvsZA1t2WimeXC06Ow6HUKY3iJ59b1iK9OKxESB8gbEYCR/9Xxs4aP9gfxdvACBsvXC9e6zmp+stcCSsW2ZiCF14xdE0+uL/zg9wjXe1iSmpfuQA3B1K/H6yeThymvnHxQtWXfDnVM1quf3vDXOlaZetI27jiBYNepqWhkk5DjMwJUGD1aOfM3bQ4UETb0dZ9Snw0ADNKljo02LRoYb1s7nIICJ7JzFZ1Zsz7u95QyJXcwK6DIuXAT8X+AT2pYsgzvAx/4LNWgOhlJ7ym0oVkYzS/uSeTRH1aF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x41aDXJnAlxs0KStGVeTAshmH8fX6SjrjGl+PROCJ5s=;
 b=OstH3Ssgg6gQjSjVHWynH082qFl+btd46KgaatGga9+cAU763Rqn1fIu+Yny/EvVU+9O+DX55pIN9CTncDXahy8x8fQ8tukajLVSYUQhfJ2JSpYS6vQfNn/cKuPm/0aA2EwXxiC41iIVs7CS8B3EHinslmKgz5jOO2o4wem8WRn2lYAHzSZl86y1YnNC5dwco3iKumAfpCy+SfreXHF0gSx0e/EsbaPbtV++7GPCclu6+i4jRz6b1PzAiZFe/nE8hYmSbt9dG6pfUCvdFJRVLYBBKppticTJUcrgeaXKZ0MtqDBdDV6s0dYEoIHveCOsXTNYvYxYvzekjKQ8TXBJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x41aDXJnAlxs0KStGVeTAshmH8fX6SjrjGl+PROCJ5s=;
 b=5G2KSLeOkNh32sWY6t8nKrMvXiJFXLsVvjy8S/7uBuZnmW3l4p6skehu5cWsnSPgXyd3KFXa3fRCDGvYRx4N2pXyjKtdrThvBDH4EYGMuZ6h9lq2l7EK94Pl6u3mTqCeWY1chhfvLoyJbR+1E3RnUrH+w/RO2eKnEpXPFquxcVg=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2672.eurprd08.prod.outlook.com (10.170.238.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 17:35:23 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:35:23 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 35/35] drm/msm: Use drm_bridge_init()
Thread-Topic: [PATCH v3 35/35] drm/msm: Use drm_bridge_init()
Thread-Index: AQHVuoB09eGRc2nWQ02DTmctwXsGfw==
Date:   Tue, 24 Dec 2019 17:34:55 +0000
Message-ID: <20191224173408.25624-36-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a939bd2f-c8dc-46fc-f824-08d78897ae6b
X-MS-TrafficTypeDiagnostic: VI1PR08MB2672:|VI1PR08MB2672:|DB7PR08MB3178:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3178648F4EF80396DD39F4DE8F290@DB7PR08MB3178.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(186003)(26005)(7416002)(52116002)(6506007)(6486002)(81166006)(6512007)(81156014)(8676002)(8936002)(44832011)(54906003)(478600001)(316002)(6916009)(2906002)(4326008)(2616005)(36756003)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(6666004)(71200400001)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2672;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2y4MietvQ/63kmWjWiPezqXbUt3tQPugR5x6U82gFaxq7kGEdUCbGNjIVzgHYKxb8grWoYjBxayU3S584Z0xGPt8cIKSI7Ye5Ye1Z19c5V88OGDDOGxwXDYi/dOccyzUXTGX7eHCDTWVrbZ5J4xWXOqw2h8q5n5ibf5j9+IqdUhnjrJ6TWWsQYiVTC2hThAIKjsM8c6R/MZj9tm0hePqiSV+dIKtnj0Q8hAjPXi/Z7JuRkMoCgPvSrCZnsVlfQ2Bqo6F2Edrv/RAVlveuAMIQnIsHtgm8/bSVNgTwjvC7AGTqx+jwbhRY3FkQ7V2kHAAas9Quiil+2j+LFVZ1GzZcyOSvpQU3IBMBgMelW5Siv4uF4y5ufTzljiWISt5sOC7tBjWGE8JWe9m+3NE44Kl5JEx1NJG80j7eHAulBk97COEmFSkoykprblyIyY8QWnO
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(70206006)(81166006)(26826003)(81156014)(70586007)(478600001)(2906002)(1076003)(6512007)(4326008)(6486002)(76130400001)(8936002)(6506007)(54906003)(356004)(6666004)(450100002)(6862004)(107886003)(316002)(36906005)(86362001)(336012)(186003)(2616005)(26005)(36756003)(5660300002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3178;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 90a97138-b67a-4808-a6ed-08d7889796f0
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lnzuBqByHndm8kKVrgHff89//fm8m+GFphDV+dvEwoxL6WEQ4jFFHdNAT+EGE0ExpegJCoOEx8Ai1VX9G/YIkQrprHH1ZVPszC83WOQwJV1SsVjgbaKHzoJipsQpOlylu1Vx1O1Gl++F7+ce56LA8ni0ag1qh2vkY77BbUb7uI2n1kelkRN/ZIbQBuYRO9IA329YzbnZOIm1n8DXeq3RNGVRElb3ye28dgl4Y0Mpt6gk1SBecODfYI/cceliiisa0hS8cnpXqDgh99o3QcvL8NTgI70YvPlWtr1xikJWL8Xndpmwqw4iignc+aus24BJ3QA56jXMHAp6avBffe7aFxwhvUwfh1wdvqZ0x+VDyBm3VO7uG80Lf96CuLedxLUCoR/aAfKoQxNuMmWXbUkT3vEX7mnpZ/3qBJfkCeKZtObvK94uGZLcl3JI1OalKTaA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:35:34.1823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a939bd2f-c8dc-46fc-f824-08d78897ae6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3178
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No functional change: drm_bridge_init() sets bridge->of_node, but that's
not used by msm anywhere, and the bridges aren't published with
drm_bridge_add() for it to matter.

v3:
 - drop driver_private argument (Laurent)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 3 +--
 drivers/gpu/drm/msm/edp/edp_bridge.c   | 3 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/ds=
i/dsi_manager.c
index 0fc29f1be8cc..058f8f9a8535 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -662,8 +662,7 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	encoder =3D msm_dsi->encoder;
=20
 	bridge =3D &dsi_bridge->base;
-	bridge->funcs =3D &dsi_mgr_bridge_funcs;
-
+	drm_bridge_init(bridge, msm_dsi->dev->dev, &dsi_mgr_bridge_funcs, NULL);
 	ret =3D drm_bridge_attach(encoder, bridge, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp=
/edp_bridge.c
index 301dd7a80bde..1f1cc87d0dd2 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -95,8 +95,7 @@ struct drm_bridge *msm_edp_bridge_init(struct msm_edp *ed=
p)
 	edp_bridge->edp =3D edp;
=20
 	bridge =3D &edp_bridge->base;
-	bridge->funcs =3D &edp_bridge_funcs;
-
+	drm_bridge_init(bridge, edp->dev->dev, &edp_bridge_funcs, NULL);
 	ret =3D drm_bridge_attach(edp->encoder, bridge, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/h=
dmi/hdmi_bridge.c
index 07c098dce310..ed62d0822615 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -285,8 +285,7 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hd=
mi)
 	hdmi_bridge->hdmi =3D hdmi;
=20
 	bridge =3D &hdmi_bridge->base;
-	bridge->funcs =3D &msm_hdmi_bridge_funcs;
-
+	drm_bridge_init(bridge, hdmi->dev->dev, &msm_hdmi_bridge_funcs, NULL);
 	ret =3D drm_bridge_attach(hdmi->encoder, bridge, NULL);
 	if (ret)
 		goto fail;
--=20
2.24.0

