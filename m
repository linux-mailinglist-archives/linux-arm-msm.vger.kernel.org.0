Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F23B29A81A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 10:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895772AbgJ0JoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 05:44:03 -0400
Received: from mail-eopbgr1310077.outbound.protection.outlook.com ([40.107.131.77]:2320
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2895771AbgJ0JoD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 05:44:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoQqVqqXdFghQtWJ7kRUcahx+sEgSkqUggpy2hAhQL8+YSyqb+BXRGhgg5E72jDBZQlQGlNZz54BX7FdWkK009aZbwzEcnWc1eqYVG/DhEvIhoS3ijF64YSFfzk0xzC6d7WHQ8zzULeOSLjvQixLIugDu3n5XQb7OrBGsxOkrD7jeNaSVkiu983AU04HBn51RJfU/RQzU/g4outfRKrC8NtGt+qVr7t+oyY/Ymm/qmS7BWf3YlCa6aGko5ufbC0SWDbFa2TZ3u7BppR4jdfpag4ICcOezvCwpCxd461MQSg6883q0UiPX2XCQN5lAv7MwKUkxL/lO3H+AHNZVavUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCSW2038tEymiHbY59BuVi8UpfhXXkiygzsZqpXwXDk=;
 b=g5HRjqcEega5taewUXuFnxYWc9WvHjlUluSgWY+B52j0OjB4/Ds/8B5c84IuhbKTXJE4L5+HP35op2xPdtTmOmhpw7DNhMkQFyclmDBjnrfy0sx3fHtaCCd6Uvd2x5Z1GhadRGRBWE86g3z9B6eQMvDTmDlKoJ8CW++NZPGCQPPLqTp2pDDlSZ9RAIzGouYszDUgOirX51dQT5rcNxi3mxrUnH/054bMyTVttFiMWRtpmAoLQj1wUhn2M+sUjUSRkOspajMU31fQUDodNcxVvlCjkNDbxmZ2WSS2ETa/pWEBv5TCdz/tDKy5/x7xzFj57FGzCTpixibkSMJVZScTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCSW2038tEymiHbY59BuVi8UpfhXXkiygzsZqpXwXDk=;
 b=kMX8NxZ4JxlPadwkJKA7UoD8S1J4qAMohbX9LHnYV1CYuC37/7QWv7kz0Ai01U3d5+4MlUpKmEq0pZYOPZ8Jjut5sXabMM/0YXIqJtfpGvuvg76OWnssD0s5TyUMFBXsrEpEePefVFIhFJhtevAWVEcKvL6x6G95q0DwSgch09o=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quectel.com;
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB3858.apcprd06.prod.outlook.com (2603:1096:203:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.26; Tue, 27 Oct
 2020 09:43:58 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 09:43:58 +0000
From:   carl.yin@quectel.com
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
Subject: [PATCH] bus: mhi: core: Add support MHI EE FP for download firmware
Date:   Tue, 27 Oct 2020 17:43:38 +0800
Message-Id: <20201027094338.23110-1-carl.yin@quectel.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [203.93.254.85]
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To HK2PR06MB3507.apcprd06.prod.outlook.com
 (2603:1096:202:3e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (203.93.254.85) by HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 09:43:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53dcc269-9262-4d7a-de34-08d87a5cd389
X-MS-TrafficTypeDiagnostic: HK0PR06MB3858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB385839A82E201F8C60F1F24886160@HK0PR06MB3858.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:152;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSenXHnGyzkgKId/GTjcAZOoyezKYSfoeJTP2hkoAz215p0kZlRRBusgA3A+1ph5c6smtXJelQKTpHtaFJwVVvXm+8r1NQNg8Z70mqXkFNT23T2a8zRq8r2PiQhVGpJzWH2RaXVjplTsRlVTv8053gX5hFDHEcoUFeWglxm/0rpT2FakTQdZnTfpZKgLlJrK15qKmNGIO70Af6UI6pUu+bXqJnQpl90gMxSq6s6WmuKyyU5aFplfh/qrrS9Tkol+3chi6Qh1UNKlTjbF1ZBZiCYW4XFDnBKjhbFJAhg2J9dR5xCTMwFErPMPrxJv6NEqbYYNkP7puU5szQ0vza5R/4zZhTuobpD16pf+YB/11aBN8P+ZNLaBgqlWc6UmK/3U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(366004)(346002)(376002)(6512007)(66556008)(86362001)(186003)(9686003)(36756003)(5660300002)(2906002)(83380400001)(316002)(66946007)(16526019)(26005)(6506007)(69590400008)(52116002)(1076003)(6666004)(107886003)(66476007)(478600001)(956004)(2616005)(4326008)(8676002)(8936002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: UnqEBTPSM1O9t4FohQzjKb5T55+fADnk5sl1xs7BH/qCYObrugQn1HuS3QtrbP/Vy3v3tUbhJLGtKiMMxUeJGQvFxpXDBtZVcGsqL+mdNskhDUOaD3BHuZq7xyw4ESlAWhPa8VaVDdPsSI+E6QimPIQboztsR+rjWADxXV/q5IXtLdRnXgOt2MMJvtWsqSJHF7UaGGJiwcL2iY0Px44DGMBPgvTFXYzycXdtmox9Few0UCwGa6TQwZJurDBRwfvweAvp7n1F8N49x7/bCLNH+PEC4gXid7BqWMShFDGbJIGsp8G/e4jHfX7YWaRQhdOLXFV6d6xo0VFUNcQCHtf0h0al6PJuSQZUqueE2OXJBBx5dux8wv0tXEHnKUnhT0hPOZW3cwK9vWlm7deMqti4uml93J8sYS1vBShbCNkPtshY7zty7lkfMqb4L5LzmFMJF4XaNOriWkQroJuaoNFU4PGh3kaXZg7RIsdHBkceJuemAswVEXNkSLXzMnskf0gL7jPaUjUjtA1h9KEvnQNvzRVDUig2/X/VeSBgyqkcA+0ziCGqXJH5adnp74q/ZhrSrElDf6UFbbKYjHplpe+D/In3Gvv4iBooNxaOoQMPb3rpsq/UH9wwkLdHofaYUAISdQLqLyibu5BFTLzu7DfM0Q==
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dcc269-9262-4d7a-de34-08d87a5cd389
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 09:43:57.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfRKlfGFtSXbjtZ9RUl2XqR03jOmv5nSleZMDgvzPuTFcLgDBhdSHgkilTFurvJ3rO5Ses6oW2YrYe0zmqSpbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3858
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "carl.yin" <carl.yin@quectel.com>

MHI wwan modems support download firmware to nand or emmc
by firehose protocol, process as next:
1. wwan modem normal bootup and enter EE AMSS, create mhi DIAG chan device
2. send EDL cmd via DIAG chan, then modem enter EE EDL
3. boot.c download 'firehose/prog_firehose_sdx55.mbn' via BHI interface
4. modem enter EE FP, and create mhi EDL chan device
5. user space tool download FW to modem via EDL chan by firehose protocol

Signed-off-by: carl.yin <carl.yin@quectel.com>
---
 drivers/bus/mhi/core/boot.c     |  4 +++-
 drivers/bus/mhi/core/init.c     |  2 ++
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/main.c     |  3 +++
 drivers/bus/mhi/core/pm.c       | 16 +++++++++++++++-
 include/linux/mhi.h             |  4 +++-
 6 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 24422f5..ab39ad6 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -460,8 +460,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		return;
 	}
 
-	if (mhi_cntrl->ee == MHI_EE_EDL)
+	if (mhi_cntrl->ee == MHI_EE_EDL) {
+		mhi_ready_state_transition(mhi_cntrl);
 		return;
+	}
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_cntrl->dev_state = MHI_STATE_RESET;
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index ac4aa5c..9c2c2f3 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -26,6 +26,7 @@ const char * const mhi_ee_str[MHI_EE_MAX] = {
 	[MHI_EE_WFW] = "WFW",
 	[MHI_EE_PTHRU] = "PASS THRU",
 	[MHI_EE_EDL] = "EDL",
+	[MHI_EE_FP] = "FP",
 	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
 	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
 };
@@ -35,6 +36,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_READY] = "READY",
 	[DEV_ST_TRANSITION_SBL] = "SBL",
 	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
+	[DEV_ST_TRANSITION_FP] = "FP",
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
index 3950792..e307b58 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
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
index 3de7b16..3c95a5d 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -563,7 +563,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 	}
 
 	if (cur_state == MHI_PM_SYS_ERR_PROCESS) {
-		mhi_ready_state_transition(mhi_cntrl);
+		if (mhi_get_exec_env(mhi_cntrl) == MHI_EE_EDL
+			&& mhi_get_mhi_state(mhi_cntrl) == MHI_STATE_RESET) {
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_POR);
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_PBL);
+		} else {
+			mhi_ready_state_transition(mhi_cntrl);
+		}
 	} else {
 		/* Move to disable state */
 		write_lock_irq(&mhi_cntrl->pm_lock);
@@ -658,6 +666,12 @@ void mhi_pm_st_worker(struct work_struct *work)
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

