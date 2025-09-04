Return-Path: <linux-arm-msm+bounces-72125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C75B4457E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D9E17BA84
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633D4253B67;
	Thu,  4 Sep 2025 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="K5g0hKw8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="V3biNrwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F58136988;
	Thu,  4 Sep 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010872; cv=fail; b=pea0i70ZGvQuZlSmmd64UXfOJMli/+ybiQlVJBCi1tdFKVtwvWLdECl+7b5tS/K2J3vMUX/PD1fIYAY9hSN/hCjJVWSL7zOj/jPJV/I7k+rhsHqkxJlcfR11dfSBrkfk0JtFKf9r4C6VZ7EUi8oEHMFtima7Oh0+rPIQUMLv/fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010872; c=relaxed/simple;
	bh=kBK8JAdNmfjvSLCukPePCzra9sJwEVFr2sUoTIJijhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MldS+P9RyB05Q8rB4i3NQWEoQe5OUMuXxdc4QXf1w29RSkSdrGmiNAAranKajkWpHJBjUB2C5FBZFJOqm7tCrS1IQdWCWye0m7jAQpq90yg8bERQi3i7mMF77PaD7kQNjusV/TYfG1NWNWPnrfRMfroT1oYfPtVWJqXZcaQLWHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=K5g0hKw8; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=V3biNrwq reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757010869; i=@semtech.com;
	bh=I6cL2ZW9XoE/7oFqh6bytqeqNvjH3UizOHZ16q7jlI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=K5g0hKw8t8WcardU1bYg1XQnmzwJQcLMwVleo8soUJlPhKOK/mlmHTIRMhJgT6tSe
	 NSmnrkOZYJB+rU0t5UNqgTJkA1D1G0zuTtmT9zUQhnt/BQe+tujXR4MQi/dhQ1DcGT
	 RFGUMhdE2jiWuwl/slF7ULjluOay7VxOY5B67CdQEZuvYO+hvter5LV51ml0Xb1nsp
	 I6qtZCWQFkJebgGMezt52qW0rAzVldt7ka6Q6sAe54L/BoKdhgVeSM/NNLQ9fOYZYv
	 WtpwrhtFxxPoIdgFQTgxAjHT2Ex1Ffosy/dFfr1QVONj19ZyCColWkMvuLuBgUF+oE
	 SelekY8GRar6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRWlGSWpSXmKPExsWikf02VnfL7Z0
  ZBs3X9Swm7j/LbnF51xw2ByaPz5vkAhijWDPzkvIrElgzLiyfzlqwm7tiZvdGpgbGK5xdjFwc
  jALLmCW+/J7ACOEsZpV49ng/C4QzjUnicdNZpi5GTg4Wge3MEh/nBoMkhATmMklMvvufBcJZz
  iSxtHsmE4gjIXCUUeLS54lQmbOMErea/7NDOLcZJXb0/WCFcCYxSqxrXcgKMplNQFGi9ctpsC
  0iAl8ZJRZfTQKxmQW0JH4+vgl0FweHsICTxLMHrBCHqErMaDwOVs4rYCpxafUjNhBbQkBeYvG
  O5cwQcUGJkzOfsECMkZdo3jobLC4kICuxYkIvVH2wxJNXN9ghbEmJazcvQNmyEkfPzmGBsB0l
  nmx7ADVHQuLgixfMIOdICPhKvPnoC1EiJ3Gq9xwTzAk7N95mgSgJkbjS5QcJlDv8Ek/3HoOG0
  DNGibaLUxkhGmQk2i8vYJ3AqDELydmzkJw9C8nqBYzMqxgtilOLylKLdA0N9JKKMtMzSnITM3
  P0Eqt0E/VKi3WTU/NKihJzDPXSkwv0UouL9Yorc5NzUvTyUks2MQKTCteHivwdjM9ONOsfYpT
  kYFIS5fW7vDNDiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv8C2gnGBRanpqRVpmDjDBwaQlOHiU
  RHhP1AOleYsLEnOLM9MhUqcYdTm+Hzy5l1mIJS8/L1VKnNcUZIYASFFGaR7cCFiyvcQoKyXMy
  8jAwCDEU5BalJtZgir/ilGcg1FJmNcWZApPZl4J3KZXQEcwAR3h8mQ7yBEliQgpqQam1MUXvj
  x3uapcdsfUcMoRX6X1Bn8+b2fj2O527mell+iBOvMnpzU5nthP3+Sy1u7cJRGZTbuiX0RfXfV
  V9Xivvdx8ozyXeX4TbvZuydgVqtqdpnIj/2PgjVOdLC85OaeHrNnNsL9ctnX/ioCyuCC1284e
  jNt3RxzNL7Hy2JJYMuVXsVXq6u7eaxFV29UU5h1WuPSrdQLL4cA5K0t2y2+K//Luw2lm1mWNc
  /5oKS9aOE9371nnoFX7GrKznP91v6moYS3JXLux7vWK5mDxvdxbWLr1VrXdjVjb2rL0/elO3d
  XljYF5rj/fTt5Woa64RaS+yzxn+b/NIbclZ1x+3JfYcKJSY3lt2YqJTTO+xcRzKbEUZyQaajE
  XFScCABt8E8AxBAAA
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-4.tower-904.messagelabs.com!1757010868!32177!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 11696 invoked from network); 4 Sep 2025 18:34:28 -0000
Received: from mail-bn8nam12on2093.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) (40.107.237.93)
  by server-4.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Sep 2025 18:34:28 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYexGPtnNpH7+K6oKOEkINmfaXq5UTWjbgvlBo1uGjN0lkEdFSUy3onmqB8pIISAuUrly86JtlRAi6Q3PgeAuuzQMGrlv0f3FbKVFm5Sl0OatZtujRs+8UFBDKBMC/+NJCnzbkIlqcJIboCLwO0TY83wv5t29SR8Ek28xWxR4si+4hecPOBFobgr+EbmwMukKZELrzFN3bnzOkwBnVSHzUTNjfGRt/xZMC+auuFDfTCAyCP31w9LvgaGU0DgGMpcpwubUFIcgquE8qdvd5mnfe8wwhpWmklWfHSS92eRSbMydZgpPWHZLuro8i5rnSkL4SxgwTpWgAHn780ZNpDNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ev3hD5W9iP48E3BhyzAuPsHn9YMXf9Gque5GKaX5Cg=;
 b=ycRMftXjFNSu5RQCrK8U/fhl+OpePSbAXfaOokPbvsh8S5K6V7UomA9lEdYdf+S7NvWYVrFlPMKaz1/RQW5QadQK2ZZjdyrhq27aCDhsmCi13Q7tUys/A+uy1qeV8pgUhWZ5UMhF0CQB7UvG3jgAajBuXURHED5IF92ELnqnUD+C4qBAztzLw1GY+j6bd8oMUhbQJ8ML/ntcrRoJfJ7VbtNICplaDqKpPYYttarP8iLpZhnYe76Mnqyq649i3M8UZOAdmfpZXzl2aaLsOPTAaqfHf+C6TvikQOsRqaSzaUoLXZqjBHmvlDiVS7jLvuKNiPp6JDr42iMItKtdYvROlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ev3hD5W9iP48E3BhyzAuPsHn9YMXf9Gque5GKaX5Cg=;
 b=V3biNrwqRM5WOo3cik8Tu/MmLXl4+eNdJ4/RtWxvb1kUhhhOK5spIq5rmZOdI1zi+VxxoJRBuxPnYvZIy0FewgS/jMIm9tn4M+MrXQgAuzW7DXmQpTRtA65yPirbSG3Ujq7W+2uiB0jhs629FVendPTqzLYZoBKt94aQMXirIvo=
