Return-Path: <linux-arm-msm+bounces-60688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E4AD27FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD953B3251
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C07223DF5;
	Mon,  9 Jun 2025 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cvuqh9PA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF692236FF;
	Mon,  9 Jun 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501704; cv=fail; b=crIHI6ahidRt24N7iPHgQWYmDfas3ogbDVRBWvNHy5Bfgu1AyImNO8yIcxF7s1jLBSrLdgG/bL0s4lMYHqRk5JRQszrPMnYgkGFzrIBqhjKFXlNHK9BCTBAPRHEA8UBBXyUt3881Q6dfl9ekC3f/w1Tfv5ZoK2c0M8RB5iTuMHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501704; c=relaxed/simple;
	bh=2IMHzinmJrZdhAOVSedWs6wn2V8N5cCb9TzgiZJ/r1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=icUN2epigL1lB6yY38stzmLNwrQTatIddBh8OQTGI+lF1lcI4mWGU25ogvchDVl8939EM7Mumbw1/k7iT8uo4m7clmaYFOSqNxPUTqebAVYk+1bl8cfilxj73Uq4eVIAgZ9sV+A9gHlu/oqmf/j7iJyool/Vd2s4vQjFCTivT2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cvuqh9PA; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOAmTVeJN8cE9A6DghKclVCdvZ+0Fu5dcaTBWMqP629n+aC4DSCCijJaYrZgYycnHYiG00bR2sUbIlLw/Rsklj5q7AQjYvxHMTnO3kDrU203ZiuHWOQQDq3fiuWTXG1OfZgInPA831Ewe7h4V6haO+ngMbFCHOGOAjZWJ6KR5aL2PRrXW8ZQrMGpk2cGGOeLfEuaMfK3PRimrUtMUxUgain6pMFxrNzgDQg4d9/uUYgLtfxGm/0nnv7gdndfVsTXuDLswbyLrmum9mopOwVIviQFSLMQ7ui3nmU19ExHIs/QrihSHL6eQ67F+jH47zrGIZ95gOzquMFhD+1c05bRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peM+uOy0lSQpMcGd8PjtTi8Y9ZAvaBTpSX8/u1Bv1/g=;
 b=Pl57+43aCfLRpBfWG3CP3kpeY9ej+fKMMYXW65sMouFJ2aMsSchRvjszBH3aiku4VpWPaKyvDLE9BKYfJBoNStGdVAD+bNlUO25Fgccbn4uHl7QfVv0UVGwOBf+IdTwez/Lco6pZKOQsGCK3IOJw0jnKiCmCGdl7Hsnx6knQs0A9egi5WOtUij+7q5fN1Z/d4b+YMJv89lVranuI1jWExxVWtAo2bS2KT8Q250YX5o34ZhWg3KogPig8d9BFx1BZMV4nUEdyPdHrNPkCfdpxLepPG0e5Z97JghG4dkjyeEBQcZZBj6cHYcfeK6APqMilTa0z7dk2QwsWKH/bGW2dYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peM+uOy0lSQpMcGd8PjtTi8Y9ZAvaBTpSX8/u1Bv1/g=;
 b=Cvuqh9PAv0GNwRfdhLJmPxH8sOEVjZLtOMnOq0OpbGs/1pnG2OqS60RNpp3eqoBREH+gnPKz+Pn6ilBtXB9QFb8lGA0wHphBMCjHyoAOplf5FtCZn/tE9fCJHkjhi8Rkfz7DX/xKudQ8g8zNlinNymcT8DQ3PklCcMDT2Q/hL1zTewLSo7vblFdlbNCg7vDgZhAtJ9F7KM43HMefVovEXQNZmKOQykqDSDDsRLzsX9VOi7dL8CrTQs1N1CD0sotK4iBL+NqGstu5Eq3v6tmwrX8m6s8YKBLomdiG+HQTnKPaQQ/HvYT+gzDNQ7dAzK9OWR5rtNqjq9OhIOccrJECJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 20:41:37 +0000
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
Subject: [PATCH v2 5/7] iommu/mtk: Remove iommu_ops pgsize_bitmap
Date: Mon,  9 Jun 2025 17:41:29 -0300
Message-ID: <5-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0209.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::6) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7e3cde-61aa-4d4b-4ac0-08dda7960599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WsBl6xFE8///hYOVzY8yNy5JapfWLcV7LvTOvBV4giyQmFY6FnbVtN9Hpa0g?=
 =?us-ascii?Q?umKrREC6mUEWLvAVxZWMTrAtBdar+lYrfR5fb0PeWn11z54Ty3VwvGb9RLIk?=
 =?us-ascii?Q?LoOZFHYJd6Bs0+jOQpvVKU6gw40Oo9U+yvvLu8Pa4DgnOJMcZZPZtSepUZrC?=
 =?us-ascii?Q?R65MRxrzHbMZKo18VWTYN2Oh30iPlCTy/wmkjve86EXH6DojtRr5lOWoSvJm?=
 =?us-ascii?Q?aQk6UgT18KNKGtrCcFquYC1NKOjvtuBc0R+Cv3lI6oTPweAEFkh1P1w8A0Ah?=
 =?us-ascii?Q?lDnUTDT7odH0xn7cDQdPiMsfWE74zGJ2wCQuV9r6CT7JMioTO1kvXHfWQ7ui?=
 =?us-ascii?Q?UmnmACc7rcHuFdP/QDcJKm1oP5yI6kXgBxBqDq/3e9R117M7M+eo4buzY7W7?=
 =?us-ascii?Q?bBlI2O3VkaLZItVNkipZMgv1kZMucULXOrFqcPZxoapG6ILBb1Y9hiiRcPfF?=
 =?us-ascii?Q?u++9/wrL6cJ6L4aW7IEmWdKVW8sFKYNfyHgg020zocjuwlytgLfIChk2vzux?=
 =?us-ascii?Q?lx8vSSPG4c4ZjJiY0WswPgLfxLPBZgZOvehf+NJqkTgFE/TyfXfhlJvX/T/D?=
 =?us-ascii?Q?IXHdK1WOpP/eRV9HQYFSzutNVQ9vYnDkl0UYfl0efIV+WKMYBMFpOs8xGwR2?=
 =?us-ascii?Q?SxGJRt7X018RClrQGrmdguUU550UZYcXOo6QBex4tCk8xPfTDplrSeg4DH2N?=
 =?us-ascii?Q?1PUlGFQgyW2Ow33UTMOKkq/JSu4aNjUlbDY4lWD7k49w+uFwGkVxBud3086A?=
 =?us-ascii?Q?YBzQxUTCeZhyflmBok//evFV2hGY9Y3I9/NOSylUguEabPufV9M9VdWdFgSw?=
 =?us-ascii?Q?ZDWTl8VMvMsJduO5FE15uaniliI1GAe4JDnMa2FstxhNqoxEe4OhFPN43f9V?=
 =?us-ascii?Q?Uu/DbCf665JFkPPjxfDY14iqJHVzMUOK2bDsWURpnVD3sh17jc6bvibxB6B7?=
 =?us-ascii?Q?x9Vj4lZbHi/7n1KDO2ESzj+lKCLwhtwru7psjOxmji9xPRSl1j0qutsSYOf2?=
 =?us-ascii?Q?4XRCIF+LtD+S+rVW6wks7qZJVZX4t4AJZKb48PbU+0jc+VsIClU3XzV0IYjc?=
 =?us-ascii?Q?H0DEyh//5OMaztLYVcxdX4vjuPQNmz/TpRI0SRAe6Fp8s4jDSKb2usl+Zgjz?=
 =?us-ascii?Q?UrHOtNsxQBLz4V8vFHUcyEXC1IJSeofWuETnA/Pjw1OM9RX4lmvoopfMlkQv?=
 =?us-ascii?Q?IdF/tcp0E2V/G4DtIbX4ODS4n7p7vz8kuTsdXVla5QrGlFwl4G8nMfZ2WsCu?=
 =?us-ascii?Q?5CMGO0dR9BEEd0E1DGtJdxLyUEWVZAabFSn1IGexbOWgMUELZHGPYnGaKE17?=
 =?us-ascii?Q?cvnj33wal+LZ3KPfW8fPtA1ejxyHEImZBVTO5ZxuIp+M47iCNov9F8cQl8Xy?=
 =?us-ascii?Q?v9qirT1RENYJkl8snS/6MirjydGLoCtEOoiyoxUEopsCMuvIMBUVzzo6tuoT?=
 =?us-ascii?Q?4WkiQLIdT5ZYeJXtihlonkF+pg4eILg/mXKEVApXNV34eOWpIm/KZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fLBcOsiJ4N/Ib7kzWm78XNZuieB4W+VGOJBAgpsbHMcZyTfMVUvG8BwpwjNs?=
 =?us-ascii?Q?KZUwRlGL3vlAXA3tyG1bMSnd5GF2E2Gx7jtlxKiYz4qHKS1EpmYe+Vk16DLM?=
 =?us-ascii?Q?bzJDw24PrqqgoqQ64O66M3n6C6mPKvsGGQQ/Iofn+vGcJ1lY/ASdp3ygAeGu?=
 =?us-ascii?Q?cw6O2v3asFYljnhdsq37q/6LsGG3GL7sBf7ouji+BTy/CHuRp4IheMu/wEbH?=
 =?us-ascii?Q?/O1U2JgMC4uKxv/lQd7f/2YC5nL2m3BIUOgOG/eNKJ9gxUqKbNDJI5F4pYWr?=
 =?us-ascii?Q?h0jObPzGgydiHJllKSGHVD2bO/s5CI3NpjYggvUB5c3rhpsujcwtsf0kU6IR?=
 =?us-ascii?Q?rv/w/8Gzimc1G6y5AMyN8l1qHXEpAYtRJK6U+jhTw8t/+DKacmGeUd9HH98O?=
 =?us-ascii?Q?8T83gGZa/50iSHWbpgm8kODoM2k8d2wP3n4p/xUfVe2XqBHvuDrKNcilUY7T?=
 =?us-ascii?Q?Zmozvsdda5Ugz3JAfdwmruBG3/ZoYyBJ35wHQaKq6q6Hea9OrD3frOtClDSq?=
 =?us-ascii?Q?nEHgT2q+RA9JzJHulEDlQ0JyvcNJEX7uaeGT4khsbrWI+UnuNETreOGOEXI6?=
 =?us-ascii?Q?G/vUymMqec2bZnbCKdqsdotlWbo+r80I5BHhL9mE4aG078y//mOyvxszV5QM?=
 =?us-ascii?Q?agogccWaqLpmvp9gICrpGe/EpY0XrRs6huShrfENQWgX9cRo2T1BqM1kc3yf?=
 =?us-ascii?Q?euo7s0o2BpJAbaEmZgA9doUw8X4Pkz1otkGtU+WcvsExYJiW39+vv3qokYJC?=
 =?us-ascii?Q?OBd8hFje7jsMrBUjYmIaeymJP9OFnk0/9jKiSRVGDgOBzTH/Kd+gkVug2Eze?=
 =?us-ascii?Q?WSKgfHYl0B3isf4n4zeKMdKtZidFdUjYA8lEU443VM/2obvIUEZJq2ShkeRw?=
 =?us-ascii?Q?4Ev0X5M8XDXsIaGg4Gw8xmjFOaJ5HMTS4pgm5uDehXaryU5TLlCaFNT4Dilm?=
 =?us-ascii?Q?6DOUNJJONAnqjjmDRMM1aS+xypNfRnbrx5gH0patJewZxxy13PFhCCm8zYmD?=
 =?us-ascii?Q?IyuTrd4mLuiBskcnoilblGQAJa915ikG9Cwh6wCRN7R73s5kQVeky3utlGD7?=
 =?us-ascii?Q?dcVOLI27N9PJ967nZb2WHz1ulXafHjHXeRlIwOZhahTCzNp262kXyoVfcTUy?=
 =?us-ascii?Q?GatV1z3DoG3TeE7KaTH2ajJDLLji6w3J6UAD2wIsbcXZjFFGXVNKOc5g0PRY?=
 =?us-ascii?Q?6iee/h3mEV9gXCatbiVw+uCu1zFueh4ss9xOqqknF+Fiqg6qHgxKrVnATe0u?=
 =?us-ascii?Q?g8we2PbGJmAah7yainvLqOzBWh+f75DJdTRvHMXynk99PJMrnQroNhJdcE5J?=
 =?us-ascii?Q?KiD85kZkwz+g2QnGSVS2cjg3HKq0fUOFUlceW/+taoEqSqeW4Y4Q4qN+kzkU?=
 =?us-ascii?Q?P+iieebfN9NnMsYndeNK9nuuBxLvBr+IKkFeio9/Z/zVxhKZjwlrmuiIHYZo?=
 =?us-ascii?Q?QnCkdL9trSQ+jjiOCbhAHx4JwUtR6jJlK1L/FNT/kii7QPHuPdNmFdaDEe5a?=
 =?us-ascii?Q?iDNh1dT6Xs60Tb6BUvvbHIDEJmCfdrjKUUkOD5Kid/wWcJt2tCcKUs3CvoAl?=
 =?us-ascii?Q?EbIRA6gQyq3Xce/1Ba7lfC3Ec/3m9mvuHLLRfl7/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7e3cde-61aa-4d4b-4ac0-08dda7960599
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:41:34.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzdsIiCF9GcaBj6FxBHjZPP8N0uo7PSRgXDwmr74L8CNVGGeDBBhLygcXazxPeD3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

