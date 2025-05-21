Return-Path: <linux-arm-msm+bounces-58969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B8AC00C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 01:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C2FE4E2C10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6372367AC;
	Wed, 21 May 2025 23:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="h4E76Fyp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="EM7x2RkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2606DF58;
	Wed, 21 May 2025 23:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747871218; cv=fail; b=k5EZYEpHz+6QFy+Gw/CqnKlrk5icIuthAs2qv4Cc8SL+P/DsVHSGQtEeUWTcVXwYHbf8rUOTNW2M04Ix0gpeNQMbddyvE6YeL2YvlnJ+dSC4nloi5SAIyOJFEw2k8bnBgSEAQNewhCvU5z4GccPYHZftB5sOF9FIfoD1L2JEURg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747871218; c=relaxed/simple;
	bh=cdfwOby0l3/9746vq3GHpu0O+eJeMlwBMYIPSd5sspw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sqtMp5Rxn3bXJUf++D0zTS6wggygV0QOJJfJJOxAmHJmZmo7ude41WvQUFY32Sros6oHpa6fgHJ1eJ2YdTBTw6/qIH3+VU7jHBzDvJDo26QD2AwL56wItFgop6ND+5FENhIfVOuH9oeITN5pjSuvDu1hwaK8a3mqlRjOlYczsdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=h4E76Fyp; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=EM7x2RkT reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1747871215; i=@semtech.com;
	bh=NiWm2qQOyJMNR7Xp+qeVrOO8SyuhU/0vuFW4UpU6r2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=h4E76FypOIw9mheZ29tSxng/eKKK6tZTgc6+QTd2vI4xfUSRKhLPCUgLCUDaJSJHB
	 BGazx9ymYvVkd8zeplQP7Y6nTivzhQpTqsBNR14Ryu3uuuMtOTyR6yIfOLHankw7Kj
	 uMcAh9Za86+ZkB1lXJIR3XytH/mKLgn7gWasP5a12lHfHEsgvzNsthdJQNwYSlRCIR
	 coJT5op+x2eOhdt3SHqs72yQ3yGwofYgIUmIxa1khav87kBDyMGLFGRMIHY34PG5po
	 QWXDref1m2lRD+SvaICgvlWDwCYWALUJjGYTbnHUlczuMBF9uSZmpXdpQW1SZFfIQE
	 riyK3gd+gNCSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRWlGSWpSXmKPExsWSoW+9Qvddql6
  GwcEVShYT959lt7i8aw6bA5PH501yAYxRrJl5SfkVCawZLw5MZilYxV1x6s9ylgbG55xdjFwc
  jALLmCV27pvKAuEsZpW4c38KK4QzjUnicdNZJhCHRWA7s8SxL5fYQBwhgflMErP2zQfq4QRyV
  jBJvJ2WDpKQEDjKKHHp80QWiKqzjBK3mv+zQzi3GSUuH7oDlZnMKPHp83U2kH42AUWJ1i+nwb
  aIgMw6P+c42GBmAS2Jn49vMoLYwgIlElt37wazWQRUJTo2fGUCsXkFzCV+/DsLZksIyEss3rG
  cGSIuKHFy5hOoOfISzVtnM0McKyuxYkIvG0R9sMTxH5uZIWxJiWs3L7BD2LISR8/OYYGwHSUW
  nO+BmiMhcfDFC6h6X4lVTc+h5shJnOo9B3fDzo23oXqjJY4s3AdV3ykgsX0pEySQ3jFKzOjYw
  QiRkJFov7yAdQKjxiwkd89CcvcsJLsXMDKvYrQoTi0qSy3SNTbSSyrKTM8oyU3MzNFLrNJN1C
  st1k1OzSspSswx1EtPLtBLLS7WK67MTc5J0ctLLdnECEwtXB8qenYwHpzSrH+IUZKDSUmUd1K
  CXoYQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6nJKCcYFFqempFWmYOMM3BpCU4eJREeJmsgdK8
  xQWJucWZ6RCpU4yKUuK8qilACQGQREZpHlwbLLVeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7Bq
  CTMuwZkCk9mXgnc9FdAi5mAFnfn6YIsLklESEk1MJ21WXTN/Hb2a/Pzm5YJhDV/fGK33nPps4
  dzeUrX2m6vaF82N2+G9mvenoOxXN8/fm1Zxsva8+X6qViurymS81+ekb7+u6TEZ9+EH03/Epf
  s+tqybur19y1K83JfrCoK5H1xxMil3/8Gt4rYylUbbdPCZz/eIDVhas77mCmbShWbaqdHXdwX
  YW1acfL+xf1z/u34Jpazw/qv5VRWA8uAY8I2h8rMuJbFnfBp3/t561LGpWfOPppa/+0uz8s7R
  hZrebnCJ23wPPKpmG/lsWNT5tpPa2Jg8nVe/fvyweWfS5xlJYwMds49Z12ma3VbXezvkhvXXD
  Z3mM83T3KqfbZ5/5eTGT/YVk3db5Z1gu8V+xHX00osxRmJhlrMRcWJAJK6alMoBAAA
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-4.tower-904.messagelabs.com!1747871214!4887228!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 14229 invoked from network); 21 May 2025 23:46:54 -0000
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) (104.47.59.168)
  by server-4.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 May 2025 23:46:54 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJPQoujRqDkTZdj5AFMwzToOCiNJ++msSqs3MvG4KulD1zMz7k3jIOoZT5N/GYuZHJa4xITk7avsCbaFNiV/5CvkhSpAE9Lb+NKFYFwLptEMC8d9S50QYYwFALD7IHe6Y5mPWFCPRWMAhYaaMCgLRtKpTS0K9vTs6ADpb6rdUjKg6C5MLLKr3HXTGAfCP7B0mSzot5qZ1UEmZLJBDlgyuz4naQo327xmklQSzdvAnpjcbcnN1/xNpZ2Htdnzt0R8e+sJ6qeBJivnMoSQkf/rYIjPyYBnZlDx6/urA8gY01dIF/zJGSo7j1EnFZ72+Ok7KSeaSa08p7gUdNmnPUFrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=bUUgEYMs8swWsOC9FXDmxP1f4AQxYJikv6EIAoWR/v5AM/EX5SVOeT2atxfaz9xpqQZ9jUasPBLV2tUwWPQliNxrdaltXQg27OHYwvLz8G0pmARo9AR/j5D9byL+uNHusofhjg2FtOIKdkFjo9shAlgTbBPiUflOmsg3hRzQQdM+sN/mcvyoP54H20Y/oZ5OZZiEdjhUjol3le8xa/DWNg5ryUrjWHgFuPBQ2czCgcclae1MOXl3Gmb7/gNPiAkRT8Y4vy7dNIjjzE2WibPgHo9lhrIy/+2ttDQc/yJrN0QqNmynnYGB2M7cbTcQkf4Sdllo7UIFDMos2xGonRu4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=EM7x2RkTAFdNOCziebkanGYiukbCKjxXp0J9ijwFwEtqih+uP86g+UIv7HsxAYuFJGgYjOwIWgz2aQCREMXj3mT+zJ/W7zd6B037hhs9BAZjSjqmrEJHXKh/DJ4Q1SPtz8oa5CghRYiMIbScsifOdCOhdPri+k4dax1KLZpHB6w=
