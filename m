Return-Path: <linux-arm-msm+bounces-58471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA5ABC146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8F93A587C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1FA1DC997;
	Mon, 19 May 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="U7Nk0wgz";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="Fpg4/C85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C98634A;
	Mon, 19 May 2025 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666127; cv=fail; b=QP3xjVHuS424O9LH2LYoVH7FjwwOXeX246/bNDHM1SiFhZAoboAw7/0dzWVPbeb29/7OZAK4QdQIOl1DJEqa5KlqLJ2x0+2q7Eqo9ocJPJybDww3hNf0uWBcMPm2saOyfyRUzvDUAAyWcd4YHyn8sRAdRTg/2J3XPhAPbU5VK84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666127; c=relaxed/simple;
	bh=DWG8lGWe8S7oCfEeOsX7WCT0qZvKE+2AwESXm0dHLSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fwoL9OyLQajxWeKpbLUv+JK9kmpVtaSKk5SNcX99Kj8o7IS4oQQ5PpbzE0ZiGoiVowgxwi7EiLoIpyXeO9e6MEscidVo47Ty8/LgdfMPrMd2JLq0kZVlZKgD/AbZacEv8tarRQGkgYqKMnESl6H7BFTmMAZhsskbqcmoRAik85Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=U7Nk0wgz; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=Fpg4/C85; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8E8aQ020868;
	Mon, 19 May 2025 16:48:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=2KUdPTkPQybGQGPEhZIhj0KN
	w2t9hVDwPymdOHo2+AY=; b=U7Nk0wgzXEw3q48bKa5VqzR3Xo9vzxbevv5Cu8db
	tx+5BqdGHfROjRb/KRIlRpZnp60WhVZ7zHOfLo2uKOS/FK+MfuPAqM5XcD5xIDR6
	xBGzJKEcRiKZM9zYu8ZXcWcZGANRTz32arkLiKSezTW/mgkInZUlLNz1Hd5kUfue
	Q76+cCEmSTmcvClmQltvFMveTjpAdzolLPjVBzCRKlm3sb4gyWcLJEbxBQ/UOIy8
	48fcrQZHjzF59qyPLFgA5D6/9mw6d1oJji6HCFhkb+7S5CL4TkQpQuZSHebqPBGn
	4DYyyOCrFemsYOfOLTXF21zOy/xP+RloxrApMpWu3I2VBg==
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46pef4t2s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 16:48:30 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds8YCBco/JB5XP6Ws0+KyLrDePRw10qeW8scuR6CK19hsV3NZ6rHkbshym+B0zFFk8nSjRziCuQLnPiMHjMKFtA8qTy9Tznu97nELAoRF2X0/GbR5HzuMxWBjDc7huZac2j4qGnY2J8sjjvX55CEb7c9xAuwOZRdjXIs5xh1vctuq/6dIqAbjPN3Tn5ltRljKidP2h7GpxsUIKa/aCXdMqh8LUPNtv72URFXTjiyVrzvjFqiIKJD+zbThm8FPyYqJ1Kps1hIK66XLViPk189rUIoYyrppjDOWjOlYNzCKDy3maGgyvarXqzjpO3POe1ovaKx1VPPF5ZHbNqXRNJ/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KUdPTkPQybGQGPEhZIhj0KNw2t9hVDwPymdOHo2+AY=;
 b=jOrAkJGuIO7Cuyx4MD9YGnRRKdnkgbKPRjPNTHJ5NS7nuPEHYck1If4yU2MB7Aovi1ooDh3hZeJ0uTd+AuuoDhUuzlj6BpJMzQbVJ+3XjDVV1GxMawmE85OocuWID1WqHqwNxwRkD0CRReKUUJQZxVsk2Lr791gcHigFfigBARfim/1R/IdUY6NqN0paOyMbnxp8wrwU+Ci4sGj0gATY1Jy4UnHAtVef0z5QeOIuClInHziaTMdCFoTaaQL4Inv4cE7wzFxzjbcCulF6gip8Lv6oy6ferH8kHsW22OvTMky5ZAnT7/NE5Lgu7Leo9Zq8dg0ZOsbjCuZLtYs8eF8X9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KUdPTkPQybGQGPEhZIhj0KNw2t9hVDwPymdOHo2+AY=;
 b=Fpg4/C85tXEZfmrqCGOCVyVXg2g8j/cMNzwCe6vEvEwOe2FyvIM3WINLVfUPQ/+K6A1VAOzDHuYikrVmcp8PkDF+UKAWcOpUB0hWlwGW8/MgrhOIwlY1Sp+2GatYgephWqQCIOR6VOBqQF4Y8PJUKGVhgZFOEdVoRS7hMoMOWg4=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by GV1P192MB1812.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:5b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 14:48:26 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Mon, 19 May 2025
 14:48:26 +0000
