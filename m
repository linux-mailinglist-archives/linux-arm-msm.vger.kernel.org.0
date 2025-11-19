Return-Path: <linux-arm-msm+bounces-82477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9230C6E0D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D0F904E19AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846FF3090F7;
	Wed, 19 Nov 2025 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="WKajGUO0";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="K2XvOS9X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F52E5B27;
	Wed, 19 Nov 2025 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548885; cv=fail; b=FSQ9xaYMYeJc0bcCsjHPngFZhZb5a9oN9www3IgpLdPgIRq/OWfzzvvHP4y8JA1Ed0UzocgYnuN0ohXjcjOeOYHzbpd8nRJVXZkoXdQOMnkTdsUt6c5qMTHnvgPJ/5KOHwLlXPSrpNUQobbPswGFKOvh217z6US+k+uZirXUVVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548885; c=relaxed/simple;
	bh=H+NnwxoD3NcxTVTSQQsQbYZGliufwYpS4umus1HILQw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QglgBidqHTQRn8fxc5T1pcQBVWgnNU+j1rp/6KmiROL+Giz/ihW0gjgZF2mCSOZVVzOH8JMVAHXqmdoPGzsfHpAqAjPeE1SuDwvmIIk/ctVlwxjFCc57x41/rb0RKYXFKkWhtaLaZDmI3TCWj7WeoXphQm4Jud9JWFbgMMwLvoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=WKajGUO0; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=K2XvOS9X; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7rjYi023549;
	Wed, 19 Nov 2025 11:41:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=8me1cUGW26JtRXAfMIyxID
	JxRgNmIuktI+eg6e6aUS0=; b=WKajGUO0YUaWNyI7P29/y0jy/D3pNqnlvHQ5J3
	fQVld6Mq8ljGAFOUdCy8FLaSkJ6cA4fZMAGrCoHLhklcKkGpHdVhemHIcJxQ8Mgs
	/42JWffL4wdP006Qdd0sGtnU6MXm9B26dvabPX5vo2iT8GEoDEtvidso2wE3FFn2
	8W7UuePBBtJq8t2jyXEJ49fcDeqFsGOUihn7X4dzdMiCarNZ+Za62ozp7pbtGmMd
	d5ueVxOKDQoEXsLX0zM7JgiFdmA1s4+bnTUVFdqMu8heA38nFdIngdJC2XeNqkJa
	/7AEYKpmtIyzkktphLyEWx2BlpKH5JNhEVzXA3gbIu+IAmoA==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022107.outbound.protection.outlook.com [52.101.66.107])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4agy1kgmt9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:41:05 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq2xiu6zKQk45AYC6Co2HrX2lb3hpId2rL9yZ0nv1XO3+D7hrEVobRhnhneON953Px5KnoQcaLUkEZBhjW8Y7IoNGdp3p7GutOHORMc56ByTTUtygalzQzKMkHP5kJYEGPbkqDWCSMjS83WwQjPDO9K2acRBgGhdYslGJq8yNmfRz7dExw63la4rNcspxeJTrH10H1TJx5HT5G09u4S/HYL/sBFR5bbHXuXw6tlya/SJCoLABkDkoAfdwuyW47qEwf3Yj3Xpyd6Ow4Q9HyEZV+1r/RbDKR5kg1GDzD48+a8kto1K49vv9Ho458aNf8f6/6vTD4MD94B+4rUcF2iqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8me1cUGW26JtRXAfMIyxIDJxRgNmIuktI+eg6e6aUS0=;
 b=Hi/YPyWcxiUhg+y80DzwK+vhJmRsWK07f+GaQsvLOXdTEBSkbcRWxiiCiAlpZ+x3sirbTkNTmz20NE+1It9ppOCDXPw5WAifkywsunivYNiOJiBcVACSvecKXqe1EomY8u4QplIejCEy/hUPF9A3I6CKWb/FQSRswtjfbpFzFfwHmCBjmkD8+T2nD4atRlOODakuO2cEXmzClC0JQmmFBhLNc+UFV4i7ooi3J8Sg+R9CfRBHIdbLYvvZT176G1MLM4qZNPMGa6fhthYOyh6tJlzv3ce/lNTJbzNllzJECxB30hI1gW8wbzKZCXAw/uQAGu1JJq+7bzxYbNOs9hptJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8me1cUGW26JtRXAfMIyxIDJxRgNmIuktI+eg6e6aUS0=;
 b=K2XvOS9X9mFa50OQ5cNKU67zXiuiDYbnZ3E4Lqfg0bCCvoXx+G9lXTpVZeP3XAkguoIsbI+7Ur03mcazvheBoYmb/smT4zoBCFFbmF1dGAgujzVLJtdqFmCDAdu1Nilpc0HdnDwOmpRQGSk1Q6zVls3VPpOZSrNDUh80ur1jy7U=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by FRZP192MB2437.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 10:40:16 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:40:16 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Date: Wed, 19 Nov 2025 11:40:04 +0100
