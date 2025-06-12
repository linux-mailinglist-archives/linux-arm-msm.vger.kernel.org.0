Return-Path: <linux-arm-msm+bounces-61125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F539AD7159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 15:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06E61BC7681
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 13:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A490A23CF12;
	Thu, 12 Jun 2025 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pvPqaDaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2066.outbound.protection.outlook.com [40.92.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569B23CEE5;
	Thu, 12 Jun 2025 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733864; cv=fail; b=tRSYCTSzPWXDzNn/xOd/gLjEPtA10S4cAY5AwsnktylYOYlK/K/4XRII5xchD+ZKHiwTYm+Uo4wHvAeJoRPpeNA8JI5MpVI11DSkxx926qfIenCEEzLOfPzJJdbeSGQDHCm4Tu2e9chGDhL7fucJcqAC54gDXrohSo+ffJk4cUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733864; c=relaxed/simple;
	bh=MSreklj9uhNRgsWlk9VY//Ue1TwD7d3ZsG5R6DaH9lo=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JyV7v42kIj3L+hrig/u7Njdy5ADyRsh6YMGi6i/E7wj3d4YQN0mEiRw7snMesxGEDNNTExzW0YzEXBU0h8YNxI8zJIJlH4jhaKIgfWTQgtKRMU2EZX36xNc37NI+Lr2lkXkn0Ioh+k0ZOqlVqhIhTFCgvMo0MR9J3kySJsQW5RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pvPqaDaP; arc=fail smtp.client-ip=40.92.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZWUHUog80ATgk52IwuANStx1zQgnsplePZV8OJtbUXLDy8K47yC9DmmaLusfit+CjJEVYcrKQuIZ8xrGD05aGUq7xY7eHFpYeR2yuitHRmgjoVTB5Rh57Nuip0BwV8828EWrnSKAnS1nWuGSwSmm4AowdQFFMipnMRsVXW1tKOmZ6dzYaBBlXy0Q8Zs1Dy6P3g+W/HKHNbItIZZa3wl7EaOx3SHOkC+Pw0tNtR2LawgS5eEen52ITi4Be0q/P24R0Ym3k883ykxKFG+/mb9cLE8HfemcBs9aPWmqz9Nkq4x1YOlUN4ec2scSGGqy+GITvvvg+Cy1piKSEE6+g2gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me4uLKHlQ7RdA2GvdJGFjvddpbNyUj9Bo4TU8ZRv9ko=;
 b=Sx36KkDEXd90Ib60uD8lJJ+TCmdSwYmq4f/UwGDksfrSmdKTA3foGzsM9dgsge9SN1pntoRv+Fy/cKERopiRGqWFdbt5bZSIKS8uuPbYr60VXfhdmnAr2hqkcNDALgv4qCYBiYyQoMPWnYKa3KBQLLADsEmvzvF6mPVMflK4UmDpmDjfkLRyfz58PZ0KFEypVvlnkShBJ84HgpOvE8UsMKvNILRstNqwwcIaM/PJB0buvjydgwInJ9t9NPLtiCl1cLfcrUpFYi0yWIG1pthK2xuTRqAjTI7PDwHgZjJ127fPH8ZMLvyF04w5hIO+HQvujZbp+Zy3DEWJpDRqpH6jVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me4uLKHlQ7RdA2GvdJGFjvddpbNyUj9Bo4TU8ZRv9ko=;
 b=pvPqaDaPZXf/ocpnUnPGc4Na9NCy5b+QDbnsmwe1Ft5Wf4tyYFnrS/GIXuJ7fANVHNDsgJdG8VIzi0a0JJQ2p8DjgCbcrUseTOHBmU5qDREjZmlzhxnG+lNI7yoMUhHEh9wnNAMDD+hl/jHqx6xMP0SSyh8XLDGef/rJm3S1ay6KYyO6ayv97tpvQki9ebSxDhmQWYopuNM0hW5Kul6w9Gl2iLJMr8uIwtSMrS5VRaR2pNDBspkOXmMniMA6BouwMg2P4tnCFI36BnkjPt2Akx9oXPbuIXe4oeohGi14wT4FmU/yZyQriuyfWpiWUJpfSaDjXxP2aAp2Z35tU2i+RA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by DS0PR19MB7396.namprd19.prod.outlook.com (2603:10b6:8:148::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Thu, 12 Jun
 2025 13:10:59 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%6]) with mapi id 15.20.8835.012; Thu, 12 Jun 2025
 13:10:59 +0000
Message-ID:
 <DS7PR19MB88832FBD468A24B2B2C4AD609D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Thu, 12 Jun 2025 17:10:47 +0400
