Return-Path: <linux-arm-msm+bounces-82479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5502C6E06D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A674E2DA02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BC134DB6F;
	Wed, 19 Nov 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="Z1lblbrH";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="mxC/IcqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3789B34DB46;
	Wed, 19 Nov 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548891; cv=fail; b=W+bgVlyE7YdJPzwdM0Hb/IwozCJrdc+5iZq283WTigAq8wRtYZIXwlivyJlQmO6u15yT3xvIK+wzP6bh2jgPbfAZJgloSpxMvRpGY3rowdOd7X24ycSMKIZ3jXzMn8CbNnsNIt5NHz62T9DXDJDRzzXohdzpBWcKMCA9i1loUM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548891; c=relaxed/simple;
	bh=dlh/7u61lUl0XToqTBjJEd1F5SgiTrSp/1Pdzc3LIag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AQ1+a7Zt/+VLBpsp2Bdt8bBMiUc8iZ5R9R/JUbuU7xCl2GKv88V3Bxb58mLMcrRFHjrz0VVpGxuIqkcKAUoLHXVN0RG/d5MdBhYowCg1fUjQeTaR9eN+QC+cbaOsN0bSRs6rHDVE9C0B37b4zjiiC70rgQ30SBzBtTA20ExL5Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=Z1lblbrH; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=mxC/IcqQ; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7rjYk023549;
	Wed, 19 Nov 2025 11:41:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	6A4YYrrSLoo2GpFNi7lJN9J5On19wX794u0X6I8tptE=; b=Z1lblbrH7eL9JNL0
	xI/i1On4TMAhRHotyQlBJR9tmgmVtug1w4xn2vsF1PMJQbfIv/jQr1JOLVYYwQJc
	NaMH7nFWz2Ds8qnIKMYlrZTmf6FjtvXhxlEX9X3AGw91Il6Gm/AzO4w+5rUqezah
	7i04v/BqYuyPp371euSTapsr+nslbzZZhOjxdwevelnroV1guiTAZ8wKwW+9L79D
	wAC2U2X8b3wNckbn3TL64P1/4Qhial6NLXI40SJftFD1Xl4O/yQ689e4GYncotVc
	s6SG+nwwt2ATcnCxQ+rP/ES7n9ITzZmtqzYVgsox0vrF+ipSdcCVc//bJFxaLeaG
	GoPQug==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022107.outbound.protection.outlook.com [52.101.66.107])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4agy1kgmt9-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:41:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni03GuoWCGwhf0lqvrk1PPHgliV1uxwYJuZdwz03xJekw5BSsQ1sixEmf+T6qp9mnPziBeSBRpyBn8vHreSsoMCRk/9zLx+qC/70x7bhAycwMLe04nzzdQL+Yj+OF9QLI9BmJnPm5IW0azctJNloKg1q+pDCLGbthfTjNL/sbHxxLbnBbseXJg6F5Axq+GpEMfl52Ew1Sh4eeflN5oFCpPaMl9zTlirXycqkvVOk8aU6BmfoK6iBgws+1jIDFU4BDtEMTySSPnn9TVcXILLEe7JpJPlK5myyAok6gce3FvH2kRX7/BUhCa+QagRJ+DIS250+UQQeLCqyKGuH87FKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A4YYrrSLoo2GpFNi7lJN9J5On19wX794u0X6I8tptE=;
 b=iPJ9dSctZGPOc5ft4gi1hJfu4oy1f1NRcJFkVbBqLTvMCtmRgwbyyhfzjswkcyXKVuo9LdgVn0ljzntCNfxoPNwmagO5R1CpMzygqe3KaNmra8L4lXCA7E9sJ5GMPWiUIGb9MKFbfi4a5Erpznvy2dUYHtH79OlaUZ/0qrrvVASd9yC7D6POfqmGMhsAlFZEHR7/IPL0lcsx+6QlKuk0YRb9TvqIntPupc+JgUMCMbO2U9v+0AkvoW1P1lW8oe9UdpgaGIZ3LuVKOQU6ErTgf1BPnY+UCiWnDA/hQxyLR5+8kPjfCy+W/nA5lwELuouPjSzDgOFNJ1mMsRWYVs0leQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A4YYrrSLoo2GpFNi7lJN9J5On19wX794u0X6I8tptE=;
 b=mxC/IcqQYwn3b5WD63cR2WLYQnwfXMiAIZ9sI/yH2xd2psASgxSLJoYVND0kfZAzmqeqDYXixPK5b/IBfyeI29BPTXfpPIyK8jwzKZdD71hFiSHqGeGLhWh6Vq+fHYdHjXsIDtL7X/56VthCI9vbr6zXSRXZKZIp6cLheZbR/pg=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by FRZP192MB2437.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 10:40:19 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:40:19 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 2/3] soc: qcom: fix QMI encoding/decoding for basic elements
