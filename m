Return-Path: <linux-arm-msm+bounces-78055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F7EBF2FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89AB84FA649
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958032D3A77;
	Mon, 20 Oct 2025 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hi9Z3HTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89192D062A;
	Mon, 20 Oct 2025 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986002; cv=fail; b=d/zdzjJ2l4V5o/xmnv1yFDeFz5VDNleVX/uSOrGQzoj+ogiDZzysHuobt4FG/f5dbsCnaVgXaqNOB2gmzn6W/9aEc8hBuRHpYkAfDHRtWdw6fz1/T230mMwNUy75lf+Qn9pnC/ar6dkUkM65HVlNb4nBF2Jn8m9QlYE7B5OcAjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986002; c=relaxed/simple;
	bh=IK4eFlm49CUD4WdXHZlc/WtYnLQZb2HuznmB1Unoj48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UVJr9nJIN0mObJHv+BDKW920OMrvNVw+5OdzCOouKtzhenkdHRAskoe0EVdLfOiVnlLtGGY8AzebxEyEqt8DhLnd+3xbRU0SPlJKDICx709bSI3mWYHuBQpqbCPISHjRf0QZKBmb9J7I0C2lzQYuxx4LN8DK2mItztCgkyzagdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hi9Z3HTD; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX/Q9Ne89Py9vBl/xIKkxiSBsDSdkFhbRz440C896WGEA3M6MJniz/3/05iYhIBxU37PosRwP3UCYMHau4+ObrVz78hk2DNq59qB2P20RfkS8QkzUQw8cLrt4BC38rKUV5W15MNYwfML5y465H+84xCmmPijQjQEz3DtXvRzeSOIhSEyZuHuEQJGBxijS1eICKY2B8RpsbPr+I3CgMEYvt7NzbouJA/Ft6ngHJq9U7dsDEPU5EnnozrB+FGCwjJqDk+8WBlr3yZdtj+Q2KtsNAa4VNucwpvAwooS1R5qeaeZMEEOPbzRVQj3eU/s4RScV/6QUtlhVYmISUJ34PuPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlKDrFNubYB4kFCo8X/HkqNmgpGVrtcQsxIy8gGI7kc=;
 b=jSfBtUrsTCvX9G5C4IGu8ZAI6WUvy2ba8kkMZxArgtFgU7gBkNenHKveQ2RGZaoMJQmuYFALAlKsT/4Bx7NdZaYmJV97pxidSOK3w/6sxLzT2MH1nr13cDt1pbJ5dBngO5pYUaPHKImuxeiGutjWFEFx1TQyeY/7yDbCZZtSEY84ihQFC33S/klL8hBop/oqepH8HVlo91zKY33K3FAjb1qJ4PKOMOL93I3R2e36OkEds+feSpZlBFXUKh8wQzqViRHjkxJipJeJ0uiynfUTGnSDksHt36UABmuSAmVzMoLSURUX1hho8LliLQ9bsQTERVoZByYE9YiCvsuhf0BJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlKDrFNubYB4kFCo8X/HkqNmgpGVrtcQsxIy8gGI7kc=;
 b=hi9Z3HTDmMfcSvww6gei7uln9R/6tKyOSMLR/gBPpvCyFfpf6mtDFLT78tTNZvtVPdl06iVCEmO8QrignbjL1HEDo6XNIwtQ+1wGM2wUAqZqFmAux6EdIuZHGEqlNhfl8/tPNvO2+FSLrLjaYDFrF9ggFaqYXW1qIZbSi6NeIElztVDzcmvw3z/v66YQr5kZzpqpbz7wi0yAjDOyXaM76hhNhn9TJd2iAJWebG3D5kGrdF3VYsLAK0mD4V0jo314EGYcsMsR7PqsWE12eKSU3qZSg6nUwZJPcGrV0jukj/p0hfy+ffvRvwYqfB1geY2Cz3kP8WfLFs3bU1eZ38wrJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 18:46:37 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:46:37 +0000
Date: Mon, 20 Oct 2025 15:46:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, kevin.tian@intel.com, suravee.suthikulpanit@amd.com,
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org,
	j@jannau.net, robin.clark@oss.qualcomm.com,
	m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com,
	mjrosato@linux.ibm.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	jean-philippe@linaro.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v1 3/6] iommu/exynos-iommu: Set release_domain to
 exynos_identity_domain
Message-ID: <20251020184634.GC316284@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
 <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
