Return-Path: <linux-arm-msm+bounces-72353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF4B4606D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6726F1B2522D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDBC352FC1;
	Fri,  5 Sep 2025 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="M5moMKd2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="RM34MyKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAC21FF33;
	Fri,  5 Sep 2025 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094112; cv=fail; b=HUhEhQT+4n6vLL0ifqjIiFwu0pjuE2UQpP5GNUn7bMWm68T2Ne8MlFEQ2SxBNciGu4fhKV/ZducwSkQMy85mmG1vqUiK1k9bEMV38KkXp5OqOhen11YFnbRkSqwETPzzAYof4XSdoosNV81QhcRGzP5bpuIe26d8jp5Mw9qz2gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094112; c=relaxed/simple;
	bh=10qMxWAZkRFK2IXMTLy5ZusFOzY0jcJG4PAVGxGC3N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GWqihMfpEfPyWyB713PMurwk4TeoRdTAzllVDeTewfixLsuLwwbWW3rZ7eT62qs37wpyAPB9N0vRZi/7kndirZdH2ejFu/3c7hgF3xSSyD/xipPmAVp/4K7A2g1M5/Aw1KSOaPyAR51xiZelCUiD287m9zVJSEPT09ThQYrxOcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=M5moMKd2; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=RM34MyKt reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757094109; i=@semtech.com;
	bh=nEYuVdIZ/vv9J+5z4hknlhDd4x7jIbUpM3BDAjb7Pbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=M5moMKd2X+AHzD1YL9J4jQk7Z5fZdh+CLtbMZH5ydE3z9Gm56SOqYDo+gOM1jb14y
	 dqRIVIv7p1sChrkW1hweBPLHJnvfQLaUCWvda8Wi7pMwLjKP/IEza0b2IHBE7rumGY
	 z4YFYPKb+HZksIl9QjWjYtDnj5lWxXosoUn+RQ9FpuvPtzTlL9peYQu9q5tB4lujic
	 L+H6wEMUFpchWfjU0x5ntb5x5Shk9xSMrJacr39ws2wMKf3PMCvpw2h3PCCXkhmQc2
	 qiXd8PnnVPIL4868M00laNHT7HVrrsLU3doSXFCR4ySB9jD/aceyT9FhAVQ4af3ggr
	 Bzmyc0puTyNbg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRWlGSWpSXmKPExsWikZ3QrXtHYXe
  GwZTVVhYT959lt7i8aw6bxYKNjxgdmD0+b5ILYIxizcxLyq9IYM3YsPAve8Eu7oqZ3RuZGhiv
  cHYxcnIwCixjlpjaotjFyAVkL2aVuDPlIguEM41J4nHTWSYQh0VgO7NE55KbLCAtQgLzmSSWP
  40ESQgJrGSS2Hj6OliLhMBRRolLnyeyQGTOMkrcav7PDuHcYpQ4sHcOK4QziVFiyupjrCDD2A
  QUJVq/nGYCsUUEvjJKLL6a1MXIwcEs4Cyx+1cwSFhYIEhi56XXjCA2i4CqxNZfP5lBbF4BU4m
  dLdPB4hIC8hKLdyyHigtKnJz5BOxWZqB489bZzBB3y0qsmNDLBlEfLLG84TuULSlx7eYFdghb
  VuLo2TksELajxNlXTxkh5khIHHzxghnkNAkBX4n9t6ohSuQkTvWeY4I5YefG21CtIRKNN58wQ
  kLlDr/E+T2fWCGcZ4wSl3deYoaokpFov7yAdQKjxiwkd89CcvcsJLsXMDKvYjQvTi0qSy3SNd
  dLKspMzyjJTczM0Uus0k3UKy3WTU7NKylKzDHUS08u0EstLtYrrsxNzknRy0st2cQITC5cHyq
  NdjCeP9Gsf4hRkoNJSZRXX3h3hhBfUn5KZUZicUZ8UWlOavEhRhkODiUJXk8ZoJxgUWp6akVa
  Zg4w0cGkJTh4lER4vy/clSHEW1yQmFucmQ6ROsWoy/H94Mm9zEIsefl5qVLivO9BZgiAFGWU5
  sGNgCXdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeX/IA03hycwrgdv0CugIJqAjXJ5sBz
  miJBEhJdXA5J8x6VHZDbOU4hqWvwnLReybD31n137Cfdfa4siizmO8/1S5Qs60nZv85mh3Jev
  vDMHotZufBmwSWnFmx4GTXUqJJZFJBj/v3yrz5+u5O0nqlu/ZshVzTjIY8nSse1zMZ53mG/Dk
  tbXTrDmKEhPN5x+13f0u1HCHVS8rn9oG7eq9s9tLA85ksHRP8tpz4Q1XyqzarcptP66mBDxee
  vtRwvUCsS+6Qius58rnpe1/+THriEtP4Qf/D9MCGpJTxN5bbZi4PF5aPtNaW0CHs3cXL+Nnx6
  R7tatdd968Vx8w39NjGQ+rRf2uACufi1tc81uN5Z8slw59PWuf/Zm5y37da5vRwHO6xDbhbK/
  8pBc3lViKMxINtZiLihMBhZUMuTUEAAA=
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-6.tower-904.messagelabs.com!1757094108!123330!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 25231 invoked from network); 5 Sep 2025 17:41:48 -0000
Received: from mail-sn1nam02on2139.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) (40.107.96.139)
  by server-6.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Sep 2025 17:41:48 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOGXsMhBlYoCzqIK0iNwstP53d70bAA9YePNRXVWq6TepRfP81P5hKldpB87A32n/er47F4DJrSKBhjep0VzYw4K43xiOPXncat68Gh6yqfoWQqu5DJc+utFfC3SSDRLU97mFJhvSDWJniYBhKf2t/bt6gY8Bp2kt8awRqmhNHIH6L0zopnKb2g0ZaBdbdPxObv+oqkIY6txkMlCMi7hR9fwgT43A2VMwtZikZqXRdQvUC/y82xUo7H7XU6kLZXgUiKp0hiotr87nUq2Fu5gouPfvdUH1hZvLB6mI61RPto/BZBlKsYCrOM7QHvv2b1iZUsJrpYkfkayBONEpsIXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCUAHh2MpfVVRwyc9QjfXW7hQa3IQzxYzqid+uLMOiM=;
 b=bwQxzHqrkRI86qkUfgCfVKoOeM6SRW9vy9uKLd8dtWJAaPoQjhkUQ5iUdvkatPSC5ysmYHHnS8OXDSdWYU3rCYp4OIGmwZ9FCfJIgF8xSYxzxxc1o+2/ZwLRQp5P+h51UMd4xwch2xmft82KeFDnMcjKiyzFcdmD8aHUhCZrHgu8aByxj9jg+6zcKGPj99KNWNMejeOgIYmj4/N2Wq8DBSb89Fegsw4shR94i9403hlbWv2CS8zEZhqcQZSyUyWWAza/7a2wS2H/fKA2VhQRTX+nejqtv9in6j/Jx73GSLlJk247gu4U4pmzAP21AWVv1S+NCIkrQIT9VrB2Jf67FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCUAHh2MpfVVRwyc9QjfXW7hQa3IQzxYzqid+uLMOiM=;
 b=RM34MyKtPDUGiK9J3aAm7c+W/N3u1GVACiRbx3vwwIjDl972+cRK6dFCX8pWtFCr+EmhGavc3qP4HDUYTd802uk+WnaI50NN98Alcb6zeCGUBE4cwBG0hyVNfW3qOHvEDb5LdO2SacKn5HYEjnrDfZYCymV9xxx1Ev52wsHQ7zA=
