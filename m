Return-Path: <linux-arm-msm+bounces-82189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3991C67CDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 826E229669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318F3265606;
	Tue, 18 Nov 2025 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="Mi2RgZm0";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="Z0Eqglf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70776226CFD;
	Tue, 18 Nov 2025 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449154; cv=fail; b=FPYCr2If4byQdYFQNJkytggzdzg2RxBhgqmS0kDOz9HnOMlhAfJtSWkjPzhNLN9ibye+m69zbwcc122jTfb7o104Ba5GojBdrlhRSp+sExKYN+ueeuKS8Yo8Zm0nyyNjnFPpd3keLA7fqEw1cSXVrVNQv4vTDBajAf8d9Flk2EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449154; c=relaxed/simple;
	bh=iBsiS6cJaX+UFDGxd+cpg6XiZOBczGH4xKEbK2RmaFg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dlEIYhpEBQ/iBvA64yhwhL75mKV91yjRu4jIohe5hIJJuCLWlj836xWfh1jzaF8eUA64GDZxX1ckl7M1TBn6NXobrZKc2uvmg2VB4kFmeRv4VP1lWN+Mz06lj43Y2UMsWldJ08lp+sZP0TsxKnBimgpC+lZXn3qp6vSlZ57P00g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=Mi2RgZm0; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=Z0Eqglf/; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5F1X51387354;
	Tue, 18 Nov 2025 07:53:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=/A8XBsgMhkuz2oS3HUcXj5
	OoZchIczlU188wr6lhdmA=; b=Mi2RgZm0N7/uxudz5b4HiZ4JaTS9At9XmyTkKj
	XDjD5Ca4yfgMVcqy2z3rYbda42iEBzEwnFkQc1G5ZP3gnuNJ5GpA8SZM3r3E+Jg4
	yH75f0hXXuyr6C9goAxOpw63lRdHf1OvtFU5iiL7NHKQHyoPfXuTFbnHB/fBsLmu
	nsegIVyIpoEYlrlvJiFkXCqYJtgOOO58lN4buRm7C/ckP8wQaCx4snkTfcO8/7lj
	dQ2BljeMMBQpY2UTm0l1TrurSCwNVSwtKRRHD394+DjBnspY0rmn+bVkzPVsSy6+
	A0mncHIM3rBlaOs4eJm7h7LuwTxtfCZojKjsZ5XWMb4OmjiQ==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11020130.outbound.protection.outlook.com [52.101.84.130])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed52mhu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:53:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI45KWgl4fj7HKtMC7xU+lKb/Y6sVGrWotN2/oV41z9f0pCYCUJnMDVKT6puwdLeSS1uV18hwwp4W3KCv9wWBKbOW+sWuS2SxQ4c51bjLdRC1KHZPKmCoLuFHpGyT5udNnZfz68DCYYumitoO7b7wfsdOc5kVIIS7cROoH4siub6NnHl5yVzrAf/GBdj9hzs80aC9X14AjIcaIdWImno7SqEa4osnMCdPiwC/8s5gOFKO/Pr+k62D5wvwKrofkAkgQnvqMkl15w+2mEAgU8EIqi2KvyZi3fHKesduqT5WCMrSBjp0nI5bzIWEY1rdC/fgbwG5hhE50Qw7c92VVgdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A8XBsgMhkuz2oS3HUcXj5OoZchIczlU188wr6lhdmA=;
 b=BWdiEpp0AG2y88f+XDtOtoI8SqYS48SoRl2NkbBP7pIk66loOVeKqO/RTTq3egjCJ/6o3YGhA7KUfPxxLJYNp5ich4/jwJAiHp+TTSU2aMl7QCPO++FAY++FYfE7chKSA9QRnxYdHAKCMP8CPmC2pfG3ThfJ3elncAf+iAhi9Vtw66WZkabKdHtTb4moQSe1I+9CNTdehNCcfykK4w/R+2jPjy98hqjg6lWU5GNNz9glwpU0jVuu8ToNVQb9M0RnxXYq1enCMfbLpUhzyzBqHkOTP+VSskJuAIAWQJeHQ6LQYV8owUwzR6QmAVfJUVwwkSr26JODSyduIP4TWNj+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A8XBsgMhkuz2oS3HUcXj5OoZchIczlU188wr6lhdmA=;
 b=Z0Eqglf/zMHK2GC0Xr9MYP6tullXbrxzdjzkM3gq0f8OxI2Rq9Homm1PsoPDySzNvcffw0Tpsu+FgMze/QADdyoHl01pkuB5IaocRuwPYK5vdpoczbZPMzAepcfHs9bt6AuiOnMBjYk2ZyuXICdZ94HdZB1GXpAugEGRP+n2qKM=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by VE1P192MB0653.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:167::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:53:45 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 06:53:45 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND 0/3] soc: qcom: extend interface for big endian support