Received: from DM6PR02CA0149.namprd02.prod.outlook.com (2603:10b6:5:332::16)
 by SJ2PR20MB5876.namprd20.prod.outlook.com (2603:10b6:a03:4c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 23:46:52 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::50) by DM6PR02CA0149.outlook.office365.com
 (2603:10b6:5:332::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 21 May 2025 23:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server id 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025
 23:46:52 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Wed, 21 May 2025 19:46:51 -0400
From: Adam Xue <zxue@semtech.com>
To: manivannan.sadhasivam@linaro.org,
	slark_xiao@163.com,
	johan+linaro@kernel.org,
	quic_vpernami@quicinc.com,
	tglx@linutronix.de,
	fabio.porcedda@gmail.com,
	quic_msarkar@quicinc.com,
	mank.wang@netprisma.us,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
Date: Wed, 21 May 2025 16:46:40 -0700
Message-ID: <20250521234640.3056893-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 May 2025 23:46:51.0619 (UTC) FILETIME=[A00F9B30:01DBCAAA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|SJ2PR20MB5876:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49e7273b-c5aa-4c74-f1af-08dd98c1c2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i41RXU89sfVCRdAaTKirRhrz+7PF2E47rsFHoBFnhCEBzXWnWaSOtuMHKwsF?=
 =?us-ascii?Q?VkfljPv2/lMzu7c7zIVniP5j/dz9FDPVibwLg9g3xI3kNmngMQDekV4/ydNM?=
 =?us-ascii?Q?kF6QSANaJEoIy6r9EFcs9nB7tGG9NlYN2bVB6RDhmfE2tGc7zD2ebCfc5N0v?=
 =?us-ascii?Q?kdQJ/zKZJLHzs2uM96890xCJECbQ9G+fvLHjJf8ldxYI1rlzlrKd2jS3TZ5q?=
 =?us-ascii?Q?VZpouDtA6DzSmwzAOJScaVQ5mftzVWFNLhuDJVMJ9pnNRop7KEjvETgc9ieo?=
 =?us-ascii?Q?9H1Vc9JkM8DUNURoKuUeq0jxz0aPOt7vQU8NcsF9q5DOYaGL+BbADczG+qOo?=
 =?us-ascii?Q?KwQyy74eZwYNrWX5aY22OlxSaiiLBEqe/3s2AhK9XuevVFjCHH5bBXXkE4xR?=
 =?us-ascii?Q?d+Rhv7HjBlWvepB/ahXcfbHZIuyafUIcH5WIc0kRlPRZPA8Ukj8O200r0D0P?=
 =?us-ascii?Q?KcYZZisFV4EBK8sVrqAwEOp8ov75s5cjqzxd1n/XiD7VvOwMZVH2Y/At0oTb?=
 =?us-ascii?Q?uYh/RVRGQ0whUsInQyXQ9xbF/bCU9ofz0m8j6E7Hs8HFf5kWfM9Lz739lldP?=
 =?us-ascii?Q?SCijVcHbpkMMNWHmbuvHi7Yx/1GgHsqkbujPvDLuDEKVSGawOhSS/+XUgfMa?=
 =?us-ascii?Q?fN5kyq7ukKzk/A9IEYo3hthJJcAth4PmbnghRqHQ3XOw14s6+bdSeK2GaVJE?=
 =?us-ascii?Q?ABIrP3FD+FTChztLa07Dnl+rNqWu2DrUB/JKV3dfSkumcgGh0HzrRwfzi1Zz?=
 =?us-ascii?Q?f86CybgJtYwAMdjLBTAH23IBn4qMl0SaPZYx4f/T0aenAm39im2jOHph2Hjv?=
 =?us-ascii?Q?2DnQwe5DlPqTc5mH308pC5MiwqPCTHDVHIWp71/8HBDWIxTezW8sx92Tomgs?=
 =?us-ascii?Q?VYwFNJkSvJaYZtBLkWSgSMQuxwSEijWQDzmNKHBlTOlSe/ECaBLbBna9A+eA?=
 =?us-ascii?Q?3m2I33B/iLU692kuwSU2myv0C+M4lHEUgtV7kZ4FhQONY8gutstgJyCSVseQ?=
 =?us-ascii?Q?kkSZjWraXJtlS/GXGRqg7D7uXqGVyvhhV0nhlYosyEuVuw8NwFniBxxEn+pd?=
 =?us-ascii?Q?u0x1W3RejRSaMeXWekQXPqSV1AZv6SRavwlGUM8fEoDFSs5STwt4CiMG5Pxk?=
 =?us-ascii?Q?nzHbkbndTij5HZZrnf/U6T7aQw2kjEM2HUJcLH8gvBx2x9S44HszBD/6NvtM?=
 =?us-ascii?Q?MeJJ3/penGUKoJHnrk/6LU3xouQ0RL4HdUNuQmow4FYS3gUt8Ur03lg+PkRR?=
 =?us-ascii?Q?0p9ld7fIVkthKJ8iuawrngdU2L5JDSdwxAcGYB3dQ2NKsdjWGmSAcOy2unqQ?=
 =?us-ascii?Q?gFB9RarExVxbSPn3ctZwnVihGID54lA52jRgCEaG8Vj8jmU2wyuE5qU7PcZh?=
 =?us-ascii?Q?V28hB+kQPm7KWrJyL5G73pwnxevAv0dOZYV4Zuhv159B2mjji6Mxgal+94xg?=
 =?us-ascii?Q?spwG0+MAHxp/akHEVEXa4Rar1env/9vLkKWsF/fowkiVgPoK9igOMv9IcYL+?=
 =?us-ascii?Q?TCoGLhaUzAAyJZlPJcQM8qEEU1PCqszao/uc+9Lr6qRKaij4MYxqW06BnQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 23:46:52.0428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e7273b-c5aa-4c74-f1af-08dd98c1c2dd
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB5876

Add MHI controller config for EM929x. It uses the same configuration
as EM919x. Also set the MRU to 32768 to improve downlink throughput.

02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
	Subsystem: Device 18d7:0301

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa88795209..9bf8e7991745 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.config = &modem_sierra_em919x_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 	.sideband_wake = false,
 };
 
@@ -813,6 +814,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
+	/* EM929x (sdx65), use the same configuration as EM919x */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
+		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	/* Telit FN980 hardware revision v1 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
-- 
2.45.2


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

