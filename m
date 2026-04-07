Return-Path: <linux-arm-msm+bounces-102079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DCMAivG1GlbxQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:54:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC323AB8E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01EAC3018587
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B6839B48E;
	Tue,  7 Apr 2026 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="PjhJEthW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340439A7F8;
	Tue,  7 Apr 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552018; cv=fail; b=mPp9aL6qPB0MFl69vK9H5sBbx6DbP3zjRe6bTn2lFAllXhq8j5ZTMkFv3BOn8QoP62GlEgJOcZfxgpx9B1fMjwkA7LAtnWCnVVEfJJ3NQfXZMMQipJZpHKIX+kefmFbsgyve8bxYIDwTwJ65Po87iZPbX/vKxMzgaIxTF8TWtlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552018; c=relaxed/simple;
	bh=bHIXtVDSywLI+mXRO181qLkatoq3MV8/ZtWSKPBP5lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UHl1dHQ0229VAlLP4dHP2Co6sqK//sH1dJ5jdQnkKO1ux9pWuCuHFB1YtRZxj5Yv0Eu4GVXKSaRZgFyGaMPZ1XMvnWxayiETXy8LxVT00hMUwf8Xmozd1PNO5Y1VlT04Ib5Ok84zYrZpZKjXwX0LHqY2FUAbxm+dYZNZh1lL9c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=PjhJEthW; arc=fail smtp.client-ip=40.107.200.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEAoUZyYjFo+IK4K4g+YhOkFWii1hsbo24YD1xYYo9YRu4/vk4YBmNMZNTaT1flYDrAwuG8U49s3lIVeuPvTo5tGaGjW4JMJEViS0xecZqjPySs65UvfWspOSkBc5fRwk1uAvwcFsMMXgtCIZW/JoPq9mpLpY0y4XSNFmXv3VmI+AFXU7n3g3j+/SV7B2zhtEz2MF0rQQMQrUcHZ/pgm2YZz7wrT61qs4ElcPpRFVVHvsU10uZyRcGg7ieZTNE80FgCKt3MMOrSyYdmoWmDhqcQtDWXBptKX/ZF9Np4yc7NlGnVZCyxa9/j6diusQUubEgA07yRR6th1pL99AAhpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txQ/x4w17xPzSbXE1UYjmgbB8uTSMXiM9+HVlHuRXGs=;
 b=x6atMDtRtJoXTk5zCtK5UkF/rXPHtrxO54r2ALL7Paav2mY19V9L6KOFibuXECl/7tzyIv9SbPNzCmVftDEaK9M3G+l/EzAl87oT0Ir4FkLFi6sIojV+KMuqYUodlHoSQC5oIJw1Z6UF2OWYMufoZzxswYRvMRaP/XTBaCGFdqnoPRZHS0mANy80zrLfozGRUxyE0yNP8enMGO5ktnrNSPbS8ZjvqOYgpHJMZ8YlM3uQ51Qp0En/L97s45jLTO/g/ZeAnScUxel5lL4csB2YrhUD5kHdVtVcXbLqZN0sH5SJG5bIJ57CrJfSKEhfxXF5x8kdesH80qT9nzieb3sd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txQ/x4w17xPzSbXE1UYjmgbB8uTSMXiM9+HVlHuRXGs=;
 b=PjhJEthW7Dji18StO6bKZbK/4EHTX/Xlmx3wtcOmpGBjhIu+73MomYI/4iSSOvtRLGWVwFDs3rt1dlSS8MQtm516q4T8GGlra1W7s6CXJejpJxzJAermI5zePdJjhRhFPDfL1DbtF0ZO9/vDtox08/Q/68x9UewRfYiilRwWTOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by SA1PR10MB5822.namprd10.prod.outlook.com (2603:10b6:806:231::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 08:53:34 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 08:53:34 +0000
Date: Tue, 7 Apr 2026 09:53:31 +0100
From: Joe Sandom <jsandom@axon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
Message-ID: <20260407085331.qnt7e7s7zm3fxowd@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
 <sdr64ldaoitb7rj6a7eupmqrsh47wgir6nkbsnbsv6bpftiqyf@youdquby6sog>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sdr64ldaoitb7rj6a7eupmqrsh47wgir6nkbsnbsv6bpftiqyf@youdquby6sog>
X-ClientProxiedBy: PA7P264CA0005.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::12) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|SA1PR10MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e125e3-a56d-4b9d-adaa-08de94832652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	T0c2ksVclw788lPSrQ9oirNPXUTwVvrHe2RjXEsY9+XXNg6jjI7bOE4JqJFc/JlfkptLDbBfJ9lTZWcUWb9KtUS9+GCcWFFxLJ9xhy5grfTEgxGNOu5/BX3KzVD8RswwNlwr/VhKiyTbhgA/O4MFoCCxE0Q1lZBSjlkbpwUCus+VSOwPqK4rkZsKR3hvknmrd+6GqLB1sePiD2ry+dISS7RdyuDiEAiR6+13fkXMcBi0yJJ5Z0aU/Eppiv1lkoLfeEpCtYZuca2Y249orjABySGhaOzzQ+oI/44/iJ9zjFFMiJ8Gd8QXk4DmVvXqEUlg+lkd6LrQ5+9t0udlbInrNk+W6o5SR04lD/qMySoF728roJCOLan6IuXsNXwML7tUnQiLmflwW4+1PiO/NKT2D01/5bPdcmTiEkMtwEmsWHSjNuW5LhXicRoN3GSwSpp6LA6JUdFD2wlrt/+hjccge5fEpNdUOxD7UUSFpFTba8Wl/mozfZ++EbYYG7DGpljpj8EplO3FCZiiwXTcrDgWtVhg9CqBE95o0M+lHmiZF3zCFHH9Cxl3/+8Rhd3EYgqvoZTCixr7VpywTyDdKupr8cAJPKbuhoPrYQligUhmiulQua8NIBYDetSPTig/6jL/Yuy98HST6RmCjwOcK46JfLLaYdTrw8u0h5lPz62vn+UNuqlC2ay9LiHp0aWCvr5uyW6YyN94dxSsqaso77hRvhjZYLPNaT9eATg1W42xSoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yfx/F9/d5npKiuOnIfQrYc7bhDAb5GcrDiBsos3NaZUWI3bj2W4Tpe+CPYyQ?=
 =?us-ascii?Q?cUA3kqAtWSftiZ6ykkQZ4TtJ3y3ldvBR/XPqzhkmwiSvh4DyxGScOkGq9rim?=
 =?us-ascii?Q?71VJ7mqNjOqgaMBLgUM/HlY8dZJnT68V7xKULfAhpMvC6/sSQ/0LelQwz3G+?=
 =?us-ascii?Q?Wn9iamvZmpQnHYEm6omYHImT1kMdA23zrZqutnv2CzAAXzQje6muzsXR7rX2?=
 =?us-ascii?Q?/4UUynuojVASK3MUU2ITh5bGnlXdV+IdsKCnr/5OphNcbFjHQV/KrFldrspw?=
 =?us-ascii?Q?XMvBbPf9Gsm3v48KhPSyv5kh/yE7VBWu/xJ6y/q+Wm8CWbu1BrXYWI36q1do?=
 =?us-ascii?Q?oDpiW6imIBx2eNJSuTxNg5IVN0R96nqa60KHzcKXN/ki96Q1bH9yKyqZQLu8?=
 =?us-ascii?Q?3mgj30XnryZwI+JqkeN7UG/ydyWMYm0gVHVvGP1H8UI9Y4PMs6k6GixLPcJ1?=
 =?us-ascii?Q?W+KEoSziUUw2M2eJ0OHCh+QzcI6muX6o9mu/ySMfaXU6IrzmLTlZ5nUF0IET?=
 =?us-ascii?Q?3gzWyTHRYXzxMF1c7fNi/Dyq3KW/Rkb8EM0AfYnS0uHaaEeqCEQU+QRP051/?=
 =?us-ascii?Q?HhFUS4IlJmBITwCqa7MwokjZFUg9DEONJe0ONr1PbEtAlzsscpArmrpKi4FA?=
 =?us-ascii?Q?YJ2czelGpMW2WDEQG3Rp68zD8DWM9ZTVZseA0DIFIPd5RY49eQIxvwxCFBMc?=
 =?us-ascii?Q?jIfLNlzkdmffD+NLzfHeRT0tAV127wqvd8veKlBu6qPSRwk4A7G6cM0YckmH?=
 =?us-ascii?Q?R6xe1xKNQedyKB/j1WNfFbEmRIzZm0akzAH1HiIK7vZPd0sbcjjwkKtM8R12?=
 =?us-ascii?Q?Q11H34WZIGoZFovngFLqNM4G09tOFF1ktQR88bjmRc0cjCIDEsJFnul7H4se?=
 =?us-ascii?Q?OgyLbJH8SZ3X8w5QmrJ0N9NgaD2KDmnEJBxUUE77BkhmT/rhXDubcb/vuo0a?=
 =?us-ascii?Q?Gte62P15qQpE5pUJgcZ70GyEjBG9RBiQzXOZRG3UAruSR28Uc7RdZ4nhRuaY?=
 =?us-ascii?Q?CcqQa8KbfZc7zVOk2h7RmVKXrPFqg2/2IkAqnB9MH3WYegVofoiKB8HF9/2f?=
 =?us-ascii?Q?mgyj85rNZVlvJml3HLUQwXHiZwHBKdzss28hs6sTfowRcm1N9fRB9KcwLjWA?=
 =?us-ascii?Q?/xj5uKjQJfeSZS2AhU8t8GrDPie+cNtjOLKr35f5NjxNRPq3MEGXU9aQqFCP?=
 =?us-ascii?Q?6VrjFzTjW56zjDzpgRWjXpIuZaZrqlB2C2rn9NSS9MJewB7ELBBANtLrewHf?=
 =?us-ascii?Q?gRI4gs6M48i9OigHkcSIRBUC7J9t5w29bJnTqoYbp1fgfht5OJcNav+nRqE2?=
 =?us-ascii?Q?WBESgIw1ehjSpbgv8OdWQYYitjaVGptfRMUm5ssx3G6CpIOqcBBV/kAjuc0v?=
 =?us-ascii?Q?dYkOeRcOGJa7jqDiF8/qzA48+wmPk9vIw7AUDmqy/mQBaSZjrqOupKqgtP+V?=
 =?us-ascii?Q?USOVJfzukGlls92kpsXLfLHsNmlHIdNTUffZ2dK1B9qn64glJY+FWCFhjt9/?=
 =?us-ascii?Q?MEimqFIqGkYYwput/9zu8/7Lyb90r30aCv3urz3kPQWdPuoYE0YCrufDvEJc?=
 =?us-ascii?Q?QyzetaN9vK4NkL1LFpZf4BAVXh/CMM+LJbHkFyaVgNgxT1kcCp+Q48WPGeAI?=
 =?us-ascii?Q?53SL4h/4gijdyPbuFTe8HIGBDOjBe+Te1Nf4FyijATPpJwpOC83KDM9sS5K9?=
 =?us-ascii?Q?qbZ76nnaUjpCte6kVT9VxEW4yiDsZyUIeEeSrDlJQgzxdlDS?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e125e3-a56d-4b9d-adaa-08de94832652
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:53:34.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fF9+Wz5BBdOMLdEvZ8NflssejUg1FkWtn7S79u4Jmyn66xtvDLQ/xkw6lYrFxrG8BLiRuJR0lGLCpfR5TYpxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5822
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102079-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1c08000:email]
X-Rspamd-Queue-Id: 7FC323AB8E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 12:07:14AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 10:50:54AM +0100, Joe Sandom via B4 Relay wrote:
> > From: Joe Sandom <jsandom@axon.com>
> > 
> > Add the MHI register regions to the pcie0 and pcie1 controller nodes
> > so that the MHI bus layer can access controller registers directly.
> > 
> > Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> > allow board DTS files to reference them for adding endpoint devices
> > to each pcie root port.
> 
> Two separate changes, please.
ack. Will address this in v2
> 
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
> Lowercase the hex, align vertically.
ack. Will address this in v2
> 
> > +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> >  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> > @@ -2092,7 +2093,7 @@ opp-16000000-3 {
> >  				};
> >  			};
> >  
> > -			pcieport0: pcie@0 {
> > +			pcie0_port0: pcie@0 {
> >  				device_type = "pci";
> >  				reg = <0x0 0x0 0x0 0x0 0x0>;
> >  				bus-range = <0x01 0xff>;
> > @@ -2138,8 +2139,9 @@ pcie1: pcie@1c08000 {
> >  			      <0x0 0x40000000 0x0 0xf1d>,
> >  			      <0x0 0x40000f20 0x0 0xa8>,
> >  			      <0x0 0x40001000 0x0 0x1000>,
> > -			      <0x0 0x40100000 0x0 0x100000>;
> > -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> > +			      <0x0 0x40100000 0x0 0x100000>,
> > +				  <0x0 0x01C0B000 0x0 0x1000>;
> > +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
> >  			#address-cells = <3>;
> >  			#size-cells = <2>;
> >  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > @@ -2288,7 +2290,7 @@ opp-32000000-4 {
> >  				};
> >  			};
> >  
> > -			pcie@0 {
> > +			pcie1_port0: pcie@0 {
> >  				device_type = "pci";
> >  				reg = <0x0 0x0 0x0 0x0 0x0>;
> >  				bus-range = <0x01 0xff>;
> > 
> > -- 
> > 2.34.1
> > 
> > 
> 
> -- 
> With best wishes
> Dmitry

