Return-Path: <linux-arm-msm+bounces-60686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BEFAD27F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0B03B155C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38722236E9;
	Mon,  9 Jun 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k8EQfiR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D998221FDF;
	Mon,  9 Jun 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501702; cv=fail; b=sW+Qh73nJc94Xzfe4pLH7JRKVb33H7VsOCThXfZiIuDg1/RaOvy+rfmKG5Z3CQMdadGARbYVZIuYdg+9z3qQXmfPMnUWKHdVIXiL0XDjxuWE1ZIfZVI1yTau4OCGAch1/g02Hkxqq5y1CEjINzQcqjIqn4ZTUB4qj9trcF2O+Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501702; c=relaxed/simple;
	bh=IZ8MSJscp7Yohy+2doqVN4WRDHeo59c1ifpIB8kx+jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jOKM/SQszH3CXDzmWkZPxlXcW7M6rod1bFf1FFsEmztTVbj1k2Q5kRHTYKDwpQO1xgu/r/WQK+k3oXHXRiO4ZLMV9KvnoOvOA6FBzoXmOaM0vG2hgKqf5yG+jolp+szpi8XMjjnLOfjO7o22ac+S6CWa8DROgXwF3SPJZjx0PnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k8EQfiR9; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqO9F7514rpbD4vjh2+Hzxk9u+B9oepclqir6leYVoAk6RmVwsra3BOhbjZKxF0BxXnzMLtqpCYeg0RXUroNkFYcJBEy9YccKulnut+t0fF/iCIJUH9MG3BzFGuf1FZ/hnFVarouycXe9Uh2S/82ABODzMaDxGFL3dv9gMQZJIgjd2pVZIbKJNznW1iV7pWIerrUzoPO6coEZpFJvh/Pkp0E26fj3q2Od6roZweWWzC77bWZ0+M2m3lGMOvKeHWSc++szpssiupCx43p1NiE1XFq38Ng943A0A6NPhHiZzHKV+Azq0lQkLQxcAAIC/SFmse3EDNXyuOimLjbDomWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpHHodUL5vrLs1Mon5zC7axoiohqBLIxgdIJB245QuY=;
 b=lR+292QvaMsGnTJJHNl2q2F41eludEVvAwQCBL6sumIhAebcujwTorUSkT7s1oJSSv93PD2r2f8GdMAsITNKLbqXnQEkA4RFN4weURTKhfZdcOsKwcXnbKs05PJHpWDP8tkGOkwB8Ct2vwn9vKaBpxP6wCoUe8W+uStmaTP2uIpdd2ZMjfmGQP+UHRwPfDU7MYusg+smeqlJkUTAlxrYm9laWNDAPVnRP3GZKuVXRArUfNR+w2kBJ8Vk1ByHqZ/AoYG2X1XUp3tztoEXdMF+2Dsmzau7DBeUCbsjHT5GoOHTla5xI1SmYyDRYez0EKcJFL458eo/fe0GxC9IlVnOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpHHodUL5vrLs1Mon5zC7axoiohqBLIxgdIJB245QuY=;
 b=k8EQfiR9mvsnLI34ZxRuyk9csRDte6YMwklVjUz2d0N4kVhRNFsdJ0Sb9mtny9u0rTLU36Zk/LLWkl5QMHHG5jsWhnCcjT8OGEZYYdseg+r/qzYvrWKI5gGYnsGpwGNIEi49hxuOk6ajOxBJMXetY3p7iI8fV3y1mtlKbS3zyZd4fMpfMb1h35cilR8CnFhgq4YW44U/fz2mBQbJ0HTVmYVPZD2WzyFwxcEu5ocEgf8fiZ9p0U/Iwesw5+JsRZ/IsMEm4+GJy/mbFdudx2ztiBN71CfiotQsbSRtJgYTEQdRgZ0Ihbx+fh9QN6z1lvh5k7u9R3wI+YyKV6AOgsHeLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 20:41:36 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:36 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>,
	Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Sven Peter <sven@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: [PATCH v2 3/7] iommu: Remove ops.pgsize_bitmap from drivers that don't use it
