Return-Path: <linux-arm-msm+bounces-56424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7CAA6793
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 01:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D679188BC0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 23:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAD92609EC;
	Thu,  1 May 2025 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1Iz0nfdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC933987;
	Thu,  1 May 2025 23:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746143828; cv=fail; b=qa8SAznpfLTjDhm+5uxOs+iosMhjgWiV0ViY2KVsHXDI8ffIeK+fUeiCQBFR/H2AVO/ci/VSOE7lbOuH26ZUMnpCNKm7zTdPGNOg9GxnNQohZGc/Q7npt9/F37W99bE0qah32wBQUZyID3R2RPeGzj7UxGis8vGdykA3A61UWis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746143828; c=relaxed/simple;
	bh=HaazbME43M6tB1iG5pJlYz43hmdwh61OhkFeOTgBnOo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NXmBNZLf96FR9ZWZ2nOXgxNPXhxAX6m26g+TrATqgncYFHj/pb2XlA6Q9h5YKw7jgwmkRH8nW8f0im8XVsKbvZaQGRGLVwSl6ZoxCAe3Zvs2KerZfdkldeEu+MBvvnNCg6vGeAOSBAzChsABKP2p+URDtEmYhdX5QWbU8fokf00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1Iz0nfdP; arc=fail smtp.client-ip=40.107.95.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puq/t9eQsXD5NUE5uc3PxkZK+eoztO/wGwTUl34FCBRXXlEhxVqxRBvgQn/rFxgh2JXKeFn9q4rIwukbPTOCsegdIFSRiG1VcJ25WKjSYlje77gX3nrldXWYy69XllrbsTUyGZkjjniW6VV05qKVGaymTytOlo6uNXBIJjkb+DlIflSgknreln8mm7EiAQckkI1yS8w0Mstbt+eUx+9udLHlPATQ6YxbHhZYSxhSxV0EtDxeURQvtP2DCVGzU5xn8fjVFl6DqM7mCBiWxzq6aKeVkkDB8uRXdGBXo2v/hCe7vGTZPTmTa/sy/stjQZJ2a/Nak5c90EcZyDaGhy8oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vWecc5xVBpX6ngVzLO6G4scdsjbC6dmV9eULon0zJg=;
 b=AwfI9+CAisyeyammHrekCGHE0vWQTGf+YOXeUGrzFUokLxAvQWkCnt4Rk81Pt6YTVPoJVE70UeTFZKRDGrLjhfxMXS8FUzSWl8uNTnDVlvg7kgq+yfviNbimFx0HUsgHmcWbgcr1G/HZiAT18pVJVfbbyikmPrtPy8MU+dNmN05MQkiU2CxNot2cYZ5LHFkB3RsnmkAlXIOVoxMetxNKYtouDrTVb2G3okJ7FHkuBOYZJ7lWtCUi3TUMoFaB2nXEcsseSyxhvcw/x9rjfbqiq/v/+VitdqLcJWPqvKnL0dBZfOszZ1GBdwvZPaH9jBjfCOZ+WiGDt5HIWVnDmO9mqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vWecc5xVBpX6ngVzLO6G4scdsjbC6dmV9eULon0zJg=;
 b=1Iz0nfdPhLJNqKZhyfUyPVQ8sYzRGkkOI1jo1U55HDSKSZSegKTt0//QUIZN30NU8DNyuvGfzdL1U6yL0qe3RUR/c08Tkdo+FMr05bE8pLcTea3++xVgKnXPV6E3omnZVAq21ibtEYNLxDI7EiXGwKcr2FMPe21V+H6lvO8F2n4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by CH1PPFF5B95D789.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 1 May
 2025 23:56:58 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%3]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 23:56:58 +0000
Message-ID: <ab09cbdb-8e30-4720-8ca5-66488922db33@amd.com>
Date: Thu, 1 May 2025 18:56:54 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
From: Tanmay Shah <tanmay.shah@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, "Andrew F. Davis" <afd@ti.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
 <8c8e9362-c116-4a80-bcb7-a44df68e0bfc@amd.com>
