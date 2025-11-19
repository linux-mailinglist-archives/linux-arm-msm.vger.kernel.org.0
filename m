Return-Path: <linux-arm-msm+bounces-82439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23EC6D5CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A92EE2DCF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BA92F5321;
	Wed, 19 Nov 2025 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="gSYaCFE4";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="WiOZkazj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D752311C3B;
	Wed, 19 Nov 2025 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539998; cv=fail; b=iYRZIlm7LbPgAvKklL/icIzWiznUPGY4PCWmwn7zI4RM6anAjFCTRt5hBuTPf/IbTLgXAt2CbdLrivWMvPvbXeZEcjDkJKuE1CYAhhBAZdOsW1PUWOwutkW0OGFaVA+R9XlErmYRWLSoG1YVUqjZCS8NCckaHXt8KhyrWilynjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539998; c=relaxed/simple;
	bh=tu21dvfTqPTpI2Eu15E978bTkVY7tXNrHhTFm0Ibf/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VufUOZPMEq4QHEI4i+dalTLAUyitHtgwWC9sZp/mw6lLF6yMj0ocR65HvvnzekLXTEFt+bEKugnhcb4DRDAZrra1vcAr47TdDqpooXheYGk34zJ20biTqQ/wyT/yc7NBsFS/y/OS49U1FjHQMIOrrXQFCIkAJDhCqx2qfc/S7Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=gSYaCFE4; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=WiOZkazj; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7qUkn021846;
	Wed, 19 Nov 2025 09:12:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=6rW1JbGlyvIYhUq6X2t0POue
	wGlJEF4vY4ez5DTYrFo=; b=gSYaCFE4efVwCSVZDLSfo5Gi1wJ1/0ZVM9QM1FJr
	GwtYRNIBVgPROTOnB/HV+S86S9G38b9Cuj3j1slVrQvykLaArQY1imz4wcWoP7ir
	vTu6IZw4Jeo5onPl2w/VYXykz8EgL5lnqsjvnEPj1E+Ir8vDlcfK0P/ZrpBXyxUP
	FAYWJWlfejkv58XhZ0S0a3UYF8uhkYeWlHhLKLRjEcSd3qFmr35RP6+oGshh6pZj
	32BLzktuQsNGH12ylHRJ8XsCm9/9IVDhCtGccwNr8QbdjHuSsC6+oXactB1ndDUk
	rX1aDbjzZiKenbhHfX5cGFd3+rWC7BoyJymx5V9LoE6Egg==
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11023108.outbound.protection.outlook.com [40.107.162.108])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4agy1kggdu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 09:12:45 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/ocCpUqJssOL44QkFIsiyjTPkvSTnCyaspxKlww4GidvdmXU/53SMt/7no8Eu1w3qwwE0PDuCXdsYlLt680nlCfZ/WIfbWTgMo78huS2+px7WZCB+TdXEKYyeG8uU4KRPQIxxHEh7mCMfXe/gy6oTl3wVFPqWbZGHA5bl/T1QzMqLD5F0r4Wju97sX9w85+J5NOpkFrwmVXzUbpQ4v3yWxLEg/swBmbHq+cyqDcAobcCmAcfYVQm+3IAm//0C0ppvQxkdYBgTl916GDLUEdIPW9MSQnrvilCy5n36TtO8nX4e+b4j2RHQk2s56d6raVSiWTM9Yys+1l6+YS6mBbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rW1JbGlyvIYhUq6X2t0POuewGlJEF4vY4ez5DTYrFo=;
 b=eg6uR6WA1OEW6hAK7VwQnyzyURoci6c+ZWSKROffM4aWQn721aDM8dg//jhknOtQn+B7ODmN1lkZKQsUddIic7CtRf05t9+pLDZDAMRe0I4VRX0CWLGsQdk9UkoAsCrOnMn5PBOpwbhv+zO8q+BEgH6f0vfDz+zWOKeiRZacOh9Y6R3+R+Z3LkuUmuIE0uOx0AE/fdIJXLUVO301WrDQkaIVcLGy6WZI4rcqAEPeMf+o3UMn7S9R3LsPEnu2FjciAT6IyDN+GitsdAuX/l2vgEN/9KpXwCi7nw9JoFk1X7FeaV6LI1bZ5x0YYX2kA/1KpxLG4lO06QpvVHzCCDKnbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rW1JbGlyvIYhUq6X2t0POuewGlJEF4vY4ez5DTYrFo=;
 b=WiOZkazjK32P8wUc6xA7VTaNFcqnehsmNjZvC83cVT8Xmi3u+i0H+mNJj15S6ohhpiamvfxUYUNV+YabyUqcNiXkgNfd2sNaslPhuSxpIYvm9tCvuojV9dlUhA0x2ISkV5zTXWWGTJRPFaPDnuC8Tur/c+poXz1x9JC3qLg9FjQ=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by VE1P192MB0733.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:160::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:11:57 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 08:11:57 +0000
