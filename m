Return-Path: <linux-arm-msm+bounces-58473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60EABC17A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC8F3A8DD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDB1283CB8;
	Mon, 19 May 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="iqEE1pOu";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="dTOafm/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63154280015;
	Mon, 19 May 2025 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666733; cv=fail; b=lPA0R1TBnLw3ZbToSUXB4X94dFGxIKvbdPMga3bPTq1Jnk5ojxU4ljE6LrCnCzsgmbZfZQoesIcMTFjt7Lto7eHB3baS16mu/1eBkEtB+CLkPT7fBlfjWnu6rucFYzT7oUEVs8GPE84gbdstFGE/UuJzcH7kTEMSPZFBra/pD9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666733; c=relaxed/simple;
	bh=A3+PsPPbfidczE08FdhAbNaIRQV+cCfdt+Z+Ogw9JL4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rapxpdAPZszr9FBVLyzM5xdScdSUckIBsnhLK2BGmuApGk4D9fwh4kRiWawnt7vQgjUVGFuX5x9JFlDoB3xb5sxpPwnlMfEGVTjhG3dbFeWrLYCt5R0mYN6u2q8CkAp1YlQdQM0bGNkSM1JcrxGi0PlMJxLJ3bRcT+Z5RpaCho0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=iqEE1pOu; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=dTOafm/i; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8E8aY020868;
	Mon, 19 May 2025 16:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=qrPFIonAR6yCCujF705PTY
	ao3X/UImDeIesNjeuLEU8=; b=iqEE1pOusqS37cxHjk+vrYPBQuBuFR6HVLRscc
	pYKHFJ7OXU3kMYLtlRX3oqz+gnwFRcO/d/CK/xSjQJePZUjpULZSsvB03iga14Da
	EIycvQUtsfiAy9HI4Fe50RTs4/mmgyAHFaZtbDFRffdFWvxBhYIQRzadS9BYbYDe
	ROGoeR3mzQ3jIeZkHuUuTDEzJghPwQ+QtXKLp6PJ3P08PuHCzVt8YV9LUltoGSvb
	A2Hx6yzcBuWrFzoruAUvzBPQwBE2g0osTRFXtwGB+kDqcM0cE4/GgQaY1LsPNQ+x
	rptRYal/9WDQJTGLVVkmHV7j8wwYEB3Xx6o5kBY1HpuInvJA==
Received: from eur02-vi1-obe.outbound.protection.outlook.com (mail-vi1eur02lp2042.outbound.protection.outlook.com [104.47.11.42])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46pef4t309-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 16:58:42 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBMWYpN3RZVMgeV/piBIjzQVFB2JURpZESkVGhClv9eHv3d8LB3uppEORaCeve9uoGz39NrWd2AS0aXon8kGiNh5kSFlhDqiZiNvlaTeuxNQN6nAiff12U2jCw2727ZTGSDklbRqDiUFbhGDK/PM1Vkc2VtmygDZxnO5nwy8bwTiaRPGSy8nJ99frmu3oiN5ULVhmOX8GiZQ80rcigJAQh/u0bcUCBB/aRhfCJNrDAzHySuvROjhlqT0x9fRcRRrVWbfDDWKmo9FwzbWYP8bItjAM7uAE+2EldoBIkCM6ArhYi9Ctne/LebS0kc9tv5A1KHmdTVaTbKSiwMoyMiIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrPFIonAR6yCCujF705PTYao3X/UImDeIesNjeuLEU8=;
 b=S9KbONZ7KZG6rlcnpR55o5g0+VgQ8NQ3jjHYYA4fTS2I+VIh3WStv4TQJNUqhoA+sFF1E4AsCNN1kFIj28GrV3l7+imH9F9QM9vCgo3UWaJgh096yTUMp3jugZ5WRRhLakPeMEl2opvVhjHTVvnNbpTE6kLY4Tlxj4Ja/9Ir1BmSwkOd4cJ7nqNmTLfXZeDRTLHkKLOFcQ5R6tpVEqFrNv9Ovm10TDagEnIEMIPZ6qvtMoAqVutG1WtcyTgXFNIV9dYhBiHmOHrj3jWWK2C74YrM9VqyoTOwEtJ3FtfqeOy3dq/UY7p7rUsEjOsaJK3pviAaOWfUhCJOYIN626Wp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrPFIonAR6yCCujF705PTYao3X/UImDeIesNjeuLEU8=;
 b=dTOafm/iaavLP/xMdZRjLHIgwSYswHKRzmPqvmH4GCA7J6vrqb8I9V/I9MkdqxFdhht/e8/O8jMnvV9fHIl+LuPKPqpUfqknK6Ev2Wzk7XLjqdRFynYrAtKpcPVQJQk0ISSl/9/7iHLDWpG8utR73irefi99LQTzFmvEMRzftd8=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PR3P192MB0826.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 14:58:38 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Mon, 19 May 2025
 14:58:38 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] bus: mhi: host: fix endianness of BHI vector table