Message-ID: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007566.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3f4) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|FRZP192MB2437:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d0e47b-baf8-4c10-b006-08de275806f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GRjjhH5Fo3li0sgRA/87CrxFyy2WRmApG0Ue5IkaxWERzNYt57r/izhiLrNK?=
 =?us-ascii?Q?Zxj03DhdXoIAFgJYqx70hquqr5HXDG4Z66ccEFc1PEtQ6Ejaed/X1IYcPwTL?=
 =?us-ascii?Q?XEB3M33WOuLdEfXSjiMSOdDuUTMZwSrJDSBbMT1xQ4Ik80CLZ5rZzsfYlPni?=
 =?us-ascii?Q?m+fl0eLG8h80b5UURzKO6KIb/+HrYQymiO5U+WjZnIbvFBrB0otJXX2zegYQ?=
 =?us-ascii?Q?DYMkD9/LCZWh7F4W4XP06BA0GUubvdxwjNoy6vXAcEmr1Q6ewSZw7kp/bCLi?=
 =?us-ascii?Q?q3g+YLDMdkIyoj4BkT16EMfc3bDwyVDVnfE9OQEG0cpAffkz9KEV7DaWe6Hs?=
 =?us-ascii?Q?bM8pZgJptW4GzOlubcm6Qh9OPLuSVzd7bEthkOXImBlDo83A3o3yBdX0N+TY?=
 =?us-ascii?Q?bEGVNsidKRUPIhxBTakX71nvCSNaQNHguo9PyprfaYL/PedMfkJKxeNbsCjY?=
 =?us-ascii?Q?KTDWXrI3CFORyLqNL8Yt+KjzQHeP65tnT9pAEnQX9qZIMJlZ21XhYgIo2mza?=
 =?us-ascii?Q?MqLaAGa7ehkOoNhzOXKfFnF9WUL5xjY5Pp/ySNQUrDZeHvnujR6kR77/Z29b?=
 =?us-ascii?Q?A544Yolm5FkUPyg7of2TFJYicHNf02mjbgaqMDhXnNxXBgjXJ4Fqmki3eSQv?=
 =?us-ascii?Q?IunEF1bxrNhBrGXx44Erl6EMnCFhh8cxHIKfHu/OXNT5hAoj3CTbRczAW14N?=
 =?us-ascii?Q?9fYRfFdWQLyW6Sn+6EnhHcjsYC9FSpUK4gY8MBK4vlrpEFf0Dur+b6Z235KU?=
 =?us-ascii?Q?lQdwpDXUWwDDa36hiVX4YLPN6L3u9E2Nw8WLQp8lweKkfVSwV3XrOZn9Jt9s?=
 =?us-ascii?Q?Wc25Wo7Hs4LNpY47GCk2ZUOZDsmdw7/oVmucg0KmeII+SEM46K4Wv5CGcpjp?=
 =?us-ascii?Q?KP//kJob0bxQat6vUXEu/4kH6KoBb7YYoaJpbz8uD7Nb5/q+NcbhAAS0okLD?=
 =?us-ascii?Q?f1qoL2wQyCs0Wdke71I42QrzPFTvn/u6H1rmFcUrkR0fZyNuhT4YNqhWxPNc?=
 =?us-ascii?Q?Y5beMw9XF/nosn+0pnFwaUTwxhtXHOOU2wK12YF3ZaemRqmINLdLRWkjQqMu?=
 =?us-ascii?Q?9gKfSYZZawjFEr9HLoSHdiYCnYciVXjV+SshVot9TUXJNUKI0zXR1l42IyaY?=
 =?us-ascii?Q?b6a6BmBNDnlCaKPU3trt33kxry6T0b484mOHmODhCghPnOz6CK+nAErBQIg7?=
 =?us-ascii?Q?3B1qLuEdi2mQkUAj8cLCQVYPuu6y/kKHTN/WHVa0Hf9ZmT74BXpW1c3XTdd8?=
 =?us-ascii?Q?2yf8EzQ1ZGQeXLbdZxiz+wEv75E8bc1xfZ+Z3htRNHu8kS5bkAWjMYCVpNaY?=
 =?us-ascii?Q?MgvS/w7dBW9g0JWG+I2gMQzFxuGHvj4jfH7fXguitBPJ+FWpU365HEXw3KYD?=
 =?us-ascii?Q?TK3JiDsK5fNJyUgaTuP0vUQUvGYlJmA5QQtm3vMqjhnzVddHmSIWq2kVsvKe?=
 =?us-ascii?Q?Zm1NdNzcbCOjPJm2MzPDli94XCM2ibsG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IuX9IRHTEONaVihh4q+NBFHZYoGlTHHu8N9xJR9FAbj2ape7CqRWoQKt/8G0?=
 =?us-ascii?Q?02F7VrqHtl6xYYqeLt2/3ob97xGJVinkotOnh5dw6djkCdBr28pwAa0AJlMr?=
 =?us-ascii?Q?lQ/wr6X8868NGSm9Br2QGn2WI2VVNpcPAeG2EXrSEqDSnE6+xPTcgvMN7zN9?=
 =?us-ascii?Q?e46Nt3MYHodlFTm4jVNeKOfDlB72xVg20MzBaKarmK4Hnp9Xnbf/zg6ZFag8?=
 =?us-ascii?Q?PO3dQWk+QS98SB/K5y0645jwfsO3WDuXRUPiHWUMZsMxfspHlhpLGOlIbTCI?=
 =?us-ascii?Q?3U4AasIwjnVQzbIA1QmeioBeebYvSzc8ts45VbTy3tV/E4Vq2Nx0KdPNbdSD?=
 =?us-ascii?Q?Q8vO2F6MClUO6X9huxRCarpyVtm7gyvl8NEXAPbC2ZmUS1Qvj4oQ0zvAmaR+?=
 =?us-ascii?Q?X/xwSC6wBtvICWOg8dKLq2tltISGU5CYRC720pyxgx+DGcyp6yPRhGRoDhrX?=
 =?us-ascii?Q?l+MB09l6lme4fFklAb5lfJ6fDnuJGaa9xo60mzXawEZDPIPayExaAn7zqpmJ?=
 =?us-ascii?Q?6crGnGXkUqnFsbue5a2wflfvou3ovKEs3cByg36qHgXACSdsCB0rbIoYzOQR?=
 =?us-ascii?Q?N7HKzd3nvQ1GYNtq7mFWTLLQUuuQMwAS9z2W639BT68e/5KHWSuhBLTL8Bq6?=
 =?us-ascii?Q?mRTfN6++KMCfg/Ot3LzkxppfIXAYDH2lzk7adXYWJ3Jq+cRF+Vc7jIGGypU/?=
 =?us-ascii?Q?8htoHwjKG8CDSK1hj/ES9fONk3N4BHSdZDgb/9ar86kzMO/FnYw170eFhtpr?=
 =?us-ascii?Q?94gwC5od1QxwJz2Gc/UEnA00DP4jJkFgP1d5oM6+nigmqLk1XnTg2K3ASxpH?=
 =?us-ascii?Q?zxcvaAU5bHYx6DaZ8N099DOlhNjCnLzJIE+cAM7Y7XFmUL3ZsBoepv33wGzs?=
 =?us-ascii?Q?4GtUz3FB4/+DS2B4U3RqcJcMbZS0KDuFQAPW59O5MWgrcbmWkq2gMazu26s2?=
 =?us-ascii?Q?1ClwyiTdMrVnIzEe6tsTM/iKmavAWZYIr2kOFJeerKopmqUrRAkO7O9iFs+d?=
 =?us-ascii?Q?xpIGM1NDLefcoRTv5kvHE1fqS+rx5XCDyIZqTpYHQrYMScLZZy7q2Ic7hn2O?=
 =?us-ascii?Q?jbIWGt2or/zvPjdxDh7XyZYwVH37G2suMiTJ5iVHRp2FI6XTPZaw6NkcjsYN?=
 =?us-ascii?Q?Em5ughLYIya1yFX8HPBj4jXzrMJ3hTvZLvLeonmFWCh9N6eWzIY7Ku/gqWOE?=
 =?us-ascii?Q?UW1BRAwqTW942ZRiL34ku5h5Ua7GZ6fU3zA8aEz07sdZyVtl6dhpibiuM1xq?=
 =?us-ascii?Q?GZ3vPJYl7tZ6foL43AH5ARItO67UnQtvtK2KNEa5mvCwx6gmG/MQ0zt1l0ZG?=
 =?us-ascii?Q?wib/bJpVsTPeLFGpcQxQJK/GLWHAVvKdz5dD8GbLBW4mZao95tK50jdA08aI?=
 =?us-ascii?Q?5lPt34T5EgSW19f1PIlu6/S81otsI6cDyvKdfHmh3KdXaq7bNCBSTac78ANO?=
 =?us-ascii?Q?wGuDs4se93uwXZZhB72AvNo81SE/u6xa2iDK2thxnQBB2j0bkfR9WBuAjbrD?=
 =?us-ascii?Q?eA+w21lApS0l0fYpN3upemIwtzXA998O/z5/n4PAlbIlOEcolrVyoY1qLnr4?=
 =?us-ascii?Q?u8Q0uQ3SVBn60Ze08pbTd6pU0lx/4q1tP4VpiPP7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Os7abgUenxnwYspg4RUUJRYAOo76gNVzJI9g3KfDDP7L21IOBNKqJVHq8DRIAzKmSOW0XOwCkTeIcHjGR8gfTj99m6mqN+/otk7X1vLZUCDLWsRbUqjI+W2s1964BwK0ORsWcO0voZQZG+2Ic0QqzzuawuRLIdm6ebjZFgw5d71pm7WcbHdxJMY90M/+hAXI/72OeuTYd/BFmIOpINp7DkHXJuHbQvVK2acYtATqDd5ERAWohnH4VZcDFLIJv1NaG8m74vPj9Q4zpWsqbtxvKpHhEuf84Va6ScqLJK1P6CJWDE48zzob7sBHVT7D1AebLur1lr5tO0h8EQVQH2KoSwBWUFArjbP47ko5dQeyjzDXoRnITaRLpGRyQHFVu4ZgOYtYKsyzSn/Px+7vJH5IuDvlOG1HXBG1cwpBhIC4UX6Vrq1DV5Spl2UsKX+/DaSjV/8RRZdxp1/t3cp9161djCutadbi4GkSvA6kjjPgAMuQFIRa1jr0iP/blpzc0UunW7ctUi3Roj7oI9xSlVauoIUR0mKTAlO0kWgB1MndkRH6mKdMFly2geaIDyhxcRUR3bInDT25HGUNs3DoCN9fsapZYD4r9PasGZ2kkUytNx9Kqv8/lnKoKSYR5X2BIYZf
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d0e47b-baf8-4c10-b006-08de275806f2
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:40:16.0970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3eL69g1fYRb78Df2m/oJzU4QMSz2cW/7ICczweXN9gnko+OmZOyJCWzLiwdO92NU6pLMvfHLudeF7oGWB6bbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP192MB2437
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: FRZP192MB2437.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: qT4nM56g-uUAO0Qx2ZzxnZzHWAAiGkQ2
X-Authority-Analysis: v=2.4 cv=Ob+VzxTY c=1 sm=1 tr=0 ts=691d9ec1 cx=c_pps
 a=F9hHg8DDxxB1WqAIGSG/Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=80erYkVLYjlaHgj1FhUA:9
