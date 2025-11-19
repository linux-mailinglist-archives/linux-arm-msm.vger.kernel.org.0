Return-Path: <linux-arm-msm+bounces-82478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5AC6E067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 630CA349172
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B9134D4FC;
	Wed, 19 Nov 2025 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="qwrHgVqH";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="bBwAv6Xd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238162E5B3D;
	Wed, 19 Nov 2025 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548886; cv=fail; b=Eq3Y9lqN3YwIVzeFerJw4XEMgsIvQ5CfkE/tHHHSB+krxa+TWT3hLsSNtK/N7QYacFKk1P5Siam3AQyKpEQfkeYijmeTRb7HoAkHpiPZXc3zwlEFRs/+nRpDioyrsWuM9swMsZ0onYhLRWmH8kZiHUMZOhY1CR3/+HTgvmZJyKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548886; c=relaxed/simple;
	bh=Np6iYNAoN3MWlKYDk/BrXkMJemWMxhwaXYLRY7djEvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QXR5FsbOP7hxN6bMz5tUvb4vSdnka03SzUj1s4fG4gkiwY/t5+B03Ts2IxXWwS/YtXxqccFeLLndxSrT3bNI+vEVYzCn6JAj2GoPiqFlwu4k7bHCQy6U9n6TXerLgvbVa+hzAzY4CUY856rrZDTNh8JSkEm/bsvQ3vcpuh4W4jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=qwrHgVqH; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=bBwAv6Xd; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7rjYj023549;
	Wed, 19 Nov 2025 11:41:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	xz7T+IhkAwmjYS2+unTQby4Q0A+w6NI7KaEKJyYYEfc=; b=qwrHgVqHHJL1dV+v
	3Lxv0nGrwSiyiZTdR7ds79JHclAwrTtwdiMniYSy4f7q+Ta1IoJSfWlWnkr3JIk/
	U8Rd+WM3qJcuM1TILfe7A29FGcU3cT0BVXaO8kbTaCk1EYgMv03zvblPv0TBxLdY
	HjZdzKhmQSVsNZG0g00TiRuyQMMcdbmjRV2jblrbDaOTi0gTc48EeHPqX8/8zVAW
	YNZKi2i6Hd3iVm19I8mLxPrfWzzMbds2nRGRJzncUl8X+sKxfxaFHC/AcG8sqAG8
	+h0GJtriPXBSPZ26MpZg6a8XZiT4ZNay41z7dmKSeRLNC8LvkdODACqCDioFtOWl
	kapfuA==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022107.outbound.protection.outlook.com [52.101.66.107])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4agy1kgmt9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:41:05 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu58uireuz2gaXBIeZWlp8HeJABQuHJLGxviygWQjNL9NcpaZ+7nFRmIZFsukKmP02rBfUzUcPeECXNvM8WTDqBYfifd7FG3ShTQW2XxnoYRxO/EnSxLN84riDDqQvL5t2Jku4cl4K2fA++lYGWlznsvuNdERUDxUstFuaVsrTYlM2EQSsHtt1sIuIPuw5xcRm12CCPCKC+Pu8jbJ3VBVntES4NsHnUhdP3fXsm1g5xaxFymApuBi0tBRAHF4mWy4/PWdhiSODfNbrpZrRi2RDi1t/Y40yCfZIl7UNLTDDWfI8+50sQ+VyqoKfh4oOfrXSakm4ee6iJ2P9Ta9iwzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz7T+IhkAwmjYS2+unTQby4Q0A+w6NI7KaEKJyYYEfc=;
 b=kyaNjxvH4cU4Pz7ZftQQWH1MWLnKRkAaw97NwzCRRB66B+HNehLtWdskyur51kHmEkqi+fZp0+JVFkHnGF2hWdAgYod1214t3go4oUn9YJifJfoL1rRCog/8rZb0DtNtAx3LXCQ1EkyV0hlkisxMY4LLyMU0Q2ZpruW2ugizGm6POuJUUbAo9Z0pDChHX+PDP50ayFMGOp1cXtBe7WPl8FON9co7FDQBBE9U1eQjzFLrh9kSjxpUhLYQ4NmFMef/AV7FvaEHybYbOd099HMbNAohbE4X3idA1e8bu4ldYCD2Pwrjz/CkG2O8APlNS6MUcFn+OX4xkoKJMBk/A4NaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xz7T+IhkAwmjYS2+unTQby4Q0A+w6NI7KaEKJyYYEfc=;
 b=bBwAv6XdRlZX7iveq1MppAaVFbKVsPF0JqfKUA1CVYpVA74szOyndiFSxn4oMYxtn08iOpJdAQCgJ0p2FLgCMf1oK3KgWvb/ey05+laBVZWOgD4QyRDsXpoUVJVQGBx2/poOY2JywGAx4FBDIVt+w5Wf0IbHt1sEOd+90pQ2YzU=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by FRZP192MB2437.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 10:40:18 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:40:17 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] soc: qcom: check QMI basic element error codes
