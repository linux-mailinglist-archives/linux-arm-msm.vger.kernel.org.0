Return-Path: <linux-arm-msm+bounces-58866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B5ABEFAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4823A2850
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F76323BCF1;
	Wed, 21 May 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="mDp109qc";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="gr3zm5c9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D6237713;
	Wed, 21 May 2025 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819586; cv=fail; b=YwfBxcLcHkapvZSrNMB/vmdnA+VYZCC8FJnvNx5jzuINQ4eZiUInbGAvmdxYSk+eZgQ9reD88NogYFlZbPWFK6uatmS6a/CefKL/mxgkMXx2rTqiaxQ6zmp9hB2FD87ig5hyI+Ma577m06Yh2uta9O95dcantyPfhgbGsaafvIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819586; c=relaxed/simple;
	bh=adQIzG5hzLZez4dtAoVB6zlEoqiSWLObHslaUc5yBpM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kZrZGvQEAM3Scg3ciZeEZtoXLN0wLEU4iEL5KK0eUXdEhWt1uBPjLlqKGLBHUpVgT3gWXS5eYLMPapJe1W0Ttvuwl5GwLKO4pTziyDyCqKAWyBWahBbaRHUYRQX4dn+6E5tVDaRy1gdZzoIAijXrc5mEdsT5JfZ/jcSgR7mMELY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=mDp109qc; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=gr3zm5c9; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5o3gP006968;
	Wed, 21 May 2025 11:26:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=z3qRjVGfE7Fk6lmobmMjEq
	sYxTe1ec0hMf6qVmtkS30=; b=mDp109qc3ZUhJqRnvEaWy2SeSalfWvjukzbr0y
	/847ySMa/zokRb8RTTEGl5i5DbAbLk7tmHr/zdyOOsVpPlSCoCC0ESRTX2DjoqWI
	+usXFPC/+8SPAcGYBC5ZwS2toImoC+2kzOC/9sNUmG1DMZOoIQOnwRsT7ptc4YzP
	X394z6enSen2BKSOt6fZuO3FSmALWxXfH4EthRMqX/ewvdCWHE5TdzIa8qq15Ezg
	mbZEfqlIIBw/fxE22zZ/rR1+BON2Vt6/lc0CkBCw6n+M0QUUf6luALWmmsTHkzSm
	HHerFyG66W+IATvOPmTPRC/sy2z5VLPLyrGFtSlw46hfCjrQ==
Received: from eur02-db5-obe.outbound.protection.outlook.com (mail-db5eur02lp2106.outbound.protection.outlook.com [104.47.11.106])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3haj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:26:06 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdbwH+da2sZ3Z+VPY4zFS0I2Xp73fvYrdJXYm2eQ2FUTttqOgkqePtQyOt3eFEuIvQkv/70k/LqwPITGmldPOjvyGqXQJVTMeNevDTY3oiG2prjroIUAGskFiZi9ecrqEzc3K5XuO5hIYBPUAM6rmRPThrFDLoAgrTHaFvnYTveC/XoPXjKrDqb8ySAbem+uN2bDD664KqQXALpWorWblGbQNKs/FnNUM+l9KotyFJA78ztQbhyUnigVnBz3EDCAp4gjx/1ZNjx8Rk3slkQ1t+k34+ImfuekpFe7D1ml5vXlbuyC8mSA7EPoBzS1KExsVx5pliyz5vRRVb7wadTfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3qRjVGfE7Fk6lmobmMjEqsYxTe1ec0hMf6qVmtkS30=;
 b=AXLBYlae+7Umqvrrf+JPlBaE5cc/aeKHYW/qj9FI3Ikt/SealqX6jvA1veT//INf8jWiQfMZiJoh2Ob8Ekh/u/gwloCXUCPaVs8UkQ/0AdaM6s1aX/wQ5bV1IKJsGvxfDq3IeGWAItPu1+9CXHcY0LuvfFU6Wr1lw3jlDZOa2oq8M1Z0/g1ddrivBQ2Brv3t/CwsD/DvUthvgRpcXtkrh9HHLXQsleJ7LTpOoIs/ajrWjqZ43Xba/AHtdq0bcfnh7nEmBwf3+gSAmO5I+v0/z9KvBmKnitv+OFTXoBbcPdMbazv5cXd82OfXuREM8vK0N3UaiQ4+k/d08WynWwrZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3qRjVGfE7Fk6lmobmMjEqsYxTe1ec0hMf6qVmtkS30=;
 b=gr3zm5c96dG2AaHqHKaDprUXHC0MDqtIN8AeFKJQdEvWHi3A6Kra2BfkQZsOGCiKuKDkmPDAtMKrmYqsWoBHXLojepLqioNGWxYMHxDi8ckUvL2gRE/4UYeJEO8DLQwwRmeRnAEJycHW+Uzwh2d1v8a5i39wti+toQOhQK3fwKA=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PRAP192MB1481.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:29c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:26:05 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 09:26:05 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soc: qcom: QMI helpers supports for big endian
