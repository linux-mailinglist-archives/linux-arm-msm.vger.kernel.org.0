Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EFA29A426
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 06:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505870AbgJ0Fdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 01:33:33 -0400
Received: from mail-eopbgr1300045.outbound.protection.outlook.com ([40.107.130.45]:42080
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2411813AbgJ0Fdc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 01:33:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP/vhFTv4bjrL0YpjoHk0xkgYvPcgl6sWCMkdYlJ187b60SX2F7ndc9E0BkMQwu1AhlR9JSmWhyR1lR0UQC/1FHW0RYRHdonluKEnKL1Hd1ZxZSS/ClK1HnnqqG7/qVikRsBLbaxg3o2Rf1FYe6X0Jj1XbER+VN51upTHpX1BGSGLsDckFl9veSG4GOqKuzMEouwk6q9vLd3iuSUxdSByW6wJLBK1wtULz2N0UOZqAlliGBlvzVn5appcaXU6nW7EZwdbhOgrBvh4M34s6b4DaMJLI0wwSaqcbI4MSKaWVH9BNSZ2/10a4rJDRGWSxwlgueMcl+QTkfAvHr0hxvmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHOjEh9pp8dZ1gOwDT5XPtJqTEJPQT1zYcLSKTXZ1fw=;
 b=ZuJa4JBYZjrsb7Y6jaDB3NU0fiVlT3MjUY2o/kzVw8cTCDLy9nEyG08jH39xxOWskGdG8mIN6G+xtz5Ms8/kmt/ndY9j28Olm8RMSWM2K6GVHP+0XQUq/fx7TCqrtkc7G5IkYdks94WD2cM7IK9WB84OkJPd8ys0RPuqeh0vcPpOTCgXsCxidk1IlAGspZhLlXKmx1TIjDLjmNAtIHTOvyknC073/b5X0Y/XkF9vJr73uXaimo9O4+qKq7Da9zZ484Rm/LeJYy/jKswWDYF7a95wL42FKpFi6b2zBrYVYr3zHCxVdDd2lV5gGi8qQEM++KEjF2Nnmu6xYKaKkxnssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHOjEh9pp8dZ1gOwDT5XPtJqTEJPQT1zYcLSKTXZ1fw=;
 b=doZh3/Ms+YE49m9EQSj/kJ+xJV147Hy/9HFthdJRqWWl/J5j9rgK6zr1lv8urqVWUZjE2hRuxCKJJiEOp5WfaHmj3vFhB/TwJGSylFezhM7lUpXO/jFlfJvSJnTn+IydG2T0X4WBEoh4U/HBGFnXwEzp3avvV6Ad4MOqwifqaTg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quectel.com;
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 27 Oct
 2020 05:33:27 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 05:33:27 +0000
From:   carl.yin@quectel.com
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
Subject: [PATCH] bus: mhi: core: Fix null pointer access
Date:   Tue, 27 Oct 2020 13:33:10 +0800
Message-Id: <20201027053310.16469-1-carl.yin@quectel.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [203.93.254.82]
X-ClientProxiedBy: HKAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:203:c8::19) To HK2PR06MB3507.apcprd06.prod.outlook.com
 (2603:1096:202:3e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (203.93.254.82) by HKAPR03CA0014.apcprd03.prod.outlook.com (2603:1096:203:c8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.7 via Frontend Transport; Tue, 27 Oct 2020 05:33:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a4b2049-51e7-4b27-bb73-08d87a39d480
X-MS-TrafficTypeDiagnostic: HK0PR06MB2321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB2321B2932F6D4945D013CFAE86160@HK0PR06MB2321.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDsmt7reGSeDYdrJFquEH781WNAmyjQRlmd4meGNrLUw60uiZ2aYWSeITnaJLFZruGH8HwdUvksdEuiGAMIDK70R7sCVZ6JzXi5ic0HGdkxKyE8Qn8EdBVBYNZjOAIVKGN36J1+6b5u9OVJKbqmzhxJOPZwRz3DurF3NBWjMK649rzgpCNeCH2YU/gtwbNbhgDIu1rAuzJRbC3E3Mzi2g+YMJOG3+yKtB/HzZrTsj1rfekORLHJ+3UyC5Y1GWMUcWwDqZnjVz82uTTiutm4ROaeP3+T9neDw1DhH810Q3tyfIHxnfqr/sx0ITEnrhnX94Mp2H/NHAihlLERpWy0aQun4+VlAG3mSmdpCgxcJIjY3+9YHn+nm1tbnK64Q4IFn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39850400004)(396003)(376002)(69590400008)(66556008)(66476007)(186003)(6506007)(1076003)(5660300002)(52116002)(2616005)(66946007)(4326008)(316002)(478600001)(36756003)(26005)(6486002)(16526019)(83380400001)(8936002)(2906002)(6512007)(956004)(9686003)(8676002)(6666004)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Kzq8WlDWknrQ0Kp4XssVr1zkwNm7Z1BGemyk1XXpc7oIaVPZRj/W+m6UOy+IT7tFM7iKdmNcxsi+RFC4emjjhXtIQ1gphH1km1gzXaWzhnPnTHMgG3YlOI/6ZoHvCDGqS4Ko/vCVcZYqkJXpavC0alIw1fSShWdylY0xuKKQp7ARPLUSfdjaDLbi80ulir+LVrbEpUIy8IkNucC/mzslvFES4OLUgszhsqy9RAVPVHnISLFMEzXi1DZdIlrpX3v5le+ZVwiqVe/iG34bg3h8x21Hc+dExdBFuUPgIhTSV3jNTNX1LkioQ/9bs3op2AtS10MZj3PxCdiMI2WqQrzrWUyDFVpuxj0RX3rNXa99zuyHva/wcIe13R+m8oCfAPcPCOK5JEYA8TR+zbQXyTnTtJYqblT9+d/4Eb9pAn4WETodufe//NCic7kvmnqxtWkSnbIlxMI5WZBN29vNfw+btUTvduJPyRaKCI+Cv9qVaFrczivTvtFzZ+KDjn7ynApUVDq3CPtQUvrEe1mfWLyjPkgo9JtSIuA//vBooaBdqGlwwuOLTFP1FBx0jKGidUpp1MoOJWUA7leU1QuP2+HUioixCNVY8MYhbJdz/cZcZUGjxvRCJYfvEFllZCQ+qrYpDygZXZm7k/GEg9I/pZ05+Q==
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4b2049-51e7-4b27-bb73-08d87a39d480
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 05:33:27.3144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Z22wK2Aocx0Z/f7AnxhRQiYMHY+AmfjPMF/mt837EWKzMKzM4gGJLfPeQdO+YG0jsBxeUNhdK82d038SwDvgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2321
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: carl <carl.yin@quectel.com>

function parse_ev_cfg and parse_ch_cfg access mhi_cntrl->mhi_dev
before it is set in function mhi_register_controller,
use cntrl_dev to instead mhi_dev.

Signed-off-by: carl <carl.yin@quectel.com>
---
 drivers/bus/mhi/core/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 0ffdebde8..c6b43e90b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -610,7 +610,7 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 {
 	struct mhi_event *mhi_event;
 	const struct mhi_event_config *event_cfg;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = mhi_cntrl->cntrl_dev;
 	int i, num;
 
 	num = config->num_events;
@@ -692,7 +692,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 			const struct mhi_controller_config *config)
 {
 	const struct mhi_channel_config *ch_cfg;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = mhi_cntrl->cntrl_dev;
 	int i;
 	u32 chan;
 
-- 
2.17.1

