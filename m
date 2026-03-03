Return-Path: <linux-arm-msm+bounces-95213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMDsL5hMp2l2ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 22:03:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7F1F7168
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 22:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D6213030DFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 21:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F973AE1B5;
	Tue,  3 Mar 2026 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AnkmFCsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC73909A7;
	Tue,  3 Mar 2026 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571768; cv=fail; b=cM0Y1tgUAm0XWIyJPEywV46cO7+Hv4oI1Psvg7LJmqEV784NI9SpV81w2mWTtdXVqRaI67pxT1MZQXfl/9UtdEZN5Y5QdJ46/0ufUtB2fnaV8fUuJGEEr14T+aQ4zC7jJhAyxB2tMYmRpmlR0xQu3G0yc32s2pPmy7eusHNvBHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571768; c=relaxed/simple;
	bh=MUlDoyltl3J0tGSNHbXFItHdczZ2M4EpccDpbctPrBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tpqef1SZ9Z6wDE5paoSckh09U3rKbswQTFV9u0AD5TgRltYlsJ6YvkR6ZHVw2M59EGxsKJ+OQ8mz+pAPTGWgxYWMWf4i12eTer3++BUUc0uVQM7nucT1m/UKLXrkqCGB0YJIWBcoB8OSs/LodTW54dD9iyGc7nyKHKd4CG0nvxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AnkmFCsD; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1LED9ReRtBTPWt+djnA10fjDGTXC/lstGHUDkkEYztwae8bUDPpfeETLjV5pInu/FK/ey4PfojYkD624Y9OLP62KHmYracF7k2xXLePcIJ/4LvXtcxAnrXr1Ga3X9R+s2C3EFZMfs0PZCE6aFi5HO7n9jRtGp/aIE0AVqypGlG3XMh8ekF/yHZIAk3I5oeUW3BhD6LdVu/kkUTC3gGsrDMfXiPw/PkJu98LY+Uwd3A0XiNaiHnB77o1aTovoyl3aKL4KzbnVUEH6FmheV5BSCvKF2xr+x53rr044OZnjB+rgzWnom70Rvv7iHIO+qjaaX0tcDeAkwR6um+QNJ5s7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IvPhxB0FTI1LMWJ+oG+P7j1PpUMH5T1yWBxdQ5xxaA=;
 b=zOi3/VpvK1kBKbFtf1I2WDRUsj901ewy+VmG7km3/kb++1mt0IRjtqhatr9OHjBAfo2R6QJHFYFI1Eua8PomTpKnyLzk+qV45JIjBjBXTh5VtlQfI8WZh1UuX6Q40fXs97CCOuVwFA9PQcNJwUkpcywN2CVH3oA+8+U4AUB3GsS+fqhdT6mTHK33X2R7fjWqybN0JmzhcHqq8tTvuRxXXl77yhZSa78E8YfjYXuX2tBZ5B9HOGlJBPwxxVyZmgj5tYh7CN1+YGiq3zPgAJyJ00RITykX/RIgD+WRBC6+ePY1fBmBdIlh/z2SSLwZaJSpSnjahGhKVlYB5vFh4+KnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IvPhxB0FTI1LMWJ+oG+P7j1PpUMH5T1yWBxdQ5xxaA=;
 b=AnkmFCsDxy7Bi9XcI5diF7fvltvEvA98TNvEMNVTmiF4YzEbdFKIvYjRfd4wiHaJM4nsk7NwPZJnRy3oCoEZAF8AcnJC8EFdfGEuzxI1SScIvLHKhCzYcGdcDuTuQ/fK6R0dAyK6GxZZFbVTyOzkc/kZbKGSCH/fT+vZy6+GkKHH84eMyOOIdh/Nyzyvy35HZqMQF50yQxOlsAYme7VTEIS09d8GFeInVyU9ylUr3aLOMdUCr6etpi4NdgZeHXZXHt8dR97CPL5olQQHY602mhr0Fl5u2ZNsrENGxblGosmhmUsjcIPV16nPntSklN6VtE7dynsnGOhbG/L3+78n6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:02:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	abelvesa@kernel.org,
	srini@kernel.org,
	s.nawrocki@samsung.com,
	nuno.sa@analog.com
