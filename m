Return-Path: <linux-arm-msm+bounces-101601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEUICdQUz2nXsgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 03:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77438FE7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 03:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22C1D300981F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 01:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EDC27FD74;
	Fri,  3 Apr 2026 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d7P/Lan7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZJjf4Eg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8579427FD4B;
	Fri,  3 Apr 2026 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775178946; cv=fail; b=m+a2HFiwLDvlaE/hzYChQGmFNtn29E9ZACu+ZiICflFsL7TM7G08A3ymXib/vtFV1YXK3xiuUj9kkQzhDmAa+AjYTzRu0W+w4IWN+IH36M3O8r7l7UDGvkp0FVUMIYwW07HE8QLMFvfoQuYa8TyyHtWkgc9be+pki7BtmQORFcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775178946; c=relaxed/simple;
	bh=VUYz6y3dHcendGfpRSrqhpgrzr3uvVooqv82hjKGxQw=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=CFMeQWY+GIQWgzCJFnvblrS6SFWQLRUVRytjgntSnoGMfRs1maU4tzMiJsV4LSG+QrFUKuHNhziOH1aLPAqn59U6LA4xWqW/lxpuq07uN9fWaNbxcgklnOIumGi4U3zt7dzpcptKfbD/LAinqVBxZdPU+ZTZc3emPSopL4I5gDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d7P/Lan7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZJjf4Eg8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632FBpcr2517675;
	Fri, 3 Apr 2026 01:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=eZ7IxgY7v6Yn5afnr8
	wR2KYyW0pXF+NWmF1fbPJr0to=; b=d7P/Lan7ghyCnaaT5ZhUJRJTj9Hw/HKRN8
	18ohpChXs+I3oF8jAV1LMAsFw/8ZulPv6vRxn1dDbHpXPRCRW3okDvBpmnjK7FL3
	IlQIyiUedMqSQkcLeyxz6uuir78Vv2NnCqVkSs+3+s/e+5PIIoA0ZfZtGVWN5Czy
	ia8I4lcc4nuQ9uttNS7XR6woaaH8X0xXK+JvOrrh2LuH6Uk0BAuDje6Akox6puih
	CTKQ3W/8FLsVTfGLE249dhxiD7pm17+S4rRbVlN/ScYXPk1/RocMLPTfI3D19+by
	BLKnWMWbjLtav9CBh/POJoI+r1e8VxN1+fXxndm3977lcvPHsLqw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66kr1dpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Apr 2026 01:15:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6330M9l7021254;
	Fri, 3 Apr 2026 01:15:38 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65edmw3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Apr 2026 01:15:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMeJrbjzzxbsc/VMxazqqk3aKqaarfnSTEca+4dBbKm4+NIIva4Rbg+d9KScJF6wSUH1JaqEsu+umYJ2zbUVfpubYFjxC/wxfH1iXJ+x/Fi6YWNBD/BpyNmJxntMmPt/z6j5sANlw6rG0t1p79IvU+TkZlaoqprRKyDmc3RYbkQJFWyr8wPFD+YUFz0Oi2cePPZfsDklg6zzkx1jbgxXKYPjkkHLgAOOUEdcrohttUAM4mib+K+a+Tx56cFhEAxmNvuyElwPWtiHUR+eG5ftZfgPEsMGpQ4vLvOfQWNjlWWnkKAZGYwpPgn97BN7tKyfk4kzrpdI6Vw7DJdcspaPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZ7IxgY7v6Yn5afnr8wR2KYyW0pXF+NWmF1fbPJr0to=;
 b=FtcIXgpIzEQs8aCjWPNjornUzcZwZgbw9RlLFjOEDpls0wat0lwiAoYUsRBH/pwDOlupn1r23xgkLlF4SfytFubj6Y9bzBmGVBvCgYhuqOB1lhO806h9M1EJYWWupR7Bf4rdGrI93LKkO/1daerjENsPBkr0UM6VKPFc+lGV/ryALnlb9o+UdpxoSSubYXpXM3Q4oG6wPzaTlKg8XHZBeZKGaNnxkK2E2oetFx8uTWJIazShe8oyS6m21M8ZrI7NuH0aTyNLyqUxpD6pDwOorAU1KoTo0YM1lBMuQAyQ931jXvtyDPEjLQmRE9zBhOBv5Uej6EazidphAhYvHdyrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZ7IxgY7v6Yn5afnr8wR2KYyW0pXF+NWmF1fbPJr0to=;
 b=ZJjf4Eg8uOCjQ+rKWSQMENJ/2/C5K6vMJeQw0QQzaIbcKEONrQ6ZrF4ucYd1jOSvAvtLpqdyBxoWyT74NvkTcdRmbFslbuCFzIl0YKWrFQOaJlxY+sCeRKb1WzP0KVA75mAe6yWa+EioNCwXRTxUB9gaft8ABXk+9MQs0oUUaAw=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH2PR10MB4213.namprd10.prod.outlook.com (2603:10b6:610:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 01:15:34 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 01:15:33 +0000
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E . J . Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "Martin K . Petersen"
 <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scsi: ufs: ufs-qcom: Fix spelling mistake
 "retore" -> "restore"
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260331153049.1344957-1-colin.i.king@gmail.com> (Colin Ian
	King's message of "Tue, 31 Mar 2026 16:30:49 +0100")
Organization: Oracle Corporation
Message-ID: <yq18qb44zf5.fsf@ca-mkp.ca.oracle.com>
References: <20260331153049.1344957-1-colin.i.king@gmail.com>
Date: Thu, 02 Apr 2026 21:15:32 -0400
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::10) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH2PR10MB4213:EE_
X-MS-Office365-Filtering-Correlation-Id: 97451b0f-c2e3-465e-1615-08de911e814c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cEJ7lYu1a1pmHU4iJ0eWq8rR+aEKz0lMCL0z2vZLi9wEv7h2QiDJ3yc02Q0L5NbpQTowBGyfaGEUVev6KC8i6cWaN4LESrB5KW53kcsHlshzh0PzGNVViSP8TIpafz9g9vvr2m+npf7NZhLT8kaMLkTZqLGYMI6GAnmU4IV02KJW+LNHqA38eHz6lE9+ZLZQknvaLr13ItjeTbSfaD78P7gkPnFx7ljNAlwR9cOhUHb1hB6tC8TeUWbj51AaXsbGP2AdCWtlXpz+CmXXs2leFZ07WCbagv4wKTMdjRpDn+guALJ5tRFgV78Ai6dPf580de9HVTRh1UUcFZeU8SHSbEjsMYs4PsZ0Oe9+hXXcWBCCCEPdet46WwHfGNBA3o+biHOtSQNe8m26frClMSWHiWGoPQCjNG4z5/Sxicutf+TKiOJigUxe0c4qxijBS0vzoik2BN1sM2lSiuY3lAFv756HJSWYmmeslcetM80omnRASFaAC71an4/WLCbGLmP2gxM3T5/VBH4lCzt7Cvr1pgfd1H1et1ZzdMJfDIX2PQ5OVe7nRoObKwKroYDEiu7WVe8tILFNV0gxDW6hWAvS4E2RXbHIcmp6+/NEVa10d7Yod/qcxyRAudc+FszRvbUvFYyL98DZiLx7e5a3gCSNm2bVy4DxoZBVaR67q3yKBrS0tWve2efxv0HxfuhfsPBiRyitRhISgF/zdm4GfSKEkUZ+pQb32gfhe9I5H3GBgEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xkf4RHzgjmsSdn2lziLuOvYe6RBnr6hyE5WNyp6oJ2Ijraa2GcLrIqEudJeZ?=
 =?us-ascii?Q?amnecifpbKaiDJDn3sVfqYYwD7ZvIyHy/aedDDnRb47C4qTqiyyjFeeqLjF1?=
 =?us-ascii?Q?5/rW523Unj8aVtQoYW3iPuqgLyd6Lxb3iMMsV1AKdwSKB6z00I2ctXFNrqXB?=
 =?us-ascii?Q?1/elCDE4Ol8+psEEFWEMEeC8bsYFGJKWhWTBdi3rspxmqpnwagHjDeYUZKE1?=
 =?us-ascii?Q?vE0FIuKpKVtsfhCkOKAPMwxTLjziIMCPRqRt5T9qsMmNSftvtHFtPXfSTd8X?=
 =?us-ascii?Q?QvoEITxcJMXmVSbxCWqmIFs1oNaTZGrXAgo1DzNViLxND3W9XR0dmDvzSFSK?=
 =?us-ascii?Q?Ptj1HF7h0IFHOUHqHf96sh6znY1jIW3941HqueKY886TVdWyg1YDrk7rtEjt?=
 =?us-ascii?Q?gW8zCoXcWLiLBcmRROGGWRgnIhZTni0jSiH9ylTlpmfXYyYdwSgRo94v++1T?=
 =?us-ascii?Q?gUyYMSRm3tUamFkao9Nvbqvf20ijhnh4KJLEbpwNxz4BGySHhYjmkDDAiItq?=
 =?us-ascii?Q?e08nsb3xoFD0TgxfruVRcSwqHLSR6PPUzkONPZw6RaJPY/bH2TG/h8ehLgY5?=
 =?us-ascii?Q?t6Pjsu8LiPeUltjkVt2vlPuxjMtkRh9c0zx95ti2wr1si5FvI6w9RbPEzmgU?=
 =?us-ascii?Q?3bh+9MIMKeg0/CoE+nh/Qw1x01GqhN6dliNmKio/FKJTi2hLvMhFzuZo3Jf0?=
 =?us-ascii?Q?l+Qc5ViAWmC0Xp5A3N2fktXez0V6/oybGzlaMtxq83bouW55ZedcrVzYKv6q?=
 =?us-ascii?Q?lMCDiYiwaYLeFnw1iypcQzqfJohfPXV00s1Wt0z4tm4lBvPNfBDA2jISC4Ed?=
 =?us-ascii?Q?NAmpqca/8RxGunvfc/nrhvowXFlEyVfXDdsq8R6ft5B8XiUB/bIkLRkmLxn0?=
 =?us-ascii?Q?+kPf3Vie/EEtD6YjIquEzFENLJfSww+eUKo89iptQKpsi1T224+2SnoBvd/o?=
 =?us-ascii?Q?WEjYc35hazu0dvNUIk1r7hApAV9HVSsUDce/qJvDBuQ/PZLyKX970ZvaNde4?=
 =?us-ascii?Q?RLES1Vqtc0v3fpcue4Jaiah64KswUcAYjje2N/yiGLWiqfIos0Rj7RGz8NAl?=
 =?us-ascii?Q?/sMGHHYv4ySEW3sviDKoTwpBTosD/ONjUKcIeEOkQG0aJqGuJmdKaMGi5r7w?=
 =?us-ascii?Q?lfA0pjEj9s7btph2IdRr2wv7BHvZhzQ5+4kLvg/tf8p4vaAvDNqRiSqUbF9l?=
 =?us-ascii?Q?jqQcRgyM6EmTakPmNYrdieDbbAvKsfVF+0D0nwl06TayuD2Ju/qd0htm8uCm?=
 =?us-ascii?Q?OCb3+bPgv5RnT8bqHooevnzRgU+TiXXs64l52nb3Hc8RbXoKN0sB/xK/S7sW?=
 =?us-ascii?Q?aXxrAzUA121AtRTjbMPdJRk3CryfcyieF95a+byPGXmBEdBeqhs5pwYAhTre?=
 =?us-ascii?Q?8eG+dpYGuMbL5qodIgAhRv+IySSksXO9ftWZR4IUP6iBcd2drPfqdU66WEMf?=
 =?us-ascii?Q?qdpO0CbXDgdvNumrvvIGGW9YItJH5QaOpEuh1I/HHITiX6E2G7p211UPSrpm?=
 =?us-ascii?Q?A1jwdqouYnbWr4vKsY8pNzOyPanltBd6rGTqvTrRXpZjGh0OJb3KcKkZ20Gk?=
 =?us-ascii?Q?THM0IRsVn6p2wmnE5VVGvJIz+eqwdiu9EvV1tamtO0GgQEo4m/+1T8ck5nPq?=
 =?us-ascii?Q?oo4ZMwwCwxYl3qG/hdOmzOyGbOvW50/WYmNnqwz3suv26z9wT8X/SVterviL?=
 =?us-ascii?Q?+Jn/a94W+nW+8RSYaaEmWlZj3D9aHmm1/HrHByhvuLo6nMwJdD4h4KR0BxPp?=
 =?us-ascii?Q?hfF78niszlUHUjjluzos85nsaK8qXMA=3D?=
X-Exchange-RoutingPolicyChecked:
	K3XzI8892LzaZ+9o7IVi7d1BA1qQqnU7Iap9+ShyWBAs5ukrFVbBKR6/pr9nzRYMxV7fexRoz0WLSPD9jIikRnEdJOfEPjk/iQ2rWrPOLcfWUviKqfOWR5bDuh1fH0h2TmVDqtQAalBQlVbObGAcvNl53+ID+v7iPBfxW2luUrnkK4jDJKp7xix33yQMzvI//49+a6S7btOZ5hJc2/YDWzyAn6Fmpt1dJKJ+npHhEN+9UTgsqhr3b/qx6TfOUzajg5pOovDgYPr+dbPoQuEDPHnWWTUuYxEYrJviTXcd+0aJ40DNBL9y838Ecwg4OAewp+WZ0fJfcPSejiYqxT02Mg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IZoCb20lTArrYvxBUXkyp3GB/RBsVqrylUkAxDhHH9Fzw7U9j0T6qEl4jtfRhNdeJeUVSghcdDDd0Pcn3BDjc6EsIw3UDNomGauYVSDj+HepwFTUMLAJ04Ak488lsyhGUV4KXzCa/uNXgEG2orQW8yehk6hdV+KxgdchIuErHkjYMu06Z8l1vFqH84T2lpCWgJFYDICKLGsqlYCrT7ELhr+m6Xn+0kyuLZtLG074efNeUDj3R70EsiOmqU5OAiKBXRjf/dibzZ+65FNTogE0RsEac6WYMsU9hQtz79/sQxd4GHvB3Za1lZlbEnmPkMuJ/EfRNQ3ROi5JbpKO+89Pj70YLEjAhWAKEdmCi8oyVrNp4+Qx7V/TXtaJaGQLm6lFSBlJtCBVcmnNRq5r4vkVQeVLJZXQ+4J0HBspJZ9Zer7Rim1XZCG6CMaw5oZYQBiHY5MV2b+tV4rb25i3qtEEFmHrsyR5KJbDl9z3mRDoVb/PABLPYf1g2LqOEn6XatAM3XnU1pmRiqqg6B+EugBmgWL4bSeJhFiMAvjGNpC6ofzzui+eKILsKXE0hZm8PC1uz5QW3bBtvlFbCkvlmroRgV3RlPD/FC0DCxOCjuQOy7A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97451b0f-c2e3-465e-1615-08de911e814c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:15:33.9103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0dsbtjiFtoIpN9EXCLKuqCNg39hnsZgXgzO5AZKPDMP41hU1p7inSnrEyrJeb36Bw/cPyxFNGDfWZzxGD/TAWTfxI8RysiH9DxDkasv/MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=938 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2604030009
X-Authority-Analysis: v=2.4 cv=PqaergM3 c=1 sm=1 tr=0 ts=69cf14bb cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=qXo8lOgtQwNT7n_z66sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwOSBTYWx0ZWRfX0IFVki3hjAjq
 3+aU46psv5JUV0yAux7mUho2C4GYIPhPDp7Yhbl29UfTPd8efR8TgBIBCzp0Jh9iVbYTvXIFPmf
 6MFwTxURbKsPnWqsC2dWChTGEbmXnvai7oRQ1VMUZO/FBdtpKKUaD0HCe7JKBw0k9XtFKdWYgbR
 cCE0ihZyRoees+tHkPFlBPc7cnOOjOgRSH0DyqVdIvrLM+BxtB3jUrTtLgIYtO8EGUuqgPSA2pw
 v6d0Ws7UJ31VnODfP8HbcMjehdnDMUw8rsik3OopSXt3Tdi/Yvi433ObBM0Hl9RE+OM7Xbnui27
 3qLC4EWSu/uKrOxkBCzQs9uP7Ycvf7hHZhB3EDYPk4EhZBcunnUdPLsggjfiRXdYq49CWZKMFA3
 mFc7KC7hChQgMaPbR68PZPbGSg7vSDbf/VoSSIldOsrnDPnYq/1oCXT/gW7Ca+r2Bwgv8ToeeHC
 wpUruGj3e3jZmNnTbQQ==
X-Proofpoint-ORIG-GUID: 5rSVxmfH4QP54xB4liUHLrQ9KlkRhAFc
X-Proofpoint-GUID: 5rSVxmfH4QP54xB4liUHLrQ9KlkRhAFc
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101601-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ca-mkp.ca.oracle.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim,oracle.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1B77438FE7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Colin,

> There is a spelling mistake in a dev_err message. Fix it.

Applied to 7.1/scsi-staging, thanks!

-- 
Martin K. Petersen