This driver just uses a constant, put it in domain_alloc_paging
and use the domain's value instead of ops during finalise.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index cb95fecf6016d5..0e0285348d2b8e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -648,7 +648,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	if (share_dom) {
 		dom->iop = share_dom->iop;
 		dom->cfg = share_dom->cfg;
-		dom->domain.pgsize_bitmap = share_dom->cfg.pgsize_bitmap;
+		dom->domain.pgsize_bitmap = share_dom->domain.pgsize_bitmap;
 		goto update_iova_region;
 	}
 
@@ -656,7 +656,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
 			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
-		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
+		.pgsize_bitmap = dom->domain.pgsize_bitmap,
 		.ias = MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN) ? 34 : 32,
 		.iommu_dev = data->dev,
 	};
@@ -675,9 +675,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		return -ENOMEM;
 	}
 
-	/* Update our support page sizes bitmap */
-	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
-
 	data->share_dom = dom;
 
 update_iova_region:
@@ -697,6 +694,7 @@ static struct iommu_domain *mtk_iommu_domain_alloc_paging(struct device *dev)
 	if (!dom)
 		return NULL;
 	mutex_init(&dom->mutex);
+	dom->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
 
 	return &dom->domain;
 }
@@ -1019,7 +1017,6 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
 	.get_resv_regions = mtk_iommu_get_resv_regions,
-	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.owner		= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_attach_device,
-- 
2.43.0


