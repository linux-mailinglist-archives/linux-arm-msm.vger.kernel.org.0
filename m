Return-Path: <linux-arm-msm+bounces-58364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C37ABB4E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 920017A6E79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 06:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49810226CF0;
	Mon, 19 May 2025 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="V4ek2Ecf";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="InGNVGW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A0224B05;
	Mon, 19 May 2025 06:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635027; cv=fail; b=oEljGh2fgfTkZYH0yJ0dhLqsBhmag1nduKJ3E5nUwtVvuyU2kIOoU/VBx8Y6AMM82ALEMCGPNTG2V6xhRAYkQdQeGtAePPvopB4RuAAyeM8R/VtF5cJVM/b74WvdDKfOy6k70xYqECtBZqPJ4zmMl3bsrvjUpnH4Dp8NYnPKHsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635027; c=relaxed/simple;
	bh=tGzygW1PlnGALxZUxIXvejVv8fLaw+4Fc/L1fpYZo1w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=U9PvnyMPt1JUptteANwKz64CH7O7LeoVxpfeYJTZHFoju4wS/hGn7KEYpk91nI6Rv+/Fnffof/kpnaO0G/7VP0k2EVCKbiQdl5ORX8ourc0dpxRPiuQGaUaYMvoxFRE51xWZekyRUreH8PfvvSK+jTFL9PdGfcgdB5poinP1WiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=V4ek2Ecf; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=InGNVGW7; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J5BQuV024253;
	Mon, 19 May 2025 08:10:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=OYWWXHcRVqUoWHMHySIpx0
	/xincXf0P3axsx61uFpVs=; b=V4ek2EcfXtjgfbx+se3i3z1ozOrSBN3tJZokpk
	tQlFszCHIbIh3P12iQVpvX4OCjBTLvPGhwm1pmLGc2Z4LXnUkTT1x61mHFV2NHGX
	m4BWzi4RkUkC8bj9ALh8icxBS/hDozVeOLKm3op/Maslm3I0FzPOd6lwRZbsjHci
	almatLz9VIOM013DRmYyfQtPkDB+bEt3pxRonq2t0T5GETS/GbAiSTl5p4g1XU8D
	dM8gmLrU3WbjUZPT7VdGJtJAr1BdrA7htmfJrtX3IjK6KmBx+qW+/RnY+FFlPsvs
	/s7HMRHurPtR7NlTiticTnmtOBNDM+aC7RhhwdPHOylDsHSg==
Received: from eur03-am7-obe.outbound.protection.outlook.com (mail-am7eur03lp2241.outbound.protection.outlook.com [104.47.51.241])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46petdhvr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 08:10:17 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGVOq4wG00cB7H2CfCKj+PeJaYEZdSBx2vrzePv2ucYVQplbTIi/6d3ynMgX8vDJkMiyTTeBfaTfcwK3EO8bmE6gnWE3Evs8LsmUY/32Mk0QpDMgM63K+mS7lB3+CU2KY15es8GBWiVBU8uhdZVAI2kGj8M2dnMslC5U1Pz70k0iMOaigaS/En9Krb+XKQoHthlHs670xh7uL75Vzah/euVvtRwhaWIokbyE8oD5fvTIKQHKtY5yLMY6XVxM2E+Ew2czNSlXrRnGpH5lfb0Z4Nvr6rSNYKcf6bYlySsG9v4yFcEGybYH/oQ+YdRWqNtgv8QDKFIB9G5lolqbGiQbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYWWXHcRVqUoWHMHySIpx0/xincXf0P3axsx61uFpVs=;
 b=f5uGR9m806XO0TGmBEMQI+vueIpG5zTTHmDqrcIY919+weWD1YCW+DZtHH4zrJu0fNeuepj7DvtOwZEdOqrDkZt39QhSplhzIS1PcTyEBrp/fgxlGQx0SXWcCKu3nSZ19TCEhaUG9rdAK3XJG7BGhMH487yp/ZorC7K3wOF0OK1olHqbSxFmprkd5gekP2ho6hqrEMlv6EsdXbu0hSO1AXA4pbL1lAgHKtD3nb8HJGPctoy44re5ZCWgz9FCNL3uckV3WqwIw3RHVz+ornPxluzQeCKV92d+aPSQwgAewYznPV0UmPTWOSIPwVfcT1FsCV0g9FAuBG4Ytqp9Zb231w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYWWXHcRVqUoWHMHySIpx0/xincXf0P3axsx61uFpVs=;
 b=InGNVGW7kE3JD/z1Gp8PtaoIdslspw6UOXlryfW5n0LyE4pRsp7YiU8+CghXu42KdTmQpcj3MIylxlubCCAAdukfOW01OncUo3HKKqCK+LiFDMohV0TahIFOAjNXh7/752A6bJb/yrtQHVykf4/5sfXEwSlqpUE5uWCYSk+yYO4=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PA2P192MB2372.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:41d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 06:10:15 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Mon, 19 May 2025
 06:10:15 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] bus: mhi: host: fix endianness of BHI vector table