Content-Language: en-US
In-Reply-To: <8c8e9362-c116-4a80-bcb7-a44df68e0bfc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::27) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|CH1PPFF5B95D789:EE_
X-MS-Office365-Filtering-Correlation-Id: f17d7588-4623-42a6-6ac5-08dd890bdb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1MzR2VRWUVwNExtdyt6ZjVtUWhYRFhxNzQvY2pPUjlhYm9JS2l0S3RZMmRm?=
 =?utf-8?B?bUhTdGs5Mm5WVUpkRElEWmxHY3ZqUzMyMzlreDBmQ3ptRlNnUU1ncE5udnps?=
 =?utf-8?B?Nk9pekQzNnJzTXhyRldSVGtqM0tEZ3laVXQvdXJuMit5c3RENFIvV3lDRUJE?=
 =?utf-8?B?OVRhMWRaTUcwNWNjL0NLd3IzRVFBL2x2a2lNc1BoWHdpNlZQQTBRejZJR3JR?=
 =?utf-8?B?M2w1ckxCRGw1eU5LclNMWWFsWGlZKzEzaWZZMjNWeTM2NUVhcWt1WHhUTnBU?=
 =?utf-8?B?Nzg5ZERIcnB3Yno3clEwRmYzd0M4enRaanJtVFZpRkNQZ2ZTcitkdkFtNnJn?=
 =?utf-8?B?Sjc4R2xMNUREcXZOUzBrSllUK1VOaSt2Z0pkMVFhcFFSeEh3bDB5N0FySFNJ?=
 =?utf-8?B?RHpFUFZpaVA3aVlJbitWK0ZSdVpvUjVacTIvcEFvMHFOZXR6em1valZUKzVr?=
 =?utf-8?B?SjhJWnpDeXR5bTdiV1IzTnlmTUdDOEdSeEE4ejcwc3FrekZTd05HNktLb2tt?=
 =?utf-8?B?MVRSNmdPeitUY2lnVUxkc3FYbmFiL056dlBieG00RHJTc1IraGZGVE13UldB?=
 =?utf-8?B?dkJIMlBGZVVIYkV5MHhNWVBrZElkcjFPbXNvOS9zY3pWY3pEKzBraG1YSnVu?=
 =?utf-8?B?S3hlTzBJUS90dDdqdXlhM0d4VjlTZTRUYzUwU0ppbnJNRkREUUZYMGJWNFZu?=
 =?utf-8?B?bWVHY21rZHd6a1FDNUpzQ1BqQy9CVjBxMFltc1MyTTJmL0RzVGFjN3M4T3pM?=
 =?utf-8?B?VUhRTXU0dWVUQndGY01FUGxCVVZUaTFGOUM2ZU9UdWlOR2p2QzQyZGtmVU1w?=
 =?utf-8?B?NkRPcHBFNDdYYXNSRTVSV2Y5N3pSRnowNThPcFE4UGlQWWp4dElXV2szK1dP?=
 =?utf-8?B?ZytEY3l5cFhiVmFYQm1hZDZveTNqdG83ZktNUXNmMGFjRWVNOGZ1dTJBTkxs?=
 =?utf-8?B?YmQyRHpUNUpUbzduT1lQL25Ga2RicVpQYjYwRVpRT0RhczdXVk1Nc2l0ZTBj?=
 =?utf-8?B?WnZQTmdEYW5yU3kxY1diOXJMRWo2bnJhTE9IMFZmbFRzc0Z2aGRlcU1kY1Vv?=
 =?utf-8?B?Y0YwY1htVVNONEwyRmNMYTZoUWs5ZEVjdWlUTTBqL1BSWEFEMWwwWDNqSmRh?=
 =?utf-8?B?ZEUzSjNrK1EwSGIyU3RYQ3lWbVJVUzllM1B0ci9ueWdDR3lmaVlEVzNpY2JL?=
 =?utf-8?B?TkZCdUtNbCt3RnZoWWs2UjczV01pUHR1LzFERVFhV2trRW9NTEkzSUhaUlMr?=
 =?utf-8?B?TFpDait2YTAwQ0xMdzVuMjBmMm5MT1E4dTVtWE9qOFI5SzN3eTZwQ3N4YzEv?=
 =?utf-8?B?VXd0Q1FGRGFUaXpEN3BwT3RWbFdZUW5HZDRyRUpNeTdvT2VWNkJId1U2ZTQ1?=
 =?utf-8?B?K1FrZDJLT0h1dUVGbGtTNWNsR3hhcFYxMTRaY3pBK1FqVmp5dHlmNWQ1d0FY?=
 =?utf-8?B?ZmFHQXppdGRuVWxpT1NKMVhhSzF3WG1ZbHROM3BIdXBNUHBuYXVFU2dvMDFF?=
 =?utf-8?B?eEFoTkRnWkpUU0Y1Y1BaV1RNOXFIdzNHaDJpNjJFWXpLdzVRYUFRS2V2RzNH?=
 =?utf-8?B?eFdWQTlXWWY3empvTHlOdGVHUlU1TkQzMUEzSVMvUXMyaHJZbXFUT3pmVVFQ?=
 =?utf-8?B?Q2libm5UamszdzNYSUJLbDZiSEUydExvNGxxQmt1MkhmWGV5enJxakhIMWJH?=
 =?utf-8?B?bWQ1c1RQVEpuT1RlZjZXTzRjOXQxbjdCSzBCME5Tb2lXQU82YzMwai8zZmtu?=
 =?utf-8?B?N3VUdjlHZVNtV2xSSWo5SVZiQ05UMjQ2bFBEMnFCR1NFc0xrazlaR2dwZkR1?=
 =?utf-8?B?Y2o1b04yYXRvLzJzZUxETHA2SDRsWkJpK3hjSVlkNmJyV3h2eFh3ZTQ5QitG?=
 =?utf-8?B?NHNVQ1JQa1h2cW5Xd08zRTF1dG55SHBHOHQ3TWZVc3BOeTdOUGF6R01RdHRX?=
 =?utf-8?Q?TtRCP60T5KQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFiYk84cXJTTTVjbXJ0NVRXeDM2aFV0ZjJiVnNtNjZZb2h5TDRuZVRzeTVr?=
 =?utf-8?B?LzNySXUwK2JTam5VNHJLOG9GZmI2VHRkbnROUDZEQ0NpL1JOcE5yMUxueWZs?=
 =?utf-8?B?QUx3WFNMclY0S3RiaGJPWnlOajVrR1JzUDgvdVdJMC8xZGNJd3E5OUZEcjEx?=
 =?utf-8?B?NEdSd1NkRTNXdVpOdWFpSjlyVzlYOEtET04xWnFQcXkwT0U3RlB5TVgyREhJ?=
 =?utf-8?B?TytjL1F4aTNIdCtad1dmemRuWjJtL1gxTFpnbklWZHZIRUp2RFNhTy9aQTNX?=
 =?utf-8?B?cVVleFhNUmtOZmhVVzIwVTNzcCt4ckM1UmlWN2I1OWJEUW51TVZYK2RMamMr?=
 =?utf-8?B?REZDL09tcSt5ZVZMUjBCY1dGNEc1Vm1rTXdCbnJlcEQ3MWd1QUd1ZmdvQ1Zk?=
 =?utf-8?B?L1BKNFExMDkxUkYzOGc1WWk2SFcwbjVQMU5WeU8wZFVkcGFQZDc1aE81bFVw?=
 =?utf-8?B?MkxvTHV0aDh0bk5nL0s5aXZ6ZkNISkNvVDlQT1ViRWJ1cTBpVFJDUlhjQ0dU?=
 =?utf-8?B?ZDFvV2F6ZFdRUE0wVlhIZ0x5em8yV05IaXhYa0xQYndBcWx0cllLYlF5bkcv?=
 =?utf-8?B?MHRQK3J5STRHNytUeEhsUnNaOGFQd29scmhzbkRwS3VWMXFvZk93ODNhSE1a?=
 =?utf-8?B?eXZQbnpqQVpXUmo4UnhyeS8ySVlzbGp6bTNoQ1dqTzJCUkRrdnRzbTZ6NXRF?=
 =?utf-8?B?TmFqZGxhd2dRdUFVRHlMbVJBTFkzbm5wenhyMkNDT0oyME5PcnpadTVuejQ1?=
 =?utf-8?B?ZGw4S2ZxaTIxRWF2dkYrNGZhVGhyMWZDTnpuVllYdW9vcTNrN0drQnpsd29k?=
 =?utf-8?B?SVdMUjA0YXl3Qi9PaktIY0NIcnd2dG5hWUQvbVlycFhDb0VEdGNYUjNETGc2?=
 =?utf-8?B?aFdBUUFVRkFFUkRxY1JXZFRFbG9Gc2dhM2g0Q3BOdnNreUMwemZTcmVTOGNp?=
 =?utf-8?B?ZWNRMEtSRTJKZzZzSUZrTjN6NEtZczFKMUtMdVZQdHZEdXBNdzlYbENjYy9p?=
 =?utf-8?B?aUFJYUhJbGF2Nmo3Snk1dTVoUDRYM215YThJb3BWaXFVRlB5eGIrMHVXTzZF?=
 =?utf-8?B?cHppeUxuQ1Y5Q1V2NE9yTUJyM1owbnc4Skx1cE1OWHVuK0FqWEZwZWwrVkV4?=
 =?utf-8?B?SUVGcFlDZFVaa0FqZUVaNURzcU8rV0xxQVQrakFwNXptcCtTZVFObGFHSENQ?=
 =?utf-8?B?bmw0Y2UzZzRXdUpzV0x6Yk1vc1NxaDY1RnkxaEZ0TzQ2d3hmNHYwVEx6MU5K?=
 =?utf-8?B?eGtWY0IxNUN2cGV1a0Y0TENjTjZsNnJHd3JVVWpaNXdCWGFwampxUVFIUXhm?=
 =?utf-8?B?MnBkTE0vYnpLbWp4ZTd0Mk9BMFZvbS9OVmtJemJVK2wvT2I1cUxVWUNaNmtk?=
 =?utf-8?B?RnF1Rm1JTTY5d243Yi84N3NFYk1HMUd3ZXBsYWxINGlCOVZtRUwrMEpudTFX?=
 =?utf-8?B?azQ1R2R4TmRCc0hPWDRQUXR5MEdyNHFjTVNmNUc0Y1NWYVVhMGErLy9UY1dD?=
 =?utf-8?B?dkNnWjd0anQzRFVVY283bHlhTXM3eEJxVGUrWjFyd3FvdDRKSGhSWDZYUTgx?=
 =?utf-8?B?YkRDeS9LbGUvWlc3eG9iNjZ0bkF3ZCtoemVDazRIbWVJMSs3RTcveWJXZm5E?=
 =?utf-8?B?blhKaVl3b1M5cm1iR1dqN3AwMEFocVpDSGc4MldYYkhINFRQVEF4T3NqQXlM?=
 =?utf-8?B?cTd6WXRjQUZqK0ZBTUc3NHpkQ2tlRWtzN1RWN2FJZkFTS2d3N0V2TGl2TWly?=
 =?utf-8?B?NzZIV0tRQU5XYitSSkpFbFRBcGpQTGY3dWoyUThNRlBseGRPa1A3dXJEdG5p?=
 =?utf-8?B?dVkyZ1JtVWtweFVZYnY5dVlJejdlNjRUOTBNTGJvdlJXck9tMVhDNElwQjBk?=
 =?utf-8?B?b1hCWGxMZXE2bXJqdUhvR2lEeUlWUE55ME11VEtrczlxVVlLd3pwL0RxRmVq?=
 =?utf-8?B?WU5CUjFuU2hWZDQ0QUVuT0Z6QmVwSW1wM1B5VTF6MFhXZFRwMHBwN0FYVHl5?=
 =?utf-8?B?UmQ1dnRuSC8wd09yQVU3M1JOYjNkclBMa3E3TTMwZ0JEM3RnYmVCeE5odmlQ?=
 =?utf-8?B?aVdmOUxSa1A2MTJrUlZleDFKV1ZjVHU3N0NTTnBCdGJUR2ZzcVJzZHJsRlNr?=
 =?utf-8?Q?uURVfDPbSGE3eIA8OYokk5eNc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17d7588-4623-42a6-6ac5-08dd890bdb70
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:56:57.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwNpcm27+iXMVbZ1LXLosPFvnJP//CiBZWpmvskof6c6ZFS4sBs4tYxAEk/kclCf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF5B95D789



