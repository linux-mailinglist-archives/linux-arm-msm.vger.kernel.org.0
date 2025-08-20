Return-Path: <linux-arm-msm+bounces-69861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF47B2D2C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 05:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97BC41C41CA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 03:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D8D203706;
	Wed, 20 Aug 2025 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="boeuk08G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9B1FE471;
	Wed, 20 Aug 2025 03:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755662120; cv=fail; b=sNwmu42d9KL4opKdjR88yqm8cVSUTNmeXlHTypxKFwTLlrPIFNXJuZCNsjSBvo5/Svg3T8qNQkz2B0J8P+2rC/xFRSKlcPqTVI/xnaXHbYaanew5UpOekZKnyr/X+yKYjeR2YxGCggUi+3/DudMw/GgD05pdZGgmHRX/49OHvYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755662120; c=relaxed/simple;
	bh=yKOjM7jp0tWKC5U+R0+HTUC+oYPUOOKT8rCWBTm0gCA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N2dEmGOkOkb57wuU13YzjfbEl2g5XSSUWxLW2iWB3+MD+vGlm8k4V0nE7Bvfls2LkEN9pHa5DU3lh6w7gcUIl26vnuu7jnif82rgjjj2FKrnzqgG6HPz3PM8y+cA+8DNuWb+L5ZQcLRH+RFvfyfIWaUSY4IuQpNB2s5KUJ3tzF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=boeuk08G; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYuLiog0eiMhcqqqs8MtOuLDswzrvO3W/HhYQ5LuNbOHByQkRYaBZin1B5HLj2Lh6dGJKjzLEb7H/kGz6PkPeMkupmQTLyY6vJFt17JAVfNqEbYZ0aJ1sFMc5tEieEkwQYtfyaxPBM1wE4Muvo2ie5r1kWUXRjnWTysP29DJsigIIlmYk0Dw6lXierV2DZGqkbpTopyVUuFlvYroXZQI4y4iU5sUXtiYWAUMLYjOBIMwPQpGg3KxW1DHi9EkLtp4xDP7lVhd5io6mYBzX2XMpMmiKxkEqQ2bWCUClQH2oGu2FvVesvLx3N39ZNHCqU1rori/ntgLjjABxiCxyj6e6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGelSapEawfzBR2RKWwtztgrYOwKSO6wwIRamMexis0=;
 b=agIaRqzzp9TvG0+/BfybBFRPB8vfE6svNGgFi0LZ3YJ2Cb5rejYql0XRO+PTMnbiGLM2mQ5MISq5B3Awe8NeLrvvzf2l2n7R1xsKJ5rJniTW+03AgvjPZoPzcKfb91pPt12M7E6wcp/gfNBpTyz/gJUJfmPnyMb1cUXhQPgNat3ijbfUZY4YFwA3RMoWkum3d+TJ1ZyOTqjX14BNgVTA29qXXnLkvkslW/24LzyZuz43FDWL/o6eOf34tE0uRUrISqSOeQk2pzSMX4hy6nUAklam+JZJB9ArX5TsF/LOUjiSD5t5kEnRLpVjBzt99bnKYfDiCzhWsz2uyLkUUw0QZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGelSapEawfzBR2RKWwtztgrYOwKSO6wwIRamMexis0=;
 b=boeuk08G+bAFfI1OztaUpRnJVIuxcLm0ZxxOKv4HbR7SZB68T54kDqKf6lr3n2MGeo+B3YG+XPIh412hp9pZXKxfyQBb+I7TAS6jN7/jZWd6l4NyaZVSNhnMBySOQffxSTTJDuv3a2rcVtUz93opzL2d4hHEFEmtrFMnss6jFncBJFSPe9qH8HRXitKiJV+AGFrvz2s2btYQT6XF1CJR8BhAZcO2/S+Eo9zoYYE7WAE3tezRN9e3EsG3QHQZEQp0Xj2Ew4y/O6ovYTR86K4Zp4OA575Xf/sCfLUV4unaraAPtNgQ8yQl/AHGQ7MwIB7w0miTiVq33Lr9mEA0WYQ6Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 03:55:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:55:16 +0000
