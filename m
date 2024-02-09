Return-Path: <linux-arm-msm+bounces-10417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63484FFD0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0BB61C22A75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B279F210E7;
	Fri,  9 Feb 2024 22:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jkMAJ1i1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0013A21350
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707517436; cv=fail; b=fORqCEVB1hngjpGIDONWwnGnZZ78dAPVL17IdLK6dLwB9ob0B7ulJpRJ+zGYyOxADiXvyul1+l+mr8gBPgmj0f0ncn/XhY4qtkGny0O9mvuAQYx5XuliHie8W0e2Oe53IvgO/CgouEgU7Bmxn39o59XKbOmJYgI80ptWW7IFT0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707517436; c=relaxed/simple;
	bh=Vi5QiqX+4Z92hoVenkft8vbY17OjI2jMCnyZFXfvIVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nbfmWePkZbm8jmNMYNDLzV+Xmzidm6pROk4ar07hIME6PivdQ9ZVZT7Y/ErBoD4DsdjcHJY1rLadvMk7SHbki1PYoItzNWWzpNU2iNlMZd574l9c9HHcScg7j1cQlfTcpYWQ4nW2Ay7LkBmQ9zoDyGzyT02g+0x95WO97nE1MdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jkMAJ1i1; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQkrjJFQsjHk03uSBq969FN4xrg4qXuz1I5aHN1bxw1Jn94UphUzKVjn9QCvu7M+uBNBgW2D46gcMpgO5+UTWQxiyAZN6iotPKNpz4VI4UHoDsctr8UDVobaZTC/JXfnpkrXNTuoHKNeEJhS4sD8LYjpjiHBTV76rwhD8J7staJi/lab402kLKnrN15VmGE3HdPKlkOp2kIiC4VXGwfDPgZi6BH8W8sr1jd8gUbCWtDMhLRsjqro/rwCv9ZEVcQ/6+Yybf183dkVAY1FjKRCV8DXKgjQPOE1H9BfHUiFNFpNBEnwDKTybm7Qh5BVXWijVCpPm3tKOTmQ8PbIG5+RgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOeP9blMIkyObTnCRL+Ny7gI4tOl9Wuv7MTo0bRA/oc=;
 b=Ton/qXy6YzpoibF/l4q530tDHYUWx7wN+cBGzDgLXTvwKki1WN9rMECMyq+IjJCQHIuvw0H/Zd769ZEWyI0N7p4ojg+HLQy7j2ze6SGYfuX5+p94eruwPzFlc1Hfa9fTM2826n2Yvr7tt7wLrYUUahAEZMbS7eDrDU+1MeKCKZDbtMLzomCCXDDV+4ySLgqiNWUf/0MB+lvFu9680/88MJZzm1uHF8jwH9f0RbhROI7KsM+DwC+fMDQQfFFOkQh/xFrBtMjX8Q43Xl+26a+YZShChQ2U1p37VHW2+Qy5QKgGAQtt2UjMLhETjgspB0LSHAoS1O8Dnh4ostq8huSvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOeP9blMIkyObTnCRL+Ny7gI4tOl9Wuv7MTo0bRA/oc=;
 b=jkMAJ1i1F/l54mFliSWGz7BhZLbWtcni1h8OKr3bOqaDa4OO9PSdQR3+Ybm7g4RTTti/fqUjlgttBEUcM+LU0Gi9ogVyBt1rVuxoToi2wYQ/eePlMVSRr7Ee5gODUE2MkEU4Sn/eaQlULzC4Tom7qr4j1FKxCzHsy3QVGT8sxFWo3PJG+4Q/tVgEawnkrqTw3z0VpwkJ+ioHXHBDmjWvmOBMpVI9GreB2TP7kQUn1/nTBz62Bq0aP0NHynPlkJE2GPmmVDtfQdDgjR6+l5ordU4EiJRxytvaS3IY3ybFeJyMYJEKL+p5XgHYBhYoLJRCLLxxh3L9aXbP87JsrYuHEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Fri, 9 Feb
 2024 22:23:51 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7270.012; Fri, 9 Feb 2024
 22:23:51 +0000
Date: Fri, 9 Feb 2024 18:23:49 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: iommu@lists.linux.dev, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com,
	robin.murphy@arm.com, will@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu: Convert to domain_alloc_paging()
Message-ID: <20240209222349.GA923780@nvidia.com>
References: <5-v2-c86cc8c2230e+160bb-smmu_newapi_jgg@nvidia.com>
 <20240209200538.917366-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209200538.917366-1-dmitry.baryshkov@linaro.org>
