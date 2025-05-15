Return-Path: <linux-arm-msm+bounces-58052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65572AB82B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212901B615B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94236297A78;
	Thu, 15 May 2025 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="QpnTNpRN";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="gURB5/vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926E1297B8D;
	Thu, 15 May 2025 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301520; cv=fail; b=g3lEAICyZHL4IfTgID05HHd+sMDbMrq8+tRKBEzqzhI22cfyVIq2FDOPMSNKy8Y/DOqZssXtuCH/Ohv+Knw0mef/ezKJAOV7keN9O8ZqNyggkEwAG+hizlRp7QB0xPygqWyIJGfjb/qug6vUyU97qjJEWvSzhj0EpTSigDDuKcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301520; c=relaxed/simple;
	bh=DvI2banw+EJLj1fb4C+OJeqomF0G5pm/Rl5AuHJLWAw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F3u3s8D4PasoDFQhFc/0zyBIXXmjtJBWoOqTyPYZR31yJ9/rkuDFKmd7U5ppd1l2yAjoR3ap/XFNoaPXDQ0R3nAelxS5QeohmMN7clOuXG9MjlDSrR6TR731B92X8ZclR5IorpHbpbjYsT6ZjKXg5+H3ugTNFYJmpjGzFNAHaGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=QpnTNpRN; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=gURB5/vt; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F5lvnD009740;
	Thu, 15 May 2025 11:31:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=3LYbtMWE9yZQU/rSH5FVXu
	jGu/kogyPI38sY19SKHlg=; b=QpnTNpRNp3q5UnZ+U6j2BchGt8oF9OCrjbhozs
	89ZDKfedvg3tfroo5lXcJB/QLz0aKOazWe07y3YM4XMvY1ZG4ASURzVu36ygQqDN
	hB2adZPIvbjrW1gqcp/cic+nDysib/8eu1RNUJ3Z3ESV1fn0Q4fBI3mb0fgHiOMt
	8Njvks94MbLOD/zV7H6Gy/mfcbOv4mt7Sn5uw2hQfakLUapVCFa3bwGJLcRFXYW5
	EAcWXzpzubXl1duS7Ak/nvr7RVk+Ps7Qt3BuffTZdYU8PBxsm6cxIr1WKvbTtKPF
	yK0FjqQeomHU5zyPQRIGgXD2F5F3RdPPsTS1Fpziucy8974Q==
Received: from eur02-am0-obe.outbound.protection.outlook.com (mail-am0eur02lp2232.outbound.protection.outlook.com [104.47.11.232])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46htt45nf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:31:55 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Csven4Wk7QZXAiwoekJ86byZwvAicxpAHumCzwUC7ID96t4hjhEZMfCGI538z0eC9/LdF80gjH2Mv0EXPI3GWXbyp2TuhH0gHEleM1ah1SVOOOqabPjPPjfeafSF1DCbspd/CeA/3GAeC72GyIzt+xcc4Um5SACMhsEkIG9VSBCBDX09LDhEdkGHwGgKK9KRs3DoSbvdFQya3eWWyiQ5B9IvLAkqsXYQlLCMaKBR52pNcgHluohEuUBBntm7ewXKP2h8W22FqXu8aJltLjN9fiptZTrRir6AD4t1H2cMjq0f4+FuqOiEgQYVrwu1aeg/D5ppLG9ohyXqu0y/ukk34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LYbtMWE9yZQU/rSH5FVXujGu/kogyPI38sY19SKHlg=;
 b=hozNymcTVmqIdqcjq2vaTya8uVftWGtmNvwOItOwUw/ImCybxyEZZIIQwFki4TdlX6JxKWQaQypbAH9j87/BM/VOG2HBeNCV2G2nu6v+BPHbqW3tXkO2g1PqYD37dHNbAoCW5m4fdpxzcuFlcobMQvkY1noOgWXCOgEBY+7xDNX53GppJuecfBlxY3d5MMGZIk7S7Vg71TJiNDGrtw3esafwiExAlv0bAAFTH+VOz2Q8v2J7kzTNkOEtfGgkKqYVN+AfTIxYYwwMXwzDTzbk57T+LEtbGYxbxa5VI1LJyi7vrigHE7QxClUtcaqQmMTfUMet0CSWEuwZp3TztaJz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LYbtMWE9yZQU/rSH5FVXujGu/kogyPI38sY19SKHlg=;
 b=gURB5/vtsgys0GSPvRALHYMncmFexZYdsECLBtaBOFtuoSgk7jEqWHxv64/EMbY3RS7JeKX2sDjICsJ5NjwxtI9IpPO6Dq0exm+4rDw0nW2HO/VNbBCiZRyS6tJyQuPAy7KJIGYqjoclSQcyJNYMumDQHQdC6SxPUMNc6KdJhWs=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PAWP192MB2273.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:360::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 09:31:53 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:31:53 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] bus: mhi: host: fix endianness of BHI vector table
