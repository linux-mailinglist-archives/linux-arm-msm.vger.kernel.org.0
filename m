Return-Path: <linux-arm-msm+bounces-82480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD3C6E070
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 2055B2D8ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915DE34DB79;
	Wed, 19 Nov 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="mQTUCSKA";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="N08pxm7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE33434DB55;
	Wed, 19 Nov 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548891; cv=fail; b=Xo5PMWuWwzibfWhKwWN1D6pgXC2hmMpfVKDBzml6Vyj3Nf5QiE+43lofHsqCGHmV24A3URClNLqWiWA4rk/ergAFxgI5vTQm3WBWrYXUyES7lX+l7gCPIxEyHXbjCjjHrMSVlvpvuI/N6dQ9Bdee5LsjMZQsY6sEUNgQK+bHD8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548891; c=relaxed/simple;
	bh=NZ+vY3bKXwgLHirbUr2sU/MeTGZTQdvx20wDR5s5wRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kvaX5Q9QhBS05GLHCh+lqAu9seoXPGmTXkcxQd11ojo5fyq66Q1jrhAXryKNrBuIyj45w92XZ2jpHRHJhkBj/hwZmtcVe3UIndrsW2AWtL+w6FXOhSc0s5puzsH7NJN/ldTPZm1ASvOwRWUL1s83tl1ReWc4FqSzwkj6L/ObVWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=mQTUCSKA; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=N08pxm7F; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7sGDl3973464;
	Wed, 19 Nov 2025 11:41:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	dRz6DTGDNQi+HXGc9yfmoU+uIsdDCQPdx2IITVpD19o=; b=mQTUCSKAu3VfXtaT
	ahvEbCIxWDe+iAMTWX+/P7p+/Tz2nPPTmvi/HXVKWE4lXH9Po0GPoo0dyYgXKkZ/
	HexLr6M6wlOcYrFDjfqGtsLa/ChmbxVe8qbeOFoyJIw99tPzfPqqLq7v6DIeqTLU
	t3YS39graD4zWbpNHi4HtPFyx4Ab3w5Z4zNYTjOis7uTamKY/wu7TMI7203cYSfc
	ZrYgFSnjuuywSyj5RFo1xKhTHOnJoEhSqU/pj3tukG2GrTkzPUCmUneCp0e7gclx
	iFvwZOwcBBut7UB/mOEQpgKBl+iFtCkP/wZ+marxEEButrZQJXWzQ1rKBwdpTvrE
	zpn5Aw==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022097.outbound.protection.outlook.com [52.101.66.97])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed53u6y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:41:07 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRr6Jgh3TJ8GVZXdaWnBeEFcgltISNT2JE+p5/oIZRwGWHB2WYJ3EpFsq02FsoBgM9JkqgyMregbREaP8NEJhtLf+hRd/JjoQfrI/5gG4cg0MxI2xcpKNErXG9kN1Lsgn6byWsesS2VxUSvW8B4IPvVrkvjwBNjQdMaZuYCFhIAsNUZUXijL+F0M54S2KeX8RDkPXLLmL3j9JaqkFh6MpvlnDXMb5o7o0tAyC/sICswV7pwPcVX8+fms5tRcCa5pJrYstxs2Z2HQZ+2TxdAq+mjEA9y8lXdNKI24RETwnqEjADZlMElykOCmbgmtUnys1dYPrBnekY2AHIpr8vsaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRz6DTGDNQi+HXGc9yfmoU+uIsdDCQPdx2IITVpD19o=;
 b=IJFIKizuYcrNUoxOgc9+0pQDiBlEXX+1mqFs9ICZLatRgRFULhidaF7qwGgMQ0HQGDsCGzWNmgXp4L+hxTZPve8QT2DT46kbAMfZvVFyOsyWDFIinsnonUS/DnrL7CfuKuFSM8GBYKka2EHwqgdYPHU3FnAwqc6+G6ns5z1d510AVYynVVRoHXflnbf1TOfxuVRwOY0veTRen7Y6qBXQhl/6qlsUgvM/SwyA9Ax8JeHmXbwQgDoWijxQi1ZQE+a7f1q8/RdAJkQdbUM6rE3mjw1JNzS27VXPVUSQMmX65muNg8io1WQuloNOMggHyCCXNFvTpu/ZzTuiohKlkoPM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRz6DTGDNQi+HXGc9yfmoU+uIsdDCQPdx2IITVpD19o=;
 b=N08pxm7F6z1zwGi5pkHJ2xpkkg+9+VnbUMNgDNX8qi6d67hOHxk+IS9GZfQ/HQFveb8uSD+FmTvKlzlyPgVEafrOAeeuJEN7GGMQZGfcvY+9J9Yr1Y/l6jMG3CbTy1fivIqrcro2ejEdbwmFhO/D1Fkntk9N+EPlxktL93QvKB4=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by FRZP192MB2437.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 10:40:21 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:40:21 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 3/3] soc: qcom: preserve CPU endianness for QMI_DATA_LEN
