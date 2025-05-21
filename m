Return-Path: <linux-arm-msm+bounces-58867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B23ABEFA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C0D17E38D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CF323D29D;
	Wed, 21 May 2025 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="PeP/mzxF";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="cBMOSZjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277522AE4E;
	Wed, 21 May 2025 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819587; cv=fail; b=nA8JcTac8z3yQ8cQpmxNp06glXjLY5DVa5ZsGp877NWHhA5eBLtFPbKX0ncwp/4ISOwVf1D6rLFziMrPkQ+bkhFxguIxTvPgV2FqltGNnGq4ZciRSENIy+tUy9dR9xgMsrXKjnMVQTuDBZP3LkIPetjEvS0kQUn+f3PYELdvpuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819587; c=relaxed/simple;
	bh=zbRqghF1Q8UPtXVufp9LrZtGMuaRiKqehf3XGAD1tlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VsNtyXG4hL2Kp3tFuUqTq4z8JcTixcgz2jIyr4qyPTQ7ojVGNpoiFWTLEwOtroF9lNvZTEIYKJofvpb57HW2CZKEx1JG9d2xigh1XmlD/SuUjrIF7SKDRWcWeOVI2+gunR4A07D3pGpImMiSz7MtQBZFLnjFoEIqty/92BElHg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=PeP/mzxF; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=cBMOSZjW; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L4kF1e012165;
	Wed, 21 May 2025 11:26:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	LIveP0kTRSXq6I/yVE6auFpOkPmrD7ovZGfJVPJK8sM=; b=PeP/mzxFEPawrQWz
	eevVZw/P5V4m9kgkATSpxxoPSBe8VS7yfjlhROjydGlqV+oJP8gWCFi+KgF6Uj0l
	pfcDE7zcNy48NqxnmlAqJimO/mh0nIWw2nr/i0A5iCc8hiUF/6u2YCbkv4RK/qvB
	Qk/9mUmxzAyrLRnggVBiWSa3xPBLU0/CoSvMg1QcoYrHGcTJWCH0ks5j130CQcSy
	v8w6JSSPxe4WwufMaBxCWQeb67DguO9tTlWCJzFTXrhP1S9fYQN5GfZj6kWhf9Ff
	wBcUrDaf17SQ771rGOACTFiWkX27FyfoEF7+BMCQ4Thl1KBOS+G2dnphE3wrC8mm
	FT2W0w==
Received: from eur02-am0-obe.outbound.protection.outlook.com (mail-am0eur02lp2236.outbound.protection.outlook.com [104.47.11.236])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3haj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:26:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9JO09QQMhsDXs+z+4BK9jEHLgXQY/4NY9F4t9Vi4MrsdSd7E7GTssu+MJPyrmqlP6KutIsm3hi6c78cAZhPMDn+qfwJM354ktrpZqYsSGaoZFjgcwCTjNvifAQtipWnC9ybVkk74c+PMywIjJzXo7xdvILsuSXdbyLB2GV5FweXKDY6OhRel1PDk9jXZES+jf72GmBACOqbrAvRmdbUmIPJWfWujt3/efXzmcMQtyS4lJfZFlSAlrojV4URvlJ+/GG1U67UJlzdw0T1NK3jnLEhVoK1wJD2jgvWUgNxJmUAMnX3ZX/dEzNIaYe1dQXqYFYSROuBIL8wqHNcK0zbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIveP0kTRSXq6I/yVE6auFpOkPmrD7ovZGfJVPJK8sM=;
 b=Gco80fvMmzoTXI/cIDLw0mHqIoYmw4TB2X/29aecKcNf47h91vTqsgWE13FtU/jBoqmMButl1JaTZb2nnE7mWG9wdpcm4Yx4lTDw6/dwGOvJjfgbg2lDWZuu/BI5F6kNch98o/DL+oMrWbbWyyCnpc5KDiNnTitLQutff5XwLhC33ruhxhDJT3kK/7jQCuBrstmSoxVuBuGca+QEXnvrXc+jk1J0LmJaxHbkLPr03LER+ac76aj8nqPSAs1ZnQVZc/ZbCeiiulWZbMNRNr0nqUy1GcqxuKalmSpVGyBv6mj2FQMRWwjrmToFkkvGTd3WDbjizBAOBbBZpoI+KcSzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIveP0kTRSXq6I/yVE6auFpOkPmrD7ovZGfJVPJK8sM=;
 b=cBMOSZjWG1gHEe48ocKppiOo43KGlwNNGTreUpWlrAiZ8ShISlZ2o566DM0EX6dZh26nteD6X3PwtOZMFlbKl9SsWlDpSx7atF19K/rQWBwUgR1jOf4GOYqzsSFQzQ7363sVB53Wk0EwrSe7fODWah6pe/YTHh/lynCmH4G4Wg8=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PRAP192MB1481.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:29c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:26:07 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 09:26:07 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: QMI encoding/decoding for big endian
