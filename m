Return-Path: <linux-arm-msm+bounces-72121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79313B4449D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 19:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35EF94E3538
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 17:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B420312803;
	Thu,  4 Sep 2025 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="J6XyTE7U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="fdr99s9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5B41D63C2;
	Thu,  4 Sep 2025 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757007818; cv=fail; b=ZZ0QRFNLGrs/iitczYr2ddNFVF3PL3Ys+3ZHQLmZsJueCHcpABZ5NpX/oA5xIA0VtGJua5+jRC3RUPKWVsrws/1uQ5j8pg6x/6HKmNWhZqjl7tAAvp+QYYyxLt/QgUxiYTxA8X4Uagdwsnwqha0UkK93Hvwo+y9KRfoSTaxc3N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757007818; c=relaxed/simple;
	bh=lIriZ1Kidl92kQAKYsHaZXENkgobFTq9gMobzMhrNNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R77W1ft9e1nWd5RDpOASd1PoooLDX14CEDErY9ixD3YmyUiOF1aV1SqGdJMhZqwXWenAs51td/O57PYI7XTB3ISVeAXQfSHSWRvL+e/2uVhP08n5aa72O47OzCG3Zo7puhDt2ksV5BKttKH2/H7NM7eoWVRYOB8M22EcHzqtxp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=J6XyTE7U; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=fdr99s9O reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757007815; i=@semtech.com;
	bh=y60seZusasOldV5mK6mCQCPNcFmAKgpcljtCgut8a/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=J6XyTE7ULkjojUAa3ZF9kUAjTb7e3m0uk0T4wrxJSVkM53QAXd7Gn4CIU2VE5OaUK
	 pkaLR8qYB3KihT5zTkBoKJL1Ff7k2+xak7MoxWvLIAaEMcJZbeQyE2G6SoYXmQ9Yvq
	 9q/O88fB1iJJnWetNxSFJOBIE170WQQCtCs5W6GoJNa3t2dQqL136woD5ojnwej/pe
	 jthXNRPHR9gkVAxaKylpHsqQMwOlmbPLmEyNQ77F+jUdlmbtXVXNKvidGyLL2itmdF
	 pDdSvpZQyuAWvLUHO/I8MX/wU4Lr06b83/GqkKmKqcn2MdMXG31oKZisyS2xdQ6e6Z
	 2lt5OPpXwVLNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRWlGSWpSXmKPExsWikf22SvfY+Z0
  ZBlM3G1tM3H+W3eLyrjlsDkwenzfJBTBGsWbmJeVXJLBmXG7fzlawjbti1vxVrA2MVzi7GLk4
  GAWWMUvca/vBDOEsZpW4s2g+E4QzjUnicdNZMIdFYDuzxOGemWBlQgLzmSRe7vnJBuGsZpJ4O
  +clI4gjIXCUUeLS54ksEJmzjBK3mv+zQzi3GSW2rV7KCuFMYpTY230AqIeTg01AUaL1y2kmEF
  tE4CujxOKrSSA2s4CWxM/HN8FqhAUcJV5sWAJkcwCdoirRczUMJMwrYCqxecEcdhBbQkBeYvG
  O5cwQcUGJkzOfsECMkZdo3jobLC4kICuxYkIvG0R9sETLxD1MELakxLWbF6DmyEocPTuHBcJ2
  lDj19TkbxBwJiYMvXjBDxH0lFryYxgphy0mc6j3HBHPDzo23oXpDJK7sfAwNljv8Ei0rPjJDO
  M8YJX5saIXaJiPRfnkB6wRGjVlIDp+F5PBZSJYvYGRexWhenFpUllqka6qXVJSZnlGSm5iZo5
  dYpZuoV1qsm5yaV1KUmGOol55coJdaXKxXXJmbnJOil5dasokRmFi4PlRK7WA8c6JZ/xCjJAe
  Tkihv5YGdGUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeF+fAsoJFqWmp1akZeYAkxxMWoKDR0mE
  90Q9UJq3uCAxtzgzHSJ1ilGX4/vBk3uZhVjy8vNSpcR5Nc4BFQmAFGWU5sGNgCXcS4yyUsK8j
  AwMDEI8BalFuZklqPKvGMU5GJWEeblApvBk5pXAbXoFdAQT0BEuT7aDHFGSiJCSamAq+Jboz/
  Xx+QbZLF3lty/jZOPcAzPFzBI93f+X/pZnvtd0WXnLzK1+ilvtn3KLzHO041hcU75B2MqkXmn
  htehTC5rsSudOnOBe/+GXjfI8pcaVSedKM1b+yC6b+v08X/CqI9Upq98vfP22v94reMtP2WPT
  Lk5Ob7f++/7ouTDv/PW/9lrJlsxZsPvWq673n3NdVHezPEk9FWD00l1GaKbNDHPx7qDt+eZ/p
  Y/8VtUw7i0NXp8hw7V5W9Cb3zkyO8qL/i86NHmjzMRyFTeOLWlvNSwtVjK0eP8Ka/rlu4u94g
  zH/e0an3w7Zk1UD4kwqimTslmxffOOdZdmP3kye3pq5uOXhcETJ5uZ7zLLfeyrxFKckWioxVx
  UnAgAQj7GpTMEAAA=
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-21.tower-904.messagelabs.com!1757007814!137287!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 989 invoked from network); 4 Sep 2025 17:43:34 -0000
Received: from mail-bn8nam12on2122.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) (40.107.237.122)
  by server-21.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Sep 2025 17:43:34 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuD3RcbMjPz/AYaEX7oUWvovPafLUfuCjaVFXP834KOcoF4RyDpoLv5ed9Z1P0CxugfSyZnzghxx+MqX9nGpvJPkJ71a5jqyAFA4qJkN/Bs0lEh2+THrmecwHoKZJ5I1gFkne2iKPuJgaxTMyLdYzv/Lpa+UcUsIbHRDqkOztqk+YIXMGy6GMEMvCQzZSFBpJcY2nzE1Q+j0+xh6//rbqzxRrujS6HrKPn8zKV/+8GkiSWp9KoUMydp3FCTx8EHUXz1PmfTYQih2we8r8W+Ao96ed7drojRbGhkuC/MCSN77xiFLWeEGcdFCTpLBE2UGnVgPoCiZJ5RNtoeGEIaS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWBZcHmfWBRFE6d0dtrAdDCMMaL0CU3bgrw3k/qekwY=;
 b=XWXNh4UcnvYmjiQeiHqcTaKWqsHwWnlfykEXPVf0VjVHvnfV1TraZw7axnIZ3OmUrfk6PaGJfQPAIodELEFCeCL+TctVXXZL8/wWWW4hY07w/T/8+r3COABhYmniYN7bf+zPS/LBwXSHnsCTk/pWifaYgRli3Ch039uQ5CR+RILbGNLqzZKPqWL1xRFLlfJ9ZxlN/C2/KuNDiZtQHnE+RHo/H4Z8AwGDQuGdOEoj5K937WVyh/6CHbPEkZv/q8e1AgLhGUd5G3G6OwGPhYib/ROoFCteNCXBC7xNXVF/9expJmGmxz50SfaIKJjAIU1aqBIcDZTbzGPOOv2mYA/azA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWBZcHmfWBRFE6d0dtrAdDCMMaL0CU3bgrw3k/qekwY=;
 b=fdr99s9OU8nby9U0C2NK5x9EuMNZMFqJ/ezUl5ecMWiX1X81EtxtTy2mbcPPocFsjTAfXT6lxXsZR37RoYSuA+YD/JNgiS9altnYrqEeS1dfBp9QwynNTH50JXbfymOwMDpktFegW2NFb9/2J7QFMTldGasf3s56gqjDKGCvuLw=
