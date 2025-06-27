Return-Path: <linux-arm-msm+bounces-62791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB184AEB860
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347363B6AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29212D978F;
	Fri, 27 Jun 2025 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rx2IMHYm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52F2D9785
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029337; cv=fail; b=BFIRXzttL4JqCHa4nd2wUcUiODNhljdTg2nKEIkp4QLqBaRMm8hTfFbPaTBatS9n3/MOcsOnV7aQ2tlPLrPZVgzabB8fNveNzZHVsizOrLzMroB4+/drD6MniEsnmEuHhaBhUalsFswvX8ma+wWnMAHuymPtHPDltmFMdtrK2aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029337; c=relaxed/simple;
	bh=rqoQ2LpGYaiMBSFma0BA6nsds7/OiMsDZ9gbC9Elqgg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HD2DN8Fdo6SubDAxIOPtevp0DCSoNlpT+ii5kNjjqyPoO0YB5Jlgs2vND0oPnHhX06mwgs2GziBAcxFf45p0b1rgXTqgfExx6o6+2wjUUBBC9gWI1SZ+l4ZQfDus4W/WRgh1XzXTn/iyrNtvTs5xDoCUc9VajeDV92fPgK15ylE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rx2IMHYm; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOtHVwiJKolcUHIZ//4CgigmeVULsXBGHVlKkxItb0j6qqp81UBAPgy5oxBMontJDH4B6xevidUyfJ6IltSwSdpD61mQNX4ITkfGnVil+jKqXLrmvUY/BfYABjHCaH91Rcg2axUjRBBbBldMD+fbtRqUHMKmzz+JhsqtiFZ0hfjJQLrbeRvetMGriLzY2sHRnmlYgzkVjmkL681cPiJ+XFKWY1zVjiFBKTKACxiLRp6rwTv5ydIBGhdjZZpohEica0nhJzBsP7RjZpphIoVE6/B6NRnX1cgoNTsRMB0GIjMelmnn8WPafmwTd9+Ra1YT/byheyqN2q9mLr5uxdbDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb48FKwvHd1DDXoCLvDFH/qCr6y0Hxlu7zhzOPIumbQ=;
 b=uqw8x6aZBR7WIcUvlB7BLyapqUamIOB/Dsj4S+/1K+c3imXUbM8Pv3QdJtmbpniY6J1zB66PhbkK20FAIeDw+ElS33p8HHMt8vH7dqwkJQx38yM6NcjZ/ON8cqC7Zl4eXSqpVa64f+iSJFD4YzdRfXRTglUpfK+SlUfPE1CPlHucI6hVRwKfnF9TmEkoVM6eh2sqQiOiPFbpxBNG9UhKU+HGwjvI5vo0nHs/LtFitqjlbZd/KCrHmB/hbTgdP9viwW22bkOK8LEszRrvYmXNeApjsBgfYBg99t+olaM0EqV+vBvyKqafRVEMyCFrSXyCDLmmX54wavw+ZsC4VxtIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb48FKwvHd1DDXoCLvDFH/qCr6y0Hxlu7zhzOPIumbQ=;
 b=rx2IMHYmKfNJRWbeIp3vmhaeDyCE4V52PaHeW73RLER+biaW+pSU1s3Q9waQBLQ1ClppCXaVgDcshFcQ6zwKEXB7ANRUDXTup4BO3rvPC8Mxu8zNbL5uVDny5v7xGf3vANgAZeA25I7O6cp3aVgRKR4ZHh0zUU7IJ+cnvOHtvzqmaImsu/XzyBam00TEQSQ9ARs3OAshfG5lLK54F1eNA8D3x1cHEGumF0iF4s3MDiGAg2tNTd6XyUrg9EY+J2Z4KeEnPkvOfTS14E5GSEt2oBQ6rJpE3FzM4VimGO0/dxak5Kxf2Z071SRbKFC1GmCLbIiGz2QJTuLGnjZQ0FtB0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 13:02:12 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 13:02:12 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: patches@lists.linux.dev
