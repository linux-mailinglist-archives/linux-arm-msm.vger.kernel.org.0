Return-Path: <linux-arm-msm+bounces-10878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A5852FEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE01A1F23F4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81347381C6;
	Tue, 13 Feb 2024 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AIsizx2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4A37715
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707825271; cv=fail; b=ltUULY9c0IyQfMfBfMtEMl9LBuLa41lHAPyll5g2XlVxWrJEiKFhuvjPe9O+2kmmRzIZ5P64O/4SyjDjePrjv/5pcxCmkc+xzs2+eoE6AkwG3C1IALVi3dYIwcWoNplMm9CsQV3E2+Yme/y2y2FpFQi/gZhcNAbcLDv4WQn5HRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707825271; c=relaxed/simple;
	bh=GZnrQsOBzdB2Oz2zNhij3lzY+nyF8tUrp+eP4GNIPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z2764URN8mfZ9sQcYS4XJcuR/UDaKOHfYveyX7nmLX0K/EaEl3gcB/5C4TL6kBLRIbvoBbDjv5dN54zZ9aZ8LJYlAMvC5PZyeto6rsQz4j3OdRMgGDryHUW5EYfuyeHmeSE2Molv9JXcval7Ttkl9ktN+VaLYMBqzFr1RG0B9A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AIsizx2F; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPTH85jbVfk/UREoiGVoK1Y+uYc2UyuQPGNnQ/hOAqxvzgOTXtmgOOQrC0V8zfCgy9LI04nIArDgEx8VDSXCv7B3zCDtZhM1WiH1ixr/RVzz7NPYD8Ctz8z9jZemrF5W8ly+db8yhEXTIV9W6clunyiq26hA4QQjKkzqVRRPbTFgt4VJ9IuJLDiECmHZyyTgEBOT7ipC9lOvqzSoQilO02Rompr/dqU91VBUm+F2b6ObgQkoNickdNvRI+SINGltmAYqUbjVeAuIoI3YDfWKfNegry93+DxR/3t/Z5WRPayQXrusS+i5j4zGW1ceHCf6h0/u/LMZ3VEw3q2lBwWWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOlyo0aqqbrDWxnsu3J12BrtfIwV2XDy1AFRRmU6qko=;
 b=f1+kNuyU7PhthnTUIAbDRKizHfvnP/oLglOzXrnVqPMdaDtvvjIy3qZYkxzK7wFZ1eNu9UCPIMW7WsyjAwMuHRMDSNaED7bXd3It3tlUsxiUvhef/CTpr0KSadzL+yvPD8c5FuBnyUzo8vhOvAGysv8tjpa0R6wEakgYHRGdwkwfmEdnugQFyOeW3KKq56i8m2feovTYnTiLXwzgffCoLsHV0R1dO6Nx3Kh/NRujSS/+qSO1WKiYYwGAcJFLQMDyVQmR9cBrfR2NvJoarAR9IgWlLdDmkGozbV5BpDgP4ltFJ4qLfiR59bdeP2D3ELZ90o9xuZwwvkvkSAtpzjf2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOlyo0aqqbrDWxnsu3J12BrtfIwV2XDy1AFRRmU6qko=;
 b=AIsizx2FDj1+goOt8s02x/CWWGWT0cGp9j5Mz+PW9aKCzbR8TccR9ge9NBRCpA4axW417klowuSGPZ/vXt9lAsWyMC1EYEaW/eQK2p0wk4f3TVDwkxZQAgxR+6YOvTxegxf0basb4e3ycxjTyadwnGXWXX/Mr+d6dxbmhYrSLl+t5nskQ3s6gsySgs4aKbO7EMMDcGa0u6iaqTLQSYfCPWz1OLuyNg1G76LhOyOcMHED6+L9vidrCsbqkYisLiqiJNBujtkNWZrcBt/OujKJQAfaFY9GmYPupC1ycbvKG6kDFsAc9OvQ/TXI82niQUOv7D7a/MzCEVZqbW7pgZJ3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Tue, 13 Feb
 2024 11:54:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7292.022; Tue, 13 Feb 2024
 11:54:25 +0000
Date: Tue, 13 Feb 2024 07:54:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
	nicolinc@nvidia.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu: Convert to domain_alloc_paging()
