Return-Path: <linux-arm-msm+bounces-52087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81349A6A616
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6ED916EB7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489C6221569;
	Thu, 20 Mar 2025 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="RQsiqxNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03olkn2079.outbound.protection.outlook.com [40.92.59.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCED221548;
	Thu, 20 Mar 2025 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.59.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472979; cv=fail; b=b6uc9jHFyVnI0U4HAQ8n51OwlaZWqTPixV5aFOkA30N9Eh33VwUY204KjYdJwk5BRV/LiZwX3yp17+Ke5sXwyEAI1V78KC26NWFHqcXe/SJGo69wurDSigEKvTTXO8yYHCm3j3lBh3jSOBUkBAUeUE0mFuNqrCpUP5FIIAg6tBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472979; c=relaxed/simple;
	bh=h6fGtG1lnOeHDDdhZIU3fxEKvImI991TkpOYD3NBBnE=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NCFbXsQxYZH2e4FbOZAxsKAnTFuWsnEJqDQen1KMzZVOO3BlHhGXDhShR8VBUPwpeoN5HomJGUsjLGmmtviqz0ryDDwWv2qBROaxXwwEluR+Jjk2cHAQ2WhHA/atDYN+vegZWhJ4jjSTinDZ8BIfljUYP8qsop0ZsBJUFvK0y+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=RQsiqxNW; arc=fail smtp.client-ip=40.92.59.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUYN9ql0F87CsaRvaNx8UJT9pCwbu97lfJgnYZnaod8N1cXTWHkRdSZ8UMp6HjHpdQ5IuaQ8HXxAT0OjDWvEK96d2bsbOe3oi17J3zpgxOSNP8Sr7O9zCKDC+Vo+Lye3MHNBF8TQ6tTVaJtUIH/ORmgivFMYOA9LCbUS8Tjg3AhJrW1wp0AstvLCNxitJ8vV2XLjhpIpSPy/O/J7ZPPgVFKmWwmJ/wKBqdxUIw4tc3gQZJQ27SKGza9rM3bSzVx3hiZwuYTFbwbjN+/6PNBCRqd4yk2HbLNRmaBgPoodEMn6HKrrfvCAg6zh9ph3jIaPv8UZ+RSGupuireZmGzBr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1vqoL3mXrZcVroYEl1NmgNjfXSR/sqJWUquEfaN5q0=;
 b=w2iaWMPX7rE8CrFEbAgXSTR0341w4XeMfMwBQDCwTLpQOILWnUauTqn+wBcMO8CMcEDQEmYip0667E8guB4l9Wa1nq+bTJdVP4Ad8eSaMLvqwOpnXDl0xwr3W415Nc7+QBzOYd7I2Rjw+UrppiAx1gHVrTwS5OdvohBk1dlgVcniscW8TVAA+J+A0V+porLCckYJrnyAfFdg1NACRdS3XMohaoOQ3PPRGl9JkZJloAzucNqZAM6LfGkIs+EVzg14zA8i1Ho3vicuHc0TCq9pRzR1DssC6sOI9Y7sxLaACoik7WXTCo6qmG3L8beJ3eH3o0W8mctDst+92XopDHuO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1vqoL3mXrZcVroYEl1NmgNjfXSR/sqJWUquEfaN5q0=;
 b=RQsiqxNWMWLdbwJYKtMr0mKRpvcoSNwd31URY/4YYO9HLAo1ke9wJX/k4AC+czAQQsoM52tihhFgjbFMGghM/SZSA7979rmcMw3Expk/LX201CZYBLEUs17eyIasA+88RwXu9P7XhfhbPDwMfOYAXCt4xBd00beNGc4iEzKtnQmoslqEtTpL3A/P9TqTzi3sVv91P/s351qWZ3HdIKYJzCkQ2u10nbAb6ofFeoST0fbFzyUXCSNzzKzGQvqVX45woYfuGssNjZUO8bggx6md2TxEQgEfiotvq0kQa4olTi9FxCCtNNxiOvfZbkGwORXNExe7ChxRVTArIIFCe2BnKw==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM8P189MB1283.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:235::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 12:16:15 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:16:15 +0000