User-Agent: Mozilla Thunderbird
From: George Moussalem <george.moussalem@outlook.com>
Subject: [PATCH net-next v5 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
References: <20250612-ipq5018-ge-phy-v5-0-b5baf36705b0@outlook.com>
Content-Language: en-US
In-Reply-To: <20250612-ipq5018-ge-phy-v5-0-b5baf36705b0@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0037.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::19) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <10a6a010-4b14-4acf-944f-c23f71221310@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|DS0PR19MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8ca4d5-2ac0-46da-633b-08dda9b2925c
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXdA/joONLFXTlfxj2poQ4OFiFP7HN6OC3rP2IlEuK50xE1aiPe5TBxHbYboP9aaV48lBc8i1sdAh3+ZTI505/oMf0vY4Of5MY71YtRb1Yig6NS34lnuk/YgdOySvqROljcbOIgpuwVSMSEzkaBzms6v/NPM3oNIoDDoNx5nIXK1gwdtNx5dgQnpFpVTcCu/iEUT78mTa4GjG+V8u5y7N1Ne8S9ud+ovvtzbQmLv35awG1e9x5QUukk0T9CV9/LrSbVSNfrOMffUTsaELOQsfTPtf66Mq9paUx/6VLkO/OgifDP3tKO2o4kpuV9Ai9HWOwKgt3qGOhEKJI4Xw8Sced6HiPMS7qKYY123nAXQ7e8XVlmu7L8yW0SDhUgBf8nQv2NiiXk1KFHHqeIMubI3MRHSETKYrDOSrwE2XyHm7G+ppRBCN3yFRwvdvpWBjOr/Pc7pvneEzsrYL2zWK/Ry1pYqay7Wx6ZvZkTbtTj2QnzhqTzT92aAgastfmkc36+Dj0FODrMUoKPf49pvTBzltmtjEeZbWUP/whZETnQDFzgA5Q0kxfHlM0QwyiMKdtVh3SsjOJ9Wom2+MSBs4tkjiRkUmd73muO0OALLlHenDs4ZBQJrn2r3d0tK4yZIreiRc4c0KKefmf17kv8Vq93GDTFJhwY3EhdT4OS6orKUst+dDGtwD+VQpWLtzLqHPuuLrhrumj4ZcxBOEBsPS8zr6EgaKRre7EXEkU8c98H23bUcL9wMsqBCVsgp12TpmQda7A=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|7092599006|15080799009|41001999006|461199028|8060799009|19110799006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d002T211TEdKZXd2cnpuaGVtMGIySHlPMW9hNFNFVG0rMmMzaWlFaXBjUzU1?=
 =?utf-8?B?dDFjT2FVaU9JVlBQSTlTcFJpZGhSNFVhU0ZmUTJkakltZ1VkNmtHT0pjdFVV?=
 =?utf-8?B?dG1KczROU1YwVk9IdnRBVEVSdnllVm11a2hYdDExL3FTN2xMYitEcUhaMm9D?=
 =?utf-8?B?bmhFNHQwclZDTGhiK1JZSjl4aUhrSWp4ZWJKeUxScUtidDgvUHRGM3F3dVNT?=
 =?utf-8?B?NUY0OHV1eG1vRm82RnFFc0wrNENjYysrOExtdno0elI0SW1vc2RNNXlsSDZw?=
 =?utf-8?B?UTh0WTdiU2h5b0NZdFMyQ2ZNSllMeVdnYStzVHR4T2YvSTZNY1RwRUx0cTVh?=
 =?utf-8?B?alRYMTRlYUZ3MlcwOEUrTDM5bDhkLzhSQ2VGOXlWZmprOTZwcFpieTZ3ZTFX?=
 =?utf-8?B?Ym5hRDduY2ZZOFV3ZVNpVmNCdVpmVVFFNkg5SmFxTlpoU3FOSmV0NUdxL0o1?=
 =?utf-8?B?TTEvditWeEovTFdZNjhhTHdsbFo5ZmhzZUVzVHZBL0RvcXk0ZjBYVlpUWmR0?=
 =?utf-8?B?QXpPUko2RE05UGFSeTliYUw3OVlQN0dtaVBwUm1FYU5welIxRTJMSjVuVEF4?=
 =?utf-8?B?dVV3dTdJR2k0MW1UQm91N25iRDdOMW9KcWdsaURnYk9oZXliQlIrTU9VdUFW?=
 =?utf-8?B?L2RQZTlGbHpvZ1RwWFZDcm9udk5TM05iakQ0ZUYzNHh4bEpjN3JzN1BaekJO?=
 =?utf-8?B?S1NTMzFMZndya3lsWkFzZmNaNitTd2RUdElhVS9aWllZZS9EeStHSEs2WGhw?=
 =?utf-8?B?cVRqSVZITlpEMHVTM0RhZXZPU2J3WVpzMG1WQUFaeG0xMW50MGs5ZTNPejNk?=
 =?utf-8?B?S25QZmdPZGpYdmdYTWdxdXI0c2tOeW1rcUtUa3pCanRyeXhQNktiMHZ1T0Rj?=
 =?utf-8?B?TXlSZ2xGVmpaTURZTmYzSWxIb0hET21SSlpDSWg3M3lHZUxWUVFhNlZlWStY?=
 =?utf-8?B?U3B5d0E1aGJNZFBOdWdKTStqT25FN3B0SGFqaVRCNXpOZFVnUEFSTzlCa3Fo?=
 =?utf-8?B?SEpIczRiNWZVV3ZoYm5GYm9Kb3M5TTZjRWdJSzd4UmYyQ0MxczY4bzk2NGgx?=
 =?utf-8?B?NTltK0c5d1BJWFpoM3BtRi8yL0RMb0ZicTlpQjVaOUVxa3pkVVhXMlBrV2w0?=
 =?utf-8?B?T1hNVkN1NStVU2kzMldLNGc2alZuS2hmQU1QdHErdTVQNVRoUHkrcmM5dWJj?=
 =?utf-8?B?aWp1emxLVjRkU1FQajZTRlltdFk0Y0ZkazdNUzBFVDJFTTlDcTZZYWtDME9s?=
 =?utf-8?B?bCt2U1ZzV1BZKy85dkd6dE15U1JHby8zU2QydEpuNlJaVHNmSmt6UTBPZ0N0?=
 =?utf-8?B?Z3lPa29ZUFExeFlubnJiZG44eERxWWtCTFZjMFo3aE13cWcrOUp4Z3plMHdP?=
 =?utf-8?B?Wkp3ZkxqVEhjdjhNYTZTcjFpSnNHRFhzYWs0RGtFM2s2dW5vaDlTRFVHcENL?=
 =?utf-8?B?K2NZQWdDWTdiRzhjSGNrSnFoSVRTN0ZWTE5RaGZNQ1UxRjNvREdpc0hid1BG?=
 =?utf-8?B?bWR0dlNhQXhlaU9hanFwdkNwSXZXOVNWeXp1TVF4aWlaMVhJaWloSHRxZ2hi?=
 =?utf-8?B?R3lXWStWK3BqTVF1OGRjUEdmZ0U5NWJqQnJtd01wb01BVnB2RHdLaDZLSk5j?=
 =?utf-8?Q?kJs3DvDpNB3P/GizOE6C3dprC5nnnScwfJp4ideM5bmA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGxVdlN6bURvb3p6c1YxSG5jM05SanBWTDhUdk5KZjdaTUJaUStjTUcvWjlQ?=
 =?utf-8?B?T0xBWTUzM254YnVuRmFjN3h5ZXRqSUd1Tm1MQU10dVZaYXZHcU9iVFJBYW5q?=
 =?utf-8?B?bmhFY3JFaGtKVUxvRVcxbVJleUdXaEkwWkhoQ0UwUjF5U004c0pvUHlqeFlK?=
 =?utf-8?B?Yi9WSER1MXRBZUkvYXlDYnNSYlpsOWlpczlNTzdNREdJb05NYXhZYmJCSkpZ?=
 =?utf-8?B?NnFaZmpBT3huNzFHOGMwd2M1V1kxK1ZBaEUwNWIzUmVRSXNweklPMUFabk9w?=
 =?utf-8?B?OWlGeWhFcXdadE95ZXVybm9qY21BYzZmTzBId3B5VER5UnhPcXRDUkR0QXdO?=
 =?utf-8?B?VUduN2JyYjNOUkZkcG5GMmt5cDNnOVBEeVJuY3hWT1diQXgyV3M5TVVuUERF?=
 =?utf-8?B?Y29UbldxVHUrakp3U2FlQlU5eEdpbVdRSXY0L2xwUkdPUnM0NVMxaXlVYlpZ?=
 =?utf-8?B?MUp0WUFqdnZJOE5RNU01Ukh0N3lXS2Rid3hybzFHMU1pVDllbldCOUxWMGsw?=
 =?utf-8?B?cGlJLy9xWnhrSzJNM0lCVlMvTldjMmlOaXpXbXFzSjVNWk4vWnAxZjRXVFMw?=
 =?utf-8?B?MGI4UFRVOFlMNTFHT000a1hGMjduU21TWXY5UXI3akRIcWpmcWZoaEw5cGJ3?=
 =?utf-8?B?M2wyOFV0K2RnUW9wdUgyVkRTQ0tpYWQxWXlZNUI3K2ZoVWdLVHA1dFZYMzJG?=
 =?utf-8?B?SzhsTC8wR082MmcveUQzcDBhSkpJUUZmSWIvNW5UMDBoOXZqTUFZNWhZb1ps?=
 =?utf-8?B?eG0yNkxqZWdlZCtqTVkwcFFpaUxZazREV2xldXFyRW84VXNwWVBIVGlJdW5P?=
 =?utf-8?B?V2R4SDRiM0RScHllMXE3QjhnR3NzdVA1WUpUUmVSa2ZiZDhaOXNTR3M1TWpE?=
 =?utf-8?B?dnYzTitSUHdBcEplZ0tFTnFUS0xLSUsrK0hSTlR3R1hqTm9iVGlGOTJCc0tI?=
 =?utf-8?B?dGNRN0R0NGZJa0lMY2dPdmxWZmFCZUkyOVlKZC9yRXdXRU9STXBNa2Vpc3ZQ?=
 =?utf-8?B?VmNGdW0wcUxINENCZWR6NExJejR4T0U4NnMxODFTZkRtSTNob3FoY3BKMVJR?=
 =?utf-8?B?azAydXllNEZBT3IxR3h2VVllS1lNNlQ5OTlGZ3NjZmxvOUllVUV2Kzg5d0N0?=
 =?utf-8?B?MGQ4R3c3d1J4anpmV1ZIb2xZT1Q1NWxQRzJDVGJ5VVF6UjRQTllHOTJiWWNK?=
 =?utf-8?B?QzlVbDF6WDRMZHR6UmNjWFBuYWg1bU4zWjdxR3VPYndJYVVZUHI0UjRKdkRQ?=
 =?utf-8?B?MzlxakJnQzJkMW5LNW13NENYaTlrMmFYZUZpVWlFTUhsbC9QeTM3U1pyeVBs?=
 =?utf-8?B?UG5uWkM3WmdWWnFnNjZMT3pBeFhpNTNvM0kvYU5VekV4WllWREF6VXY0Qk9W?=
 =?utf-8?B?RG5aeXlqMzc2MU5KamlTMDhYazlJT2h6S1dUYlhkSi9LZzZuV1RtS0NOZGNY?=
 =?utf-8?B?MDJEazBCRFpuSmt0dHNpUFNKMjdCNzMrR1ArRkZhRjdnNEltc1lzd1pROXdB?=
 =?utf-8?B?RFM5bWovZHBCZC9JcG16dlJyYlpUcUVLK1B5N2RnNlR2a2dEU3NqQUJ0RmVn?=
 =?utf-8?B?S1dvZ1BZeGttckFDL2hiU0FLY0ZqOFFVVXJzdkFvZnc5NU5hS2UwQ1Z4RDcw?=
 =?utf-8?B?ZEdXSlV0RmFsTzBXbEExZlk3cEdwTG15Yit4N3BwWW1ocDQwZGVia2xWdHY1?=
 =?utf-8?Q?WrwbQM4b8KEvNhEP9COz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8ca4d5-2ac0-46da-633b-08dda9b2925c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:10:58.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7396

Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
SoC. Its output pins provide an MDI interface to either an external
switch in a PHY to PHY link scenario or is directly attached to an RJ45
connector.

