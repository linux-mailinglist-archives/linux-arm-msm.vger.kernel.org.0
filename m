Return-Path: <linux-arm-msm+bounces-74387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80EB8F16D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AFB57A8A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 06:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E522D9484;
	Mon, 22 Sep 2025 06:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="GAaJ/xxz";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="mRLiWZf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFEE274FDF;
	Mon, 22 Sep 2025 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758521780; cv=fail; b=JZfNV9kNGEftBbpAWCKkgOAWEwFlpGBoXmORAOzANqX9ZgkHQ4BwIpl7m+Ia/YlQk9rkXE1wEP91+TLkuTZTKJtms19EZBXduh0AfMyq6tl9lOqPQCm2hqE3LH9ivciSQtEo1So+Zx3AiH8TzlRtczumF/xNe5gZRuWUOuR77fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758521780; c=relaxed/simple;
	bh=8w9Z4qyWSmm+TJZMVfsraSyZJIHTgZdIWPLPuphnUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFQ9JjsXVW0ftjojouqcilbV3dgdElw4KPRusB9drQbaRL46k/GIohxYeNe4aZoZM7zED1mtc0QCu+YSbRbwexezZEyQcETOVsZlr3QQGjEjIj7udP/w+snyBb4WwkDwxJcMv92s/z1MW0hBC8mRjrWcPxHOiF0LhyZNXw+YU60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=GAaJ/xxz; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=mRLiWZf+; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58M4YYGk773833;
	Mon, 22 Sep 2025 08:15:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	+Mdd/SCA+1yal1KuAVkI+vjfhGeiweS900lzViXlzbI=; b=GAaJ/xxzqx850LOj
	gBkov6HjzJpZDw0nS75JNALbisoDHx16VgXQ/4WndJxHnvb9YT7iLt2V1LiMot1N
	H7168nhOnltmWWzlNpJSZUuS3vEBze9pFBF6YEqW6k7gWwRgoiFnYZkPzngBnhDn
	WiDHvtAuFulrYmXqIBU4i/haqBWfX9Ye0ziNNQzZLW992xLCVrRMRjkfV0sJomE7
	JMzAbnfMpP1/TGOyYiiDzyPl1a+EA4CJdiDXBoCA+s9GV/iu5dbfs0S4qJBI/4su
	bddqpRSuQJepTx7Jnuatk0MYysDOD4ELLCfDgtdO/9WEfdeaqq8k911CywbSy6Pe
	jedRqg==
Received: from eur03-am7-obe.outbound.protection.outlook.com (mail-am7eur03on2129.outbound.protection.outlook.com [40.107.105.129])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 499g8y1mj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 08:15:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOObFf726ojQt7mZ9b2T2tOaikGsxKnnqMnoRe6AAuXAMu5wHv+ohbyRdvlBFJ4UW4a3TVYLdGi+kE0pO8Yur/v8DUIEb6B4JNVUA7qfTHAkAnT3GODy3iAvrzd3R5GTW+z9+xgS/FGOehsxiWb1vlK033yWfm+MuJYHsy0x8BHdLXJXNHZZYN13Uk1HZmvUK1FqsTWhM+y8IaAnlB9xva/OjUwyMxwRCgtRB33r0NWxxzEXd+oshb+yj/Felm6i0PxaWomQR9n4vE9tVd+tiq3GD1WL5oTmeT/bohcOa4bcJbEWP9NwEBMDvo+P4LOQcGaBUY3O9qUT0QHsOFRAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mdd/SCA+1yal1KuAVkI+vjfhGeiweS900lzViXlzbI=;
 b=STGyh5rIbdftEYQckGFSExruZXCTH4R+SnkEDWsXLXN9kfMSiFTRxDSGCKH7zlt4RHVk3stl79Lt7WykkIsVPlzShv/nsW1/vyB8l+5RviQvuzap0DwvXfaXeOTHdxLgJVeXy9SOxI/tnGdJHjHVHL4ykGED0KNPsRX+xqpj4L7Om31M9yeOEmO/y+0aSlR2K3M0Xu7N71jj1cqW0BNiNdSfeinov/OWM7p37h+O+0n/IQKWLTpAnyyd98HAnY3M//VoO4cLJaHpU5UpYZKjSUnAoE0ORDlMkAlekE3HdangMXEAQ2mUTDYu3fhv+FQKUKlqN7N7wzvHd+Vf9h7kxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mdd/SCA+1yal1KuAVkI+vjfhGeiweS900lzViXlzbI=;
 b=mRLiWZf+dqmkLmHWQKG/1+ne3CI4IBjx6VX7IYfrrz/cus6tOi6T2THWVojVCQiWE0T/MDQIs4txLzz8G/aNJ5kJrWkGkGVvGLa6kIpjCcyO/xPwA/oU0Qnk6iVrMWYuDyzYFQd3jN2TR37FIylm878aKvu1202xDr5dTkCUEj8=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by DB9P192MB1827.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 06:15:57 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:15:57 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] soc: qcom: fix QMI encoding/decoding for basic elements
