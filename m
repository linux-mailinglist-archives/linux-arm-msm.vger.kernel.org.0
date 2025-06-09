Return-Path: <linux-arm-msm+bounces-60687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F8AD27EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF731886E3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5752A223DC6;
	Mon,  9 Jun 2025 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tj8bsBKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5322259C;
	Mon,  9 Jun 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501704; cv=fail; b=bmOf95Dp6fZdfqJ+BE7xUmGzpncI4jOeC6XA7tuSR8X/ij5o0Mmj6Fv9yCrjYiDy1Jqxf/cvWsCHe8e28woh1UxxQfMswrwzWAxkk0KDnSFDWGuALUw/IJF2NIrMZxrHfDruFqcROcRBL/MJu8V3WyMkpcSZnituKY0gBvNaQxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501704; c=relaxed/simple;
	bh=7hAhM7u5MKioK34wzA2fClnz+L9+S+NuPbvPeHLQBqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uJxzaSBmTLl2E2oNMYLZ1EOj0GBuNNUrnAbQhhWpueDmfMtoVW+J/R/lhsMPXE+wz72SPsZIsMCIBTVOYSF1oIQrNvzMmssP1Kzz/LlDmGu0Ktmefo/e6ndTrj6CAREr/q81oflrPEJ5QOd2GEKrQQCWGWZiPG6RHwaWQy7Nm9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tj8bsBKG; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkOUQwOS6aoZcuO2wg8/ZAN9hgM2RX0JOjN2cvuyrXhbT2sgkaRWEZ88E93qAtafsBw4fN9k1ry13FYCfwhpSA0fO/+4oZBP2mfL2jo37AHmIjkKYUAbn7+zhRwWBRGagFOlfOVPfiWlg2TVZZvymjoJvBoD2bDBwKGmfX7rrU+7mY3qnNPLt+e+qstA+EiwdwgXBXzryJDE+tX/EIvBW1b8MBgVMTgn6pSurhpMz8RJ+P81X8u3ywVDtm3y3A2J2Osz1XwPf/n74t2EkGMLNeEASvuK4wBH6iuX5TebCBMCqf9jJbkmphaVY+jjs1eyvI1djj0+OwuZyXsaENzJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRf9pnmWVtpmgEfF8PC715zRF2ZAAd5qugyBa/u9KC0=;
 b=NGt7PhR6MRmIWnoS193d3l95iANWf+tXmXlG9c61RHA2CzW26zUDbVvDOJU3yqgYuWwAxvxHu22ylfWZuiPxjgndmgX8ZvF13MK14q0XMZ9ulAh7+y0EqQNdfUQ5cE6uzZFdpAp9HUsvWV5ij/i3/KUkJzhhZhGmLS7qEJFFdU7xi6GlOv98YKBsybr0Gahu3uP1rjQIdgN2uV0DP7FsA5GAcojzHwJxJ1sCsNGO3cZBX1/gyCYE5X/ZCn0nvE3Pj/3SrX/kHWQaBaADrbOBmUfp2BQGQh1RImvjla6pdZp1mmELkBSQDccJolaA1ZiFbb44ieMrk9qLbRTPf8F0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRf9pnmWVtpmgEfF8PC715zRF2ZAAd5qugyBa/u9KC0=;
 b=Tj8bsBKGx6rUMVOLLYwnq/k7d604BQG07r9qmqKEl5rQIPoKq1mXLY4FMyYjIPUxQDTa59cJLr7ufmFUom8KXkx7UwZHXQhlZ/IAQ7qh+ARl2wD7BulgwAIqBzYqB0j6yjronALhJi9toGZBjkxLGVyVFUAPNCXa2lYhC2afCGwR8bzS0WdtwBu6NruhgGWVxeh/OP+VT3cNwoOYEmmxn46EKHYKEG8Da0JHqHq5ZYef6m1gSkycW2/5u4zU/ux9G12BmbeiauR/hUP2Z4oWZzGvgH/HKd9zZuN7ubF2qu8YPjGvAXNSbg1Xvu9dbG8t6ISLusHIS/Fhi87V2JDdrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 9 Jun
 2025 20:41:35 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 20:41:35 +0000
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
Subject: [PATCH v2 6/7] iommu/qcom: Remove iommu_ops pgsize_bitmap
Date: Mon,  9 Jun 2025 17:41:30 -0300
Message-ID: <6-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0210.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: b25eb4b6-1e57-4c81-2525-08dda7960551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zrJBm1G+ASzgzFM8ndCNTL8LsURcT2PLDgaMpxkQddXugFeM1dkDE0pQVloi?=
 =?us-ascii?Q?gewikwZ+h6EwBJ+pynJ9Msp+rTcwktRI9ErZVeW+DDCZoLybMYS7M5eCgsrD?=
 =?us-ascii?Q?/8qW1CGD7gqpvlEIEraTgXgPxI8YHhV4ti4dEFxsYwJK2f+DLdQ4nYRLA1Ds?=
 =?us-ascii?Q?DKVo5rp/EUBIu4lmr/9rAAeAFfHyryGlXydtCBGGVPQLQMID16EvydTKaScp?=
 =?us-ascii?Q?RJN4tQo/yAoPKKFwQD7WpUhqbak/oPsXGf1Zln7Ys5Xk7YLKY0X6lyauCW5U?=
 =?us-ascii?Q?WM5N8e6oLDmwqHQ8PaHWhHCfb6RYw6K6c50yiIosLtk56aMf+ODmv6zZx0BO?=
 =?us-ascii?Q?+12xcd1VHvIR/a4qxppOIIM2I92H5OvlNvzUoLJXFuX2NXbe2J/sn8vNASsV?=
 =?us-ascii?Q?++JfVYWzFf2RH5EucXNrIu0VCOGF+3+9O+OiM5Z413UujreKv9sQGg3rpZmq?=
 =?us-ascii?Q?8He/HZSuSujeFxDKPHPMIfVWlF8WFOM6tmILZYsFO7H7Z/eGRq6ozUOlKkDk?=
 =?us-ascii?Q?y4dPLWGNuHAz3CVRRB7R1M/QgEwhH3x9rCQvmP/NUegdQ6+wKFfnhHWQ5EkO?=
 =?us-ascii?Q?8foT9cx43Yqt41dx8hGTyQZ5KXRq2GXfh66sJiI36WxFGmwhRjwGRMGUt4c9?=
 =?us-ascii?Q?S2anQPBsmndu9lbnO/tbRDkrqF8c++aS48LUmLxViQrsK3w3RpHmzu/s9oyk?=
 =?us-ascii?Q?1Qxny56+kI2R5qWBsF9o6vbuy1iho2OYR3aidju4LPKJnYyi90/b9oWrJ7U/?=
 =?us-ascii?Q?1t3j80GtifJBdlozK/9Sd8Dms/9qrJKUr9aoqJ6naQpdRl4wF9lE3yif+Dqn?=
 =?us-ascii?Q?A8NLCExywkoKt5ZXRfQU+sfuNFGBOFPU2bGs0MjUN8xhPkmwss06cs+MRVGg?=
 =?us-ascii?Q?bJk+LP/ZwK+71P2nkgpcnaCaBGJRXePSAeYxxoh/SGAEWAq16u7JwTnLOe+9?=
 =?us-ascii?Q?nV7g7B7HBSdKgE0Do/8f0dNNfs3y76KiIkB3b5rXuYtmvcc7VezGaM6oHHOx?=
 =?us-ascii?Q?WeGEPZmRRYEPK7L2iQkpZKakves3g/0ilziH8I7CPFTAjs46D4d+AdoE5flV?=
 =?us-ascii?Q?8Sqx3qk8vzX+Js2txn0nuR577y9fTmZJaGuJWjx94EGcSTXir4bokBROQ5Ny?=
 =?us-ascii?Q?0Lcx1dcpyPQOVMnkS1gkE6DQNHL63Tcpg+RlOPtMTjEN5jlECovjVzxZQHJr?=
 =?us-ascii?Q?SGO2gWchVM7SPhf/X2RZWDsHf3393hv6AS5l4bkyZLX4MARlgU4jCVJ7qBUt?=
 =?us-ascii?Q?AiyhN0jhCU2X2MyEFWZ2BZsjvFoesQPmlTOdjpTgykrei1Kj11UbGvmI7q5R?=
 =?us-ascii?Q?e2tvlHklDKWrhrOpDUIuH9qNcwKt802cmA8goY+bnK02sp2Fm9uovfkPrkvF?=
 =?us-ascii?Q?ROW2ljYbTnmaDG9TBpyADpPLrKOgdcMZYZ/vfuj6+0t6E/OhiAGl8w1Qd0sv?=
 =?us-ascii?Q?NCOoNujRg6W6zOQ2frDixxfojnkczyj7KNfkK7xYp/Q2cjrwJHgNnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CcK2ppLk71X5ADbHLEj08N6ifSs8MnCwMIkyKxqDpYLLdhPu+UlYTVePVeNb?=
 =?us-ascii?Q?Z72oAj2AOde7hlxoAf5ECDiv5MV0pzE9b47MU2+gFlGiA4l3JsgCp63bV/mI?=
 =?us-ascii?Q?k94HFDqL1pW2nCVp4faP2LJYEQCJspn8POd55iNsi1AzTeJenrTV8s7xcc2W?=
 =?us-ascii?Q?4gGA0sMeVyJysgb4uMtwqIwvLxvM7Gmng30QeZlCJ48YWTrzGL20c9baR5ya?=
 =?us-ascii?Q?QalW9HxEkeqQ9famRoP0lMw8vF/G2AyjG/kPcUFXVggJGm58NXcRHxH418Y1?=
 =?us-ascii?Q?qJljFV9jo5SnwGKz71+DNcA72MDuJPeLy/4KV+kaJVahKO6R2oFfwznJzegs?=
 =?us-ascii?Q?ARYeN+b94P7Uvi+k/exDaxPRx0SeBPvu8mUzTCrA4+r6bv5EVsHtEpMbg2c6?=
 =?us-ascii?Q?Y/57k8/sOrQ7u2Nj9YWqrkQnbNNKj1/GO5aqSaqIf8XUgg1jibH/22buSWqi?=
 =?us-ascii?Q?Jvb5xgABmNe0SetvXkDjpX3ylk2Ymg2JvDZ7Gjjyk+YdHgW4Px7ciAPDPKB5?=
 =?us-ascii?Q?qIiDjDd32X/D8i1Z+XtICejkV2ec33nhLRdSIbU296KMqFPABoHA+WjgAlij?=
 =?us-ascii?Q?2qIa2sVbh7hn6ouWv6E4rtaNV64iJ+QU7rJi3M7XtcEz1KWn/xbKgYcw5oIH?=
 =?us-ascii?Q?FcSodkXBdIvVX076fyRUsy2BkpGBxVOMXTTYbVw7+SrEkB8TW0qwq0nd3/nT?=
 =?us-ascii?Q?dx6knD0CXN5ka3bnyfmOXCtlz58AsSp/UQvFc8ufgpt3xncUV3YOc5PW6oZZ?=
 =?us-ascii?Q?ojcEAOrQVtrm0cci/c4juF6PHyLgJeDM0FRLmC9htQWrcPbtamaHQmPxIZLT?=
 =?us-ascii?Q?QBeM7pzB9aD5eicmy918NBJ4PJu+7RF59ilQ77KIS9Zb3dtgoMp/+3t9xyY7?=
 =?us-ascii?Q?M/O/y+grn5nUIxFJiqm/NI7On3Gob3rj8MLld9ILmLyyuESlYZeBws3v6suw?=
 =?us-ascii?Q?GafSn8XUFF9iHPbVlQwChmFtPNJeHCVOvCJX1JScrS9WAFnbA/Ql+hb0NQus?=
 =?us-ascii?Q?uCewLeQwCAfS1YvR+Elc+qcepSSqGWEQzlGRVnZa9Gp+T72dpMGil5EwiyIe?=
 =?us-ascii?Q?3IEhPDEaVPytj7kC99ThB7hCjsCVIvA7crffo9ztvbXWyu/SKknmWnedb66h?=
 =?us-ascii?Q?gjeU+BaNkZ6NsdTYSKgDnJiG+wfwGECv0NSAkyhCLRR66NI/K+kHghFDDMO2?=
 =?us-ascii?Q?HwebfWSO+JDdaNTxTgxhCBsiJKF9MIUi0EevFD5+bJa79Nvz6/1csflbFmIw?=
 =?us-ascii?Q?OWXvn53GFSBGRIHtolhXKVIF20kc/HxQi0SnWxmLCapau0Z5otZjB3w1XGrs?=
 =?us-ascii?Q?h448gIG9oZGF0lS4baNS6MsO30FuK7P5PsnGMtTTJZtAzCl8++I6mTcpWqco?=
 =?us-ascii?Q?3dcBYzSoALgI6oATi5JfZLSwDdCnqaOosdD4Jtghc8coRj8NjPXMmcM4xx1l?=
 =?us-ascii?Q?huJgHeIc0ods2weKgxVuY2FFE7wetxQLM9PENbf53B2BEDnkoOMu31Xi23G1?=
 =?us-ascii?Q?LCsieM4S1pRcfsG6towEgjHpziNF1gAmrCxO+4WRJyFxjbo8ys4X8EGYZFDP?=
 =?us-ascii?Q?8zhwxAivLcQtnApxTHQU7y3aVirQSmlAsVuQrNUs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25eb4b6-1e57-4c81-2525-08dda7960551
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:33.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPR5ig5RLc+EPZH4LuEaEWF0mybK+BMfE/JhYOh1poAGU+qFCmW9ngjIf6aAJlto
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12

This driver just uses a constant, put it in domain_alloc_paging
and use the domain's value instead of ops during init_domain.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 3907924646a20c..d599f778e9f47b 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -229,7 +229,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		goto out_unlock;
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
-		.pgsize_bitmap	= qcom_iommu_ops.pgsize_bitmap,
+		.pgsize_bitmap	= domain->pgsize_bitmap,
 		.ias		= 32,
 		.oas		= 40,
 		.tlb		= &qcom_flush_ops,
@@ -246,8 +246,6 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		goto out_clear_iommu;
 	}
 
-	/* Update the domain's page sizes to reflect the page table format */
-	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
 	domain->geometry.aperture_end = (1ULL << pgtbl_cfg.ias) - 1;
 	domain->geometry.force_aperture = true;
 
@@ -337,6 +335,7 @@ static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&qcom_domain->init_mutex);
 	spin_lock_init(&qcom_domain->pgtbl_lock);
+	qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
 
 	return &qcom_domain->domain;
 }
@@ -598,7 +597,6 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
-	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
-- 
2.43.0