Date: Thu, 15 May 2025 11:31:51 +0200
Message-Id: <20250515093151.1845377-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PAWP192MB2273:EE_
X-MS-Office365-Filtering-Correlation-Id: 50136440-e8d6-4294-6f37-08dd939353ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kpJc0JCapTVKNTvZ7rGLtZa3erHb5YlaLqKkMhynmK5f+FeuzWGbd7GoNTfn?=
 =?us-ascii?Q?gDVVcCT1BEwtVvflpV138b0HgMv2XWgBDMfvHchaRh/+BgzFmjDqPFpBZODj?=
 =?us-ascii?Q?Hf6C5UscAtWBi8AlQwfZqr5wpn0/TXjv3UIR6bOMSIAuaKfwd6vW0sYP4BJm?=
 =?us-ascii?Q?CnkBkIk7EhEXckeD0wsGETBkYQkDsOZDqj4pDZ+mn/1hESLHGdYwyUWkPP6b?=
 =?us-ascii?Q?szcu4OT0OMJvcndDlMQwthdTaWKrAR7CC3S9xvNm0KrxH5LbPm4YKoy5u4wq?=
 =?us-ascii?Q?LN2NNwKJ4amLCB+LncRgiaqYrAevHJEEYWD5Jb/9aQ5KRf24/qAwoTTtYA/g?=
 =?us-ascii?Q?YlNeVV6ga5qKGJvqgQDQ4LxfCT3Yu5bYoK2orbxD573sd3hZ6PZY+bSWAO96?=
 =?us-ascii?Q?qDvDw3bGmdGVJTdsJgDJl5nTGeokx3ZnUjVLiHjExuTThrVqO0zG/95cAoCV?=
 =?us-ascii?Q?pT8f1h9OQC5kzdqOkNjMDUoNol/fnPaV5tqFpGMJEaqRi2ZVe5wT1dPRSbAQ?=
 =?us-ascii?Q?v99W3wUeNIiOaXnBskkQh575ema0v03ndVflJUAeb3+Dj9ORg0KsyQWTSDNG?=
 =?us-ascii?Q?9MMhD6Hj0zU4gZ6dgnGANKf6PpizB+TJPomvnc7kOW25oBtsPByhKuGIzaao?=
 =?us-ascii?Q?jjBTzkQT5MDYiDLy2dcrp0SbnG+QhbeksXM/2IWuQ+YDoUveO8PXvUXJe9gv?=
 =?us-ascii?Q?0SQDZLGdiKbqi9ocdMor0g8YqMLGCWQd5mrAbXCXtKRULMTWm+tBiRBRilTz?=
 =?us-ascii?Q?bpsI2N9+H27BOkISqS/6O6mcdJGvfCpKSD3+hk0cxfEioKuPV6aA9Yvg679j?=
 =?us-ascii?Q?atkFuaYaHAiBwx/WRuF82QDMEWhPffNSHpthCvYUJmrTgeTSrzM4fuPovvoJ?=
 =?us-ascii?Q?b1N02+CUAJSR38dG2Y/wDvEFW58A8PFyb/twfX+e+t1FOOiuFpfWPED4A/h1?=
 =?us-ascii?Q?/E73fSxBjU8o39JQMNXtE4A6VJw1NV6LQEPbBIr3cUhjvEUvI4sFT2cMD8Dv?=
 =?us-ascii?Q?JTIyBqTYijuyxcXm+Kv2MsxgKXEFYrNuc2oyCbBn01cWtJF7a1s5vTUqjBHw?=
 =?us-ascii?Q?TWRfju7AGSZpsjeOXLTKcNJmJeHDEEMF/CwrZXAyyIwv/D8mHWCDE+sSmsN9?=
 =?us-ascii?Q?1iu1hHtGlBZyTMcnoefol2xeZfGDlEzXQjQSdHoWn+k1xVMe4MsGtifkhwbd?=
 =?us-ascii?Q?olhe/kRlCl+4JFnwYzVmzwRUtaI57YR05/VZDHFGHJTH1BugM9IYkhKErIrn?=
 =?us-ascii?Q?HF+olfj3S63v3DCeeYYBr4Wv6kqqg7aOUxJ8kfSV+FmydDJgc02Sz+OmfsH1?=
 =?us-ascii?Q?MjeXkdAr2MPvRtDiFy0Tkcmm5K1O6c4Gxep73ZkZWNM6Nqkwwn9mj05+Tpoi?=
 =?us-ascii?Q?EbBR+lY0oEN8TcEt3MitYGGsMpDVUioLE3manDDQFda1PIuhIspXnpi5+dS8?=
 =?us-ascii?Q?02QqJvPBXGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DD787kBZQfwDQYs64AD9DZZW4mFb0l83OM23a0++lSxhLZqNb+VqM1oPCsqe?=
 =?us-ascii?Q?QagLyeDpQPjV6E9GkhPzG8MFEFN/YSFe+0/roKQL47qx4hi18ww7OMgp7hbo?=
 =?us-ascii?Q?k1iVf4ajm79lVkxEV9ObPg6o6IJMLJo2HlRZ0llLlPoUgGwmfwpk5yyvZKy4?=
 =?us-ascii?Q?l8O2Uw6gh1BynH292iXAK2041MeO+4JIQN/hqmq8LEYGv89ANAHmgX+gqTzK?=
 =?us-ascii?Q?OIXfGUV2tvXbC/aPSoJMZpJMSeWO605qAo/wV+cttqxj+33pldyLS2mMBkBa?=
 =?us-ascii?Q?YlhVep7uX3gDR2BRHdMlF+lTxx2pS8lQserC+4TR80H5VsREg+AVMEzuaILF?=
 =?us-ascii?Q?1ks5s6EoirSFxwQgXwIec8K4bpucAOI/hIQ9glNsgWYd6+8m/EA3bVRWxMi6?=
 =?us-ascii?Q?PyL6NVmxILew9XV7gqTQz5697k/j+z19a8iqYAEhng6e+QHKx1cbgG2xO+MP?=
 =?us-ascii?Q?8kWTOfe2JW2OJDxGuM8SE5KvRO/esmGldLmRziQk+NC9Z82bqk5UAVuZfWJ4?=
 =?us-ascii?Q?rdR3NfhRcdOjzfAmtauHgUCMUazm+XUdE68RZyy2f3PjxXCSiUbhoHUuG3Dw?=
 =?us-ascii?Q?ou3IE0o4jRZ4o37FDHmnsXcJ3JSpH2RnTYYNJY81xIAKAbN7WTqOTzcPDTkM?=
 =?us-ascii?Q?HQCiJobpbg0EdmFfJVzvn5PS6ZPm9dlVQFLw7Domj4Of3TV3QRtOSp8N0x39?=
 =?us-ascii?Q?jLndHHXexIsXpTU38rxf2Kh5Mt7Z82+QppGbCnnCdAYQSf8pX2FqXLr9CKJB?=
 =?us-ascii?Q?FKCyiqvPveT83I7PXHXSE0T4SHT/OuwJgRP4g9+IRKaMp1yINYgUMZGboBwk?=
 =?us-ascii?Q?GNTa5QTJ20bClSDFSvSLEQLCf9HWh+jdlFKXs0w9ceU8M+OaVNU/c4WG1BUq?=
 =?us-ascii?Q?VtO5kHPTr/l/DG5/IVYMR/ITqvCAN8YuXQ48DKD5cxoZT2cynUkFpc6UKpcb?=
 =?us-ascii?Q?egg9nDgeUjnAGvSGjwuJWwSBRSiKOqP2f6SjDiZGvU7+37pQKvFMnUQFTL9k?=
 =?us-ascii?Q?Htaw0YsU25QdRDYaRAUS1Qk/ZFt9kXELI5F0oV3lMZsBrtQCEfltIId3SjtQ?=
 =?us-ascii?Q?gC+BLxwCJ5Xko32Pn+zFvqigt4jnFoiDAwO5Y6LFcU0UvsoYlTBS0F8vm4MP?=
 =?us-ascii?Q?d3bWscE/sa7w6IvCY/d7/uWzTvBtDkP1a65rpsqs9Z8TFdlFfy9LmS35BilM?=
 =?us-ascii?Q?9lMLEChDhSpnwYDTXkvmu17xyrGDla5quMi6R2xPGPxN7xRcKxwyqhm1dxJL?=
 =?us-ascii?Q?LSLqN7ZIQj5kp4dqbuqfQszsoksmLQtpGorpBX4mfhO8CszOfyJrCUj5IuFB?=
 =?us-ascii?Q?eozbYfbAZh2Jn4fjylbG1BTMuvCBfIeptENUD8nKs7W7GP0RP9vsyUQIUCSu?=
 =?us-ascii?Q?MJuZCzYLjTPAXm6c35UPW0xGAb17qTFx+pvsSmLjxPA6TgVtdQpLGtv2pOzr?=
 =?us-ascii?Q?HoqKkHe3USRqZFZzuyaKgbjHLMop3/QLUfMeWAiwl8DUeIYVQDQV9MdoDqdx?=
 =?us-ascii?Q?B/sBH/DW4iNc8o8s0LNqWaUFaXBLg8i5dHcVhTiorsjfAhiLesqxOCkiSuQx?=
 =?us-ascii?Q?Emb1e3H04vEq7bs9l6qLUxLVpUmdkjyvYUO947At?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	15unkNlSfMbUestKlwxlrSPELu1wdf5/RabY34QfvgFBzFEmkkQbNOaZpvQmwfGga1hcT5UEcWNfw9nWqrJBBzJAZPZsrQGiqfIdMEshg+d/VBjok5t4jgXL0CA1I6+w5oXl60nR177XuRu+NGKCUtwctb7d0c7Li1Y6NlUYs+HKjhoaTTX/X68lqMhhVdw6PjZKQ/BQhqkaQ3mhVdqyvGn024PPvY2FiONp2PjsWZohdvV8ZfzJo296L2+qlKKwX+rqkepHaertheBX7BlF/iBT9LN9RNBTF476eLBeLN0JRnNEF/V8lD2wqSODzmrI0RFPHoy6zPSUAOmACglTIDS0wV0O/Guu1Y2Fao0Hp4UCwAEciDiY+rt1rSHG75BkrTlfoHk6JuiakiFBudSrh/byBJJTHhhbFeH585ixjBPlUQtajlnSbCVMYYAvFJoJ96VdwDyIzNh9/POxcg4Yj7+Oshgzd/fKb+aiH/2SWgFsfi/UQTJjTu3Prz3CLMvNlNk3FfFrpD/sp31tFJVAIKxSWOIvsWWWwbu0BCNXES2G4O8hFgio66mgK0ywQ38+j4yUPRH1Hz3fcth5W/tf6JIecqs3pkPBjlwk+Gy/3LAFn24zWceT2V1ySRJM7XOx
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50136440-e8d6-4294-6f37-08dd939353ff
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 09:31:53.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpdEJV68O+E3/lMOF07hqXntHBh/h8E7LL9yvc8TN2kCyE8lnCdvfk97F8k617fpgZx+27+zpPmNPUa0yOauLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2273
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
X-OrganizationHeadersPreserved: PAWP192MB2273.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: BBxIyt8KqfF0qSBuBGraD89GdF-BDCug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5MiBTYWx0ZWRfXx78ZhImXCSDI uuziEovukKOKFTbqgJ1MQ5uqHUfyqsXHidA3qjMQeyfq/G37+ZCi1Ym3z4Vqaf7Xkm/MYZHDu89 Nyc7D7idYNn8cfvlm0ljxq04XoL0aRkO0qZ+KyaAUc67PoANWkCdCYfp05QgFarG1Hwa9qaJWQR
 miuabgjis72YACSy5UkyiGgrDmD9bDE4F6s5bbRjHcePZ+mmAkkWTyUktR+r9Jkg4TBniK0wwla PxhBy9nsuyj3RnKnNLpfcjy7DoSWOG39K/NKVY5fvY1A/rr2+L3/LIGN0mMCGb53f1VXyAXZVsw ++fioA+RoYlsS7YIJmde4b1q2pPr9oL2yWhYoqpMcWfwP52mEYL5r0ICAikKNRIkM0UvDX2b1pU
 8Cbemk67ebtei7mjvhX07a58yNCZOgtOnYPDrqcdivUiWp6dXkDTzzPEttiMcxZV5/IC1dxV
