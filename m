Return-Path: <linux-arm-msm+bounces-58049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8777AB827F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 586F64C676B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96765297A44;
	Thu, 15 May 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="UL/Z/sSp";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="Q6559a+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E529672F;
	Thu, 15 May 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301186; cv=fail; b=id0IJoouoVZknGTjgdndanLfFMrC6ccYZ8aKlzfSsweTH88Uo4roDws7q3k4x+RNRhQbYoJmV+23BBZRA/cKwH/wXpos/zQcZlZCjcPoru1ECBOh4+THFwR0H2Aiy2TPBVV8TlyHaEz9Dwybx6t8IPYsEjbLg9gUCHfx7hkoETs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301186; c=relaxed/simple;
	bh=DvI2banw+EJLj1fb4C+OJeqomF0G5pm/Rl5AuHJLWAw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ND7yn2EsoYbrYf33aFNdJG/rPvDI/mr6XVBpP85ZuBY8SjYsC1peIu+u4Wh8PzEWcUQvipdBGVcwFkOF6l9okA4sKer9h3UD6d8lX8HU5UfdYabFDi5h4+WJOHIhOGarkr5A89vrRAwFgtxUJ+14u6thSHNbfd0BiiRByIWZx0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=UL/Z/sSp; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=Q6559a+p; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F5ONbF007462;
	Thu, 15 May 2025 11:26:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=3LYbtMWE9yZQU/rSH5FVXu
	jGu/kogyPI38sY19SKHlg=; b=UL/Z/sSpzFsO1pcbxLN/Yp6k0D0MVyJLP+xT/o
	3PqjtRuJyLvZmAK+Mjhpe3Ao0GA3jIPKImG10VF5kShoZteQQLY7JcJ24nVD9CfJ
	FGI4f4W7o8OAEPhHZDjbFm/Clfq71uvH8CF8+apBmMbqBhM28sKUBSpBfq+WuamX
	bAuxZ5XW8pbvXTHDhFnfg2CynHRHdbWrH9mDNlThMlBjRHf0RCj46AAbR0k6JVQh
	TJQwfW1ODQNw//xTid1Wls1wKVbhw/hFvjL7w4Fc/eVi5CorVw6gZwjpDcyedkXq
	+haf4sObDXTJ8MxsMuTlOWrUzoWcDIjbBELndZBDckFLyBoA==
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46htt45n9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:26:15 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrmMhYmuZ7UddRQwc0cSdQkvblcxAEfh3ftI4dpESrgj4detpCJs1oSQrXCelv47qtLSPI/0CLMQhaz4F66VXbnsx59LgdNNK705EzytVaHpTn2J9sdQvawq2aAfwU18LDXe864zZ2RLAwD9MCghMncNVDaP7tP15q14I5+eCZYXJpShPjs0RRl2l47AiwZHp4sObaKLl56cuOyXAugn/fLfkIIwJIWRO29YKMpEKtXE7qma4TMxaHxSzaeS63qC1hg9GIwDHxpVm6V39r4hGGHNPEuzrrej+Rd/tRlpAazPNQA4/DIIZl2oiCJEVIUxv9Dfv88me+K2RCj7yZupWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LYbtMWE9yZQU/rSH5FVXujGu/kogyPI38sY19SKHlg=;
 b=SPv5LiHk1e5jA6wc4qPSd+z1ZwMBQ2l4Tl8uIbvCsyr0VFDn0rnQtO+D877/BVtMXnVVmv4fIaurOEq1FnQWfARyBoTQl3SAHMfvXrZIbhXcIT/K/Gi/gEZYbSJECG8n/5KKclN8/S7TaU6VknbYcq2C3tjKEKKovyMg1cRXBcNhe5HRg6weKT8Op5aEqNSc+T6A6tNe03oDajL1Fu2kHRv3knzNKpEUE01QspnyYUP1kptl2IobQiZvm+N8Db5ttTQNeImZBIgsdPQ1pO4IALjN1E5c/nb6rKM7Ajr9N0WZscTb8+GIZRmeIMYeZGBFQgDigEx5i1rjMVnxTlCSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LYbtMWE9yZQU/rSH5FVXujGu/kogyPI38sY19SKHlg=;
 b=Q6559a+p2FUk0LkPnjW6vfkNs/KvCQ/RERZdVex9ZCsFkijdE7prlBi1Dbjwprnq2u+s1Om39Y8HdKBs6kI+SljBVKvBwUxN3ozf6MoIEgxlQB7nGVFRIV7lzL7TRwu+PlVZ5EvxIhzZnpgi09dRw3RZGATvYpstXU/d2y/8NsY=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by OSMP192MB2490.EURP192.PROD.OUTLOOK.COM (2603:10a6:e10:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 15 May
 2025 09:26:10 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:26:09 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] bus: mhi: host: fix endianness of BHI vector table
