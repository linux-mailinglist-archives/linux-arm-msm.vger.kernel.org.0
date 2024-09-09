Return-Path: <linux-arm-msm+bounces-31272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE29715CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 025191C22D6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCF31B5803;
	Mon,  9 Sep 2024 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E5ndeRrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CD1B5300;
	Mon,  9 Sep 2024 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879440; cv=fail; b=RIZiVWwlEXt4Xr/iG7XtCNWMClyuA5RJjsPsZQ94lJt6oqfwfVGmP0+sUYPxZ5A4BwCHfYX0WpCcW2peLjEZ8xWhnXcAuXKyjHWM1hD8pXm+AmdwAOgb/p5TE66tnZkus6Yb/ZibqQukR2T1bk2GWcVQdZL4tde68rEdOrsPmlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879440; c=relaxed/simple;
	bh=dAEeBQDQ/FhB+4w8mJb3n1hhXw55OLfcudOxWtmblLY=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pYGEPrORbRzrf72hazhqsIX0PZ/13Q1h4XTzuJL0wcEKvqzdnqzraQfnuUrwn5/py1H1oqdP5WMjJ6bBQiDeMQPwXLk4dYP0BG9sTIUr+4iFaQ/OsGICxEg6/THNKsxskgJsFZCy+5EzH5L6bk+/g9LxNH8YQA+aqp4HHXeReBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E5ndeRrh; arc=fail smtp.client-ip=40.107.95.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXHlWySMD2eWuUTh9N3bM3VR1RWuU35XDWnYN+4jGYCrFx+0MUh2EV4w24NSHqhV5zsJfDTPfNrQ08QvvyTOwibhN7iSZ+X+CimVpMHJu2UyFkENT4TIr6NuCRDtoBh05IQg3VBMUi7RnvPSCA24DWnxfhIw33zR2U3L9qOoheLGpl4yMQXkFRGp0jy+Iyb9IcT9WCpsw751oR1CIrL3FrDivj0plDR245XdJsEajpEyeYa9PljvkQ+2wBUCXZPNC1lj3z0TAcxDZLUSTC+M7MrU5m4x1AWtCCK5XDY7srNwUKRe2gDheuzWnyB0x/780yeF36pUXCvuT9AidLCg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJqFPpOTRA4HQ72KB+P4eqHL7RD9gg2ErjXYaKAHSg8=;
 b=ldZ9SgrO0R6kOTsG6Z05RjYdK4WB0t4+OCDzt14d2Gz2E5nzSn9XYe7pta61AEabmhc2NvSlxOFwv4qHdoFAKnuFODtGy1B2l/wqIFda9nKS052XLOK5JzAkdLUDFYPqZQQh9J0zJ6FZ1s9AsytOkT2oykwncr69T2vtDdB0vFnkiyppmt6BjudAOUFbUxqBKsm71g0q6LPe+83lC94+ktFGmUbu+1ulmA3Ppx1eBGqtESu4VI3OfWCdpyuHAskq7snbUsX+O4WGfqaArx+8mxMlu/ltWsqRNaxD18xI1LMXj+5VG3Tl2qTACoCSmYR0aE/w0MENkgygwEtQ/Y8PVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJqFPpOTRA4HQ72KB+P4eqHL7RD9gg2ErjXYaKAHSg8=;
 b=E5ndeRrhh7ZVtU/cZ129BbhQp6Gnhzi3nq+RIP5AmmTEXzPJINZzRCu5fPLSOHXtQbf395u/mOmRfPbztpBd1fTfecPZTcKZGi7zFfmmyvvhoGjOKhB8HOxrYEnwor3ZQpi32lI+PA7GRrJnDck4HNZwY6YP5cexpdSB8vbGLyQpgx46BiEE1yqktRavlLcZSLcRLcwWBybgNCSDuQYyW8l7O0ZYJOjVIXuvzATz9XD3KQrp5Sw010dTMv+RgP+c5ZZjmwTbN9YHCKFUke2AwkX7Qc9czggB2fG0AgaYUlMPYn/1eLyZcb8Cl34kuquCYySLN0oG0GrRHvL1EZBoBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 9 Sep
 2024 10:57:15 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 10:57:15 +0000
Message-ID: <9914729c-8e69-4ad5-a530-161f5430b71d@nvidia.com>
Date: Mon, 9 Sep 2024 11:57:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] clk: qcom: clk-alpha-pll: Simplify the
 zonda_pll_adjust_l_val()