Date: Tue, 18 Nov 2025 07:53:38 +0100
Message-ID: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003855.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:15) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|VE1P192MB0653:EE_
X-MS-Office365-Filtering-Correlation-Id: ce479279-3a0f-4500-ad95-08de266f37e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7DIJ5I6BTPeDzYbaMGcLVeQPgE/NXZLko+q48/lj6JJbtthRNdXh+w5hdn8j?=
 =?us-ascii?Q?/uSC6MjJzh3eecrx5X27nvhr75dL6+MyV87WXCOr3WQ6QFBHRsM8orBgnH7r?=
 =?us-ascii?Q?0gCsoNnQD6pMSPE1sus1M+wgaDCIJyvR/okFIQ+C78xOsaGU16Sr4Q7oW+Tu?=
 =?us-ascii?Q?rBNuEcxq0La85vciieOSOeZk/VF+XwO5sMEVMZYUPnHS9K2UIY/aZC9bHYvb?=
 =?us-ascii?Q?6QHs9j5bP0n65RBYamHX1dvrQLts+C8Ojj0YY8WvmuY1R4Gi8G90hU+5b5a7?=
 =?us-ascii?Q?sC+9OecDxSMaxqpM4cuL6pDH/zWNsqzbbBP2Hbjmhz3euFR+u5WTAigzpquV?=
 =?us-ascii?Q?CSfYPi3BpVKRPZS7R2/Fe4TGvXVu5cP79JiilZRFJhLr6TO9Z9ST+TZlSg+y?=
 =?us-ascii?Q?v2ewDTJh9vSiNcQXFgENBL/a4beQwHqHyuQ0lGkwctJDMYILXgAd1bCC7LoN?=
 =?us-ascii?Q?UdrgjGnOZTnpqns0ScS4Fve/dWvegutu+E5sfz+lz/k4DHcn3A8uyo3FVVej?=
 =?us-ascii?Q?VeQvzSNHVQvwJB9rv2hNR2LUCfeNk8HIwzF9kxMp4gcxrprKmHLzmR6rsFX2?=
 =?us-ascii?Q?xtG8FIndcmhnw2a0l/hVB88uVYZjN569GJ0T9BQ3o3qAaU8CM3zYzXALN1lc?=
 =?us-ascii?Q?lYDVMhqwF91QqMJxgNTqfb1rak9BOa5N5xRLcJ8nV4H1D1u5L7XPzDopFPIF?=
 =?us-ascii?Q?jbKlvtrx5+5NuORlzJITz4XDARn6QTn6MfSSen3pDNzv1Vxl3E2c7N/loDeo?=
 =?us-ascii?Q?7GzadmWPIzo5QZLDZVQwcjk529AYhhs/LaUvc4JmV8FYTIIePnGjmuV46qDn?=
 =?us-ascii?Q?hAzMDxCJ0NXZFo2iw+nJWH9ytJF2x2piEjzieVj6v9CAgOqi+clK+kGQzat3?=
 =?us-ascii?Q?OxzsUphjHrqeNjffye3SfVuyQnlw/Lt5a1LVtjXxhk0JkL/5oKAnM2vHzKjp?=
 =?us-ascii?Q?/2VktSHdf84F6JG8roogBY/2NT+28a0SzM/Egz5RH+F4I8/My3xT//88nDRN?=
 =?us-ascii?Q?Z8/MonW9TqMYoSG2+OAK/I5LvYph0A67jJpVWOT534G7xcFGsexm37fl44Df?=
 =?us-ascii?Q?idluq7cLKnWjfRAocbve9hhX21/rpdQU+lgQINWVSTimprfdpP1EQ6t6dLri?=
 =?us-ascii?Q?RbgeZDzfZC0ACYiMIsjqgc6qFzsud5HIYOUVGiWyI5Dx/1o10FZn/fcGF+IU?=
 =?us-ascii?Q?AmPfODCK5JhqOmK+avuYjnHnG3ffRh0nej6kvuSqxwG1axS3Abiu2UQezO2w?=
 =?us-ascii?Q?cl9DbzsAvAgxHBWbVDPIa9TJlnXFORaEtf7D7LxnmR3MWrtkGOVv1KwcyLgF?=
 =?us-ascii?Q?3dtAVOCeTbFB2Ljr6Rkxmq87BfY4IJUlo3I44fKSkGwqnkIUHCgdpgrSv/Q6?=
 =?us-ascii?Q?0OzfoL+aAdmN+8lGBJ9V2NIIWGkBISXpXpyVlRdDO9Olr+FUgD4t+wUJABXg?=
 =?us-ascii?Q?63i4D42ve+Zt0NVEnXGAYvyMHj6pKAb/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sg0QsWWpPrWluvQh9+XHqWAzb+qPC+4Ew7FJ7fRfGjpVI1nOh9oYf6U4krt4?=
 =?us-ascii?Q?w+8NZwSXF5UTEOVuJ6J/M//E9458skNQZLQ7gftnuuqH9nVeEge/o4TA8uLC?=
 =?us-ascii?Q?AJuqiu6sIAbhY758pf5lPcj4jWavEkAyiAGzyycV0m6UKOt654PUGvu3aWf2?=
 =?us-ascii?Q?Ki2/mURoOqfogZlPvLTOF5ja6tq+H7evxXCAWmIOcy7ynVyxKt5vzqCL7XfX?=
 =?us-ascii?Q?aRnBC0ro18HTW2Evr61gZNmxpi6cCF98x2YHT1fuDJWG2Az5IB1zsprrA7Yf?=
 =?us-ascii?Q?v5a1zfg2aLGLYXcO4sKRPXD5iw0/NHnHy94Zy8GO8mPavmoqetAzu78V4fwx?=
 =?us-ascii?Q?KWsJeBuSjFRAG+ynTcYO8tZS6L4yZNFFT2Mefsv3McbYMgumdOMRL2Sd//HJ?=
 =?us-ascii?Q?QBRP5lzxPjV3vbg86fLVrY7TdsgxgiBjS78LhVM9xavMXrafjhYSCdSOvpYd?=
 =?us-ascii?Q?+G/AdlV26KSlFWDbnnTJ9ycpsasstJN9f4iUh4GwhEsBbGpeEP/P+EagJfVK?=
 =?us-ascii?Q?v2WKw0XLguV2cq1LmF7bNaZ0cb1szdTS+SIxTaiKlwFs6A++8GYP/zMxCKUq?=
 =?us-ascii?Q?fKylZHXfo9rYIXmsCIKnP4KuHY1VnIHjblWxhSesS1AqwoXsdmqEdLjb5QDX?=
 =?us-ascii?Q?3u5w6AbCbFvxZT3kr/PCOwCsQ5/n4EBqzfH0S/YRd/Y1Sj7NeiZ/yK1Hu+Fw?=
 =?us-ascii?Q?5IDEhXnw2AKXQFFVJ2umH98ZrGiiiBucNMK6Wq6zRPYb+XDQK6o9iKWbbMHP?=
 =?us-ascii?Q?P3BvB4PltQ54Vn/6CR0cvJMJd58DIUsYOxaKTthdIbZvf4Zq1mMVytNe2WpD?=
 =?us-ascii?Q?NMjjRVlCN9iXEPkO+M+4t+QC2L7HHPEQb7wOKEuBnD/y4oZApDEC6dOl0tco?=
 =?us-ascii?Q?bdAVWIpKAjrrc030bHNAzYVQA8xg9YsMdXS6wl+pgrCBaDCu7cMILgRvIsL5?=
 =?us-ascii?Q?BE/1AfSnbJXltFNLVKcWgIThEALcIS3EcdONQ8ymPpm0dMzVfpsbD5NZRhvR?=
 =?us-ascii?Q?DX5mV2NwEKPvn/8A6oSXomYIbWM5ZWeWjcJ/8AzGMdTygrnDge8ptpvE44UH?=
 =?us-ascii?Q?1gLsSeVXepwdgUmtpQu31vfgHvqEIcHnCAhVgTo5Od0ZNleFxLroKJaxXi36?=
 =?us-ascii?Q?uok5d16yWG5lIxYDJJKm4dOh9Ee7DGwAZRDhdwxxNnMstt4OUeKUh6lhoFRw?=
 =?us-ascii?Q?8hk18Z273Pq6fsnJ2Qr7W3Ie7fa5H9YQeXOcgcOsVYdAw3X2Qp4Q7VsT+TcJ?=
 =?us-ascii?Q?7qeupuokI7BIUJ7yLY0+Y2T6faqNXQiturgmD8EYTL7yeMKh3rowqCr79qcG?=
 =?us-ascii?Q?sUlFpKg5xW2oGYFa8ae2CT1P7lGDFno9pDWmPAgZspIPOk/jaCFTSxksoCx5?=
 =?us-ascii?Q?klncYYtNwPsWBpcUSHuMgQCOXZPz0rW89tVP0/+GNNS+fFZRtn5FQyI8MOZJ?=
 =?us-ascii?Q?xz6fmT/itUy/oWWNBrTPmEj+Fz3nCIT3xQTkICXdviRBKFw7KqUu59GmMqrk?=
 =?us-ascii?Q?kPcj3GZXCpTYL/rniK+oUwQIFyGc5osrqhyCSkPCzqaZ75aY+1SsRaQhwZz8?=
 =?us-ascii?Q?ajEqfTXrUDcnmpCxjjYZIslobLqeEUkVH8sTKtSa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MvTz9tK9nI6UaBKy72Ts7UaPUumSxbZiIPhWU+t8UruHAH6tKFMsY5nqLYoQWyu2zEKEKFWEKaNUryAttxRzcyR4YjG2lLSUt1gnCzSEEQAwfJq/c5t2kHRR+U7tYW1717DIqZoT5l6/v3Wr1YC+5YYIHhKY+HaMP689WqKfhRUnUFWrfQpiLsxEgXU1ChUzXAyj/U7qJul/4i9Rk2je9BjJtF3YPD/PrpvS52HjPJj1BOeHw7h0xRmyz3g4YG4/vs4cG88qAYaJN/2czyBcS76Y7xD8pQErXfz82ZUU6PMtSFW1HgcVZ8JOD5aC4/WVY2e7+e68DX67Si9hHmJBxYvgVBuuQ8rDuFloRy32AbM1Ax3jRq+blz5VTv4kTnFoU15nsdk2GH7lCn4USMTvxdDm9hev78X5J6RZ6I8OtAEb57dxSeiwQXZH8taRO23woljDbyzSbYDggKRf8IkXSSvR/+O566ROsv5xK1HJN8K22zkyYaCPQm5GOXPXys9B2G7NQ16/pvJPjh5wgWT+7HBasjSnONxompAdutTbQ1Qv3VjFr5Ids1pEUiBct0/+do/fzhLK29crBjU+UyZel+N7jdmtfRd/ejWWFc3ORWxbjg1/dFKrG7HBexey6bj1
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce479279-3a0f-4500-ad95-08de266f37e9
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:53:45.5084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZCeTw9GtyZ7Y3f2xczFpk2VWfkNlvRCvU8rwxB5ubtKCu4rNNoBTu5BM7Q0WYGU1ZsFfYX331CRbe2cK09B8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0653
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
X-OrganizationHeadersPreserved: VE1P192MB0653.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691c17fe cx=c_pps
 a=Q67dIzWXlOQ+KrpM7kYsAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=80erYkVLYjlaHgj1FhUA:9
