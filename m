Return-Path: <linux-arm-msm+bounces-102475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EEDFYSO12nzPggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:33:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE003C9B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43FA03001848
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FB53C13FB;
	Thu,  9 Apr 2026 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="LL6V5hkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3480F39F174;
	Thu,  9 Apr 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733798; cv=fail; b=Dd1J1k0yKbAOrVfR9rAsTNts1LaPPGkjGt9JLEtBCoCRAcIGpg3IBSegAoF6dEuSVtPz5ztr7XzyvKj6XaHkh4sTWIpAXj4LZ6VOIxi69MqzZCVM6GvKOF8hHBwbqZeX5vtuNrSWf7wzklttqvWPJyJqUXJWyZ1BY7A6vd/HYb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733798; c=relaxed/simple;
	bh=RLWqJglAxm4nRWeOANv8VS7sd8O3td1uYfQ9TNtAi8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D4oBZZbTSh3mp4DbXcvrT3mGDHPY3rsNdMsCt4qbh7bEB1OT4fwHNeX1fnz0rxmiveBkgVFq9VeLP1FBN2BaY4Q3KzgvhWdTeAse42TaViZyTOfDAS5IuDnMoRehuvGngc9/L/KnO5YTTDrjTotgYJwstXkIjecXr8kKA6yQbZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=LL6V5hkS; arc=fail smtp.client-ip=40.107.209.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEe+MOAVuXz6WV2rsIxRMNWKE8njwa7dmO9vLBC5Qc3tjF+Gvq5O5niZ5m/OtU8N1KiU4hE40U+I4jy9F1aLQODsBoCgwPtO20o5E3ykS5pciliQxZoziQU5mecj9fWXnuHiCSFb99wHeQtbreU0c55icSOx2CERDhrl4p/Tr4/Ro+6HUMgp4HM2DBWfKqV+HNGwxPUmWWq36wavmoUJ6qtlYWwYwOYL2C1GvokgYWXQhT6wsIl9mffyP4rCRj3yrCQ6uvdVEfxtbJiAkNu4cDrVXFCoylEerYEvnuntzg+pWCAq3gR9sruwRpcUSpBlfgs7006K6Z6EcYlIWaoWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv6/4sLRRFszGsQ2QDRr4nYzIKga/lvyjbYqIuPIEBc=;
 b=EywCtiSj6uRTgEmOgZuLabmdYmgEwIVjmTNRM8s3aUDFREQqkqCSvqd8KwKsn+0+nbL7Xf2RjorMVQ1Lj1BDC4amN/ouQmZlf/i/8lnHhT7+ODQdlfUX2MytBXrxlglgghDTodLuji5xNN7Tfpr+yG7MoDBMuy8xoL/YbadiYEEB6PHFdnl202ylg6jttgyUZYus5pXze8olOPJQdMKVjLZUCeT7bntRPoI7ufepQO5QYd3wHeRho75iAD7HG2wNems2Uu06365bB0jWERmLwT15x68WqGtsDdkYhNHzsi/xRXQfSjvRJpLotGv6XJ+SUoKvUasQ2W1DvQBNEeD1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv6/4sLRRFszGsQ2QDRr4nYzIKga/lvyjbYqIuPIEBc=;
 b=LL6V5hkSpt0cOo0dbzqUbse5oqly2/ec4biDS5irRlBuHVuDJaTFQDdiC8HNGp6dEJLTSCQdqQb4vPNaf35lYM6o/lXYj8IKolfBvJ/8/TxQS9chsbYG3POmFUPOg9EnRFJ/a3tA0XPfhQ07RkoN121l0xDcBD/prkiiBxqs+eY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 11:23:13 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:23:13 +0000
Date: Thu, 9 Apr 2026 12:23:09 +0100
From: Joe Sandom <jsandom@axon.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
Message-ID: <20260409112309.vaibvwsmfdjardvy@linaro>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
 <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
