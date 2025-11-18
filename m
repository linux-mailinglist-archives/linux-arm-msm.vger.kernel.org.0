Return-Path: <linux-arm-msm+bounces-82187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98397C67CCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id ECA3129D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2972D660D;
	Tue, 18 Nov 2025 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="IZW4pCON";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="AHP95JgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D97248F4E;
	Tue, 18 Nov 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449093; cv=fail; b=psznem+jKxLvAY8LF4dltNkeeLr3DzOoUXR47gSyBV76iYoK3NPnq9oijBG+mBg5awVYrXSFRgTQasyAUiu8D6YcTClw5DY9vUIe54kaxUnZWFJ0Hb5dgUqgc8A5d6lT6aCpEs8hoXpqheCZgidolRpkHFjwd8+K70p4OJVxFmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449093; c=relaxed/simple;
	bh=8w9Z4qyWSmm+TJZMVfsraSyZJIHTgZdIWPLPuphnUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ajrd8npb5ZWlqmzxpo59N9ShbLDMcs6kEWvKPZ2p/yf2aSUjX1JU6k/GObkjpfOVtVCNKIUR/goPqVHNhGiG2LXa/1+lK3Ho+/UWQLb1bCAM1W8xhqfFW8QNLGQr38g6ZD06c0fcjZ4Mi4kGlwNElUS3Ypq9InOUY1IXBaIxow8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=IZW4pCON; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=AHP95JgD; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5F1X71387354;
	Tue, 18 Nov 2025 07:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	+Mdd/SCA+1yal1KuAVkI+vjfhGeiweS900lzViXlzbI=; b=IZW4pCONxyrTmVjH
	CIIvP68FQ/1t/OroWzi8l3PbQGbYrV2uxStB0P74SADl8ho97n3huWSRlYZnBJyL
	n9i6xlFhM2Aa9VWZHjGo0+kVnF4Hxm6mAlKxIlueTpq0ipGo0UMEtM4m4kPbf9VU
	crFLjBGt54XiURY+WyUfpYhrVbatskYmHcA25jdz1ren2+VOoYuCMC/vXPcXO/t3
	QZJV41H7NMeNy+U5THYCx+EM0453yCwbuNYgA5SiIpISbpsGs3KVlmNgnymY4R+G
	fp8N2KLx5fgRF3L6hzA+rmCZEvXYjcDpnXVMlUT4mtMTyV3OeVb0LmRYa1TU/Sud
	utPJwg==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11020130.outbound.protection.outlook.com [52.101.84.130])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed52mhu-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:53:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6ihLnAv/zK1CH4iRpGEMf/5CCKiCePuWJ+NN6OAVb5uocrNOxNdv2nBlHDx9sw/nS4sGH6d8h8BIKIdeRMULm9sVKioAr43Ny3UcmkOr07rjmx5/5VbCjHZH3S4F9dyWR3ZNqp3Y9snM4hJrvrMlDRC/p2js3vhXQcfjwMxR3SG8SJSmuJtvjTtX7NP9bcyXI7tzkgmKFVZm31TIxrF5xWrlbdnhye5YQzy7cn+WHsxneJULPm2j+FImo6dt2E+DEK43FbMlVvePWHcbBN8Q8M4doAy3oLbbrL/9Epjvh7dqu9d9cqrysLQNicOx7z0I1T8jXoiswfK5/0r9kX6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mdd/SCA+1yal1KuAVkI+vjfhGeiweS900lzViXlzbI=;
 b=L8bKtaHq8l9xfNRvq6I6chnmp5PeUWrGpnPGdPXNChXXFK3IkJM4CPOM9M4205LwAFegJcSpbOsOBeRse/Vxl/BviVZKfT7e2YUb6qpQnQV4Qk6E+7VZk5RVSAp8JZRBmBkFAoKZaEjpsRepR0wtysN6k+z1fldVPQB4wAOmf9sDBYAvvJZD0yPcY+7zJI9wO+3xA+KUKmHxmH2vcKmgPAU9+tg0TtEUWjbspEiiCHon7M1ch0WkGPuxPDis3azNpB521IuR1noC8EeHA9iYgUzAQqxtG/7tK85aUTMTKU4oWDpj9fYbnGQoOTigJ4M2rPe0zuSf2wGu09HhW5erng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mdd/SCA+1yal1KuAVkI+vjfhGeiweS900lzViXlzbI=;
 b=AHP95JgDb6ClxWzBSntI2G7Y7pnMjOk5JiQMQB27LyM1/Dw3pt2uAN1dMezbvwqra4vHXSiSjALnJEC/5NMchcw5oAqBuqQgb1PaY2z8ufiBhdoLmDX7uAz7cZSi/Iss/QS0aw0ElXQRSLgNeh1U6tA6BAbavmnvNIVEi6zpAVQ=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by VE1P192MB0653.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:167::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:53:48 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 06:53:48 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND 2/3] soc: qcom: fix QMI encoding/decoding for basic elements
