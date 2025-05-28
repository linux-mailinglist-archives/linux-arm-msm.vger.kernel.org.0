Return-Path: <linux-arm-msm+bounces-59730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43DFAC709E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 20:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E54A25981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436D328E566;
	Wed, 28 May 2025 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="OQuijwmK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="BdopeI+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F023284B37;
	Wed, 28 May 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455198; cv=fail; b=lUIaarXsJz1W09jWFfKbqjwe0on2ty4ARdH5q3lT97jWZG5nDKv8iHTkyL4WUEorJ/G8qmBF7t/nz3lNYTtTg+aDYLvPLG4O6pc1UplLCfuVJEQvaR6wFffx4IQi1pQSYyTJo01ANxYkWxNUCTdrqxKiSWC0WKnNvptoG6papmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455198; c=relaxed/simple;
	bh=cdfwOby0l3/9746vq3GHpu0O+eJeMlwBMYIPSd5sspw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TRaZ8PX+D1p4ivLW4ffxugvoE1tFlEVJBsXD06hTAozgTL8BPRelqN4P55sA6LzGAlkfXaGyk2ShFN+//MRjxZ9Lssq2PXYo9HC/L63YamcTA8k1ujisGtCGmk2DuZrMQzCScK7SZVv52ZLERnudHU+YHeG16VlGwWrwZuS42cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=OQuijwmK; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=BdopeI+h reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1748455195; i=@semtech.com;
	bh=NiWm2qQOyJMNR7Xp+qeVrOO8SyuhU/0vuFW4UpU6r2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=OQuijwmKsPfn/xDu6HBx4H1tuSzTv0dpKFHzBqoUDmNKm1it2Zkza495rrGbnOTwt
	 khmWrulT2EzeIDmSnXN8QsjqHpb6BssjZGefmkJ4dhTfOzw8xxdvGTNbYdydJwGt98
	 fXC9UTBeA4kfv9AYHkiFmbyriutQMHegZ7WZlby1w2TYhYFUieH5G+YcSgWyTEka2u
	 BIsUrJKfYfRSrF+9AsjKP4+rCzHfF+Oi4ZcfrXKCmqRBLBtsAo8UpqITdvc47R9bmM
	 F05HGkCMieJ008sV+WXy4aXsjoTYl/+Tbms6eU/sA3wa3In0e9YVSToteRVcLKUzUJ
	 +7pD+JmHD+wOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRWlGSWpSXmKPExsWikX0/XVfK3zz
  D4FWnicXE/WfZLS7vmsPmwOTxeZNcAGMUa2ZeUn5FAmvGiwOTWQpWcVec+rOcpYHxOWcXIxcH
  o8AyZonuNcvZIJzFrBKfF39hgnCmMUk8bjoL5rAIbGeWmN59gx3EERJYxiRx4OlhZghnDZNE2
  8ofYAMkBI4ySlz6PJEFInOWUeJW83+ontuMEi+/TwWaxgnkTGaUOHq4EsRmE1CUaP1yGmyLiE
  A/k0TnxKmMIAlmAS2Jn49vgtnCAiUSW3fvBrNZBFQlHnUfAJrKwcErYCpxaJUTSFhCQF5i8Y7
  lzCA2r4CgxMmZT1ggxshLNG+dzQyxV1ZixYReNoj6YIk5p39A2ZIS125eYIewZSWOnp3DAjJe
  QsBZ4vauQIgxEhIHX7xghgj7Six9GQRRLSdxqvccE8wFOzfeZoGwoyV6+34yQQKlU0Di7MJGq
  MQ7Romt0zIhbBmJ9ssLWCcwasxCcvUsJFfPQrJ6ASPzKkaL4tSistQiXWMTvaSizPSMktzEzB
  y9xCrdRL3SYt3k1LySosQcQ7305AK91OJiveLK3OScFL281JJNjMCkwvWhYsIOxlNTmvUPMUp
  yMCmJ8rL+NcsQ4kvKT6nMSCzOiC8qzUktPsQow8GhJMFb62OeISRYlJqeWpGWmQNMcDBpCQ4e
  JRFeHSGgNG9xQWJucWY6ROoUoy7H94Mn9zILseTl56VKifOe9QUqEgApyijNgxsBS7aXGGWlh
  HkZGRgYhHgKUotyM0tQ5V8xinMwKgnzavgBTeHJzCuB2/QK6AgmoCPEI0xBjihJREhJNTD5BU
  Y2SW0X+X19aZB4oPuq1vB/Zxnt7V+brZNUT5x1ak214cXYuSKMwf2BTtMV5skFvtZx0ebg/em
  aqV2y1juiRtVcUkz4sdZhM8tbJcU+8+571vut6w6eVveFiXXWhL4pUi4Bf7SYpW2Mmrj3P5EJ
  2PnzQqXaxqVPrrBfuN7SqiW8/IL964wPE73WMbS0rLAOvFQdeVg0ZJpy6qL/0Uwy1TvsU8IyP
  L7uaTK5p3cuYULkTId5gSxeB9NdpWdfsLomm3tI6a79sQO29xa1nMs577Gz9a+xzvMHEnf29+
  xIf7lx/etpr20fnirTuy7x6MvPfObpu68mvXjad7alQtHkE/s2OWuHbwGHVtx68VuJpTgj0VC
  Luag4EQATnTdUMQQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-12.tower-904.messagelabs.com!1748455194!181576!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 3107 invoked from network); 28 May 2025 17:59:54 -0000
