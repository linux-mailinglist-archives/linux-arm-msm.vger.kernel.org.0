Return-Path: <linux-arm-msm+bounces-60061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6EACAE73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 15:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2A417EA16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 13:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71291CD208;
	Mon,  2 Jun 2025 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="K38IspeV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2051.outbound.protection.outlook.com [40.92.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2E20103A;
	Mon,  2 Jun 2025 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869351; cv=fail; b=D3GE16b+Fg+yMeKf6jbgdQXLAHbExWnk04bLMXaeeXfXviPg51YHSaU4UVuWAGqz6Cqlg5yV/+nUnRZdlUKPkvb6Wwj+c0TodTkwexKL6v1x/oro20Pxl/aLBtRsbqUc8FWLdZrXDEdM+1cR67gN6HwVexYC7kp/ZXgWtDNAviI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869351; c=relaxed/simple;
	bh=ZelE1w56P1qnBGRWArylvO9Lewdw7ibV6z4aJ0qLNBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cZbcmb7y1VwDBboltVLDmC+jD5W4FOcAG2ebup1pJJEDDtuI4YRBcxJnO+nX2yc6zvL7kPBGOuXRz1uo8uhUV76gHFDaH+XFoHWutgtsuMLY54M7Ymc/SthFqYkcMuq7fkdhV4shVq7rvh4CNDYyGHoCvgXPq6JRB67slV3KUkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=K38IspeV; arc=fail smtp.client-ip=40.92.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQ5EecKJwGxDf/MC7aKwkI2zHcy+mS8sbxFCXbPoKC85ltUCNN3+WwZU9BNDpdbPS0IfyOtNq+0mIaEyiptxi8VP82IzK/znTYUO01tnGexo9CZI9Od/8aSfCeW+WJg/c8OOQKTj1Ccj/B2DPEGOIFZ3P9HemjSAMK2qkU8Cwf5mvhAmEJhnjU/u0ZMTBxQ+Bs4V5EhjhVn99Z7ID1GTM1Gl+MrWiEe+7wj53aFZtx++SyFMYw8ldnUSlHt5h0Ro5DsAZgdd1+YPozb26Fc7BRU3yaVrtuq8KmENhz2ntMtfNm2jyWvfIS5lSvXQ4eKefO5GcBJGICXzoF6IAa5Dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKF0Sk8hJeVNd6Ch4mblL91Yg7FDI9vgbOrBt0lz7lY=;
 b=xsaN0iIeuPuiIQPtW7MU/aaNsCP9p2+/iFigIyEepE1yJThMbwDomiHf4Ze+efsOe4+i+mUvjQ/f8OQkWrqkCPTyEHeLMojbAVAvfbvFUyd4SFiHu6CQBC9mgyj3HkUFvoI5A5pVtDNT2XMdsvCVgALp8VxgVjnm1UMdtzB0oKup9RLL3wEjmt5TpoO7jpoJoMjQ3H71HD0bIkssjs5UP/9gqIAoppsyyCO2hJ2e62vFqsGEVifPwpZ+D/kPM10qMgXXCxSL84M4oZi6PznVbo8UnMase/ldooQNyG0id2U2LZbu2ffepqQ1mXJn8aNEkGjV7IwUz3+1KnJTdgtncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKF0Sk8hJeVNd6Ch4mblL91Yg7FDI9vgbOrBt0lz7lY=;
 b=K38IspeVijo3slL17ZnZPDVnTx4qbvlqp/vHRT3C80am3G3IlvqdIqswnDlmHafLmQMCHW8dLS4Rv27cRQxEi2VmHwlatdz4a4jHEVYC8dCJPQM/32cJ1ptTElPid/m5HzKVY+6oZ3xNpIX2mzOLmtA+E9fDbDodvuzR3V0h4l5gbqbUyUO2eKw6+LaJ+UngohLI1ZOzqDBYPeX+X43xkAt2xOFDVFn1DHrE0c6HFJDe6fYwi0ipQCDufmhsU0/NOjQwbjRmRlkCzzHigZOhGSgn079VwRWcPN7hArZdaeNOpNs7kDPMmsOFOUnwAZgOMnOUfbTph9h/nuBGUrU9xg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by IA0PR19MB7726.namprd19.prod.outlook.com (2603:10b6:208:3de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 13:02:25 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%5]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 13:02:25 +0000
