Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2D46F3A95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 00:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbjEAWkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 18:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEAWkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 18:40:51 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8B1173C;
        Mon,  1 May 2023 15:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRWDwMbWql6Y3mFirjiUmPSQaHdzIm2348OTeBCoyGyy4ejLzS0TreDzRqmEjbugqpn4Hkana8iJTCwL0NQpk/G1WPB+H44tf05uYBVoYdtGoyC/zT8eg5euXwFAVsJZnIMwifO+wMy/pPbF1laUNJVFwHKEKtkrrwdirFwMEUh6wy9njDCIasRYX166ugl5MS4rdrs2MjD0bRmSJ2HfgXk02wLdWySBq3zLVPLremV1QpJcPp/lzjC4MmZfheJsHKyIm6q70QfQ2s4oqGT8XzfKJ51aOjBWkYwej6DQHj9QL1WKjupi7oAw5I6A3rjjTzBwd85Dmk75exqNnsrL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u60Tud+7hFRqK1X+1aBMlcowgPhvYr0wyem0e3yFPFM=;
 b=Qdir1mirsyJJF/D3hARBEbxJjCJVmD2NXCkHVvRVXNcdSCh8dSshMSVvUf3EKl3rwla22qxJuhyAMSIPtHMJnB6/NkLj6VC8Vle70y3pRrfh8ynlT0GIZ+T8Fmp+cq2kX1/6/idgyAqKDsnPLftczN61OKwWH5G73+rYecInnXaRHyhLADFW5siXLbgYWFgulbqwulBMiff9crVjx2QwlZkmyUPIdxE7yvf0chdH+IoNTYL7Knv48+OYNBLPXlpXHRtkxoZUKVTyD4btFUHRrO9y4IptRj83dyP0W0cy14nP1vJNaL50ZSKcHaQHjVjYl2bjLPQ9Ok8MylrRYD6mQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u60Tud+7hFRqK1X+1aBMlcowgPhvYr0wyem0e3yFPFM=;
 b=Wdwjz4k1rMWlWvvRWd2SoZA3aKOvNzBdJnIuVYnd6Yad0qcQU+jfSZn8TGe4PA8tVnKsYwr52kcBLifTJs2kTqET/sSKEuiju8I8nFZ/aleO7EutmNMxdciPNXocop4ltdNwPi+fuIpPHJzsBNHczItOvWZo92U4aERZtcJ/aviKzvZsSQU8rVo6iTQiYANVEd8BQKtWH52Oq9uJknZQIkg4eItbyeW0Ejm+8ZPj6nZVRROhlu7rA2XCo8jjee/fxAz72sEUgtz9HjJFzfL6RlWklocaCHDGYMGIpNDKJ6XFhYTwp+T+27Zt0r9+KY1ovM3+SH1PHvdLArdtjDwl1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 22:40:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 22:40:44 +0000