X-ClientProxiedBy: SA9PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:806:27::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: aa83132f-8c6e-4e8f-ba5e-08dc29bdcaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sg0IgKT/ewT27dN7A0arEsZ8247lgBOc/kncJz/mLTwJ2SbtP5FwzGNB2yl15xFnKB9onAFdiGU/U8axEIyyMKN3bPkhII3k01YlF92uigi6zY0FtBB5LrZhOptwzN5rByaGIW2l0xzl2ETo35QeEoay9TcU3nwa9o4oRfQMcc+41YxgM6ATuSUw7wnsnw4wy+1GlXy9zbhPwKTQKg8MRyDxWlczZjrhtbPH+y7czNHTBMGvK1IavUuzQwMldJ2lsuefvFqDCzhisY5cOES2qMikxrNrKUtSZjY/nMCkAB4nvphXUFhtyxqrQTqzqjg90ywjecw6AUCw4oI8nF34/1XVaCtUMaHbMFZBfI/MoMgP3DetzSBD3JFudeXYb0Ugj9sAEwFbgPruwqSmYPndqqsG+K2OoadNhIP6UluN7BWqE0BSj3XqRLfUc8SZV7QGhklku/SLytI0Efye2sUi/57jlryhzzFzJCM5iUDGZkXCRzDNMgqvAimrmaIi01SAIbRR1rwIPBohaV6iG6aS1/duQGrOLDkRRmZaa1MKMVpUbzZgEgpYsj11EfMGTi+5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(478600001)(6506007)(86362001)(6486002)(316002)(33656002)(66476007)(2906002)(38100700002)(66946007)(66556008)(41300700001)(6916009)(5660300002)(2616005)(26005)(1076003)(8676002)(6512007)(83380400001)(4326008)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yKvNuss1SOyBwdWbVeS4LDxk5mNpxcw1o5GPXDl4RefHTkj/2R24YFbnIWqg?=
 =?us-ascii?Q?xz3XVrx7MTqXpwglNeSiig1EUvQcfRgrZE5GsiwQl7aXiaA32ueugZz/mKOM?=
 =?us-ascii?Q?h5p5NB7rqgCN+pMBO55bP/oEjUMK0K2cw+sP2R5KR8VX/qf4VoEPhLnuSrkT?=
 =?us-ascii?Q?uIdtCOokyF0FCaPpJ1bSHerL2wjlPv0cdQhU37yQ+dagMF4rcLLzuaBEXiTY?=
 =?us-ascii?Q?nQhdZx9KVPaUyxzameGjdA8AhrUFQ4gR8va23yqd4oeeI861JOBlxZafZ4+7?=
 =?us-ascii?Q?HOM4SYL9QyvS1SvL1wHMtFG3+Qkw5E0nPpE40m+pWd6SeXfcAfj5awGRXLco?=
 =?us-ascii?Q?K5JJrfvuc13zxOs8On5XaMi7vb7dmr2xb1bWc2wd7+qWr5E6vVl3eqGd8TRl?=
 =?us-ascii?Q?Nll9Wzyui3CmruZugKoqLWJRKpw5Tlr0vzsba4ZWZT9Ys8MDS5teZir4yVKW?=
 =?us-ascii?Q?uymqZfpZX7HzXyfrU0xRJ5TUs4zUshuLzi4Y3HwrrblKBDDFOBybPG8tr1uo?=
 =?us-ascii?Q?EwhEJ5EH93Y01yYHqGQqJGXGbtweHyZ6EjlYo5Ox478hfvkCzRA7l2NcRU1u?=
 =?us-ascii?Q?TxQFfBvFC2mi9CvhzhihiBXU1EDrZesg9XwAlYYulJq1QNsTT7HMysmiZpI3?=
 =?us-ascii?Q?7aRlSku6cyPRPs4hlY4lxD9LoWRyUsKbIKmRgUgZlDQnGHeCQCqnuel3clET?=
 =?us-ascii?Q?xVWEeMryFBO6sK0H6Kr5XvUGcJrZ/3J6UYBfRFwXdxdbhxvL5LYM6aZyJbRv?=
 =?us-ascii?Q?AgM/696kd7oZMMBvwaNHxB2JEHNuunk9ZKtTl+a+0QCFcRMOxJDkWQwnsQ9s?=
 =?us-ascii?Q?Jn61fnHoI7GUJ+aQl7JxcW2vOgHPdG5fyLSP1TCGOswrlH/Gm0CCx6KL9czF?=
 =?us-ascii?Q?ZwqooazfcnOIN/v/We/yBkgqYGvxlx3SSx4HIduW0irWCj1lvG8eYZPNgzW3?=
 =?us-ascii?Q?g8AXDXW6zTGRr/SXGgtu7pR1pnB0o/VUUlWGoIcetAhQbiCmScH/IgEZ6Jic?=
 =?us-ascii?Q?Na3ckLI+EUDhL1O4Dmflf62seon9b2I3EQ/BuzbMuL3LaeBujJnrWNROnXjq?=
 =?us-ascii?Q?D/+rATdI86Edq8m7Eb4x10Ae7jKs5QelrAuoszwPjZIneyB/L1LGzg+Zy40Q?=
 =?us-ascii?Q?aIKfYE6EZm21c5XNW2eM46WglbaIf/zXYRHvjVuaUL/rNloUHgV/83IpgbW7?=
 =?us-ascii?Q?fGX2WP3ljwm6NRZ9L4RLMoa7206K1cfpuCzFArpMlnL3fTJO5Mf7wm3lnfve?=
 =?us-ascii?Q?/dcI/sZr+NeW122G72PXV39kYk8zPDWdXVqtjFgG32X/zICudcUf6dC2tUWr?=
 =?us-ascii?Q?gSZTL0HkdH2Ggv1tYJYzooGQL2NCvDKnC7Ir7OjhQefpKEOZCO+OFiaVSrV1?=
 =?us-ascii?Q?a2bSP+ZqQCUh0SSmRxHx50w4xocFRMkCiP0IgXgLIbS3UoiztaK4Xu2Zk5+8?=
 =?us-ascii?Q?Sd+4k5ph13yQQKB1WTGpL5ZoPVBkSW8UIvf8JIejAybXWyrRjrzTsmc1pKHu?=
 =?us-ascii?Q?V7CSy1z+2MIaP5bbUygt3tR5mRpK+0QZAPBoeHTp3sLFK3cp8Drw6xeVjrVV?=
 =?us-ascii?Q?z1nDXz0E4D7vWccaAxc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa83132f-8c6e-4e8f-ba5e-08dc29bdcaf8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 22:23:51.2000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B24bu6mC//pZ2r7gbNAkZb3QIsGhCA0XSPnBiNf6NiGwwr83Yi1+PXLfr8AQ9uVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511