X-ClientProxiedBy: LO4P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::12) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: a2927e9f-64d5-48dc-6d95-08de962a6332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	93f0BHG6XQYBG6MaIVnT0yLzkdnYAa2vJOloirODwUnhGd2LhPuABQzWLFeMv4IbpkVZN07ivuFtv1GaEYEgNYBGeHknB7Gg+ZTG7XwcEdYyr30euB6Tv0VK7G5D+B74kxI+7vixkPb70NCPau9pw9ET1MI89g1+qXjxukI/vgYmsq/gU5KQpeC8EkMlubTSlW2AeDgqndz7+4vTOwvMH9Vx52hPOtvz1ovyEApd2Yi7UeePrim3kSDR2XK4nWYBBo/4wJF59hc0uTTmOXvZC0kCOHESo4Yup0urDRPj9h9P3qd1lo2BDm293X1jljuWZYlipcXMQ60iBHo2rNLgiLk1k+w+/SGouFzStN+FSDj3RUHSokmbXj/d9+2NBsH8ObjXA0vGeS/a1SkW6nfQNya3pD8RI6EhOL25KkBmrVwySb70zT8pq0LF8zxL4e27EJG4JOeUISJjWKGO9H4pvJn/9gbEgocOUXSaHly1d6dm6PLV/S9woFNHXIt068e7GgO71EFQ7lrKEDaQ7gOoXcVqsoKkDV0CeZ4QkHawoU6LJ58NUmswL5d2b+LZWFQKsoImaSwX83w75oNikFOqKBG8T0TYZCkI+fcPZCQjEeq9++arwV6VBQwUn7w23o0KMp3YzTeG5Nt4vudeRHueMr5ZLLv++PRSf431+Sxi0B2vyRCRrjemoJ4FNDv4xyfTZhDyegr1Vy5mIBZoIWtZ/iRvYuGrL0N+sRelUhPWxqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJVaoXeHqDnjhB/YrgwoKF2SnV20Sqz5Fm6hMlJWwIxW4PQnG7QsiDPew9mt?=
 =?us-ascii?Q?F27usbpD9+fHNO5vhwCn4m6wdvaaCZQAHz+KuYbsc3hsZb5p6sYhpYgw4n85?=
 =?us-ascii?Q?kXgWARUMPflRMcuU3MsOLDSnxDc8/qMDsUgRWOusnUsul9fbz5oVsJAQMKmJ?=
 =?us-ascii?Q?RRf6iDLjkIafNR3IW8GWOx50+Y34uFYaBOnt1/cuIzloiWoza7a3XhoZw2Cz?=
 =?us-ascii?Q?au81sRTsfuQ1xnxZsX+v31PLrOpTyAEdv3X+DWER+8+a1NE19kOvvgFPEiwW?=
 =?us-ascii?Q?ZewPjKUfDP+uz2OGCVQXxUUZ93QAzQ5D/B8xKYj3hBWlur1WJeoDQIck3yAT?=
 =?us-ascii?Q?9dsKwsx+T7cYhMLY1kUyHdQ6yq2DBjTYBEYztL24vNrVGSL0sYnkDNDTI5GA?=
 =?us-ascii?Q?yxjAn01cQUDBinx3QT85L4cQ6DDaipRgF4fi8ESzfM6+FTMbIk9P5em99cM8?=
 =?us-ascii?Q?UCknRPsNH4vpWV0bZ9Bke3BYdA2WoM7ozFdvsggmT7PuKcr8vm3CzhpFJW7f?=
 =?us-ascii?Q?rt3byREtzd4muefAHkxLBxLpioW6LznmZdvmB+fTYhSPIzunGRW0RN1QfRyA?=
 =?us-ascii?Q?wA9c41ZEtQ4kT+Zl3xxjFYWSOtS45FVHKp6T7m5YuNOLfcjGdqjwzlCUxttG?=
 =?us-ascii?Q?3vpJoTU3fFXaXIn4qIsODMIlogtJHZLY1ByQxcnOB5tLQhNAuUfq72KcrLle?=
 =?us-ascii?Q?PZdwLw917DyW6Z+5lTGG4haXGDJZMlrohhGmquMkXXkmWS5SMCxn/Zpatp4i?=
 =?us-ascii?Q?/hC2y2Ky3Fz7CF1TY3oY2c/UP1UsPexpSgNFVHUB31vagpokIZnYfuSG3TAN?=
 =?us-ascii?Q?Ou2/w9FKDfE/bALNkc6rOVY52eMLY/SDx16aNgIsDlzZssnChtX2Ew2/QgJ2?=
 =?us-ascii?Q?P6wiYlgNmnzDknwgJZMWhyLkGhgKN3YgslxL7syE6ikShIbKe6O3BFu4vxqU?=
 =?us-ascii?Q?rfnFHISlz9HdtjG0Cs9KV2mBzQPvog4Aou61150SshmzIyGn1o1LVxVBmloN?=
 =?us-ascii?Q?9I9qlKatxK0DK3vRRm2tl/2jW2UPttJDAzI2jUW0CafNF5IMQkfiNoVi10qE?=
 =?us-ascii?Q?VzD1YCPXfeh+f5W1uwNgxA8tS5gK/V1BcxzeDQzokuSkC8zLMbGjOdtTxenl?=
 =?us-ascii?Q?XUmYBi+yICRpmBp50KIyVs8mG3jDQY6A+fs2CCn88lCpEzM/+XZKOfCnmxXH?=
 =?us-ascii?Q?cWgSon1yfKyDMKqgvDDre8MxkRrxHJoli+j3lwyELkYiyJuT2C6TxFPGE6JJ?=
 =?us-ascii?Q?4xIuAYGoiAf/zSBsieu4SKUbj9dQFscwwdAQZ+nJuGqGZnWrUwVfNCjh4En6?=
 =?us-ascii?Q?DgXYsQODMEslXW42grxa+rYy5MywdC2csEUoJkT5VCOzqrwK6Wek7gvSkp7A?=
 =?us-ascii?Q?3nwcEVICn2W7XeN9dcWB+TxlKB0OsA8EisIyV00G8At9lIToBurdHOUrs1su?=
 =?us-ascii?Q?+2G1CDtIxbx/OXFQtSN+rXk7s9DEokB8XeXpCpsW4H8SsYOODexeGeMDtJKW?=
 =?us-ascii?Q?iBRgeyCwV2Vj31FQjN8TIfDX2foc3/w8uijQmsmlSU83xg5ZatUFDFOzhETa?=
 =?us-ascii?Q?/wMMNa6NXkPhdnHPKT5Sn7IHf/XO+QDUR8XXiSAf6Yt9g2O++O1I/kyTmrST?=
 =?us-ascii?Q?eIAIggJD9ydVfige15FdhiQX8Ek2yg8PRShZoQuId4Sikh2u0XUiJ4qafRSG?=
 =?us-ascii?Q?/L6aTsuZmXloVNu4GK2WoDqsI+CdCIII2eC+dbYDvVlVmY3O?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2927e9f-64d5-48dc-6d95-08de962a6332
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:23:13.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqOoj2+W19vPQ+n3g/Ng7dnMUMSDlC5jVH8zKHLMa6FJEFgmUtO/CxX/PSbk8RismrXnL8XbS5uadwKrJlDpDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	ARC_REJECT(1.00)[cv is fail on i=2];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102475-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[axon.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[axon.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[axon.com:+];
	NEURAL_SPAM(0.00)[0.551];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	REDIRECTOR_URL(0.00)[urldefense.com];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:dkim,axon.com:email,urldefense.com:url,0.0.0.0:email]
X-Rspamd-Queue-Id: AFE003C9B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 11:57:18AM +0200, Konrad Dybcio wrote:
> On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
> > From: Joe Sandom <jsandom@axon.com>
> > 
> > The RB5gen2 is an embedded development platform for the
> > QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> 
> [...]
> 
> 
> > +	/* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
> > +	/* Workaround is to use bit-banged I2C */
> 
> Interesting.. I was under the impression that it was only an issue on
> RB1 and RB2 boards.. perhaps we're missing some magic register write..
> 
> 
> [...]
> 
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&sw_ctrl_default>,
> > +			    <&pmk8550_sleep_clk>;
> 
> nit: let's keep the order of
> 
> property-n
> property-names
> 
> file-wide
>
Agree. Good catch - will amend this in v3.
> [...]
> 
> > +&sdhc_2 {
> > +	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> > +
> > +	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
> > +	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
> > +	pinctrl-names = "default", "sleep";
> > +
> > +	vmmc-supply = <&vreg_l9b_2p9>;
> > +	vqmmc-supply = <&vreg_l8b_1p8>;
> > +
> > +	max-sd-hs-hz = <37000000>;
> 
> Are you sure you want to overwrite that? The value in the SoC DTSI is
> set to half a MHz higher
This was originally carried over from the downstream workaround for 
clock driver ceiling behaviour that I saw;

/*
 * Due to level shifter insertion, HS mode frequency is reduced to 37.5MHz
 * but clk's driver supply 37MHz only and uses ceil ops. So vote for
 * 37MHz to avoid picking next ceil value.
 */
#define LEVEL_SHIFTER_HIGH_SPEED_FREQ	37000000

But I now realise this isn't an issue in the upstream driver, so I will
drop this in v3. Thanks!
> 
> > +
> > +	no-sdio;
> > +	no-mmc;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&sleep_clk {
> > +	clock-frequency = <32764>;
> > +};
> > +
> > +&spi11 {
> > +	status = "okay";
> > +
> > +	can@0 {
> > +		compatible = "microchip,mcp2518fd";
> > +		reg = <0>;
> > +		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&clk40m>;
> > +		spi-max-frequency = <10000000>;
> > +		vdd-supply = <&vreg_l14b_3p2>;
> > +		xceiver-supply = <&vreg_l14b_3p2>;
> 
> It may be that for this chip to actually be able to communiate with devices
> on the bus, you need to set the new 'microchip,xstbyen' property
> 
> see:
> 
> https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-msm/20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com/__;!!K76kBA!3JvIWVouSl6ZkbxojAFYUus-8UPRvjrHx0qENKOyIIBpZ9knecOfH0NCBAr8ESxNXg2H6982UXqs_8QyR_k9NuKnmA$ 
> 
Good to know. Confirmed that it will be needed.
Happy to provide a follow-up patch once the above series lands if that
works for you?
> [...]
> 
> > +&tlmm {
> > +	gpio-reserved-ranges = <32 8>;
> 
> Would you happen to know what these pins are connected to, and if
> so, add a comment (like in arch/arm64/boot/dts/qcom/x1-crd.dtsi)?
Yes, 32-35 for NFC and 36-39 for fingerprint sensor. I'll add a comment
in v3 so it's clear.
> 
> 
> > +
> > +	bt_default: bt-default-state {
> > +		pins = "gpio81";
> 
> It would be best to keep these entries ordered by pin idx
Fair point. Will amend this for v3.
> 
> > +		function = "gpio";
> > +		drive-strength = <16>;
> > +		bias-disable;
> > +	};
> > +
> > +	sw_ctrl_default: sw-ctrl-default-state {
> > +		pins = "gpio82";
> > +		function = "gpio";
> > +		bias-pull-down;
> > +	};
> > +
> > +	lt9611_irq_pin: lt9611-irq-state {
> > +		pins = "gpio40";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> > +
> > +	lt9611_rst_pin: lt9611-rst-state {
> > +		pins = "gpio7";
> > +		function = "gpio";
> > +		output-high;
> 
> You shouldn't need to assert the GPIO state in the pin entry node
> - the driver should take care of that
Fair point. Will amend this for v3.
> 
>  
> > +	};
> > +
> > +	ntn0_en: ntn0-en-state {
> > +		pins = "gpio67";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	ntn1_en: ntn1-en-state {
> > +		pins = "gpio42";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	upd_1p05_en: upd-1p05-en-state {
> > +		pins = "gpio179";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-pull-up;
> > +	};
> 
> I don't know if pulling up an active-high pin is what you want
> (there's some more occurences)
> 
Good point. Will amend this for v3.
> Konrad