Received: from CY5P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::29) by
 IA1PR20MB6502.namprd20.prod.outlook.com (2603:10b6:208:44e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 18:34:26 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:b:cafe::85) by CY5P221CA0013.outlook.office365.com
 (2603:10b6:930:b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 18:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 18:34:25
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 4 Sep 2025 14:34:25 -0400
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
Subject: [PATCH v3] Fix potential kernel panic by calling dev_err 
Date: Thu,  4 Sep 2025 11:34:05 -0700
Message-ID: <20250904183405.32986-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Sep 2025 18:34:25.0336 (UTC) FILETIME=[8A315380:01DC1DCA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|IA1PR20MB6502:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a61d0b65-2ad2-415e-5e86-08ddebe1ad20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMnLdvq8aOXYDejrmqk2+wftLuxYrDWDHmvElrDj1urAUpfaigKIfB0EiGMz?=
 =?us-ascii?Q?WkN7NwtjAsP1E5p0cnDrQz/a3FLByGw7JH9FhI91qwRq7js21DGI/VO3mYOy?=
 =?us-ascii?Q?z/ZCrQRJ/e1IhWwHLR6NUiTP52YWqopl8+mOjf/Y8UHP8F/ULNZ9PQyx8AL1?=
 =?us-ascii?Q?69gh+wMPk2zEEj9/kew2R/JoPzhBNMpljgBNPstLp8tw8/U4jut5IUpqqsca?=
 =?us-ascii?Q?RnMa9IX/SFtgVKj4ECEWeddnoJlrA1GdqrM9BlJMuAtkxGHQRhq0m8pplyxo?=
 =?us-ascii?Q?GcLfeq4Z46uIc3i4qcxO88QT+pc8EZWKFUlMtQyxnsYvHZQFB25h9uQUnOX8?=
 =?us-ascii?Q?zJ3y2EYp1qgTZcd3APS1r3eSucaBh7Ls75RbcYse7FC2O6QgjZ72i4cBsg/H?=
 =?us-ascii?Q?7Czr8kP4oFNJXsv4hF0N36NUmFW2YK5mYaGiDTZtnJ1vRREXb1xHrvWFDeNQ?=
 =?us-ascii?Q?vRVpuutWYbRS2ANlkzEIbRuBvJPJn8Z6XUeUcuO9kwW5TgyAdBQu6hrr6qEG?=
 =?us-ascii?Q?QogzSXuSwuJSoCILiBwcHlvBid1JIFm8qkeEZY4J784jx9J9YMu8O3soWOT2?=
 =?us-ascii?Q?of8ftuPehIKEdP8phjg10KVj9MMSu5XYimRm7w0YUabStP9Uz2UHHMQOmadB?=
 =?us-ascii?Q?SBuA4R6uTG0vu8iRT6N0Ux9puQWvQFS3SxxQPZF95uzJZFB4KxSmuvUREQFP?=
 =?us-ascii?Q?jFCCg/Zzht1iPxiTPqKs8Pq8Rrr+/Jw8TxTAEOn+ZIqxIEHQKb7c8tFrtiWH?=
 =?us-ascii?Q?KWZagCkjiyhD+7/qbdnlSbmYtJhTCdR4QQze/ba+UIckhB2LT8wp0ohTHsDl?=
 =?us-ascii?Q?k0JMxNKHIisjjy2atj7o3RyOaziN+kK5p+FhwhfnFTjMTtHiuE+1VRDq/fNN?=
 =?us-ascii?Q?+biSZ67WEqFyRFksFbkX1ikpg36HRdUL2sQqubFqzM7EweDb9rUF7vKz59zi?=
 =?us-ascii?Q?Lw+Z6tKuBdYbNXI+rMPNGGYV5YF7PQ6HTrbSF5Q3Mt47VIxNB+cNTwREkXJv?=
 =?us-ascii?Q?3IvPI3mwBdE5baUdlnHKxBKcL97OeDEIMlj6T1q9X3MdvRcvtyTWfdJdM4DP?=
 =?us-ascii?Q?0TSoRcEIKmm3ZaZVH5YnSp1Ejgb66LV3RydiKk728GNfa4twIHIUuKqXmVoC?=
 =?us-ascii?Q?tSYHL2SigEkjR30OH7Tw7Gh6G9cZOjtb1rYVaySWuPGVIQ5r/E1ta1mX9QWR?=
 =?us-ascii?Q?y7S5gxMYtkrRfBL8R2qL7ZsGpIBGVDcclH7RPocNtOt+XMT6V8mIvpjO2weU?=
 =?us-ascii?Q?k0F6oJl4acg/gQq7GAFJ2zC5bXxUGv9FyPMRO6qX28CMKwRb38aTn5s7tSjy?=
 =?us-ascii?Q?7wxSA52G6G9Pg8RwyU8lLY0E6kpqDwx29qjC0pSB5fRvaomihwy4MCPs2R5+?=
 =?us-ascii?Q?t+QRLLpJtHreLKnmoDnzE+MVt7zQVNaOFh040WSfqMgpD5GLVM3CksH6qUVG?=
 =?us-ascii?Q?qLs8e3wd2L1nz7H5O8OtkgQG4qd7foccWGmiYgNDX4RlBOp1JyHUyPz1ClfX?=
 =?us-ascii?Q?isi3VadrLcORU+k4Tt5wV1LsW8ajMv3+Y8Cy?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 18:34:25.9621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61d0b65-2ad2-415e-5e86-08ddebe1ad20
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB6502

In mhi_init_irq_setup, the device pointer used for dev_err was not initialized.
 Use the pointer from mhi_cntrl instead.

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

