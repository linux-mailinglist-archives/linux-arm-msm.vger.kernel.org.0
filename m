Return-Path: <linux-arm-msm+bounces-72581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C4B48FB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F3E2161A9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DF230ACF0;
	Mon,  8 Sep 2025 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="F0yy1T96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011026.outbound.protection.outlook.com [52.103.39.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191891E5B64;
	Mon,  8 Sep 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338530; cv=fail; b=f2MzaKOjI8ZKwlBTLfdWgyoiFeRoCMBrAbPytwZT1YufNbbLIdE5q0gwCqiiyc0KtuIkn7ygyyP/p8i0oYRv9nEhAmtdHdejuwSnzOVHaDPR7+X+jxQbF7n0vi8QMU7Y1WgYFQ3ja2A8/kRal0YLfNXk0R+mRnxuVxxa5bUPNZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338530; c=relaxed/simple;
	bh=e+TnoEcCzxKFgK2fwaL3y0m8qSdxir+T2kvFAcqh9vc=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HLr3HueXncsVRiuOBtHbDZ9JarnrKpAOleFwTi15X/+p8ldgp8/SmYBP5NLKyfbOOw+L1BYrN3JnwAwZ+IO7bN/t6+BOMEoyPphk2UFw6ldB6PHsx+9EFC9Vvw87MSJYed7hYLfsX+S7McGoFeALAC0JCHC64wehe60dA16c00c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=F0yy1T96; arc=fail smtp.client-ip=52.103.39.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSD8YMnkU5suH/qfRycZs/n+gqSI3w8fbZWQrWCKheJZBuvuTlg7YbGZ65KHATLnGC+FfX4z2tZP9NWNjExG+ZoSl9YFV3EvIV2X/jwfGBQCSCdmzh5C32hns80Hwve3LX1XlTJXPJ9+n9MBrPgFDWdRcEbbWu1ij7bpms48egxMhJZoiHODLEVo/ARVphwnHnz2uK/GTi2xCCUS9kVmlCNo/EUCKW1UqDfVV4sT5sRqZTdtc+doZlK01aXGdZAoTOQD3bWoErMFEk7jv+BIDkiRFrsXCCCZ67acwndnZzFh64t321w9czh7AX//KfANOcmel5JrBErNJONoK2b5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dhit/pBCFMbqUc6JnBDt3o+wc65YXjSG78N64YVpdKM=;
 b=vsUXKIjeWhwAFkc7shAcmkL4rVr7Cv0EalkFcWWf3gkoNm+qJ9jTthxxJCfYszjBb2iVaJ11YzOkJgibrLx6wsa6FYRsXBX3Nb5C20Lx5mVu4V3kty+WcXY9cmuudWPjoLadm0P8ESb/Tcg7nwNd3fH0g5Oxv7dlYJ8N6AKuJUZJl5kCbB32ucb05p5JnUuBOV/PGsqkOZ4ULFnDdCfUkGR+syV0LMScEPi0VrzRBM+hH7CHAGrdEHjFaAYoakczXs9GHHd0zE+c9kB8zRs37uCt1WyIFtfwrfm87YPlVPrCV7vM/z6yLu5urL+qSHWu/JiRSL/j4hhvRAZOj3GSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dhit/pBCFMbqUc6JnBDt3o+wc65YXjSG78N64YVpdKM=;
 b=F0yy1T96Fy4Did+QdZ6nxDdXQWdwhiWGupHMtbOBManGIlMdH1FJj87YNdfws5/LhmVXj1y6T3Osubu8U2HitGIH2+LtYqF711iwpzK3Zb7w4H4q/Dn+PQwwDj7OUlG3wpiNOIwvebyw5Tj5KLGerU2pnzCGRfoXX9E8niYHBGmkpC1pUoCY84aF/h156awfMCZJor3xkNPgCI+vVasQFfUPA9UdQJfxU3zFNqE/86A/G7HYYP7RSKjXOajcX78Awvkqg1pq8OAo4j1yKO1eB9h4mA/dsPgvJmkwE3ghIl4R0R3nOexfvSRt6yWu9pQIY0b0I1/tFCvP2udgUdmPwg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by PR3P189MB1001.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 13:35:26 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%5]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:35:26 +0000