Date: Wed, 19 Nov 2025 09:11:54 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 1/3] soc: qcom: introduce new QMI encode/decode
 macros
Message-ID: <aR17yv1fVk4OSJaA@FUE-ALEWI-WINX>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
 <20251118065343.10436-2-alexander.wilhelm@westermo.com>
 <6j2dnxud43ywxflnncebhj6b6kmrkda33evyj3iju5bzr2vyoh@ijytjv3p4pvi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6j2dnxud43ywxflnncebhj6b6kmrkda33evyj3iju5bzr2vyoh@ijytjv3p4pvi>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVZP280CA0058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::10) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|VE1P192MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d570df-e5ac-44d6-3e02-08de27434eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xg5FxlpoyjOE57RWgq8prA0+fcKL405PV81Bb+ldngkChYD0Ck+B3k6fgpOe?=
 =?us-ascii?Q?YrNNmJ1XTpdKIoZMKWW9jcRyTD/sonxh3c4EfIE9lIK6w7AyiQQ1EbXdGeQE?=
 =?us-ascii?Q?kSYLSYnRziSZM3dYcIN8kqBBN4qFpftISvHVhog4uwJuLqj4YxSGNQgME9iM?=
 =?us-ascii?Q?wUZnqwft1pPNSogu6wJLv2ak6u0n2fq7RLAEOoyYwaeq4X5jl9tVIamVvJJ5?=
 =?us-ascii?Q?bZAz9M9PRPfZmr02I+e4p4WZMppiQyjlIZFXmKi53L2ic8Z8F+RqOtzf2kSQ?=
 =?us-ascii?Q?0ig1C8N3CUQXpq4VZTIaqnnhx7aAy5S2yfb15lquvGEHUyrtP8mNc9Qkx2ar?=
 =?us-ascii?Q?+zfqbPCP//Q01UtAMLtqlwRQQyt2l23rTsT3cSCEmz7Kyu9QmrqateR346SW?=
 =?us-ascii?Q?862rd4xoeyTg1lZe8mtTv41oEoIlaEMBO0Ae0CNQDOvRYHzj9JgNQy+B0/Cp?=
 =?us-ascii?Q?8XzVgi4LH/63wBBVacZ3cJVKcjVX199mzybJkzBCu58oHQ0mHLgxQWs+qG+2?=
 =?us-ascii?Q?qr0MTtznStd//KOd5+klIJOgKM317sssxZEZTsTUkfZccpKN/5EW3kVB8Qbp?=
 =?us-ascii?Q?XxgDyEjxoBs9IN/ZaN2E7I3x0fu4843MdY5Z8dkCTYRtCtxqY+Q4dklg++1B?=
 =?us-ascii?Q?72oj3plYPdvuaKC6PADtM5Z9+w3BgLEzoCt6ImkaaPXVyRUYDXPHZrDPnpVG?=
 =?us-ascii?Q?U47wfJXx7H2vxjtUgaaXZV5huV808bsuzkhG9rD/6LHLwmaO1yy8mXfkgeO1?=
 =?us-ascii?Q?rkBo4iWp1w7MwyZN71Kx51WI4Q9bXuMIUYsOeQ3yFjZ24fKx8KnsgIXtg779?=
 =?us-ascii?Q?yqVyc9VJgTtC1q0iuWB2JYGdIqpN5ZRF+RUywtHGwWT/4UCok/YQHDa5qnwA?=
 =?us-ascii?Q?vi+2saqfFgyJsWJ4fXEnRpgHkUHcM10MBJc8qV+wtPRFEVicdoEFafwc+HNL?=
 =?us-ascii?Q?vOkE89vpwyumPLBr1bisAK/N0DR1rBxb4we/2QHt878Eud/0XKqoE/Zgk11O?=
 =?us-ascii?Q?TFg1I1Qealjs7rXThA+IyOBNmYz7u8VkOOA15/w75OJwr+hJ63yqmGK1jhJb?=
 =?us-ascii?Q?W4vxdI1UMDIgVLoZHn8VAHqOpyV37S+M8vDI+YL+eQI9texCIfd+fpq8Kax/?=
 =?us-ascii?Q?ca1/A8QzCbfNuvdE9wqBdWmh7e06cTMjpbRqoaCRq6Fb+X3Yqhnub+T8gkzL?=
 =?us-ascii?Q?BVdtMw6gDnFC1UD2UbheI23dANi9JbIKVh9kQ7rrkUFuMU4SooN+SpT8nRRB?=
 =?us-ascii?Q?YHrId5JSHS4kRiHwISSgd7arUr2imDniu0szCYTsp3UehzA0jXufRCvjsvcP?=
 =?us-ascii?Q?V4fzbXie56Mw3V1vgqcouSNmjFD1UWLOjVtpavVB3xUYCU6l/12mKiV4/0HA?=
 =?us-ascii?Q?7yNQqILICkWMBMWUOy6+UeGGciMYjC6OS0wL9bYvoGZXF4xCgGHD1mGOcAUY?=
 =?us-ascii?Q?mN9nuLdj5CiDg6augogU1iZKZPncodlj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FHcSfWFA5Beq0ciXkoKBNd4jOrh+FsW59sJxRnX+i196ioaEOrUGqMJcamoO?=
 =?us-ascii?Q?smMdodNXRzYIbq8ebhg/oVT6QBmMdi99CPxmbe0xPy2NR3M5UxoAQjW6NURl?=
 =?us-ascii?Q?iaX37GdyUuOt4O9tzmQMCq7m4p2L6xlKyVqtQ6DUxZy5y5+jnCbdchp7efDk?=
 =?us-ascii?Q?/7XisPOnblGi8bcgYwMD9017QTOW9ywnWZXcfowyddqoTwQ9cP+YOkiXi13y?=
 =?us-ascii?Q?BU9MZEsFvRwzR7YLvyFFKzjO5ByE0Zk9ptE6NN5HHg5Yt+NttB/WoR4BiFwf?=
 =?us-ascii?Q?tkimQZrIUxhDOzENFQzW3SBEgKZHjtbZfi9UtVyzoVXYIWECZd7C0leLEKyt?=
 =?us-ascii?Q?jSYOoukQjerrGTHQ+vq+7Dz8OjsdVnmHM8j0A/7i4jQjw2lO3E8WPD2Vu2qt?=
 =?us-ascii?Q?JjKZaoLRiiE54Dh4vPfuRhm8cyb+WP2lToppviUVJ6IswsJ5/k4MTDeJogGg?=
 =?us-ascii?Q?o7Oltlqidzyj+psnZgOej0RvIHPr26EA+bPMQ3jNR8ejEb8UiREADWbsP7ym?=
 =?us-ascii?Q?ls8kzerE/22ph46x+/cWg2B5R7JwrTPmHpgXiwgeiwBKhN+8i180se37xEyT?=
 =?us-ascii?Q?+/hBJw/2x+eauIlEbXpvsSgWeGOuWOv/emFHhuiz5ozynnoZIu3SrKCu4AAH?=
 =?us-ascii?Q?SZW+lVqjVqTpUgTKkDvrb2WZC1UkGzQEN9BxwXP/+HY436Cnb9XC29tewKi8?=
 =?us-ascii?Q?0D/kLeV30q2cTG3hO1k5l1slF3/JIXo6RoC4EkNtzZhBMavdnk6gDTkE9h2l?=
 =?us-ascii?Q?13DM2E0894J1KxjWWwt9du9I9+6Z7ADtlqoBDVdfaMTUGMn9x/glybGv+4rt?=
 =?us-ascii?Q?BVKf/eGQ0p2SZsbX2WalsIdq9Z61LjZ8hmi06KPw1eXT+5Y/lVatOPsfnt2B?=
 =?us-ascii?Q?+n4XBNqTlytntXU3PnRkfw+tT4yIx4mwD2O/OxQoZaUrOxvXIQC4Sa38cPYS?=
 =?us-ascii?Q?fPyf9YLPAZjEHcAh7sQBJwFwrf5nyQqxEtdI1GZtz0GbHkNePR+JxZxIxXGx?=
 =?us-ascii?Q?XfSfVZT7C+kS5YTbRTA7XwTSTrmCBCVeQ25ge+yRKvejcOvKCuuVuPIE0+5p?=
 =?us-ascii?Q?WCK8fCIe03j85xS90S3AFiHK8oh+RUNMquSmyQlmnl3zAaAE9IKGvkZ+s19C?=
 =?us-ascii?Q?vU3iPiQZLBcRtXmKUShfNja2DQS0CVK76xH1K8a6IO/FKsj6trZqT3na3pDW?=
 =?us-ascii?Q?3iOzQ75FmX7+9+eI1VUxZj65cVn/pluww6gZyV+ZflkKrcHhmdnDvUxBbGSO?=
 =?us-ascii?Q?Q5JVY9NwEUfgesXTfr0w6YGoddPGrcyHWrR6W/OdKuOzRbobDa/TmIVJiIi0?=
 =?us-ascii?Q?31UOf2yZJfn5nX98O9Guwf7DgHlbRmPTD1w/4JB66rxcspNkpO2MGa3DafOa?=
 =?us-ascii?Q?nUd3ghYKS3Nxcp/tFCnsNdEA5yMLqjzb8yIJP8wKzyPg0hvJRhS1x7v39Y1g?=
 =?us-ascii?Q?ajYkvfPwZrD1p35S8kZo3m+YfJaP8ZDsa/RoAUSwCIw+OT8wweNaElMluwTF?=
 =?us-ascii?Q?WfzUGNYxQFN10jeJl4zKfbDfabux/HeqKH0kS/DW40NlyrDhtEYRIIv3ZrRq?=
 =?us-ascii?Q?kIYkU315fpG0/mt9tczycpINiIUmRgYDLDxMJs4S?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GyEkI/lKDqn/U+0T0xfMJJC/vx+r/C8PC/fTXQL5w3YUPWbMesZecqJiUZcnRtusMon0cKTcf+/9yZCYakNQyC6AJVorTWVwzWbkVgnPDmcQGBDSXsr6u7n9ztwRi8TifO/8IlKo+ZMj+AruagbE1HKJfN8WkZQmJdj2tGk7Wjj7x8E34Vi+VfSCJQrdG4+iBZMQLW+sMliNk07AX6FQcNalvL+OslXqOb8sb4nxhhsF/fTqDxw840C0hfC6+ZWyYpOOnd13P+AzzE8U2TRffj46u/1eKmtqUzF6BjqmHnIfooUudhLiA9w0NlI77pWqGIZeVLRi3P+hgNv14KPUiOxKB5U7Wdd2ERGtWKF1suW7Y732kQALjrpkOJumxSp6AruB1hyMV8568A1zL0XmLTpAdHNmk/LwgVPOUrZuvtCz60USuQYlWqZgpAGM2WSTYqNHhmCcU874wIiUY4ZmJzga/SeAIaQ6WZfw3w1kP0CFkxVfxZeLDBN0qW4Oysir6vcKyRIlxfb44pdLVI6vinvn/TfmOOfgd+niREVgzqlOiWkM+llhP6uCMSmV1UmSjsCQ7v0/5Rl0KdEO0Dn6XcEKLDjBRQ76lxzCGLiRjLAUwn+4274QO9ih4M7ulnBY
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d570df-e5ac-44d6-3e02-08de27434eb1
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:11:57.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8+aL7cocsJXFdIyE0wk04cDjV+bTBLbIVX7ZAva8EvcpTocTwP/BjMyeQNmsolNV46S2M1B9sBtITNLVBDSMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0733
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
X-OrganizationHeadersPreserved: VE1P192MB0733.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: gjhyKEso3EmtXcK2NHPA7SjCokErJx_K
X-Authority-Analysis: v=2.4 cv=Ob+VzxTY c=1 sm=1 tr=0 ts=691d7bfd cx=c_pps
 a=ShKzWFsXyDPIy0A3hsY0VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=-4NpBTqsPT4WlmLNm9kA:9 a=CjuIK1q_8ugA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: gjhyKEso3EmtXcK2NHPA7SjCokErJx_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MyBTYWx0ZWRfX4LDWrHEBbQSd
 pO8Kf5BvIACJ2qvgEgSyS9q59TLDj4VJLk2lW4zXkiCC6wFv2wo04e26rasFx7ePf/kdf2z9nIJ
 4gdO8CIEjuPWR5sZ90dFtihqdsAqpgbZ51/3cjc6CB1SlotJmrjvlxuLzQhMZHMKnE7KOnSTmEk
 eOq/RK4+7uVUziObJa31h2Q60dN9hoqFJWq6R7fmwgdq0XKlMzStvn7+xBAPJ2xEUk/L/O7tGLr
 9AloswB8cwlehIU2N+OdffM1n08MIaMKnT1vwG1zrgIkgtJIFbrdEcWL01suKw54min4lR8NNb7
 0OnLrLQaXcEeywTTjIbdkXxd9qGANFmH9x6r/K6A/73OOpgTMseZoImjfL4Z5JKHFhq8XvDyXoH
 MmH7x0Exih0bhGJeXry6eOpcks2YHw==

On Wed, Nov 19, 2025 at 10:04:27AM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 07:53:39AM +0100, Alexander Wilhelm wrote:
> > Introduce new QMI encode/decode macros for each basic element type. It
> > allows us to further distribute and handle endianness conversion of basic
> > element types of different size.
> > 
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > ---
> >  drivers/soc/qcom/qmi_encdec.c | 56 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> 
> Nit: I think it might be idiomatic to fold this into the next patch.
> Nevertheless:

Sure, I'll do it.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 
> -- 
> With best wishes
> Dmitry


Best regards
Alexander Wilhelm

