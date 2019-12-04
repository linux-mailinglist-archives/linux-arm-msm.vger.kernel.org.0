Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BC6112AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 12:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbfLDLsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 06:48:43 -0500
Received: from mail-eopbgr70074.outbound.protection.outlook.com ([40.107.7.74]:26646
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727878AbfLDLsm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 06:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxo3+RzQSfhOefcNBomfpRFJ4IJWVvT6Vr/vLAaxzWU=;
 b=B1rYgWszkhTJjE2gQVMKWzmn92fQEwWvRD1DPY+MgW2JQtmlzLrfK5gvjfsyjmXbZOhzxj679psQl2UQw0Qt72+Xra1kXFBfVIyR1eDh+u3yuTnC/QZQfdvPdB2GQiNWJIFABbO9qQYRral+z2HANrQoQVH9kOMvVe1Y8THzYKU=
Received: from DB6PR0802CA0033.eurprd08.prod.outlook.com (2603:10a6:4:a3::19)
 by VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:37 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by DB6PR0802CA0033.outlook.office365.com
 (2603:10a6:4:a3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:37 +0000
Received: ("Tessian outbound 224ffa173bf0:v37"); Wed, 04 Dec 2019 11:48:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5acb59b5d3ab0914
X-CR-MTA-TID: 64aa7808
Received: from 27b0b5ea6d36.8
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6BCBC33A-A306-46EF-AA00-F67C455BA3BB.1;
        Wed, 04 Dec 2019 11:48:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27b0b5ea6d36.8
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Dec 2019 11:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSyJIHM/g84h9uPKgoy4iCKjJx+I+PniyVmIpWES8rEXFfUOJswmIxH4wGhu/kjk+2IrWRag/FGcTPhRGLUP37meYRfjwui4jVrSpSumxAE5biVVnCXzZZrXjMSubeqQHAL/CCu0uMuLPbwNVvm+Qxjg612EJJaASpsg+0B6HpZffGbAxmsD7fENPKZaHJKOiaEvF8JSSxiotV/CmBgTmiQVy97akKjGpY+jUMg3zkTtxxNOf29r/m9EvOSTCusn5vSMsbou6yddw0OV8VrVVmVmx6Q4VoDVdWT9rYf5Kom83qYiALMw2p/OkMll5dB3O0ks26s4NEiGwpgyfRMnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxo3+RzQSfhOefcNBomfpRFJ4IJWVvT6Vr/vLAaxzWU=;
 b=ca6vJvTuQ9ICiri/nSY8O8EGGWMtsR4zfIf/bWkAfwqe2wpgLNGk0709jRdwXl5ch/ssm5BQxo4vSM20JYTXcvmkxpSRVLRghWiXpUQQqrywxvpSsizW5YSbrlNMsm0RVhtOjlfPvZWxjoMzAROWjNuAoAXbNHTui+4HSZTz84n+//TvNJIy+NxcsDd70L6wHKhUW8i0UFEUN8OEU+uqzE0zgqKk1rZnNUmKhimT6Et3znlfU1XRLDjFRzxPaOBRqp9ak0R+9/OUa34nGNEX1OW9Korvt3KiS/Tp7yMM3cqoyECuLMcGs7paJ0rbbdDBmy8k/rRx86cyVhmBhEkOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxo3+RzQSfhOefcNBomfpRFJ4IJWVvT6Vr/vLAaxzWU=;
 b=B1rYgWszkhTJjE2gQVMKWzmn92fQEwWvRD1DPY+MgW2JQtmlzLrfK5gvjfsyjmXbZOhzxj679psQl2UQw0Qt72+Xra1kXFBfVIyR1eDh+u3yuTnC/QZQfdvPdB2GQiNWJIFABbO9qQYRral+z2HANrQoQVH9kOMvVe1Y8THzYKU=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:26 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 28/28] drm/msm: Use drm_bridge_init()
Thread-Topic: [PATCH v2 28/28] drm/msm: Use drm_bridge_init()
Thread-Index: AQHVqpi8TVGRoIDoh0OFCoA0pbs6IA==
Date:   Wed, 4 Dec 2019 11:48:25 +0000
Message-ID: <20191204114732.28514-29-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fafbc93d-cef5-4894-0d31-08d778afe659
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|VE1PR08MB5215:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5215888B6227D6C9B826155A8F5D0@VE1PR08MB5215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(5024004)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4624;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Lez9SUM230WUagT5ubKBLA86pC51KWmbiO8LPtuTEmv3r1p+zwBFKqEh6p0eFOoF+lZ0DQ1a1gryVTSfUUSRCGH9kDuq7BOP+1VygsvpwJo5CAAFeO77n2JOrsG3MzdM7+C5RMEWGxyEWDOUbN1y4rAO5BEHlU8wAtzTooWWwSAMefzZv3FiJiqYHlwSS7mvqg70kj9t0hnRe17W5ONZiAagrwePC8oWdHkb4E6aKEZ4uIAkj18A2eKGF7Htkvfr38aGC4+YSQ8QzYRdJFrizZ5GoAiPnS5RUlwncuFunW/jFvLENsF6ojXPVlBtawPJHexNGCx/qn59T+2o3CQY1S0kdbde1q1Gc690zxg06v3E2i8OMhQinD8EGLmw+3F1sSr9t5GrQFNzfIj3XaUwWyFje1+lyKBhzkSSRVWO2VOLFxUaonJU3UjU+IdwaSkQ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(189003)(199004)(14454004)(6116002)(36906005)(5024004)(50466002)(22756006)(478600001)(23756003)(3846002)(2501003)(81156014)(2351001)(8746002)(81166006)(8676002)(8936002)(336012)(50226002)(26826003)(1076003)(76176011)(36756003)(5640700003)(11346002)(2616005)(6862004)(25786009)(4326008)(450100002)(6506007)(186003)(26005)(102836004)(70206006)(86362001)(2906002)(76130400001)(54906003)(6486002)(70586007)(7736002)(356004)(305945005)(5660300002)(99286004)(6512007)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB5215;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ea17270-feb6-4e97-0518-08d778afdf5f
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlMvxF+RZBIeH/lAhCINEwsbdkHEeE4SPf4UCslnokKR+s/lCJardcNfd1TdOmG4p6ZUnnYmN92z9ioxa/LLpKQpsZbXfKoMLlSIcrluucafJxv+QrDXL27cF/l30sd1eBXY3l5DOSEKEUrTZw24KvLVd+irAjLlFh15x48ti4sMJWN4gzsfVF1XJlQW3hTzCoqoHFQ/iWfO8iAqZYS5X4aRTEJY7jaYRiFNw1E+VXsLCcFhSWxVXzp6KzsQ8WnnfbrrHbTbIcEMnpyxRiZUBTFx48GbI1MRMkox1dVFky09RF04Roh9RJG5BuP9TpCF/geEFPV5A/plmUsjnZRCGT+fz24PhbLEqCHhUSWXLmKZVAiavoM7Ek16olKpJ8Ixler2YY5pg0lr9UjAgk1Aiaylds0MBq3/nRnXE2SelEsS3RYMURC/SLiZqhDbJ395
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:37.3959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafbc93d-cef5-4894-0d31-08d778afe659
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5215
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No functional change: drm_bridge_init() sets bridge->of_node, but that's
not used by msm anywhere, and the bridges aren't published with
drm_bridge_add() for it to matter.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 4 ++--
 drivers/gpu/drm/msm/edp/edp_bridge.c   | 3 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/ds=
i/dsi_manager.c
index 271aa7bbca92..ba54049a6338 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -662,8 +662,8 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	encoder =3D msm_dsi->encoder;
=20
 	bridge =3D &dsi_bridge->base;
-	bridge->funcs =3D &dsi_mgr_bridge_funcs;
-
+	drm_bridge_init(bridge, msm_dsi->dev->dev, &dsi_mgr_bridge_funcs,
+			NULL, NULL);
 	ret =3D drm_bridge_attach(encoder, bridge, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp=
/edp_bridge.c
index 2950bba4aca9..53d4dc591bd2 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -89,8 +89,7 @@ struct drm_bridge *msm_edp_bridge_init(struct msm_edp *ed=
p)
 	edp_bridge->edp =3D edp;
=20
 	bridge =3D &edp_bridge->base;
-	bridge->funcs =3D &edp_bridge_funcs;
-
+	drm_bridge_init(bridge, edp->dev->dev, &edp_bridge_funcs, NULL, NULL);
 	ret =3D drm_bridge_attach(edp->encoder, bridge, NULL);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/h=
dmi/hdmi_bridge.c
index ba81338a9bf8..d038599279bc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -285,8 +285,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hd=
mi)
 	hdmi_bridge->hdmi =3D hdmi;
=20
 	bridge =3D &hdmi_bridge->base;
-	bridge->funcs =3D &msm_hdmi_bridge_funcs;
-
+	drm_bridge_init(bridge, hdmi->dev->dev, &msm_hdmi_bridge_funcs,
+			NULL, NULL);
 	ret =3D drm_bridge_attach(hdmi->encoder, bridge, NULL);
 	if (ret)
 		goto fail;
--=20
2.23.0