The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
802.3az EEE.

For operation, the LDO controller found in the IPQ5018 SoC for which
there is provision in the mdio-4019 driver.

Two common archictures across IPQ5018 boards are:
1. IPQ5018 PHY --> MDI --> RJ45 connector
2. IPQ5018 PHY --> MDI --> External PHY
In a phy to phy architecture, the DAC needs to be configured to
accommodate for the short cable length. As such, add an optional boolean
property so the driver sets preset DAC register values accordingly.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/net/qca,ar803x.yaml        | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 3acd09f0da863137f8a05e435a1fd28a536c2acd..7ae5110e7aa2cc97498a0ec46b67d8ed8440f3f2 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -16,8 +16,37 @@ description: |
 
 allOf:
   - $ref: ethernet-phy.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ethernet-phy-id004d.d0c0
+
+    then:
+      properties:
+        reg:
+          const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC
+
+        resets:
+          items:
+            - description:
+                GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.
+
+        qcom,dac-preset-short-cable:
+          description:
+            Set if this phy is connected to another phy to adjust the values for
+            MDAC and EDAC to adjust amplitude, bias current settings, and error
+            detection and correction algorithm to accommodate for short cable length.
+            If not set, DAC values are not modified and it is assumed the MDI output pins
+            of this PHY are directly connected to an RJ45 connector.
+          type: boolean
 
 properties:
+  compatible:
+    enum:
+      - ethernet-phy-id004d.d0c0
+
   qca,clk-out-frequency:
     description: Clock output frequency in Hertz.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -132,3 +161,17 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ge_phy: ethernet-phy@7 {
+            compatible = "ethernet-phy-id004d.d0c0";
+            reg = <7>;
+
+            resets = <&gcc GCC_GEPHY_MISC_ARES>;
+        };
+    };

-- 
2.49.0