Date: Mon, 19 May 2025 16:58:37 +0200
Message-Id: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0046.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::17) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PR3P192MB0826:EE_
X-MS-Office365-Filtering-Correlation-Id: a2446e1b-9baf-4111-386a-08dd96e5a33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lNoX/dJl1zsmwEPGOvv0/6MyJ8CiRlqd/fk9a/jK9N0KIsUX3Pq9opN2bcgT?=
 =?us-ascii?Q?hL73F2UUgBTGVfqRYHY7kmgU7gXyldqNMVOFrBeu2Vu0HL0UbohKLH+ZGSD2?=
 =?us-ascii?Q?KzvTt0UduztXwgu2W8sdrgZZ66UR5Dc3m6MU9jKfh0wtUO6BZM30A3U7izWq?=
 =?us-ascii?Q?Zx0KuD9pCMwJ7bKl4TevkqB7ztgKwIT7bGZObia6XG5/Ll3O50z8s51tNyg1?=
 =?us-ascii?Q?wYPneialzs6Oe5DOfqNg6GZgonTW33HnNBATlOEmp57jzifA4XHNctI/hb+k?=
 =?us-ascii?Q?Wasrrwmbvs/Wtft095iRgA1Xj94dS6iYmsQ7DlXocI/vJlGLpKaBVmassSpe?=
 =?us-ascii?Q?HGQx0yq6CymNQwgz8khGP2p3uQDqqVBLMfscryzqkuw7pkvkTbqkkGRR5GGJ?=
 =?us-ascii?Q?M0r+7R/CzQwisxf+5gJ/TFKiawQNS+zYIeshqI8SOMPAV9j587OpEPVdY9qQ?=
 =?us-ascii?Q?6F6f/vdfnWuZ2bura0zSLkVUM+/RCC/fX4Npks87RDB9aYrlcIfNVKR8mRVf?=
 =?us-ascii?Q?NF6ASLIWhhgV7SkjtA43QAnRH+NR5MInFMHbiEJjlgkTaA8PkAZWPOSr5Sbk?=
 =?us-ascii?Q?7323CSBMbh/axw8PB8dP3XUUeYhDmFPiolW6gC/TtvvDtVRegMVhMfKvuNtx?=
 =?us-ascii?Q?ygLrMm60y8STvEJvxQ0Dgy9HDw6F9bYdwLGtjtLdaX8w+j5Mh5VGRMLkzetd?=
 =?us-ascii?Q?t78atyC1sQtBjjDpaG9k+fNibZrkq24Ys1xJU67aNQ4Dtii8FNCmzgcALEkV?=
 =?us-ascii?Q?HhHLJztuNLbRIFGCTD+5SXhzos/+djv9SIuaU5QFkeNW3LBvjln6iZUxBiV3?=
 =?us-ascii?Q?Yf6JVzIkHRnXlEvmI4a6PomMfY49RO1EVWbmTOKHe565KtyRhXhyraPRCrQU?=
 =?us-ascii?Q?0ClTwDPXLTRHPvKcKecywG3cWdPtbB+epkldE3krJKVYFIlPAWK5Ad5uHsbH?=
 =?us-ascii?Q?pr8JX12117Gnb4zzZeNsidhRNn+xKg41rIbc/oPxw1+Iw4pA7MzC2SIKTbZf?=
 =?us-ascii?Q?w80nxASdRC2biboZ22tVcLPqTYS5GJ1M4Grx4suU1z/on/G5pGbwZwWivnVO?=
 =?us-ascii?Q?MyuJO2cg9ZWZrPjMwTz0CmxOtykoj0qWJKidm1pfxW5IWPeyFUp40XKGh4yy?=
 =?us-ascii?Q?6BPqJcvUn9cgT+wJicLQrYBYSUSc8TbXlhCEJ+uL00fLP9gUQn4wryQ7Kb5j?=
 =?us-ascii?Q?IcM9rGqGM+MHksGzUW91jNFcPkNZD0ZdyL09gl9UC0snpYUC7GHdTZdVGHci?=
 =?us-ascii?Q?rArVNUlKZiIXMjjIHAQiX1sivJkiV0cuPgun6HnnyBxrVzgS3W4ib40moDU9?=
 =?us-ascii?Q?1FG3W7gk8rIKwnIEcd1GNzfSJAVCFkBGaWMrv/lKe4DJlJRPt2pDvTtVqXbC?=
 =?us-ascii?Q?XFIXuFpIKv0XkfAqCtJ3p6Uo03dIQ6YAwb5uWNUujG1o/u0cp/UtMcoBOApW?=
 =?us-ascii?Q?CGLXptv9Zzo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aOV/wJHE2OwGikdLCReaj8MDXsOrFBtvJDVYfdy9rbc7bSFCTTkhT83NaVKP?=
 =?us-ascii?Q?IASe9OTubqygj0hdrKQ6gyP1CUhJhXZQMAeWkVpr+f5HFEIYe9iH1B9g1USv?=
 =?us-ascii?Q?+KQpVQoG6KVYN5UkCy6SUUcHQINmlWTaeNaVFYdK6TXzCdKLdy6VTZoOAAL+?=
 =?us-ascii?Q?rk0/2hHgWwSiVmk3URCa+ERqVDEHQMG9hMmr8/m0mbS/eDn5QLZxlfZ8JP93?=
 =?us-ascii?Q?ErTcIMqrqZMXazjlEtq8ArI+qNxL2t4wBbgyAXoep5YxbhBZeZQDWPjAaAeQ?=
 =?us-ascii?Q?6jU0BQIAKAyJVBGPhV1P5ojYo9Ki2ovt44GsUhU8Ll6Uh8cvUbsvrdZtiMPs?=
 =?us-ascii?Q?34dAG3V0M/kFrlbL5BkUdWMep7+Se7hrXUr2PKVGGMpgmLUft/B+GzUUgZS2?=
 =?us-ascii?Q?+w8DIzF38M8oit7/Ny1AqcFPDZOISqglvlDmXKEgZcpGR86fBiYe4CWPfuF/?=
 =?us-ascii?Q?dP77wcbnXbzjQS6SO5YaQ+hQgE8d7gKo1l6feCfZVAfk2R5kmcln8NyS6uUD?=
 =?us-ascii?Q?tyfJGEAGzJMKkyMlqcdvXPsPegbWDR7bP2jFeJUq15NaqeD8+4OHy7MnaWFn?=
 =?us-ascii?Q?PdkY8lfkc+N+cvslDT5Es22QLD+LXTJ7xucTq2271q8ZKYl39ExLVtBV07qp?=
 =?us-ascii?Q?neIDjwT6FtNpUmK/siRtvLDnrA4cLWz/ls30hWstzuDccZj7HmTZST3eDoom?=
 =?us-ascii?Q?YnbrUy1FlSrA5Nn82H2TFNQCmfRk1fy66d0oj85qyDMI+DHEDPMKSuK99rxs?=
 =?us-ascii?Q?xQeb464NHt/ePwzDMkSyKEb2/bdOVOpunXHOAkj+tZF54PtwKb9fDweCmyKb?=
 =?us-ascii?Q?919PUQ+PQPqFxv+z9DwGUK1VZBtoKesLZ+SLLImx2P18YYVn69wWV0vZ5PFz?=
 =?us-ascii?Q?F93eTioh3QwDv3VpDWm8En1rKRmUaDM/S4Za7A1DEFjyd4HGUkVlcVdkUvL5?=
 =?us-ascii?Q?iRFcbZ1aH4aXrbU4I8TczNUgQmGIE9MuhxdL3abIfj+TOWPNU7iedoAttJEp?=
 =?us-ascii?Q?UpkVyDYMAOLGuxHdxToJiIALqcuiECJ0x6vQ6pL4gQlO+iKh4HwFTF0cNO+g?=
 =?us-ascii?Q?UyDulyU61w5DP6kE6lBng1e09y7M1F7Ktki3Pk3/AiRGYaeRkug1rUAk4gsw?=
 =?us-ascii?Q?1sTl7CGdDW9lbqUTOpFx3OY9pvRXjZEeOvGWgUkEoM7jFDKLcZEZSTG6H7Tf?=
 =?us-ascii?Q?eSOm8Q7kQxc69hxmTZty7Q93hI+ycILPYahnnJCe/ySt7JEKMWWCDcm+tdTs?=
 =?us-ascii?Q?iRBiweea1COfVx/2SyklfEE/2mn+FR2kmcbnsoqkBtSBYcR6gfiwjhuw2jdR?=
 =?us-ascii?Q?0J8wNLsfjQ9oa+K2p9LxHb66oHDNBxnGrdlRg/H6JT8eyh9aQ5JojEtG4ryJ?=
 =?us-ascii?Q?R+3OK3xduuTfrKmGCP82ZravUfBhIYtZNtddnTV9b8WN86YdJkGcxfhJNC2r?=
 =?us-ascii?Q?zB26CmgzvXXH4paLKGvW2f7v7jf8ubk7fmUKWNxeDGnnd+yVG6X9HkMgGxEq?=
 =?us-ascii?Q?ePmk0E7lpSNx/IM6b04lYVfRrHDNIxYp9gDqloycQAuRXZHK/PyeKKyOqVEv?=
 =?us-ascii?Q?TfxN72C9BQoAh6acHH6co0DnVv/VfITq4bzX9mFh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ctX6J/xHTRBc0Qs70hn46EZ6fUWNA9FvE9XkbTM1JxMLEpNZ9y9RBiqUa5inafiCFQZlonEZbTpGtIMJvIyi0ZwAZWTRad+EgmA1yeb8J584K6Q20iQYSVeBuKp1ckgpFqYEM7O2kiv9Fp1UBLQgIOQFGvnRA5LeeW1XDYkRFUEFkAgzuLOBXOMH32VKhL7k6cVR6+pLxYsEUTlx7vldpBQQpY7OU/JIugP9qNjQzsQxqfza6VN7Hge2IhgKszSX8PpwJVIaH+1SokFJVeMSbVTlt8twaN6B+9KTYN/QkY90FZ66/u0V5J2Rt5cNx4mTxqhjUyoA8Nb3aqgyRdyvrdxxbxL9FmBuf3hEvtv7BXhzBy++TdftUlagl/w8PXml04Dlza/hWk/mlwVTAjVdovmBBkkTbUC7ZMy/AShpq5Lhrz/k5eCTiKLziJoTutq4ixixYFySA/J3anBD68K8ncoIUjLfQGDX8/ZsDkRg3A2nvORCZ4FIhLITQcQia5zCBhI7hcuDiY3/1niDAsFG3Ew3u7NQHMIZHMjAUU8q4m2xy8tch9R7YhsJgTmOoLVLZnr2U0uynNwXlSwpuL+G+1ZKSxNhso1KNy90QNZygjSb7r1x1dAIZO2EJ03q2alP
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2446e1b-9baf-4111-386a-08dd96e5a33f
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:58:38.8012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqUo0wkVU7QEpCClkeN1vEr9kgyaKSmlnbB5zlLspQZCD/omzMW72g6C3maTkV4l50DYMhzFVQ30n3EzZomYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0826
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
X-OrganizationHeadersPreserved: PR3P192MB0826.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=N+0pF39B c=1 sm=1 tr=0 ts=682b4722 cx=c_pps a=W0/Oa3bQ7VHfjgdxQxJ5Sw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=O4OWJBwTOLmvuvOJhrEA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: juGlC09Yhp_1iTr7y_471GK46Sbhls93
X-Proofpoint-GUID: juGlC09Yhp_1iTr7y_471GK46Sbhls93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzOSBTYWx0ZWRfX37Ot2mN+33v6 31dwAajBUIQsiKaEXKqnJotBpae4cojhl1jClo8KiP5ufdcu9CMIK4KkoX7/nrHjGmtTy7z2Rp/ SzVmKKHRu6F9jFaVldTxlCvb4GYkrg8SVKMGPWxmP1AWJPHIZtyEvsj2mUlvd2DzwE/7kgnYpD5
 p9gCrkN4N1SCGQBh6xGv9tAXWyG/+5/n6BCe7nzdoLRlGi1Y8//+LwAym6rvHmuvAuOJqG1XydC Wx0tbQkIHD43QC9BuR5GCmfVnEeEuxoytCHCc8tR+QQ5+8P+jjkJm62G1A4aZRk/aTtFrQB+75p IBodlH4JTF0Tak5t/EwZPV7/Uu9xSDzYVzTrFQKU5ow7umkhp6Bd63NbE8voakvNXcMdrPTWBMz
 DiFEJdY3MicvTIiPdLTHdtk+yqg/m4FsS4RJJzh8PfJdHtto13l7jtk9Xha5J2tHx1SqfyEm