Date: Wed, 19 Nov 2025 11:40:06 +0100
Message-ID: <20251119104008.3505152-3-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002E61.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::24) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|FRZP192MB2437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ded24c9-d640-4409-2fae-08de27580919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zhi51TuND9F8JZif9352ZyHFYJuqO76pWqbjkxJ/mIzMiIMrJTlrpBj2qqkM?=
 =?us-ascii?Q?5noZ3eBogX/RZZlP8d0h0nPrFryn4/vu6O72HsIXJ+VyMg0AS0pQ5pOdQ+Vw?=
 =?us-ascii?Q?FzOBrJ0w+RIYxfirseLorxf/6Lv1hurTAJFox5bSAYkRh4yeHDFlzf/kwP4n?=
 =?us-ascii?Q?z5bS50kjEIJzgD1jlLv4eQJ+h6skp1XkKZSri1eII9yFzvJngApaxv0tNLNt?=
 =?us-ascii?Q?x64KCTiQmmcpBmjBgUZy12RBnXhRS5Utv5NqfekTr1a/KmCvZplLPlCTkiAH?=
 =?us-ascii?Q?TXH3mFptYAdzTEiq/f8qRjYhUgRyQXe4LgW1c1Df+MtlrBg1CiK+dunftN+5?=
 =?us-ascii?Q?tVaPiIDDWRD+sWcwrbqyhY+pmjXlLvDi40MpA8YOoVdDW4g4gAX5PN0gKn45?=
 =?us-ascii?Q?ZP8B1INkMUvP0BEVJICACDAj+WMqPDNuWniqMjG5fqB8OUbvaCE9vvqGM9RO?=
 =?us-ascii?Q?gem8zJ+6uX350mm6S8ysstNfnqYYTOWrlK4EEOT3UqwboTsMzUspTb8dO+7C?=
 =?us-ascii?Q?AgvlzZlzoVUx4IB1lpkN29HC0oM0lw+TawGeoLgInmhdc50NW0R7FR9unL/j?=
 =?us-ascii?Q?/qmQf7ldUj860IWn+VKGRW44TU6yd2eFLA6A7YfDQwRHSCtYBKq7LdQE5xyK?=
 =?us-ascii?Q?uYC7itWO2XJlSng87XSJfaFAmjMOQTkBWrAGZIY7zKKs9Lkf+ix+rk6Hvl4U?=
 =?us-ascii?Q?HA/Jr9DkQVEH6pnNliS/8QOxi54HIzgeoPdvp/WkOIOgfDHwWowVap9uXRxz?=
 =?us-ascii?Q?EWskI+yAos1y3ByOD3irsbVgXhscLCOWue+er31xMjIVI825C1VAsel7DHnn?=
 =?us-ascii?Q?2uR+6h+3cd6TZ363cnJLzH0n/wA5SnIJXxqIuIdTz6OtgMXjncaH0nQIgQvf?=
 =?us-ascii?Q?etXEraZL85ZhmeWGXNJ58Ia9oMxupW0J/O4z1mr0Yb9EFv9mRKu+QPCDxA2b?=
 =?us-ascii?Q?HzA2/iYvxL/DAU+967zL2T9oS2IhS2rHjFUQ1GL7XjU9buciVGL/I7RgQR4P?=
 =?us-ascii?Q?ldv5VI7FzSZOfU1DXymdFlvIXvuAsbw6v07VEQdFa7kNJNRFCtmJVmC61loJ?=
 =?us-ascii?Q?kyKRZ4un3euka1C+plMpxEk+bJp4iJQKp2BgX+RpFcslQI63YI6atkowPPby?=
 =?us-ascii?Q?nZwp6rLnYefuc9fo3iQ0wh5arjQurPD06B9eB5GKd0Akq8mtpOH6HbDvGb11?=
 =?us-ascii?Q?OmayL5BC94OF4FM+HIaC+oPuphpjmwEVvUsui0zOAieUa+GDMqKixWj+kUAJ?=
 =?us-ascii?Q?Dngkal6F3/KE5z1o3loHqrvI2D2eJfsp3hcHo/DXvVK0sg/JBKjj+ICOiw6G?=
 =?us-ascii?Q?cKR8vRyNy0fFMzi1xJL6HAjAgnPpPcaPLmQcKmRk9ZXMMzaZF6+oXjEqgsLS?=
 =?us-ascii?Q?N9eixYPNcTwIXB7lSllXezcbx+UhnqhKycYfk6otxQlbQrcfkOmMDg50qSkI?=
 =?us-ascii?Q?FL0TiOYPSDVpvHZNMvFlsuHejN0vGebM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j/hs3gh2VLFoTftQKBjhROQLfN/DBct9ALmnon+fb01T99B4u7TTsnqqcIAW?=
 =?us-ascii?Q?JA4jdB29tG3KXO0Kwb+tITTY31D80UHv6MSyF22UxiAeCplcM2Gmwf/PwIyb?=
 =?us-ascii?Q?9TZlL0vDEhtTVnDtOJBwKn3xKfS2oQ3TW7HkufO8yzPQaqHZY4NLMG7SGotp?=
 =?us-ascii?Q?8oulZC4lsrTAABijLn/ivvWPklOmagHBPljWq5g9QLlEEp2UPNPe3Q9EaumQ?=
 =?us-ascii?Q?5Y/6//Nut/00vMmYRWlG2NWwqaz0UUL66qYk/AQq+5DacXuiQYXDM6HBj2UG?=
 =?us-ascii?Q?7KDe+r8Wt2tpuHwBvyT2YUagO/dso0p1AkYPeQEmqlZg5JFMDK2DEEARWZgr?=
 =?us-ascii?Q?Oa6js4Wn73P2oBDOi++z5Eu5PgE2q/iBpoo48uQhJlZMyq3WqoSMEki7b5TE?=
 =?us-ascii?Q?36lbscMPWfkQTccT3x04yAGDnGmZ4KD+Ug0D9Jcizk0c83o6qWdhK9CI6I6z?=
 =?us-ascii?Q?QUV8+IHMeMtCQMYUNoKYuCCAOr70cDZZqlqkmPp/Grz8MDtqg7+QEA1L7gFT?=
 =?us-ascii?Q?7zg+9cYGvwOxrStbXUpl9/0RdcR8RflScQJYSazybIx3IBZZHAeNs27xdMSg?=
 =?us-ascii?Q?wHBsScs5Vmon/dDZbdh9tDlGwPrvxiqX1Rc0y5rnGQo7yXooCYDmULFo4pIe?=
 =?us-ascii?Q?r3L9YzCzSVxfY2BIQeyYsOw0fNOLeX+PCwkgTk8IYXKSu6rks7LnzSIsHfKO?=
 =?us-ascii?Q?+8ipOQa2eE/PY++LXNrmlvBgj42O1tVnWQFwmNQMdOcEVxTOSVP9I3DIFcTB?=
 =?us-ascii?Q?xK1t3iBVtOFlGeih+Fd272PHSnexW2HKJtJRbQge19Vh3P6f47Z0Wo5Iska7?=
 =?us-ascii?Q?XmFLXUJtC8PUTKj5Aht2WQXNucmnt1OJx1Km9Kl3wSdj+CXDZxSurVTsIEV/?=
 =?us-ascii?Q?kS7F1AbiLMqOq0am32STtAgV1awOZrHlr154mtunsPofejVSgepgO5WkvIxq?=
 =?us-ascii?Q?b7Q02mLjttXkhuBvhxi4YyCB4knQPUJuE4HaC3S7U/0M1h+ZQTr8LKZUnqRE?=
 =?us-ascii?Q?bXxuBAW1UtltMgcvUT4MpMRiG6mHxIq6KDcIYAzAADA+O/xUtOmFxG4kmME2?=
 =?us-ascii?Q?0HtU0ND7f7U+2PijdetwUZT6QL2SxbxKe+TEOclycuLvD3eebgLwsR5dr3BS?=
 =?us-ascii?Q?Z50FhXIOjjs6YRwrwwEeDzO56tVRWIvN/Y5uQw23y5fM07WnToBGU6bzrZlv?=
 =?us-ascii?Q?AJuo+eXtZnhUKmVTeOLjE7LlVzBczrY+X/NsWT0aqIOFF9VynoU2sQX2cQfT?=
 =?us-ascii?Q?r2z6plmL9uaGJKXOY7bXGnkVJIkvHIuYUJvXgdQTRNsRv2gyz5iiAKiXTrdt?=
 =?us-ascii?Q?10syOBNRZxzBgv1BCodrub2q9V0w9D7dHmIp2koOJBLAKeTUo/dv7P7xEfQG?=
 =?us-ascii?Q?Gaqp8Rz/TBrKOV2A8Jtx3KTonKByxvG3rVifQUTeDutV7GbGc5dcwQ9JdHb4?=
 =?us-ascii?Q?EVsErv6wlBSqLBbReP3vZz1rqUyKxFXkeVUYTDZAtLAGc4+2rnvLSY1AKujF?=
 =?us-ascii?Q?THgzETvPmuOABeh5IQDxKQLlvoyv+JrK2MoVLg5+me3Y4iB0Fpg3SxYtdfXZ?=
 =?us-ascii?Q?+lqvEEwrb6aSvT4ua23d74TWxXYVDuVAz7f2ctRw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dLcQp1FA5TTlnGtm01cVf1mTopmLwSlLTeVK2fW4fBPP9h4/k6w2Kl6+foz9YPIKDDXPAXjBbcfgwh38BAhyUarAUpYPyDgUUjqE0h4tFgKKyb0VEuYE62QUZe8RtXKn4f2MD/S3Eeql1dODbJ440apZtW7bk6+zPHZqkqVLEb1So8MCqCev14ph1gVsfVD5iWQIjR4RpYPntk22mteA0JDH2PvNdpkYP/Vj6vUQNcQhZykLXc7H9n+6JsIAcIc2C9Dxzbogfa/jw2eJpYgcbqiOBV2B9nHTX7AbYMy8mxKLHxn1NqIPiXgwzAQo23Da9KaRAfQ/OBb/ddCjx5MKB+lBjD9tG4m4tixvp+AGGaG3JkatvjfvUadtQL3xcBOh0N2QG3CM961pOLLRyk0sHIxylwYpotsAb9UDYZS6Em8GY/ooZDTRuA6cSWi4jxUTZijvudO+wgfd8pQvVNKr7ftDSy/cXrfAjgTVu33+TZhmA1p52dBMQwYuA//URQsIK64xJjhv1CIEjSGYsCcspaj1pxN0c+Nxu6GEqnZLe2UhLpKVd8djgun08SHnyrcXJWdjWnNm5jzuVd0JDXfwNrSAKobKKN4OJJ4ny/0AcdF4QGj+nilibCf/xfcKVkqf
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ded24c9-d640-4409-2fae-08de27580919
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:40:19.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Be8rWp1y69AI7Cw+qug9oAZrHQn0ORph2KlhRo/zJZOrVjvuNhkOQauUANsszQrzkANg4H/Rrc3ZAZxQLpVkmg==
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
X-Proofpoint-GUID: 4JPsBO_un8m0XTfaXelpIzZfh2ewSzgh
X-Authority-Analysis: v=2.4 cv=Ob+VzxTY c=1 sm=1 tr=0 ts=691d9ec2 cx=c_pps
 a=F9hHg8DDxxB1WqAIGSG/Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=1BtGkfvxpQeA6YN4xrIA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: 4JPsBO_un8m0XTfaXelpIzZfh2ewSzgh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NCBTYWx0ZWRfXwpo3g4nSMDnB
 9d5QtwDIAi22D3z4mWxO80WfIW0tWApfncEPUT7aTdP79LErS2j/gmhaTeGfm1WPlVnodBeUFIy
 +6HeTPE0k5PfuiLh034j6re0tBJl2gI1Bd461WGHtrLNq4vQeMI464hmUJmAo3KDM83v+d7GT7u
 QaVTdko1yt7licPozWteSKN2yGUz8rWUHKow64FbUWH6qD8IpO455n2joo0dRgtxJTKYKWzD4Ax
 oFkguiTbAyK/Ow4x6H7Q9nHAG7hHf8PKLEwMEczA8/us9pu8/vqktL07xR5X53z3JnA2bgselmo
 52L2zsMfRLuSZGDiR/PFsMPrpEgbretuzXj3z5XxE6IP7fz2QtWT+W73N+x3Xn464QE00siRmAN
 firwRx/nN+9DH6/qo1V3oy3yWhiyXQ==