On Fri, Feb 09, 2024 at 10:05:38PM +0200, Dmitry Baryshkov wrote:
> On Tue, 17 Oct 2023 Jason Gunthorpe <jgg@nvidia.com> wrote:
> > Now that the BLOCKED and IDENTITY behaviors are managed with their own
> > domains change to the domain_alloc_paging() op.
> > 
> > The check for using_legacy_binding is now redundant,
> > arm_smmu_def_domain_type() always returns IOMMU_DOMAIN_IDENTITY for this
> > mode, so the core code will never attempt to create a DMA domain in the
> > first place.
> > 
> > Since commit a4fdd9762272 ("iommu: Use flush queue capability") the core
> > code only passes in IDENTITY/BLOCKED/UNMANAGED/DMA domain types. It will
> > not pass in IDENTITY or BLOCKED if the global statics exist, so the test
> > for DMA is also redundant now too.
> > 
> > Call arm_smmu_init_domain_context() early if a dev is available.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> For some reason this patch breaks booting of the APQ8096 Dragonboard820c
> (qcom/apq8096-db820c.dts). Dispbling display subsystem (mdss) and venus
> devices makes the board boot in most of the cases. Most frequently the
> last parts of the log loog in a following way:

It is surprising we tested this patch on some tegra systems with this
iommu and didn't hit anything..

The only real functional thing this changes is to move the domain
initialization up in time, potentially a lot in time in some
cases. That function does alot of things including touching HW so
possibly there is some surprising interaction with something else.

So, I would expect this to not WARN_ON and to make it work the same as
before the patch:

--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -875,7 +875,9 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
        mutex_init(&smmu_domain->init_mutex);
        spin_lock_init(&smmu_domain->cb_lock);
 
-       if (dev) {
+       WARN_ON(using_legacy_binding);
+
+/*     if (dev) {
                struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 
                if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
@@ -883,7 +885,7 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
                        return NULL;
                }
        }
-
+*/
        return &smmu_domain->domain;
 }

Then I'd ask you to remove the comment and do:

@@ -878,7 +878,9 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
        if (dev) {
                struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 
+               WARN_ON(true);
                if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
+                       printk("Allocation failure in arm_smmu_domain_alloc_paging()\n");
                        kfree(smmu_domain);
                        return NULL;
                }


And then we may get a clue from the backtraces it generates. I only
saw one iommu group reported in your log so I'd expect one trace?

Thanks,
Jason

