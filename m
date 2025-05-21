Return-Path: <linux-arm-msm+bounces-58824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573CABE96D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 03:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6F64E2B28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 01:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3883C221728;
	Wed, 21 May 2025 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gsV6fu62";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KQP9DTke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF8221701;
	Wed, 21 May 2025 01:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747792765; cv=fail; b=dgbMEdsNW1xocCjnlzSNsR2iovn3vsPTeQ+Pa3Yb0vY/2l3x+RQp1uTyYBvP8lLDjUM2sjjHCdW+FzNkxpzd/5Ryz2RMeQMoSQhzQSXOdNkbIqatVLqCJUqEvvnxDH4rFk9y5n8Yi+03hhakKDZ4aEvvM74KHv2npKWXqkSLuzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747792765; c=relaxed/simple;
	bh=2oa0jJKFdZV1NUQSOpSR/QYICid4hAHbjYcHAec/Xes=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=nIISkl8n7G1cuLH+6GQCP1RIcmSV945ygzqVVmXwzyBxa9rjgy5vMmZGoe8keJ4fmux/rAUFvOdO1a8beMq2zKpqt47/RuV8A2OAcx8pkCMC0YTXA7HWtEciVwLcE/dF0rkIIWxaDJmcjcBo2NVJ9NTfo0cvTKPiFhTpNRPcoFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gsV6fu62; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KQP9DTke; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L1wBEq025272;
	Wed, 21 May 2025 01:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=T+mb+OymH/gcdP9Tm1
	l1ff4zmBOvBroeTLQ3aoYzYIk=; b=gsV6fu62Hxjc+Ba2JL4g+egLkrCepreCOp
	ZSpmDTND5iUbkgHS8OMo8EkZ+K4KXur2UbELPWhciPtP7fZvS340mi0c19ajrdVB
	qpVs8ZY5EZPn1M34Msqllgnvz0Lf7lkKob7vfA99DcQHxFNatw4tZvTdmD+qIypw
	y7gdBHwZVS6C2JQGfCHfMedAZyhC44FVWdIf6GfZNG/MHwETpFM0PIS0GQyCcEtN
	6DEekN8iJxyUx3b/NJ4X0YEQsQLFTkW2aH0PXi/AfBB3D0x7d3lSbsZ3z2pTNfaG
	GpcTiGUTQx+pkiokcEPeoJ+cZ8hg1YBye+JCEDFNIy+1eQrd4oVQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46s5mag037-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 01:58:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54L12Fuv015387;
	Wed, 21 May 2025 01:58:57 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwep8k1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 01:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRZm3HdIMghokpc3ksK5OlQFdU2vIlihiy9DC2xde1JADY58gUfnL0mp5gxSYom0NKKZtTqrGQpx6jKZngtGysidt++5yufALvAPqUYf9k5SyHeG3H/7rDfsJfYWuJR3YPsU+RHOWG0hma2R3nyGVnGJz32whJa08L2BqZB1Q8HBYKKKkUUNrnoQuNBkufx4NM0cJjEc6AJLNSWyfeePwoVGU4t+P4YeIUCV7ypA4kUV7so+AnFd30vmRGUA3Ae69Y/edbyJT+1Qr5bLsbxqGbb15QwAOv4nvRGYthaPmI4QgjIYBsY2iMG7445qnce2ZatjB7xngExElDLG2Uwl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+mb+OymH/gcdP9Tm1l1ff4zmBOvBroeTLQ3aoYzYIk=;
 b=XjNSKyeyD5WG4M1xzzm3ZKQ9U803G2/gGw/+/Mclh+v5eMHzNYBm8kYj5rBUdJ0510ZODqkI8R44CfQp6eyDddFP85SNMAdzUgJAMLt3NJ7ymwzPux1nNirFrh2HYKW74rRGPOkz0zalpMCjmhelj5uPAAk7Z8R9/7RZeLQ2GPuqSwFYX9LyCjxzW+Bzjx6fWdzYdEn6jIAkMe94RK3Fp0ncZvHhU+ttsVhmh/40NTshC3vgyQj6kKoDw998QczBHLjzkwra4q1UurVzo9unrJgS91Ys+2eGZ4HZYiJ7FPCvZzGsNYK89As/vkq2HXjeFzsICnyTk+fXg7SPM/ncrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+mb+OymH/gcdP9Tm1l1ff4zmBOvBroeTLQ3aoYzYIk=;
 b=KQP9DTkeamIo6B/D7hApYoJnMd41gO4S3wZ6oV3Yczj2PoGdtB78GhOtKl9dZWCZsVKbxsU1HsckBNtipUQuKzrydtSLFsNS2KROGwAj7NWUd4Jjk7D05DkA52RTgwcUFr1xTWywBpnwVwDsH0ubO/mWkjJK0YeNpF8hatK/PpM=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SJ5PPF2BE4E177D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::798) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 01:58:14 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 01:58:13 +0000
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
        neil.armstrong@linaro.org, luca.weiss@fairphone.com,
        konrad.dybcio@oss.qualcomm.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Bug fixes for UFS multi-frequency scaling on
 Qcom platform
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250509075029.3776419-1-quic_ziqichen@quicinc.com> (Ziqi Chen's
	message of "Fri, 9 May 2025 15:50:26 +0800")