Date: Mon,  9 Jun 2025 17:41:27 -0300
Message-ID: <3-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 284d45da-8992-4951-35ea-08dda7960581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3A4a/VTL9VCyOggSipK1vOnyEbYseRyWNlgD0us+NY9Dj2bw87s2yXHBbO++?=
 =?us-ascii?Q?8+Iey0cf/cazdI+nrsE0ETnguKzVyAT8SH1e+KswbVV0WgwUNYfa/7Fek/ta?=
 =?us-ascii?Q?faw62T/4Ivlk4eILzDedVCHbtmO1dD6WafFXGyGqIpPV9NB/OLnSOAeLKNNH?=
 =?us-ascii?Q?R00S1ekwX1wg+XICC1+0dkFDqH9pVUPFKf+Z1IxRZJHKLCRubP5vz8elu+2U?=
 =?us-ascii?Q?si8OAXZu73q6TYw/q/E+6yH6kVvb/vE+BcZgdGOOM9K16ptaJnnonYdCFQ9e?=
 =?us-ascii?Q?BxONjwoglTnp2VCJTNtEgthHzezn9SFCJjfCrstBl05SgdCMb6c9WA4/GUiw?=
 =?us-ascii?Q?Xop0Kmb1RSMwS/1BqWq9Q0h4farv6UvuZzLKt0ghfO7hNTUyulR98t8mdZTe?=
 =?us-ascii?Q?oR3AFLNGi+5EhNsEXR2QrQn02WSsqoBBMPuX1SSP1TVNxneY91jV+0ssgD2d?=
 =?us-ascii?Q?gqdv7VVCaOga6glG7olTAzqa+GXPRnzWlGxLUBgzjrxeM98tFYdNwlmxFfhd?=
 =?us-ascii?Q?VUwQT2GXN2A8ABjOdxKu7ozOamnMobDOXESw7wrg/fuvrAgxD9VROHlo2XJx?=
 =?us-ascii?Q?meCKm1Gl8lz1FJFxGDreJ4log+Mf6uXv2qq8UR92Ew65kGrR9KqzxKKSqYr5?=
 =?us-ascii?Q?vpvjr7xNQn+A+qZAC3BUKK9Hy7McXy2IGWQpNQbJ9c3CeR/K5zDC30sE/LbW?=
 =?us-ascii?Q?mvmF6jxzL9EXyeLAz3umPvi3lZGa0bAMOPVFfL5vpK7pOvqG/cedH9x9dZQQ?=
 =?us-ascii?Q?vNrRAewUeXhvpQiZs0U9MEbuQNsgUoqQkBaTYE05seto4hLJ0ahTn71JTd+s?=
 =?us-ascii?Q?UAw9nhDINQDym8PzQAe1YVjdj+cIJ9dYhJhd+aCu2Q6hc7bC/I/XJ6CJ2IIW?=
 =?us-ascii?Q?dvsZgZcgpHYWX0HlEc289d//MKjH8QFzRH1p7C32VryOdKsVhQN7gmlAv5lx?=
 =?us-ascii?Q?LsKqKRUeBZ0b4G+3PUvr+6PK8VXjDYZKPyO81QqkYXV8AML9OLyRsFSSI9XB?=
 =?us-ascii?Q?pJJWfD3BxWLcSZzGsf9RVJNBU4Luw7B9GX609Id8Yezh+t1uodZm3IP1ZjgB?=
 =?us-ascii?Q?LHWLyD8MzSueF8VMkljDRY9iR93Wu1nHsO1iFSXq9aMVQV7WUYU4dZVfXkf/?=
 =?us-ascii?Q?D5HDo2jFpFK5PUsEz8qyMl0LDMXtUiuVxBBn9tRQCbOq71NCuFEZlJcKjkPR?=
 =?us-ascii?Q?cMZmRQNk1AeZG7x8Xa8/dK/XREc2LU3h9s616xZLDsL2hop/W2guTco04mY8?=
 =?us-ascii?Q?ORDUjOHAbf91WpN+O6U6naAAG+L4Ccj9EXjXEUUNCZPtoA6IqDogNL8AOjFQ?=
 =?us-ascii?Q?CefokpahLb6mWTvi9nhKrAvJpECpb29EWuF3gDEozQjuENzT7a3VwaGYvRro?=
 =?us-ascii?Q?fPTm2xQ1ARNdTJ3LiwFId+P36a3kmgekpOJ1K4aXWUFqypxFZYasWuIIMXu0?=
 =?us-ascii?Q?nYp5qlFpcc9mdmgp2Jn4c/8cMJa+f/+blYZKxTXev9anNAkyEke6QA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lj/9zq/zv7N5s8VULCTjrLqLQE1H2c7IKaNEjiIxpUHDH9knwjIsrPNLqo7m?=
 =?us-ascii?Q?90P9s7kYSWdi3OrkAFOBvZfYf2ZAvWgohxyMOeOPIlcRUjGvZc3sBphA1TDh?=
 =?us-ascii?Q?52CRTg0lqToOU6kR4LhaLHPmloHfIFKCrMlmjSbnFwQhvS+NrQDXCC6TGvU+?=
 =?us-ascii?Q?yK/57XZL2JqJSekccecIhRyWpKbCYMRlzLPQ19ntSfi44oxxVP8J2EZ7LwA4?=
 =?us-ascii?Q?vCfCZPey38jd/AOJxw6fHKobsPtvlgc6W56DSZ9S35Xqoj4vewNX7it7RPi9?=
 =?us-ascii?Q?qi4xwJw20cOJY/a26onoNT1gT+D9e9ECinktxinUDR6BqAm8D0rKU9NqXaZi?=
 =?us-ascii?Q?AFnElRRli3wkHVP29FVPJnWAITpoST8R6IF3i+rQWAQXya9VfV3R2OhGswft?=
 =?us-ascii?Q?0Rz3QzssmXCwsMFZ+XQaZ2SCQFdVBTsLUIpl+mmykYrmhLji+zVxWdVOlPIP?=
 =?us-ascii?Q?hH1M1Im9g+O9cAjt5XXD4euJBIBlYlbArwdJix8G50d4mGEfE4u3PF3N+hos?=
 =?us-ascii?Q?pzfmJFwVUZkXw6UY9I5l56hN8kJ9shEPFXugYsMF130HHUY75+hW5wpRMlph?=
 =?us-ascii?Q?ct0zO1r3w2Cbr3mj4QyP7JSBVigPWgvNIzuf5Pcv2ngJZAjfFPjAN5c5g/kY?=
 =?us-ascii?Q?NJGA0Y8f2EPgjrJlhZVxoYLJvWtjoZmLiEvsDQGH/P5LePfbKXavejQOtVB3?=
 =?us-ascii?Q?WychLEPTbVbVG1Ge4l+aRo3dPBj9r8rU0vZDwXQbjiK17jjGIVjLybfm60u/?=
 =?us-ascii?Q?VWQs8yvvyc+xOZEA83vIzWN6q3HH4UBOOpNpIlOJf7nkQFKipabWQSVTgCat?=
 =?us-ascii?Q?ED+AnFhI/4OYRVc2Sf90/Y0DSn0bc8xFqxTkLblxTrP/5ZZtaYUyApc76fQJ?=
 =?us-ascii?Q?Dmf7Lx4yn+VOmq7qwlZgG6cLRH+BLwBsVi+SRQi8oDk19Uyuv1lSu6MKj121?=
 =?us-ascii?Q?e2y7ChnHrcB8XWkIj/DLtPGU0wu4BoMjXkb1KXRShgEW2+s3BFnBQ53+ChHE?=
 =?us-ascii?Q?7XlTdbx/Df9Fi/hxFaaGI7KqpCW2v1QGxLOxVBHnJmAJptaeSznJQs9SXRzp?=
 =?us-ascii?Q?25OA9/c2oqare44HJhtpQtZTMxUXzLlCVOsmnc0r00ZvPCxBMvfCTiUD2g2h?=
 =?us-ascii?Q?IJZ/AukoEt6kpEg1OhB2L5EuXUJIUAMuDoiVgjd5R5G+jREXXizQETZc7RDV?=
 =?us-ascii?Q?0yKQhO6+a42PU2am7PJ0nmDpm4jruor14KITbnvX0O9F3r7H9fRETY1OIFcy?=
 =?us-ascii?Q?2/kxBvWPcEicHCnAEUdbFd1r/BEIx/M1tRH0mje6IlYjV3gjrsDilCp71AJx?=
 =?us-ascii?Q?OLuwH8b/wGfmjw+litlBQXunURyspmh8I4W6AJRYI1FfSSN4vS5HDRqsMnnH?=
 =?us-ascii?Q?SewsumJlJq35GZb39fCtpb7x1OM4sIjJ8cfrHg7tJtIeGwaeDnGvTZBtFE6R?=
 =?us-ascii?Q?aESU94FblJM5w37l+iwjHY30gPhVu5FXfFiEqQH3rQHxtVyDFI9Wuzt4f8hZ?=
 =?us-ascii?Q?gqOQRqjMYSn8RfKg2dVK18C6eoxEXH6o/u/3ll19SY18+qBOza6CIUyJalQL?=
 =?us-ascii?Q?x09hNdDzvEPUj5hcQtRdrANC6YXgFZCTnBKz7JM8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284d45da-8992-4951-35ea-08dda7960581
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:33.7988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds7d9AuvWHeMA5Xxk2bfLp3BufNUYFYwJD/EFaXSKfM9xiTvtRbIzrv+IVretd9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