Date: Mon, 22 Sep 2025 08:15:45 +0200
Message-ID: <20250922061549.11407-3-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
References: <20250922061549.11407-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0318.eurprd05.prod.outlook.com
 (2603:10a6:7:93::49) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|DB9P192MB1827:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3ca97c-7e2f-4270-a884-08ddf99f7eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LnMFwwqvwfSJeAU1ds0BiGZLgUjw1myAwncLlF5poVqjE8kdepKjy4sCyY9C?=
 =?us-ascii?Q?ptXpJ0Qc0lnLlFhNbRk/ljKzy+MB7WC7Dr80cYUTDqh+U48b/bsKtcrk3LBq?=
 =?us-ascii?Q?YZkNSK315n1+nfVeTHcCf+5l3Kt0/HXCAVDw5TPypJB4XtoMc5S59EB+vWhI?=
 =?us-ascii?Q?jkFpcZ2ddhpxBMo1zdw3iyZGUwFjH/k/gpOCzESYPtGAq7hPGEUiY9EgdQAG?=
 =?us-ascii?Q?0oE5D1ISBDLLVvkeTaRCjSW00F4gxCyqHNFCd9w+ZCTemjLBpTGiS8JUaJp+?=
 =?us-ascii?Q?Z6oApDa647xo1THHeeSyhDEisRh2iO4CY70HRHv7iGQ0DtcmUK1ku39rA/ve?=
 =?us-ascii?Q?u2fMiNkcZwTozRocP8VOIfaHFgX/6V7pbSjwpoox/HjalDJCpQVsq+FlYCNG?=
 =?us-ascii?Q?2YCUHwMHD/lOTsmcc5XEooOJXBXkniJbOUK4lXDRPIgDYhRvLrjAIoSYYAEW?=
 =?us-ascii?Q?vfNXD8ZSXI2QYG3YufseMF/34vf+SAZmJgz9kYrcAzI+SIA6PqOXQhN19p27?=
 =?us-ascii?Q?LsNxiZVfh6qZ3InuFnDIMMz2JjbLYR/1vwTDIxLs2ctc4UtgJ1pgXfabKyCT?=
 =?us-ascii?Q?SaFIC2SCmiOItY+E3SVWQrqKAIWpN5cv0Fo4tEdzECxkn2ALCdo3ZRPGvC3g?=
 =?us-ascii?Q?H/9+/nYQAoL6vPQXtyVRMq+SmR+SFB6DEH3A7IBombkUiQuqNqBZjNpn8wtF?=
 =?us-ascii?Q?8VwDSj68HaeTBqwwDNO2Hc4KPr8H6WQBHqQxeM6ZV4FnkFGRwog2cv4N+gyf?=
 =?us-ascii?Q?NHFm/ISFve9y21iDi9qeShTm3oQPxmq+wL25YPyWMGK+V1RH4rU4Ip7236Ok?=
 =?us-ascii?Q?KBT3LGJ6NmnWrSnzp/AQXnJu5htUcZeqg0YPBaVpHqxbc4gEg5x2tp15F13I?=
 =?us-ascii?Q?wW2lnAMiyyt+WyvXToXrHJbnwMSn6jpsQ4Ct1+5oP6oDgqeVz+9ohpWyMKng?=
 =?us-ascii?Q?WbS7FwdbM34Cuod28WxfDMCkpicDNe8sKm2mISm9Br50tHU4AI6FIV9ddOWo?=
 =?us-ascii?Q?HtTwQBJ2qkTdYsMwjyUCsu9P97A6QXIklR4z1FvZDOmAfSIdxej4tvhLHzgT?=
 =?us-ascii?Q?4daYWoGzeRScwgalNoI/2kKKwFLDcDs2KXQ6t3R+MMTPwAS9P3bb6OfS4NJ6?=
 =?us-ascii?Q?a/yCbvHCfLhEzNgwrP/6rUSDyYqNNODkQ2ali2JqdczXA39gkXAgGwlQDPCv?=
 =?us-ascii?Q?fmzED0qyZ/oVwd9qoyZ5pwuEpJBvO9fDAZlcFnLv4EtrAxu8FPuSrfBF6UB6?=
 =?us-ascii?Q?AozE/JNqRe7X6XDt5zWWXVl4wgi9/u1zaYG9gTax63TpAz/kud3QlFm4WSuB?=
 =?us-ascii?Q?nbfLFJXIcYk5Ddvdhy1ZurzEJBh2P73PJC5EG2KpZb2aB3nu2/f2Xa+eW6v5?=
 =?us-ascii?Q?TQbXAeLdKZtEHIrxFvqpfY8Cp7gl+3lgebAEVzZc90kmIxF3UmqLa5G1bpwu?=
 =?us-ascii?Q?3zft4JrFUBI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0HZGgiDlumOmUzmkI6/RreRPP6WX2SH7D8f5LaZKn/PbV7QQM7i4dWz5IiJq?=
 =?us-ascii?Q?JuZ3SX5wPtZyI+b/VLUM7DO56+uBav+FK7N40g1zynwEY61uMkUdGFbP0LV0?=
 =?us-ascii?Q?jIimi/DSViRiVlUJQZofySwoEsSjQi9K39HdUXYVci24q11GOqX75GZ5kYQe?=
 =?us-ascii?Q?Gtatk/MgDuKe9jvRXW7rInD4nQhY6ZVwW948D53eS22YED0SNUHRQ4UMfWR/?=
 =?us-ascii?Q?LEVBshE045x+o/hAzlrfOgYhD8hHKZ8OK7ZIl3jwNpgcF0jWsOOBKowYlf8+?=
 =?us-ascii?Q?8dUfXeCFEUrIlJUSOsqjaBEYBv+4znshPmYb3/XWuQtpw7GLJiSGyIHzP4dG?=
 =?us-ascii?Q?CroldX+VdEi/It787T1yiE7D2St422lJd2EFBNImZv+in2pfQ9T1t7W3gZLl?=
 =?us-ascii?Q?wap1+WLL0GzOguec6nP9Y4bzFr8FgtznpSQkTe2/zV928jN2jUm8M/iMDIjY?=
 =?us-ascii?Q?0bG3Y/jhI2+WXWNC0z2WHPdh2NBgXYFaEIX9dbQ76jDXqOm1v3jNh6mY9oVg?=
 =?us-ascii?Q?axrlLZg5NPtnqZ2eSR3bmBak2hADg8x39Ci6D4iZztL/5Q2eSC3eg5SowaS5?=
 =?us-ascii?Q?H4kgnAyRpqTx+c5lbwm3SHr5i4VpImjDdhD0TSiYDLpbRkFQ8QTuwwhMLKuY?=
 =?us-ascii?Q?TG6aLFdrtg4ri0r/QCvoOcsK4csqBSrK9vukOf/iDe/ixjpMpwqFSmm+nkLS?=
 =?us-ascii?Q?eTaQkxo6iVJEnpNZEcVimKrkMch6az+2j8un6bixOqnl/GKt3itkFY43eDAW?=
 =?us-ascii?Q?KM6/14L4SyAgJYbXzkv2f3bRl/VNNrWm7Zn96sBoAjYcl85stkO5C4QoID64?=
 =?us-ascii?Q?1FD7incRvqfcjoK8wmOTaP9am09J557mquTM+LgXFNmd4gAvEXAVR3wpn2mj?=
 =?us-ascii?Q?k5IBu6h3gYyUMLiFbvyD8ZsCjiGdN9qh0hH0y/5VzvH2whVVowaan5GokHNs?=
 =?us-ascii?Q?75PH7X/KLMlvJw56UqQBNjP4Of/HTSZ+VOZFLvK43R3egOM387jEOzjKfpnP?=
 =?us-ascii?Q?FwtdXqFqQ6Ox9BJAXBKQcirQ9UtaeYLJhQqGfO8OTqg5Jq91yGwkSkpwn846?=
 =?us-ascii?Q?LpQ/fG979yg27pBDaoCILyERKlRK7FXRvtcd5IBx29xc/h3EetnzLVpYOpBq?=
 =?us-ascii?Q?Jv9ZXQTk88SEdrqdD1UHzFyxotG35eTE62H47RdIu2Q2TzGtHVikrdNqOnrW?=
 =?us-ascii?Q?AH4X7UDmW0v+5+YGTkUv9ZRRrJjSMaklBL9j+hwmdzdImzcOKI09XplHtun5?=
 =?us-ascii?Q?oytf8CoIXVJNsW7oIXfV4yaZhCv/hftV8tDLA2Wc/gKyZEZsjIisnHv24P8S?=
 =?us-ascii?Q?DnUkkGteC7nSsdm6LMfjZ4HaJc1Po+DToFu4R00F9xYL8mM7HrgkBS+Du7f2?=
 =?us-ascii?Q?XaloearbRXBq3ecZw7fkUexfoyvyD12ajhwG9H2+90IvAo4cF/dLdlvFBOpw?=
 =?us-ascii?Q?q1Q9ZE1V2nTuMJGcQNpmuZn5gcsqYHqvXagAF5RSU5LDRhn94pZjBnD0cPFp?=
 =?us-ascii?Q?KIsmrsf3y1M7sBmKb4Tjs5lJDOKO8jX2nA+giJBntjis64CUwDOJFi/GZAZ8?=
 =?us-ascii?Q?nO0S4EU7QR4eDguXO/mGHqSfaYjnBTjsj2VOqBbi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1rGLKCLdYGc9suLgYsPHsGgEXMQHkfK63yWtsaRVMXaT2A0VE18c1G50sYnDDS6jo7FoSaB7B1kmHMt8CejDr9WvXEaXj/s+s3+X8EMEJodAP4/rt8qk8Eb4kQSdPVKdzgQNkG4WGHRDBx9ldZ3HptULhemzOJ8JXQ0vHTVC7wd32jio7sE1pGrgw7if/tXR1v8r1vU6kryACLIDuVl9PW7WcBoB/YcztN8+1BQ/XSICVWFPH3mPvrhDNtx5sxJsuxV4mgONQFk02iZkMpJuplSFNnZKT0DyHRk8mVHMf6rCJtr6J+JYiUOULeusVXYjgUHbSad9b25YPu7j1Cl4+cc9+Z5E4190NRvahzSpsQ7/BQIVZNomXosHVoIPZEXOgpNxtTjf8so/QdMHwxdTFyVAoBGcdWD3J5w2w9ZYexwIn+DOKQOfci+xCp2KkOSzpyYPN9UuHOza10b/yKIcJoso5hnrqXBXZuHTRMom46Gnrjzz2q/U1OSfsLoOBTPXhm1Hj04gvUOgFHjvIZOdCp14s/vLEe9BHwmvFXPGn7/8FO53wQFK1qAJc8fIx6sR8eohlqYcENmQ0XWwG2olkjJsyvlYoGckMzCAToLolPBBfw1wWaUL9vFdP2+AshVO
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3ca97c-7e2f-4270-a884-08ddf99f7eb4
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:15:57.7873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Et6Wt4SnrY8fOjk4cpVXV0mH85SRtN1iW+zkNTE9JvASZomNq3GUCnJ0FT4kkxN8VIZTVTBQjpHyDRWdKgJh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1827
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
X-OrganizationHeadersPreserved: DB9P192MB1827.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: _uK34PFxji7GnWtFdF8fIEWNK3yud4tg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA1OCBTYWx0ZWRfX5xjxZtyOHkVc
 jjIykTSD9bRV+onU5suAuuZEBJhzylve81pTnBisSlREAmyVz8wxZtxa5A3vrXHxcR5/74oaxGM
 YXDPyPslnnH1bKc5uAjw7uoLJzBCuh9HeRmd+hSA3GXQH+PG3mqd39cqyHyTdFTI2a+O/aCNACF
 x9YKe+T1IQ0roVUcgdWddGR3AdvFEa2YnlSMqIpL5TDccfdl4vUL/Os5On6Y9DRT11mTi6/QT2W
 yhbuOgX3ckTforsZ9Us/kfB4+X/7lka0wJPFXKPcrPBgxjxBpv5Xo0EcOhq9eAY8IyWJaejY9dF
 1rTXfzlhl5xdV/9SpusOmuo57uToSf1FU8YRdrJal8QOuvjw1LvRlYLPVchGiE=
X-Authority-Analysis: v=2.4 cv=QPJoRhLL c=1 sm=1 tr=0 ts=68d0e99f cx=c_pps
 a=ygPL3bnU58HexdQZRvVn5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8
 a=T0L45qBzl8X6T0AR6ckA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: _uK34PFxji7GnWtFdF8fIEWNK3yud4tg

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