Message-ID: <249e809f-074e-42b5-be42-6a6e5a435365@nxp.com>
Date: Wed, 20 Aug 2025 11:56:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] drm/msm: hdmi: declare supported infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-6-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-6-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c13320-1fed-4ef7-83e0-08dddf9d5f74
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cElPL2FXWldZdFBaR0JOU0ZrajlUUGpYMVU5ZHQyOUxaVmZDSGxacHVKa2Nl?=
 =?utf-8?B?WE5WZGxkQ0Nvak0rSHo2MnVtR3dka3RwblB6OTFXK2FpSU83VGlxQVY4YitG?=
 =?utf-8?B?OU1FYVd2MGNGOHpsR2JFeWFrWXhuWXBFaGtDRUd1eHhtUjVobGlxakZPSXEw?=
 =?utf-8?B?TVZsaXdkVGhuNGJnTlpvYnduMzlJMWk0U1dreHJScEEyVjFpOVhhQ3RDZjcw?=
 =?utf-8?B?dlA2TmtQUlJoK0k0NVdyR3pvSE55NkRyUjdWRVhNUjNBcUVlK1ZpN3dtdkRX?=
 =?utf-8?B?cWZhb0RPK0xnRGdYbFVic0RvOXVsMy9uSFdtUnlBOXNOMWowMGgzOTFzdDBi?=
 =?utf-8?B?OGRzU2NwK1BwdkcxWUF3dHIvOW9uVzhpVXVYcUJiOFl6NFNmQ01xU2VPN0Vm?=
 =?utf-8?B?Y2UyalNlUDVEdU5GQTFSOFVTME4rdXpLVGgzaCtvN3pVUTg0Zi96U2VMNVBR?=
 =?utf-8?B?WUV1eUhvUlBteUYvbHJiNnBkekJ6UVpDdDRnczZTaHBNRFdORTMvNHBnb0NS?=
 =?utf-8?B?UHZBclhWVmV4U1M2UEdXUFRTUlVSZlZDVERxQm90V000OFZtQytqUjVuWDBn?=
 =?utf-8?B?QjVjblRNMjA4ZjhSTUh5ZldJMWs0QjMrdElCR0txdzFvT0RZTEQ3cWJudVVa?=
 =?utf-8?B?Vmhud0tjR0VscGliRnRXZC9QRWNqcHBrNVBJYngwbzUyVktMajEvdGw4bUFJ?=
 =?utf-8?B?TVFTcWp4THdHU2prTUJDTm9iR2FES1k4MmdMUzdpMVF1dCtBRWsrK3RaYWNJ?=
 =?utf-8?B?Q2dHUjBMNHNYR1YwTVNOOXBzd3FoczBoSEVwcjgxSW9CcEFHNWJQcWdGejEr?=
 =?utf-8?B?ZXpoNUNpVlI2cEp2bHIrQUtIUHlaK3RiVTNQZ1ZDYmhFak1Makt2RmJzNWhC?=
 =?utf-8?B?bGFnQnk2d3U0KzNuTXFMZEVoblp3dmU0L053UEI0S05SeDhtYjVWTUF4cTNn?=
 =?utf-8?B?bEtKR0twSGVuWFZ0NS9LL3Raa0creno0K2xkRi8wMlFab2FmVXJNdG1KWmNZ?=
 =?utf-8?B?ZzkvSlZRU0FsZUFXdFFxN1JJUkxuYUZjOGsrSytVYllZOW5INUViOFphU2Ry?=
 =?utf-8?B?UWw5ZzdIWVVLR2hYVDl1dmJyY0FwM0JwMjVpTXREV1NjdXlXOG5hUzlNVmFM?=
 =?utf-8?B?V3ppSDFzaUxnbnpzSVUwb1JDeU9pZXpHWVNSMzNsbTJkR1hKbHdCL1A4QURT?=
 =?utf-8?B?d01yZzRIWHJOWWlJL1BMRWJuZGNRQ0dXYU1nNXBWdVM1b2wrNWlPY1N3cFNy?=
 =?utf-8?B?WXlYSVVHeDRXZ1dZZmxpdit3WDg3Y3FmRElsbDlGTnFGc3dOZWNEZE1mejRv?=
 =?utf-8?B?QWpkUjdWc1NSaFA2Wml5R0pSZGZnTEFKVW0vc2FqbFBPeHBRU1hEOU9oekFR?=
 =?utf-8?B?RHJETFlkZHFHM3ZVb3RWdmh0WUsrdU5HNkZUL0JSV3RZa21zanlMbEhscndx?=
 =?utf-8?B?WEF5NlBFWC9hamRhd0ZmRkVnVTdGL3p0NFNCV3BWRWJnNUp2WDIvRzI5a2pC?=
 =?utf-8?B?MXBpUHRiM1EwcnFPR3A3d2JVd3ZiNFREWmh4em5HMmZ4Z1ZoSjRMSkhXNTFo?=
 =?utf-8?B?bmJqOEFEWlB2YWdublZPN3JvcmRBSTdFQjhUQlloeXFXL2gwa2l4QitVT3lO?=
 =?utf-8?B?NEFORFE5Wmo0QkZPMWI0TGxMRUdLaFdMTGhib1lxNk9HNEZZa3VIVEJ0NDVV?=
 =?utf-8?B?NW9HSWJyL2hDQXhsQk1oeUh3eVI3ZjRHWWVIK3R5em43YlNSVHdoazFmd3N6?=
 =?utf-8?B?UUJpeGd0cEdhajdVbHFDZktsWXQzMy9SbDlQdmIydVhEL3dMWG1oZERhY0tJ?=
 =?utf-8?B?cWovWTAveHZSaDhML2JnMEtQWGJUTEx6cDJuNWRESmEzQ1BpeEJSM2tlVmV5?=
 =?utf-8?B?K3VTMzY4Q25nZHBiSnIxMm80d05FZkprSVlLNmRZNzNBa1VzbFYwSTlvS3lE?=
 =?utf-8?B?T2FZK3UxVGZnOFBRbi8rTm4xZ0JmaVlQMnR4QjU2TS84SDRhblVSemNteVRB?=
 =?utf-8?B?NC9kcHNqbjdBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YWN6YUNUYmxSTm1ROFZsK29GaDY1M05BNlRSaXhCS1NKci9BcE9oemVMNmh2?=
 =?utf-8?B?WXZ1OGlub2ZGOGd3Z3hvQXVWRzNwN0Y1cVZYcXkrT01Kc1lJY2ZoczMvK0po?=
 =?utf-8?B?MWMyVnA2RW5uRHQ1dlVlODh4MDVrVVJDa3F3L2VBWlBnQVRQQVEzeTJveVF1?=
 =?utf-8?B?VUorcVlsWDdYV1RiVC8ycUx4VENqMkhsSUxHYUNGZ1NKQUNydFE2VFQ4dWZh?=
 =?utf-8?B?OW5NNW54dTl3TkpLV1czSmZlUzk3MXhzelpOaGxRdm9FREdHMkZ3dU1VWTlW?=
 =?utf-8?B?cnRHeGVKZ2IrRHRQUkE0OE1oZldNU3E3S0RtRVlSU0plYmttZnE0RVErelpj?=
 =?utf-8?B?V2hSbWlJYnJNNXFDVVczRDdqRFQxSDRhWnZhU3ZXSldmZ2tKLzVoWVlQbUJZ?=
 =?utf-8?B?OFM0RjFuMEwrQXdRYmlhVzlsK2lKUUVndGpWRksxQUpUdkpLRE9Cd1pEcFlG?=
 =?utf-8?B?dVFiUS9ERkZueG1zVkJRMG9HQmZCdHVrRkhkc3lMay9VYlhIZzBTUExxZEV6?=
 =?utf-8?B?VG5IQUpPL2VPZ2VsbkhDZHE2VTFjS0JlT1Vmd1VJTnp1TUprOUY4cmgzUnY3?=
 =?utf-8?B?czJseitvaHNUQ01ocHNLZEVQRXN5eCt6aEFjRkhnb3FoU0laejRwdmVveWo4?=
 =?utf-8?B?MDR5ZUJYWURuTnVTRjFramN0djdCa3NHY0gweDdtVVZLRXVDbnJnMjFuR0FK?=
 =?utf-8?B?MGtlY0JTVmFoVldFTGgvZkVzenJzYVdkK0JBVDNhRXltTXBrRW0wbkM1d2dv?=
 =?utf-8?B?Q3pZQ0U3TUFRdGpTbjNCUnVWdHBYWTV3b0ZwSnpwM2N1akdSY2Fxd0Q5Q1NK?=
 =?utf-8?B?VUxIcExWK0ZqKzZDT3B2TWhsaHB0bERTclBkNEoyUHFnQVB3QlJwN09NSGx0?=
 =?utf-8?B?YXdrWit6a0s4eTNaNVdkaUpFNy95TWVDMzhvZ2Zta0ovZUNQR21acHYyZHk3?=
 =?utf-8?B?Q1VjK3hEOExQQ3FENFdSL0RleVFUV3pzRHF4UXJ5Vk1xUTVSK2RZWlFPeFRx?=
 =?utf-8?B?U2FoaFY4aVRpNUtKbW9QM1ZqaVovQi9hZnlCQmtyTUVZSmRwcEpsa2thcjg3?=
 =?utf-8?B?QjV4cTRwVEtoaDNXdG5RS2dXaTJoSTBtajYzalFUM0hybmFDT2FnaEhHUHph?=
 =?utf-8?B?MUU3bkVjUWZKbzRiTDBWSzVoQTVQWTkrQlRhRVIrRytFZ1pidWdvZHpndkVE?=
 =?utf-8?B?c3NzM2ZUZ2ZtOG04MjA3Q1VkaGsyZWpiYUpBeDREdk9mUlVPNjBqb1lvekpr?=
 =?utf-8?B?TEFrNHlmOXB4UStyOElYeUxNNFg0SjFxdkdSOUlQN1lNTFFOZTVXKzFEZUY3?=
 =?utf-8?B?eHp0L1lNRS9HL2dJRXJLV0xKYlcwQU5KR2VwdlhqOW9MWVdPTDNhSHlveStj?=
 =?utf-8?B?THU0d0JSNWZ6b09uSXA2cGk2SkNXOUNOTlBKdzg4UUwrQW40ZE4yNGhNZ29k?=
 =?utf-8?B?aTd2NytLUkpvaWFqeU1JS0hCQkc3dVB4OTh4SHJZcGVSY0FmWkZ3aUhxQzBB?=
 =?utf-8?B?RDI5YVQwaTdtcDRWT2YxcFpES3dLNVYwRzRIWVU4ZFd0bjB6RkxJWWpUcmh1?=
 =?utf-8?B?ZG5iUlpYUUJ5cEV0VE9XRnY0N1Jqcnh6ZElxaTk4MlNmV1AwVVFyMFRrZG9l?=
 =?utf-8?B?RlREc210czA4NEVTMGg1VXBxNk16U3IzSVk1QXM3VytqQlRuQktDbzFOVWcz?=
 =?utf-8?B?TjBYT1owS1NZTTU0WmZKR21QUnkxYk5BQmwvbDFZMkUydXcyVVRINE5JcmpX?=
 =?utf-8?B?NkM3VzNaN3JDM0R3TzZyWlEwa3A3UVlDb1VMV2ZpR0h5M3BDUFdXMmlJamtm?=
 =?utf-8?B?M1kvL2ttczdBZ0VXYWFLdzJtUkpxdjNKOTZ0UjR4RTBYdGl2QjB6VXpBdVFk?=
 =?utf-8?B?NTI3UFBsOThZeTJaZ3Nqa253Y05CenVQWEtUQjFHbTM1aTZ4TG1CZ0hsR1Fx?=
 =?utf-8?B?Z2ZGYTNxMmQyeVpGc2lyMEtoN3NmZ3hHcEo3ZytyQ0IrbUgzNFNFdGRjbUZ1?=
 =?utf-8?B?SVdXbTAxQkNzMGJtellJYTZSaENqRDQxMmFqQ3k1ZDFTT3N0OFhuWEdhcmFx?=
 =?utf-8?B?TFJYaXlpd0JVSkFOb1IxNmI4c3hWZFZRRU5BZzVEU3VwOU1EckdlVmR5Qmpu?=
 =?utf-8?Q?/3bDAFshgFF4pvcPcthGme/QA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c13320-1fed-4ef7-83e0-08dddf9d5f74
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:55:16.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKg2blVKIqh4+XjbMjecDeQ7HTsVtboZ88JyeqTj/Et9rl3DL3NuAXZEbMSoO6pTRpr4QxaUuYrtkPPqZazleQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

On 08/19/2025, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

