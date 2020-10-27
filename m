Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A0529A816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 10:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895747AbgJ0Jnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 05:43:32 -0400
Received: from mail-eopbgr1300070.outbound.protection.outlook.com ([40.107.130.70]:32992
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2895720AbgJ0Jnb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 05:43:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCLKW5UJslk2MfgOVRef5aNc+Ve8I0pU5moNT2mOQzXkqHuQsfWYD449wiTxsbIgUWGiDJhK0c/4OlsJHK9+ogAS5rurykxSG6jJ/m4viPeICR8uNngIDKE+7gP3fLWprgTerfZtLqbZ5EMpd/JvPWQg8E1PPq7VST5bzNwgYYyb7uBqWvg36hyGXpPkyNQ7rY+18SKa4nOArnzjf1B+akqwpeqAKVPLumqLFrDokw85NJyaQIygshklhTPDkWIRokSKsfgTAunP0ljtpujm3/UUuHChtSXdkGne64o5QwE+roEKgMQYdbB/qw+c8Vhx1ea9f0nC2olcR9W7DEVMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+6cQ3D6jU5ZNTIWNo66SWTMmee7RoAN93Zf0mnCCWc=;
 b=fI9Y2xOIMz4IQsoNNYIw+CAEM72K7mPN1ZMaw5Vv20BgHGBc9Z81PsQs09DgPB9sRC0tshcfo63bj8QAYzszRQsRRlBa3jIca6tSUIoSZeEPL0U/5QkJec1nN8svcx/6y0pHDJtS3Tnk56JacCwBktank3hD0H/LpFG/J545IdZiF0XK5KtQH47vlgX6dTyUMJ+F/KGMnZlb2/6Dt9pYZmMdkK3uGYNEb+h6qRYpS3daP4JyL7DJSrzwCfh8tmS0Sd5vB+ZpLfVbrEB9c2LQCwYAJP09Q7rHvKhZhMyBhtyq9YQ5eNfnQFDf96DeXhUmMPCF4cH/MNHQtdYlMdGbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+6cQ3D6jU5ZNTIWNo66SWTMmee7RoAN93Zf0mnCCWc=;
 b=bx5Qxd/Eaum+jMTPQXUvysp+uMiWpdav8nr1qpAmeIiHyNwMVkEBAVEkO9M1mz1UJZ3OW704vJnme4oH5qBqqxplcUQuTW65cZPp/3YKFODocPG6G5GV7B5VxBx2rQm5PQrsXOjS/JSiBz5rrF4LDeFcWKz7CEKc/hkrH+blY8Y=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quectel.com;
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB3858.apcprd06.prod.outlook.com (2603:1096:203:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.26; Tue, 27 Oct
 2020 09:43:27 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 09:43:26 +0000
From:   carl.yin@quectel.com
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
Subject: [PATCH] bus: mhi: core: Introduce sysfs ul chan id for mhi chan device
Date:   Tue, 27 Oct 2020 17:43:04 +0800
Message-Id: <20201027094304.23025-1-carl.yin@quectel.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [203.93.254.82]
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To HK2PR06MB3507.apcprd06.prod.outlook.com
 (2603:1096:202:3e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (203.93.254.82) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.9 via Frontend Transport; Tue, 27 Oct 2020 09:43:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0320da1a-b530-49de-da84-08d87a5cc083
X-MS-TrafficTypeDiagnostic: HK0PR06MB3858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB3858E216221E51A98590C9D686160@HK0PR06MB3858.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QcmNNSpgvRVPiwN4YNHO3HdIm219Nml6e7mIfFlF/faQqIrTBYfoKjeI39/cFR4Vwp//CMj5qzVvZxmWWfNx8RzyLhsBdlHkBTM+T6YY6Lf338L8+YFqsC8U3FP6F5c/zCuevcksy+S6IUEnyoLnuK8wcFpnozFRyUnMjHPzOIEs15FTB/kxytW5X5mIIpGXh4KGqlU5gjHMT63WHB89J7YR0pnGY6lkHvOT9dSgBHnJgNKzahTKM+X6Vwk2KhYTvxZxtN/wxNpH7KiJsDOgZjp8UsajlFxFOK9gk1WoP5EROCrNkOBj53ExxONzzBpD0bs0o4wPx7P7ZbE/PfcSWlrEvRgi7QVJ22OzUCUbtxfsfT+Bk2n4ue7j9yBzF6l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(366004)(346002)(376002)(6512007)(66556008)(86362001)(186003)(9686003)(36756003)(5660300002)(2906002)(316002)(66946007)(16526019)(26005)(6506007)(69590400008)(52116002)(1076003)(6666004)(107886003)(66476007)(478600001)(956004)(2616005)(4326008)(8676002)(8936002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cmoqx02mTT5q5gjoVn8Lutp+ZgoYeT+gYizrwIMN3WrtICXp2AJ/ggzcOX8AggJleWyF9yIgxL9o0YdfNeE1jTEHYNqz71LYD/ybFqXdxYQtBMJye+WGIk1L/8yI7txNaIZCc2NgFgNL4MUxz+gqbRl4njs3qwmxxF1PJFEDpIX9SCNGDfKK4pRfgpfwMJtyxxU7IufaWeBHBoPweWLNXSeJ2pQFqqjspxS28gugthy3jCu4UkPaDxgT4ZY3L1br/V92casCwhz9O0WjBCkLH8dBLVPo+BOGYAUnJN7d56nanP+bA93aX2tkyd7YMYo7WJY3Sj0H/QOO2g7cWti7aVdubHFv5PY0Zu4FSGXr9K+7fB4Q+eXwxqaYiy4G5zR2PRVIoT45AuHW8XygSdUecAR5hkGkt/IWW7gag3/DXiW5b/O8Ka5t3MQRZ0fzpSVwxDFlo8rQ+LetlnWH7Z8mWJr/1dPZMMswBEv0tt5YQuGoO1sTxO0Gk5mtqDUTkniPc2JGqpu82fOSD0X6KCsOrhCow22KEMuBZ2b4SjvSzGxmGD+oGf/DAxIeWb6FNbO/2qgR05XhfZDnCtDrT0oVEW2Nzd4zrqBGQsb+9cqUrs9ZxrCqXdwFw10cltKAwaz4Wm513UAy0rzVOUHn0ACcmg==
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0320da1a-b530-49de-da84-08d87a5cc083
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 09:43:26.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4aZSwmA6TBy/P3WRsVgld0vXGmcY8JiTuM5v2kTnZ/FtfRnP3H21pEwLGqsSvgU36b5N0tup4u0qWvnArbE//A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3858
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "carl.yin" <carl.yin@quectel.com>

User space software like ModemManager can identify the function
of the mhi chan device by ul_chan_id.

Signed-off-by: carl.yin <carl.yin@quectel.com>
---
 Documentation/ABI/stable/sysfs-bus-mhi | 10 ++++++++++
 drivers/bus/mhi/core/init.c            | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
index ecfe766..6d52768 100644
--- a/Documentation/ABI/stable/sysfs-bus-mhi
+++ b/Documentation/ABI/stable/sysfs-bus-mhi
@@ -19,3 +19,13 @@ Description:	The file holds the OEM PK Hash value of the endpoint device
 		read without having the device power on at least once, the file
 		will read all 0's.
 Users:		Any userspace application or clients interested in device info.
+
+What:		/sys/bus/mhi/devices/.../ul_chan_id
+Date:		November 2020
+KernelVersion:	5.10
+Contact:	Carl Yin <carl.yin@quectel.com>
+Description:	The file holds the uplink chan id of the mhi chan device.
+		User space software like ModemManager can identify the function of
+		the mhi chan device. If the mhi device is not a chan device,
+		eg mhi controller device, the file read -1.
+Users:		Any userspace application or clients interested in device info.
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c6b43e9..ac4aa5c 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -105,9 +105,24 @@ static ssize_t oem_pk_hash_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(oem_pk_hash);
 
+static ssize_t ul_chan_id_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+	int ul_chan_id = -1;
+
+	if (mhi_dev->ul_chan)
+		ul_chan_id = mhi_dev->ul_chan_id;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", ul_chan_id);
+}
+static DEVICE_ATTR_RO(ul_chan_id);
+
 static struct attribute *mhi_dev_attrs[] = {
 	&dev_attr_serial_number.attr,
 	&dev_attr_oem_pk_hash.attr,
+	&dev_attr_ul_chan_id.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(mhi_dev);
-- 
2.25.1