Date: Wed, 19 Nov 2025 11:40:05 +0100
Message-ID: <20251119104008.3505152-2-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0081.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::21) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|FRZP192MB2437:EE_
X-MS-Office365-Filtering-Correlation-Id: 379f1641-b740-4a68-3d08-08de2758080e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yLDOSB1IqxqSXNv7IYQoN38TvtW5DBqVTlLDCJOiQQtrupE6GabkivjPF8WO?=
 =?us-ascii?Q?eb2pcDMUJ7NCjS21FvLHqeRlyakqpki1ViklfXvpLwfBetosIdwh/g6kk8nT?=
 =?us-ascii?Q?0mevTsle6C+GkU1RVYnktzKX97U7KYr1y4chfxmMX6JpLS5GQGUKXbkPzd51?=
 =?us-ascii?Q?NkZEHHp+D8vwGAEgkl6CjfuXsKV+1Nal7TxRHUh8ULKCrPWkVwQomeYFDQGg?=
 =?us-ascii?Q?a76VmG9Ci8W7PRgo9wzUdH6xVhpA0lHdhDFMX+KLTz2vci6OxJNx7mEc0Y9L?=
 =?us-ascii?Q?Pdq0GM5TMX1COamlJFoZS+HddF5TZXz7wOJagGRKqURyPU3xLO1pIZ91W45y?=
 =?us-ascii?Q?Gc6uRWx5WblokUxNuVJ2Xs5YQTdhkmnAdiZ5bDP5Aq2t8vNnAksHIpMlybvn?=
 =?us-ascii?Q?u86l6x8f0SEkE6Tzog5RkrixXYbclWNfchD02YWcHOROJ5JEc5MXxGz/giai?=
 =?us-ascii?Q?5oVIbphVHrHwp0BVQR0mas2fbhxGuDdImHPMGfrWmNjZy8wyal3fILWSG0CQ?=
 =?us-ascii?Q?X5F6zByqX8E8miXf4amWQ8E2jMsOePI0go1jKgvdw6tNsCasGX7/TRc4Cbw1?=
 =?us-ascii?Q?u+RbxbGUY/HiW9U44ByYuc2XfIWOVGmwYLlG+lFDY9RPx4dsHd26Awzpqx/B?=
 =?us-ascii?Q?MNl0irnWOocjHKs/7/lllhfAUsChBmNCcgPbxTpNHtdmd3KLQ8Xjv1SIOv7V?=
 =?us-ascii?Q?fxQo0lZh5ipp31WGr/9BD7K0ISkZ6EzRzWWuHQan4xBNtHYsn54ZqGVFRYWv?=
 =?us-ascii?Q?5UmebJ1Hp9j/jrv+5D/ClUY644N/xLphC0bXG/mw875vljfy9hsXDU/7i/6d?=
 =?us-ascii?Q?Zmseb+6EhgcidpJw3uAfFrKEkrr0YIlrdWAxiVHt/4g3iDZ7GJMOuI/7n6uw?=
 =?us-ascii?Q?xiYfPqxMcRZz1K52wx2DsVMm9qdBVFUI9soZb5/DERGPtG2dfZmVTED0GFuT?=
 =?us-ascii?Q?Ga9pKIFiUb1EEJTaYtiicMl8k96fcLjH5giSlxUZLGDusBg7dDMYmnNzBkcJ?=
 =?us-ascii?Q?Cr1gwoMBOEs5H9XMX+qIj0J9SdZqWqYfvzFgs5RQIHO+87mz93x1Drm5Y4Qb?=
 =?us-ascii?Q?TQttzj3suelJaj2uLDi9P8H08jtQF1ljHUV0G5iDql3Icyc1A0Yy0DBL0RDm?=
 =?us-ascii?Q?fWqlG0Fh/bboePjQxfpFyOKXQOFdZG95XkF4q0wzT5HSEMW3N61xBeqCXElL?=
 =?us-ascii?Q?ZYMleB0zkEhV8A7Nzuvxfg1Ty6W7BFIcWLa30IdsuMLzJl+64mBeXn/taJ+C?=
 =?us-ascii?Q?7e6OWOK7DXGv1aWDTmXd5d8cPbSwj2PfW3sA8HRU6K5asuszIz7DXpSGc9wo?=
 =?us-ascii?Q?mxy42T3G24ojj1xXNVaHm+eN2ycfk40aEzhwpRO+4pQ8e7l3xE+MWCpZZq8H?=
 =?us-ascii?Q?AdY77WX15lOSgUnxp7Tzyh7tOFUFntnicg0ZmZBqTNABxxlwcKnilHwPu/9K?=
 =?us-ascii?Q?92CNucL/M6Hxvmil28BOhRf3HdDSGJ+v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JueMZXQaT989uJummN9T4lTfuYgq/kw/jPsxYfIvg1Gc5mINSdEyK9DOOCj7?=
 =?us-ascii?Q?wcTIeH3VCq2FpVDCwHwoqC/rANYaaWEmrX9UY9DU9CgqgRy0CQBAvoz6NTgU?=
 =?us-ascii?Q?6zpI8sUu9GCHKLt2bVLUIjTcXeIJcgO0TG0l5CcGKM1PhfQQKppNKQx1Kd0P?=
 =?us-ascii?Q?UKIrr/YO7KEC8GNtjr9M5aN2vYrfyvxdCOhoYVYt+9CMx3I7IJ8rd5HA7QXG?=
 =?us-ascii?Q?0Cf9klPIWX1s18OeaI1qOGU2HwdnYuOznlFJ4emX3L3H6KkJ0903KQ3Cm5p2?=
 =?us-ascii?Q?Y4wqvibUicU0s27/qiREnjSoPjPlzGcNjCn8WvfXxMlRuRsYGepXyin2goDi?=
 =?us-ascii?Q?7/abMUEWl5mPz+bAdSJGn1LCPS1nbPPUjbXxsE6OtyuR1sixrYj7DdEnj1k7?=
 =?us-ascii?Q?XacCioP4OhKw7TItjEbnwBOV1V+t2vcvd/yMG7DOyuqdG2dIEQYbJi6swQta?=
 =?us-ascii?Q?m9Nva6CSxfvnL257bo2vJODnM5mKG/mNggX0oxMu7XPLC/+qvTjFkkn8kMrY?=
 =?us-ascii?Q?lNtuvjBje0N0MrZFTgeg4aS3M0y9xFxhMK3qeVNhuIKS8oWYe5qM22waifo0?=
 =?us-ascii?Q?gg3rEozrtrBxm+U0j8KjT8u81YZFsARb2ta7qfi9w0khQVjxlkZHh/ZdLB7G?=
 =?us-ascii?Q?T954rkp2sB+RsoYKPmnKh3ijfgePZ22bVGMx6jbAYebqTqjAddGHex+p1v5D?=
 =?us-ascii?Q?tlXX+Mjn6GgiceCpx+tUxfLVrt5nXreJVyYFa6D1WSOBWl0sgxJHJHBW31rk?=
 =?us-ascii?Q?QmJbVLJEq4+9mZAikn1725NiaEkre9fbazPOE36WqReykR+vvuYIwjiJwq8K?=
 =?us-ascii?Q?MKfRHASgxO1HluLCCJMa/aJ/6u3SoY9jKJcX4RL/2bk8F0CIVKVSQyEcXg28?=
 =?us-ascii?Q?y3I5ywiHxtPFcK0Yum0UM8v2bYgMzaPmqGKBTKGn+YHus2SoOXNEAh92oRAv?=
 =?us-ascii?Q?4JqfsOdRhtc2hil8Ipzkz694VwXPwdTkSSJoPVM804YlSFNBWwSbvaXc1vsi?=
 =?us-ascii?Q?W/xf5LbzlWa2PTk8LYmJExZu7F/RhEe3IbSgimXA5GPGyFRlMfXSDpfU+18X?=
 =?us-ascii?Q?+5c3gVSEMvSDw7OMsSBNKnYt5QO75InvFx2/zJOMqM+/aaGp8rhrr0qSWEEQ?=
 =?us-ascii?Q?yrevAvtU+xPjEfLZkHQBSrbRC4j27aw2iXMwrQtLUgW17he5CsJMZOCd29f5?=
 =?us-ascii?Q?foTWLmr0icxQrzOuh7Xg17JyzJyt7tFULYJUnsQ86Al9I1fFA1Ne1vHn2VeZ?=
 =?us-ascii?Q?Wxhg+UBh1TSoBUoHIGNpOA4TC4sAT64luQW6Fc5JTRyz45F5HWfgB+hTVgOg?=
 =?us-ascii?Q?IbirzbnwbwXgMf8iTCpeRBAE8baOA8csjpxa38sKsjlZdNf27OF3L4Pjnnvi?=
 =?us-ascii?Q?JSzkHZi75TftGuzDba+ENWktF0k/grsrOd5vsDcTtJG5dRzymuQgpGvJZ6lG?=
 =?us-ascii?Q?UB63Yi91bMmR6q56kL99uk2sW7fEwvrL0ibI3pUvBCI/+n9He1xyWPYMJUw1?=
 =?us-ascii?Q?xVNpf8mMnyxgYcb8ae4KK1hSy/QsSlzrWBwiUaOYMNzc6fk34r2YhHuEW4Lg?=
 =?us-ascii?Q?g/+zQVKXADw4SoDUZfPfRxyMcpglqF+lhwrz0tpm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JlN3UzzY9bA+h4VUxSWj+dq4Ufaq+knfoEPHzwgjFIuO+2n76NKIrSfX3q5e7jfG8cSG0f3N7ND55Xn8tT347HNYs7NHIHtNqME8J1xaGJzEBoDKGCvMU0/ScXiZ8kPujSXEgOFkhz4qZL9am3t4mLw2ZQ8fJk0bk4Uflv7VKihZkEjffNlrSJy8hi/QA+92rtnLQ9d04D/Te160rO+y40v+PQa+dIQbQ9KJWmcOA2iqW5jPCfPEc076Ze9u8lyycxDJr1wBv5+JFlBnHtX6cujEEA6Ae39btGT5nykIwfZmo7rLl1InGd+KibOdnLT/5ClVUd2f5uhb/JtvGjFVG03HKtbKcJoj6kU+RRo+4B/f8NlQjvcHQVZZq9m+2Fj3QW09N4l2HimNza66SnX9diViQ4OoiqPCkcZogzkBt1ZfPrX3JIGRFXXE08Nciy1u8q4l5VxdCxluaMnskZ2/rqijH145/r2qKGz13wm4ZWuHPwuyD9hovdYYntHGRGHTVbNzlhihbe5AwpoAn7OzwlX/eEYrXEQDYqBV7R++hX2J4u4yRJwXjXPrOKOfHcksgLFPAMJp23vhKWMuV0BEYR6AnFmLkNxGZ4FEwRl0guSqnjNnjomr0KiDIFnei8MK
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379f1641-b740-4a68-3d08-08de2758080e
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:40:17.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGN/LQL1v47TerbTnnIiU+KeWOBBL3Cx6C6oFjuqVcC+sdq4UgzbJGKlafGe+qCQZmHGULwZVG/nqgr7MXI80Q==
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
X-Proofpoint-GUID: DcunRvq_yHwoDsz-9Zf4eXa0oe2xf-b3
X-Authority-Analysis: v=2.4 cv=Ob+VzxTY c=1 sm=1 tr=0 ts=691d9ec1 cx=c_pps
 a=F9hHg8DDxxB1WqAIGSG/Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=Z2VYdKDLklew4aR_wbMA:9
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: DcunRvq_yHwoDsz-9Zf4eXa0oe2xf-b3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NCBTYWx0ZWRfX7wnpgSDObsYA
 iU3pPYXCFFng8Gd7VSy5PqSzbyiIYC/kAanq/rF8hR9YNZl18eEMASWLn/PSyTZ+coHThjoHY+h
 GjE3qV9jd4wnowaKoXH6qxxF5Wepjcg6Zcu4h2ROI4BmcQVyiWPJ6p3WRGAC0xGleh26rCXO7Z+
 dvs5p1cvkQYSxVYBU6bl1kpaMLpb09arLsH+NOztbsRiPWrbPI5Ja9ASjb4FnCk9dxiJvgHPg5h
 EJ3gXXjWFhmUqN3p16eVLO2fUpvddOJmlIFs2jXzL0SWF72iiAB4N1ki/bH6mmkg1WtloO6ilI1
 /AdxqBz0TpbtXDQihD/dX6L6hkvWIfKJSKVVdhp/h+TOsF/eDSwfoJ4q1ATcDg4GftXt1Kl1CSn
 Ja0KU2rbzCHmHSjbkcY9njGj62NMZQ==