Extend the QMI byte encoding and decoding logic to support multiple basic
data type sizes (u8, u16, u32, u64) using differnet macros for each type.
Ensure correct handling of data sizes and proper byte order conversion on
big-endian platforms by consistently applying these macros during encoding
and decoding of basic elements.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/qmi_encdec.c | 102 ++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 1d2d9e515870..030b18fa086a 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -23,18 +23,60 @@
 	*p_length |= ((u8)*p_src) << 8; \
 } while (0)
 
-#define QMI_ENCDEC_ENCODE_N_BYTES(p_dst, p_src, size) \
+#define QMI_ENCDEC_ENCODE_U8(p_dst, p_src) \
 do { \
-	memcpy(p_dst, p_src, size); \
-	p_dst = (u8 *)p_dst + size; \
-	p_src = (u8 *)p_src + size; \
+	memcpy(p_dst, p_src, sizeof(u8)); \
+	p_dst = (u8 *)p_dst + sizeof(u8); \
+	p_src = (u8 *)p_src + sizeof(u8); \
 } while (0)
 
-#define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
+#define QMI_ENCDEC_ENCODE_U16(p_dst, p_src) \
 do { \
-	memcpy(p_dst, p_src, size); \
-	p_dst = (u8 *)p_dst + size; \
-	p_src = (u8 *)p_src + size; \
+	*(__le16 *)p_dst = __cpu_to_le16(*(u16 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u16); \
+	p_src = (u8 *)p_src + sizeof(u16); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U32(p_dst, p_src) \
+do { \
+	*(__le32 *)p_dst = __cpu_to_le32(*(u32 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u32); \
+	p_src = (u8 *)p_src + sizeof(u32); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U64(p_dst, p_src) \
+do { \
+	*(__le64 *)p_dst = __cpu_to_le64(*(u64 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u64); \
+	p_src = (u8 *)p_src + sizeof(u64); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U8(p_dst, p_src) \
+do { \
+	memcpy(p_dst, p_src, sizeof(u8)); \
+	p_dst = (u8 *)p_dst + sizeof(u8); \
+	p_src = (u8 *)p_src + sizeof(u8); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U16(p_dst, p_src) \
+do { \
+	*(u16 *)p_dst = __le16_to_cpu(*(__le16 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u16); \
+	p_src = (u8 *)p_src + sizeof(u16); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U32(p_dst, p_src) \
+do { \
+	*(u32 *)p_dst = __le32_to_cpu(*(__le32 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u32); \
+	p_src = (u8 *)p_src + sizeof(u32); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U64(p_dst, p_src) \
+do { \
+	*(u64 *)p_dst = __le64_to_cpu(*(__le64 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u64); \
+	p_src = (u8 *)p_src + sizeof(u64); \
 } while (0)
 
 #define UPDATE_ENCODE_VARIABLES(temp_si, buf_dst, \
@@ -161,7 +203,8 @@ static int qmi_calc_min_msg_len(const struct qmi_elem_info *ei_array,
  * of primary data type which include u8 - u64 or similar. This
  * function returns the number of bytes of encoded information.
  *
- * Return: The number of bytes of encoded information.
+ * Return: The number of bytes of encoded information on success or negative
+ * errno on error.
  */
 static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
 				 u32 elem_len, u32 elem_size)
@@ -169,7 +212,24 @@ static int qmi_encode_basic_elem(void *buf_dst, const void *buf_src,
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
+		default:
+			pr_err("%s: Unrecognized element size\n", __func__);
+			return -EINVAL;
+		}
+
 		rc += elem_size;
 	}
 
@@ -456,7 +516,8 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
  * of primary data type which include u8 - u64 or similar. This
  * function returns the number of bytes of decoded information.
  *
- * Return: The total size of the decoded data elements, in bytes.
+ * Return: The total size of the decoded data elements, in bytes, on success or
+ * negative errno on error.
  */
 static int qmi_decode_basic_elem(void *buf_dst, const void *buf_src,
 				 u32 elem_len, u32 elem_size)
@@ -464,7 +525,24 @@ static int qmi_decode_basic_elem(void *buf_dst, const void *buf_src,
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
+		default:
+			pr_err("%s: Unrecognized element size\n", __func__);
+			return -EINVAL;
+		}
+
 		rc += elem_size;
 	}
 
-- 
2.43.0