From: Jon Hunter <jonathanh@nvidia.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 kernel test robot <lkp@intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240906113905.641336-1-quic_skakitap@quicinc.com>
 <fdeadc0c-7f8d-4547-8703-c402bf06e495@nvidia.com>
Content-Language: en-US
In-Reply-To: <fdeadc0c-7f8d-4547-8703-c402bf06e495@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0466.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::22) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cc647c-e3f7-4252-efe9-08dcd0be2a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b044Vk8yV3NNcFFvZlU1anpmQ1lQaCs1cWVnK0dMYS9ZTnE3bEhybi9zRFpK?=
 =?utf-8?B?aHVMK1ljTkVXQW9TeklEZy9KVnNMaTl5ZW1sR2NlbFY2WDNmbFJiemU4UnlI?=
 =?utf-8?B?cU0xcVRJYmRZUVkrUVAyTzdOeFdqY1pGSVVIa3NSRXgzSVBic0l5NDRyWGdl?=
 =?utf-8?B?OXNYQWhWQ1FVVlh0TjBsQ1ZKSzFadWZDTmxRL1hxN1p2VUtvM1BuK2RYamhw?=
 =?utf-8?B?VWlacXZhaEFoNkdxV3ZoMjBiYXI2Y3JocHZaeG9COGljbVFlamhtd294SFJQ?=
 =?utf-8?B?UEY4ZzIwczFqbm9SOFBaSXE4QkJDOVJhem5EQUVLQitmdHphanR4dzRmZEl5?=
 =?utf-8?B?dk4ydGJ3cG5TNGltTVUwaUhyUnZ6MG9NR2UyaXNRRzNhZERzS1R0ZXp0UTJq?=
 =?utf-8?B?cVpSckFKem9qRnlTR2tPZVlKVEkzTFZwbnVTUEFkRkw3TUhhdk5zNlBjSFM0?=
 =?utf-8?B?OHhKa002UXdXbzQ1a0tKUE1NalBSMWZVNTVRMmcydFNCUVJDK0p6QXVrUmdJ?=
 =?utf-8?B?MkY0Sjd0a2ZNS2xUU1RkVU5MQWJsUVg5MkpWQ0VpZ0ovTUUzT2djZlZNUmlw?=
 =?utf-8?B?Z3cvcWVjV3lqRUs5TytlN1BmWDdnZnkrMmNVa2pXYWdCbmZtRnRMcmFwZWNy?=
 =?utf-8?B?Q09JajdMZ2FsOXdPZ09yRm1IWjFrRDMwN2xUS25CL1BMNDd3YVZ3TnpCZ053?=
 =?utf-8?B?ZEl6aFpvVW4yZnRaZ044QkdTUDdCRUxzYjZBd01LUEllc3I2b09hMlRBeVVu?=
 =?utf-8?B?TzVac0RtSkNEQ0l3MHhQZndNQWVvM1l5aUFxamh1N3pXcGdDTjhnUGkzR2dn?=
 =?utf-8?B?c3FzQ0NCa3BrT2RrWWVrTVdjTXdIKzJZakozZ1EwVFl2ZmE5MTlOMFQzRHVn?=
 =?utf-8?B?OGlwc3VrREkwUklNNTNkMWM1OXdtQXY0K3dKSWo2TmxadEp3NlN3aVcvWHVa?=
 =?utf-8?B?dXNvbWxRQnErMnFYNXUweitCeW15ZzlZQzRIbm5MdHF5VlRZck9iaFRnc3pK?=
 =?utf-8?B?cHBUT3lsbkF2UFRCYVZCamQ2ZFB5andkMG8rUzJDdVBpS2NyT05LbWRrMVcr?=
 =?utf-8?B?VVJSQkYwQlNvTitBR0ZFNGFucXE0Y3I2eFFDNG9QUG1zYU9uZGoxTCs0TjBx?=
 =?utf-8?B?cFZLZ29XTG1xeG5mK3VEUHdhYTZiV3hsVVJmOU1Ga1pIOC9PZHJmbVQyL3Ax?=
 =?utf-8?B?Uk05MllBWmg1bGN6aHdncXBZb1ZVZTdJcjFHaGtNZTh0UTVQN0RFL0pwbE9h?=
 =?utf-8?B?N0dKK2VTTG9CUlc5R056WG9VTFcvUmcvdkdERFU2b2MxN3UxRmd0cVBPZnFK?=
 =?utf-8?B?RnBlMGpDb0VIc2JsSUVmcUlCNlRTQ09EOW1hVE95aEVBUUw4a2wzcisyR2h6?=
 =?utf-8?B?NHJYSjlNSTBWSmdYMms3ak1nQ2cvOUpUMkh3TGJFMStMM1VRRFdlUW9XZlY5?=
 =?utf-8?B?VzVFSVh1NVN2V0NXdFc3RWNWNFJDUm5NNy9kdGNhY0lNZTkwSDVhNXFPNFFu?=
 =?utf-8?B?UnYrNW9ubEFreE10MUkyK2kyUEJ3cTB4ZWVuNnJ2T2t3Z0gzd3pFZEJBaVQ4?=
 =?utf-8?B?Tk1nNFNyS0pWTzNwbm5rK0FKMnpSb0ozL2V6bHMvam9NRHZHb0l6MXhlRnpr?=
 =?utf-8?B?M3B3Uk1oVjVYSDJleHR5MDBVcGxxeEFVZW5jS05MTWFXTGhSbXBnSHJSTklv?=
 =?utf-8?B?VDV0UUk1NlFTbWtRS3ZBTUhncFdIaTBvYW9WMVhvam9nSTE0UVVCVTlMMi9u?=
 =?utf-8?B?UzE0OERyeWtkN3k4ZVZyV21PTmt5QUZYb05WZ0EwUFRHVmdTWjJEZXR1N2lS?=
 =?utf-8?Q?zlMq7Q7crZeU5U4Ucwqql61L0ptXyXe5nED4w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnIrT0F4SWhTWkFkWDh5Zzc2THJ0TU14ZXRyZkFnU0drZzBLQWJ4SEZRVWNa?=
 =?utf-8?B?S01VNlVGQ1VvbzVWN0JYK05hUkJZSHM2UC9RTEJjV0YzMHZWb0JDeExDejhn?=
 =?utf-8?B?ZnpnUEF6SVZPbXBLSlljUzVFbHRrczJvVTBJaVVrOW9rSWlSSitocThwcncx?=
 =?utf-8?B?M1NZeGNUWEtpVk10RFplN0dUN1FQci81L09FeGtvcW9ncXVkTm5YVC9aVDhP?=
 =?utf-8?B?bFFpcWVKK1dlcmN5aDN5cytCR0d5RytxUGUwRkpDRUZveXRlb1l1MDZLenFR?=
 =?utf-8?B?UzhBb0ljcDkxWkJxNzcyVjhHeUhTSHlac3VrOFNpeFV0NzhJUUl0bUZkZWhC?=
 =?utf-8?B?MW44QkU3YURveitIeE94YWtUNlBoa2txQXNvRXJNekhESm1lM0hvWnN2MVFW?=
 =?utf-8?B?ZmtxWjJFUWxVTlVETTRIdE0vczl1YUEwTHVWSFhJeHV1OXZFSE9Rb055aVhm?=
 =?utf-8?B?bHRic2ZUT3BjMXd6dGovRFp3elZuWEN1cDgvMEdVTThhOS9wMVNVK1E1enNr?=
 =?utf-8?B?d2tRdHlCVUhsMGRhWVpiTjVmS3FsRkVxVG00UUtVaUpEZHhQb1dFZXBLMVBq?=
 =?utf-8?B?VVNoSU40TUcwVVpZY2h5SkNCcjIyUVhWOHJJMHJlRXZJdk1pVGJRN1NEU1Bw?=
 =?utf-8?B?Nlo4QjRzQUtWR0dINEhNQ2wzdkwwZVhUZ1AxdVBXTGpFZTE4RlczUVhJY3VF?=
 =?utf-8?B?VVZLYU5UUTJ4MVZ4Tk9ZWXlMMFdobVlwNVdwL1hGNEhrVEg2UmNYT3RLcVdV?=
 =?utf-8?B?d1lFaGN0UngvYWZheHhxeUNqdlkzUS9Ud1YyeGp2M1RuMXVaT3dRM2dBQVMx?=
 =?utf-8?B?UGtkOExjdkJBdjkrUElyd0ZHbkMrZE1ZMEpmZDJzcnhoRTV2VFBaRTlSSFVZ?=
 =?utf-8?B?eXQyMUI0RzVzV0ZISkpwRWJvZ0tYeEk4OExMOEdqL2MxT3dxUVVkejBIby80?=
 =?utf-8?B?Uzh2M3FxVzZDTEIyb2JMV3RJdzFFR283NmFyOFlNTUtZc3o3SXRUUzhlQyt2?=
 =?utf-8?B?bjBSV0RVV0JmUzhvbDh6N3AxM0FQSHhzU0JnWkFrUFU3QndIWkhhSE85K2I4?=
 =?utf-8?B?RDRSUjFhVUcveWpWcXpOeUlNWXhCcjRzNXRpbENueno3cTNyZlErQXlXMEVa?=
 =?utf-8?B?M1hjeVJ2UVBzM3oyeFFycVVyTnNZV1B6eVlkRy9KL3lpRGRuRjBMZ0VvNFJF?=
 =?utf-8?B?elhGeEJwVWE1SDhFNHF5YVJIZDh0L1JaZURGUXhJejlOZW0weE1FVFZlaE93?=
 =?utf-8?B?RDZvU0hpS0c0VXR4V2llVkU1MUVBeCt5cTM2VFFRczFyMDE2VHRaSEQ2Q25M?=
 =?utf-8?B?bWE5MEo1UXBORzJYLzQ5c0tLT0cwdDZEYUpQYVFtTzhFWVN0QnJDTXpoelAz?=
 =?utf-8?B?UWhHZ2puemJmQjFIN0FWUnVIS2orczN0cG81RTFnTlNwM3dTRlBwUnN4d2lF?=
 =?utf-8?B?andiNGNYdmtQSUVzUHpWYTJWbDUzV0UzWVdSMCt0alFMVUFlYXpoS0xEWG5H?=
 =?utf-8?B?dlhjRy9Nb2xwSTZjQ1BWbjh4VGN0TUJLOTBTeGxjckZva2dyeENPdVlpeDk5?=
 =?utf-8?B?clZKT2NMUng4dGRCVnFVRVJrUERXZDZ0T2tqUUF4b0x1LzFaVFk5Q0ZiY3h2?=
 =?utf-8?B?VldOTmErclJjR0d5LzhoeDJRVy9YUEtJMjNFbVhNUnc4N1pLdWwyMG9FNWIw?=
 =?utf-8?B?ZFZmTE5STk5wTHFVY1BVZnBSZEpSMjBrS29uL29KblQwNHV6cnlCZHc2c0FL?=
 =?utf-8?B?andSeGxHU3NlT3ZYQ00zUVVlSHk3N0tCemlMMkF5UGJMWThhNUdXZ2FyTUE4?=
 =?utf-8?B?OVFIdUdkZnFwOU05am04MUI4eUIzSlpycDlyUzdVQlJ2YnQ5clRqRm1XSlBL?=
 =?utf-8?B?LzAwM2hLc1M1MVlZT0t5aGtiQktid1QyUko1MVN2Szk1NmFGUU1sTWlZTGF6?=
 =?utf-8?B?V3hMUE9TQ2dPTXErUGFpbzVoakdHd28reUdCWG5uSHVWZDNsdE5Qa1RvcFF3?=
 =?utf-8?B?aE9TNmJZYUp4bElMZmdBUUNlbUZZb2F0Vzd6V2pZY1RUN1F4em1ramVBZmZn?=
 =?utf-8?B?d3BMZUwremJnNVkxTkNIOEkxQzMyT3ZQWksvTWpwcXY2bjczMktENkYrR3V2?=
 =?utf-8?Q?4Z1iPrzM40u52uvVMejQ6nj7g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cc647c-e3f7-4252-efe9-08dcd0be2a05
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 10:57:14.8481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDFAaJigRzan1LReGJN9HkET7LV0tasBid1w+x4alIzQ3FTKV6GbUYBRoDMxrUzaM3Rfk7gGynLiiEOXkeN8Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437


On 06/09/2024 15:14, Jon Hunter wrote:
> 
> On 06/09/2024 12:39, Satya Priya Kakitapalli wrote:
>> In zonda_pll_adjust_l_val() replace the divide operator with comparison
>> operator to fix below build error and smatch warning.
>>
>> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
>> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
>>
>> smatch warnings:
>> drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: 
>> replace
>> divide condition '(remainder * 2) / prate' with '(remainder * 2) >= 
>> prate'
>>
>> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for 
>> Zonda PLL")
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
>> b/drivers/clk/qcom/clk-alpha-pll.c
>> index 019713c38f25..f9105443d7db 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2176,10 +2176,8 @@ static void zonda_pll_adjust_l_val(unsigned 
>> long rate, unsigned long prate, u32
>>       quotient = rate;
>>       remainder = do_div(quotient, prate);
>> -    *l = quotient;
>> -    if ((remainder * 2) / prate)
>> -        *l = *l + 1;
>> +    *l = rate + (u32)(remainder * 2 >= prate);
>>   }
>>   static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long 
>> rate,
> 
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>


Looks like this has now landed in the mainline. Can we see if we can get 
this into v6.11?

Thanks!
Jon

-- 
nvpublic