Received: from mail-dm6nam11on2103.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) (40.107.223.103)
  by server-12.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 May 2025 17:59:54 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3AbiVnBxhfgWeye7sKTxPEKm2W38n0hhkSvOoCfSZctAAaPbfGF3kVySySr+8fH+vyivHSHeX6Q1aDgqJkjlsjLjZAD+0zzFOlSx78jY/X3g2Pq53hXAAd8IzQGulNRGUFmyVjxTeyWUfsAvRMQDLD0WATs/QzzhdzeMfQEwWp0IO3PkcIaLuDVOQTzhxFs/M9gkvooOMXBNQYYtqnaeWk/I893wz/8VD8pi+TGdEpCEVMJpDSDOIKRe0A/6XJTA6AVCClslVMbIsDdzWke9uePBMnzs+lTlbIAw3fwzPNziXlWaBwkzYaTkGluViE3HP9wvtenGFg+eKhnX46k/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=OXYStTveWMMFLlE7QmrklzEW4lHUJS0LgiRU3zC0JmAHCM1aoV4LfvmJn0aPBXTaUyG9kUG1QaRXBdDQN8citOsLwcT9/iPs/TLWGskF55es5BM3zmpf5yupCE9F9fp/xS+RM+AM9qqRRQmeIYYvuN7r6NZeQ9Uc4DzTYcTKSteuePhTZBRjk9+qsxrkRb115eZt/gdoB9HTs7sCy20Up+Oe+UEXqU0SmI9VJ7qBpmKFullrATIdU3YRNMMSf1ctBICZluZIL2Nr+ADczlfU6qJbatDqEw5VxS/8W6EsZxnrd9jvGEeuUL8urOLhp+737Q2a/tVcUwl96/OCdKaXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=BdopeI+h6XH858UP4vaSGwPEPvElxif8BOpDM1IcczVFYMCGYK6djTzRsfKRnjvolNbFFP/7g8o8KzGXiwsX36p+TfMFaIGlNPH+5sI9nNyjIa7R0r7GbR7VAaWynOXdhWkZdBipP3wLu+/Jdw83SBhJ7NSV/d8H/RpWntyeEtw=