Date: Wed, 21 May 2025 11:25:53 +0200
Message-Id: <20250521092554.1026716-2-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521092554.1026716-1-alexander.wilhelm@westermo.com>
References: <20250521092554.1026716-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002E7B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::b) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PRAP192MB1481:EE_
X-MS-Office365-Filtering-Correlation-Id: 68713bf1-ee7a-4f85-1797-08dd9849842c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5VK3R7dryxr4isOT0hEhTv33mFcJrr6+S1DfepuvdZPk3tCoobDXZSPgd7WE?=
 =?us-ascii?Q?6BSzZAer7o3oU12hpRu0GXeApXRr/s3oYnXUuAKqwQ+opLuWxFRFx698D1Xw?=
 =?us-ascii?Q?B7b00WgpxsmenWkonYnYQPCwvN0e0scR4Tpcp/86/GmggaBRIUkJG4LmH1da?=
 =?us-ascii?Q?dNmfqEwb2ZJ0GPz49y/UWUqpYRphJrli08pO7G58BIKprt5XNPmy+k0CFbDD?=
 =?us-ascii?Q?Sk/61dTRjuXhet3gNA7p4Cisjh7YQIT9s34UUGc3YpVjUvHaFsHJ/Uz1xtZg?=
 =?us-ascii?Q?FVEU5FtHHDwKk42IVopjKAgYlzpaKi/dc8yGYYQUCeLxhWBjJHiVusojIqM4?=
 =?us-ascii?Q?hb1WLc2DVjHVcaYkl/nJhuuQVKTUBZtQ10HoVJBMWzASuTHCn+DW5JpVlrU0?=
 =?us-ascii?Q?N8vCt8RmU00llqI9mJnZeFT4UoYGflXnO1BVCxdygt1tbZig8RKsy8RqAqV3?=
 =?us-ascii?Q?L8rHj4OPzw6DEnNEdMih23YBsbFqtdvhaX1QZscUZQZwNVSAx+Q3EU/+g8QI?=
 =?us-ascii?Q?rx2MZ3j9oloyQqQdYA57gGIIBLDzAEhN6XDN90QZsvjiK8QA25iHJrj82QDZ?=
 =?us-ascii?Q?1suwANiq9AjIMqGH6/jKolKtLD2qmueRMV2yzrO7zp+bfnQb0fSxs4MH9ilt?=
 =?us-ascii?Q?WKH8u9Q5meaXFX7zd40j/han8asZw9Dhv8qcyaBAc9SEApxqceAe3ALnneH3?=
 =?us-ascii?Q?FfP8mYXR68Jfqx6l7Wr5BfSd3gMiXiT4JrDxCXPrMUH/471MGRfD2Nb2kE8w?=
 =?us-ascii?Q?rC57TOOia+Tx+6y6j9RN6pudyai4MWrL/tfACqdzLCZ8rbkn9WSzAh5y5h5h?=
 =?us-ascii?Q?7cCSsOBLj31GPsTU/pgwKz+EbUD8Ea0nvQWy0tEyi4eoV+rTs65+KTz50BjN?=
 =?us-ascii?Q?UxwgOCCBqCwaS4DOgvNBVTqt23FrR+h8g/UjB5d2Ja0WvhpLm9a4a8D36WQG?=
 =?us-ascii?Q?lBR3Pbdh7mu3GhlMsZl1ttnzVcFIW/eanBXBEwVhLfQDbxL3ICxbzqMG1sUF?=
 =?us-ascii?Q?4buYUaD98J7cq0Dz/8vRWfjfQQIXmU277DP/M4lyeSwMXfl5BJfaSh6RcC9r?=
 =?us-ascii?Q?VnTqrEBttctf95XQSiJhe46Q7hZLWEMb0x8cRLMAouhLxiy4NtXaUPPwEfuW?=
 =?us-ascii?Q?MkE1kkN7AWyUssrjaWKkeShBiuvKO3SDnnLnPTBklsbeU2QuxP+hIGwB8v94?=
 =?us-ascii?Q?Yw+D9wksHKDt6E/L5t4KnCYjFtjwG1jyWBOhibI1ykKq9WzzA2N1hgKRhDGH?=
 =?us-ascii?Q?qfBZMezkQ0tHaxv3B2P/X273za6hIRJ/nqDijb9Q9X9mkuxsWp2bclUaq9QM?=
 =?us-ascii?Q?ioMPqWuyxp3AaITevqnsh2PfiEtoKF2nSWXdV9PGJbY24b3PlhMd8mu4sjI5?=
 =?us-ascii?Q?PrRDM0KcgyabWv4mUjm3TQc0CuPrf/JFCG+YtnbY9Xv7q0pjxMxTqwAx6Sad?=
 =?us-ascii?Q?K4z7AgVgLhM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1AqvvubtqKjctuecGdhZXenQEQpEWmUOdwitQcfzcGWZpX5gIVmbw1rhoiqz?=
 =?us-ascii?Q?Il5+rjYey1TOV+/ztjcOI/0w9Vwi15ZLvy0UuZH4yJVEltw/PZ9yCGdSd8y3?=
 =?us-ascii?Q?cr4Ylkq9CPH8OhK7gfXONrWXXaA/YQ2ov3QDlH70ziHxHVASjOdgDnJRJRaz?=
 =?us-ascii?Q?8T6JUxzZJtzU4Md0hHU9GTcGfsq7G+AlUDgqNa7VBLg4No9wjMkR4qFoMAGp?=
 =?us-ascii?Q?Shq3BnkOXC0Stgr8wWWa7xO2zbZ6wQV6PDAE8BFNUP1NMyDvstYMpbK1Ih8h?=
 =?us-ascii?Q?XHBUncix8UJ9Uri6vh+J3lTBHH2wA8iPBR121+R6PGoFw63+bB5w+A59IEp/?=
 =?us-ascii?Q?qkB38PaTFNIIxzHjeeX0S9Mr/Czqzu1zwo7wRplTmUkWrY2AWQ/wXWVw7u93?=
 =?us-ascii?Q?i8gjFJlG9Od+bWi6IhdGjaPrI73US0GbLAWfreA18yVvEiHB9MHepNFURBKh?=
 =?us-ascii?Q?DQWABvDPAg3Q1g1BIdkMeWixKOpPyqmq7b1RDlVmPb69iq3Qih0MjDuFEX4B?=
 =?us-ascii?Q?C47MzKcP+Sk70nGaN5hJSHJSOCYrb+qE0MLtRhI7N8wmwYEpQ3oBYqYTliO5?=
 =?us-ascii?Q?JcN3TWp4rR+6UMb2AsQmpPOoJchQNH648RJSRLydYP3184Y3N92+NydO0HLC?=
 =?us-ascii?Q?Vpe6aP8s7pnCWcOV5K4aqBJ+tCtsQI30sUHyqDyAEgy+3l8p8Meu/tK3QVdD?=
 =?us-ascii?Q?wr98wc07EjoNPy/Sw5dyTz/T0V51EIDOQ20neRjpvKbWKZvBUarN3N3iHDg/?=
 =?us-ascii?Q?jhVzQX2YIwuazuYpgvrBoShypH6F0aqVwJvR2UIrxtFul0ugG8Z4RkEVisR0?=
 =?us-ascii?Q?4od5b3I21JIKM6+xWGWbPkqZHcplKKAGeAzATTFMVu1G1nK7o6ShtnafLzDx?=
 =?us-ascii?Q?Enj1axJ9wu68aHz6ziVGiG0DgZtWfyE5SUvrtWXLfPp+VxYPL7gcW9Ad+oI+?=
 =?us-ascii?Q?3QOI5P93ecmkYp03VTuE05+kCVd0isAWkPLuZZs2QHj9SZPyN1BqMOa76Dtd?=
 =?us-ascii?Q?SvLgmvCxyFh4804yuRfFzCE3HHvYws55t9YbMHFNECY5sDl0EBz6X13aWczn?=
 =?us-ascii?Q?rdapJri4nhNa8XMPmS3tYMQ0jE+wrL7GBQam9H693OieDM8WXkoNX7fjT3YU?=
 =?us-ascii?Q?5N4n6rFuGXtOLPBICk7K8Jjnhf7Vw/p1yS8Q4/FXVwWNqIP6KLvuDIdgaStn?=
 =?us-ascii?Q?93H30IjmHhbN362FakYy2qQitPnK1gQXRMtS54wZkMxPlTiMSmmo3LEQ7s7j?=
 =?us-ascii?Q?RpXK3DdIOSdle3MTtyw5S4FeMMtdqExuJSb/HewTWCYl2uYOuflQy4y73Ocy?=
 =?us-ascii?Q?1Iare5OItr3FGGgye0A/n7yyXW/63gEaUjCvjPboCvYMCgsa2hz8kWyFb0w+?=
 =?us-ascii?Q?QxblrtzTGvEfuiCU6XBRgFJQzeGdaiyOAGfMkvjiwYJg7DOmafoJGdXdRdvi?=
 =?us-ascii?Q?96hE5Mx8JKj3BufSZtwzhrQlv1x5S9G//geI69gns2YRqZOgUWmn59obtW9s?=
 =?us-ascii?Q?iguEMZmmH+R8bLNkB/f5/yvD9D39deXAPj8LKlQOPwfNY3oVQFJYZEoIT0SN?=
 =?us-ascii?Q?oyeyMT3bB/Ez+sWCByhX8s8+m64qZ0dcvMNn/ZDq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QP4Os5yG9f6bOFOX91P7CapNK1Vhhs0uakGv8UXrhza8fG73trwfHVg4X8ztSIB7Yc0tMZhD+H8n/goWAVGVhRflJSV2Fop/qcKLXQ7R8y2FN2Bi7T3xqF3ERFJ5hECKCrkXiNu0V+dva83PwNACxMEb2TOz113cEFvSC+OZiaiwWAjKjB6nK7yg1iYHw7I+Nbou6Rj88fk4IEZDJYcIeE10zO7BWfzREcGGO83WRI++XDCK6uYMhhsJ9sS6u4Pa++k2Kd/GTwXGIjS+r5Nd2tie+XVHz7bsZE4I3YOKUXWTdXqh+c/b023kjYARSpOvoM0FQRaaK6FliVqRKbnumqT6ftJj/mO7GAnDXfBjVUidkJGcQwRbX/mxFsMynQ8bodToBBR19LmWh3cud/ILeutc89hi1cHudFmIPCJXydbWleAFagPKsjTscl2sV0EXTZiCtGeiQRcWI8rE3DEOwy3ik/hz0WMknnMmQVArIiK4iXX1bGztESP82a63Em95VA3W8/ro9K102HDMX1D0utyv2VcsQ1Ac+pts2tnN9p8gSvhpqmtPiyplL8NCCaIbqCOhjn3VlSkoqvKBzOGZkWXhkGJSW3DECxdQF2te9aSsuNkG+jmYBGJ4pzufFuGD
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68713bf1-ee7a-4f85-1797-08dd9849842c
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:26:07.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMLtwC4PAWeX5Ht0QjZH0tC2SwH+pHMZkbjL4HgHPZ6u3gW15MMszDCV9aywm5U2w0VKpsS7FqC/D7FfJm3+Gg==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5MiBTYWx0ZWRfX+jM6Xdy6vNCL 9nl5Efbq4ELPG053i77BzxGrNB1Eo8Fqu0Vovzqyj3oVASdwCLqXQnN3JVFMFyIpyYOApltF7VZ VxIY57m95bAyhkwdBNZXTnOGdxKWQH4AX4IA8v9ZniOIQQXV6iuTwLfJcRxMWg9p9Vw0TFPLZJP
 ubQV9cSW0yqZ7I3yURwt5V0C7ZXoFKmDpIna9rMbn5tNWCbnnBFmaw4Z8VUNRzM8CKPGasFXRZD YIDLB6A2hMnaLO2v1dTz/JyqBpEdZPKZJ3mwEcqdd91/zHbaPHhAMG8vfrfjfQlvqijXUm/eqU9 8ZQUCjjxR4KlofWN1OFKOluh4IP+mtJ2bIBN7olfsPDcCwaE1Pf2sZ/hqXc582RgmKFUpjjYu+l
 twQgYxt5Hu5FU41qNFDIFjiIT2UkHqOdm9JJ4vttpuhcAdPqwcOoh7ep0OtfyX6klVWtQRNO
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=682d9c30 cx=c_pps a=ZA/WpNGFjgVc1oSscfYkRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=Z2VYdKDLklew4aR_wbMA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: AWRJc5HA4nDOvTUl2Q3-bpZf7Z-3XPhW
X-Proofpoint-ORIG-GUID: AWRJc5HA4nDOvTUl2Q3-bpZf7Z-3XPhW