Date: Wed, 19 Nov 2025 11:40:07 +0100
Message-ID: <20251119104008.3505152-4-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007574.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3ed) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|FRZP192MB2437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9deccf-b725-4e9b-72d7-08de27580a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ogYDSuYtW4ZSUwkRCbhUhYKa335Rzhf8BmVlcbZPiJuZublT8BUqBl3etx21?=
 =?us-ascii?Q?/E+u6YUvg0g6cJVZKTUIU5ZxQ3JXjqDKeOjtvspMKn8cIhcy09z7umW8ifYj?=
 =?us-ascii?Q?E1sMqb5gz13Ig2oC1sollTU01qmHsxN11GdyQpo6FoaEbv/Pt+HaqzWxe7Qn?=
 =?us-ascii?Q?7COgFv1iR4yJSjxcSwiUbbjiFKb9KcLRIcog1+qORLK307+qawPzC3CuIlZA?=
 =?us-ascii?Q?B7YKrOs5QzE2t7gDmLHNq8lXhDx8tO0yPW5xnS8JWSZbAadsMazBRFpyB1fo?=
 =?us-ascii?Q?8IiKQkEedcPq08rJ+KP/j/jGIOhEjk6SNL52QEpbqrseC614lXXRTdItmuTq?=
 =?us-ascii?Q?FmMElZ0CLPpP1tfA0+qWxzhXeIKM1xpv8Bxze7E3NZvOPu65eogrHjmMSwqI?=
 =?us-ascii?Q?URnR8bSkkMGKEAfuJuEcj8+zZpY/3acD8EA02bs+cYTteA9GWtJfOZNsLdvv?=
 =?us-ascii?Q?oAJIBTHNGxYWQEG95U6NHk1/keIBuTROXM0ZagEnxyg64Amo2yfRQEWOPMyt?=
 =?us-ascii?Q?NySuNaeXhmQzfwUIBhOnl2kePaPpsRoa869OVHYBkDpxval0I1k+TavldADh?=
 =?us-ascii?Q?DKoTWjRC2kGEOZrDR7RuDVPOneqDhVwM9EBxebE1vwMPvARwEI9L36E1VaZ3?=
 =?us-ascii?Q?yUYDNpWBr0mKTbRqWvijfb/zpt6q7x2fHyykqXkzQ/Tqr4cPYLUFMfHUZ7q2?=
 =?us-ascii?Q?RJjmiYQ8UD5PoFK5sxCcH80Sx2Kj7LB5BWvO83NY/pbdxlgX8ik40Hu+CnqA?=
 =?us-ascii?Q?6V9dc6cIwSwvZzNX/TX6DzOxHsc7++0FwYvvDJodj+q/DKzGjSpfW01FhF4Z?=
 =?us-ascii?Q?6JSLEUIJyD5yBPfD5nF0N1bT3Sr50LCrGlQBRAxTo7FPHWga501kpVJMgiRs?=
 =?us-ascii?Q?WFV1q5t4HR0cPPyEpfZ7HHiSPV3lX6p2olStxF0BRQS2ipVqKOZcecbUq6Bu?=
 =?us-ascii?Q?PAFR7JItvsr0kFiaSU5ogw8l0SD5mOeVEheue1fFjUKjwkuyaXmHXmmmj/fd?=
 =?us-ascii?Q?cu3PtY7Wk0zdv9x9EI8uN2qPiuRb2nIHGabJ5wVApqEJwIy8T5bh0iPWlJK/?=
 =?us-ascii?Q?SXOpiesRNQ1eshrSJwkLOz6pZB4/IySiowZhmgsX8jV4LoLysvqTyCG+n9/C?=
 =?us-ascii?Q?/o9RYMDtHKkFLlgCQTV0LYguRc+A07hHPQa7UdgQ8zgevkAVK0g9J66p33C4?=
 =?us-ascii?Q?uMDsz3wqNhx6hQ5i9RidDRKChw4iL19v5v/SEdalu9IdWLrXDka6KIo0OoPf?=
 =?us-ascii?Q?cGvsduo0tLZoqsK0l65yObfnjnQLvoKdzvzo3PRGF1ciLf2A/2sfnL7b+51D?=
 =?us-ascii?Q?c5HmEKF5cJXlAQ1t5xf32nZbUE+cVcegspxi0l0vGc00S9AW1dfr4z80Qo1D?=
 =?us-ascii?Q?yBtHFXNCLjcnoY6+GkVX+8WqhxJaBxJkuXw+rhVd+s7U2es0oNQ7lMUNY365?=
 =?us-ascii?Q?VI8CzM82CVxEglL8G3VL3jFK2/KSBMbs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?THtBR43LAwKCJ1aTAJvyVWGGeGKLjxOJflKbYrVnnEzfURVEENaDSfPy19zm?=
 =?us-ascii?Q?S2iNuzY8Y3ya/yPZ5T0VlAv/3y1poE9KAt3V+oLhe8PkjJqlRQWBXCQ/DBGE?=
 =?us-ascii?Q?lbEbp6KxNb5lYuCLveBSD+KK64xZCFaVWzBSAMv0NAvYKlPOx19yi+pBW7Tz?=
 =?us-ascii?Q?b9mJGBKqFpIZAoy7p9RGIkOL1g/09N6aX/G0Be1utQfsqoD3bQoPCc3X7okb?=
 =?us-ascii?Q?j8qHEHE+xuAC+O9X8M66GryfgXLig4XTXbjgq9iVlJWg2a4xCEGcrz/0AphV?=
 =?us-ascii?Q?3CbBy1269BBPf9PNhQnr8kd1USX0TGxi6YiCePqhcrPn8HRf/rg3oIGksDeF?=
 =?us-ascii?Q?WKNY20ausRbQAOZUxlofHHEzRoWTqvr3QmjKU3BasalBomQ5vJfkbNVWLD5K?=
 =?us-ascii?Q?sZ0ZYUcPst3P9F5E697hEM88ZmcancmHX6wM3EeCX3jy+0WOW9FhOXQEfvF0?=
 =?us-ascii?Q?qE7uC+lmN3xGKR2b4jMJEoriS6wTYR/Ikz1GexKgkDgDOH2CRKzYZwPuYbCY?=
 =?us-ascii?Q?A4PnHBeWoASr3n5dUPQhVjzhLZ6gX7q7V+WzoXD7W2Eo3Mrz6Rt/4MaiWlTV?=
 =?us-ascii?Q?IQoDV2qcrXMFP1Vu2z7JpkK56lhktypvUWH+oNdCvtvBSLd17Qn6Soje1Eah?=
 =?us-ascii?Q?bi6+cOx+abWd73RN1yeanDCSkWO+ta7TR7s7jzzBTvcnnJeYKRtBSW5CBCWE?=
 =?us-ascii?Q?H0IBB/w8zMiyIz6UeJrD85GD69SwPjmG0J8N+DTDUgXK1x0Q7bQUBtgCZbUi?=
 =?us-ascii?Q?kCl6P+Jo7ZjGJ1diqbLqGVZCn4FN8+P/6qY6YJnedfl1fClek9oWoQWroMJb?=
 =?us-ascii?Q?xZUrnYtL4ELAKdeOytPhN0HyH79bO+bB63luYa7JKqENxij9IPMLGwgtaDzj?=
 =?us-ascii?Q?qkK3WglMd2wG48OomHlvhwN+vN81JUcCBaQUMKPKpL7TFJrqdyJb4ES50Ly5?=
 =?us-ascii?Q?U8LVN/3K3jvX6op/4O/4+tgjzQYM3rwPYcTi45gJ4beNJDJOUhekvY+r/yk0?=
 =?us-ascii?Q?hsePiV6vxiRGcuEeU00zZZfQJ1FwUF363c9v0S0OJnDE303t8d25j255Red5?=
 =?us-ascii?Q?qSYZWa565KyDjyJXdOXtpYffvR5s/H3p9GKAmranjpnVZHkJQ9XqMpUBeQsZ?=
 =?us-ascii?Q?YF5b7i487pwmE4TONqI8xSGB2d0bBZWNIdwdohM9cFvdk7YC0GICMEdATUXF?=
 =?us-ascii?Q?S+/X3qkuVoFUUkvaWKlxj/SSSXA1BBn3vVQnsxpzdUOWGILXTiD9DnTU+KPE?=
 =?us-ascii?Q?JGQ+wwV+RZTfJ9XQBMIODUAwS7mKiSNcHlK32DwiFkq2PKD9UTHDaOu1bv0x?=
 =?us-ascii?Q?fWP7LsUcQgCbafI5Ueh2E/XJb59gAnKteXL+b6caWFMK233KmxCm+QiP0urJ?=
 =?us-ascii?Q?aOh8waxSqrejBwXR6oVqKPF/VJZAKDBrWRS9nfDh2a/6wcDt79W9zPGRXNVp?=
 =?us-ascii?Q?4bqK2SZCYXL6wM9sCQPDzxGbVILExFLJFewT9SWjLfDsNZrbOWBLwFHrFpi5?=
 =?us-ascii?Q?PlqHqt2GtaCHnJwPNcuzZnqMyTV3WCW7UcmiMnB9ynr8gByVeS9sClOD5Bno?=
 =?us-ascii?Q?NcxgmXiFvXt2lpy7/aUTdA4q7WOhOJRJSXdH9okk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5r3zHe+ERJ9d1keiSmXLmTkO2fV35GX9dwov6zvmvFyJNnc3uEhtC+TX6QnA9IEoI5HEwcsXwznAQY0e7q3k/qEGzVPmDYPNd1WKC71XQaGwliDNHblJFFymTXrf4u9wr7nT1GTFyUXylhokd+ZTAGm/kRfFpn/ti+a+GyLDAX5HN9yk1T00R0e4TwuefOVVFaqxcahuBi2fcCn8IsDMpkClOV7XSGz+GPr+dBvuukYgAdB+adHRJiYQX+JhuqvSYrKEV6uWGV0GCKK0FjhI5T6KRw58BX3CofPmf57OJ/WbQWfGRWoa8D1ZBnt9lusw4ZVWNk+N6NFbDIrrmdID4zU2pJmXVwXWp1FPg00/4Y1iKZgL8nFarfEOVDzQFxXUA51eLaFPKpDEr/ar40y3aBrO2Pcrq5DMQzuK0hY2yQDlljeu3RP958PboD6HfH+e84yPONKZmOR9O/37KBk1wbnagqPv1NJzo2LsjlJN8aPUdo/PqTSonasEKcoCxEegX/2j1vZSejLNEenSq2DnkQwwdTFxfvvqGf3Z69sHsVRDGR2MJoMgbit8kj2WGlT1B0ZSgjps8dnqwLg0+hb9QHWX/wLE5TfYDxMCk62oUjJoAAVni5JbSNztDXfutiOl
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9deccf-b725-4e9b-72d7-08de27580a28
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:40:21.4644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+/kjgBGy2gvq6cz9NaMKyjvJ6n0b6kOrysH/3rETI+dB1B+FdAUzlsO2PMJhTQAz6YdhEPNp/ReNcfnN7u7VQ==
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
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691d9ec3 cx=c_pps
 a=4GbWmdgbNi8q0gmMuSA+Nw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=eLuBTlSnDbeFbTJIhdwA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: Ycp4r3kfNpc899j7ZO5BYu3ZFLaA1Udq