Date: Wed, 21 May 2025 11:25:52 +0200
Message-Id: <20250521092554.1026716-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0902CA0032.eurprd09.prod.outlook.com
 (2603:10a6:7:15::21) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PRAP192MB1481:EE_
X-MS-Office365-Filtering-Correlation-Id: faa5ccb9-c371-40da-e4f1-08dd984982c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6yQ4hPSvvZf4eewsrhmm+F/I1Z2hsEMejurL1ToR70+T7/UouRPuYdnmVQ4I?=
 =?us-ascii?Q?6RIL3duMj0yhJiAXeuTR7uPsoOv8vf/ysNLCaL6wZk2tXrqliUvk3qybYL1Y?=
 =?us-ascii?Q?OZPWVyPKwM3e9Pjp44B0bGL5SdvPTDH71v1RizO4EmEf0DYBZoSWWD22INPk?=
 =?us-ascii?Q?iYhY7XMUNva20kN5ziifqCcw2RaTLfbn89EFkM9j/wHnjVZNnG5T4LjJf3y5?=
 =?us-ascii?Q?Rqt1BXLs6utI/Z5vpvITmdFy10gMPEGzpB6oayJxaKoyXSB82FEeVO22QqoT?=
 =?us-ascii?Q?Nmj66Y/lYbYaGGf/6o3Ut9JjdNBlfBK6mC64iJSuLYMs4/wtXetT1OxkmyEg?=
 =?us-ascii?Q?HOTyfzrIYJaoyZ65k7l8CdbIkhqNRfItLabA/PMAegeuqbK22NKgAQsZ7/2f?=
 =?us-ascii?Q?0gfHWq2t3oLdYfKbLpoluUXQolwl03iQlOCEJOgwdGMcxE+4jPZs9SZvbKt3?=
 =?us-ascii?Q?waVKg8VWjF6oh5JUDmpBV+akU9ORRpZbSexTL3PRFeZ+uW5M6TbE0ztmdHpx?=
 =?us-ascii?Q?4dPiTOm649Ml5u9jVMKrpdR3ZP9ZzQOv18F1B+cKA/sa4iY2wKZi0PfiteUC?=
 =?us-ascii?Q?rbFAzYdJcU8Bg1kuozN1LbKe9kauriEuXK0meuYiV1l2ZuP+YSp8Cca2nLbe?=
 =?us-ascii?Q?uMpdYIjASOZbvuMapAUgJ6fkhv5yWeDhHu16Wy2D8GHnJdQCJwlhlOj/eiq/?=
 =?us-ascii?Q?W5JuEZOpao+5KuDQe41Jp+F8SffZUMrMVGi6cvCPX2/H5WDgfgmFU3sNaYP5?=
 =?us-ascii?Q?4ejFEczK23qcL44jxJ1CSqK29Te1/tgnUZ/B+szKO7dFgPRcLjfYcA0VYcJq?=
 =?us-ascii?Q?btHYpq/iUzwP51asrZuWDY2W1t/o+l8JdbRtxn4LMwF1taujckXJQEnF5o4F?=
 =?us-ascii?Q?iaHP1PzIJelvFNb6GQ96GbhZ9SfKVXtAvxhox86JQ6LN6S8t1hz+12QfFHI5?=
 =?us-ascii?Q?gm+Lk2giK3RHM/j13PZuCiDFHARg2VnmE3zMNNn0elFbCSTV9gy9Mnu8Wq38?=
 =?us-ascii?Q?G5TBQoitYXso23u6KdBYscr8f0MFZVGxybN1GALKXEdGoVLKEf2d43dLjYsK?=
 =?us-ascii?Q?zZII6McOPROY0+blzoib2450F1cQGszjHaby6TGWWs7jMxm6mcmP8wEf2qjd?=
 =?us-ascii?Q?z7QzCxN/jOqpGVO1lBYx3Fj+x+ibgZDRd0ShJsp/6T5raHkaBafi16IrHbQo?=
 =?us-ascii?Q?Jpg6KHetvz3AVTN88s3B6pj1HqIMGmttCzJFFtBdG7v/YDpooTVIlMrZmKBQ?=
 =?us-ascii?Q?uFLRkc3rajHg0rw9/FbngNrE6sIC3wAlUASDNudqtyeUBZkbRowjS+BBVT6B?=
 =?us-ascii?Q?NeHGbD9t1+hAPgqPxBQXIB4DJ4h9xAMRSWpCWSWRj1BRlUbGTrdH1761Fw/t?=
 =?us-ascii?Q?QeKWON5moX9fCwhZO28iEv3gHGttpUFIoeLILO/l9uT2QTCrIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0kTJyuUIIgtyxs6C1ojPd/VjcC/t5fLJQMjD+PtxbLLm8XTkNXe2re6EUiA9?=
 =?us-ascii?Q?VStqNPXactlyoW0fUJFLqw8RjBaWugkX2vpLI0QC2htUJnmtKe8sUtfzmtn5?=
 =?us-ascii?Q?iIzxGDj+IyIAwMQvUQeWtB4r9Z2YqQkL1J/omlK5i1Y3w8RYP2UUf2uRKP4E?=
 =?us-ascii?Q?F/ICvIseqciVWajZ53T4R2ch6QRijAiiTeNRpVsi8ZHbVea8SOneArTs2xYU?=
 =?us-ascii?Q?L4UOhk9ahuIIWu+sSfKEjcEmD1QVRZO8koFH08Lkr/ZkyqWMjIdg7OR+IlkX?=
 =?us-ascii?Q?rjd4bwDdNKjuFES34ksPUCJucktFWeyG4x9/mxaJa47EO54WB7vUtc4Xur8p?=
 =?us-ascii?Q?sJ+md74wimO3iTa2Zn/+DS71uJwFFgOoISkaaLXwWE5VQRPwXoW22pFItKSL?=
 =?us-ascii?Q?VFMxp9/+wWfmhcFMhk6Ys7addAdEZ4WljKMhuDTHgTvbE0RulExgiwcG3hvv?=
 =?us-ascii?Q?tXu540mrzH/uptLVKarLtbBcrRFD/aZohXIzYZzTaJejA/TPyabbX1FausdO?=
 =?us-ascii?Q?WYrk1ZIm9rKAOt/FzurCYMAM+cLjTgo9wnoZhyE+0JaArjmSIQFDH9A55Vrr?=
 =?us-ascii?Q?eas+eLNljsm9WemLQTDIeJHg2FXRG594FFUbpkqz4978qAq5G3oCvHai7V35?=
 =?us-ascii?Q?y3s7smv9vc0LTF+DZUbVaJRV7P2ZsHUK/hMDvt/dcKDeOgHD27mjX5Q+MzkY?=
 =?us-ascii?Q?TMrhbuPJGUopNIM9UbKT4q+b5r4JyFmM9ekr4fwK5jGX1MON+WgAAZmZqbyK?=
 =?us-ascii?Q?DZI+ixsRxZNAV2jh1pkn+e5pCWRfm5VTznpnHW0yXDpu6PxaY/R9ffKW5BHw?=
 =?us-ascii?Q?BMZ9Y4A1dT0ovKDUpFJGNNWcyuM48Qeq90VnVvzrTzJI7/ytblPLKrLJmUl7?=
 =?us-ascii?Q?PJpAzF7RYW5aFT1Rl8qmYkhL6ShAQci45YKvT0dmp1fwJUV09LMJEoAC4FZF?=
 =?us-ascii?Q?O40F85ZlHh6ue7QQgIsnF9HOD42eTIb6z5x0SmubVZo6Ttw8G/F5jwDrbChz?=
 =?us-ascii?Q?qmYopDJva4iGQDXtVZ0Lv4NnmGFz3tnrm5/iBqdOfxrlI63VDr5nQAZ2RtPg?=
 =?us-ascii?Q?E17BCHJoGzdq3TOgjfK8fS7G33VOXuTpdk5wF9EvPpnjBB894YaizEhCBWFl?=
 =?us-ascii?Q?Wxz0iJZpJboJq4ML7dG6JNnDCSW7xmdZ57nQsP6DZZH6E9SdaEFkMyH8iC2z?=
 =?us-ascii?Q?gByTQdJZBBhaUgebF2ZLLHTmcxeGQ4xV+4c1zWjALnOIj6w7qJY0DfzCFPW7?=
 =?us-ascii?Q?ANfu4AFQW2U01qGlOY2vhCpsBwGzWYG/d/x79LJtBOYXOEprrbIrP1q2hWRo?=
 =?us-ascii?Q?l1M4IzU+jfQewWwhbEQetCTHM/3LUwRGXjC5639HD5L7dDynwgowqzhcH24s?=
 =?us-ascii?Q?ImqGNKKv1iRQfylWJP9TG02Ens2o/G0d6ArzRmfJghlRQ9maYa6JUTx9mfzw?=
 =?us-ascii?Q?Q5fuUxdb5cneQb2b1Z9cgoUacVQGJJrdzQsZ5tFFZqifct8+j7cZmlS0y3dY?=
 =?us-ascii?Q?e/Bq6eQQ2g5D0Y0mxdJTkPFp+PRUX2KlhIERCRKiKMB45LR0APgAsFSBi8mG?=
 =?us-ascii?Q?qs+UDQvepPP9SsLnxkoISErcoHVxvgumMxjXw7rY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0mi9eHxIxlvY3EIdJk8ZGPlHaDADNWY4+1hLejZ/u+/kXfEmkQTsrwXsp/JWEH+j/Cv1h+VT8mN2B4K7MQ6My2r8F77syuKLDb8+L2Cc+GSMl2f6nfHp2doGiBO9ict98YO5ezSnXzcS+VHMo3KgvS1OgzubbHrkRqiSMluRp3UAp6QSVWw+OiXZsKMxq/5vZQWGGqwn0RL7EGmJFtALJrBeROcruaquhyrRARG7YFuHEBwLWGQvObckM1KM5w6yp4aU98kjhmxV9Guj7OuOG8LNIGNpuijF4O0bWlQL32XZz/82cmjtdTcZ4++cMoas1O0755xeLdyPUxTjckKYxOrahmapOc9Wzmy9higWWl0SYNvH2etHenT0RqIDCVKnR87hD7e7j18wBJEqRlBpCpJM/TwVqHkywDaftK/iE2GGrIC5kj97pE6QrcKB5Q+Zwz7q4RPCms2+0H1lBVnuoqaFQOBWkIEDq6XgyOWSu9HKjGy4AQYiMEDcGmT0LXSAsx7uB36J/JaYnyW0zAC70RB84XL/bwXBBrkWSkxKVrlfeDOKBtjBBHCTQcRCJWElI2b6g7U4P2qF8E4GEXva3bLqLvAHzSWAdnqtbvlY4lqZnJFJRTwfAz59mRcrLHMU
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa5ccb9-c371-40da-e4f1-08dd984982c6
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:26:05.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2Fdxcmrt0gdwucFuKCO+aKbXjUX6p2pOriQX9kkVhEcr+WAgx89r4uhfso9vjpFDhZxlpVU5aBAn/K4eiP+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP192MB1481
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
X-OrganizationHeadersPreserved: PRAP192MB1481.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5MiBTYWx0ZWRfXyekygFOXRzRR VGBXVQmHzXJo3Lyjzd3F7kr5UnU78b6WUQl9AMDcrKm4nE2k0pERlSMDc8cTD2sYSD57RxwV2/1 QVxF3U712uR3fYA6dvy/tTCiyOAwbwQhMNPOEDMrMAqwla150p8raeKDQv8yveoWTGsxleB+VV0
 DQvh8MDb++lJfXHTwFZ04ebZ3DNJYltTctptWwXqWQmh7zavY63u8KO1dLO8n7zGr7V2p99dg7f srff38YzjIW5T7QvNPmghMoE/VXol7rHr3bQNhEFfY7AGt+u98uaWigW/w9tLKhFh+Vxaz6gEFB 5IK9EIeVsjw6NSox2p775mpjnOMjO2BcDw0YPa5gh8cfyF7kBLhae5SBIN0A2EXCM/hLHAAU4ev
 m/dDwfCICqDwpsZM0BU2Kgj9DtcgeM+JP/bAqGvrSH/A32AGspAsU+xpycnR+52Mv3HtzkC7
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=682d9c2f cx=c_pps a=62ClohvO7FJ5mqRL+nbw7Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=V8mMI_d_cbdgQsbQ2dYA:9
X-Proofpoint-GUID: 8PYjW0YwltbiulWeot3poAZUlGkD6CXa
X-Proofpoint-ORIG-GUID: 8PYjW0YwltbiulWeot3poAZUlGkD6CXa

Fix QMI encoding and decoding for variable length elements to support big
endian platforms. Also fix endiannes for QMI header.

Alexander Wilhelm (2):
  soc: qcom: QMI encoding/decoding for big endian
  soc: qcom: fix endianness for QMI header

 drivers/soc/qcom/qmi_encdec.c    | 52 +++++++++++++++++++++++++-------
 drivers/soc/qcom/qmi_interface.c |  6 ++--
 include/linux/soc/qcom/qmi.h     |  6 ++--
 3 files changed, 47 insertions(+), 17 deletions(-)

-- 
2.34.1