Organization: Oracle Corporation
Message-ID: <yq1h61elobo.fsf@ca-mkp.ca.oracle.com>
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
Date: Tue, 20 May 2025 21:58:09 -0400
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0173.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::16) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SJ5PPF2BE4E177D:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c12139c-9ece-4dea-6554-08dd980af21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5O/eYgRijpO/MeEmn0wN4PY7BqewgRpHCUZ1UZC2xBDqsi5QI7FODsjC6lWO?=
 =?us-ascii?Q?22v4znk7cpDpAqn/MJspwU2VNCiPWz5xGROad2ZFX85tDQlIKwibmyTzBlbD?=
 =?us-ascii?Q?IIm8ffO35kci2CaJTwqS5Q9WovMr4OtRtXfLdyQ32x/1EZmiec4h0gLx7IgM?=
 =?us-ascii?Q?kk+wNBJNuHjtxoZHOy/F5Kw9cNv0GIwDZo9UJSPW4XFEo0MNc43W3Db0S/GR?=
 =?us-ascii?Q?8YYzrbB732wCc2Q/pKfKh0PApK9NJKA0L5oATmfQDcJwV9XeNSVa3r5zeDFh?=
 =?us-ascii?Q?EEM4Gp5QqDpn7EgA52k74k7gr+dfqdV9G/bWHyfpVFn9tGyVRNR0bgGoChc6?=
 =?us-ascii?Q?ilOHBIyGWofn9ZmG4I04HmP1HUQ9ajvKA2HEjd3W3WqBsnJAM2iZ7n6uNvHO?=
 =?us-ascii?Q?qpv0KrFd/nea6ZXJ25ZcbZICIycxt0UitUcZ3QGAOUrAOIjtgjoLFavR8glI?=
 =?us-ascii?Q?hmqa4VZmOyK/1+vEyxThC9+16gGLn+FwneFa9VBLkcZvu0pg33PeJ56pAuds?=
 =?us-ascii?Q?lwu6QlUQ2XtDIgucKnMSmUczBTehJlq+ZThyEFcauSL+sV8aJTzExvFbcj6E?=
 =?us-ascii?Q?asST/Itkrr7fYVrYVc/OEOx6mQetkgVT9KlA8cX0z2mzSR0839JUxQgpIhIs?=
 =?us-ascii?Q?PoHHvgysbLaRhJdVeJ5BeG8tEbnuQfJejHPDylRvzBwqHuHhYDRH3OOgYIqo?=
 =?us-ascii?Q?9IzIOMtM7+qfMeHBSw3crzOei4LVhU1WbCjOj4/UNvoBSYvu962M43N9T8cU?=
 =?us-ascii?Q?KJsGh+reJYLlxXGYJZpXt2HCw3OJRBlRbKHZyLyR3OBcCM3WICKstrHN+2GY?=
 =?us-ascii?Q?vuWsNEk0TnJn4GF0s0pYMxc5mP7gqxzuABarzfqmIQviSYtQFnrDP1bJ8g82?=
 =?us-ascii?Q?7+w3IWKBT6yoHpvuDQzvnlU97RfD+Lg4g4ZuJsq4NW506444OhSS8ddrdgxV?=
 =?us-ascii?Q?jnOYUDQtwQC1Uuz63U2GgqeDrpB840mpj7IIJaPbOLu5VU3SbjIFTeerzuR2?=
 =?us-ascii?Q?3RUkWWHADqqVTJYaCrfijlsZVv2J9PGHg7nI0l+QnQiv5M3dYfWuWs9BHRQl?=
 =?us-ascii?Q?/wdNKmdRZ+8d2qLte2UhindW33G+288fiBnrufxVvhqgH4GziZUsYCvh/Ez8?=
 =?us-ascii?Q?goFgHdSwnzrIEn/Sg0ANWj8dv3TKP6qCaUs0yPtzacxUHvb+ofuF+p/YYV2F?=
 =?us-ascii?Q?d9MXvzGOtNAn8vkaoe+BsOBZ6Rg4smp8uda9XMEW2UM+++P/V22it0O8G2VA?=
 =?us-ascii?Q?4S8wB7Cy/EDkUjxbO30exQIOT8w88v5pbG8cpaJfdgVxPJLLR/x09Tclb1Lx?=
 =?us-ascii?Q?igAuqiYDgv9i9iAlDoRxSj1E1xrbF53RalrfmcoYckryDuxo4xHAPjfiLIUH?=
 =?us-ascii?Q?zCVle7TQT4/z10wJqbmqaFrJVSiRZB7jXwDWFM+6w2xXdHPxrZySSLv/thMv?=
 =?us-ascii?Q?IX5JyZxPrA0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KHR2+W4qExxQOclWK6b68YkSas7eZMgzDee11KskE786s6wmFSEvF1ySU+1H?=
 =?us-ascii?Q?NHKCR5LZTdVg7uXujDlUI6dqkxRCfjAu5uaXxUe8h27bZ94+ItST+iUtsZuH?=
 =?us-ascii?Q?+CG/m5r9qWQB3zIq78/c8Fcs2s9gFo0hRbxitPtCmbDVLFXgT9wQT4+9N142?=
 =?us-ascii?Q?xIBqT+/0bmKRdg1llNeyjy7nPJor4NFazUQi12nCk+44R+uVEP5wAI4BV4Af?=
 =?us-ascii?Q?zI81/O+SmynTgti6ZsQ+SZhSqNy7u+AWBY80gQ34apLGHdmR0eiJM3oXDDBJ?=
 =?us-ascii?Q?XSUz6IrH/WclROZsMWK/SE57pPyGRbcK38DJd3CftXIjQ4kUf/AMuNSCQyz0?=
 =?us-ascii?Q?7gIykHqcisMDF3u0t7L2WklNFxrY1HdQcuVWTYvHkfjABYXoSB190Zv30IF1?=
 =?us-ascii?Q?L6SFoFuSopCsPIt0LxLl3ITqt5kkb24MMTF77nlpiUkVxF0qQy68Aj5EHvy2?=
 =?us-ascii?Q?HzmMwgvEInj6VxRoQ2XXtKixCscTw5+PZKukBVdEZH0RBpBLAYW3v2DEswyJ?=
 =?us-ascii?Q?QpsWjFu7yfdf0YwaQw+wekmZ3YMUay1NbqhIgn/Jos3a0D6CrbXrhtSuA8tu?=
 =?us-ascii?Q?ofHrBmZXhzkiCIf3y3etbuaQ0tKfWOxrNLg0STTYO+juzAEuafVKYdb5hOP+?=
 =?us-ascii?Q?9buHynuNQc9n+WS18A7Y25kCbXndsAIOq9EiIUpMAxVAYXQmjsm92/ZWZKdw?=
 =?us-ascii?Q?9id6uwGTXNwNajWa3MdXdWrNtsOHUbDm5YGpLaC9s2kteLltvuAdgzjPVOKr?=
 =?us-ascii?Q?+kSzejM77TMaTDrXuW/ENjzd1ZELId2WJnkPp44BKiy1TxH2ViZ9uARQCLx3?=
 =?us-ascii?Q?rniwDNY9ER9bKOZ2sw5l4QEA6ZKW7LybhwRbu1lmdwziYGzi74VkrBRXWU/n?=
 =?us-ascii?Q?kuL30deIz3TM98+Ux80w9HgMMMGH9MkhgiSSiigfvDeZfrC4ARVBkhcv1xq7?=
 =?us-ascii?Q?IdtS1fpLEiy2bkgjAq/KMuxmxgYCVRGVXP72Xn53HoZh3xUHMHEiqq76WEjO?=
 =?us-ascii?Q?PmPOzfdifDj92heqZwjY7znOHRUWXylAe9qLBaBv1nu5hqrkSlTLvNn63KXV?=
 =?us-ascii?Q?8YB3SxRPzsR6jJoDCPgj71GtNbHRW8Bz4bgngb9Z/+d34ESMjk7/UYwbuuAm?=
 =?us-ascii?Q?NQJEjcLe5bJyMYvqWFr5hRjeWDvlEsMCDy4p58J5Jj6phQepWQki8wDCx85w?=
 =?us-ascii?Q?/CSgYNBUaCort8509LXQP5Plrgj6CcLjGveZOc0Q55tOfExgnEThNlguhjHG?=
 =?us-ascii?Q?TAtoKLxY37BWgoIKyo/sQrKGHDTC50lBGXVTm11xenN4OgmH9UJpZpOQ1tB9?=
 =?us-ascii?Q?0k3qQkJb+KxsvQIYhpa+N7nI/vX/puUMMwzmDylDotcH05PfRuoBFm0yen71?=
 =?us-ascii?Q?Cw4PirLwPFWJU+kzxsMSUUtj1oL6KIcxyjyrFqk3pfcYMyV7CG6AVy7pPFK6?=
 =?us-ascii?Q?Enhne4q4RijtifDcT7VzfbJvRuy0l7f/QOPtLQHPr+8PbWwPNIZQ6u1OgLUu?=
 =?us-ascii?Q?PLpjk05Wl78LhaTPgUddXDQeAzkQKrHbhm26W6DoWk1HkLiiV9YXN+OQWDHV?=
 =?us-ascii?Q?0yNQONcbC7uzdJ+S7XnCymfvp0HcSgnSVwND9WP9gDkKpKW5jS9aG9K8jnwC?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wBiZVPyI7M9MXq9xDHAa/N7ug5arLDdn9KTleajQ0d5zQ75s6/nOS60tdjbE1hLd64QDCkKj/jzKzfl88oU5LPhYHEHtaXL8ki9QAzXlqCSb7DzYHuM183Cen/PSamhQBt7WGzDm08f8cjHioNaOTr/T19fnKBDy9CtIIRtRE/SfzLfThxQ5OIJAXyjTb3KPG0VsZIxhWkMqLw3FSudgnQaadhD5HrBLv+virBy+3Ix3HU0LY4gj+wJGnJrGe4n9Tp24EG8OH0xYp1QLtxzbf9inFKIHx1U51Lz3Zzvy0+Dr/9q+DOZSy0Ym4dAZ1CpM4IIxtNH6bWBraHg8XsktpjsOR7G4Yev9wUMtHONuTLe+Qp0E4TBgnrxM/k4aPIhnwdpMHP/IKlCWKzQbskWV7iQrFgUwhswetLEBxHbswLKn8owC5NTSS+Vme58sD9ldzBjGN/ZISNdBB/1ve70WN5dJfhJt8YpTARC2vgFMtkHb21xlFeybqOtkgDd+we9FhAHuX7YsdKuNhlUysf0HlwuGWlEdZYNvsIFNvtj2PQoEII5QbVhUkREWii0XFBK4dURQrKpAsPzkFGJHv+9TP/BvFdmOeBQv0RxcNAJ3SuM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c12139c-9ece-4dea-6554-08dd980af21f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 01:58:13.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0OKzff74wKDvVZ/34HHQDLtd9ioSn8PKCAleFYMWfM1VxUhOe0eIfDnItklrhAN4IY0Nei/PQIXvOXsEb+/xzxbUuQNVrLJOvX+UVyfbRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2BE4E177D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505210018