On 5/1/25 10:44 AM, Tanmay Shah wrote:
> Hi Mathieu,
> 
> I tested this patchset on top of recent for-next branch. I don't see 
> issue on AMD-xlnx ZynqMP platform. With this:
> 
> Tested-by: Tanmay Shah <tanmay.shah@amd.com>
> 

Hi Mathieu,

Looks like I said it too soon. Firmware loading works with this series, 
but RPMsg doesn't work. I am debugging further and will provide inputs 
once I find bug on xlnx_r5_remoteproc driver.

Please ignore above TB for now.

Thanks,
Tanmay

> On 4/24/25 9:14 AM, Mathieu Poirier wrote:
>> Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
>> on the platforms you are working on.
>>
>> Thanks,
>> Mathieu
>>
>> On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>>>
>>> While there's a common function to parse "memory-region" properties for
>>> DMA pool regions, there's not anything for driver private regions. As a
>>> result, drivers have resorted to parsing "memory-region" properties
>>> themselves repeating the same pattern over and over. To fix this, this
>>> series adds 2 functions to handle those cases:
>>> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>>>
>>> I've converted the whole tree, but just including remoteproc here as
>>> it has the most cases. I intend to apply the first 3 patches for 6.16
>>> so the driver conversions can be applied for 6.17.
>>>
>>> A git tree with all the drivers converted is here[1].
>>>
>>> v2:
>>> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
>>> - Export devm_ioremap_resource_wc()
>>> - Rework handling of resource name to drop unit-address from name as it
>>>    was before.
>>> - Link to v1:
>>>    https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>>>
>>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/ 
>>> memory-region
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>> Rob Herring (Arm) (4):
>>>        of: reserved_mem: Add functions to parse "memory-region"
>>>        of: Simplify of_dma_set_restricted_buffer() to use 
>>> of_for_each_phandle()
>>>        devres: Export devm_ioremap_resource_wc()
>>>        remoteproc: Use of_reserved_mem_region_* functions for 
>>> "memory-region"
>>>
>>>   drivers/of/device.c                       | 31 +++++-------
>>>   drivers/of/of_reserved_mem.c              | 80 ++++++++++++++++++++ 
>>> +++++++++++
>>>   drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>>>   drivers/remoteproc/imx_rproc.c            | 68 ++++++++++ 
>>> +---------------
>>>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>>>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>>>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 +++++++++ 
>>> +----------------
>>>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>>>   drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>>>   drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>>>   drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>>>   drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>>>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>>>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>>>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>>>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>>>   include/linux/of_reserved_mem.h           | 26 ++++++++++
>>>   lib/devres.c                              |  1 +
>>>   18 files changed, 339 insertions(+), 369 deletions(-)
>>> ---
>>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>>> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>>>
>>> Best regards,
>>> -- 
>>> Rob Herring (Arm) <robh@kernel.org>
>>>
> 


