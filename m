Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F512A2AAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 13:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgKBM2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 07:28:21 -0500
Received: from mail-eopbgr1300059.outbound.protection.outlook.com ([40.107.130.59]:27200
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728423AbgKBM2U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 07:28:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkatGmWXNLXxLt1DQ1/w1uioePfCup8BjHK/pVl9iAhAQ4qQkZUYSYeviagt5MANX9HdBj4rBIg1z+LE825Fr8ZYj5s0U0IcFLyHMwOwEEZQ5o+Bj3kwkFUChiEZ0lNG1H2XMOl2rtH8tKGIxVanYY86ijcEy0V/yCOujqih6Z8kvwLM86t+uI15yJxdTMQbnBpS21oBhpPG8xaNrBrIOTCIHXE/ns3jcPleiB96tA/jReF9ZCPh/jUjDuXs0bBeR6AZLz3leGdc4A+VnMQqR5oN1rQOgyzfEOBlacweMwsw+Jf+Zrj1yDvHPNVo+q4rmwFXg5d2/XA02bW8bE2+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG1uMJFJ5Bs3JP37NGs6fx/hwmRhjCokv0VU9dPdGZY=;
 b=iNdG4miIYJVe1wwOSTGw+02o3vHkWvCWcX+lVz6na6qB6QKVRI92cwKOiZ7+LH+8VkrxXbtRrrwmH+UQZ2gofRO0oJOEstRpfOD0spwWItp7F1h813RiTJOskBXeozhmWJnZ+GIH/EmGp3Nms+TrBi/ZFzuyLG7Ga998vULW1LCDI+84V79nfVxhTPPqcccns39GRVf7ussIBDuEhZtOs89K06eN+0LEDXoXCtOWSWBMkXEMaEQeJEj8EsFAGlcfwILHNdQeScpwJ1CvM+SzFubzPESt0absm0bXAQ3vvgtG9/gwdowMpNceqnyX9vo8tSgwpknif1fMGTMs04BJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG1uMJFJ5Bs3JP37NGs6fx/hwmRhjCokv0VU9dPdGZY=;
 b=OF+yaCEmAapk503d/RIvtqNGw1P21ks3YJEyy/1ELSTwYYEeE4hLeQCOiWfVga4xdsD3d5svEfl+InMzNXIimgjVLaKm+sCVglG73mCJy8PbCgsCVeRcHvvPn7R4VxAU912tm8Ev11Igk2BlaINuvlp7nVlrgDN/ft7yPVWTU88=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quectel.com;
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK2PR06MB3505.apcprd06.prod.outlook.com (2603:1096:202:35::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 12:28:14 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 12:28:14 +0000
From:   carl.yin@quectel.com
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
Subject: [PATCH v2] bus: mhi: core: Add support MHI EE FP for download firmware
Date:   Mon,  2 Nov 2020 20:27:56 +0800
Message-Id: <20201102122756.23452-1-carl.yin@quectel.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [203.93.254.85]
X-ClientProxiedBy: HK2PR0401CA0016.apcprd04.prod.outlook.com
 (2603:1096:202:2::26) To HK2PR06MB3507.apcprd06.prod.outlook.com
 (2603:1096:202:3e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (203.93.254.85) by HK2PR0401CA0016.apcprd04.prod.outlook.com (2603:1096:202:2::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 12:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d973b550-5052-4d74-23ce-08d87f2ac4a9
X-MS-TrafficTypeDiagnostic: HK2PR06MB3505:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR06MB3505EE986B52C4A251216BA186100@HK2PR06MB3505.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmMBefeBsM7uKk2Rip/9AsDw2rRpA6Eut6Bsem4IjI+ILXXiG16x8oik4JbAKe5ueQnBgAydxprugphC+B9/0kGIzxBgdUQlx2L0tJg+LYqE3rDgN4CxqMOPz3Qd6Q9qkLEck52JkR7zop1UT3eMfZ1Qh0G68pwXRa8N1ePi8onccmsDD8iXwT0QMFK2UvL1WYAhj7tpgBVgIrQsDnsRNxhjtqb/vD/2PBPd2Uld33vjOHbcj/KGRFp89ipRenUplSIHeGpYAfAkrGd2vqoYVZxMBuCbFmU0J8BcQdROPdcB44KT+8IBFkL5JfhDnptyOEZfIwx4e2LSkWYGjFUfvnoNPxRA5TrevExBLHoLJK43+9V2QREke8WFjO6NCTI7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(39860400002)(346002)(8936002)(8676002)(5660300002)(2906002)(1076003)(36756003)(69590400008)(6486002)(4326008)(86362001)(956004)(316002)(186003)(16526019)(2616005)(66946007)(478600001)(26005)(52116002)(66476007)(83380400001)(66556008)(6506007)(107886003)(6512007)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: K5k0WCd2yGUOfN89T8CFhf1HWUQV3GlNNKafTi23I34koYCKzz89SjnlSFxRlCvaS3N/kswdd0HtdYxhMtJqsbVRxbtXKfcYkbgUiW7w2KyPh/9n9C1p0P4M+6PN4IHBlKdSpTSr+WZcCmDGK5UetqixLMbaC4d365iG2H3Lhz5fAb0qYez9Mjr7GcqUsoVy5+JxIo+CpaiK5/MjWHrwWdF/b+0r5xF41Pw1akx2rImxmZn5M6r53w8Cw66hRFuar43ikC1+SJWF1Zuqtq1XH+OztUIhgLQBmeFyf7LVVkP7JvqDa6Xct4Bw+2ArPxlzlDzy7L4UtMhemTFt6lD/FUfQeErHnQpZkXHoT0g4h1ivtbUbrc2VNQQu5t9F/fIS6zdTWlOaDkyIQRVeV22kZFJcNAbrFWt+B7Ttgh+Mj1Q+oSUb4LRDyWltpr4GVKhC2hSQEPhxSavY0tf0VcX6ezzEbDN1q5cUeBrCIvhoo4pDR4X9MJDowDl3py3qrhfCFNKup+Xs4zsp83LyiICb6CzqMUXf9b0fMWgOr5Do/In4ZFjk4pccytH0AzNlo+SvYB4AZwJHr/jetobG159A1LkFPRXqCz5f5Qvx9ijNXjZAXHlS9nRIt1q4kfrzuuFX7mlzMYtPu2h/AfffZF2ItQ==
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d973b550-5052-4d74-23ce-08d87f2ac4a9
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 12:28:14.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQZdMCpS9Kc6kbGFP2Nk/+A7ZfvsyD5u20hdBy8x2uaYgVerwAuYMuUVWcqkT+u37zxT7XWzcddThJCf7mVteQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3505
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "carl.yin" <carl.yin@quectel.com>

MHI wwan modems support download firmware to nand or emmc
by firehose protocol, process as next:
1. modem boot up and enter EE AMSS, create DIAG channels (4, 5) device
2. user space tool send EDL command via DIAG channel,
   then modem enter EE EDL
3. boot.c download 'flash programmer image' via BHI interface
4. modem enter EE FP, and create EDL channels (34, 35) device
5. user space tool download 'firmware image' to modem via EDL channels
   by firehose protocol

Signed-off-by: carl.yin <carl.yin@quectel.com>
---
 drivers/bus/mhi/core/init.c     |  2 ++
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/main.c     |  5 ++++-
 drivers/bus/mhi/core/pm.c       | 13 ++++++++++++-
 include/linux/mhi.h             |  4 +++-
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index ac4aa5c..e34616b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -26,6 +26,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
 	[MHI_EE_WFW] = "WFW",
 	[MHI_EE_PTHRU] = "PASS THRU",
 	[MHI_EE_EDL] = "EDL",
+	[MHI_EE_FP] = "FLASH PROGRAMMER",
 	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
 	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
 };
@@ -35,6 +36,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_READY] = "READY",
 	[DEV_ST_TRANSITION_SBL] = "SBL",
 	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
+	[DEV_ST_TRANSITION_FP] = "FLASH_PROGRAMMER",
 	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
 	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 4abf0cf..6ae897a 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -386,6 +386,7 @@ enum dev_st_transition {
 	DEV_ST_TRANSITION_READY,
 	DEV_ST_TRANSITION_SBL,
 	DEV_ST_TRANSITION_MISSION_MODE,
+	DEV_ST_TRANSITION_FP,
 	DEV_ST_TRANSITION_SYS_ERR,
 	DEV_ST_TRANSITION_DISABLE,
 	DEV_ST_TRANSITION_MAX,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 3950792..a1e1561 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -422,7 +422,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 		wake_up_all(&mhi_cntrl->state_event);
 
 		/* For fatal errors, we let controller decide next step */
-		if (MHI_IN_PBL(ee))
+		if (MHI_IN_PBL(mhi_cntrl->ee))
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
 		else
 			mhi_pm_sys_err_handler(mhi_cntrl);
@@ -782,6 +782,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			case MHI_EE_SBL:
 				st = DEV_ST_TRANSITION_SBL;
 				break;
+			case MHI_EE_FP:
+				st = DEV_ST_TRANSITION_FP;
+				break;
 			case MHI_EE_WFW:
 			case MHI_EE_AMSS:
 				st = DEV_ST_TRANSITION_MISSION_MODE;
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 3de7b16..2d68812 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -658,6 +658,12 @@ void mhi_pm_st_worker(struct work_struct *work)
 		case DEV_ST_TRANSITION_MISSION_MODE:
 			mhi_pm_mission_mode_transition(mhi_cntrl);
 			break;
+		case DEV_ST_TRANSITION_FP:
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			mhi_cntrl->ee = MHI_EE_FP;
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			mhi_create_devices(mhi_cntrl);
+			break;
 		case DEV_ST_TRANSITION_READY:
 			mhi_ready_state_transition(mhi_cntrl);
 			break;
@@ -1077,10 +1083,15 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 
 	wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
+			   mhi_cntrl->ee == MHI_EE_FP ||
 			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
 			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
-	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
+	if (mhi_cntrl->ee == MHI_EE_FP)
+		mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_READY);
+	else
+		ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
+
 	if (ret)
 		mhi_power_down(mhi_cntrl, false);
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 6e1122c..4620af8 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -120,6 +120,7 @@ struct mhi_link_info {
  * @MHI_EE_WFW: WLAN firmware mode
  * @MHI_EE_PTHRU: Passthrough
  * @MHI_EE_EDL: Embedded downloader
+ * @MHI_EE_FP, Flash Programmer Environment
  */
 enum mhi_ee_type {
 	MHI_EE_PBL,
@@ -129,7 +130,8 @@ enum mhi_ee_type {
 	MHI_EE_WFW,
 	MHI_EE_PTHRU,
 	MHI_EE_EDL,
-	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
+	MHI_EE_FP,
+	MHI_EE_MAX_SUPPORTED = MHI_EE_FP,
 	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
 	MHI_EE_NOT_SUPPORTED,
 	MHI_EE_MAX,
-- 
2.25.1