The QMI_DATA_LEN type may have different sizes. Taking the element's
address of that type and interpret it as a smaller sized ones works fine
for little endian platforms but not for big endian ones. Instead use
temporary variables of smaller sized types and cast them correctly to
support big endian platforms.

Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index bb09eff85cff..7e91c0b4fc52 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -304,6 +304,8 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 	const void *buf_src;
 	int encode_tlv = 0;
 	int rc;
+	u8 val8;
+	u16 val16;
 
 	if (!ei_array)
 		return 0;
@@ -338,7 +340,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			break;
 
 		case QMI_DATA_LEN:
-			memcpy(&data_len_value, buf_src, temp_ei->elem_size);
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
@@ -348,8 +349,17 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				       __func__);
 				return -ETOOSMALL;
 			}
-			rc = qmi_encode_basic_elem(buf_dst, &data_len_value,
-						   1, data_len_sz);
+			if (data_len_sz == sizeof(u8)) {
+				val8 = *(u8 *)buf_src;
+				data_len_value = val8;
+				rc = qmi_encode_basic_elem(buf_dst, &val8,
+							   1, data_len_sz);
+			} else {
+				val16 = *(u16 *)buf_src;
+				data_len_value = le16_to_cpu(val16);
+				rc = qmi_encode_basic_elem(buf_dst, &val16,
+							   1, data_len_sz);
+			}
 			UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
 						encoded_bytes, tlv_len,
 						encode_tlv, rc);