On big endian platform like PowerPC the MHI bus does not start properly.
The following example shows the error messages by using qcn9274 wireless
radio module with ath12k driver:

    ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
    ath12k_pci 0001:01:00.0: MSI vectors: 1
    ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
    ath12k_pci 0001:01:00.0: failed to start mhi: -110
    ath12k_pci 0001:01:00.0: failed to power up :-110
    ath12k_pci 0001:01:00.0: failed to create soc core: -110
    ath12k_pci 0001:01:00.0: failed to init core: -110
    ath12k_pci: probe of 0001:01:00.0 failed with error -110

Fix it by swapping DMA address and size of the BHI vector table.

Fixes: 6cd330ae76ff ("bus: mhi: core: Add support for ringing channel/event ring doorbells")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
Changes in v2:
  - Set __le64 type for dma_addr and size.

Changes in v3:
  - Improve the clarity of the commit message.

Changes in v4:
  - Add missing fixes tag.
  - Fix commit message character width.

 drivers/bus/mhi/host/boot.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

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
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ce566f7d2e92..1dbc3f736161 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -25,8 +25,8 @@ struct mhi_ctxt {
 };
 
 struct bhi_vec_entry {
-	u64 dma_addr;
-	u64 size;
+	__le64 dma_addr;
+	__le64 size;
 };
 
 enum mhi_fw_load_type {
-- 
2.34.1