Subject: [PATCH] iommu/msm: Remove ops->pgsize_bitmap
Date: Fri, 27 Jun 2025 10:02:10 -0300
Message-ID: <0-v1-662aad101e51+45-iommu_rm_ops_pgsize_msm_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0411.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 004a7af3-986c-4dc0-9f0a-08ddb57ad490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SjW/6ZW2rh5XO6dY7cEf+1yzCn+vWYhwwon5Frka+oYcLkcYDYHQIFIoyzv1?=
 =?us-ascii?Q?4EYJiFJE6+EqLIUWGrsRPTV51l8O5MlVaUsuYFMwKD/0vxsPDl2AL/g+8ff8?=
 =?us-ascii?Q?XacUd5aiiEfuJBARYPrWZWQMG+7RB6DQZCsDQ7lRUtkfTv/L03wme5xI7VCP?=
 =?us-ascii?Q?zHbTa9BP+tzMVUU/z79umWdKfME3pZiCEFfnG0IhSWxwFe9fROM5cm+vS2Up?=
 =?us-ascii?Q?OAsRszcepoCR8ZIaRv5grS4YGZQn1eBUWffKKhnp1g6nnMwXmmj7aKfMcLad?=
 =?us-ascii?Q?+/jlVtTPAJ3OjEqjZBjlcoObjwi6fUQTXp1YwJBaj87YIlCpkY/v98okT0Wi?=
 =?us-ascii?Q?68d25mD41Zs/3sY0sCeYZu4ArNNINBYlS/PgmM1wFGxgCP5T9bsAg45aZSjV?=
 =?us-ascii?Q?lf+qVXwfelpday3h+EX3y0cG1jvpu5J1otm+2pd0OwGXM9hrBuDUehS1Iu06?=
 =?us-ascii?Q?dWcU0EKVQrgywV8f6Tw/x5CHKNOewq2VfdevNDvrnqBouhvneY/0f4BYUEVV?=
 =?us-ascii?Q?i6As7LekYHm71tpJEFXLDocs9fnONSwBAHvC4YHV5aYeHYb8TiB5ffXRp5xN?=
 =?us-ascii?Q?TMJ+jmntDcuZBJYHKxAb4Fpz/8KdKUD9GwDStoDkbVFroYT2STGKdLey54OW?=
 =?us-ascii?Q?9fKXxu60wz2PxSrvVtTMUcEpzrIVORdPc5FzuW3Rv5PS2FOydVClZRkQa3uL?=
 =?us-ascii?Q?5BRkhWbJ9DHi0KaWsf6IRhWhBmyHdCwE4V7enN69aG16Zhg9ZVU3X/+RSP+2?=
 =?us-ascii?Q?Z6FCJTOwRd16ivEo3qvm4W129igtcKAb6Mqp3LomXkoGN7Ik2wPbaJKTsHb0?=
 =?us-ascii?Q?7dFWOvh2tgHtWkLdyPfdUyFfTNwzYI77CHxybC4Y1Z5oebZsAurtBCFCK+p3?=
 =?us-ascii?Q?xbpJw/gec0QztpQi827Cx22DrJHdBUhMBWv+qOVFnoNWurF23hc6hQM6rhku?=
 =?us-ascii?Q?F30V7+JLZ24QLbNux3pyFt8FYYtF7wBSa8/5VsrA9OPEVbrrLiDbLzqHCLdg?=
 =?us-ascii?Q?zf9DAIVS/CiFyiRuRyP9rWfMf2ZJPHPg9GdEnxYfhAigGiJ4tTUoxSh8UrmB?=
 =?us-ascii?Q?d9gqTZ/uBVHl9yiJMRrc9PCMHUKcW1eZxlMrh6v/FFSODJfcbiX4T+hsJfQk?=
 =?us-ascii?Q?DZqus2qi7iQIJC3CISO2QHy/argVRghJAKBhrdoVr9wIaBotUlvVli4dW56+?=
 =?us-ascii?Q?lqiWms35xsHJtWfQrqalvSFtwwr0QDqDCViy54/ZrHzOAmQWK/W1d10kqSLx?=
 =?us-ascii?Q?QEVdON+CyjjHBXSlh8/sFQ03GFOwqogMbKKPR/z0Ms88JglrfgGnpwpNQYEr?=
 =?us-ascii?Q?gPFOFIUep77KGLFRi9efa77b3F+am5MEUCQfnB6BySQrXkPFPjfGtN739Tro?=
 =?us-ascii?Q?Stpxakvqz9VKq8pQ7ZZR0oufP/JMrDVL1FHFS2DDJzOnWQWMMu33aEvFXwxo?=
 =?us-ascii?Q?lniPO8wJ6xQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V+3Fe2yrS07Igw/1B1Mcx4+jn+TizRQN5+7qr+bKRysJR4u2FZV7DrAP34/C?=
 =?us-ascii?Q?pzisNmInXIPKu9HYmIM1Yc/UUmrozK4y4dBgnSzvrNOZkEAK88YidzMm26rI?=
 =?us-ascii?Q?C/6knwdCTTbObf3v7Czt5+ci5ALo40B36kKO93xeb1WWW+FdzYyobABjBhyr?=
 =?us-ascii?Q?wKN12CPQubZ3lQrhRwyp0TTKaUmWMCU6cZF7OTjrZ2Uock9PocM/jgWnmz7z?=
 =?us-ascii?Q?046b1F2JpLPp+OgFdXPi4iGi0R/7YMDa6eL4hhJsXLTV081yg4qMEfK4nZ1I?=
 =?us-ascii?Q?SAuZKWRsYnKhBhl8zqT6Gp2CIjqoYW0belJP8moQq2IXT4nQQe4phvOUTJGk?=
 =?us-ascii?Q?O2h+KUZ4nxvQ5hfXykwVqo84eHxR3kcN7500vDqWKzV3470DowpgKmn+7wWJ?=
 =?us-ascii?Q?I1BiIYqsU5VxlkdhmwxK6C1c4v4s8b95itBinwzkRTKJS8Sayrc+Dk14SUUg?=
 =?us-ascii?Q?AsPofRNvgX7dtqIgw4JS2YrmXo4FVQ0KNOLDUTTu931JJYYpSE+sqBeqJnXg?=
 =?us-ascii?Q?5YcEgjGKUeIuvIzWZqvEctxxXktzfldAdNjxQQnYnbyIB31FMsoAjQPf/Kn5?=
 =?us-ascii?Q?XQrGGWZCSlcQXUDbPoEJVhhV4DocS7CUSgK7T78FBtnogpEhez4rPaCzBc+N?=
 =?us-ascii?Q?/y3jZ5wmDZIVsRszFf+reaUIf/Bg5GcxBLwQRGw3oE1U4mRd5i69gI6QuGzR?=
 =?us-ascii?Q?92w606tyxcTwUjakyrBV26Cnr95U+Lz+dpdHISIlQgy4erZ2buOvw8L67qh9?=
 =?us-ascii?Q?/dRLh7x4y3wHhkf+HX/+oPdiBTf5A/uIf6mmcLMSZf1fmeMv+1SnC0+GD0ut?=
 =?us-ascii?Q?jKvPMlFWRPZ+nTB0m8b8T8QKtsjnZq7qW/GPfvr17r3ZSuMOti38fz1wiRc2?=
 =?us-ascii?Q?jAivHc7nWKBMUZifUmFZcLbdrlf5ZIC4mVHhpKZbb+5Ys+3+q/xfjFNKbyEV?=
 =?us-ascii?Q?nNwylwD5Va5Rsaclzgem5tah3IZG7zdvnfoeatvBD54gZUYBxEolgdZ1evei?=
 =?us-ascii?Q?nO10crOrPTDo2D19LS5C5lk0FThqWNZ1ilpzKl3VTiiUoQftYoMZ9Z015KRI?=
 =?us-ascii?Q?45G1iNE7QHX/D7w5h6WH7pQ0NGj2vpVKVD1PfoC9LvhzPHrsPtLlSYDNK3GL?=
 =?us-ascii?Q?tZjpFKzRd8kT4MtRBzQf/JheSD0Xe+a8ztMflZXngiZS/MH4Zc1QWl8v5Yrq?=
 =?us-ascii?Q?OVB92X5o7OK9RaMIl0JoQrb6FJ6FwU3h6LB4nKY17N2ggMYy++zljgOay1L1?=
 =?us-ascii?Q?oCsw/UtI4zAE/vLImVhNxTaEwvjSz9GLAGvFHIysL2rrGjFtxvQiXBNCn4B7?=
 =?us-ascii?Q?+SL/uMqVu/zzDexxCVe2QMAnDY6ZjYEKB44Ou/SKg3QWD9kV70GYCBmBfNJ3?=
 =?us-ascii?Q?MqTnPka0duWCBuM5VE45h3cPJeb7KZBC7+KRxWiRp8RedwtybNkXVK0A3eZr?=
 =?us-ascii?Q?EdDw1Ch5umV2O5Al5xO5//3kcwFJ4+4Q9ktbpCwXtLFUMsP2d8HxjWA9L/+Q?=
 =?us-ascii?Q?jO+Rc0LIache3Ytbd5U30W4Ty9bg9+NbZ//G1FM1CBl3qSnr6igAsyu3owdJ?=
 =?us-ascii?Q?hyi+PBw0fN4bS6F7ZEXLEcMOqF5VuUcVuSjvg3FZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004a7af3-986c-4dc0-9f0a-08ddb57ad490
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 13:02:12.0006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vCwSkEXMwDRXem1o/ypOW99wOzJkNfLu2cshXKXBA2RiHms/53wFxFJggyBrC8s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475