Date: Tue, 18 Nov 2025 07:53:40 +0100
Message-ID: <20251118065343.10436-3-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003849.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:7) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|VE1P192MB0653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c67406a-826c-4e01-812c-08de266f39f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lqbjM+SVaS7eenju8qB6mA1lHZGm747kzuCbCJsjNNjI2RtJ3DgzQ+avl9VP?=
 =?us-ascii?Q?mICVPz5bpt1AEeKvN0gGUKNJN0vd3X3CZVGhhg2X2GLFYIJiyDEHuUYM/Ocn?=
 =?us-ascii?Q?Is0RO2S+WzHLzdqJuaGyIkw2tTH8DZOpac0VXaBWFM0tX2X7RfoH7D1E4NZ9?=
 =?us-ascii?Q?k9A/dOeJgCXSrnav6ACgw5Ndbv/fLn2FyH8W9YyGQVpiasw7dbA/54W89bIS?=
 =?us-ascii?Q?USFq6KfKBqZbK60fQ4p09MVtYKAUEJp+Pkw3wqjKAkHoBJF8GMecI7WrMLBa?=
 =?us-ascii?Q?jlJymViZQhDxmLmckN7OoMUeSzyCZf71zrsxRXn9CvXy0qiWr8n/nVRlD7cq?=
 =?us-ascii?Q?K2ICWCksS35xPObUmcmPTgSI+KARLcnfl2tnYvJf468h0UMdjWjAhEfEkjHo?=
 =?us-ascii?Q?TB27Pjo8l1SDltJznq3m2wA9qVeLt0fVzUAFZnz53cvBrZmHicXJpmQ6pBeT?=
 =?us-ascii?Q?zodor1jjVpDhg0bsgb1pAF6EG4d98FN3Li8pT7KEL0SbaWli4CJK0BeUCtc1?=
 =?us-ascii?Q?WTpacE1V/LmMEnSOsxhs2+PMobi35RIVe9uoISkb0SKu3fdKorWd/UkWmnVe?=
 =?us-ascii?Q?YtVZsILf+54ArWh5S4ypE4F8kmgm4YwyrDAEvNQdxBX3N+s5UZBVOm0uxTIE?=
 =?us-ascii?Q?TfWiKfgjWRE4xdaRUmSZcAVZx2lv3pwEQbelqiQgT++baC1i6qc8zVuzeHv6?=
 =?us-ascii?Q?eyCqGfcL8zwD7PT1cmVOlir3/th0SSBt5VJuFDbw1dB+w7VD4uSrLwPj8oaR?=
 =?us-ascii?Q?2/7Vvo72gGfm3EIebyRADQc3vamyJZViQ44tpuRui+5H0I9/0S5ySbDiESJl?=
 =?us-ascii?Q?eapqwsMu+o6m9wJonehYfLVqDp8qyF9L217VpqO79OC/v9eM3XZCNsGLAX0k?=
 =?us-ascii?Q?IKBjsH6TAdHRcvzCyimT9ZrUWj1pmmfqITxSmVLvkFoVQfJHmtC6aimDVu7c?=
 =?us-ascii?Q?SGlEiSoWAb1v1YefPUDWD8cnwMKSjENpJiugbgC/8eKdkUfU6BjWPXziWvHi?=
 =?us-ascii?Q?GmeuWQ5ER1+hidivCxAPSNXioeCwi+9Kr+WHrCL80igKRMYP9/l+/HhzFvnM?=
 =?us-ascii?Q?17ZibGWQnPLjt/zpYEF79fReIH7WYj4dkc8S2rEm+d6YkL465H+4GtDT62+d?=
 =?us-ascii?Q?nI9A/luq29eJ3Hge6a42MMNfEJNsR07IArf3WHzxVrGZDqxo7qpWA+agzwXy?=
 =?us-ascii?Q?tjlOzoO/JffsFMY3SGW5cIKMawb/JoYuiRHhWYz043wqA20f2SnLypzm523L?=
 =?us-ascii?Q?UvIgIDxQQvW4lN1Ii13R0RzbAYxtwA3v6h1RP3XYk99m6wgtac/LO6Ph/a1D?=
 =?us-ascii?Q?P6RUBqYyYgUdIefOU+36/N6RgHN2SXqIbK4Rt7tBox+3+B7zFqwPImIvn7SX?=
 =?us-ascii?Q?Ci8y3vpHbehi/R/VtIxzzBLAWSjm7X8I5yRLCiV6QAirjf2OzY5m8Ab8PKVB?=
 =?us-ascii?Q?1byaKTaPWgrumS8aU0PqaCd510T9QI5E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQB/YcA+PparfUlqvMPfz68wdgyk9YbjZZBarTRduAID2JqULKMn/XSLy2qq?=
 =?us-ascii?Q?r+7SxF35cR5PSL1XcKZduVYGwRuW0RbEZUxNXkouq5lePXb5c8pgmsekpl5i?=
 =?us-ascii?Q?uSZ4xbnuuaZy8bfPDfCUTnY8Ky6xfIx+MkDVzPCdZ2OuoBkxND+6ObvG0lwj?=
 =?us-ascii?Q?OPmp2i+ZJeGeCqGUMzYm9FQAgLNmAoBj1U80LSM6E1ElvmtySw9VaYmPTfBp?=
 =?us-ascii?Q?+T255w7H0LpWukX+H5JQNB03dV9dhdBzz+0LSxPqFmQ3rkT41ayzIRRsDPXr?=
 =?us-ascii?Q?MdMqSSTjOZFte2D4L12kHPDTNuRI3fRm+nX02PLr+SIXisHRKF+tPvr9bfQ1?=
 =?us-ascii?Q?+XjXYVZP6VFLpQ/BYYhWhNulnQ9YLEuQwACU4c3phVCeT/mIHS5Oq10EdXj2?=
 =?us-ascii?Q?WfpdoWCogJTsY4qhgO3w1RNSr6HDzVXHVCqu2wQ6ktL1xpoUOy8dr64Eu14H?=
 =?us-ascii?Q?uN1IPmIa1oSddOol3sZ48mhIXrmJpOWOXvffMgZBu5dutQ59uJi3V5N3a5JV?=
 =?us-ascii?Q?Hy6wYXW5ITxWbFwBQlM5IDJf9ew4JaeJA0MTV2r0YW/SsrElilGDnvDXzWQh?=
 =?us-ascii?Q?7wMYomOGsjEl6fZECrkrTDHSZxIfCBbT5c2S99Fle49lpHklyrtOLQsDrk4K?=
 =?us-ascii?Q?CXUkQcHuEIa2YfUzdDoidGQRdbAskH420/k/52EWpfwvru+pqsVV0s3ymrts?=
 =?us-ascii?Q?BkQuxhz/qdJ0Hh0QHNVBLeLM6y9wcEM8okTo47yMgiF4NU9bt6J1uo9lhWNg?=
 =?us-ascii?Q?oBEheMYhjKG837u7/OhRSQWhOf/AcOHyXcLoiBUhGcDXXWJzD6YlaOYN/M7f?=
 =?us-ascii?Q?/To2XSAhTRCkkqbyMpdxbP1MJkPqTaFQPlIn5v9+yDrJ1mC+GHbisbWrr7qs?=
 =?us-ascii?Q?qEZ9GyzHJ5VCKJfnD1zebxNU0P9+dN4mv8FsJJTUHexEif+FyAJU0o2OSXiC?=
 =?us-ascii?Q?Ys3TcEkcOiGOxhrbzINn6ifQ4cNEYrrqh1frajVPpcVrKfscI5SGhX3reR5S?=
 =?us-ascii?Q?qvQvroT3zpwyK1lOGugp52nrkihTVqv+UVY5LFkfrcEynJGaf0QqBMWx9kbC?=
 =?us-ascii?Q?H/e58OAdb/3k6V6apMP0d0zSxkjd8n/AVG8HRw15654bpEj81AJJ/Fmrevw7?=
 =?us-ascii?Q?AYdt7d0Rd/QZ4zIkjT9fDYK2d32+8/FIxFUE1gBd0JiAm1hf3QIa/CLLZ9RC?=
 =?us-ascii?Q?NDj/P9zy+oFOOPF0G9rVTgNfMFIfdsQBdejN4WfwJFI3QTBwkCP/VqQ4c+vY?=
 =?us-ascii?Q?J4lYZPm+5UHplMzEwYLwKqG32dIIZhZUk1a1xY/PymNTmlULa69hV5jYroDV?=
 =?us-ascii?Q?CrWNXyv2dh+7SkuHG17AwUB6cKwbMbAvUNoUGIHEQJCjVl49Xe52TqPLl160?=
 =?us-ascii?Q?ZtaKefzJk0DhjpCk1pFMdY9pPK+SkuYiEuP7h/F/Q6QevBsgJRpUYc68RW85?=
 =?us-ascii?Q?GYCGwwDz77Ysif8KKeg/Oj8BJsFoIa+5LLmKsBL+5t8G79X9h86K1PfNk8E1?=
 =?us-ascii?Q?f5ljWExGUKEdhtsLy4EEByWnlgxgdTR33xeIdxH7LD6yjrZM7+WsODgDrMFj?=
 =?us-ascii?Q?lJA4Bz+jkbFk7KfJbwVeVepepf1IU3DcLrrRE8Jx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nQwD+nUZQ2wPO/EbCqDS9LnigLiDruuuwnhtAz1rWGFKJtJdJ5qOaPW/v2rGsZowijIxmOYOd6oKtkVDWR9B4mrQz3duUmmhqCw37/UIgLiWHd7MQH1ozzg+lsH3BQQp9S4klUO9ij9ly//rgWL/GlsrKeeB4v5EOe+AuSm0yIHY0xbTrFZPkkLI2d1xXHADvKiTc3Leo0EJGCxh0P1X8beiIkwpjjzgaF6rbboK0VTzMkHQY2y4YtGudPgprHDshjnzQiVCA6X5JRcn4RlfR0G6WSVTJlMOv0eDMms9hzokZhiBH3O7JZEEJndrfns4q1gq9D/tUZZA+oWqpIg8mHoZd0xHK4hk7oumGVsipFc/mfyorOiJALn5nYw4yyVQTKa9BzMZrnE488WALWJ/3KgA6hMv5et0Kb/jlioi67x51WSN6qP9/IYApZQMi5HengbH7Uu/8zUVdvdEV/OuQxp8y01oBYTy1Xd7njf3gZJ8qwzZJ7AgKDr97Bm1TTu4NxcD2jvYjlJtYLLf8FxydW48NhxOwuHAWyyp25DtNthR7n8HxgvovCCgT0gC4PyyuhXbJyWYpmqKSDwjKs34JFCGnltujoHysLzyd18TULkxgCkyp2GtlhknrKnhDe43
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c67406a-826c-4e01-812c-08de266f39f1
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:53:48.8871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5iS87JjxaJT5nPwzfxW8L9WFKlDtj64SSBOsDNzb1eEfAkUJFxHlHm8T0DNDavyAMHLS3cGwnwGcwwxw8hMxA==
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
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691c1800 cx=c_pps
 a=Q67dIzWXlOQ+KrpM7kYsAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=T0L45qBzl8X6T0AR6ckA:9
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: GU3FC_Gy2iRTQw7P89ldNdmTdNwLvlNm
X-Proofpoint-ORIG-GUID: GU3FC_Gy2iRTQw7P89ldNdmTdNwLvlNm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1MyBTYWx0ZWRfX4C/fixm1VLZj
 FNXVj4a95ozsuqiX08RNlKgnHRodq0aOnvzSAjFbyQ0WLCWQAeXupPtfx9BYDgHg3WYwfYXkgbQ
 GkgzmRsHgi+3IIFThuYSqs6RR2bir3JrnAoyUVxk5/np31yMf4+leAbzoDPjdd9/G0iMEsVJCF1
 DZLH5Yl6mLW1gL1p+GO4AtNdHMqpHk0TIdd7TmQ89hczk2vZKC6Nl8kA7I1ZsSehhAj/THapBqN
 1s0ztj4ZCGPxGCka3SspG9WTCxV+BEIYrikUL0q/RGPOoxodccRCck1oLvrACDdDeV7uagbpcrw
 cf05Hpl7LeX37m0K8AQNbEJShcxGCXCHB1MkS9cgVl/24LZiuLmD7WlbCAE5t93GDUbOwtPM14w
 vy0UxfGUpqrLfBkd+ysoAjAMhaEj3g==