These drivers all set the domain->pgsize_bitmap in their
domain_alloc_paging() functions, so the ops value is never used. Delete
it.

Reviewed-by: Sven Peter <sven@svenpeter.dev> # for Apple DART
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c       | 1 -
 drivers/iommu/intel/iommu.c      | 1 -
 drivers/iommu/iommufd/selftest.c | 1 -
 drivers/iommu/riscv/iommu.c      | 1 -
 drivers/iommu/virtio-iommu.c     | 6 ++----
 5 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 757d24f67ad45a..190f28d7661515 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -991,7 +991,6 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 	.of_xlate = apple_dart_of_xlate,
 	.def_domain_type = apple_dart_def_domain_type,
 	.get_resv_regions = apple_dart_get_resv_regions,
-	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
 	.owner = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= apple_dart_attach_dev_paging,
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 7aa3932251b2fd..68b695953c57ec 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4365,7 +4365,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.device_group		= intel_iommu_device_group,
 	.is_attach_deferred	= intel_iommu_is_attach_deferred,
 	.def_domain_type	= device_def_domain_type,
-	.pgsize_bitmap		= SZ_4K,
 	.page_response		= intel_iommu_page_response,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev		= intel_iommu_attach_device,
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 6bd0abf9a641e2..c52bf037a2f01e 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -801,7 +801,6 @@ static const struct iommu_ops mock_ops = {
 	.default_domain = &mock_blocking_domain,
 	.blocked_domain = &mock_blocking_domain,
 	.owner = THIS_MODULE,
-	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
 	.hw_info = mock_domain_hw_info,
 	.domain_alloc_paging_flags = mock_domain_alloc_paging_flags,
 	.domain_alloc_nested = mock_domain_alloc_nested,
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bb57092ca90110..2d0d31ba28860a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
 }
 
 static const struct iommu_ops riscv_iommu_ops = {
-	.pgsize_bitmap = SZ_4K,
 	.of_xlate = riscv_iommu_of_xlate,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index ecd41fb03e5a51..532db1de201bae 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -998,7 +998,7 @@ static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
 	iommu_dma_get_resv_regions(dev, head);
 }
 
-static struct iommu_ops viommu_ops;
+static const struct iommu_ops viommu_ops;
 static struct virtio_driver virtio_iommu_drv;
 
 static int viommu_match_node(struct device *dev, const void *data)
@@ -1086,7 +1086,7 @@ static bool viommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_ops viommu_ops = {
+static const struct iommu_ops viommu_ops = {
 	.capable		= viommu_capable,
 	.domain_alloc_identity	= viommu_domain_alloc_identity,
 	.domain_alloc_paging	= viommu_domain_alloc_paging,
@@ -1217,8 +1217,6 @@ static int viommu_probe(struct virtio_device *vdev)
 		viommu->first_domain++;
 	}
 
-	viommu_ops.pgsize_bitmap = viommu->pgsize_bitmap;
-
 	virtio_device_ready(vdev);
 
 	/* Populate the event queue with buffers */
-- 
2.43.0