Received: from BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::15)
 by SA1PR20MB4467.namprd20.prod.outlook.com (2603:10b6:806:23e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 17:43:30 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::95) by BY1P220CA0004.outlook.office365.com
 (2603:10b6:a03:59d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Thu,
 4 Sep 2025 17:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 17:43:29
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 4 Sep 2025 13:43:28 -0400
From: Adam Xue <zxue@semtech.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	quic_yabdulra@quicinc.com,
	chentao@kylinos.cn,
	quic_mattleun@quicinc.com,
	krishna.chundru@oss.qualcomm.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v2] Fix potential kernel panic by calling dev_err
Date: Thu,  4 Sep 2025 10:42:57 -0700
Message-ID: <20250904174257.32371-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Sep 2025 17:43:28.0791 (UTC) FILETIME=[6C599270:01DC1DC3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SA1PR20MB4467:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 11d6f7de-0786-4493-c7db-08ddebda8f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CEa7vPYgTCWYUTdsBiDoY45Z3S0FBTa316lUfVoV1fi1x2rgL6KP05qOhe+j?=
 =?us-ascii?Q?btPZJVv+4SUq6J1yhpBH5AAxW/XK3N2A9juz0fZE9HBynLhQT42u775RvBod?=
 =?us-ascii?Q?eG3mc+qtnCFF1demPSxyPf+/eFtRD2fTEVFCwHOE2qxi9Y/57kiA4jEwZMcJ?=
 =?us-ascii?Q?vH+T/xkPHUuXe8M93nq+CjMgllgcdGvJMIcdNe/ItIJYTO36PbTaVuQiTfh+?=
 =?us-ascii?Q?VD9Npa13Zl1g6nDTUp6oTujO8vOS3QEkbDQJ20rPKgylt8OFRAnW2KykCs4r?=
 =?us-ascii?Q?gVEYvSf7ZVxE6QWPzWN/MZf01XjDzQFgSJTZK1ErgTTcOZa7irBb1l3OKv72?=
 =?us-ascii?Q?N89+sctngS05xh79XqDclK7piuTMilwdbXqM4rNp4+QPOTFZ2rWxIxeypRPl?=
 =?us-ascii?Q?djupNqXkjXOn2MN4EKkO5s/Ocwe2jazcK6iKkzjLv+0SO1BHApTIlsdoUJd1?=
 =?us-ascii?Q?0DY7DXFg6EVogjR3sr9qmcfd5L3bTnonr/MXvaj4V2PrYQorW2vaHIomz+3G?=
 =?us-ascii?Q?i0t048M15N+oyFCRBko5rRUDuZJ1e83GnVKg6LUqjrQVU314OUZrfHprVlbK?=
 =?us-ascii?Q?69IM0JoyndzqCWCyez17yajcaxpyw4iRK9VOQgeNR6MrTjaFefZXD/ehQnj8?=
 =?us-ascii?Q?FWvxfpGZ86fk7F+WYiWajgF242AY0zDEsl+XNOdj1Rq0B/AZ/d8CLf1yvkK0?=
 =?us-ascii?Q?85vm2k10gfLOq1tEzLdhdjFO2AMJVP5lMd7dmnkjwV8yo6bsxv6KbOwU1dyE?=
 =?us-ascii?Q?y7sBbzY2zMqLRvAoIilohPNazS1zxQ4fQYiZF/R6wrdO7SUAFRnZ04FAvPJh?=
 =?us-ascii?Q?oAhtWXYargDe1Ddw6fl6PIYGHABRfdcd7P1kVc9jrdcZsSUkQL04M5yMGZcn?=
 =?us-ascii?Q?3Tn3qhqRVnU6KHZOyKx+UhN2aIdgpqBCdXNClYz0O/iBZaTu06pS4qG1OeRs?=
 =?us-ascii?Q?YMthHi9hn6ijzsCuozqaWmfPsurWCocfD/vy/DpNi20jDfUzgqxRtCrNXCEW?=
 =?us-ascii?Q?vN6OUMm0anhPIzYRAiwffVjAieWsKafxiDCd7WYlK5+j6kegHKfm1qzTiMaM?=
 =?us-ascii?Q?bLTmMbY3tl6eM5mZHEmA2lSulLR/zrMkAIwRprG5GPxXdb1qmrgTXbtbXA8h?=
 =?us-ascii?Q?bCNLDCsQB8FVRqQK6/npv9NWb8ySPTDZHFwRfP64jGdbzIgI+qs6dxl+FrKi?=
 =?us-ascii?Q?E3wM2Z6unAmeYDvTdiEMLjUvzj1tP0NWXdn9Ta9LuiXi94Psndw16uF4zWHi?=
 =?us-ascii?Q?OPaX4p1TAF9wcuwwG3DU8ULIWrTorllWZ81Jget34Lt2PfqbuE5LXGG25cRY?=
 =?us-ascii?Q?gsqp4/62XSzXcrg//0RKtK+KYB+D1kircjp3HZx/Xn2YGvDGgFz5WzuokjQ8?=
 =?us-ascii?Q?7bJiL0H/ygc3XS/YYtnr3DYArKbL95MdHGrA1lsV7RmqaRn/ukgWA7DhgEMF?=
 =?us-ascii?Q?SQJ8wM512cRFjfBwm9ltQLd2W3JnMf/vRe2+BW6a+2fQZ8er1HeV5kHsJrJ7?=
 =?us-ascii?Q?F7NQ3Gh/v3rcYsZML+eX1E9kpk6Uv0V10s4e?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:43:29.3474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d6f7de-0786-4493-c7db-08ddebda8f65
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB4467

In mhi_init_irq_setup, the device pointer used for dev_err
was not initialized. Use the pointer from mhi_cntrl instead.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/init.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 93eddf302a49..987dfde4b7e7 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -195,7 +195,6 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
-	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
@@ -222,7 +221,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
-			dev_err(&pdev->dev, "irq %d not available for event ring\n",
+			dev_err(mhi_cntrl->cntrl_dev, "irq %d not available for event ring\n",
 				mhi_event->irq);
 			ret = -EINVAL;
 			goto error_request;
@@ -233,7 +232,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
-			dev_err(&pdev->dev, "Error requesting irq:%d for ev:%d\n",
+			dev_err(mhi_cntrl->cntrl_dev, "Error requesting irq:%d for ev:%d\n",
 				mhi_cntrl->irq[mhi_event->irq], i);
 			goto error_request;
 		}
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