Extend the QMI byte encoding and decoding logic to support multiple basic
data type sizes (u8, u16, u32, u64) using existing macros. Ensure correct
handling of data sizes and proper byte order conversion on big-endian
platforms by consistently applying these macros during encoding and
decoding of basic elements.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 1f9091458d72..90a48fa7ecf4 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -23,13 +23,6 @@
 	*p_length |= ((u8)*p_src) << 8; \
 } while (0)
 
-#define QMI_ENCDEC_ENCODE_N_BYTES(p_dst, p_src, size) \
-do { \
-	memcpy(p_dst, p_src, size); \
-	p_dst = (u8 *)p_dst + size; \
-	p_src = (u8 *)p_src + size; \
-} while (0)
-
 #define QMI_ENCDEC_ENCODE_U8(p_dst, p_src) \
 do { \
 	memcpy(p_dst, p_src, sizeof(u8)); \
@@ -58,13 +51,6 @@ do { \
 	p_src = (u8 *)p_src + sizeof(u64); \
 } while (0)
 
-#define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
-do { \
-	memcpy(p_dst, p_src, size); \
-	p_dst = (u8 *)p_dst + size; \
-	p_src = (u8 *)p_src + size; \
-} while (0)
-
 #define QMI_ENCDEC_DECODE_U8(p_dst, p_src) \
 do { \
 	memcpy(p_dst, p_src, sizeof(u8)); \
@@ -225,7 +211,21 @@ static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
 	u32 i, rc = 0;
 
 	for (i = 0; i < elem_len; i++) {
-		QMI_ENCDEC_ENCODE_N_BYTES(buf_dst, buf_src, elem_size);
+		switch (elem_size) {
+		case sizeof(u8):
+			QMI_ENCDEC_ENCODE_U8(buf_dst, buf_src);
+			break;
+		case sizeof(u16):
+			QMI_ENCDEC_ENCODE_U16(buf_dst, buf_src);
+			break;
+		case sizeof(u32):
+			QMI_ENCDEC_ENCODE_U32(buf_dst, buf_src);
+			break;
+		case sizeof(u64):
+			QMI_ENCDEC_ENCODE_U64(buf_dst, buf_src);
+			break;
+		}
+
 		rc += elem_size;
 	}
 
@@ -508,7 +508,21 @@ static int qmi_decode_basic_elem(void *buf_dst, const void *buf_src,
 	u32 i, rc = 0;
 
 	for (i = 0; i < elem_len; i++) {
-		QMI_ENCDEC_DECODE_N_BYTES(buf_dst, buf_src, elem_size);
+		switch (elem_size) {
+		case sizeof(u8):
+			QMI_ENCDEC_DECODE_U8(buf_dst, buf_src);
+			break;
+		case sizeof(u16):
+			QMI_ENCDEC_DECODE_U16(buf_dst, buf_src);
+			break;
+		case sizeof(u32):
+			QMI_ENCDEC_DECODE_U32(buf_dst, buf_src);
+			break;
+		case sizeof(u64):
+			QMI_ENCDEC_DECODE_U64(buf_dst, buf_src);
+			break;
+		}
+
 		rc += elem_size;
 	}
 
-- 
2.43.0


