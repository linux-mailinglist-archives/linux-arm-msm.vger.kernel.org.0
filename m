Return-Path: <linux-arm-msm+bounces-85472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40852CC74C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA765316716D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D9533DEF9;
	Wed, 17 Dec 2025 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="LPs5SOuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010024.outbound.protection.outlook.com [52.103.23.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587833BBAE;
	Wed, 17 Dec 2025 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969315; cv=fail; b=CSr6M4mfC+QU8R4vo/Pjom2+wqUANchsR0g5l1MzrBLcMQWMgiKwJXpimvwrJmjlL414vEMr4498tMMJDkMKGqmggs29/589vSCiQjIKvtI7vs3lpOFkkutgLsx21Ww+F+GXV5WFNLLljOEF0Z5EyQLZzLn7f3A70vBA9/pw/Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969315; c=relaxed/simple;
	bh=7MR7IMBy2XDZL56EWufK6Muvsuq4dEVizty9ziZTJ9k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kiypvKiWrwPjizvRlwWAxpK4BgTm2WnB6zQpg1QCidJESgcnzTPbtRBNS35ZBcq/onis8+T3EeTUPCEtRLKUvwjSUbmUHafRQ3yz0cIVkwdJbQdGwmgkL9ZF0iPz+vd3swAgu6RJu+87Oq1Ek7eJxW/TBNiFFlK3aYoA9ulwY1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=LPs5SOuA; arc=fail smtp.client-ip=52.103.23.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5SGtACNG4bvbg/tDH6IWfe7DeT9hE5xb2l0eew6Td8avtXjTpwjsUilMHqwSYyUUTycskjpiFGqMXsm7rn+un8PuPPEEDWhjtMPUtkDYNLvAaXXSPjZa3uvflyP35o3g0NeSliL/RhUm45THV0vhPL36TL8JyiHzK9+ajaK6nwm4n/6XXogsoWqefO23pkZi7Skwe8d9HBJtvbo8PqBg/w5rQVXmpqYztl53OkAXJgWZJfjzKL4yG1Wthxu7tUBuVj+ZvwuLbCOHovl8AiiyhyQZIETjiojtfOLpSWXg7vWdaYmW2yFqf4R2zaCW0Kpbkz035YvyT+f3Hob99eOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpmm4Hf5UUb+NYAQwoj3Zrdf25ZVY0iAOxu09p0cLyU=;
 b=fy3L8051LxhAFCE6jbd1QR8BGGLLOj4pn5wGI1tex4ue91sKyRrI3YPDpG8Hxsh0TPHlKHXOYTxTmiDg6UK7EemnvJIhU/n1YyoKHfCc8UT33th1sYsTZXx4dscrECB6jOdZiDYgn3A9I8zMLR0TX24UpdBk6wRDvwcGKdD8W65r67ooZlisCNtEiCoHmGnTWtPShEgw6RcKv6vK0SS85Dldl+5P8tt0X8wPvxMmptUAhO3GdWtuGMkx1+mcBEBtbPKuY0cliSUrVvkp3pIZueDdHSXGuDf2fMpYSu+d6z0og5ALce5SWE9qma8Df0p4j1VStrXs3u71G4TcF+BX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpmm4Hf5UUb+NYAQwoj3Zrdf25ZVY0iAOxu09p0cLyU=;
 b=LPs5SOuAqznUCkKOeoels+j5VcXpH/LggKAU9Gj7okn+B2hi1eLfuKSRd3Nrb5J7x7vedX76YyKMEr8tDJKz6t3xcBERKs67GMZdw70DI/+eENDKPvgD1r/ffuccGwUGk2CfznSpjtmVBwCQlJI9WVQc61CJ/RfvUEts64VWuujvQ6QhWfxT2P2o8fF+xtzGFQM9CoDnr8SZub6/oL2rhpwZWmn5BMlfqgSeU4EFWUsQm4prVdDvF65JYe33E7ZnFgw/lKUVQ/NgFoukWtL9AfQDy/iW8c0NHHxiQeOdaCCICUmNg9ezyXhnx4Wz0AMXHT8Paj0rNukHfjC0GwBAJQ==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DS4PPFA68F52737.namprd19.prod.outlook.com (2603:10b6:f:fc00::a40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 11:01:52 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 11:01:51 +0000
Message-ID:
 <DS7PR19MB88836ABB87B9858CB8EBCEFD9DABA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 17 Dec 2025 15:01:44 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Add new driver for WCSS secure PIL loading
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <aUKC5EuWRzsyrHnz@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <aUKC5EuWRzsyrHnz@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::27) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <4201f63f-823f-4ffe-a2ea-0eaa6cae75a0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DS4PPFA68F52737:EE_
X-MS-Office365-Filtering-Correlation-Id: bf460d6a-98c5-4468-c373-08de3d5bae76
X-MS-Exchange-SLBlob-MailProps:
	V85gaVfRD49S/pS4yJO2Rs6kXT7fKAkgpVKHSwpy5nCA/q8J+kZ5loiXFG6UiEk2ukDsLs5MkikwQ3RQjbbnGJHt3x3nZEQZPyanDN7oda+g6znq7UjhHIDqJ7mA02ME+x+/wbHJrTYkzy3eRMXyFdpNaN2I1bywjOmcrcSsbEzeMNMxiAhaCeDPBn/BHrk1LxLUNHiN/YYv8LL5n1xKQMNX20t6bqUHwtuxkrKE87BLH2dBIVrXM5aszVgi0MZF7nBcXZpReBlG3ZdTRbe3TujUaJZsvbwxP8ATmUXUQ72xDSXvLlR8DJmYPCwITQ7YKRcTjKFo9r7Zly5v6n+zMOFPrhJ5Yrh5d+cL1lx4yAzPRnuY0dU9m0eir0QrUS4HvSRkwSWugirLjBv25weBuRxneVsrN54WeFbEFpUjN/F7NQHwjqnKm9O+k/HxGoXbL3H90iH6lJi0uDnnX0XSNaNarOKgm/0VyiDz/eXsbNoqTEFo+O13ldCUgRha1TBox8KcT1wTuf5AP5Sa4jcmxBQpwo0TJPxmCm6mlytFGvzYLiqesSx/JT8J38/83939iR2LE4R6ADUV4r/1EKPr+xFzgOP8XINJOERuK/gg/yuRDnfpEVxyFalJ7ESYOY+Sl7eV6RCejm3xwzIGzeajVJIFjTV8yoKAJBkSG3YoiCiuNEiMrBdVFdfQLCZjfPZeqGVt8Qjuu9A0eZzpH4NWBfk6oMPiPxcSM/ukgG/pECernsP9dWNla4cdqge2Yx724G8kG1m5rW+WN1VsnUqPZTW7tX25tUJn9IjKsSkM6bPK5S5jIOBGOnm5PNMdhuja6eVQfwlRxN+wlStGoauIPQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|15080799012|5072599009|19110799012|8060799015|51005399006|23021999003|3412199025|440099028|4302099013|10035399007|40105399003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3RCZmJHNFk4Uy9zanhNazBSeEVzWTUvWk1hc3lIVmYyM1pYOVdyOVlhMnl3?=
 =?utf-8?B?Tzg1VUlhcWZlTnU4d1hUV2VUOGRlUWFHUzlJU0NFUXJBeStIR0loSGVjSllE?=
 =?utf-8?B?V3ljKzVuUWZRTkY5SDBGZmVXNVE4emx0TjdQQzhrWHhIcDhoNjBuYUVBVGls?=
 =?utf-8?B?aEpyU0VwdjJ2WnVkV2doai9PZG9oWHQvbUp3YWovZlh3Y09vQzkxN05Xa0pG?=
 =?utf-8?B?T041TWtRK0JveTZIOFlBbHBlRnRmdGpIQ3NwYk5haS9jQ09LYXdsK1ltcDU2?=
 =?utf-8?B?SkNOM0pWc1hCV3drcHlYMThtQjJVVzVXSU9RYkxyVkFhVDZHbjBHWmpqUDNX?=
 =?utf-8?B?bXBlZGptaFlQOE1RRUNNQlJXbHhtQzU1Slk0a3owQWpubjBhYmlEQXg5c1hv?=
 =?utf-8?B?aklXenppZ3RUZTFuZXNyMXFHR2krVTBMSkNBM0xMd1hKNEp2c3JMc0drVTEr?=
 =?utf-8?B?K1RoYjJ5b1JjWGhHWkI5YlZMT3BQN2NsSGtxT2lwdVhxUEgvZXg2TW9mbTBh?=
 =?utf-8?B?ZVlVVlZPVitvcnBqbjM2bVM3ekExMitOU3B4WDI3QVd6U1pFeWlPTVpmSDYr?=
 =?utf-8?B?V2xuZnYwcTc3TXkxeitLdzB6bVo4SG5WV3BEdGZqSWs0dC9IZ3ZaT21HMDFx?=
 =?utf-8?B?cUtFMURSOTRJZndRNnRWcjRyais3ckJDY0IrMm1Eb2dQTEJXVnRpZ0xuaFFx?=
 =?utf-8?B?MmRJWDJZbU5LY3dLUXQ4Ukx0TUFSamk2WFZrc0xFeUVseDlKNGlMOFlhbklK?=
 =?utf-8?B?TFUwK1prZ3ljSE8yUXozbUpscUVGeU1naGlQL29BNVFhOVAzbkpZdlBBSmJ6?=
 =?utf-8?B?dENqR2c0dzdRUDJ3YmdGL2hrL1dzRnlyK3h2SlJSb3Y5RUVmNEtLa1ZDOFk4?=
 =?utf-8?B?dXVmUlRwdko4RmJJVG1nZkk2SkVlaWhJZG1JZlROZGhnOUdyZERteUhtWFlY?=
 =?utf-8?B?OExxcjhCMjlLVnJrWjNrRklNOGZCL29jWXovWEtIenFDeGJObm5BVUNwVVJO?=
 =?utf-8?B?YmxaRzlaZ0UyUi9QMVVUUGlodjNxL0k5TUxzRFBORHRQWnk5QTB3dnhHRnhO?=
 =?utf-8?B?N2xkbER1NlVzTE05WURRRXBSSmJ6Q1RLRms3amJUNnJ4djdMclBaeURDUktY?=
 =?utf-8?B?TUJEMkpGNXdPenN4T0wxVkNLanMzc213UUh2V1J3YitVKzNxUUVUSWxMNHNO?=
 =?utf-8?B?eHhSQ0s5VmJXd29CYXF6SnVFaUYvVFZ4MEhReTROSmM5Wjh4RTdmdE9lMmhN?=
 =?utf-8?B?QVJ0WnovZGdDeTFIMmJLc1dPbDNHQStXK3lybGRCdUpIZ21TT0VVcDBXNmo4?=
 =?utf-8?B?VkF6SnA5czZKRnI1MEw2TFUrQWZIVkdLN3V6SlB5OEcyV1NwL1pnbDJvWW5N?=
 =?utf-8?B?a3NXYTFjeldxQXVmM0JNYmJHRkJYRHZSUHpaYUtiVE9qeGJaYitYN0lpWGd0?=
 =?utf-8?B?T2RBb3lIKy9JWnZHaVo1Q1Y3VHZ3cnY1V3lYb0Z1TEZTZXVKcExVRWVVSmpl?=
 =?utf-8?B?N2xBY1RuOGJyZkhtbnIvUWNlUVhueEhnQ0VGY1NYL1Vqb1UxblhMZVI2T3kx?=
 =?utf-8?B?M3VuZW5Hd2tKOWpPbXVGTjBBSU5RN2xTQ2RiNGlKY1lsZm5ya0ZZYW1OQ1Rk?=
 =?utf-8?B?Ti9oQ0NKbXhiWGJFcEtLVTJIcDNDUnZmN1Y2Q0dLUEVRREk3L0hpYW8rZ1ll?=
 =?utf-8?B?MTFjckN0RjB2N21YNmY1YkFzUE9vUXNIMVczSUxKZm5KUkhBbTczVlFJTFNs?=
 =?utf-8?B?eGZubEQvbDExdCsxN3FCU3VKQ2QrQ1ZwNnpJWUZQNDV3L0lzNkZ6N0J4VEt2?=
 =?utf-8?B?UnNKbnFiZDkycmtoL3BlQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStIcFRrcHdkR3JxRkdlUzN1TVMyNkdNQUdkNlp6VHBKem1uSnE4RlRtcWZ4?=
 =?utf-8?B?NlJsei9SbU9Icm9OUkpuUmNuOG9aL1dwV3Y2djFkV2RCUkVrS2x5ZlNCaXhG?=
 =?utf-8?B?QWpQc2ZBN0tvK0pXUktTK054alBnd2NMOW5Kb1U2MUlEazhRVEpUNUVXb2pk?=
 =?utf-8?B?VFpoQm1TeWZPaWljckY5OUVydTJTNFF3Y1JpYzl0cFJoVVZZa0VxZWdzM3o1?=
 =?utf-8?B?a0JoTlpZZzEyY0MraTE2bTJPY2szUzJ6ZjNGQ3p6Q1c5L3BmQjB1MzF3cm5K?=
 =?utf-8?B?dG42UzZBbUhQRWUwYVJLd3V5K2MraG9NcUI5NVg5QUZhZFhiNm40SGRyQkc3?=
 =?utf-8?B?STNCSWR4MHhISFQ2QTEyYmJyNXBrbTRGRHdUeTBvSC9RbDJxMVo1V3VKKzJz?=
 =?utf-8?B?MXhicXFPMTc3YjhtZFc4cFY5M0l4VUNzbDRwTDc3eUVNb3JVK3JZWjdHSnhn?=
 =?utf-8?B?Tk1rUU1CQnRuMTQveUx2dWY5amo3NEVqNEpQWFd4dER1b3pIbC9QQzRxUzJn?=
 =?utf-8?B?WThMQTB2SkxLRnp0NHdNVkhYRVVFUmQ4bkxJMUZvOEZRQVFHc3FLZTFIRk1p?=
 =?utf-8?B?aDE2b0xEcmNwOVc3OUJSWHRmRU5QK0xJcHM3SjFEb1lRNmpPRGpacUU0bzg1?=
 =?utf-8?B?aXRqUExkTWRJSm5VbzNBdnIvR0FPd2xCN0s1RVRpOE5NWnptd0Zkd2VGTy9x?=
 =?utf-8?B?YmVtRlFuOEZwbkphTFRXd1RDRUNqY3BvVkNiZHI1K1d0L1ppL1ZMWjg0QTlT?=
 =?utf-8?B?UnlGS1hiOEEzcHRKMC9QeGRWdXk2Z0lCQU9jaVVzVDVGWkQrOUw0aWNZYWtI?=
 =?utf-8?B?aCtrYzJDaEtJTFJYSDF1V0ZWSi9SQk5saHBBZVpQTnBSaTlaUUs4andpZHpV?=
 =?utf-8?B?aERWNTJmeGoxVVpleFYreFV0TlVyQ1piNXhRdVh6bUZTM2FLdzFGcGEzUGt3?=
 =?utf-8?B?RFJEa2UwaG12Ui9FbTE5bTNrTVU1MElZY2QyZTk4djRPMllnUitlQXhHVi9s?=
 =?utf-8?B?UElLTjhHVExiMWtjbHVCbElDaWVmd2ZwWkRyOGFDWndOV1NyWVFGZWlXL3Vh?=
 =?utf-8?B?ZHlZRHdEY0tCN3gxdEg5M1ZsMHdYQUpJOE9rYm9oUkpuQi9ZaGh6bGgzdDJy?=
 =?utf-8?B?RkczUnlqNWlLY0Z1aWJGc2p4elhtOVd5SlgwWEQ2Mzl6YXpnaC85SnVTdlpt?=
 =?utf-8?B?Z0N1cHI3NHE4UWtTdzdZa0xFN2daa200MUZuT2ZoZWovdHV6WWEvREgxVlNj?=
 =?utf-8?B?ZjhWcGZUcGNqSDRpMmhncHZyb3czVzhId0dTdEV6V2lIMW43RTRLZWhEbHZ1?=
 =?utf-8?B?ZEVUTE55b3UzdStCaWh2dDR0NDJwdnhoTFllMDZKanFaSGl2M250ZllxaVJK?=
 =?utf-8?B?V2g0ZysxRG5PN1ROTGxITFpVZTFuZVA5K1czSmZEL3pCb0MvTG11aUhkakZt?=
 =?utf-8?B?WElkL0NCR3ZXOGMvMXJPNVNXRDZKOFpnMFo1L3VMdTVVM2dQTkNxTmJuMTJi?=
 =?utf-8?B?RnI4eGhmaU8yT21UWlR5aVIyQlJpT1FUV21maDNHVUZOVVp6aXh0OFhrVzQx?=
 =?utf-8?B?Q0UrV0dlUzFraHphdzd1NTVScVZ0RkJ6ejJlaFdiQXc1ZFJhQ3ZrVGZ1ckhI?=
 =?utf-8?B?SFhWMzE5UzlLU2x3Q0FDa29GdlZlUGtFYitub2dBOEpCVzNaajRISlNMUUZ1?=
 =?utf-8?B?SjcvQWltL2pYYy9OYkZqdjZnNWlKQzlsRERuY09UUVpHTkYvV3pVdTdjYmdl?=
 =?utf-8?Q?dcT3VQje9USxs5R4fCNv+ZA55nLXIP5hDXN6tbr?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf460d6a-98c5-4468-c373-08de3d5bae76
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 11:01:51.7534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA68F52737



On 12/17/25 14:16, Varadarajan Narayanan wrote:
> Dmitry/George,
> 
>> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
>> I've resumed Gokul's work as the last submission dates back April 2025.
> 
> Thanks for following up on this.
> 
>> This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> Since Sricharan's tmel-qmp driver is stuck, this patch series will not
> get merged. Shall I drop the ipq5424 related patches and portions of
> code in the driver and post a new version so that other SoCs are
> unblocked. Please let me know.

That would be helpful, yes, so wifi can be enabled on ipq5018, ipq5332,
and ipq9574. Sricharan can always submit a patch down the line for
adding ipq5254 support. Are you in a position to timely post a v8 or
would you like me to drop ipq5424 support?

> 
> Thanks
> Varada
> 
>> - Secure PIL is signed, split firmware images which only TrustZone (TZ)
>>   can authenticate and load. Linux kernel will send a request to TZ to
>>   authenticate and load the PIL images.
>>
>> - When secure PIL support was added to the existing wcss PIL driver
>>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>>   This series adds a new secure PIL driver for the same.
>>
>> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>>   reposted from [3].
>>
>> [1]
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
>>
>> [2]
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
>>
>> [3]
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> [ . . . ]