X-ClientProxiedBy: PH7PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:510:325::28) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bea0bc-b61a-42f5-f73e-08de1008ff56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eH+aA5ZdAVIzLAUfwKClL9Z2cbLxgoRDXo8MM5xy2Z+rRh2LwS22yYSh4AGr?=
 =?us-ascii?Q?w5u8mizRboC5pb4mXXyporkPKNqe/nRxEKUlacOmt6kF2XZ2ougNsmdwPZvF?=
 =?us-ascii?Q?WkROpBX1GkqgcBKU1zO60P2dypKZWpUUpYMYWJCJDxdgAVKWUUknzxYxEEoM?=
 =?us-ascii?Q?Odsh8LskZKygySJa2LrIYp/IZZ/1S8jfeMKQpOq3dcJfrYyC7R5aN2KMK78z?=
 =?us-ascii?Q?xLg2muBbpSy+FdYG6TyQomyaJau/qJHQR3j/5ZnT6r3pvD1TzbWlFUtoFtF0?=
 =?us-ascii?Q?ig+5e6rOwpdOspKuRVun97WMAXfEc+rBQAsw5CDjWjNUuIdWSOUWaR3cVJia?=
 =?us-ascii?Q?fUWKNFzdSn0C6oyfbO82By33aiQCI7UEDZuYvtXSJKM9lnoIm07QULEm6ph2?=
 =?us-ascii?Q?mOSlzM1afb2WGUXelsKCTjvZFcOxvf+j2KoPjldoyQjR0G1LHRum0on6uUss?=
 =?us-ascii?Q?yqPErHN5HQCeIlZfCz5+j2ILKpoPwJM5CXPkTFAhFREzYgy/2RApRTFtswwp?=
 =?us-ascii?Q?WV9eT1BMJgpkl9EX/Q6YHKOYRPlcjTYQemoGDTkmmcuQeZ5Wy1TcnfH3WWPn?=
 =?us-ascii?Q?rDvZmcYAjIiJplDTCcbjrU80uQKqKxXRl1vKNzrcJr0Bdt2QogG78le3DXUV?=
 =?us-ascii?Q?I8XQWTGCJFb4HaIHy2ULk2OG71jZGcyQsfH2aiOjwQdqMVXRiUaFH4mMQAkQ?=
 =?us-ascii?Q?g/zh5r6RrUCM6f1dyM8TNKhSvVhzw2zpMLsKMzTdB8r0pFVwUxihvW3QUTym?=
 =?us-ascii?Q?HnbVT60ijvYxr1B3ytD7/RjHXi7QkyXVuxXdLv82SKipRU+w4ON2NL3f5RbG?=
 =?us-ascii?Q?wVMEnZHD2zdJLIxfdvMlJC+eS2aOVEghWLWfn5B+jPsChxLBLJZLigLCqKUj?=
 =?us-ascii?Q?FOPSYdLpXrD0M0PLsVwFP5xyTc0HaAhAS6KlAvbmy739pSwSkQRGibProazq?=
 =?us-ascii?Q?h9YRXq1ZRE+L7t/936GzkfplN4ULKOaKHk3sOCWI1AEp67VFNNEsP/eQcd0C?=
 =?us-ascii?Q?7oZXou/3NXCo9f9NlZk3GkrP+0ygqY5+kN/ds0RlGxc6AlGH83w3vRTiI6al?=
 =?us-ascii?Q?PCgonOWUKuo15ZhxTiCmh8VmtuHo5XbR4x1j0Aufuiz0N3F7cFo3hksis7Sq?=
 =?us-ascii?Q?hIGXLzoehtwyKPPIFtpJoQT1X+iSf+lXJaygk/NMyTOiqGuHcIJNecKfk/Bh?=
 =?us-ascii?Q?7wN3vIiMus2N7HrOeKy/+2ncjABvKHavgVylPqsFtGumhKzyY6ewMBbLH8o1?=
 =?us-ascii?Q?Ygiy6L/A7w3jOO3oTTzlwlyaPoc2pIq2EItU2HkuA6mBhmRFCZF9QkB9Z8kF?=
 =?us-ascii?Q?a4J0R9r1CcQgODbLVVWZAY62qpGuzsc0/JYka/vrUYNvxbXrQexmsVNUhuXS?=
 =?us-ascii?Q?Zm5iNVabSw5B4CkEbs2lVVL63Iufi/gPhlgFv/6BJclk7KVezFVpBXnBKZD5?=
 =?us-ascii?Q?wmMLHcQ65JdBIzu4SV4l6wb4DpNFvBmS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yIcwjp4PNLiFksovyw3NXB9v1GW2rmYzjT0aYOzdlYPyW8VmptRVEaEqvTVn?=
 =?us-ascii?Q?Dz5rxN2mlIF80QTKPhyDtQqT+nxso1PQK7UDl8LxbrONB/KA4c2reDY2+WyQ?=
 =?us-ascii?Q?NrjgxlWpTLO7sEi0SSXxamwF5kxUjaJ3c61WkcP/mZ5cls86sICjwMxGqO/G?=
 =?us-ascii?Q?Khnb0+e0FJNG/EzD48yy6sbJt8JrthmW1LrS7ywk0mCN/LQ95mF48ZovtWcm?=
 =?us-ascii?Q?uduOdmGM5VRdPBbQyw6zXYDzsfH7csJjFW15BWof8pVpYAkFU1FXd4CTwFpF?=
 =?us-ascii?Q?gzKG3htQNYfeoj3eYkxVLrE9PfNHNvfVZAcz7IGGWTRUDVgwyeblqO1xWTW/?=
 =?us-ascii?Q?anGdI8VDyIocLVxwbzspgAUGCNOdfldjI1KSx9tn088RrhmIg+twLwflQpsG?=
 =?us-ascii?Q?OtnWZOShfdozIntsOCanChqhauXseo7wv1shh9nNhkz6T/g6TKGGxcGltwgq?=
 =?us-ascii?Q?xvsmpj161fN7m3Mo9iZ1PmVezgA4MrVpIIxA7JsSsBAL+qlvB1uIvGt0sZcy?=
 =?us-ascii?Q?HcCDAhlci4PGhdqhqnX4tj1oFiJLONjPa9+tIVK7oAH4HTRqjks8xsoyLmXK?=
 =?us-ascii?Q?zMvNKGbtjGyDQtKY2SFfCnujamZ6HnmL7VwWk6KoCSzEsjZJlSRwibH/Rwcw?=
 =?us-ascii?Q?Kz9ykq7mmNc0Vrtr5WeVYMdIcCjz5HgJGID5jCa/qOzVkZcgkLGiIrH9lArj?=
 =?us-ascii?Q?/kgEGLvJ5LgtMPPW3khfpzXi5yjWosZDb1tLOTcUdeoSfgLmOV7hWQpCah/Z?=
 =?us-ascii?Q?Qynd2E+5L08FVOl7/OitAmeCPzSveYgJhM/gnIQDYQ0Hq0gHXBrQjuzyVPUi?=
 =?us-ascii?Q?aKOupGgdjcj+6qcyK3n/KfwTit7E19xIigiBLI9jDo664Yh32m501lDnrSQB?=
 =?us-ascii?Q?P9CaBqxyIUcgTw6jUprTtdI3O/y2c6f3e1OD9LnC33bwVXtfU+lB3+dCc3mh?=
 =?us-ascii?Q?j+LDI0YOxa/UrntDgpJkS5UYkeHrqrzstum1ACIScvrgrrjWBR6R70q894OQ?=
 =?us-ascii?Q?gq7IQ+DdviQPU5J+PU4PwzDdEpdAIRkSwmU8mNQhtwKV0AcbgXzBMu+l3Pr0?=
 =?us-ascii?Q?/C1cf5nzofyVqDD1QcMT9kbVfraNihGZ9zXvglFrO3tLPDHWNhaa+CMewPgb?=
 =?us-ascii?Q?iAWfKe/DRNhUt0Gzz5b+rqHvo0kFTdPi5dd3UccL69Fm20cJfqRaiDaYfzCj?=
 =?us-ascii?Q?eEXnE6/UWs2dZzHBKFUGKMA2RF/JHxsRdRe46pLlbdAsMsaf4zG56aRu3HKQ?=
 =?us-ascii?Q?Xd0mJ/jabcptKWJRAgnE47NJnAOAB4WcPevCTDfIVt5h0ItBsLfzL787qMXu?=
 =?us-ascii?Q?qGJN377OircZ+z6FQZ6j3OFV6OO3c5rhGowkpGWVWgQhdSuItVY5V86KxRuE?=
 =?us-ascii?Q?/amx8FqmvyDFngikWH1Z3NYB3L9dx8Mlce8vOimNKhLrPwl4srr3BBxVVe6q?=
 =?us-ascii?Q?u4UhBly3ZDCy+z7ok9qt04g1rVDtp5V9VrzRixWn2o+hyfGKfsvUo4bDh3Bf?=
 =?us-ascii?Q?/ljIyWwlSBZPzpxlBeLUAfEga09GstRhdbFDKTLealUWGKDVfz1wfmBcA/CK?=
 =?us-ascii?Q?PcKP+9CVTCytGI7kHpw236QQiYtYEa/vZgSwfuvX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bea0bc-b61a-42f5-f73e-08de1008ff56
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:46:37.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg3H/22OZAtarxrmw1t+Tsv52ff6DL+DGyG6ObliVvG+RwgL/6gzIgt+FnRnfLD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

On Sun, Oct 12, 2025 at 04:57:39PM -0700, Nicolin Chen wrote:
> Following a coming core change to pass in the old domain pointer into the
> attach_dev op and its callbacks, exynos_iommu_identity_attach() will need
> this new argument too, which the release_device op doesn't provide.
> 
> Instead, the core provides a release_domain to attach to the device prior
> to invoking the release_device callback. Thus, simply use that.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/exynos-iommu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