Date: Thu, 15 May 2025 11:25:24 +0200
Message-Id: <20250515092523.1724845-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000452B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::351) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|OSMP192MB2490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0bed43-4b4d-43f3-c585-08dd93928713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DKAkioO3oqmYt2hHSSFHM22yU5ZiEkr28dRL013Sanml/IK67vuRHQQMHRDl?=
 =?us-ascii?Q?uL3lrOBuKeL0iKdHZ6dEmil3dlRNVRGiTMt+xMQ1LZANAYUUQ8HaJ7po/6Ra?=
 =?us-ascii?Q?8pvDLECty5br9Ura1Ein1MnkJRiWe/WFA/wHF3rDj/uKIoAJixVKu3t4KcQf?=
 =?us-ascii?Q?c/vOJAnYPLddMp/PwDPMX0X62Tgn0NT7y2/+UaatKA6iDCgjwbvtQjp6vv4W?=
 =?us-ascii?Q?/YubN4uTfimDE9x6lkeQlPAfEV7R6e2kYHPK5KLkI+YRyF2d4i7e7fWp6Dxz?=
 =?us-ascii?Q?CCL+xPLEdu2576F9khm5rRWPZ0KgtvfDflY1KfUZYuGZ2c1gKaBP4lmM3bvD?=
 =?us-ascii?Q?e4UGIhiC/l1xzV6CbAasnRzH4fg1OqBAjr53j/nWj6g1IC5eNt43ia6veiXU?=
 =?us-ascii?Q?6fqrZu3OOZx+SbWhFPNJN6zBEwgLDbLJk0cjZff1ulE0bJjo2BUZZhoEU3Z+?=
 =?us-ascii?Q?vEVpmRIlFxRrqZwwgBK8Jr8Yg7ShXq7WnRZjSLif292LDe0tMs0Hu6r5d4AW?=
 =?us-ascii?Q?kCMBJV3U3HZ6s99+RF9rwrUuVBHtHZSmVWz55kH3afEJkSFsrxlPw89Skorr?=
 =?us-ascii?Q?6EyXLaMvHdHH8SKPVEH6GuKHgPKxuh4wLjk/f6FOlMFNi7m1bmlhZAs7Tb2m?=
 =?us-ascii?Q?Z2IE8itXPLF21Kux29/C6OvvoG/GcCRnzLntyweiB7EW7nYhyWmlex5UlPv0?=
 =?us-ascii?Q?QzV8gRDWQ7FK3oGtLMOAA5Ix/SJw0bc07Nh1eIbwvgR8LK+abHDuaU6xcGdy?=
 =?us-ascii?Q?USaYOtTztAegsnPyT0m7NM8Y8nmGER3W65RFDP6WYbJD4D9UDoegn0fPPnaT?=
 =?us-ascii?Q?ZVuCYN3nSxcoEtiS/0OVug1JnP7bqEcy7k7HfOH9sQnDgA3PcJzj+ezAnVNx?=
 =?us-ascii?Q?aibGdqahA2Xn5x3dtdWhlnIBvZUnZea8fJV2XRIodieXxlhm5tS5+D5dBW5E?=
 =?us-ascii?Q?cN78LuVcpTse9ppn9a/lnsSdpUMkzBc4t9i1vCAQahaZ3YY5YsnSRKiu/8mQ?=
 =?us-ascii?Q?AAf249YFGQPeB9D+0zR44UyhYFfOGDn5nj79hQkwn9EyQNmQrO1G7uFs4PoJ?=
 =?us-ascii?Q?dwDJ4tFf+Waejb7vjvJWsjhCjsNXs2PqF1XBVQ1lYiZFKkCrl5WAUgWe4+e1?=
 =?us-ascii?Q?p1v3JgfpjuvxFo4ggWXPk4Z0D0bkoT0dfeZnAj13nSIymSfq/PxcKi78y8nA?=
 =?us-ascii?Q?+QrwjMtDTZ+PvNe3ynF6kTC6N0FwAFGnfzu7KHQSt/0M6oPAV7XYy21zUsYV?=
 =?us-ascii?Q?v9E6Hk3yjej+IhFAjAny5HKbM3Y7YLW/Z8Nto/rnDInrv75/YPgS427pM93H?=
 =?us-ascii?Q?hv9HA1apMG3SRA6XGumxOK7DtOyykhkkS0E+qoaVwlEMJw6FIsuNrc3KDfXU?=
 =?us-ascii?Q?okXFpnfyLcZalcQyWTmyI0kyYQRAZpWu054FzPVQJxsvzkll7T2OfcseZl0G?=
 =?us-ascii?Q?/4pGdbzEsmU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EyhTCzFtZLRAPYU4cAISAQcKpuWhq82yvSLTmEyNcSLVSr/UYP4gcc6tumfr?=
 =?us-ascii?Q?eqF99cKS///KCyIoebcM6X1y0w1uyChR093sR2QEYbaMh30boMh/Wi0MX85I?=
 =?us-ascii?Q?UQbpNfOf4wfnKd0UeIeblhYtiRhNH8iYTi9Bme1J7DGCarrx70qAZYqmbtir?=
 =?us-ascii?Q?lwa5JYVHdEgX5zrzgaNM61YhEJdYc0Be7QBT3wo/5bN4slBmq+wEdtO0qxPW?=
 =?us-ascii?Q?DarGpreiORywtDYih5gYq9tIds10sY/bSKZjM1wll/KJEsMTBy4YTiJyHSKi?=
 =?us-ascii?Q?ORokupApIHq5lZv/+8LYZ+SsrGdNKZQ/tCHd+6DrNw2Lw5GjtyJ9wxrivLyv?=
 =?us-ascii?Q?XIp1TFTGwwKPR83ZuWZ/yPee4NTThQEOaoTqyiZ1R9d96X075lhrEH+0htCe?=
 =?us-ascii?Q?C/bswdI5KD1662P8kk/uDMBVcWQoEIYEFGbcm2pNVKHky12lAjnyQPDylI4O?=
 =?us-ascii?Q?MF6LcQpvHPOCCNwQvKIKwjnZetF0bB21Eowump13cjaR8n3HUoOfZU+8oKTp?=
 =?us-ascii?Q?nowHDZdebRp0obnCtXhVcUeIFsladaDfAHiTmlqFzfMbdRSvYIyN7Y0jgkbk?=
 =?us-ascii?Q?LTFBGS4MytsFS1+ztX0oQozIO2KwgELH18mAGwdO0ducfadmrBMQXBaXUkqg?=
 =?us-ascii?Q?ipstGmKdC3Ge9xvmyIwhNGo7RaLVpYhLcwr/wMObCyr5mRkuVMWGlOV8ndN9?=
 =?us-ascii?Q?WF9AO8MkkCd3M21UWjJdjO/DdCww1B9lYf+zRD3q2HRCVzvvY4L+DnDYwpJY?=
 =?us-ascii?Q?doaQviUuOkRoFo3xXQxH8Oxdm+M565gp5BoP08GAsGb3xLYtdSIboJsfMnii?=
 =?us-ascii?Q?xli5zL8ELmpSf6f9TJhoIn5TbB3JdGtyAVKAi8KLXtihv/v626c8Q+P31qjA?=
 =?us-ascii?Q?TZUz73q0Mogw1v/BTrjpWJ9jvMOT4flNq90NSqyDzKdgBqhYRjJBMq/k6hAg?=
 =?us-ascii?Q?usmFTCxX1a+fdSx7VB5HalG7TJ6IMHP9jFVVrtcBCSVMzAdLi724/mO2lL4g?=
 =?us-ascii?Q?Z+ERGz0IgP7AcERosRxJ7AlohqJ5Qe2bBHTlf8dSPeKic303bEhuSyfw6MUp?=
 =?us-ascii?Q?hW1Jl12vVKEyYeayvMXoLdIgw/ITYfFCVqxQhzBgFeP49dEWfAAl5QbWqDbV?=
 =?us-ascii?Q?Y4wQyvfedmJ2Utl3wRJRD3EAp4JeTB0RoS3h2DpNorMKqd9vxnUMjt5o9Kqd?=
 =?us-ascii?Q?uBOZH7vSXpwtaLDYA/okJXWZy7DEY4ZkjCGWVDQtgYIfexYBYyHCqcH0gb8Y?=
 =?us-ascii?Q?/Pujj2tk1iO+nWYMsB+ds02OSNWVQb7+6SDzIfYChVxSVFrFn/S2owGdMt0S?=
 =?us-ascii?Q?Y16A0Gxf1K2DHf3BJz02Xz4z4rO3iDBtjAx8zywhE+v0L3AFIo7q3Q2+aBeL?=
 =?us-ascii?Q?Nph2rfMhpJPoe3kdR5uT+43ZbKobIevXVd8rMa9tzLHJ2zN/jFn1BGtTF6zC?=
 =?us-ascii?Q?A99Udl8elBat6Cf8MjPgQxvbxoMSAs9GpJARF6jcZbp5q1x3kSgUA89y/r4G?=
 =?us-ascii?Q?sH3WZpdTRzyQv8b7XqMsEudq3QIb3essZZw09KY6x/vDc/8u2kHtfmtSJks7?=
 =?us-ascii?Q?JmjCtp9g2XcJwU87KQu2j/0n7/w9BX2qDT52OLYp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3FRMqZjGcCiFtncttI7sCs1dIUVaZzi/+M2iLKRWGyLbehOisqV6CsSgWBClcHMrZEZP1iVs8FtqNZDH1yROYb7XYjDNgklq5Bu5lQuNoJpXgj2xVWkZCZTi9bb3ONfmiFEW37pwvoziqI959EnG1TGFAU/PXucTJpO0dKl0oYREmaSy3+8RzjXcvcQb+i2NJKTqB+WMhVWUL7+b5h2FVuScMBUkCgkRWkJ17cGZerTP92G1pFu8+/6py/zKmDZQ50sl7xODWqby36r6F0vHv6uE5fbpS/gWHLpcNEJbCwMR0F80ASWsmvCL3E+xqdL63+9PFaF/vlp0Q0cDDbFYHz2zrbnz3fGJH9UESdj/C3LIcW3QLVUJujxAowNQpmiyATYhA5kmW7d0t0AMeSGrjd/cD3YNLxWbkclnCTpv+tKWyTWgv7F1X07/Mr2AS97W4SDteOcgEXOdVQf43IyOrB6RgZD/emHxL1Mv+p9lYkxIoWtBHtKf58KE3zYBI4JyjrXs3m5E2QQuo1j1fNnQQ2CNCbi/92E5zvZuw4dcmlFr+DKfXO3UDiKnysoPDA2gR6kn6g9dmeRhG7HN4Y56fN2RzhV16cjRAcEWigJExCbnrUftocZYArZdVqffj/zF
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0bed43-4b4d-43f3-c585-08dd93928713
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 09:26:09.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+IHZcOTHhx0Gx182ViIDQYGofun2P/PluXuMupTudc7qxyvkmyqhE9H3xYQnBPHk3oiyhv+GIk21WJdn0c1dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMP192MB2490
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
X-OrganizationHeadersPreserved: OSMP192MB2490.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: fR_uxgfpMgDD19NjdXRuVeeFqRe5aB0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5MSBTYWx0ZWRfX8PyKuHkIc0SE cfoicZ2RnLcSV7Z1hPpS6xqyNlm2uHcwn+wee2WxwGWObo4y9vwPRC+OZzOmGWUcMsBVq6s+kxs wSOXQZSW4Ah62PjWL56h4bbIY9AAzxRUwlLThm0VfiywHc9He0xLUxq/zciwMe2026nqFChILqk
 aKyx1vxxvSavbDGvHXR/7GeX2pEwVesyq0J7A0j8uBONNGOUlcxlkoA9M9BnkOAO5KEIp89QlLu K1QhbTjAn92q1RoG6FFZMdJtnAAb3g6+oIdgKR612VRSR/fati3kBuUyKEpCOq706lcmd8hIjxC 8ozMv6nXBI3s9e0tPYSGxmazSnNGIgz+arndrSymWwnIq0ZJmGVDaXo+ia/UeslFBRl4ZACb4hB
 xej55UbPZ3lYvohD6G1brBLgsoqf/gDBPtICyaH+vxf34PN6wwcWM2mMQfCC7/VqSOHLXk2i
X-Proofpoint-ORIG-GUID: fR_uxgfpMgDD19NjdXRuVeeFqRe5aB0_
X-Authority-Analysis: v=2.4 cv=SJtCVPvH c=1 sm=1 tr=0 ts=6825b338 cx=c_pps a=py/jgptSVLV3EdsN+h8ZCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
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


