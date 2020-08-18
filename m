Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C2724809D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 10:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgHRIbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 04:31:33 -0400
Received: from mail-bn7nam10on2084.outbound.protection.outlook.com ([40.107.92.84]:21857
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726165AbgHRIbb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 04:31:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jozRH25AhCqdmExxZxGKK76UmbNNLnbQBJhG6aerRB2xADYfApJuAMlHNuDOiYSLkGtOUmTTAlceIo8JyAk1deAo3hCZz387iqzTzlLEKDyS7854wfihrOeoUv1x1CXTZKEIUSEAcyOoP6whxm+GIqWL+TiBogKYtb7yGC58zdvmCnWDgXEZjDGVgh1I46hVH20vbpeqtDG530/BJ+Ymf8NbbVtNElT6hMIvGibLTAL66CmlMz9i12NglM6we+kNmBDybLvO9tSvR7k7oo+ZeWJthp+vzPsIuEWvldjWRz08cJ7hBcfLs+S69i6z/bxO/yjdIyC8+8dNHkKHkCwmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+zrV1tiZSyPoEH1/0OgFEmJxkx6pkIq+hXK3ZVrooE=;
 b=BaJiXLVwQbrzdmL1v1e93sK+38Z0ubgqRVdVMVAt+M2/5wQ8lPGB29BmYw/SQI6kvjn4/t6SCuHYMi0kJdAZxiykft9rawE5OwHhX3wX76CqzHyMFuNIsxYGssY7kkj9lmZkWN1J5olQvhURqwqpmdM2KW0HDfsbBY9gJsSIaWGAuB0IsJtjeYWDTe+gaI8QLoMycWePd65zs6sGEAEG3ZbiM40/LQf8tKV5feauSLBMH7kyYpQKTfd42zv73EhYJv8oD9ApMtKi99bZSanCeLbUlfDpsrNQw73DxgFmXAIG98ExtC9gISYfuUZU8iuC+StxKLHfeYkml6LslIdywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+zrV1tiZSyPoEH1/0OgFEmJxkx6pkIq+hXK3ZVrooE=;
 b=Y1RJyxhJn/hyNQ09gRIPIukFVGUjYVZVbTIfFJg0W7fJesDkwYpxUUkfmyj98ix2boidT8a7bzJXm1QMinPTcmuei5olVUJygLdke35RRcTp/X/v2ZWpyUzurHaEpKwigf+c0Nc1udPb/uLHPP37BzXU3znOOc6GPcboeY5U8gM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 08:31:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 08:31:27 +0000
Subject: Re: [PATCH 1/2] drm: allow limiting the scatter list size.
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <nouveau@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        "open list:RADEON and AMDGPU DRM DRIVERS" 
        <amd-gfx@lists.freedesktop.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" 
        <etnaviv@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
 <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
 <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <03c03129-db27-c6da-df8f-909141d2a3f7@amd.com>
Date:   Tue, 18 Aug 2020 10:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0142.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0142.eurprd06.prod.outlook.com (2603:10a6:208:ab::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 08:31:24 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 733fd9ac-5bf9-4479-2d30-08d843511978
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43203D0876E0A0E3FE06BA86835C0@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQaNOJXCKf3kKYJ59Cb2Dm2gnNaHZ0LBy4rCZViA0eu9SEgygFr7lqNBtLsLOSB2tOQc1grI/3ZgVRa+tWc+PDiQUCDerWl9qSHzFTxytn+WNbCUGwTGqm8P/ALyEUDnA4MDRDV0c3RgynClLR/qp6Y1dMvndi6/nOgHcjlHHjid1aOEW7OgNKjJkZgpwjvrqJyNCuDZQ55Y8marTz+vsF3U9JflaYbxHJ+rWIM/8yDGW9bqsS85fFMZJCvgcRuHPI3NkAIsxptt8PLvhDUTcxLr85wElcEj8ZUIhheGqPs/7mqNqDCvT17D3zVQStWryRUnSOaZi6caSSDonxSpJVhQJrRB5Nm1W1Aoh5yqPKwPwnuCtxc/JYVLfMsLm10R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(8936002)(31686004)(5660300002)(316002)(66556008)(66476007)(6666004)(36756003)(8676002)(186003)(478600001)(2616005)(31696002)(16526019)(2906002)(6916009)(4326008)(86362001)(6486002)(66574015)(54906003)(7416002)(52116002)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Kg1CmbjzDwObSoZoMrNCi8+hXFQDjU92ZpmsGLbTBTDzJ/mLacqHqFh0F1DM8+6w8Ce147m3qYvj8IbFvPXHjPNtaLFgR6X1AqkK906wxQTWWUcCKq3pT8CO7YqOlnTkb+ra3TbwlvKttW8sEpdsdNWd/Vlv2tdutM9swBs+WuhUHeTvgk6KlP3wDDtPbXM4IMA5BW6YHR8/X5U0JqP+AAQeYcCcFrv7Csn2R44KGcIRDvwvFU8gEQjNQvOOMrNachlK6aRpZFflIoFeMeD+LD69I9v+TvQqvdaW9b70v4zf87obZJcaK2jII8W1cHL1kFdq1XPeZX7PuuAe7Xaor/6g5rK3yfzFleGuvTxvletLBwQh02RczflKflBTrY+T6ITUcMERDw2Ob+AgpCNMJ/lJkS2pVuDe7mYr6Ma/raZ4W2SUIQGtfxsSI6tUIHWBtN/EXQkapF1iSWh2dLm+r75GZd4jETyncozb3DGXm30/zfQeB+VqlDwcvPZHqzAueS/8EB5ckxnkS3slVgqNSdF7qNoecIz95WIpRPLAvIFHO7oTlmuc7fRiyapZJ5jsPyJE3aJX6BVdaABibkdhk9GOHrVc6X5cRFQZDlYRyKVreJDdb4Or70/LCf//38OcYq704RSYoxE3LQw6X9SMIWcSa6JJpb7d7MYJHkHPGl6tZ9S3KmRcHDsJ/PxFAQGnoUbvdm6yW1NGBQVwb9o7Ew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733fd9ac-5bf9-4479-2d30-08d843511978
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 08:31:27.6280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjBcB47fGEt4/fIiRNL0Ry5fSoEAzS0fx60Ge7bc3/5IWqE2oGhkiPzhznoF/Lzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am 18.08.20 um 10:27 schrieb Gerd Hoffmann:
> On Tue, Aug 18, 2020 at 09:57:59AM +0200, Christian König wrote:
>> Am 18.08.20 um 09:48 schrieb Gerd Hoffmann:
>>> Add max_segment argument to drm_prime_pages_to_sg().  When set pass it
>>> through to the __sg_alloc_table_from_pages() call, otherwise use
>>> SCATTERLIST_MAX_SEGMENT.
>>>
>>> Also add max_segment field to gem objects and pass it to
>>> drm_prime_pages_to_sg() calls in drivers and helpers.
>>>
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> I'm missing an explanation why this should be useful (it certainly is).
> virtio-gpu needs this to work properly with SEV (see patch 2/2 of this
> series).

Yeah, that's the problem patch 2/2 never showed up here :)

>> And the maximum segment size seems misplaced in the GEM object. This is
>> usually a property of the device or even completely constant.
> Placing it in drm_device instead would indeed work for virtio-gpu, so I
> guess you are suggesting that instead?

That is probably the best approach, yes.

For Intel and AMD it could even be global/constant, but it certainly 
doesn't needs to be kept around for each buffer.

Christian.

>
> take care,
>    Gerd
>