Message-ID: <20240213115423.GG4048826@nvidia.com>
References: <5-v2-c86cc8c2230e+160bb-smmu_newapi_jgg@nvidia.com>
 <20240209200538.917366-1-dmitry.baryshkov@linaro.org>
 <20240209222349.GA923780@nvidia.com>
 <CAA8EJpp1wuMgawaUPnQWnhz1k023n8Q-k0_sO6P9p7ixntrCJQ@mail.gmail.com>
 <6511a289-fee6-4d08-9e01-695bd38d4ad6@arm.com>
 <CAA8EJpqtUnGXMPQO4F0JXQDv0oJKFYjuhf4hSBe2tY1ebWFjRA@mail.gmail.com>
 <20240213111623.GA28517@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213111623.GA28517@willie-the-truck>
X-ClientProxiedBy: DM6PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:5:60::39) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f237fad-f5ae-4407-9bc5-08dc2c8a8655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rCAU6A55wPQ2HbnKLU5/HX9a+V/32uycoKWCs+87gJKgDow57VFv61vFFq0WLGSgtfsZTkh+OrRxv4v/8OVuzdHJkTkEQfmGsc9SirUqEWs7H42sCcXkko5ivcyWKdUW0U2U3s1lY2MhWiMR6CFLKrujf5vNuu/s+quqMulE7b6GSBtKLR+Dkh4LxKp92ud2N4bxzroF4bK1X8rbn+fHvmy59hXm63ADspdOYE+pHA5OpFYLEBLV8RzhznlxdPXtqdCNh266Y/5fFugvnfqLSGoIsxw/5HVHxFKz6PWvZgnbI5vBmt6rxV8kNJtr6pvHmPGQ6CUKKtj4/ppyYQOZSuYpRNGxi+6xo9ncTabnUDJGFMUdUGg8SkQmxqkLi25AEx9DOi9GFp/e5E6M9IB9plx/HxfSKtwj6LTV4fW0kPsQA/jEW3GwEBg2xpQ2DjwrVIIf2xx8nbl4Jh+wAQt5LuV4tKnBzaQpdgg1J8mrbmclB2xFC93CNJq8sgz32nwZU/ThK474KMjJLdEm8ZNHPo1JMyFfvHoQsOaQNG/vpzzDKUKxbkI2ENDB63hPeZk4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(8936002)(8676002)(5660300002)(4326008)(83380400001)(2616005)(1076003)(26005)(33656002)(38100700002)(36756003)(86362001)(6916009)(316002)(54906003)(66556008)(66476007)(66946007)(53546011)(6506007)(6512007)(6486002)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+2SZRGn+OfYslYrI1A4vRGyT7u0yKIYXHvIS+D7yBd01aRrQP35ddVXivx0Z?=
 =?us-ascii?Q?SHnqy/VOPSJxECH6GYLK2y4Cgn/7SGEZd8FH4yE2P9aa1FxyCTmButSfsDH9?=
 =?us-ascii?Q?TVrZJ0F27df5Za70JwoIdVkxcR7mDmTZdp4hzWKN579gNQd2YlWpFhw9jwnv?=
 =?us-ascii?Q?/jEX1ZO1mTZ4yhX2MFRyTzh1u6tjwDCyvsNbUwqeqU6B3D5eo1ifdx+8MHLu?=
 =?us-ascii?Q?tOZWCP4y+zMekq5uDfgqE8Fb2Ses+gtVyReOZeA7Dg+YGtycPQgw2sOOoTl7?=
 =?us-ascii?Q?jg2hRD5VLAjyNiopsVgu243qGo6Hkr+XyLyG+85/qG3uZyJXxUO6FKhqAx1i?=
 =?us-ascii?Q?9HpGC6rBNMu2aj/c6A+HDa/6Ro0WapFzIkkCFYQBrLk9O9MZl9QFdv4j6RUI?=
 =?us-ascii?Q?ERJyIbGw1bGav4EMz/c3pS1eqOPiIgdf5Q2vTe4CBpFNoJ4BaBz6zxcnKrLO?=
 =?us-ascii?Q?+wm1s/wfY/s6QbzihjWVEewIioaeqWLyxi2ghDUZoqlhiCEFJyYge4jdz2GW?=
 =?us-ascii?Q?vJD5wKe8sl1A5vRqodOJGT4A1x3nfuuEBaus/PXs7Ehzr9QpHGXr/MDRxcV7?=
 =?us-ascii?Q?LnZ11eJpSx/aTuRf4mxwWKbUKCqYT21NqC0vTsd5ZpuqR/m1Zjk1GrBun0hr?=
 =?us-ascii?Q?8HTQqj+U1lXCo+ADbOhf/RKZnQeL/HfDAoYCQdPmG28LlO3upXm8W8DPpAfR?=
 =?us-ascii?Q?mCaek9wa5OPSDqBS2sMRCsjMTv/6TegwZVOuZLWHxZnYTBF4SidIT1EUJqEM?=
 =?us-ascii?Q?5MdhUeEXHIZxgqflD/Zv13KitFC24Qt0wmWH7jFzEGGjulcTz35mgO2CF5r5?=
 =?us-ascii?Q?jt5yTwBmtQX0wqYSXOLQPTOueW0fGhksiWZ4D2iZjOmdLaV91lRdsJjD3tlo?=
 =?us-ascii?Q?5B/z+wbYqwdHKRTpNrZt5h2bX9MSKa2uUu7VjW3OLHf3NbpuoHTNFjCScPso?=
 =?us-ascii?Q?EwRM37kw6Arslcw5oWlmpAwoviQ+z1bVv7o/x9lXDeT47SU5H+JfbubG7KKe?=
 =?us-ascii?Q?dsaObA+4dYE5MyPQiKyHTutiO3BUp4wrqDhP1LH2nDRgCrgkKkcssr1Kg7OJ?=
 =?us-ascii?Q?vUY/HrEOWoFZZoB4ODxQyTf++c61Ads5blDVYjOO9CHA971sI+JKxAUtcqgS?=
 =?us-ascii?Q?xrKdQKaaefkR/D+SIh0NJxnm4mMY6r3mA6gmQe7sRnfzl+gLKONV451Y3MCn?=
 =?us-ascii?Q?Vb/2DQi+xI9vhfcqjof8erOlOjdyfx/rGajhYURq/DnCsEuZENMJdw2QyIVZ?=
 =?us-ascii?Q?53EX45fVsIMpcoAEToe6eEP6j6KP600tPD65H+ImpX+VNtARytZ4T8i5Eh9i?=
 =?us-ascii?Q?9H8fJ4Y0nR0doA0/7A8Y+U4Fpa2dnwyoqSaqVBehK7KOeORe/XoZmJZDMX3V?=
 =?us-ascii?Q?1YpAP/6ovvBefzUDZQ3L7sPrhcQYAz0CC9T0mZBtqSSjzcO/G/bTmga1VEgw?=
 =?us-ascii?Q?gCKOPq05wBxAaMiMiz4G4W8paLetHCyR5XbPRGD2NCDRL+SL/GSv5e+ZS58f?=
 =?us-ascii?Q?1tSBxNDQpKA78I+nLlf6nr6I8/MJ53dryWLZRGHmyrs8k1QLodVDkH6imLsm?=
 =?us-ascii?Q?BGS0Bjm9OiyREn43M5BSUClEp+DOCSCW9qsO/Xlk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f237fad-f5ae-4407-9bc5-08dc2c8a8655
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 11:54:25.1888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kNDyUmXVjkvh2piNlO+fH7hmXhnooBAjhyUBFF6Bp6T3cHIuMJtdxI/xjPhiX0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885