X-Proofpoint-ORIG-GUID: Ycp4r3kfNpc899j7ZO5BYu3ZFLaA1Udq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NCBTYWx0ZWRfXzz0mSl45MR/z
 j1fDvVNiYAM6HgEInweNjFfS/PvmlGW9nY7tkEX/0Tb+L+AQZID0xQ+fcAZkjD49CZ2IUuXyNqh
 9PLfNUPDEwmHpMBHHGrPVfnMFUFR50MUEM4ay6JEujT9qee7mMwvMNTbjsdUSEUt5F2kQMGLSGt
 auZtQoVhvE5VVdX/6TQR9sMC+glTgdToq8lxeJf4GUd8CprCb2KsQaZxWwHI8OMXbGCCr7shNxV
 lNtKg8irHG8tYHo2XWM5c/TtUEWCN7LANvEkLb/QrT/NV49I64RWwPo9fkBTW8i64R+sBto9vpy
 o1/Z0IlTdMzU2zEHFLm2PWgPSAv+jDorxSNqafLOboJVqvcZ5PCQZ8LO9cbbzja/kBYWTpYp2Jj
 9uSIkMr7m4gpBev/c8HA2Ln174yRxw==

To ensure correct handling of endianness in the QMI subsystem, the
QMI_DATA_LEN field used in host-side drivers remains in CPU-native byte
order. Remove unnecessary endianness conversions, considering that
QMI_DATA_LEN is always of type `u32` on the host. On the QMI wire
interface, however, its representation is variable and may use either 1 or
2 bytes.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/qmi_encdec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 030b18fa086a..28ce6f130b6a 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -406,6 +406,7 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			break;
 
 		case QMI_DATA_LEN:
+			memcpy(&data_len_value, buf_src, sizeof(u32));
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
@@ -416,15 +417,13 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				return -ETOOSMALL;
 			}
 			if (data_len_sz == sizeof(u8)) {
-				val8 = *(u8 *)buf_src;
-				data_len_value = (u32)val8;
+				val8 = data_len_value;
 				rc = qmi_encode_basic_elem(buf_dst, &val8,
 							   1, data_len_sz);
 				if (rc < 0)
 					return rc;
 			} else {
-				val16 = *(u16 *)buf_src;
-				data_len_value = (u32)le16_to_cpu(val16);
+				val16 = data_len_value;
 				rc = qmi_encode_basic_elem(buf_dst, &val16,
 							   1, data_len_sz);
 				if (rc < 0)
@@ -721,7 +720,6 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 	int rc;
 	u8 val8;
 	u16 val16;
-	u32 val32;
 
 	while (decoded_bytes < in_buf_len) {
 		if (dec_level >= 2 && temp_ei->data_type == QMI_EOTI)
@@ -773,8 +771,7 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 					return rc;
 				data_len_value = (u32)val16;
 			}
-			val32 = cpu_to_le32(data_len_value);
-			memcpy(buf_dst, &val32, sizeof(u32));
+			memcpy(buf_dst, &data_len_value, sizeof(u32));
 			temp_ei = temp_ei + 1;
 			buf_dst = out_c_struct + temp_ei->offset;
 			tlv_len -= data_len_sz;
-- 
2.43.0


