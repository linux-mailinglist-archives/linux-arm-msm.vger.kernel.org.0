Return-Path: <linux-arm-msm+bounces-102479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHhINqKQ12kaPwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:42:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FC13C9C1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477CB301B711
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C733BFE5B;
	Thu,  9 Apr 2026 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="YkmXeBMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966F3537D5;
	Thu,  9 Apr 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734872; cv=fail; b=ThkNWerQ3oBlejFrB96Xx2hAzvXOioc7bBnkOERTyJI4P0YawKCkA244B9iSaucWuErrAdyq7hSkt4CNaXKL6VFrCaePq5q9CgRKZjoTOqbnA9PP//f+uxeX2+UKI/a8XUahnDo12h+dGAsM2bLfzcgqawh8KG61GJY3dYiPL38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734872; c=relaxed/simple;
	bh=n9JkcIAGYI+5ldlICqYYRSH3tVQzk6NqAI5+9e0c9/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kxCcCE+hIOoq5MKPqnd1gc4ZahC5ZV5gk/7s1Cf8+vhwqECzffV+Qf0Mo88CW2k3QIhyhdGQwQtkvKUnu3VU/XbTmjfUIuHglu806BhNSvLS98yVJ4DmGJLnqigtB7suJARJkyAb1r5tBhzDdMkJlHRQeieHS5/LjL7gkfvQzy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=YkmXeBMN; arc=fail smtp.client-ip=40.93.195.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3UOxfR/MezqLe88GSLzuTAKBFBlOYPW1K/CUGVey5i0AK94+mVe1+Sl7pMIAdxrcqfIq8dHb916XZG2EP9U/14Qv6DPqRuGGFWSZVbOOO95uxhgmBA2HiQAxmAPSUm6Nz5oN1YBJFJtyL1fZSZSTn7GWQchy4orKZjoCv15sYBQcMBzJuXtIJOrP6ME8/SZy/l09RTXmdrFfrsl1KRh3tOK9JhyXdOyblT5T2KwARms5mzCkbYLVF7js0N0Ahp6wJvUwTQ7Ha+ZvhCNKaDHE7SRwmZK9k+gFtMRskUO5GRYMW9lQ7w7atB3pGLwDNFM+QPQBJCCh/WFxrswMYcPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YYPHay3sWJfbZ6gX3BLlR+NHoiQR4VCnH0nD7KGZsQ=;
 b=Osuu8SaXVo+VWuSGa9vmtiUrnvb8QDNEy3kzeY7svPsoy1Db1OYoMd5Z+QVM5XxnbJ8m0SOj+2SbRf7mWevn8jquY5inrEZsUq+fuo+kGd6oADABjhABhvtgx3OLBnkDLOgIh3nxXJjVjlO+ALm1ncdsCG5HkTH4DJuDp5yQ2/db3yKzRkL5zhT7U680CFQoQRSqD0GyIh1Tf6bRqc2oEl4ziRtSUHpEjdiuCHmY9cl7HyqyrBnI4ZkTsKsaCK00L0H+wOVLqTxh4GlFDRvofHlXctasrDVbbOKFoGHrEeUeys9Ek4zQ2sQZ/wJ06DdBuPRBvXq0tqkHge1H4LAg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YYPHay3sWJfbZ6gX3BLlR+NHoiQR4VCnH0nD7KGZsQ=;
 b=YkmXeBMNGLXadxh9rkYvm953dtRmfWgmtzI4ARUFB2RTrqUs4GTXwwiH1POwI4BU5pNX2hcZ5aMckgq+9EGxMM4AfcEUI2lgklxHGNOWSd/4H9wsqGdrxDydKViVemkmGl2T/kO1eQi5DeMqxP9KwG4Z8XAlo08pahm34HZdcvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by DS0PR10MB8173.namprd10.prod.outlook.com (2603:10b6:8:1f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 11:41:05 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 11:41:05 +0000
Date: Thu, 9 Apr 2026 12:41:01 +0100
From: Joe Sandom <jsandom@axon.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
Message-ID: <20260409114101.ta543li356mpv6q7@linaro>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-1-d0c7f447ee73@axon.com>
 <8ed5aeb8-98fb-4b87-a6a9-983e4fa91db5@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ed5aeb8-98fb-4b87-a6a9-983e4fa91db5@linaro.org>
X-ClientProxiedBy: LO6P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::6) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|DS0PR10MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6696bf-0450-4833-5567-08de962ce21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+qMVWpGc/RZr5ipyoM9COPDMbRYfy6pRK+sgEuroCSJMSgtZC4EVlQR+I/h5ffd25kxE0ukC6S2VsDzcW/4dW6eRBw0oGoI8MrY/O2bg7t69XY7KnEKwEpVY7JLOez8/d+WjkA823YVEYYdy5QXe46NucT5u4lCgwbc9wiy9ttOvOeMyZnMD+jLjtjQTczZtlDOiU+VBN2iD+ED3AtfBz0OT+1xMfJvR1mKOI1nDsVlQhkDjtdnlqLTE++WoPn9Wrtb1P/JhJAY0Oc565h6FIWr2/YSeig8NUOAJX+LJ3mBhsqMvHOqj5wMV/y9/HBFzK4RO/W9Bshuq5yFlM7Nt3Eh1PY8EiHnjXpo/79uwFaWWm9V7PDtlQ0OvQ9VYSV7hso7QjAcHvibnWzcp8RKwsjr2GRT0XDuhDz/anyuWLMBDBM2kkBG+Cmd6X+vqwz+3w09Ao7qlCTADdo45p3KokW4+P7j8AL6XAk+QdZGX+F0eTfEx5fb3oGgr55pxUEypSL4DiQKGt2Ov25r6L7rwBb34rEkrObwYL4DmVT4RAjQ8B8xSJMfGUz2tY2izfr/L7K60u/X1Fk5eDB4bO3SIvy9AcCcqmC1u3fqPJHkPWtmCMCs7Yr2E9TZCxIvWMPYoRVMyYUoSfNpImvVamCNcBXstFOJwV8oAK0S8MDFZJP2G8y5Ls5OsXDlGBLqjjNlR1HriXZkn8Cr88CMXpF1lXt3wFq0q59H/449FKCBMT9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZEgKIlsVu5L/yoZOsgz/GQmRwU+MjGUjN/97WGV2Ttt16cGhFaBUvqaDvppN?=
 =?us-ascii?Q?vLhHezmh6Qk1DZVWn3vFYzAp7Ctca0xj09pV2JDOKTiGzK1RxPorFoXm61t8?=
 =?us-ascii?Q?tFlNcnWBsL2HqOSPdqNln3B7j/+ywRYaIT15e435CC79Pxu+U5OBZo7LvLP4?=
 =?us-ascii?Q?9NAUcGjlHqfsZSTt+e1ImWJB6JbVY2gXJm1JkuDvVOx29Hw8dgLeS/PyAdPd?=
 =?us-ascii?Q?VgFn04GxCSalAK75AlUvFLi7NkHFbLqtPBHMjNaIYfoclviLmpP2ctQs4toj?=
 =?us-ascii?Q?xNdMRDJBZsVTVKslAvzsElA8lj5wNRGHfaDhbo043KoyH4TX6WFxJH6/EDym?=
 =?us-ascii?Q?xgbfE5INJE3ysouY8XKcb50Y5juY0OH9FcgvhfNUA3Sl1FvSg1fnKgyGynmn?=
 =?us-ascii?Q?SQKfJtQz3ifyrTQs8xwQ0BFQF6icmNQf2LO4WLWoATxFKmKKJ4JHvir3kWR3?=
 =?us-ascii?Q?3OsYok1dYRgXC/zRZa+zAXiVZHN7kezEgaiqgl26N4hmTJgFDpnDISMu2Hia?=
 =?us-ascii?Q?IilxLf7ZURDCLTuAQqhnZ11RHfo7p9cns6pYu/5czMyWyUafGNaYOW85+Alh?=
 =?us-ascii?Q?KoJON1glb9FHcq1ckDc3Z+ILGlTmE0hR0Ia+lEU87OFr5Cs0SjSXg5EhZuh3?=
 =?us-ascii?Q?79foyiIYa0JJxdmBOCVwrTnpAvdL8Ai9S3eTA4EvQrwxgn/exF5+z47W83P0?=
 =?us-ascii?Q?asBClB1n7YOcOoIc6tin9DdlPB1j0VTxlmVDPmoEX5IlPjMjCaUp/L1fwqIV?=
 =?us-ascii?Q?sQBFO1TLyVMF0hMLhVwhBpjFZFixf4y3ouZTHBGP5xGUYVKx36zw5OEU/4zB?=
 =?us-ascii?Q?Ri9aQ8NiEWU5b6OmPRM8HTO5BycP4oOtqKF74KZqtEfFq4yPDq0O6PLfSC3B?=
 =?us-ascii?Q?dm9JVAGbm2R8DCDsuwU/8kUdB3yzJjKr/PoXR3QFF4Cf4jSt5ZtSgSewS6hl?=
 =?us-ascii?Q?bCSNNkBGSSdLbVICKefgSEhsm9jM6jm6A2rIUBfuPvwyLG3wv9HlYL5KLiQ3?=
 =?us-ascii?Q?vBk7DXMP+WK4W8GMzecRrtXzrSf+OUSIgnU7Ejaj25W6khZPVVVu9Bd/t5Vk?=
 =?us-ascii?Q?c3Xh+AyRDn5+uIOh5FGc39FNtm33EdsZ+hRoukMmfK5dYvm4btFFOp96X6S1?=
 =?us-ascii?Q?bgoPRpRxxdzXC8Y+GpJKCkTs4hD1DZsgeGzOPm218o7B4d/3WVf+Hchg+Qjr?=
 =?us-ascii?Q?N7uwSpiZdJKYc65xOnzneDuzMyahOhmdN2M5whl8Er8HST7+QTWajYdixxHq?=
 =?us-ascii?Q?fvEd/Own5aAuYzl4186IAfIOJFvOidNSqjc43mHwhAh8kDyjHV8Gigf2sv2Y?=
 =?us-ascii?Q?foBZz6WClPRa9o4g2ICHMIxmPAIHUfTXheoMyk09EB/t4cicpkJiXKKsVHkl?=
 =?us-ascii?Q?b433CNdEhP/DSaETcesT4VIUWc7m6mwFz99tWCpyLOR8XhPW04xZh1Hogf5M?=
 =?us-ascii?Q?2721shI1GBeUOix/H1juJPUbiQXQSHB2QfSprokQy0WMt10wuda7MlKemc1W?=
 =?us-ascii?Q?+rNPBdW2XF9GvLtkyIGJOssNT6k5WAaMHCPp6zo3dB7UCtHUEsF9PqvcbOkF?=
 =?us-ascii?Q?3qOVMZ100T+TOnmDRYtUu0h4zY2moAp7TE8nbgpeRYbC1aKeWbUtnnYVEKEh?=
 =?us-ascii?Q?R5FUv4AzMiStPZopFCntBupIdi7BtawX/+jzrOGkJPk2Tz1oy8JYhlgKNrwe?=
 =?us-ascii?Q?2qxtk7pa7jL25pR5LCipWabmSYYvwT5tEkQpnxpzj3nfrhMm?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6696bf-0450-4833-5567-08de962ce21d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:41:05.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8X3W+91toOKTZoDPs8hs5UUeP7Gi6j1Z2QR7zttyjUylDDnFzz0PSY/5BAd8vpWIIf1E8unq0wCQzDcKiMNzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8173
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102479-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1c00000:email,axon.com:dkim,axon.com:email]
X-Rspamd-Queue-Id: 88FC13C9C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 07:38:54PM +0200, Neil Armstrong wrote:
> On 4/7/26 17:46, Joe Sandom wrote:
> > Add the MHI register regions to the pcie0 and pcie1 controller nodes
> > so that the MHI bus layer can access controller registers directly.
> 
> Can you elaborate more on that ? Looking at the current implementation,
> the pcie host driver only uses the mhi memory zone to show the transition
> count in debugfs.
>
hmm yeah, you're right. As you said, it's only used for transition count
currently. I'll make sure the commit message is clearer in v3.
> Neil
> 
> > 
> > Signed-off-by: Joe Sandom <jsandom@axon.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++----
> >   1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..055ca931c04859f3a312eb9921aeb7a8cc676822 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -1964,8 +1964,14 @@ pcie0: pcie@1c00000 {
> >   			      <0 0x60000000 0 0xf1d>,
> >   			      <0 0x60000f20 0 0xa8>,
> >   			      <0 0x60001000 0 0x1000>,
> > -			      <0 0x60100000 0 0x100000>;
> > -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> > +			      <0 0x60100000 0 0x100000>,
> > +			      <0 0x01c03000 0 0x1000>;
> > +			reg-names = "parf",
> > +				    "dbi",
> > +				    "elbi",
> > +				    "atu",
> > +				    "config",
> > +				    "mhi";
> >   			#address-cells = <3>;
> >   			#size-cells = <2>;
> >   			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> > @@ -2138,8 +2144,14 @@ pcie1: pcie@1c08000 {
> >   			      <0x0 0x40000000 0x0 0xf1d>,
> >   			      <0x0 0x40000f20 0x0 0xa8>,
> >   			      <0x0 0x40001000 0x0 0x1000>,
> > -			      <0x0 0x40100000 0x0 0x100000>;
> > -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> > +			      <0x0 0x40100000 0x0 0x100000>,
> > +			      <0x0 0x01c0b000 0x0 0x1000>;
> > +			reg-names = "parf",
> > +				    "dbi",
> > +				    "elbi",
> > +				    "atu",
> > +				    "config",
> > +				    "mhi";
> >   			#address-cells = <3>;
> >   			#size-cells = <2>;
> >   			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > 
> 