Extend handling of QMI basic element types to also capture error codes.
This is required for big-endian platforms where a simple memcpy is not
sufficient and exact data type knowledge is necessary.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 7660a960fb45..1d2d9e515870 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -267,11 +267,15 @@ static int qmi_encode_string_elem(const struct qmi_elem_info *ei_array,
 		}
 		rc = qmi_encode_basic_elem(buf_dst, &string_len,
 					   1, string_len_sz);
+		if (rc < 0)
+			return rc;
 		encoded_bytes += rc;
 	}
 
 	rc = qmi_encode_basic_elem(buf_dst + encoded_bytes, buf_src,
 				   string_len, temp_ei->elem_size);
+	if (rc < 0)
+		return rc;
 	encoded_bytes += rc;
 
 	return encoded_bytes;
@@ -333,6 +337,8 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 		case QMI_OPT_FLAG:
 			rc = qmi_encode_basic_elem(&opt_flag_value, buf_src,
 						   1, sizeof(u8));
+			if (rc < 0)
+				return rc;
 			if (opt_flag_value)
 				temp_ei = temp_ei + 1;
 			else
@@ -354,11 +360,15 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				data_len_value = (u32)val8;
 				rc = qmi_encode_basic_elem(buf_dst, &val8,
 							   1, data_len_sz);