On Tue, Feb 13, 2024 at 11:16:23AM +0000, Will Deacon wrote:
> On Tue, Feb 13, 2024 at 12:55:38PM +0200, Dmitry Baryshkov wrote:
> > On Tue, 13 Feb 2024 at 12:20, Robin Murphy <robin.murphy@arm.com> wrote:
> > > On 2024-02-13 7:51 am, Dmitry Baryshkov wrote:
> > > > On Sat, 10 Feb 2024 at 00:23, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > >> And then we may get a clue from the backtraces it generates. I only
> > > >> saw one iommu group reported in your log so I'd expect one trace?
> > > >
> > > > I added dev_info + mdelays() around the arm_smmu_init_domain_context()
> > > > and I can see that it crashes within that function.
> > >
> > > Yeah, this is totally broken. We can't just call the unmodified
> > > arm_smmu_init_domain_context() at domain allocation because half of what
> > > it's doing belongs to the attach operation. We should not be allocating
> > > context banks, IRQs, etc. for a not-yet-attached domain, and we
> > > certainly shouldn't be touching hardware there outside of RPM.
> > 
> > Should I send a revert?
> 
> If reverting the patch fixes the issue for you, then yes please!

Not the whole thing though, just remove the 'if (dev)' like you
tested, thanks.

If you want I will send it

> Hopefully you can help Jason test a reworked verson for the future, as
> it's evident that Tegra doesn't tickle the power management side of things
> in the same way.

It can stay, as long as it uses the alloc_domain_paging() that is
enough for the core code to move forward.

I included it only because we were able to test it, most of the other
drivers I did not try to move their "finalize".

Jason

