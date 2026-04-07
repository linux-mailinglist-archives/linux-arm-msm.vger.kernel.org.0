Return-Path: <linux-arm-msm+bounces-102155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7y2GH6Lu1GkZzAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA713ADE79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32C91306E83A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B183AF66B;
	Tue,  7 Apr 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="mTYIYErB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC23AEF50;
	Tue,  7 Apr 2026 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562244; cv=fail; b=KEz3joIkHW/FgHAyD6E8jJm9TpoXglpzJVKK6gtjySQAxPjp3xKnWjiEkNVF3Rivq17ZtmwLed78Zb1THsD1CzE4ajWDPQjtu5Fvt57Uh0E9B1OIx6AmhSMjT2NcWWybEyw8oBju9GZM4XJKP8VOkMJwuOaWtj9lhxPnZfzbVrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562244; c=relaxed/simple;
	bh=NNBzuptk/GyR5mw/vlrI8rRAY1Vl5EEf768mJNyYFEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BxIOiIF9gT2g485cBLCoAW2SdekaLt9862yEnzc1hcu4JVXR4+9qdCtZ7RoS0ssy/1+oqkRU0JuKY0SdkqOVVvWwumx6k/uReNna5OcImCG64FDRs92q1zuJSADSJLsRGHd2b7bAZi6jgyeSCf6zDrNjok/sWWxkpbzgESx+on0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=mTYIYErB; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvmQkUFPp7Zcjhe/ikj/ZlXxSg8yJJVOd55lqjRstd9F2pNmBEL+SZs6ap8sKkZbF9LIMmeL5lUHNYjCWj+5CyQG0ScWweJOX4seLzZb8krfpY3S53s4856sTjFmiPeAQY9DTda+M3ArAsnnIMvQCwnif9E3vi+jUz11wNXIqLjeH1wBPE3rSpILSNLYXh17z2Pn/zt97vcJAJpXNbJhYPxYLbZzR4B5/yyqljy40bh7SnXD9tfLY25km8kpsiWxJLZ87dzVl+5/bxmvJlSYnpkP1ERxp+ZLw6DKlLZ3o8m+lWopyT8vbiCTKg2tYaGqrEdpfHXk5iSw2yuihI/B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7IfR9HR/KeT1pf1fgn1D9HgN7kf5H33dR8Ea8vH3Os=;
 b=YTsHFzvvuEghQkidmh0Gl1VKgBEAcste2beA6mg/ZzMMyi+Y3gVY7zLPya2f8CemmBy6C4qC11ZUEBu+o1doNnoQYMCoOYza7JrXDzKBEJ+KeSqpTg5fnVLWKysNtf2zLGidEmMcPuKeZDxh/GrvRggkoPY4JMRZqYRYdE9ltNpkB/tGJFxjg/8Jp0zw93fngxXvMNzLFEbIQs7sgAtjb90tgWwNAAz4c2AkUakP+hXO7lMA3azARK99L81/8dY4qu5LHx5G2uaDheObPmC34gp+58Lr5HRHrHcT+9FA8pAj8GDRRnhl3y09HB6RJ2o0dYSqRW7tyLjCAJ4bjq9f1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7IfR9HR/KeT1pf1fgn1D9HgN7kf5H33dR8Ea8vH3Os=;
 b=mTYIYErBHIeiT3aMw068obaNF9DhYsKAljbJokOd0PSmH7yxi2SwopZKHfCTWPQAMOprXmpAfSeoX7XaZ1taqjBJ+5QBdeieEPUTxa3ixwz3uYTmIBgVQf+xomg+b5ElWBec8j7r/+gP0jCLqTECq77GxYKsPgeI1yiVUUBx5TA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by CY8PR10MB6828.namprd10.prod.outlook.com (2603:10b6:930:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 11:44:00 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 11:44:00 +0000
Date: Tue, 7 Apr 2026 12:43:58 +0100
From: Joe Sandom <jsandom@axon.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
Message-ID: <20260407114358.4xu6xdbt372ljk5r@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
 <ac8a4139-f7ed-4ced-885a-59145c188406@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac8a4139-f7ed-4ced-885a-59145c188406@oss.qualcomm.com>
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|CY8PR10MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 55421c1b-1aa2-48ca-fdf3-08de949af5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bv1TxEV3NzDsFYFHN85hz492l35Uy2ygqVj4Zq68aBRTw1h460kDlqFmaYydUrSzh7BnrsHA9nSVfJplcPW2xIXZu2qQOtKdgmyYuSugQ7cBLvzAvCwc4C9AMLS/ZbFqyjcvFbhKha9GFFz+6+3qlPzRmPCADliy66uXe/w5BFxX34rwQ3rUTrsRQzEyLoPXUvr+hrzjxQepDp9krtNKFVauoEYmiP1D5Bkg30wNyrIMeU95pcONbMxuVcSk7v1FpkeYm/OkS2c6WmVWUUPMpRer56IIWtBy9tt+aHfqQE26tTYBUarUSGtk1tfagxF75zavnFic+coyNElyyjH2zfjB28znmmsuqgKh7/rXC3+FgUZ1MniKxOBWo4gU6VqBj7LX9G2MEZxRoqqCl8U/7+DsS1VYkbsJHShlT01wH63nbG7qyE6GI+b1MQP5j1g6uvJy3+gaynboo9T991b+u7mNNTeLDRZh8IUZqnrDT6fTkdu3R8+PZ0V3/0MAKuL7n7pSsmQzAC0H8QkFaGibyEiQNQIugbaN2Z/nVZccqdtDgE8JLBxcMAz1npFZA3ViaK649rKUIt2xPykc+MFusaw3C0kimxfvE4aqpvYALalbnih6sbDvgXPdQW1XDtFovsEVJYDkq2/dDtr9g9CqPpLPG6YiM8PmkFtDC09GZR5laXvlkABX4QJaLmuEdJ4R6shB7nwnxnG/sqYGngZp68Y4S23I/DiJ8MwsBZndHAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i64yAOYCjUBZNpxXysJEJwVNGmQBW6zIxF/kL0ybGjMdalz8j7zC9ktuc+1l?=
 =?us-ascii?Q?0t83hpIA20koxlhyHufqe00+P3cHEC5eL8MFcoMlrKaB1doGSIIKp3lQ5Jz2?=
 =?us-ascii?Q?vxVqfH0TuIfdE7HqF5ArYGAxQptpfEI5USBUinUPoGtRrYfL5+AVvhzu/8mf?=
 =?us-ascii?Q?J6lnEx9s+Mv/+vZYWTZumaIVZK5cxSbqn84uj9vR/PgoGYUe5vZG8SDIxwxj?=
 =?us-ascii?Q?pPgbrZI6iu822XzzrXMiNxxWd9SVBGaoxzVmmG4F8BZ3/yQgwI056EkmjMQP?=
 =?us-ascii?Q?YXzZu7sC1Ce2ZCCT4rGpmsIahgbIVn9/JtgpsHis51Z87EP4Viln2Yb1sUJr?=
 =?us-ascii?Q?zUFMHJitu94s3VVL1rEjWTmEezOpYdjKLYZlQ/QZLhefVGaeHoBybc4Hi/aA?=
 =?us-ascii?Q?GaU/MfWoCvM6DOFsNVStN4UBX6nV2XjsXcsP6bAaT4OBpB3Sqvi2haB1OAI4?=
 =?us-ascii?Q?wqf1I00b5OW3JXd32QHWqd4uLnOiBfmDUiTNHm9KTSXac6+xuBA0Pox+4lmy?=
 =?us-ascii?Q?93+omDWAJISbe/g4TmI20+EMwILoM82e+FDMex0fZUrO+W4JDzM9x5xK4w/T?=
 =?us-ascii?Q?nwFOYExsQGxrt+QiAQKJn6+i/GNsh6M0LrrMSmPxWySb9iJ36IBpKR7Q3tyq?=
 =?us-ascii?Q?D6xUw8ThToYXUMsSAcIeHbu53ctpiaJaaSnGtf3aZBVC71g5F4GkaXVHYCA/?=
 =?us-ascii?Q?lt4A5DeAUhrUovIRz5kuJlelIG0BK+3JXas1P4arRltT/dsIlncNWrJnBZO4?=
 =?us-ascii?Q?wUyk/pwVwnzlfic2jByJb1g0zScxpZpsgEqnM23i9127WWlt/U+xXO//Qui2?=
 =?us-ascii?Q?wolIBcybJS23Oc5FjOr0Iw8JpNx0vGTsJLLxO6Jv1zExsxnSEod4fFC6iQ7O?=
 =?us-ascii?Q?vY39BDGLSeZ4S2wu46pT5NMyjI98xjUMzb2EI22t+m6i6REsI07jJ+158JQN?=
 =?us-ascii?Q?rf//+2pTZk3AU+I5BppSwDue0eokxqjPmDLXMpUYtOsVSntolsEUTnOr6hOr?=
 =?us-ascii?Q?pRe6I5I3HNbr9yGdmXYN/MFltbnUTqXHBZisaCbpJcn6g9AJ3EkcI/BIKdNX?=
 =?us-ascii?Q?FVhINYrgGkDTN2z5CWBvR7bZlJYtRxABW46NpY0vJcyhQ2ieLV3GTbO6uFJQ?=
 =?us-ascii?Q?4t2CSmaXEkLb/E5htwX19OU8DWpQjtizk7o9VW9HRhEZmKhHauuORbBpMu0X?=
 =?us-ascii?Q?0iNs/RWR3s8GaUeub7xYX1+Ik1DdsCYwIiuHa8iq7XotI/KqoSJ795J1+ywP?=
 =?us-ascii?Q?LcW1JCl5+KJOIDJ4JolbvdhFb1yAh5o2Im1PP/Ra6JrA3sv3dYlJyzuk3RiG?=
 =?us-ascii?Q?4e7ZnPeXA+TpctT1xshCdf41+7qudTEShVLCF8qWyk0cnVBJAh3Y5MokC5qX?=
 =?us-ascii?Q?PibD9hkT4nF0GmM6CPzxvXMuW08q5qQoni+eWOghWlFYPXyFBUZMUYrSDF5C?=
 =?us-ascii?Q?ChW0pzEYrSOwdmxaFR/OXEw2ZMwqgDKeJVxQJMSl/Xhm8ng1UukBRZyvj/LN?=
 =?us-ascii?Q?aAAxLGU5TggZfDxtGc9aCyhi2bLv67KAgyPGJCu/T11dF6g2CuDPd3hP+HDe?=
 =?us-ascii?Q?LchGMiBNkhfnh2ZUwMMENuwCJZUfJrBZfkjJpKn8D2u+2DgW9Qd078mRP9yO?=
 =?us-ascii?Q?CxhQL4SGWkj59BV0+JvPWEAGGZgcFTkxUp+b2zPV2C1mw/QTB82kNHnDhM/8?=
 =?us-ascii?Q?AHO8BiOFQAXOPBLq3qj/UaZOTY+FyJWEFV4AZ5q3zt47049G?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55421c1b-1aa2-48ca-fdf3-08de949af5a0
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 11:44:00.1102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6D94wXXqpNlVQS2aAoRh5UrakNZeQH7JuYy7lPlL8bZI2ydr8bepKhmT26YkZNxGkIVlmfO/niD5ZhbHBN3Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6828
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102155-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axon.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BFA713ADE79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 01:05:31PM +0200, Konrad Dybcio wrote:
> On 4/4/26 11:50 AM, Joe Sandom via B4 Relay wrote:
> > From: Joe Sandom <jsandom@axon.com>
> > 
> > Add the MHI register regions to the pcie0 and pcie1 controller nodes
> > so that the MHI bus layer can access controller registers directly.
> > 
> > Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> > allow board DTS files to reference them for adding endpoint devices
> > to each pcie root port.
> > 
> > Signed-off-by: Joe Sandom <jsandom@axon.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..d4caf4d00832d7f1e8f65bf2bc873cddadc42168 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -1964,8 +1964,9 @@ pcie0: pcie@1c00000 {
> >  			      <0 0x60000000 0 0xf1d>,
> >  			      <0 0x60000f20 0 0xa8>,
> >  			      <0 0x60001000 0 0x1000>,
> > -			      <0 0x60100000 0 0x100000>;
> > -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> > +			      <0 0x60100000 0 0x100000>,
> > +				  <0 0x01C03000 0 0x1000>;
> 
> lowercase hex please, both places
Ack. Will correct this in v2.
> 
> > +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
> 
> Since you're touching this part of the file anyway and others asked for
> more changes.. could you please break up the reg-names that you're
> editing such that there's one entry per line and they're aligned on
> the opening quote, i.e.
> 
> reg-names = "foo",
> 	    "bar",
> ...
> 
> ?
Will do this in V2. Thanks Konrad.
> 
> FWIW the reg ranges you added are OK
> 
> Konrad