Message-ID:
 <AM7P189MB100924E3244B953F0EA6D462E30CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 8 Sep 2025 15:35:23 +0200
User-Agent: Mozilla Thunderbird
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andersson@kernel.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, rfoss@kernel.org, robh@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, vkoul@kernel.org
References: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
Subject: Re: [PATCH v3 2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI
 bridge
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::16) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <a16330f7-364d-42fb-ade7-bc86c95de698@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|PR3P189MB1001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdc4ac9-8874-42b5-94e0-08ddeedc9093
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|6090799003|5072599009|461199028|23021999003|15080799012|3412199025|40105399003|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SStRR1VjVjhnQWpma3lHU1MydDkxZ3g0QkFKMnpCMGVnMTdWTGJ2SGkvUis0?=
 =?utf-8?B?NnhPOW92Rmd4SWJWZ2crMlVZL1RyN1dsbFNidC90SUs4VHgrcXBpL1FOTFNM?=
 =?utf-8?B?a2xRMXdIUFpxMWNwV1p3eWZrSFo5eTVldEh1VHkvKzU3UUhJWE1VakxCZTFx?=
 =?utf-8?B?bU12OFAzYk53TkZEQTZweVhLWTU4aHpWRXErQUowaXZHNUNBTFlZZEtJRWE3?=
 =?utf-8?B?TWx4dFBZTTFKYUd2T1RyNzFUcCtSSVY5dktsaDQyZ21qUXRhWFJjYS8yY0cv?=
 =?utf-8?B?WnpEUE1qOHdDMjdEME5aZzNtRHlGYTRWc0o4NkRyL1RMUVA3a0szKzBiVXdS?=
 =?utf-8?B?NFAwUW8wazB5ZmY4Z0trT2xKUzhhR1pSM094WWx6NjY0U29zY296RmdFTEk0?=
 =?utf-8?B?bDlObm9CMGZHVDBUOU9KUDJDTThMS3U4WFJDbW9mY2FSTFE1Vjh1MnhuRWJT?=
 =?utf-8?B?ZE02Y2FNU0grVVVGN2Y2a1UvZVRNWkJvLy9KR01mM2cydENtMjljUGU3Z0o3?=
 =?utf-8?B?Z2s4Qnk3b1JrR01JVlY1R1Zud24vcHdHWnJZempkT1B6OUFHVEt0dHI3Y2c3?=
 =?utf-8?B?Wk1CV3ZNeTRUdGJUVmZuVzBRSnA3T2VwMm5HZExsSS80T3NoM2xRc3hWY28x?=
 =?utf-8?B?OXFuVGxxZTVIM2xEOUxnczJaaU5VNWc1amZIQUhrbzZCN0RoeHZrQkZTdFE0?=
 =?utf-8?B?UjJRWmQ2Z05ZbTM1eThkSC9lRXJxQ3lIVWZLaEI3RWMyc1pIU2dXWHppaG5Q?=
 =?utf-8?B?bEF1b1pLNVRYSlhSdFJqTDQvQ2FUS0lGSzl0UnIvMVMwZmFxdnBkMmtHQUtr?=
 =?utf-8?B?Q1YxMXBGRnRlU3V2RTd0NzRrZmIxQkNBWTBJRXpsNUZpYUpJdmRxdWxBUHZo?=
 =?utf-8?B?WWszWGUyVkxVSFJnWU00aDBvcVBjU1hadWwvTmtEbG9JK1lsamxvVkNNQW1t?=
 =?utf-8?B?S3RCOWFFMlN2NGZiU3R6Um4vUnh3bEV5MHA0WVBocUw5bHJhVXdyTWRkSkpo?=
 =?utf-8?B?emkzQXY5bXhLdVdWOXRMRzBQak5xcy9jS09rbUxsbnJwTkgrTmhKSlVyOEtV?=
 =?utf-8?B?SEtzbTl2dkk2Qjc0TmUyUml5aTFWL0tiazNTdmlVL3U4UXFSSmRiM1dTck42?=
 =?utf-8?B?Qk82bG02US9OUFRXeGRUYitwcGpwY3VaMmx0VUxVak5mNys2dU9mRjR6ZlY1?=
 =?utf-8?B?K3lKMmVuZmRCTGVsenozNEpQREJMWmtNTHZ0UnI3aTBBejMxQ1U4SC8yU0Vz?=
 =?utf-8?B?a3gvTUphbGI5Y05KSWU4UUV1c0pvSlFIRUtqTU56bVgzWnF1c1FEcXZFTTFu?=
 =?utf-8?B?VitldytTK0NTVHNHRFc0eVd3b0grWGhOVjJkU2NtTmNpZFRjamk5TFN5d2tD?=
 =?utf-8?B?Rm5BcC9iR1Bhd3pNRUlvVEd2REYzVnlPellqa1pEU2F4d3laYkVZZnp3V1ly?=
 =?utf-8?B?ejcxWGQ0RzgwNTZPL2xvd08wSGtVMlNVQVA3VEZOd2c3clJtME9peGNrZ3Ja?=
 =?utf-8?B?TUNQSUV6QjRJS09RK1pjUUF5dU4rSEZSeTVOd25OSGdVZVdncndHTGtmVlBw?=
 =?utf-8?Q?rpp2CLmbk/XpcW3uc/svI2mK8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJXS1cwWlNXZ2xkWFBPekhoS0NPeWE1bzJGbmozUlMzczNjbjh0dnp0RHBz?=
 =?utf-8?B?TnRERFFUUXFGM3lOeTUwU3dqdjBzUTVmMm1zdGZXT0xRc3MycFlGc3VrWG1H?=
 =?utf-8?B?WkNWWHdTY0pVQmFBWFl6dmkvdmlhd0c4QzB0TjUvOU1FNi94dXZWSVRkUEJO?=
 =?utf-8?B?RU1BMXIzTDVTa1NTcTBDMC8wTzE1YWc3ZEoxSFROcXh0K3hoZE9TT08xejNs?=
 =?utf-8?B?d215aTc1QUJjMjBHREhGRjhOLzhkYnRUNVNKczUrMHRXVndFYktLT29HYnN3?=
 =?utf-8?B?SjJWcEJhYVZPZDVWWEpDZDNOcHFiRWFlWW0yNlBIWFhWZ04vRDBrWk9XOHRj?=
 =?utf-8?B?MXpyaGhubkdPVHAxOGUwMkx3TnNrVlhOZVhUYVlOLzNNSHFXaE5WMlZYQ3ow?=
 =?utf-8?B?U2hHL28xVjI3NlJyZDZKUktVUXI4RGNWNWs3R2M2TnF4N3g1M0pvUXhkVFdF?=
 =?utf-8?B?NjBIVEVXUzgvT0ZyUW1ycUh1d0xNbnBGcXdoSUdLZWNJS2VwU0Q1YWRCU2Jp?=
 =?utf-8?B?SHJuWWI3QkdpU01PRDZYWmlmVE00cWh3VEsvaFM5QlV0SUlQUGFrVEM0Q0xP?=
 =?utf-8?B?bDF4bFU3U0trWm1EN2ZNdFJNNDFZT0NkOHdBOGhhaWQ0alVlTVI2VUtRRFhn?=
 =?utf-8?B?TnJwS0hQKzlpajZnVkZFa1FUTEcvRU9PbC9rWW5ZTzhHWSsyRWRzdFBUVEZE?=
 =?utf-8?B?TTdrNUMyZzdqMG5FOVNjNU1oS0Q2c0FmZ1VBcWFVTUplT0RZMTRsalZiM0ZU?=
 =?utf-8?B?WXgzcytnR3hUSDF2TzJsR2lxSjBSR3J4QjR4ZWJKSGxWWGQyMnpRbzdmYWJE?=
 =?utf-8?B?RTRvektHWEpZWUlyMnZkLzBRMlZobXpjZEpaSkZES0V3dkdYaGJ6Slp4c0Nl?=
 =?utf-8?B?dkwyNWVoRFBFSk51YlRMcmdjMVBVWFM5aCt6cDVyUTZGZys3aXYvZUpzZlBI?=
 =?utf-8?B?eUZYZDFuYkxDY3NYQ3REazFBZHMvRjA5OW9ib2c1TmpkeFhJaHcwY1dRSjB1?=
 =?utf-8?B?KythV2NQV1BsNEFjU3BMaE5YR1dEZFB2aUQ4S0dGMnlTVTZHdDJTazFyOUI2?=
 =?utf-8?B?TmVuWkJKR0FWL2JCS0t5N0RudzlHa0RiRFhOaU51WHN2dWZ0blRQWm5rUHlt?=
 =?utf-8?B?ZGtId0REZmxaOXRERlpnVzd6cE1SOHNRcTFkOFZpdmZJOHFubWcwamthcDh0?=
 =?utf-8?B?dlpvK3RNSVR6ek56WWZXbkNWRzRXUnduQXNKUFltTW1YTTB4dkg1QmpvS2I4?=
 =?utf-8?B?SUcrMVpJQlI5NkN2SDJzTjBRV2hPYXF0VGZrTWtsbE1OZlZSRHBkclJuTmlm?=
 =?utf-8?B?N3FuNlUrMUEvZzZja0l6UkdNNnZpa09WZFBUdENhVnhqdkpIYlNHVzFDUHdl?=
 =?utf-8?B?c1l2Y2FvaU1CY0pucVV2Y2R2Yi81amlia2gwYm0wM1ZyaE9aYlduY3JlZmNV?=
 =?utf-8?B?NExFaGdHbE40RjFtdTEzUytoRG03QTErZFlJbmQ5NDE2TzRPcUFwaHNQT2tP?=
 =?utf-8?B?aVdOUzhpV3AwSlJuR3FtcHluUTZ3QjhpSmxRZldWM3F6WUxNc1VDQzFEeU04?=
 =?utf-8?B?K2F5bUJTUTlNaWxCZkNDdm9sd2FLWEpyc1dMeVVnbkNoZzVIK1pyb1FYUE5G?=
 =?utf-8?B?VUlFSFYxazNzbUVjSThFaUdCR1p2RC8yMU50VkZMZW9hdzUrU2gvWnkvUE51?=
 =?utf-8?B?K0tpVTZjU3hQUEQ0L2xwL0I0YmJ0eXhUa1ZqWXowZXlaemtOMDJsREZGb2dz?=
 =?utf-8?Q?nzhKIbBkXadJTzPEgY2XwypIMBUz5M1q3UwntyL?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdc4ac9-8874-42b5-94e0-08ddeedc9093
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:35:24.9715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1001

Hello Neil,

> Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 1f16d568bcc4e0fb56c763244389e6fecbcb2231..e4d0bc2200f8632bcc883102c89c270a17c68d0c 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -266,6 +266,11 @@ static const struct of_device_id simple_bridge_match[] = {
>  		.data = &(const struct simple_bridge_info) {
>  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>  		},
> +	}, {
> +		.compatible = "realtek,rtd2171",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>  	}, {
>  		.compatible = "ti,opa362",
>  		.data = &(const struct simple_bridge_info) {
> 
> -- 
> 2.34.1

I would like to ask again if it may not be a better idea to introduce a 
fallback compatible, once this patchseries lands I will be adding the 
parade,ps185hdm. I don't know how many other variants there are that are 
just simple dp->hdmi bridges that don't require anything other than the 
connector type set to HDMIA. The Thinkbook 16 and zenbook a14 both have 
HDMI connectors, likely with simple bridges too.

Kind regards,
Maud