Message-ID:
 <AM7P189MB1009C401F0C8B95496DB183EE3D82@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 20 Mar 2025 13:16:12 +0100
User-Agent: Mozilla Thunderbird
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 ivprusov@salutedevices.com, johan+linaro@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 luca.ceresoli@bootlin.com, paulha@opensource.cirrus.com, peda@axentia.se,
 perex@perex.cz, robh@kernel.org, tiwai@suse.com, zhoubinbin@loongson.cn
References: <20250320115633.4248-3-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/5] mux: gpio: add optional regulator support
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250320115633.4248-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <e409461e-cf46-4eac-8c06-4d8dfc81f413@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM8P189MB1283:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b53eee-00a7-4f75-6b58-08dd67a901ff
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|5072599009|8060799006|19110799003|15080799006|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K01raGpiQ1ZOUG0rZkFidWhOR1k5dnpUYXZ0a1dVbHJUQVFSM0dQWlJYVWlj?=
 =?utf-8?B?UXlpaUV3MXhUOHYwRWpLMGlxbGNvTEhtSnIrby9kc21mb3piM2NkNFdudHVU?=
 =?utf-8?B?ZER1UzJPVmd5UXFsNS8yZHBrb2U0VDFYZ1ZCdW1KbmtVK25vcngydjZCd0wr?=
 =?utf-8?B?MHRwR1hMYWZiMHFSa3VMUXRRRDJvWVd5bEJ0YVZPelNTK2MvT3NGT21vakRX?=
 =?utf-8?B?TXhDeHdacUFjbnVSL0FhMHVTU3hzUkY0TDEwN3h0RER4VUdXMXlPa1k3YTdF?=
 =?utf-8?B?WENwd0x5NmZNekZkZVpvdURxbTZCNTd0Rmt0MUtzcm80S3ZGd3lEa3oyUkx0?=
 =?utf-8?B?MGFTbU8yQzJhT0trMVk1elpIdFpUTzU0anpUdmdGWHZzbEhkODlCV1FBRUo4?=
 =?utf-8?B?VWl3aE8zNGNGalRtRjBTbU44c1ZFRGZqYzR4Ti9HcldzQkg1VDlIUGV3cTFx?=
 =?utf-8?B?WmZSM1RLZjc3cHVnWnJ2dFZnaTdCckZ2NjVJTTZSM2RYdDJ1dkFFOHRWcWxC?=
 =?utf-8?B?OHdrdW5lSkVrSHp1cFlnbHUzMVBOVlNjdDJtWEJld1NNZHZ5YzdvSmlNejBP?=
 =?utf-8?B?V2pFbitGSUIwRlJSRllPS3Iza05hRXJGMlB1REo2Z21CTHY0YUM0UWg1d1hB?=
 =?utf-8?B?Y3VJc0U5ejlhVUpXUUUwNWNITmpTNVQzeTZ6bS92empvUGZnNXpISi9ia1VF?=
 =?utf-8?B?MUZUMEwwN3lVWU1yVE9CMXVsd0tYVXdLT2Y0OVpCbmFBM0R3eGRJQzVmNUs4?=
 =?utf-8?B?bHRkQ3Z6OWgyR1Bqa1ovMDlaYTJDZjFqd2JVeEFFZHpvQWZlZ1pOMVArQUI4?=
 =?utf-8?B?WFY5dDVETnB3cENkQWhBZU8vWUpoY2ZSUHRqQm1JbWJuSk4ydEdNRE5JQXBo?=
 =?utf-8?B?REpGck41WVQxYVdXZVFSdU5sUi9aZ0dhSHd2QnlLUFYzZ0pQSnFvdnRvWldB?=
 =?utf-8?B?dGxXcEpveFRvYzAvQmk3S05rczhzT3Z3SDBGR0F6NXRlZGgvTzRFanpuQk1y?=
 =?utf-8?B?L1ZXVGJmc2NEYXpXSmh2NGhhR2FFN0hXbHFzdU9MajJUL3ZQSmp6WkUrbEo4?=
 =?utf-8?B?eWlMQTcySXdwQThPbmFqUEp4MXlMYXZjQ3ZDL1RBaUw5eTNnM21ZMUxBVW9p?=
 =?utf-8?B?dVJxRkp2Z2pYclp0Rk9tS2ZmTytzNmVzK0thMCthelJxNENGOEh5c25KdlVV?=
 =?utf-8?B?ZVMwYUJNVkVUdlFEUXptaVI2aytYSm9aSnBiSy9QazBlcTBGeW42WTZ0K0o4?=
 =?utf-8?B?bDJWUGQ5QnM2anpxN3gxSWNUTm1UMkZOUjkxZ04yZWdoOWFQZy9VSGxYSE9N?=
 =?utf-8?B?Tk81V09WOXI5NngvQVRzWTlQSjJOKzN1Tkp4VE5jeTNXaGlzNEVFL284NHA2?=
 =?utf-8?B?Z01BUmhvSzMrUGNuZ1BaRnVzc3g1TjQzVTE3NnpoYWorNmppQWFZNU1ZRDhh?=
 =?utf-8?B?RkZxSU9PVG9LdytNcTc2ekZBQ2F4MmpZTGVzN0ZOSUdNOHlHZEkrZDZSMmRZ?=
 =?utf-8?B?Mjg2emFtVUptZU45dko5RjBGVkhsaG03MDlhRXBubkhJMTdmcjNFODgvRzFK?=
 =?utf-8?B?UkxwZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZtMldLNWhLaGg0Vnl5VlZORExxVG5qNDNRd0s5NmtEdG1ZQVJVNHJXWWQv?=
 =?utf-8?B?cTJtaEVZSC85REVQUjEwUEE4YlY0Q0VZVDBWRkJKT2lLakk1SXM4ZWp1OEFS?=
 =?utf-8?B?RFRUaDlpbExLZ3k4bU9XTDlJeXpTcGhUbE94Sng3NUkzQ3IzSnFZa1d1UzBM?=
 =?utf-8?B?TW5QTmVrRDJQbmZrV2tOK1hwVXcvZU1IWEUrakpEV05mRCt1Y3k1bDFoUXh3?=
 =?utf-8?B?ZFdjcE15UE53L3FraUpGL1lhb2tRVWNOWGZaN0t0RWRzcE1LVi94RWF2ZlJh?=
 =?utf-8?B?TUxZSHp1R0FvajNIUzZRVm5DMTY5YjQrVDR4ckU2djcvRUk4Z2w4dlowS2lw?=
 =?utf-8?B?YkZRMGZBVXNLTlZCczE4QUZRVTgyNDRmd3BGV0JyV0JiTnFzVThCclhuM1pD?=
 =?utf-8?B?aDc5eWUwU29aU0NJTnJJY1pSMm9ZMUlyZjB1T1NtUUpzbElqWi9IaXYxM3dG?=
 =?utf-8?B?bC9pRWNRc0NWbU55Sm9qOFIrSHJUM3BuWVZ3WWtOUWZXcG96azI4Q2ZibEdN?=
 =?utf-8?B?cWhIakQ3YUhQZVphWllvMTVBK3R5OERiNXFNUG55ZzlWaVg1QkhGWDJDdks3?=
 =?utf-8?B?a0ljR1VRSUhCL1RPTmJjWG40TjlHUE5UMFcxMzNHTXMwSlpGNUhIdDRCTVVh?=
 =?utf-8?B?UU1SZGZlM3BiYUNvV3FQUngrUDV3ei9iRTJmSzJ5Zk5Ld0hhcmdKWmdDY0tu?=
 =?utf-8?B?TFl5TFMyMGZWQlJIOC9UZk9mdXdkK2NQVTBZc3hNaWVRSStwejZTeEwxdk8x?=
 =?utf-8?B?U0ZBbjVpeUJpb0MzaEMwSVg0dWlWS2YvTW1oTklCdjFibFFwazV3bFQxWk1D?=
 =?utf-8?B?TUdtZnFCcG85M05ONlFTb1FrOEJsV0hzWk0wRG9WTXJNYmdpTS9ncmdSSGZv?=
 =?utf-8?B?VUNOY1phTUlqdmkwSGgyM0l3cm9PUHRFOTVoZ2RxRVBPNEFEYUJvRVl4Qkky?=
 =?utf-8?B?NWoySkw3Z3owMzgxOENHUDdCQVZxZEhiTmc2bUhuQ1ZXMTRZRDM5RG9ZRkNX?=
 =?utf-8?B?RTFSQUo5aWV1NGsyelA0clRFZHRmS2w4MzJkQmhuUkJ4MGRQa3hyTUlnQUZk?=
 =?utf-8?B?QWpZN244ZjdWVVdSbTFKY2VqRVk1dzlyNUtUU3l6QytxdE0xcmpUcjloVWJL?=
 =?utf-8?B?UCtIakFFOUI1aDlkaDFoYW9RY011Sm9hbHBybzNRcGRqYlFXMXZaSjRoNmhP?=
 =?utf-8?B?anc2RFk5U2lWRFNMUk5SNXZoZ0hyb1JQaTVTd1ltZE1RVkpsN0g4b0tBdnkw?=
 =?utf-8?B?VGZ2Z1llM0pYR0c1d2RGeHozbGloeTdvUG5yZEFoY3F5czVvdzJGZ1ZHODZW?=
 =?utf-8?B?Wkt4L0RmelBKS0xXQU9SNzgzZXZNNnp6cHpHd1paNnNiV3g5RVlLZm1QQXpw?=
 =?utf-8?B?NytqVTJmNXZUM3lSa1RVRGN0Skp6ZFVnd3pMNnNzZXpaL1h4Z1pyaUNiM2Rj?=
 =?utf-8?B?M1ZkZ3RQZGVDUE1wVHdwRk9ZWFIxZ3M0OWV2NHFoR3ltcUlZUExSOXFDSExq?=
 =?utf-8?B?Rm9QTjZraHJqYm45QjBKemdoU0dmVGJmUXVNeVNQeXJXT2ttc0Fpam5VaXJn?=
 =?utf-8?B?QVJFTUVPN2pjSk5HeEJXZDE2TUdad004SHR3M1kxZDFpSlh2V2xqRDlzNjBX?=
 =?utf-8?B?aStsK1BkT201SkEvNHVzZGdybDdJVi9oR2kvc1MxUjR5TnlralJuNHU2T2hu?=
 =?utf-8?B?cndEdDBjNDlXNmZPQlNWQlVUb1EvcXBMTnRWR3pyNlJNOEQwaGM4OVlDb29i?=
 =?utf-8?Q?VzrAUGGFSHHChPMZc93NaeGPBzoDhq0pJftPT5I?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b53eee-00a7-4f75-6b58-08dd67a901ff
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:16:14.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1283

> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Some of the external muxes needs powering up using a regulator.
> This is the case with Lenovo T14s laptop which has a external audio mux
> to handle US/EURO headsets.
> 
> Add support to the driver to handle this optional regulator.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/mux/gpio.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
> index cc5f2c1861d4..12cd9b5c32fb 100644
> --- a/drivers/mux/gpio.c
> +++ b/drivers/mux/gpio.c
> @@ -15,6 +15,7 @@
>  #include <linux/mux/driver.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  
>  struct mux_gpio {
>  	struct gpio_descs *gpios;
> @@ -82,6 +83,13 @@ static int mux_gpio_probe(struct platform_device *pdev)
>  		mux_chip->mux->idle_state = idle_state;
>  	}
>  
> +	ret = devm_regulator_get_enable_optional(dev, "mux");
> +	if (ret && ret != -ENODEV) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Couldn't retrieve/enable gpio mux supply\n");
> +		return ret;
> +	}

This seems like a good place to use return dev_err_probe()

> +
>  	ret = devm_mux_chip_register(dev, mux_chip);
>  	if (ret < 0)
>  		return ret;
> -- 
> 2.39.5

Kind regards,
Maud