Date: Mon, 19 May 2025 08:10:13 +0200
Message-Id: <20250519061014.12225-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::13) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PA2P192MB2372:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a6d2e1-66c6-46db-b076-08dd969bd2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HjAFcWiHzT0oRpaVaQbbK5s8YtlhDEFgtRDHi/RvLgoMtxh7RcxgKFdREz1t?=
 =?us-ascii?Q?PdEmPeh3c1EesKcqHzOe6smOqvQah3dBg2hsdjW8BwWweiPApHWM9fpJ/AiA?=
 =?us-ascii?Q?CROhjcPzplRvvygccTRsJN2PMYEnUcURc6b7AKK5lLjGPEYVLANVz3HlwV11?=
 =?us-ascii?Q?ZKiq2chvRZau5QL1+tPWSUxBIdV/bmUHWCIfGtWrf/c/ZGhA+EFkhJzgJRLb?=
 =?us-ascii?Q?TvXPRKqTWQ/WMIf35NS/8SJLR56ojrY4OEShQ7WomALW2rVCL4MBXE9EByL1?=
 =?us-ascii?Q?HUL63Qf74WVPi6s+S7+5Fpw6RIDtdlkeYdRWODj+6dcz1o7+VL07oPAQPqnO?=
 =?us-ascii?Q?LzNDq13nMsqVFTjJqOkLAohh6nbYUUvMjEsItGS9GJd2bRYlm0yZQkH2SpHc?=
 =?us-ascii?Q?U2J7tYCm+wJG4emCfMRg3vrGRmCPpVxmuM4R/KnTJ9a/CgyrYB2bMUsAgNT+?=
 =?us-ascii?Q?gAb0JxWR4oCUMkjRcRrZW2J+Rf8z+H57jso+RbIdRfJi4XQhJ4Z+ePkpBPV4?=
 =?us-ascii?Q?zwkA8O/A+I0s8vNOPRN6kjCvhHGKiT3UZydxkJNckqHIglgdMi7c8o5Xgsgi?=
 =?us-ascii?Q?DBx0xOm6SxSxoMmhsJZ2tynju54YbFbX26qz/GUG1nSx9rQWIRNjzee8g3MV?=
 =?us-ascii?Q?NsiEnC5ZISCBzyr7wPOMLjd5YaOT6O+HMIWNRSSvOWCofsgov4VdpcMyw4mj?=
 =?us-ascii?Q?iXwQrUV6bZwCtyOi8wRgrMFdwWUznWShOB8mrr8YjHnwUomDe20Pr3pH+o/S?=
 =?us-ascii?Q?llRQX/lNzbZfejjmeRp/X0RqfNKT8Ew/Zw9ptdqDx5n9XvTqOaZpTd8ewfNW?=
 =?us-ascii?Q?UTh8JrzPLMY9aThzQj0/kTv/V8LLgU2bKnFE//w/FmndCg+bsseK1Zy3oNZT?=
 =?us-ascii?Q?lacEhQXAZsPsEyn9g1MYDjcSbP+97xoH3S8PW6J3ZH/N6pIlTc+rOrPh82Vz?=
 =?us-ascii?Q?++HWTrbDOwR3nkjrQfufWxSUkLSS3b/hciXniNg0U+p5EjCuZ5LYAqMjyOdl?=
 =?us-ascii?Q?3G69OB6GWP74Ajc8LigP4SVWku+koe7XWeyiXzf6qzYh3fOFv2VUr1c3PcKR?=
 =?us-ascii?Q?93lxOkrOaJr3ThXagld3XE/0atD2TJBmTCSaW2YaVC+2v4MPeQoYTticuO1J?=
 =?us-ascii?Q?/qFkqGw23PShqMvrOwXlhi2Bg8TBMfJthA5GyZvt6cp9MBPqI4Le/7WZmvfd?=
 =?us-ascii?Q?A2j/XHtz1eGIuSSygkC6nFlGmqCbbqaCuCMh8e3tRc6fxTDyArTDyfDYpUM0?=
 =?us-ascii?Q?VSoTnh6gt69UtJamu9jvzEuZPSSrMZIxLYEm+81uGGcal37DfQv9/Bq6IANJ?=
 =?us-ascii?Q?z+5kPPSoZSPWe3Jt3wlrivCbomgQFNH0EymlpxQxxIXkoQ/NwsvyO97t54rM?=
 =?us-ascii?Q?j+AqeAAxJ0eYf6wsrs8ARxDD8zq6i/CgEzaIPtxWVcivA6vzxApEqyP9lOlf?=
 =?us-ascii?Q?TxqFFwwe/Lk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C1Z5UMvOi2pW3Xv0s2GbRsgfbdcEP74NXXi41YsQX/YAr3uyHgPlmf+xEuYM?=
 =?us-ascii?Q?mh7NOvrUzIDqcNd/jozt7V8aIurbS9LK5P5H9aS78U8I/8Xp2mpxf+SLboY4?=
 =?us-ascii?Q?xuIb3bXFBSkF72pLY9hxriO8jNC1e0wrrZolnJxh2TidoOJCboz7ZfjKI64x?=
 =?us-ascii?Q?r8A8vYB/ICAWc0Y9AILwFq2Az/2lawzrctzSx90UgQOrWuOuAHP77JJw7wDr?=
 =?us-ascii?Q?R72KxMhrP2a75acmMbOGXnY7rY8bm9TBLfyVDzYDC9tKgAZe2ojtXurxVb/2?=
 =?us-ascii?Q?A68QElt4pNMjAGv2LRh2SadpTBQu4+mpowhbe6KWe2wXK8RRSSCVFiJ4Iwxt?=
 =?us-ascii?Q?ILLzEL6PJx03jtjCGrMBRrbiSIl4gSmzz60eSMTpQoXtUH+Dvq134Vgbnl/d?=
 =?us-ascii?Q?XOm14oSn430XK12DnDldJ7G8B7u9UjcrvibvoIHmyvXyReBzC4qHxsFHyl/x?=
 =?us-ascii?Q?yOM0wvrESTDXyafxocrXxWxcBacELosvjcxQC5o2jp168yI0m8Xiqb2pNH0A?=
 =?us-ascii?Q?rfM4xaxLF9VxRflu6hPwdxbZFbbjPdWmhnKJg+dIdHRJAVpz8hGfwA+GBW2c?=
 =?us-ascii?Q?Tuu915job3ZhRbpBqqjohGrLG51KXPzr6Vgh3r7lP4R49ewwV+Yix6uYf5eq?=
 =?us-ascii?Q?YaE35CA7Dwu/P5Hg7ELkmDX0MTENv0ytTfoOwkDqlpLCtVDKwodzwZTQd5n9?=
 =?us-ascii?Q?Yy/Rs5/Ik7FSQXZO1k2IuV14Nivn6OOFX7LQJt3TAP17YxT5jRREatPA4WXm?=
 =?us-ascii?Q?L4uLzU3CXkzc9VIouvYaKU7apEPw8/OIQXGOHuHMjkYJ8FOCQbXZwUbsTsni?=
 =?us-ascii?Q?fxa2SK+9lADG9yBqzVjZjgN9DxMvuQ6B5RcREuTv9ke1TIRTtXHkpfNAL9vr?=
 =?us-ascii?Q?k66kIxFuTrdhBotvol/zNcQR9MnmGOTJE2ALO+zaSIeALtm4oLheSRwGECK4?=
 =?us-ascii?Q?2fl3aTltSRJrwUDLnwzXjcWxSpfElpsBYJLq+pWKB7TtphvT+NiNWAU0slNm?=
 =?us-ascii?Q?033sJlJ1XPsKVmZJqUdsUb2W6Vtynui6XydMuZtfZl8JPXDgFyxKK70B2+sD?=
 =?us-ascii?Q?a1XhcY4RlQ2VAewPptjbvh609OhndYVr7nIDTY6M9emDGhAha8ZDdnVH0Ss2?=
 =?us-ascii?Q?vuNdpETl8Qt6y8OOwjcsBgnIzyarhuKbVb8Qs2twI4sgNl/7Laa/wJ/D0Ika?=
 =?us-ascii?Q?s1skJqtOYLN+3YCQ8UKySWoKjf5Ry/BZT1fjlJCy52XG5XyUdkx4brBCag/i?=
 =?us-ascii?Q?Pqq1uL2LAJamCvlfEYhoVbzCm8KMRAFVrK9hPSJApZ4aJrQ4wpZLVT61mcgh?=
 =?us-ascii?Q?KNVG+Wx+73UKPjffxTovcC+Iz4po60+xyo6qA1fgzS2njJunEuBZrMdqw24X?=
 =?us-ascii?Q?F2MFcY26j0LzQ/733wA0tZpoEgVfVWqiZKwE7BaxwrUceEvTUqEnL0UgKEDB?=
 =?us-ascii?Q?JOPF3UYTrBOaqQhiUdr22XhWSatIlA1vLgHibgpu5EVfXoYexOovZFbhJ4VR?=
 =?us-ascii?Q?Mtvfa/lBFaoCM5AO7ePncs/eJZprst22CjPC+cMnnaB3SecleezUPug7PLII?=
 =?us-ascii?Q?BIeK7IDvEvE4/8c8VNddKLOIieelk4VRGYZgIJHR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/EONvzWNAK2Rb4wvLNfouqhQbQXQWTJ5NbCu7J4OVcmLVAlEi+E7u/duh58M/faa13PhbWeeDsmtSF+yDvHYW+fAXRaM0xv1Y8dau7nN1rV96OJ1jVyXCz5cu1+LhpQ63STj2eK2dWX1TnQFhEiPPWF7131Pri33sfSB/n5W3rqT9ZeI+sttDv6QCdYWCoFlVtaEs3HRx1Wq5N+Bp9ug4KCgieeKqzRZQDKsjpgclCTN+cUzbKviLjOCVI8POfp+rQ44V/pyKVCGjaZP0P7UkJEa8nq4hC9AUdqsEU3cJdRydvOol7NYDHW9iOU/i6qVOM6pyYu5gGXLSOskAMlQuZhq7PTfpidhQCHJ9lbX/m3MARnZTz1ddBwXQ79J4QASwUU/6SEQ9/bbyKimSwlTYlDfRMuQ1U+EsFNOzEoJakp09lEtV5hqCaILopzc+ByOC+b0HE5wJosKmKeqlBU4HOgOXWET9l/1sDY2xZmVvRFgYIB2trRNcUKAd+Empfzbi32p1fOy00d5BMGcFGwWBqd/4NcqvjK22TIUf4kpSJZQTwgfl171BGubxsYMCI8q2Qc3RY/Hhi+YQ7fAutsXx0SfUkRYhAZF1vfKIb3HNum13oPyp4H8J/HXq2K+u8l/
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a6d2e1-66c6-46db-b076-08dd969bd2c5
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 06:10:15.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMkqk93qHJLFuxqTcY+Fw6HpSjBQuaZCWY2q1qIwhrkH6xnUdgcG+dpaQ7diIkvFGtjbcJdL/UMX1eDASakoSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P192MB2372
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
X-OrganizationHeadersPreserved: PA2P192MB2372.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA1NiBTYWx0ZWRfXwgFRF42VOzni SulGPi/oVh2qoObcBim4bYl+T3Xi93E4yqJ6hLSLtm0vZhFvl9YNdT8ObdRplngVR/ee7bWG+sk 1WmGXbtbx6S6pktm272kab250+4ZaC8y5VGPrJ0RitXT1NDtRrw2p0KCQ2x7RCeaxVmGtYkS4Of
 nze80+ehRjgLS/63rXTd1Uun7DUlCNVkppi3oGOId1fYMX/rhNeaRyoXP2yGSZ79A6nlcZzkwka 4XkHBMxOOLnyhmii2l0lA4tyQdM2H9lBxD5ztcJ1X2mb1DA7Zqs0t/8km5MK/Zdbs9a0E3tvRD5 XEdGrcATEzSwNoP0SM+K8xg/ju/uve+o+omX4IWufhUzvWiUDkxXx93rcouJFUmhpjh6KDrA+Go
 aKaiIgNtuLbERyjom8CeCLMyWF1fgrW5mTnXzXiHn6qpKoWELTRU4IOCm9s1pNmMWeLrQyB5
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=682acb49 cx=c_pps a=wOx2noN6cQSiNhTpOOYBYQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=O4OWJBwTOLmvuvOJhrEA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: J6CITAwD8XiAF1IXGKwREFCXZmrn_3qc
X-Proofpoint-GUID: J6CITAwD8XiAF1IXGKwREFCXZmrn_3qc

On big endian platform like PowerPC the MHI bus does not start properly. The
following example shows the error messages by using qcn9274 wireless radio
module with ath12k driver:

    ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
    ath12k_pci 0001:01:00.0: MSI vectors: 1
    ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
    ath12k_pci 0001:01:00.0: failed to start mhi: -110
    ath12k_pci 0001:01:00.0: failed to power up :-110
    ath12k_pci 0001:01:00.0: failed to create soc core: -110
    ath12k_pci 0001:01:00.0: failed to init core: -110
    ath12k_pci: probe of 0001:01:00.0 failed with error -110

Fix it by swapping DMA address and size of the BHI vector table.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
Changes in v2:
  - Set __le64 type for dma_addr and size.

Changes in v3:
  - Improve the clarity of the commit message.

 drivers/bus/mhi/host/boot.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

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
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ce566f7d2e92..1dbc3f736161 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -25,8 +25,8 @@ struct mhi_ctxt {
 };
 
 struct bhi_vec_entry {
-	u64 dma_addr;
-	u64 size;
+	__le64 dma_addr;
+	__le64 size;
 };
 
 enum mhi_fw_load_type {
-- 
2.34.1


