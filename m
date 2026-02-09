Return-Path: <linux-arm-msm+bounces-92209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SdCMDdmKiWnG+gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:20:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67210C63C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5146E30075C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68B730AAB0;
	Mon,  9 Feb 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Fu7ycBvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012008.outbound.protection.outlook.com [52.103.32.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C55F450F2;
	Mon,  9 Feb 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770621632; cv=fail; b=VmSk8/UDBCFL0oRR4PEQm2B+ipyJoHKmaH0NKmzslYj/xoqC1m8brZMSxpP2+rVcTURthU51JvY2JXZXk73IUd+u1fXUl1/7E2CU3slJ3C8Tx9nBIW7kDssfiAinbfZQeUiw2Wz/EzURJAAkk+mGBcYWJWS+TpHjrclHBTZuoYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770621632; c=relaxed/simple;
	bh=OUSWLcIhg+yJm/FsSWwIwrkx9ziqlP4RiEAlAA+M+tc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pSq2VtZzBJUqVTu7Gat7womO/6OEW9Kg5W3Gl8jBCWQpy7P778RfetzfFeoGgr3TT6wqX6J72VjFbZrF9SvQWdY9GWdQ9RgAHlhmf2JJbHdwLMjral3o5osDSNJHXlfJAaEk6vgcuwGTasrnbTi4tWMiEsbiy6HET0DD1bfJ1S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Fu7ycBvc; arc=fail smtp.client-ip=52.103.32.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQjGrF++VInlSg7NDwPf5p3ItdohQ98s+vcrJjbBnXL3ZrlmB9Po+9M3VVHBTXLOsTmgFY3Q2lAH6oeXj4ElirOVzsUJb6hlpq/XQ/kKEAiJkdAE4+5Gh02utOWbtMFxpIMIEu2gWpTdCV8b/g92mJX8GKsj/oSieLu64bP1sShHdtIBlbJsngGGhJmtWE2TehrWiIVcX20QsH0wosWZdlmjjsInOGltgD3TPDqWRnJG20pn5yDWcoOqH5yMxUn8J+0upZVGxNWIpLTqcOGoY9l22Y3VO8sE1Lnkc+LvJ3m25ncBshk8J2fNor/mRQM7UXwaPCfLgvIfp/8ceLfLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bs0Eky+xHJ/3rcRDFnX8rYQcVRyWSKZh1jC8dPuqok=;
 b=f2kMNSb4NbqXRjyvkdOnq2OkC3joRXlgRqv3BFyv6EirYz3O8M41TNBOjWn/pnW/gn8MdXGmX27/JkZjcQF59KU9J6p/L9/4KobB8A0cETlW1gplnkqomO+5XM1TSGVwP7mogWxxFHEYXVmBzO3EVp6cEkN/lr1BAz6PN+MvjBU4WdOPBacLxR458DyCFYdi76S0iJoDhsSfYqLIUUzZg9WWDlHs5ZYZkT8iXZGuZSxuCCfGo5Ym7oOrmVJku5nm8kP6QPUMm7rbMcNxojtJRHooDPzQ4WW1FvQ2X5HyzGyV7anrh/2CkX34TFZKcLRapr8iS5Y0maeZ38s1e8B6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bs0Eky+xHJ/3rcRDFnX8rYQcVRyWSKZh1jC8dPuqok=;
 b=Fu7ycBvcFXVituoAqE9X/A+f6BUyO81jBxqCRzlOf6kNHNEl7uKM7QOIgXSiMi2lQ1cdzU4CNgdLfUG8n3M0iUGtPrczZedgR7z07+qpH0bg5Njod00n2nYwxQRouZTe679Zwoa9kgVboyupt7g4MjyqEyUlFhiJywghdXY0yuC+G5HpxojSrDoTnzbGNuuEuQdUiGDEHjbpN+eaWY6HS8rp09wz2DQU28L4vKiWzmMHueTYIpslqTFhwk8AOQIqDSNffHquVDw4WP+Q3R9VM6zmT19tZg014ugOgBLiDXsNpViErKYf+Xcluqd+0nXtYQLVvpvAgVIdy78gxecCkQ==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by GVXP189MB3387.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 9 Feb
 2026 07:20:29 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:20:29 +0000
Message-ID:
 <AM7P189MB1009B650CBEF568DEB98B39BE365A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 9 Feb 2026 08:20:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1-vivobook-s15: add Hamoa- and
 Purwa-compatible device trees
To: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <20260208-b4-vivobook-v1-4-3a9b5e153909@oldschoolsolutions.biz>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20260208-b4-vivobook-v1-4-3a9b5e153909@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::32) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <0f543f76-edb9-43d5-85d2-623eb4e91b46@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|GVXP189MB3387:EE_
X-MS-Office365-Filtering-Correlation-Id: 51735ea6-0c23-43a6-fbe1-08de67abb3a2
X-MS-Exchange-SLBlob-MailProps:
	vuaKsetfIZmcv7cN2CQdJd4XVKwegu/44LkmkkD/SCz6Xt8ZZ/gnQfFxmJ7yOEwAl1Ck0jgFaNm3nkINvL8QgigPSf40nOjC3OrEA203lWWjlQSI8sP4teQxRkRXnk2UzIUYDtrboI17wNZvPlMKDG0JhpzV6sc2erbYploaJ+aIvSBc624gZsciFtjeNNWzp14FmI9whHj5ZJ9g6zGv4GviRWXFR0u0F+fJdPm5hxXeS9BTH078IKz+X0h0RFfBkEKHAm4smWvDjgIbu/LPeKJexQX+KU7V/n8CPRvjanJgTR9uy6tD8pFKitEmQ4NihiMHEgJLcts2qIy37dMoLyhhyqftGeivE2a/D2HMupndgHVIfWySxTZ3TzslLKviQja1aslPXjAPEeiFK2wl6FgPPeDy+R+OTkT89HHZFed5A2LyPiG4npi+MRQeCglyrWEPKQxRrIHnYTaciZyNcPzoMIIyQKn8IM7UbVpiwFulQW+0Vo83fLG8OSP+3nWxu0xWjK98xn0hMSJz295mR3KeAF0Dvr/oVm0SrJ3vfuJ0HXzlb6OAtNLjuf2cDTNtIumz2HXbwPZv1cyAfqSYfVjTUOxdrOlrG1vGMdjAVmnl+czKEItP+aorqM3H5fKkFZt4O7VkMQ/Z602m7CRQyS9TLNBQtjLHjfizxIpE754vFX1EBAeskUcb3LVVaZJdBVFvJczpOgX6bk/9IZ4OxGWQH0Z6mzCAqM7LovLvFfwuTGQNqrYU35iisf4Y/sIyM1+Twt9iEmPACUbhaiWEeJ78hF01gPi9iR+0PeG+ZdCdQd9Bub6MVO0ckq7uUcof
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|51005399006|6090799003|23021999003|15080799012|461199028|5072599009|1602099012|4302099013|3412199025|440099028|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmJ4Z1RST2c1Mm4zTlV5M09FMmJjdmYxeHJsQ3d4c1Z3bFJ6bEZRNUNVVzl5?=
 =?utf-8?B?YXhkZmsrSzBLT0JzNWNMam5HeVBxUXI0T3ZvREx1TEtjckZoN3F6S2QwcE91?=
 =?utf-8?B?SlVUSkR1eHdvTnU3Q2RzdWc4andYa2kzUk55a2l3Z0x0T2phZGFSbUg3djFZ?=
 =?utf-8?B?eExoYWI5T1VwdzRGbTVHSVd3b2RqOEhMVUZZUjk2MWtUbWM0TUdOTnVYR0dk?=
 =?utf-8?B?dkN2UVlLY1gyVHpUUWhOSW9pYkcxTm0wR1Zaam5rUy85dzBwUUFPSVB4OHlD?=
 =?utf-8?B?VzA2WTFua09MNXVSZnR6aUowSU11ZllxVGc5Nm9BQlFkZm5EL1dXNjFpMWJt?=
 =?utf-8?B?U014R0JoTmdqLzMyZWNvaCtkYXVrSXBmVW5BQktVUHlrY1RlcE9rY2ZKditP?=
 =?utf-8?B?WWxxS1JyWXlBd1h0alZxL01zQW1uNmtRb0E1WUljVnJZbmdyY0xSd3ZkbFhQ?=
 =?utf-8?B?RGhvOWVYRVJqUllHU2dhZEtMdUpjSGxjKzN4b2JtWVFXSW8zc3F2TEp3SGhr?=
 =?utf-8?B?cHdQd1g4TDU2Vk9HNVh6NWxXbkQ3YktuWEEzaVltZFBQN0k2SnBZSThjZkgz?=
 =?utf-8?B?WDMyY0NVRllFdHAxZmsxeHVOU25QR1pKbDJJcGFPUnpvejBsWHc1UFZ5eEt3?=
 =?utf-8?B?RjgvSEZjL3E1bzd5SGxXUHJCcnlGWWcvQ09IOEVVeGFaTW43d2hsWWdzVWRJ?=
 =?utf-8?B?aDJXY0JKVjBEdjlDNGJVYlBPZzhmbFBCTU1sMkZKMC81Tk9WOG1EUElWTnJh?=
 =?utf-8?B?N0s0WGRtaDU2aHRpR1Z0ajVONDFESFJOS2NkRHE0M2toY2lFZWtieGNFeW5y?=
 =?utf-8?B?V0NTMG9HVXBHWjkrUklONEhydlZRcEwwU2VSeFM2QnV4UGh2bGdaUGNLN0Zw?=
 =?utf-8?B?U0oyT0REUENNU2d3R2ppRytmMHhvUExzOHpPSGpyckVRU0U1NWlrMXZ1cVdF?=
 =?utf-8?B?YzZVMndvQkhLdGFlVVZET3FsWTIwajVNbEpHeWxHUFM3U204dnR2Nm0vUUpt?=
 =?utf-8?B?ci80Und3V0RITFdqbkRBUXByMWt4MlVQZE5RSVAzMHVpQ0ZVTkM4TWdVYXlC?=
 =?utf-8?B?K3lEOFl4M25mRlRXQnRpQ0NoRGFIZXhRbDdmcnh0TkVhL0JQKzBIOEdCekVx?=
 =?utf-8?B?V1FXOXZIcmxzWG9LZzJwdU9WemxVUWxSSDcwSHRqb3NSdVIvQXNpTkxLdnZj?=
 =?utf-8?B?eU1Beko4TXFrTTdidzZqM01uUDBSRnZUSFQ3M1JJajEyMVJMcEhCK0ExN2tQ?=
 =?utf-8?B?NWE0dkFqbXBBRFFlbTlwRGRNY1pDbGh5WkJkb0Z0Unk3eURrK0FMOWNNekJr?=
 =?utf-8?B?ZzlJVzZkMHREcWc3c1dramh4MkRvY3I4VnMwYmprZ0FwMndDVjB1NWtSNXM0?=
 =?utf-8?B?Mi9HSlVTL1Y2RTBvelpWRVRqUDJZaEt1VERjR0I1OGRhVnlFb3RBTjlnWWg2?=
 =?utf-8?B?cjR5ZHE0c0xkZjlLMW9Eb2lnaUJIREFqc25tOHZWNGowVjhhK1RrYU5ZK29i?=
 =?utf-8?B?VmNwL2IxVGtKbERiMXZvT1BtL3ZkSGVadHpvS0ZwSUlHeFJERFBVYnlkZ3BW?=
 =?utf-8?B?WURmcmI2S1J3MStKZGErbGhWaFBHOG9YTUZUaTMwU3FtOHRieFlDeTUvTmdh?=
 =?utf-8?B?enNuYlExeVBldnJqOExwLzEvOFhTNHp4ODMzVG4wR3pHUjBuUXgyaDg0NDcr?=
 =?utf-8?B?aXNhbW12NnBCTGVrWkdoSzBSMloya0ZWMWZ0ZFFkVmlPY1JDT1ZmbjZ2dU5Z?=
 =?utf-8?B?ZURpZWZRZzl2aitkYVZVV05CRXE3S3NtcWpXNkhFQmxwczQzR1hPM0p3aDlJ?=
 =?utf-8?B?YWU3RTlXNXVBNllVYndUdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cStUeXp3UzJBTmwxQXJ5Sk1GTXFaeUsxSlNUWnhNcE5qYkFSMVQvdTVITmti?=
 =?utf-8?B?MjNldzdBZWg0bHdCd24zcXZjVU90V2RPcm9CMUZaeXl6YlNmU3ZBSmVjdElz?=
 =?utf-8?B?TmdGUTNjL3FRUldibHBNbFRzdFc4eEFhWnVaNXFGTmtRaHllYkZIVjVvZXhG?=
 =?utf-8?B?Y2FuZnBJS2JkbjFJRktMNmMrcmNmSVRuKyt4WFlXTGZEWDNuRGo2QnVWV1pw?=
 =?utf-8?B?YlpEVjA3N1FPVmhxK0R6bHErckM4UGNIakNGcnRXNG5vdWs0cS9HNHF6NVdZ?=
 =?utf-8?B?aVhmUDlIbkR4N2JhNUZXTUtRcGs4REMzTklLL1duTk4rS2FCRkswTE9JckVP?=
 =?utf-8?B?QS9wNW5BNWs1OEpFOEllby9CQnNXbkJTNDVZYWttTHRObVRrdElhaGJNd1VL?=
 =?utf-8?B?aTlwMHV5SW1kSTJ1MUpnZWhQNHN3cVd6WDE2MWRNS3hqRC9JNURsK050dElB?=
 =?utf-8?B?K1luOXRwSGt1cDFxT0hDcE5YL1Y5dWJxQ2swblhXM000N0l6TmlGM1g5T2JN?=
 =?utf-8?B?TENZZVR2NllaRU5rZnBPR1pyUzlIV3FvcHNWRFF2cDVYQzExR0lFSW5jbm5k?=
 =?utf-8?B?RGtjVzRYalZ6S0dYUk1qWTlmVE5ZaHpUMjBIOXFMTVVITXV6NmtkcDF5SDJX?=
 =?utf-8?B?ekd1VXN4R3N3eGMxc2dja2pCMVFJMnl4UlBwQWV4ekpFNGtaNkcxWk5tK2dk?=
 =?utf-8?B?SC9lN1lDdkd2SFpGY0Q0clQ5bXJjTjB0ak5ldCs1aFdQc2didUlEZnlDSGVI?=
 =?utf-8?B?MDQzMHd6U2Qxd1Qwcy9jUVRVQjRsS2JHQWdJQW1OT2pRcDBoY2M4U1JOZ2dr?=
 =?utf-8?B?OEVSd3UvNXVib2xDbEMxMzRmRmp5ajlrMWRhalQ1UTdxTjZQZzRqZ3puMm50?=
 =?utf-8?B?VS8wMUFqdEE4MGJidjhlbVQ3M0paUHcrazEwNVRRRmc2cFR4T241QWtkcWVp?=
 =?utf-8?B?V0tXMXZOanJqbFBPSzN5a01GYjBXclFhL28rOStmOGorWk9SQTBSZmxiQWxN?=
 =?utf-8?B?anRIcS85UVNLSzBlcG5lRkpVS1BoZkg4cVNYc1pQYjhjOXptT1ZOa3JPMGdi?=
 =?utf-8?B?a1VqRkljd1pCQ3JpMFlic0NseUJDc0hXNDkvT3Y0eHl3WnB6eGNMd0lrS0NB?=
 =?utf-8?B?QnpXNkNUMG9oSFZHQms0V3VrNm5ZdTAzMDRlaTNCQ3JxME1LckcwWGJmbUpt?=
 =?utf-8?B?aExXeEFuaUZRWWRUellDSmsxaFpwd1JCb3ZPbDc4NVErZzdNc3BhaVBzb0dC?=
 =?utf-8?B?bmoyTVlmem4zUHRLdTRVUmV5TndZUWdZWmZ6dGZPZW9mL3AxdjYvTkdrc0l3?=
 =?utf-8?B?b3l6VUs0aW1jL2FQZkRFWGhUOGUxU1NJSk9PTFlxMEtLemg3MUovY0ZtOG9y?=
 =?utf-8?B?Y0NUbVIvazNhZktFTUhhd09OajN0S0pRRXVUYnROaXhMQi9EWlFpeGRON05m?=
 =?utf-8?B?OUZVRGlTaU85dW1WeWZoVk1Ja2Q3U3VOVjlUYUk1VUlHK3FET0pxZWNWaHpJ?=
 =?utf-8?B?ZDZDdFg2VGdTdy8zNDFYeC9zMjhwdFExb05DZEFNU2FkblRDMUNSVlZRVFQy?=
 =?utf-8?B?a2w4VCsxOGRnL21jdWtyM2M5ZmF6R1l3S2I1dUlyRmRmenEvdUc5NEZIdWxN?=
 =?utf-8?B?RlcxSlBVMkFqQ3NSU2FDNDh5NlluVVNGdDZjTWhtQk1XTVF3VnpsaThlYk03?=
 =?utf-8?B?Tm1QcHp6aXlvU1pqaUlzaUZZS1hxUFgzRk1tYldTRVdFU3BvUUR4aWdxUzZh?=
 =?utf-8?B?NjlBMzBIYlZXSE12Tk1YUjcwRUdFbkszNGxIcC9ITXByR0dNTGVyb25BN3kz?=
 =?utf-8?B?cVZSTEM0ZG5qaXl5ellnSnRBRUJRaXN5dU8xRGdhTEpya1dXUGZ6TWcybkpV?=
 =?utf-8?B?WlhmdEdyelhuRFBDUitVVk5Nd09Na0lkaVNJeWNHcTVvZDNObC91WTNNVGRm?=
 =?utf-8?B?WGV2R3BzMkZaY1djZVgvWmc4bUczekpHU3JZcEpDcktMQ05HN3ZrT3dNdkI4?=
 =?utf-8?B?MjliZVQ1Zi93PT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-645de.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 51735ea6-0c23-43a6-fbe1-08de67abb3a2
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:20:29.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3387
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[hotmail.com,none];
	R_DKIM_ALLOW(-0.20)[hotmail.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92209-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hotmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maud_spierings@hotmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_FROM(0.00)[hotmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,AM7P189MB1009.EURP189.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: BB67210C63C
X-Rspamd-Action: no action

Hi Jens,

Thanks for doing this, definetly not up for it myself right now. I will 
try to test everything somewhere this week.

One little comment:

On 2/8/26 22:25, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
> 
> Add the Purwa-based device tree, and change the Hamoa-based device tree to include
> x1-asus-vivobook-s15.dtsi.
> 
> [1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    2 +
>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1425 +-------------------
>   .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   47 +
>   3 files changed, 89 insertions(+), 1385 deletions(-)
> 

[snip]

> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "hamoa.dtsi"
> +#include "x1-asus-vivobook-s15.dtsi"
> +
> +/ {
> +	model = "ASUS Vivobook S 15";
> +	compatible = "asus,vivobook-s15", "qcom,x1e80100";
> +	chassis-type = "laptop";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
> +};
> +
> +&iris {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
> +			"qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
> +			"qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..336bd0c10992f2a60b384b247ae2219f75d8b8a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "purwa.dtsi"
> +#include "x1-asus-vivobook-s15.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +
> +/ {
> +	model = "ASUS Vivobook S 15 X1P-42-100";
> +	compatible = "asus,vivobook-s15-x1p4", "qcom,x1p42100";
> +	chassis-type = "laptop";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};

Isn't this status already set in x1-asus-vivobook-s15.dtsi?
It isn't in the x1e dts, so it would have to be there too if it isn't.

Besides that I'll leave it to the pros!

Kind regards,
Maud

> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcdxkmsucpurwa.mbn";
> +};
> +
> +&iris {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
> +			"qcom/x1p42100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> 


