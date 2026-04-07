Return-Path: <linux-arm-msm+bounces-102200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CIYGDUn1WnB1gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:48:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 605093B1468
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A11B30572AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938DC3CD8B6;
	Tue,  7 Apr 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="LkmUlq55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF57F3C73FF;
	Tue,  7 Apr 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576624; cv=fail; b=Ozw5c6ccMJigFzALPFmrvnZis1EWXj4LUa9QUWw+VKjr7QdOss2WMAylJsFixQcDBYRDv/jQ8h4gqypGRrexumaJ9tQN3MHglvAUDarh6TqDHSimqg5v4xzGrFzpLO6W06nazrZoYw5NplN5zqws/4D1iHGQVTEiCqE5FN5mn+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576624; c=relaxed/simple;
	bh=SJG6Vxa/ueZrHVSDdTYb8spOdqd5SwlrBgcQb81mnBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kX+g6PYI07ty7loM2SeDmrmHXmfi5r7g2UgXsqJCuFYxFCkhu2BqbavLhy6Rl2A4kJIS3mzjcJhUb6usOlwRTtHUUCPdrHk8nEdqSf/YiDEFPnCrmJQ9YveYMtKAlTHPCVg3Jr8TCvoikcexP7togPXynLkxkuKONrqSG9D3PII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=LkmUlq55; arc=fail smtp.client-ip=40.107.200.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nuk3c50BwZiG2Z2nf/BcKRMVo05cF50+cNQ1rnpqYF0X3bG/NNOWEwBes5333v68iJmxkAy32jekFeRtBLSnYvEMuhRKoUoQco7DGq/8oBUu6NTTiFrpGY3b7rNDwkyOY7wH5fYzPcv7gBPKs+yspI406Hb34bpffW2XxlyLEOkst73TIPCCuSvOJL+KOtozl+BSNaMEJ3udSPdGxrWB+xhuxiSXOHgxtWDztKf6vXM93URDPHO9k48x+fS4Vd7escer5nmdWG4TK0DJDfRNdwVe11Ud7P1eOR+h5LAKqYEyfsh1uk+t2Uzd8Z2Mtbw+3u4iLqakGjp0B9pc7dK+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsM++JFHzZMQKqWLTQlTNIc4wMTym52LTTsDeJmXu3I=;
 b=uiAAppKEjuHbmtvZf4rnpeEeNFcqXTc1TLLvCGGg1b/7Goz9WjkLcXGUPUZ04edFNDO9O0S19NHoCkzQI7wwpYHsIOjz6U3JP57WOxqWgSVH6WJ3rWwaeoSgT2eDzwgKY0+3wSiY3EGG1SH1rwUb6OQ6k2fnWpnLBZkIAFju+v9ZL7Q7K2tUUiLA5Nn+O9GfVMVBOrY1oc51Kp9eSxJ0u7c1fvBR25JGd5KTC69gaja4BJWb/ogGXsKt2C8+OsYU+FU5zyugboBiD6pw01BEt17+SOvnjGPv/3THcKrAs+fhF4Hy4ME/hS9t6WrbruvpW8BO7JXAb7vgw3viDVfxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsM++JFHzZMQKqWLTQlTNIc4wMTym52LTTsDeJmXu3I=;
 b=LkmUlq553wqEMap7QPgtazgu0PsJUDL4+qDD9f3BtHvn2nAh2IRp4waVwASabn1Rid50jopLSOg1yNIYwMnzkwZvMsjbB+1+kOA1Tl+rXDoOHOThl0bZ6/nnj25lg8rSXGjR6EwP9pza4oYnUSX/yKrYqlKLiDF8YA8EimksUP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by MW4PR10MB6463.namprd10.prod.outlook.com (2603:10b6:303:220::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 15:43:30 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 15:43:30 +0000
Date: Tue, 7 Apr 2026 16:43:27 +0100
From: Joe Sandom <jsandom@axon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <20260407154327.pbexm4jkttp6rdjl@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
 <s4g54pra266y6p2j3f4fps56naw4hm4vzuai5sgpf7sdbbewj2@3j2tkqd3qgdn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s4g54pra266y6p2j3f4fps56naw4hm4vzuai5sgpf7sdbbewj2@3j2tkqd3qgdn>
X-ClientProxiedBy: PA7P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::9) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|MW4PR10MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8926fa-83ef-4aa4-6ccb-08de94bc6b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	10QNCEpWWu4wW3+aF7/cWd3yO1gsQ8K02ymoK3BHtUBJlhtTe1sv/rbN5Eklh4PgwmYHWoTQJM4o/IG0t6M2bUZljgD6dSV7ArwvTjjDoAL5dh/mKlPcn1sDL9u4SSc0K3QlpZJk6yqYVoDgKpDImzFhCB2J0KD0Br3NhIQOTDIoxWvV2v2+z9pOjzY0NsmLGe5+LteSAlW3fkPsPndxO5tx/mvqYzaJ22PS2ruA/oNW2cauz2PutFKnY5crsh191XXRU5W540qCnrwMnFTB1WNjAjrddwFSSywLg9ub9IuW6MrBkPh+aB8ZTnbtQMWGY7okGhVpeHk8drNRvvguKqWr4L+oQsN9Jg5Jcu8dG9guzmoU2HCPVj9umwTY3Q0sz5cVnkZuuBvg3GenhCASXGgJntBMgtT/7bYU+sI/rpeUzejCTFKf94TjsOCjmAFg8atoRvo1N2dbE4b1E3ohu7zq1/+FBEzFCucBAOW6CXWCaP4nvWspH0Vv36d2goszCX/9rq7ZhVnAcIucttECt96mrEPXRsz51NS5SJ2yDfgm1ZhigPy7t1qUy0FnRJCVsLx8De4ySaNKvQqIPRGgJdby2X61JdOOcx0Zt+xiHnKludJCxhvNPuP8UKAWS8I2fixzi1jpu9mXwDJprIwULtrcZr7kE+T9PNHIm/KZ5ozSYlhsPgs7+v6ULodNxyZjFQk2nIqxaukTv9rMeBbZsorfgqjm8/drcsELxI4yn9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?533DzV6JhSEC6Vo+YqI1ysqIpyL05bzuVWLs/P8kBuVWcztrpxgWN500J3aT?=
 =?us-ascii?Q?brtLKfMzsZx1qkLrfcFDSk9r8OZMM4BAeMUktBaS+Lo4YskpbY1Bjsurt17j?=
 =?us-ascii?Q?dpSJT2MNuoHj+NEtWtLym1QE5lk+uoE1+yTj6Z8aJNXN5pHWGQT/fLdlMuUR?=
 =?us-ascii?Q?UdnRGqXOvdZhFl7TNwaWnMkubzBT1dQFXPedPjGx60e9uL5HOJCv79+aelVg?=
 =?us-ascii?Q?ZwHvOOeEvJRVG/k+TPqo3t+jGj2Tz8rxczYRbPYDkAkwXMlX6CrQoamCGk/0?=
 =?us-ascii?Q?64NkG4QbiP8bgurRseAeN2TFYPKjGfk1LjK6sBiKIzxIfmANjOXmtaFH5/1A?=
 =?us-ascii?Q?aB3cFfTYZkq88ESPXjdkuCoHNBhAoZW+8/xXHWgkwwWicOahfjwkduESMAxC?=
 =?us-ascii?Q?1zsx7jtizamnunFE0C7XIbyr9ge7BUAsffSSxZrj/R6pAkDbLkQbi+ipCXy4?=
 =?us-ascii?Q?5MMJSUEExeSQJsmDJNMrM8GsdPag4MfgbxJkqMuVRqeNSxgIwZAuOZk+bCSH?=
 =?us-ascii?Q?Oa3lxIuI0LjXG1ik40dE2EYiwlWyjZsiZCgg2ugjWYS6uKMDMO4g1NsV7vLO?=
 =?us-ascii?Q?TrgOQoRhASrP+r3MDkr1Mbe4FlHYoqBZ1SqL3o23S92CiT2CkKP3i4/7tfLT?=
 =?us-ascii?Q?OKBJT2aMVrEMvnV7VO7UAj0mVr7c5b1mD2PSxj1hhY9QbhovsIIMx92kVhYO?=
 =?us-ascii?Q?DVxpXoGq4HOSTe/gm7vjTOrJNv8b4/7LWImA1O0NQkQLjt2EuHEEed48LnU3?=
 =?us-ascii?Q?fNUxbMjwrBP1VyXOamZX2EJoc3j8DyhplYe2YlZKvbSkNwiXwSHKf2m5vp5V?=
 =?us-ascii?Q?5ws3m3iWr17B+Ks1h7hyfAhnzMhmdJveZ9PluHQnsteGlGAj6JfVTdrYXsO6?=
 =?us-ascii?Q?kcx9hSLSlkwBtptar2sQNwvrxeVmLarU6QWvaz4JFXSQGmt+XQOp1r/QD9Jt?=
 =?us-ascii?Q?hNL9WPehgx2tMxVu4/gUxnusT3yoKBt4nEjLForuPAApm/nLzEIu4b6+AEhr?=
 =?us-ascii?Q?OPOcU+JxpEsaWnIgkc9JW2ChUkfHaYr5kizoLe5WMrJt7y3pTrnFM5aDzsfr?=
 =?us-ascii?Q?l/qW4ynqUHFw57skwxiZMxu9lV2N8grhAiyDlW1LAC8xJETNuX62xhFmO6l1?=
 =?us-ascii?Q?KfX9ktajQKpdCBhLROHBhN29ts++u4/xqb7oX83Hmce8QNPBunL27CHm5nQ+?=
 =?us-ascii?Q?jM7DGtWoaj41axd9AKrZlHwsLwRYgFxejCMaUb7btZH9c2ubRKggj8WiTfv1?=
 =?us-ascii?Q?2nGdG0wQuJ9o4zvPu/XG/UWrIiixwcfkXxhyP1BwJ7mD5IcnzUwXcQat1wQv?=
 =?us-ascii?Q?WZtHkBqbphexc06Kj+nP9Pc8Fd7QxKbNde7NCzzSvsQLXc2Z1EWAKoPx42tS?=
 =?us-ascii?Q?E9XoyCKwPLALuAr22kAjTjG8ylPHmYs0ftPCfgdHm7ZrpeAIn/K1y+l6YcSQ?=
 =?us-ascii?Q?XoTHs0Ha5q2rdYZw9jWLgY2ceGeKue80lFoZ/qtdDmZgbmBaeSrVMYYJ8Rkz?=
 =?us-ascii?Q?rMVn12thK2kZuASRisTSZcUMQwi22lgUtM68ndk93L2fNUC+i0U6QQhufR3c?=
 =?us-ascii?Q?KMpJRHmgcocaPpkMggD9jSm8YNV+EN5H+WdZIWO96sn/1tVnc8ZVS40jzMyr?=
 =?us-ascii?Q?uyXLNdqaawqyBTvs2AkxcZWkdmk15Dxqu1z1kHkKCtHmpf9hr0N6N6pCuIFU?=
 =?us-ascii?Q?0Ts3Z4yKNTCoDNpuN/XLSnku3EFnJMhYB8jyd8wKlvgpzRgT?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8926fa-83ef-4aa4-6ccb-08de94bc6b11
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 15:43:30.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8b4ZV38GM0t3gki/Gj49t16+Ytz8j9Nb6yJAGU6TKSo9S5zcaR17tdK7GEJ6pdHF4O7NMzaBewuaw2y9cxDxVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6463
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102200-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axon.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 605093B1468
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 06:01:34PM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:
> > On Sun, Apr 05, 2026 at 12:20:23AM +0300, Dmitry Baryshkov wrote:
> > > On Sat, Apr 04, 2026 at 10:50:58AM +0100, Joe Sandom via B4 Relay wrote:
> > > > +
> > > > +	wcn7850-pmu {
> > > > +		compatible = "qcom,wcn7850-pmu";
> > > > +
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
> > > 
> > > swctrl?
> > Bundled into bt_default since it's tied to BT
> 
> It's not. It's either WiFi or BT.
Ack. Will fix in v2.
> 
> > > 
> > > > +
> > > > +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > > > +		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> > > 
> 
> [...]
> 
> > > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > > +
> > > > +	/delete-property/ msi-map;
> > > 
> > > Why?
> > I tried extending the msi-map to cover the RIDs from the QPS615
> > PCIe switch (matching the iommu-map entries), but this caused
> > ITS MAPD command timeouts. From what I could gather, deleting
> > msi-map forces the PCIe controller to fall back to the internal
> > iMSI-RX module, where this worked properly.
> > 
> > For reference, I checked the RB3gen2 since it also uses a QPS615
> > and there doesn't seem to be any msi-map defined (in kodiak.dtsi).
> > 
> > Any recommendations to resolve this properly?
> 
> Maybe Mani knows. Please mention this in the commit message at least.
> 
Will do.
> > > 
> > > > +
> > > > +	status = "okay";
> > > > +};
> > > > +
> 
> -- 
> With best wishes
> Dmitry
Thanks for the review Dmitry