Date:   Mon, 1 May 2023 19:40:42 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 00/20] iommu: Make default_domain's mandatory
Message-ID: <ZFA/6np8+uXhrK2n@nvidia.com>
References: <0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
 <7005781.1IzOArtZ34@diego>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7005781.1IzOArtZ34@diego>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee8e333-06da-4138-f8cf-08db4a951927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7uT70tzKyh1FBXjd5+IEr6Ee7DPH4NAIjOFRUh9xpTVNITKZPeOUg8+qpgtlokqja2beblryih+Pp1zK8tzxOvwUw+eKHVfrL6ja1Bi5dl4THaA7yZ1OSLsHnAEe8cPZvjtNQ3hSKNgJsNnx+jSuZhu+ePmhR+/G3kP5f+H/c01GpoAWQDBvTvlwx7v7TIVngUIuq69ZO6Z4Au2kQqNofxNGWZB4cZ3uXizsBuDsrGxEUKpbVLUx2H1oj314GEHQ/mXz1NzYuDEj36zPax/HRyYNwOGsCZ6M+szGYtKDwWdvHhNqJdwCQDEK5gOYh1qyCqPFGVD6LtaV7Q+HB6RqG0bhLTgLIWvbbIeLo9uv1OZQmj1FkwA7uwlTRYJXS3ZYj3Zfw8mePn3gOsSHFKVvTrP3HUXuysWODSLWVuml0fGXxEdDFda6hO7au04IFR2ahWsc2yBvX87YkC/qsu5NMH1WM3ngPfWlF+xnXL1d1EoS/WCP3EtJqebj7TZ1t4Swji8xZZNOmU++CQD6c1anrcCN+p9ZmxyIubawrWaMa+sLG9F4o8koc6wwRfyGMmp0XlCiEEyD97fd6p1NE6X6zpmJjngSDdPoIsCaalP9p0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(478600001)(2616005)(83380400001)(186003)(4326008)(66556008)(66476007)(6916009)(54906003)(66574015)(966005)(6486002)(26005)(6512007)(6506007)(316002)(8936002)(8676002)(5660300002)(66946007)(41300700001)(7406005)(7416002)(4744005)(2906002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clgvK3FabUtkejdzQ3d6Q2w2SHZJRllnd3k1djZsL21lK3NpRnhxMnY1djJ3?=
 =?utf-8?B?cEtVanVFUXV0WW8zR05YQjdkRzh3WXMvVVV1cFNubHNESmhJMDYvRi9lNnYy?=
 =?utf-8?B?cFl5VzA2OThQbm9nVm14V1pSRExwL3U0aExQbUR2OHYrbVNpN2lzbGNEVDNi?=
 =?utf-8?B?NUJTOVNPS3dIaGNvSXp4M0FmZDNkZVZKVG85eE9jYlJvNUIvZ2xnNE96blVK?=
 =?utf-8?B?QjI3NnVDWTdZc0h1cGpqNk03OXhzaGowOVo0dUZkYWx0T004bjZ4ZEZpVitT?=
 =?utf-8?B?S2ZNU0xjTUVWK29UZVYrTlNqY1hEM3YvazVSWllQOFo3c0lpWDBoaC9TeUI5?=
 =?utf-8?B?dWo1dXVMNUF0dCttOW43dHlteVFmTm8yMFNmZ3Z5QWY5QWtKWExJdnBaMExY?=
 =?utf-8?B?eTRnNHlTeTVGM3BmRWM3elpwK2c4VkNDWExZTUJqMHVTS3hlZW9PanJuYzJF?=
 =?utf-8?B?dk5WMXJrWFdIaXR6VG0vTEdYZjB0ZWZHejRmZ0dGV1RDSnQ5V0pHSFh2WU9x?=
 =?utf-8?B?b0ZFQ245djZjTFFZZFB3bVpIYWwxSFdmQlRocnhlRDk5MzhMVEQ4WWZwOEJK?=
 =?utf-8?B?OTZGb2pWaGZBWjE3OGdNZm02TUpEL2ErcytTQ2VYajNHWHhzdjlWZDMrRWFW?=
 =?utf-8?B?V2pUZmp3eG1RU1NrYjJrQThUTHUzc2w1RjRpTStVd3VwTFp6SUsvcW80djQ0?=
 =?utf-8?B?R0V2dnhjMTBxQTV4aVJiS2ZqRFZoS1dTME1DM1dRMWdBdGFqaXl0Tk1aSGND?=
 =?utf-8?B?WXQ1VWZzVGVtZG5zVCtVcmZ2MkREUnlHMEIzSGhWWlJuZFovdUdMeHlKbkhD?=
 =?utf-8?B?SGd3SmtxYVdEYlhHT3A4aklSR3JPVGhrU042dVVUdThETktzU053Z3U0Vkx6?=
 =?utf-8?B?elBwVWxzU0NYSlZlVHhMdExHbnBYYU45SzFXa3k2STYrZXo5OEE5L2FwU3l5?=
 =?utf-8?B?dDFVdzc5MStYMExDRTNzd1NGc3ZJYVg0azlhajE2RVNETnluOVlVanQrRzdK?=
 =?utf-8?B?WnovdGZTZmN2ZUQrTXB1cEZucFRvQ3dGSE04QkRFc1NWcTZ2ZFQwUXhRQVM3?=
 =?utf-8?B?VVFaaUFONE9GZlF6ekQ1L0lCMFlRVjBFTHlWU3pWMEdEdEVvSUlCQm9zWENV?=
 =?utf-8?B?cEhqTXNUTTRzWjI0cE5JV1FHRGN2U2taaEZXZnpFZnltS0gzNGN5M1RHU3E4?=
 =?utf-8?B?L29GQWdqeGZUQjU0b0FxSnZOY05xNGtueHRFZXB0Y2NEY0pacHRtZzFqVUJ5?=
 =?utf-8?B?Y3FFMTI5ajRLYWdwY08vbUV6NHRiN1c0UDBiQ2p5ZWduZERjVnZ1blMvNmhP?=
 =?utf-8?B?MThzcUh6czRXb2UyTThrQUlSajRadGtoZUlpMlorcmNtMmlqcEFzakJCU2Na?=
 =?utf-8?B?NE8rTlFmaVEwUzlGQUNGakhGdkNzbjh6ZzI0b2daRVVmTGRNaTJMcVpONUFW?=
 =?utf-8?B?NHJ3bW91WlNQeDVCcURDU2ZKR2wxY09XTHEvQVFCekNQMGVia2Y1UXlGUmRL?=
 =?utf-8?B?bXlURGtZazd3NmxQaVZhWXVuMTdvYUxPdmdOUkREcUxRYWQ2dCtYci9MZC9P?=
 =?utf-8?B?aE8wYWJjUkN3dTc0ZmtCeHo2dnVlWHBSL3VyRVJzUmxEbEJ3TFNOWTMybE9Q?=
 =?utf-8?B?ODlseUlCMWhTcVhxV0xPVGd6andzbklUc05KYnNzSjVucFZwdjdkNTVDWUll?=
 =?utf-8?B?UDhqblZHVFhkZHhsdWJmWmdOdk54T0QvSEJCYXVhYnA5UDRRMnJtckduT2Rp?=
 =?utf-8?B?M3gxMEZZUXMwK1g3MVhnbjVWRUxGczhIeVM5MkZSWVZzbGFIMWo1YWN3Rzlh?=
 =?utf-8?B?MXRWSkZudWFYQkJWcEdENnpUSVlkTC81MkJDZWtidUpxekdmS1pSeU9HOUFz?=
 =?utf-8?B?VHZidi93N1RaeHlNTkxmd0FHWUc2eVRjY0JUbmVrMjZuN0xlc2dKZE52UlZy?=
 =?utf-8?B?VVlLcWlyUkVQdUtXNy9wS3crdXVoRG5HRWhVRHlIbGJ3eVdvSTJkZm5qdkFC?=
 =?utf-8?B?aUZDTEFhRGpVQnRTa3dKdFNZWllJWFVFdTU5ZTRKVmhSTk9sb0ZiZEk0YmFi?=
 =?utf-8?B?TTFYRC8wanpuMVZUN0hkcEhYZjk2SFloK3NEcTJLaDdKNHAzMURtbkFWR2hn?=
 =?utf-8?Q?Y/ng=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee8e333-06da-4138-f8cf-08db4a951927
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 22:40:43.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+uq1QpTeVWOZIPzj35rB7tsKD0g53Y88ErMLo54HYK9NoQSJeuueJ6648Wc/BLB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 01, 2023 at 11:34:45PM +0200, Heiko Stübner wrote:
> Hi,
> 
> Am Montag, 1. Mai 2023, 20:02:44 CEST schrieb Jason Gunthorpe:
> > This follows the prior series:
> > 
> > https://lore.kernel.org/r/0-v4-79d0c229580a+650-iommu_err_unwind_jgg@nvidia.com
> 
> which probably will need an update for Greg's recent
> b18d0a0f92a8 ("iommu: make the pointer to struct bus_type constant")
> 
> I've fixed that locally for me for testing

Yes, I will rebase it to rc1 next week

Thanks,
Jason