+				if (rc < 0)
+					return rc;
 			} else {
 				val16 = *(u16 *)buf_src;
 				data_len_value = (u32)le16_to_cpu(val16);
 				rc = qmi_encode_basic_elem(buf_dst, &val16,
 							   1, data_len_sz);
+				if (rc < 0)
+					return rc;
 			}
 			UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
 						encoded_bytes, tlv_len,
@@ -386,6 +396,8 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			rc = qmi_encode_basic_elem(buf_dst, buf_src,
 						   data_len_value,
 						   temp_ei->elem_size);
+			if (rc < 0)
+				return rc;
 			UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
 						encoded_bytes, tlv_len,
 						encode_tlv, rc);
@@ -544,10 +556,14 @@ static int qmi_decode_string_elem(const struct qmi_elem_info *ei_array,
 		if (string_len_sz == sizeof(u8)) {
 			rc = qmi_decode_basic_elem(&val8, buf_src,
 						   1, string_len_sz);
+			if (rc < 0)
+				return rc;
 			string_len = (u32)val8;
 		} else {
 			rc = qmi_decode_basic_elem(&val16, buf_src,
 						   1, string_len_sz);
+			if (rc < 0)
+				return rc;
 			string_len = (u32)val16;
 		}
 		decoded_bytes += rc;
@@ -565,6 +581,8 @@ static int qmi_decode_string_elem(const struct qmi_elem_info *ei_array,
 
 	rc = qmi_decode_basic_elem(buf_dst, buf_src + decoded_bytes,
 				   string_len, temp_ei->elem_size);
+	if (rc < 0)
+		return rc;
 	*((char *)buf_dst + string_len) = '\0';
 	decoded_bytes += rc;
 
@@ -667,10 +685,14 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 			if (data_len_sz == sizeof(u8)) {
 				rc = qmi_decode_basic_elem(&val8, buf_src,
 							   1, data_len_sz);
+				if (rc < 0)
+					return rc;
 				data_len_value = (u32)val8;
 			} else {
 				rc = qmi_decode_basic_elem(&val16, buf_src,
 							   1, data_len_sz);
+				if (rc < 0)
+					return rc;
 				data_len_value = (u32)val16;
 			}
 			val32 = cpu_to_le32(data_len_value);
@@ -701,6 +723,8 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 			rc = qmi_decode_basic_elem(buf_dst, buf_src,
 						   data_len_value,
 						   temp_ei->elem_size);
+			if (rc < 0)
+				return rc;
 			UPDATE_DECODE_VARIABLES(buf_src, decoded_bytes, rc);
 			break;
 
-- 
2.43.0