X-Proofpoint-ORIG-GUID: BBxIyt8KqfF0qSBuBGraD89GdF-BDCug
X-Authority-Analysis: v=2.4 cv=SJtCVPvH c=1 sm=1 tr=0 ts=6825b48b cx=c_pps a=83zjKvnl7AjbQ6OK8w9NQw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=NzyX3OVR8ycHlv8U6HIA:9 a=PZhj9NlD-CKO8hVp7yCs:22

On big endian platforms like PowerPC the DMA address and size are required
to be swapped. Otherwise the MHI bus does not start properly. The following
example shows the error messages by using qcn9274 wireless radio module
with ath12k driver:

    ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
    ath12k_pci 0001:01:00.0: MSI vectors: 1
    ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
    ath12k_pci 0001:01:00.0: failed to start mhi: -110
    ath12k_pci 0001:01:00.0: failed to power up :-110
    ath12k_pci 0001:01:00.0: failed to create soc core: -110
    ath12k_pci 0001:01:00.0: failed to init core: -110
    ath12k_pci: probe of 0001:01:00.0 failed with error -110

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/bus/mhi/host/boot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index efa3b6dddf4d..205d83ac069f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 	int ret;
 
 	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
-		bhi_vec->dma_addr = mhi_buf->dma_addr;
-		bhi_vec->size = mhi_buf->len;
+		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
+		bhi_vec->size = cpu_to_le64(mhi_buf->len);
 	}
 
 	dev_dbg(dev, "BHIe programming for RDDM\n");
@@ -431,8 +431,8 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
 	while (remainder) {
 		to_cpy = min(remainder, mhi_buf->len);
 		memcpy(mhi_buf->buf, buf, to_cpy);
-		bhi_vec->dma_addr = mhi_buf->dma_addr;
-		bhi_vec->size = to_cpy;
+		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
+		bhi_vec->size = cpu_to_le64(to_cpy);
 
 		buf += to_cpy;
 		remainder -= to_cpy;
-- 
2.34.1