X-Proofpoint-GUID: gCi303aCaPfZjqEXTJdlLePxhVUvcPNa
X-Proofpoint-ORIG-GUID: gCi303aCaPfZjqEXTJdlLePxhVUvcPNa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1MyBTYWx0ZWRfX3Lcl6Y36BzXH
 oRU6yHBJlpmwpbiuTrrifKygIBNgNpRJBRa1Nj1rYu8V0mZv/odNij83EMp2i4N9b22P0ERGQTA
 ioRlyR3KxSwNmy7J0o/JgDaXF9V/W9R8sfqduNDtqAjjRiHBSoRCf9glhAnF6MDKgMAllxyvJ8R
 0giNeCI5ykHrT1DpGLHAvVbwVg9m0RZQmabnIpJ/2StwZw9GLbhcbTjGaQxB+ufekWYpvz5uWO6
 HaAqYYDSV5w/GTtK2dKYyhtn9F68lo6RB0+DJjdWJZ/N+Mse2gdBsiQRuWUYSOFInWJk/fWcdWg
 hjvUAwjynQubb3UNe4KN4T9EZW6nD2cYaCgKvApU2dGPZjPS055a8Gfp7HAiBHeF4ZspK1r+hvk
 ctql/CG7BiGUbQCGbxyPInMY11khww==

Currently, the QMI interface only works on little endian systems due to how
it encodes and decodes data. Most QMI related data structures are defined
in CPU native order and do not use endian specific types.

Add support for endian conversion of basic element types in the QMI
encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
ensure correct interpretation on big endian systems. These changes are
required to allow QMI to operate correctly across architectures with
different endianness.
---
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
  soc: qcom: introduce new QMI encode/decode macros
  soc: qcom: fix QMI encoding/decoding for basic elements
  soc: qcom: preserve CPU endianness for QMI_DATA_LEN

 drivers/soc/qcom/qmi_encdec.c | 101 ++++++++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 17 deletions(-)


base-commit: 38cf754c15eeb0d80fbf52c933da10edb33d7906
-- 
2.43.0