Message-ID:
 <DS7PR19MB8883B6501250F67CB83415BD9D62A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Mon, 2 Jun 2025 17:02:12 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
 <3704c056-91b9-464a-8bc8-7a98a9d9b7a7@lunn.ch>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <3704c056-91b9-464a-8bc8-7a98a9d9b7a7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0010.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::15) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <a1ee927f-21a3-416f-a475-cf2b5fd38d56@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|IA0PR19MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a79628-b433-4d7c-ac59-08dda1d5b7dc
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwU48+6BMUBCVShhcMhCQwtQ7b4wU3799Tn9tonJGYdKf7e+Vchm2pUL/cuX3FJO1ooeMmuPAJ53hH7QV3RJ95bCTQo95pOAzR6QK8SW6AY2Bzg7zoXDL+nEeN6uUPSrDme5D4+RIK/0L2sS6zBJpuC0NrmrCRR/Tja73XtbtSFDuqMXxM0bNKmVM2SkKCOswrmCMQRVYxoZjqdPKCNAH92PZHfJ0htyYPgeSEBxFCvLKp1wxWA1OgqinA9196j9O28FN+FvEf+1f/YqHHun8eMsHI5FzRZygyhNZTcE6Nhm4StLDmbSnS/YzfoFRleDcajO5LVQZvQ2hIfJTSNMLLLWJn8df53neti6V5lj6oH2QBxaXS9KfWKU9h4H9m3IyX2BM+X8ktZyAtpg8gOSy74aJlkHo6/y4UrmFiCPLfx7ZdcvE9JgFQ+Rv3nRH8LRRsP+NDKg/+PLgPodMLFaL+eupV/TM9QhWGYf1jORFe206QPAUVrYTYBjIiR89W7Ua0dWnEuVCB9zJGiEwJEY1eensVt9nb9YqEsueyiK5Q9C7Rz1J0PP2a9H0VLrD6MF85Ql6XpOTx+E96OkdYZp4HWMwrZ+rV/y47a95Vor0oExtXSrQdSruWOH/sgXB136W2vcs3gc5Y+Qay+yHfYcrgWmMonwJw3drklzlQ3UgJO1tgOSGJ97q/LlymaR9yx8WQIa/xC4GKmpRPqE6whDVPx4gFijWxLnpgfDzHija4MBdTPqETw6mLps0p01qRurGmk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|15080799009|19110799006|7092599006|5072599009|8060799009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cndGK0ZEMVRWeHJSdGpCSkVGV2U5a2MxNENDbml6WktaKzBPRDgvTmJjY1dR?=
 =?utf-8?B?OXgveFF0cXJRMTFKNlk1aVJWUFBBZ1JkL3QxRHFEekoxQXR5Qlp5ME02U3ZW?=
 =?utf-8?B?Vko5TCtoRFBjMDRYUkxUWnRzWjlPd1JYZElVazByLytmaWYzTXUyTVhRNThl?=
 =?utf-8?B?Y01OdmpFTzBLL3N3NDdqTlZtaHNmR29sRWM3a0Y2RGg4QVd1MkZiV05yMmNa?=
 =?utf-8?B?bGhqMDJhaTR4WE9URU01bmNxS0RibjFUdUFZOW82aGVtb2k4TXFsZTYvMjZl?=
 =?utf-8?B?RWxnSnpZTU1VcndzUzJxeERmTm1QajAyV1RNcTBJTm9aNzZ0L2FvT05tMFVl?=
 =?utf-8?B?WmpFUEZnTytsWGRIeXdnQk1IdkhZeldJZXF0Y1piK3RGMC9yUFdSZHNUQzlw?=
 =?utf-8?B?OFdqeG93WEMrN0xqeXNVOGlyRFFjVGpIY0x0ZzdhMXArWk82empCdWJnQVZr?=
 =?utf-8?B?ZW15SVFTSXNUaWorRDRRYzltR0JFZ3NpdnU1TzIyV1RFVitKcVR1YUFXVkdn?=
 =?utf-8?B?Y1dWdEpxamZCYm9leVJkNzhwbTVzRGpJcWRib0NMbk9Db08rem1KVG5aMUI2?=
 =?utf-8?B?WEtYSUJVUXBTOXI5Vndnd1o0SGVsalVUWUhlOUJ1V296S2hrN1pDSWcyZGYv?=
 =?utf-8?B?UWpvZGNRZWszN0ZQalpNUzRhSDFaYkpJRGtBRmxuOFdhN0o3K1ZqclF5TUMv?=
 =?utf-8?B?ZWdmS09EUHJ0WjVZbEE1SlNHZEdrN2JCZktxam1HTkk2VUxHOTFUZkRkMHVP?=
 =?utf-8?B?czNtSmw4MVVhcW8wSUpSS2R4RE1SOUszMy9GeVpjbklqeGlub0xLT3M3bk9n?=
 =?utf-8?B?QWRCNjhpV0JwdUFMWnZQNUZibndTRWpnN1B3SXltTCtRRHp2OVJpcW4wb2ZH?=
 =?utf-8?B?ckxFTnQrcVVoeHJBSDJYblk1MkdYQVMzMlJONkF6R2NKSThFNGNwUlFuL3kw?=
 =?utf-8?B?MzJoYWx2ejBPaVpvdyt3cHkrN1d0MFlNa2poMDk0ZUc0eTQrbGtmUHBZOG16?=
 =?utf-8?B?TWM5dmJJS1dxdTNySGRnSDBnNHJSZkFhTzMyQ01oVjQyRy9hNEh1bzdXZzkx?=
 =?utf-8?B?a3RRMEExbEp2KzFsSTJBNkpWYU5XVmQyWGhndHFRS0p5RENUOExzdUVzaXBN?=
 =?utf-8?B?RkYwWU9oUm1LMHQ2bG1aWThKb2pBMFA4aG9HUEdBdmNCUW02M082L0VldDhV?=
 =?utf-8?B?S1NwN0gzS04yMVdCeXlRK0V3eG9oWTE0dlppN09tVi92UGZLNGoyZ1lXR0hV?=
 =?utf-8?B?ZmJENTdFMWNwZk9vNHJzQlllTWhPZjN6eU9TU1VQcThIVTBvRGkzZ296YXk2?=
 =?utf-8?B?dEQ4WUtHaHZYQWw4NzY3SnkzQTI0aThYY2V1aG8wbEc5elpLTllTVytOcGNU?=
 =?utf-8?B?VWdSSEI5Q2J6enB2eS9lbVJqYTNmTCt2QlN6UFhtOFRDak1yRDU4VHZuOGht?=
 =?utf-8?B?UXVuOEpUa1lZMCsyVW1WR2tuNTZKdjRrYTBKUFZDNG9tcWpZVlVwTUxESVVG?=
 =?utf-8?B?YjQya1dZRmtpRXZ1MzdOMVhsb0NrRjJSelJ4MENiV29MTVFuWDhYR05hNnQv?=
 =?utf-8?B?OFZZdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlVqN1hjZ09lcDFuSmgzYzY4dlJHSGlyaW9zRzVrNHordEpHcWlKYUc5Lyt4?=
 =?utf-8?B?QzByaUErbG5ESFNmVm9pVmdNQ01XWlpMQXJNcDE5TEVFQk9HZWl6NXUvUlNB?=
 =?utf-8?B?dlh6UTNmdjBzbGd6RmNXMzFpeHdkSUZEL3VjTjYxbVV0dm8zOFc1cG1XVTcy?=
 =?utf-8?B?TElJbWpScHNVdGpxLzVnck9BYjlidE10WnlQMDIzSVRwZE9UUlgvaGhYV1Zi?=
 =?utf-8?B?UkRlVlZuWlFGOTBDKzNJdlhNTWd0UWszOE9BUnFId0I1bDJZRDZ3Q2h3TnVY?=
 =?utf-8?B?UGFJNUxWc1IzOUNSK1ZSTEt6MjBvd09POERnRlM2Z3Q1OXZsWVRVOFZlV3VH?=
 =?utf-8?B?ZFVnSnc1cDNVTHp3Kyt1UXBycm00cVlXQnQ1RUgvMytubFVFZUNuSWgzKy9G?=
 =?utf-8?B?dUcyVW9xNGNWTFpzZ1dLVWVRYi9JdDJJaFZxUGpXbVU5V053WEVXbGg5OGFa?=
 =?utf-8?B?WlN1YURreUFkZFJmMmNJUllMaWpkL0JyeU9ENFRjL0R5N3BRcjU2Sk9xNkN2?=
 =?utf-8?B?d0VRSmorOEk4U3BGT2UwWDhtZXlFNDVpbzljOEdpMDBOUzBlekZUTWZCK3or?=
 =?utf-8?B?bXpIUllwK24rQXpyWFF4b0lKd3gxNm1DR3BwYzVIckR4ZTQ1ZnhVSys0Um1T?=
 =?utf-8?B?QjF4c3RvMnNyK2xvU0pMZ0hWb3dGbllISU5iWDl0aGc1U2FzN1RkditIV2VB?=
 =?utf-8?B?L0pQUmZWeU04L1dIOStWTkxLKzc0SWEvcFZ0K0lkOVV5bVZ4T2RUUkMwMkRO?=
 =?utf-8?B?NlpEY2YxQWV6dW9PWjIzb0xxaGZCeC9oQmdUdGkxb1ZLQWhEUlNqbEtIRGRK?=
 =?utf-8?B?TG41S2lXMXdjSjQ5UXNkcVFEcG04dTNGRnZzaW1qS0IwcHZHazhFakIrVHRo?=
 =?utf-8?B?cldOaVY0YWhHRmlKNHkrNGFlS0tDdThyNjFPa0xQaGpmQ0ZUbEtxTjNPVE42?=
 =?utf-8?B?TnhBNk9IMUU4eEhGcGJ3TzAwZGdmSW1wamxSOTdBdWVoekY4MG9FaGhkb2FJ?=
 =?utf-8?B?SnRSM28rMk9Vc0syR0N2QnpUTmI1ei9VWG51NEI4YmlkbEFpeUlTR0dvYkcw?=
 =?utf-8?B?Sk04RFU0UEcvdTF5TFpwalg1T01EWWtEb004bXgzTUJIRCtZdU1TYVJEWDg5?=
 =?utf-8?B?K0czRUpocm5mTlI1elFQeHdEL3dqSEFCYnkyb3NnL1FpbDh5aUk2Q1Ftbmhh?=
 =?utf-8?B?OEZYTk44Mk1udTA4KzFqNG9zVDFtSEdVdHBYK0hkOXlrKzBLRjVjVnBGUDJJ?=
 =?utf-8?B?cVNnU1M3K3BabE9DdjdTRlhidUMwbXpPUWVsT09vK21uVmg0ZmxzYVl5Rks3?=
 =?utf-8?B?Vk9MOU00UWJmVkhOZkJSeit6TjBlOG1IajN5R0ZlM2RGN0FiWjBEVWpNRzlV?=
 =?utf-8?B?dEQ2NXpUajBCM3gvemhkK0o1TEdkanFsRTd2clhJWGMxQ1dHSWR5TnprQTBU?=
 =?utf-8?B?ZU1aZ2theWhtVXBSUWtRUzBkYmkxVXhDdHIxQ1cxbVJuTFZWWXJnTGlSR1hZ?=
 =?utf-8?B?QXhDOTFDeitTR0c2NGtOM1B4S2UzR2ZzTjdBVm1nWUhsMS90ajZVQkdHQnN0?=
 =?utf-8?B?UGJ1UVZCZkdOV2ptMVlDTWM3bkJYcmkrVllYTHJwa3N0MEpFeEwycDBLamJu?=
 =?utf-8?B?cWRPNVlRc3lEOE5nV0dieVNTaGk5UWJIdCtFTHZOM3hXZEZlNWdEM3RSYXQ5?=
 =?utf-8?Q?fsO7RXZynnymLK2kL8ZG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a79628-b433-4d7c-ac59-08dda1d5b7dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:02:25.2008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7726

Hi Andrew,

On 6/2/25 16:41, Andrew Lunn wrote:
>> +	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
>> +	if (priv->set_short_cable_dac) {
>> +		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
>> +		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
>> +			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
>> +
>> +		/* setting EDAC (Error-detection and Correction) in debug register */
>> +		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
>> +				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
>> +	}
> 
> In the binding you say:
> 
> 
> +            If not set, it is assumed the MDI output pins of this PHY are directly
> +            connected to an RJ45 connector and default DAC values will be used.
> 
> So shouldn't there be an else clause here setting these two values to
> their default, undoing what the bootloader might of done etc.

DAC values are only set if the property is set in the DTS. If the 
property is not set, the default values set by the PHY itself are used, 
and as you mentioned below, DAC values aren't modified by the driver.

> 
> Or you can change the binding, and say something like:
> 
> +            If not set, DAC values are not modified.

sure, anything else you need changed for v4?

> 
> We often need a tristate in DT, set something, unset something, leave
> it as it is. But that does not exist in DT in an easy form :-(

> 
> 	Andrew

Best regards,
George