Cc: Frank Li <frank.li@nxp.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
Date: Tue,  3 Mar 2026 16:01:08 -0500
Message-ID: <20260303210131.2966214-13-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303115720.48783-5-dakr@kernel.org>
References: <20260303115720.48783-5-dakr@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 665f394c-14d6-43db-0f59-08de796835fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	up88aMgCoqiQqHz8UjGcpAJPx0etdOldnj70ptPFxQbNXfkqrGJ5xCACYatZaxSto58yU5R7l9Epm170X7B8XVYnNJuuKxab8QueXNE4e8NcWZF4zpy0kQBBCDD7mXz8k3JFHNzGMuCt/K9l+xdKfCYCwtVTcz42pQs09THF74ccTxpiHhGndPdkUtvRnbbrro62IiehedyzulApwrkOMSikwKNqD12UCcDfqtuYwsPxBVYc0jIiWpXOTSNJWLK0uGcIhL3Xt/6eyDwUERRQSrkiv3mGP68LYZ4/0zR95qFnMR9SpH1oOxZFvG+zcNvkgy/Idy+pdKXqOPVBWql+PxdZvD3rabS3fMVGPSuF+lPbADzzHNuIj2qP6a963jevs6KyESzWM0Y2Gj+hbqe3QehW5CcMsFuH+6vL2sSJNXoGOQLR9wlBpXREWqsFU9QnAoDWzDEq+ym0pXgg/eCECyY0pIVp52yEiWqeWbr0gzfD8x397qTPfuhj8tCAde6kGkJg/CigdEeQUuG5fqMn+1JxVbNfHTr/VTfsg+mrJ7kXTT9vd6FBpdatb0hN1sZjxfwnc+v4HfR2W5Zthr20Jnkq/cs/tD1p7k2oeGbYYOF3lrqEx0qNcmAV1LtiOwQrilMNhS2rO183HC1w0vr6khuiYfZsXUMxPZy5vj2YE4HPAWYCwnFNFqR3+b9EjCE8TVPd8z7yE/lmqZssFxvfEWQ66IpZdhysyk519zxHACKg4OmGHv3CS20GXtwU4OiQO2R78cA1nPRRtHP0/xgXO8D/igOphB/YsXH4v7J3qQXGTTMjrXy4TX34Q0AD0JCR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e9GtLAW0aszRVhvglm7ZxLs8BwjUVMAG/KCw3aUHFNgXD3PtOZDsj4VpZSZx?=
 =?us-ascii?Q?dI1tlJhGUpBsZaKBG3hOzapZPRSsnZcAyvk8XBdKWxOIr9vrE1LSoJQQxn8i?=
 =?us-ascii?Q?97pBTUnd2+ng9WKBGlpLwHOVUeOf9P/ZVnKDSheeQmdvASSaMzbwgZJaSLWf?=
 =?us-ascii?Q?1FVhvAsRu+fMlRzixqsIlczXhWPvv5RZLJeKpdXVtQ1QDz/dzMogtShTVIoj?=
 =?us-ascii?Q?YoN3knQZNkEL6PHPgbQO9a+ELdwgffrwcnxK4bMqSI7WAbKFOC1N1dVLJQI/?=
 =?us-ascii?Q?6zs/7wTl/cqmFsUhfBHxYsDWvxzmuFoGfjSvoUZ3Qn/1GCOgHA3yj7QPWKk3?=
 =?us-ascii?Q?rjAjdjygMUzXt2TL+A/dZBjfTN4uHQwivfjZAp/kH9C1rba4LeGv3LhZEouX?=
 =?us-ascii?Q?IbAlO6f762ZF0mMrJw2n0/KAAoDbxchuC7blBktd1Tgk8IGDP1z3UOY9w8gl?=
 =?us-ascii?Q?ri9s9oCAKhS8gfVVPuC40Fr7fgx+k5R3qLOPwxJCCVt31ucBXmI1L+QQOrlz?=
 =?us-ascii?Q?su2WboHJ/F4BWHr0mfXwKtDZyIoEYW0ccuLmbg+HIwmarZaCp8VB7cdJpLFB?=
 =?us-ascii?Q?sGfDQ9smDdDVRF6SEysozWQHdpXLECryU+cOQP8/pVyU6p64BXh30F3BEpi0?=
 =?us-ascii?Q?Y+gTE/imBshi0b8fUexoatCIvyzofaxK9WJMHAn7qGWSMqloybtSAbOU1ezr?=
 =?us-ascii?Q?yPlPNwpmOD2owQdymss0f/VAbp2XaJzizCR23xavJNisHPdyy0rpItkYZzF9?=
 =?us-ascii?Q?AhbZJ4g/iqbujwE1s5suqGPcswgXjaOB3KttWfhkQfzBmPzrqWpfHx/icvFH?=
 =?us-ascii?Q?8V2YdEV2bH9zosZ8VPzqA9M6wBs9kfouCtGi5v86Qn3ObOhT07Pb/46vprrr?=
 =?us-ascii?Q?Rzc3vUHIvGNdr5jjuvHJJMFZ5lbZHER/I2pVv/s8gUmSgBZD1ySra+3mtQ/b?=
 =?us-ascii?Q?xrYFl+AV3I0QhVxP5jJbg56mZG588Ax2NHcF9pHgOcF0Fi+Xb06/rSnT7rRJ?=
 =?us-ascii?Q?F6Ahvg8RmUEQd5eP0JoPDgOmpS7+4EUsQ5GjvnYEd2BxADT8of5zYPYnURBy?=
 =?us-ascii?Q?a7j0F9lgiDEk7LtzUUAVNNS1mS828TLVVU7W+LJNBJZxhvp58XQvOy9ImtSz?=
 =?us-ascii?Q?spD/3zzk86N16bKyOMIe+NX3pkXZy+ZY6w6sZ8PeFXM2xG+W+5jpPyB0CjwR?=
 =?us-ascii?Q?Uen0Xwi/8fCqxu5a2qiaHUuAzS/OCUnWNc9OgipxkHWCuN9ow+FCn2oOtPt2?=
 =?us-ascii?Q?r9L8Y86CHeFX14U7qXS7tnga/RZ13+92Qsu5uZFI1aparqP+p+qTW+1y+bYp?=
 =?us-ascii?Q?NEC+IHjr2I6GI5XbFDGEYNS0KguZZ+UUvDtbkubOqDFnOZrX9XDoNjB9QJOm?=
 =?us-ascii?Q?GIdkOGVy3NdwO9vswv2OQBDR2Oj7uJOraozTOOjBg4JGY/hlmYujoOFtCA/H?=
 =?us-ascii?Q?R9tixc3l0a+eJx0RQ/0FjrtyZ7P3X8x78nI9mJcJjgLRcAZAyTr71P02+C1t?=
 =?us-ascii?Q?2gGp/QXwcBVS1e6yjckecnA69R3dehmu0wxOh48thEPT/SwgT8OyOwPJexq6?=
 =?us-ascii?Q?f4DVmpsDVGGfEq+KwJx375b6/7/Vtp6pzUESRnU0jXEdSSuHM/4iPcE4d0L8?=
 =?us-ascii?Q?jfA9ukK0X2XRxSJr0qPm6t5X18cssFC7mYIqFNV1/9a5t2XzFkX0oTNaB4lC?=
 =?us-ascii?Q?649ZuRrFpHi58RHwSvysIjRnmR0tVuSu49fIQYorYKG921CifANexcWEClop?=
 =?us-ascii?Q?mgzWcmKAvw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665f394c-14d6-43db-0f59-08de796835fd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:42.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjiJ6ipUnmpP0McvKJPWG/sRbImke9FyYqMiiCQSpghBKc5TtZ65lC/4DMcSTyZ6zE42O5JG0Onx2PCsIAdcHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-Rspamd-Queue-Id: E3A7F1F7168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95213-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