X-Proofpoint-ORIG-GUID: qT4nM56g-uUAO0Qx2ZzxnZzHWAAiGkQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NCBTYWx0ZWRfX1VP+UBNah5vH
 IrVfzzGAME00hM5nc+Y+MR7R+ozzDpnX3PjqfMh969wxHHeRmE4hx22lfS+N4m5dFypxq4tQw9n
 QL2gKOg/JzzKrNeq13PX8H8/l6GszVe3jqag207dSpoadu4/17sbK5qVfwFI3IbhM5Ezsh4SUbw
 Zzk9EULEoIH+ZpPo1Iy86PEH0MMv2Lh4+bwARpsg/qLachqMzlOWzj68kkIMikjlP+PaHX7rxIM
 qE2fIEuR9PEmV9VXKDgs2BG07heEpiZYLE3lTpu2o24nfMBbiISjDssfNmh4HDv3QpmgWxWD3QA
 2gdjm6+t7enjN4SfCkBO+CVTtvayoOZQiB1aiExtzylPVULbBoLkbe116/xDzK+MNcrjsIXhe9M
 kUCLJJmVcLAt/RQnImCBz6sVxiAHAg==

Currently, the QMI interface only works on little endian systems due to how
it encodes and decodes data. Most QMI related data structures are defined
in CPU native order and do not use endian specific types.

Add support for endian conversion of basic element types in the QMI
encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
ensure correct interpretation on big endian systems. These changes are
required to allow QMI to operate correctly across architectures with
different endianness.
---
Changes in v5:
- Rebase on latest ath master.
- Extend by capturing the basic element handling error codes.

Changes in v4:
- Rebase on latest ath master.
- Drop ath12k patch to make a standalone one.
- Remove `Fixes:` tags as big endian is not yet supported.

Changes in v3:
- Rebase on latest ath master.
- Using a generic encoding/decoding macro causes sparse to complain about
  type violations. Use separate macros for each basic element type instead.

Changes in v2:
- Handle QMI conversion within the QMI subsystem instead of the driver.

Alexander Wilhelm (3):
  soc: qcom: check QMI basic element error codes
  soc: qcom: fix QMI encoding/decoding for basic elements
  soc: qcom: preserve CPU endianness for QMI_DATA_LEN

 drivers/soc/qcom/qmi_encdec.c | 137 +++++++++++++++++++++++++++++-----
 1 file changed, 118 insertions(+), 19 deletions(-)


base-commit: be83ff7549057d184b693a85cafc10fbd520f3d7
-- 
2.43.0


