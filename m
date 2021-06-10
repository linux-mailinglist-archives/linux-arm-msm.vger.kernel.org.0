Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471383A2AF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 14:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFJMDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 08:03:23 -0400
Received: from mail-bn7nam10on2068.outbound.protection.outlook.com ([40.107.92.68]:13343
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230254AbhFJMDV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 08:03:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dsuotipu6RwvKNZ/Vcdku9rrJAsvT35Y2i2nJ7WpCfXU5lGwomPJx1Dt4AcbXVUSR3HbW2cCaC5XCYRqQmQ5ry+rDVe23HNjpX2t/MRl67MKAw5zwGK5oCYn2Y6T8tTaYgtzRJfNFyODZT2CclwZtLA+C8922E1rwccg+8lhnipeay9ZKAJaBLkAQmihQLr6usN76HLehsmpqlBGIKfr1oORe3Q1/3PwXeYABmW0FSkm/XZbugPcrO4cxMOoC2NesY0r9WRLoiLXwPC86xl8zhV2WaAeN697kopczorwRrfKOJlhj0WVZ8+d5jr7/vTlD7i/KlIusSzUi+b43ivDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAQ0sW8W9cenaPaudYVhWixGjwbGU5euZ70/fG9ti6w=;
 b=GSt8w7OmDkgQ/aAnPObZVTm8Enl0oNei8Z8itxg7UlpbIQR+lKLAvTPcnllwMJgjq2cAt0HVcSki4u55b7PcQwsmnys5peSEG9ObqXfH7xYm9ESmVIM1+u6kkPvlG7t9wtCR2QRQOcQiFWlXRRlWhWcOsHIK4Ijtu37Ziw6gwLsuE85+ELOQalEIpXoHg5yhLiF1MPX4NnHMaBoLXWqDaA1HtL4WdD9IjEMRvWyJZ2k1UQyAM60Cjtqdj3oW3F+kCQx9PnAjfjEE1I44sW6/gXwZqqppnQRPzJFhuh6mKjtwlcjFIHm6jNkdxauvVMoimYZcHM6pJyPHcQLfmH3Ihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAQ0sW8W9cenaPaudYVhWixGjwbGU5euZ70/fG9ti6w=;
 b=It8V1HoqQK2xbzIbdInBiR6DIrZBnr2q/ChntaLt7S+2sQeJDcdLUrLGXqcxl8R8YQpYMd7xiKNJFQp0VR6qtkd3MFLFG++p/X++LrDPXPbUPtLB6jy+xc7WOTQ8Wc5o+Jk92GkLaZ9eZEX+BcJhkZbrnIZfVcK1aq9iizkul6aNB5IopUC28ibMePXRc2Ms+mS7/Cju4uVxes9yU87X1RZ7e86ejOzRa4yp85jXd/6OMZEaFw8Zf3YcvguMrNZHD99mrm940ZRQTGcO87mpg4QPMJnWJyD2iO1CSRD3dHWlCbR30H6KGHr+CdxrUjc0lyWWXZUlQoWTgTY1dZdw3A==
Received: from DM5PR06CA0056.namprd06.prod.outlook.com (2603:10b6:3:37::18) by
 DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Thu, 10 Jun 2021 12:01:23 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::78) by DM5PR06CA0056.outlook.office365.com
 (2603:10b6:3:37::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Thu, 10 Jun 2021 12:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 12:01:22 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 12:01:21 +0000
Date:   Thu, 10 Jun 2021 14:03:03 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Krishna Reddy <vdumpa@nvidia.com>
CC:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
Message-ID: <YMH/d8SXkYmbztZd@orome.fritz.box>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="um53ZMkAjPcztXZJ"
Content-Disposition: inline
In-Reply-To: <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0f331ec-4157-4626-7b15-08d92c07776d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3868:
X-Microsoft-Antispam-PRVS: <DM6PR12MB38680CC780EE68625081A00DCF359@DM6PR12MB3868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZB+e1pLf277bEkMzTKlWRcO2sgWgwliL1ccpAk+MiYB68T/g/pLIL6KAIO4HAywvP0mnsClnvWsYQNVt6OufoXDaDccuSIL3zbvrUoQ7DDEszqgJbLc7Y7T2ueRb8ZspAN+I3wsT7/wZiYf/qAANDG4Uy3W6nyGdjaPgr/5Gt6GdFfpJWjQpI469rtM57U2vVEkzGPmFV3DPyfvVy1sXA0ftyKhZkFqRzimXRyXqkjIBfQUTLy16NNTiPvHSuIbRDoNBWpd+xUdfKj9kQ/FBXOBaQUzgjqf7wlo0VRs71/xxDNFH1mhAQvBFDshO6MVxrjBP+3FEBkNUx22bQLwemIZgqY18SfdDz9nrNh4uZPgNoqtwc0eAhIH3xcGNGf5A7abICOdpWegpQAjO4lSel6GS+yi6+q9/ncwGKQ5LaVk4byh7TXXHMdlUlleeYUZu43Lrvb5FFWArp6AevfDmrlNop5R0Od5741OcC4rU9HUquJMgXpeMrAXfdxErGLtjlMDa7iu9p1ET5paVm2O3PEbQW02ok3VJg7FzUUh17YhHh/w+HD8t+25TxrqDe991j2EwGmASK3CBa0nJw/aLl2dbRKi4XSSQCvRcrfr8zDEUOSrYjesR3zWH5WQ6dhw+0d9L0twu71YebfWh2SZ8XhX3wMhUoMXSbbeSckkUj+0M5x/yOtESASJctFH3YZI
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(36840700001)(46966006)(9686003)(478600001)(4326008)(36906005)(82740400003)(21480400003)(356005)(26005)(336012)(8936002)(6636002)(83380400001)(316002)(54906003)(426003)(110136005)(8676002)(36860700001)(82310400003)(70206006)(7636003)(70586007)(2906002)(33964004)(86362001)(5660300002)(53546011)(186003)(44144004)(47076005)(6666004)(16526019)(2700100001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:01:22.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f331ec-4157-4626-7b15-08d92c07776d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--um53ZMkAjPcztXZJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 12:33:56PM +0100, Robin Murphy wrote:
> On 2021-06-10 10:36, Sai Prakash Ranjan wrote:
> > Hi Robin,
> >=20
> > On 2021-06-10 14:38, Robin Murphy wrote:
> > > On 2021-06-10 06:24, Sai Prakash Ranjan wrote:
> > > > Hi Robin,
> > > >=20
> > > > On 2021-06-10 00:14, Robin Murphy wrote:
> > > > > On 2021-06-09 15:53, Sai Prakash Ranjan wrote:
> > > > > > Currently for iommu_unmap() of large scatter-gather list
> > > > > > with page size
> > > > > > elements, the majority of time is spent in flushing of
> > > > > > partial walks in
> > > > > > __arm_lpae_unmap() which is a VA based TLB invalidation (TLBIVA=
 for
> > > > > > arm-smmu).
> > > > > >=20
> > > > > > For example: to unmap a 32MB scatter-gather list with
> > > > > > page size elements
> > > > > > (8192 entries), there are 16->2MB buffer unmaps based on
> > > > > > the pgsize (2MB
> > > > > > for 4K granule) and each of 2MB will further result in
> > > > > > 512 TLBIVAs (2MB/4K)
> > > > > > resulting in a total of 8192 TLBIVAs (512*16) for
> > > > > > 16->2MB causing a huge
> > > > > > overhead.
> > > > > >=20
> > > > > > So instead use io_pgtable_tlb_flush_all() to invalidate
> > > > > > the entire context
> > > > > > if size (pgsize) is greater than the granule size (4K,
> > > > > > 16K, 64K). For this
> > > > > > example of 32MB scatter-gather list unmap, this results
> > > > > > in just 16 ASID
> > > > > > based TLB invalidations or tlb_flush_all() callback
> > > > > > (TLBIASID in case of
> > > > > > arm-smmu) as opposed to 8192 TLBIVAs thereby increasing
> > > > > > the performance of
> > > > > > unmaps drastically.
> > > > > >=20
> > > > > > Condition (size > granule size) is chosen for
> > > > > > io_pgtable_tlb_flush_all()
> > > > > > because for any granule with supported pgsizes, we will
> > > > > > have at least 512
> > > > > > TLB invalidations for which tlb_flush_all() is already
> > > > > > recommended. For
> > > > > > example, take 4K granule with 2MB pgsize, this will
> > > > > > result in 512 TLBIVA
> > > > > > in partial walk flush.
> > > > > >=20
> > > > > > Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unma=
p:
> > > > > > (average over 10 iterations)
> > > > > >=20
> > > > > > Before this optimization:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 iommu_map_sg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommu_unmap
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4K=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.067 us=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1.854 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64K=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.598 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 8.802 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1M=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 148.890 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 130.718 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2M=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 305.864 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 67.291 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1793.604 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 390.8=
38 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2386.848 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 518.1=
87 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3563.296 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 775.9=
89 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 4747.171 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1033.364 us
> > > > > >=20
> > > > > > After this optimization:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 iommu_map_sg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommu_unmap
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4K=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.723 us=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1.765 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64K=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.880 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 8.869 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1M=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 155.364 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 135.223 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2M=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 303.906 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5.385 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1786.557 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 21.250 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2391.890 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 27.437 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 3570.895 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 39.937 us
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32M=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 4755.234 us=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 51.797 us
> > > > > >=20
> > > > > > This is further reduced once the map/unmap_pages()
> > > > > > support gets in which
> > > > > > will result in just 1 tlb_flush_all() as opposed to 16
> > > > > > tlb_flush_all().
> > > > > >=20
> > > > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora=
=2Eorg>
> > > > > > ---
> > > > > > =C2=A0 drivers/iommu/io-pgtable-arm.c | 7 +++++--
> > > > > > =C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/iommu/io-pgtable-arm.c
> > > > > > b/drivers/iommu/io-pgtable-arm.c
> > > > > > index 87def58e79b5..c3cb9add3179 100644
> > > > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > > > @@ -589,8 +589,11 @@ static size_t
> > > > > > __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!iopte_leaf(pte, lvl, iop->fmt)) {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* Also flush any partial walks */
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 io_pgtable_tlb_flush_walk(iop, iova, size,
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ARM_LPAE_GRANULE(data));
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (size > ARM_LPAE_GRANULE(data))
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io_pgtable_tlb_flush_all(iop);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 else
> > > > >=20
> > > > > Erm, when will the above condition ever not be true? ;)
> > > > >=20
> > > >=20
> > > > Ah right, silly me :)
> > > >=20
> > > > > Taking a step back, though, what about the impact to drivers other
> > > > > than SMMUv2?
> > > >=20
> > > > Other drivers would be msm_iommu.c, qcom_iommu.c which does the same
> > > > thing as arm-smmu-v2 (page based invalidations), then there is
> > > > ipmmu-vmsa.c
> > > > which does tlb_flush_all() for flush walk.
> > > >=20
> > > > > In particular I'm thinking of SMMUv3.2 where the whole
> > > > > range can be invalidated by VA in a single command anyway, so the
> > > > > additional penalties of TLBIALL are undesirable.
> > > > >=20
> > > >=20
> > > > Right, so I am thinking we can have a new generic quirk
> > > > IO_PGTABLE_QUIRK_RANGE_INV
> > > > to choose between range based invalidations(tlb_flush_walk) and
> > > > tlb_flush_all().
> > > > In this case of arm-smmu-v3.2, we can tie up
> > > > ARM_SMMU_FEAT_RANGE_INV with this quirk
> > > > and have something like below, thoughts?
> > > >=20
> > > > if (iop->cfg.quirks & IO_PGTABLE_QUIRK_RANGE_INV)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io_pgtable_tlb_flu=
sh_walk(iop, iova, size,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM_LPAE_GR=
ANULE(data));
> > > > else
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 io_pgtable_tlb_flu=
sh_all(iop);
> > >=20
> > > The design here has always been that io-pgtable says *what* needs
> > > invalidating, and we left it up to the drivers to decide exactly
> > > *how*. Even though things have evolved a bit I don't think that has
> > > fundamentally changed - tlb_flush_walk is now only used in this one
> > > place (technically I suppose it could be renamed tlb_flush_table but
> > > it's not worth the churn), so drivers can implement their own
> > > preferred table-invalidating behaviour even more easily than choosing
> > > whether to bounce a quirk through the common code or not. Consider
> > > what you've already seen for the Renesas IPMMU, or SMMUv1 stage 2...
> > >=20
> >=20
> > Thanks for the explanation, makes sense. If I am not mistaken, I see th=
at
> > you are suggesting to move this logic based on size and granule-size to
> > arm-smmu-v2 driver and one more thing below..
>=20
> Simpler than that - following on from my original comment above,
> tlb_flush_walk already knows it's invalidating at least one full level of
> table so there's nothing it even needs to check. Adding a size-based
> heuristic to arm_smmu_inv_range_* for leaf invalidations would be a separ=
ate
> concern (note that changing the non-leaf behaviour might allow cleaning up
> the "reg" indirection there too).
>=20
> > > I'm instinctively a little twitchy about making this a blanket
> > > optimisation for SMMUv2 since I still remember the palaver with our
> > > display and MMU-500 integrations, where it had to implement the dodgy
> > > "prefetch" register to trigger translations before scanning out a
> > > frame since it couldn't ever afford a TLB miss, thus TLBIALL when
> > > freeing an old buffer would be a dangerous hammer to swing. However
> > > IIRC it also had to ensure everything was mapped as 2MB blocks to
> > > guarantee fitting everything in the TLBs in the first place, so I
> > > guess it would still work out OK due to never realistically unmapping
> > > a whole table at once anyway.
> > >=20
> >=20
> > You are also hinting to not do this for all SMMUv2 implementations and =
make
> > it QCOM specific?
>=20
> No, I'm really just wary that the performance implication is more complex
> than a simple unmap latency benefit, possibly even for QCOM. Consider the
> access latency, power and memory bandwidth hit from all the additional
> pagetable walks incurred by other ongoing traffic fighting against those =
16
> successive TLBIASIDs. Whether it's an overall win really depends on the
> specific workload and system conditions as much as the SMMU implementatio=
n.
> Thinking some more, I wonder if the Tegra folks might have an opinion to =
add
> here, given that their multiple-SMMU solution was seemingly about trying =
to
> get enough TLB and pagetable walk bandwidth in the first place?

Yes, so Tegra194 has three different instances of the SMMU. Two of them
are programmed in an interleaved mode to basically double the bandwidth
available. A third instance is specifically reserved for isochronous
memory clients and is used by the display controller to avoid potential
pressure on the dual-SMMU from interfering with display functionality.

I'm not sure if we've ever measured the impact of map/unmap operations
under heavy load. Krishna, do you know if this might be helpful for some
of the use-cases we have on Tegra? Or if it might negatively impact
performance under pressure?

Thierry

--um53ZMkAjPcztXZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDB/3UACgkQ3SOs138+
s6Hh8w//cXbmVt1f0VhDfP+5OFk6BVyaSnt8OLQoTyQezX0X+in6DbZJHbT1OxFb
fUEbr4V1J77IboayqNASyPb4/Gri/4BfPC64gSHUFCMrFt7jwovtG/tXnXEa0FwQ
JYMLqtnPFJC3AaVkpxOpE5184FZERiNCrp3w/Nr1RHn45V80kwpspDgoCitrnSzZ
8JIMfUReQwINzBcjWRZjSL7D+ht94lfAQCMGzQ+J8xJLyZ371HhgzqlCP5dHo5OQ
BZxSb33G5N8ED3sSOUJr9zIqbxdcB7T5voyFRQ931Q/Uv5ja8BwbDy4znDdnI1M3
SdaADj/RY2SpymiRT+v2TQ5xd07v7kWLQ4W2+aNzrm6cDL3msQJPvsxDSvI/df4+
+SjtLxgcoZJtVvZcJRAFfnypMTJ1TWlsIuObWf2InGJM2JXBUA4do1E4joY9XcFG
FmGoacPbnfOYVHI/YJTsjYepuoO2jiSmjCWZw8qmhKGAJ1qCOvvgyvqzR3qPctAm
J/s9iwNWo+9foJkml8C/E+pyu+o3bqri4jPqNmlD4s0trrM77wOnVdUSvsoiPoV0
oEoWN/qV8zPNIPWEMMMyKZVteokT0JrjucytbMKssf2zC+kJZDqTbKsTU4TdSj+l
aPc50vO4IF3nrLum+gDJvUf+BsyDQLUZdVfFpXOa5TBLml+vqSk=
=PwO5
-----END PGP SIGNATURE-----

--um53ZMkAjPcztXZJ--