> @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct platform_driver *pdrv = to_platform_driver(drv);
> +	int ret;
>  
>  	/* When driver_override is set, only bind to the matching driver */
> -	if (pdev->driver_override)
> -		return !strcmp(pdev->driver_override, drv->name);
> +	ret = device_match_driver_override(dev, drv);
> +	if (ret >= 0)
> +		return ret;

Good: centralizes locking logic. Verify device_match_driver_override()
handles -1 return for "not set" case consistently across all callers.

> @@ -603,7 +603,6 @@ static void platform_device_release(struct device *dev)
>  	kfree(pa->pdev.dev.platform_data);
>  	kfree(pa->pdev.mfd_cell);
>  	kfree(pa->pdev.resource);
> -	kfree(pa->pdev.driver_override);

Correct: driver_override now managed by generic infrastructure, not
platform_device. Ensure device_release() in driver-core handles cleanup.

> -static ssize_t driver_override_show(struct device *dev,
> -				    struct device_attribute *attr, char *buf)
> -{
> -	struct platform_device *pdev = to_platform_device(dev);
> -	ssize_t len;
> -
> -	device_lock(dev);
> -	len = sysfs_emit(buf, "%s\n", pdev->driver_override);
> -	device_unlock(dev);
> -
> -	return len;
> -}

Good: removes duplicate sysfs attribute. Verify generic implementation
in device-core provides equivalent locking and sysfs_emit() behavior.

> @@ -1377,10 +1347,12 @@ static int platform_match(struct device *dev, const struct device_driver *drv)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct platform_driver *pdrv = to_platform_driver(drv);
> +	int ret;
>  
>  	/* When driver_override is set, only bind to the matching driver */
> -	if (pdev->driver_override)
> -		return !strcmp(pdev->driver_override, drv->name);
> +	ret = device_match_driver_override(dev, drv);
> +	if (ret >= 0)
> +		return ret;

Same pattern as arch/sh. Consistent refactoring across platform code.

> +	.driver_override = true,

Verify this flag is documented in struct bus_type definition and that
all bus_type users expecting driver_override support have this set.

> -	if (pdev->driver_override)
> +	if (device_has_driver_override(&pdev->dev))

Good: accessor function prevents direct field access. Confirm
device_has_driver_override() is properly exported and inlined where
needed for performance.

> -	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
> -				  "imx-scu-clk", strlen("imx-scu-clk"));
> +	ret = device_set_driver_override(&pdev->dev, "imx-scu-clk");

Good: removes strlen() call; generic function should handle length
internally. Verify no callers relied on old signature.

> -	pdev_sec->driver_override = kstrdup("samsung-i2s", GFP_KERNEL);
> -	if (!pdev_sec->driver_override) {
> +	ret = device_set_driver_override(&pdev_sec->dev, "samsung