Received: from SN4PR0501CA0125.namprd05.prod.outlook.com
 (2603:10b6:803:42::42) by SJ5PPF4CF2DDE10.namprd20.prod.outlook.com
 (2603:10b6:a0f:fc02::a91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.38; Wed, 28 May
 2025 17:59:52 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:803:42:cafe::2d) by SN4PR0501CA0125.outlook.office365.com
 (2603:10b6:803:42::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Wed,
 28 May 2025 17:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server id 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025
 17:59:50 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Wed, 28 May 2025 13:59:50 -0400
From: Adam Xue <zxue@semtech.com>
To: manivannan.sadhasivam@linaro.org,
	slark_xiao@163.com,
	johan+linaro@kernel.org,
	quic_vpernami@quicinc.com,
	tglx@linutronix.de,
	fabio.porcedda@gmail.com,
	quic_msarkar@quicinc.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
Date: Wed, 28 May 2025 10:59:43 -0700
Message-ID: <20250528175943.12739-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 May 2025 17:59:50.0142 (UTC) FILETIME=[4E6299E0:01DBCFFA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|SJ5PPF4CF2DDE10:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b992184c-ff87-4533-96d8-08dd9e117139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dWVnRe7dF7DHPDQetDtp0UX0JHNpiB6ui2Tchx5JT2yPIkuQOSUMjxiXzwIs?=
 =?us-ascii?Q?7NYBGUgpoveGI6McfMHmtDM+wPiMy4yl18t6fIc8tbXUj8LBELmYBOxD80UQ?=
 =?us-ascii?Q?ePtFsbjq6RSg6KuAwPb4vZbqzNF6a8JE2wVJXEXKZWdA0i0toGWTc7pMBlkW?=
 =?us-ascii?Q?OUwl5D0NeIWjgz95K0s1Vq3uDnQ6DMeetHVHaIHPrzNPDmtSyqwxk6DC+vgL?=
 =?us-ascii?Q?ovoNkSSV9fvon5VUANAC+u5k10PfB9wwHWdD6bLLsplMrOyv3s8CAc1D6H1i?=
 =?us-ascii?Q?47jfEtQhk87QDZ+y1GAxmaWqftgaSIxbARx3JiRSTAAwXwTiM7e/KzBiN05e?=
 =?us-ascii?Q?ZSdD6gmREIcRReEqZh3YX/3wlJV8FpK2PfAJ0IDR1TCZTQ23PbKZc/MLFBOy?=
 =?us-ascii?Q?SQETIcobXQcHCiIrMHltD89SgLzpNsoRq5FZmZb8aLZiRGFRNIKxeIK6lMfv?=
 =?us-ascii?Q?XuSLhrXA6acaYFEQ0hQ+LGSiECR+cbBRD4VtdEbxzgUvhwH15p/oAj+QDgdv?=
 =?us-ascii?Q?t2zRZ6quHiL1Uqw9EOXuD/1yhHTz3VX4gcjd06C4mftj6C/Jjg1qFTJVMDqn?=
 =?us-ascii?Q?exuza3tlSZaW/jLDLGG5GPTdLziJzBme0RuIneB7/AjzXH67jYiTUxwpOcrY?=
 =?us-ascii?Q?duArmp5avWzpABpK8a4YBYRLpCZymjt0cU+aB5N3R5EGGj+jvExBRTyM/sL1?=
 =?us-ascii?Q?QQx1ID1tnp8zcJUTzMZx17D2wqosgAyNTwaDA7EpNgTaGqdJPRL2YQwfUVr9?=
 =?us-ascii?Q?M8q+e8FQRYNMSBkTpM93prRo6rYdke+r7j9/9U6vAMPTfBwVqMgOFvckNwDM?=
 =?us-ascii?Q?9EYgmEO82WV+XYEvACgUZ/XznECAPlsBVHKMYmSQL9x46En5T3snQ9tCtn65?=
 =?us-ascii?Q?gxNHvx2KyTUGkas5BT/9OyNby2jxfOjfwqhnvw65tiuAFjisWGdxttQ7Ynmf?=
 =?us-ascii?Q?THnY8mZaqQV6gU2C90QyvEXab+ya9yOHJF87jRRR/rwZwLUEnscf5VBjky0/?=
 =?us-ascii?Q?FeZ9zc54C3Pygdv5EbTkNM4esYpPVsLrKKp/nE5D9hsLwYEbErba5DRAoswC?=
 =?us-ascii?Q?7C21/DW8Z5PnGQMWUsir8ERdS/XDRhvDMOhNiQ5QFykur8wmNo8BdwKXbTXl?=
 =?us-ascii?Q?/0VYNN1Tw5tOIoVct8HlBWVsQXOtBPuZXvpeM0Lljk9l2o3Lc1UrxFwG8+4q?=
 =?us-ascii?Q?YpZZkbOmC0V3JxYtHECA5HoMY9MqMT5A4feBtVpbatSY2JvVUocr50S4R7ZE?=
 =?us-ascii?Q?kNyq7xQLRK0yeSiovw+uOLoU21Tcm7PbqUNW96l0W2xT60CTOm7Iif/WrwJl?=
 =?us-ascii?Q?5TgMQVQGT91eJ519ErhXFYUiLyvPSQ7z157AAfGkykDYecC2IwjEfhA2t5pq?=
 =?us-ascii?Q?h65iq4wARwWhxIcNvGQRPNXGkY/r7hZ2DNPXsj65Q9y9G0ZHdh35ySG3VQTA?=
 =?us-ascii?Q?IWvwsX8o0i4pvvVJeED6e9g7M6iW3c9Z8IF3JlmTBM0z3xr/v6t1eathInhH?=
 =?us-ascii?Q?6sUxix0lNqH7Zbgb6bCyOV0QC2iAc45cHCHi7PTx79NAXGqddsu/RwAqAQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:59:50.5711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b992184c-ff87-4533-96d8-08dd9e117139
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4CF2DDE10

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