X-Authority-Analysis: v=2.4 cv=aZVhnQot c=1 sm=1 tr=0 ts=682d3363 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=KKAkSRfTAAAA:8 a=jmnmrElEysjGxP5Sp3oA:9 a=Soq9LBFxuPC4vsCAQt-j:22 a=cvBusfyB2V15izCimMoJ:22 cc=ntf awl=host:13188
X-Proofpoint-ORIG-GUID: KK9iq42EX2IPZYT2uo9JTgfVNdHIh_sR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxOCBTYWx0ZWRfX5bWcVvyBwhrR ZC9cqj4V+Ypl9aj1UoiTuTfXulxzBcRTQhuqDY6slD4PE/ziFPCgv1xfj6ZX8K+SK93EnfC0x5r I7FlmvrwkGMSaYhNlPRcfbNkGqt2qAtnX7C0qZD3h2RSkzKOwA6sK3XvwD9uBrhwl2YuY5k05Ds
 KRno/MtVh/MmvpuGQVIUw4H3Lz4ckkcTnhfrheRArjgn163QnrGOy5LScHL7g8Sf1FUyiLDOXUb f+BMFUD3ugsZO83Trm+SgoA+3NnFSKGd4IxjeuLDHNMZLFw47LPl35ustAdyNLJ7sDGO/u+opMT ixQ5ESegfxVC7agtqjjMj6OC/uMwp5gYnL6Ezgi8HovI4mMxT70chWCY7VedsHwVNjwhD6nq2yX
 LoqNefJjKM4/XPtTwEl8bHcGgdYLCuIH7E7EG2BtaW+C6QdkNCBVVRGxdxXQIb5LeEjGYgPZ
X-Proofpoint-GUID: KK9iq42EX2IPZYT2uo9JTgfVNdHIh_sR


Ziqi,

> This series fixes a few corner cases introduced by multi-frequency
> scaling feature on some old Qcom platforms design.

Which kernel is this series against? It does not apply to
6.16/scsi-queue.

> For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()"
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2

These tags should be applied to the relevant patch.

> For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
>            "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path"
>
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com/
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4

Same here.

Thanks!

-- 
Martin K. Petersen