Received: from SJ0PR13CA0076.namprd13.prod.outlook.com (2603:10b6:a03:2c4::21)
 by SN7PR20MB5168.namprd20.prod.outlook.com (2603:10b6:806:268::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 17:41:45 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::b) by SJ0PR13CA0076.outlook.office365.com
 (2603:10b6:a03:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.7 via Frontend Transport; Fri, 5
 Sep 2025 17:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 17:41:44
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 5 Sep 2025 13:41:43 -0400
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
Cc: stable@vger.kernel.org,
	zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v4] bus: mhi: host: Fix potential kernel panic by calling dev_err 
Date: Fri,  5 Sep 2025 10:41:18 -0700
Message-ID: <20250905174118.38512-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Sep 2025 17:41:43.0758 (UTC) FILETIME=[58288EE0:01DC1E8C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SN7PR20MB5168:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c07d859-2d29-4cee-81fd-08ddeca37b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dEf2fx0M9r7TOpGIpnbTi2vsBL4OSe5eBQ3QFltTSsKgE5MjEZ4r/azcW9Aa?=
 =?us-ascii?Q?mN2UnC1IWtBGTahnm1ZDVQ1D6rmljUrzZiyA9kz6wzHC8w3m1zYAlMtPzPAS?=
 =?us-ascii?Q?bz/wtXIZJhSPOQJjjsllf2IhymXCwTvrYL3kk+WRqsVl3RJjHOkubl17aFuy?=
 =?us-ascii?Q?xtGWLg9NVoFescpp/R/ZgJ9EhgdDAsByCeLzhIwnDOSmGW2wv/FlXVET6q/N?=
 =?us-ascii?Q?XckBdczLXmeq5jBE5c4HIX0HMIqtJLv/udA5YZ/xbkH/prXgv0MtRDAUPVjD?=
 =?us-ascii?Q?EQ0v+nt3RJYwSEfbNMr20HhkNygi4iRhyBvEV5d4V4FU1lK4qwU/1yltc18U?=
 =?us-ascii?Q?2eIxcqeXw6sGLV1lsk0dP1WFLYpjgmFWsWu725rnCORqysHkoH1hOQDZoN19?=
 =?us-ascii?Q?ZK348rl/iNLuO4EiXUXHdSi8Yx7N1LFUG7R2J4ZcccZZ/205rKV1INEqxmMr?=
 =?us-ascii?Q?/LDztGruAGOONesOTJu7C0RCf0nkbNp8xJXTHlPV7Wl/hYbgmrz4ElFLhbGs?=
 =?us-ascii?Q?8/X2otuhKLd60qs2m9qsY6ANyUOwIsvKjlyhY6Uhm/SIQYswUvaeA6OVJqqk?=
 =?us-ascii?Q?EvDV/8nKtlmoqgrLStadNXx5Y7tvEx0tk2cO9IGnvufpqd0X/+Bp8KK2dxxh?=
 =?us-ascii?Q?9KzfeRE2K5l57ZIMePSmfxm9IHpW8A/H5DK1hjQO+y/6XaAgoL4bgfxe0hDj?=
 =?us-ascii?Q?GN3dYUyzMzyMZb4X1sD/kIKbKJVKULLpatJxfXbqRrrvylT4e1fwO2fl8jgg?=
 =?us-ascii?Q?E1MsQZad9/rd4B46WtPEmn1EHonIrZQ2DaoGIKFipe36TYLwzmHKu9s6V5DH?=
 =?us-ascii?Q?gjU/YoAkClwSrxrlDsXXkQodSZmE9/6ypSb2ejt9qH/ExUmcscLhIkGRM2CS?=
 =?us-ascii?Q?4dP4XSd2Nswp1nRc2eYRNSJiAoSeobifUXp7/hcFqP9PsnwS1c96cghWDyx8?=
 =?us-ascii?Q?XRrr0RB7YqLuHU+1Imlu/316vNYvVx3xGyVE8TwfgeknJ/bv/YOfn0Dph3RL?=
 =?us-ascii?Q?tSao/qD95p+7GSnfDfeqMJLEGxQGS14y/FKLGEQTvfcuqIiBpIBfwMr2tB+F?=
 =?us-ascii?Q?W9NIKQ/wgpVaCnn+nLwwajKDHQyBPH2EjrRBEDy74eGk53UVRUOg9h0Axhm5?=
 =?us-ascii?Q?7U+ex6esxDrH+PpijQ1lY84eoBXS2dVtdEMABzXD5f13AUiVBZ/7wOhTj3p8?=
 =?us-ascii?Q?k9mVpJIG0clFyt+aIxo6HpyhanaqYo3MUUrkUwGpQpmU6pyP/Q0ZddPDm8Z+?=
 =?us-ascii?Q?WsHucOB+ftAx+tgYEzjeJoeRTJFvrjAFqBlpGhbgG1GefXmpSq+B5RwLHNvZ?=
 =?us-ascii?Q?QMxHgrfjBNx4CFjh8fzYyN8laRLkm765u8HuILG6cbE409hXz7wRG2xefo+Z?=
 =?us-ascii?Q?jwAyxo69681Xe7ik5/dAdklAoyQl8fVEHnKZ00Tjs+R14yYxs3Rwp8mMIweo?=
 =?us-ascii?Q?nNc5+ZL8dxzzdK8VJIuRe0PMt1LGQfpxuZAE3kMsGbzMg/USTnKyvorB9QFk?=
 =?us-ascii?Q?hi1Yj+LX/YaSBoj3kiHObkc53UyNTPqUoive?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:41:44.3688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c07d859-2d29-4cee-81fd-08ddeca37b21
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5168

In mhi_init_irq_setup, the device pointer used for dev_err
was not initialized. Use the pointer from mhi_cntrl instead.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/init.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 7f72aab38ce9..099be8dd1900 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -194,7 +194,6 @@ static void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
@@ -221,7 +220,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
-			dev_err(dev, "irq %d not available for event ring\n",
+			dev_err(mhi_cntrl->cntrl_dev, "irq %d not available for event ring\n",
 				mhi_event->irq);
 			ret = -EINVAL;
 			goto error_request;
@@ -232,7 +231,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
-			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
+			dev_err(mhi_cntrl->cntrl_dev, "Error requesting irq:%d for ev:%d\n",
 				mhi_cntrl->irq[mhi_event->irq], i);
 			goto error_request;
 		}
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