Date: Mon, 19 May 2025 16:48:20 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] bus: mhi: host: fix endianness of BHI vector table
Message-ID: <aCtEtASIl8oQPNBc@FUE-ALEWI-WINX>
References: <20250519061014.12225-1-alexander.wilhelm@westermo.com>
 <cf4adaba-5601-40b9-bd17-1b1bfa686b0f@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf4adaba-5601-40b9-bd17-1b1bfa686b0f@oss.qualcomm.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: GV2PEPF0000383E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:13) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|GV1P192MB1812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c735559-63e7-4ebd-6373-08dd96e43629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vLqa4/Wi04wKxcYpncyC3PuYw38D2mlaq6qKWohU/OeTh9zm1aZB4G1NFbRz?=
 =?us-ascii?Q?b6xNpEaZymM2XlyGsScw4xY0ad0oqbEt738a88p+CRQ3B+ZNXwdmU57asB0N?=
 =?us-ascii?Q?xCPyO1ot5+pFEgKGg4sZ04P6/13b7JfbkaOIveJ/uKL6nFAytKb9QecAMXJK?=
 =?us-ascii?Q?srSN7g3CpxkZ+fiRslxzMfc+SBJhb4pt0RfITWoISfMPS81z4FZk67dRCFtk?=
 =?us-ascii?Q?nCjMO3v7oz96keeWCkCOM5QebZjSolDkyCAuavUDs8c4TqLDY53RU2O2lqLv?=
 =?us-ascii?Q?QgqZoef6Z9diTiT5LJYu4OkwH1ybQHedKUdmndYq913wFuhzeImvKLJLk4eo?=
 =?us-ascii?Q?SvGz+tLvrvzucLjuAUghyekxgjIcrCwxo2k6CKh12Zb+yWWp5L6mc9WGHe9D?=
 =?us-ascii?Q?ionTQPyFjgRvMjLtkxzqbF3QkMyRX6UB8NIjZiPQqaGHMYCKb0B/oFn1Relm?=
 =?us-ascii?Q?n23DsAJr8xTfg6XhMpi1dzKB+mRoQ1pOq5Sjw74HxDEM9NVRjNMYjL73TFMT?=
 =?us-ascii?Q?9jIlDiPMYynM5vYfWxKezOIJ2I41iFElOBEilETyFq2LVns8r2OwjMY3uIN4?=
 =?us-ascii?Q?ZkzCCympxxq6deP2KqsaE2WQDpvXyxXqfL8cyDIQat9edb7C9DHrr8Gk+XAo?=
 =?us-ascii?Q?rA49W90gXO8NBXVZb34iNjfmi2eu0EAOjZxvLS4+Z5XINw5dUaOSOMiJ5Y76?=
 =?us-ascii?Q?NRVEZ9NWADlpq9SDby32GNWIGrhaZUvHfcF1HRtTBCRUCRhmC21txPOC4cGG?=
 =?us-ascii?Q?dcx4y54VVLNPikvnbnGM/SLxpjn+0CC0e9nedmTkl5HXXUuWkZpqnLwsqRB0?=
 =?us-ascii?Q?js1G09e0LuH4GxR9m8uGa2PTSWdScgNH23Snh4pNBxzjS7BkOKAPySagiNms?=
 =?us-ascii?Q?UAY0mopRlQriLy0QW7rbrySB1kj/uqPCbNVv+9tnlwhD1pT7vcmTDQdSZNwL?=
 =?us-ascii?Q?T66EqKZI1SRJ7PdSJhWraY2TC07/bHEJO/UYbSADtkoP5h3aP/icWuN1uG4z?=
 =?us-ascii?Q?MohcZ7arbcXe883wJNqou3LxaF0EwsJDog2CP4+2op0yGdcD+1LLeAeU4CZe?=
 =?us-ascii?Q?yHM18EOB/8D+dSRAKvPssp9rh1vSDpdix4uuv3oKHCshsNXrnhhR7vmXx0ta?=
 =?us-ascii?Q?KDcTJ6LemOdm637ns01UdAj4/xJvIX03DN/qG3gH2Bxkve8rymojh19zPtch?=
 =?us-ascii?Q?2r0iLE+Vu8I+NURQ86U4RQL8vTm3h280ezV6vSlInmGALk3r1RhG1H/oW2SI?=
 =?us-ascii?Q?ZT3bIsjYIFHVipzXwhwdROD1m0ruTWy3tQFbYACPI44wPRfcMO96SHe9xS37?=
 =?us-ascii?Q?L89tRRXobq2Cc/vBxKZmTFO3Cv3b+y+QHysbMLxEjYblgBt93iS4CeZVsPk1?=
 =?us-ascii?Q?NXmGDhn2AgXC37JPsiv/f/9arDLj5lIAjZ5Q40RVrnN+HNBNEs5aJJnPLWan?=
 =?us-ascii?Q?LiTdVS6yfsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SPfXkkAs9TYuI7GP+IhWZNZmN/jzuAIhZa7VYjN0MAMmTmR/L44oGRVuv9kO?=
 =?us-ascii?Q?9nQiqEpVpGy3jlJ/erQWmXrc7X4Fle34tGBrw/E6g4R4g1PHagYq8VUUxw9L?=
 =?us-ascii?Q?JIuVOzaulHpxv2lEgT64seraq7OkCrm+dj3wb87jwwBnKpLBIZXpdSaT6hMh?=
 =?us-ascii?Q?IYs8wjh9sY8Nt9L2T7KUpkq5LDcVGo8yjyaCYGVVhyTBqwj/u6YbTaikWjrw?=
 =?us-ascii?Q?DF3jV8af/GIQQ4zncwasCY8qkCLNUOM7hAl4/zljc1ZBPLIxxTkEGuXTn5Ji?=
 =?us-ascii?Q?GIUOd7lKhSB9piMp1IFK6tpz0aCTIkfi+XONhXonL3HAlWhvrKclLCdCKWKe?=
 =?us-ascii?Q?KFCgf4qmR/fEf7KcJ7x6clgUaU1CGXtgoOqXxCqchi6+hqN6tyj4J8HhrkuS?=
 =?us-ascii?Q?UPKHdzRO2gnAqvibPc4IJ4/ZxC9SCkIlEwJu9mHJdiyalhISq8Z9bAnlrHGk?=
 =?us-ascii?Q?XLnEquibOWPwZIJ3+jyWSx1B8HgatSGsz/XR9FInMjOZXs+tBgohpWJvTFI1?=
 =?us-ascii?Q?f+s6NwLsNhnWzNOnOEbBhO8+uqVriPlIjDKSf/Tcl/mNGuq1e+1LwcrjBVqC?=
 =?us-ascii?Q?ZFvZuDZTBClWl04Q4lJ0P+LvFki0J1Rluc/GHHA8Aiie9K1gLsCIowY4Hdx2?=
 =?us-ascii?Q?RtxSN0X+CQd3u6tNBAMIqd2tLkpcqKyD7LBGCCJHAG83d0llLC3HrUtS9tiv?=
 =?us-ascii?Q?ifL89mM1v+wZlXXChMMJZS4sWacLFuv2yZEnQEBykZe2+XZ9tersTXXhGK6a?=
 =?us-ascii?Q?9mRie7D2WSbi25xjn5ogEHg985Yz14Mc4Jbz02jGHx7BuEQO+PT3el1DA4ky?=
 =?us-ascii?Q?WzKr3lAnOI7LfF4yYOx1lr9hZP/2OcBucC5zYG2arEPCVyJX/1I+XROwhUvG?=
 =?us-ascii?Q?kSi6ITJTyFZs/vFdYEbRjAg97jvgsjhqppz8Z7Jyjx29pFXpPkRoTziGM5D7?=
 =?us-ascii?Q?68CBIyQE8dZhaOFPbRVcq4g0IzJ9F6filIFdKv/djATGQgdhhyWEd1o70wmt?=
 =?us-ascii?Q?mmxbRFfqxbxuSOSiSNyoGRFhBqx58ZS8ZViOT5YJK2hrrdved8BkUY4dHo84?=
 =?us-ascii?Q?Y7MICrWPdalZGCaPN1BC2vW7ue8bt8gD3kOz4/ReiMZx5HdwNVxe0Rzh5f0m?=
 =?us-ascii?Q?TYbU7e/UVcEiRYmfVeBJFRxt0NmnjYNvpnNcOpkbPN7mu+Vj6NikavxJIqji?=
 =?us-ascii?Q?pDwwyvAMymlKuniRlp3xLBW5DkRXAnkrJYX/ySpuioHQaWWc3xuWg2wfeLOW?=
 =?us-ascii?Q?weFmFV37SZezgCiHvoAezBBkuW5n2sFe0KnwG28n7yNEMzhjo9LjASBq7zvd?=
 =?us-ascii?Q?AQqrV7E7p/GfcyRqA+qetQ/m6BLzjFvoKkHd59/omRey/k9GsURKhzIUEa6k?=
 =?us-ascii?Q?vVWW3eqB7QAqqQka0ENzybf+F0ZkA8rnSMffB/3wjrAheG0ShT8ffFMwAaUy?=
 =?us-ascii?Q?6NdhVmTsihIdPKW6DjpyNJCWbVmNJxrPY6JNXBTMXxROXqlKEUGqyahMsza7?=
 =?us-ascii?Q?enCLaXE9VhLE6GvTJXLNOMHyeMg6YXW76KC0A792yw9GLCZq0POU3blYb2TH?=
 =?us-ascii?Q?31jNLUMGwlNC3DT462D830b1Odh38TghL60TB7en?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mpabZi28mZFvu9zQfnATQJxn8MtO5/52nqILL9nw5gZ5mJYa9roIuPHUKeX4OgWKqCUFCcWbM0b0mndF0S8V+1C+zFHzKPC/U0S4NVUi+5aSkKHVujBdo1S6DrzLFjfRfWoNngmoMbXlZCLtKEnSSpyO947dMCql6/YYeYE28fJZigitZyZYO0y2txBkGqyITwSAwsCbN4PlQ23fDd3D0NLRpuKW20gza9p2g5k7VVHI0z4d6CJDUOUCOc30WoShi1kOtOb91VgtcWANoFCVqAcUFOY4Bx8SOy8Qma+agQYmMkXyGH/OzA/I61WzmVaIjMDYZIlAs2Me/X1LdM/Byfo1yZ0tZu6Ay6wpvF9bD33+iT7lvlJ53IE3Ywuu7kwIvH6JHo473tSN4028fb/ucRR7auAJaFNhszASVz97LZQK59PDYZnKuMrmLK2Z3PDbgC5WGMn4gHdQbEF3Lv2/4PXGvsWq+I0rqkWEWHc5XbxWyHuR5qFUDHSOXWufS0hlso9YiZHKjh1ZxATquNjgBKxLhAtdriqb01LlUWKjQ9MklxxK1hroWbVrym/meBRGROSDb223a1MawqHqWq5qV2SHzMcNiebbiK4f9iFPhWLvmNPy49nIhPFVqSk5SVfv
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c735559-63e7-4ebd-6373-08dd96e43629
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:48:26.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+nuAuKOPaksDAPCbmko4vqcdGCBlY76fpKfAKFnwXUj0jrFyEA+0Grqj4QTirV6SefnhlYQbF5hj2gWEzN9cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1812
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GV1P192MB1812.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=N+0pF39B c=1 sm=1 tr=0 ts=682b44be cx=c_pps a=D21qXYjmxBfra4Dx/gklFw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=mSxJt6cBT-UaRHcRQ08A:9 a=CjuIK1q_8ugA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: qg88cYKeEIUTBHnopyM7jSbls9J_wOnA
X-Proofpoint-GUID: qg88cYKeEIUTBHnopyM7jSbls9J_wOnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzNyBTYWx0ZWRfXwwWn89nXoLIV OAK6vimeASd9VqXbe7P+nnZw2ZEwl7iGOFdJcvHbnE+R2aqbkN9DTX7ugY2xZfTRgXlFfTeDpsn +3yBGVgE7j07BlEm4iCw/VEXbl4TDprOoVYGr9K97jNu7jn/5XtuQ45FNWxQbyS5thhRefOemY9
 Wdyu3NswS0BeBtvEAtViNpgoC1/+N304fiT4TUutccAHGYOODYaNyNU4Qs7IfrlfZdxf2JzesCp 3Vy4nsMiFmp9qgQAd8xdm0vAAl9EqZTHQYhh54WLOrljYsIM5aSqxEY6VYks2p00OZ+R5q3qXSV sM6uvP3Sn0jtnZImVKeq67BMDLmhK+Ya7WYv8aFU4Il2G/exGl4QlRci3yCMEtJxatLQ7PDrkE3
 4xrV8myLtrw2s1JElyWgMExJ8jAJaxtElH76GAhC8ov9xl/yHNCCaNwbbTzqwdMqmLPI22xO

Am Mon, May 19, 2025 at 08:13:00AM -0600 schrieb Jeff Hugo:
> On 5/19/2025 12:10 AM, Alexander Wilhelm wrote:
> > On big endian platform like PowerPC the MHI bus does not start properly. The
> > following example shows the error messages by using qcn9274 wireless radio
> > module with ath12k driver:
> > 
> >      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
> >      ath12k_pci 0001:01:00.0: MSI vectors: 1
> >      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
> >      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
> >      ath12k_pci 0001:01:00.0: failed to start mhi: -110
> >      ath12k_pci 0001:01:00.0: failed to power up :-110
> >      ath12k_pci 0001:01:00.0: failed to create soc core: -110
> >      ath12k_pci 0001:01:00.0: failed to init core: -110
> >      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> > 
> > Fix it by swapping DMA address and size of the BHI vector table.
> > 
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> Shouldn't there be a fixes tag?  Probably pointing to one of the original
> MHI commits given what this change is touching.
> 
> -Jeff

Thank you for supporting me. I will add that in the next patch version. This
patch fixes 3 different origin commits. I would take the first one, where
bhi_vec_entry was first introducted. The following 2 commits are only follow up
errors.

Best regards
Alexander Wilhelm