@@ -523,14 +533,23 @@ static int qmi_decode_string_elem(const struct qmi_elem_info *ei_array,
 	u32 string_len = 0;
 	u32 string_len_sz = 0;
 	const struct qmi_elem_info *temp_ei = ei_array;
+	u8 val8;
+	u16 val16;
 
 	if (dec_level == 1) {
 		string_len = tlv_len;
 	} else {
 		string_len_sz = temp_ei->elem_len <= U8_MAX ?
 				sizeof(u8) : sizeof(u16);
-		rc = qmi_decode_basic_elem(&string_len, buf_src,
-					   1, string_len_sz);
+		if (string_len_sz == sizeof(u8)) {
+			rc = qmi_decode_basic_elem(&val8, buf_src,
+						   1, string_len_sz);
+			string_len = val8;
+		} else {
+			rc = qmi_decode_basic_elem(&val16, buf_src,
+						   1, string_len_sz);
+			string_len = val16;
+		}
 		decoded_bytes += rc;
 	}
 
@@ -604,6 +623,9 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 	u32 decoded_bytes = 0;
 	const void *buf_src = in_buf;
 	int rc;
+	u8 val8;
+	u16 val16;
+	u32 val32;
 
 	while (decoded_bytes < in_buf_len) {
 		if (dec_level >= 2 && temp_ei->data_type == QMI_EOTI)
@@ -642,9 +664,17 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 		if (temp_ei->data_type == QMI_DATA_LEN) {
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
-			rc = qmi_decode_basic_elem(&data_len_value, buf_src,
-						   1, data_len_sz);
-			memcpy(buf_dst, &data_len_value, sizeof(u32));
+			if (data_len_sz == sizeof(u8)) {
+				rc = qmi_decode_basic_elem(&val8, buf_src,
+							   1, data_len_sz);
+				data_len_value = val8;
+			} else {
+				rc = qmi_decode_basic_elem(&val16, buf_src,
+							   1, data_len_sz);
+				data_len_value = val16;
+			}
+			val32 = cpu_to_le32(data_len_value);
+			memcpy(buf_dst, &val32, sizeof(u32));
 			temp_ei = temp_ei + 1;
 			buf_dst = out_c_struct + temp_ei->offset;
 			tlv_len -= data_len_sz;
-- 
2.34.1