This driver just uses a constant, put it in domain_alloc_paging and use
the domain's value instead of ops during finalise.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

This is the missed patch for the ARM32 build, nothing is remarkable here.

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 2769e4544038c1..43a61ba021a512 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -312,6 +312,8 @@ static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 
 	INIT_LIST_HEAD(&priv->list_attached);
 
+	priv->domain.pgsize_bitmap = MSM_IOMMU_PGSIZES;
+
 	priv->domain.geometry.aperture_start = 0;
 	priv->domain.geometry.aperture_end   = (1ULL << 32) - 1;
 	priv->domain.geometry.force_aperture = true;
@@ -339,7 +341,7 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
 	spin_lock_init(&priv->pgtlock);
 
 	priv->cfg = (struct io_pgtable_cfg) {
-		.pgsize_bitmap = msm_iommu_ops.pgsize_bitmap,
+		.pgsize_bitmap = priv->domain.pgsize_bitmap,
 		.ias = 32,
 		.oas = 32,
 		.tlb = &msm_iommu_flush_ops,
@@ -352,8 +354,6 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
 		return -EINVAL;
 	}
 
-	msm_iommu_ops.pgsize_bitmap = priv->cfg.pgsize_bitmap;
-
 	return 0;
 }
 
@@ -692,7 +692,6 @@ static struct iommu_ops msm_iommu_ops = {
 	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
-	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= msm_iommu_attach_dev,

base-commit: 670002ea0de6d16a936defd37943ff6372d3a204
-- 
2.43.0


