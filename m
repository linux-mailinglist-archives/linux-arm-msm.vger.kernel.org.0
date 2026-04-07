Return-Path: <linux-arm-msm+bounces-102080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG8vMJfG1GmPxQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:55:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAB3AB9B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9494301A76B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE6A3A5E67;
	Tue,  7 Apr 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="fMmi9sER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B73A5426;
	Tue,  7 Apr 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552116; cv=fail; b=umPhVlgdnXZR43Q3oS2zGcISOfaG51fzFxCA3Jerb1Wi1YK8Due6VcFLdatSqXEyoS7VKlNyQzIudDvl6Njf1qEyKSLOt6Qw/TZJ7Gd8pQgD8KvLxkOWnKHAE0Fg2vJjng2ykeqf+IW+Vzm2MBuPF+TyeqwjWeRiGhWTl7sq4HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552116; c=relaxed/simple;
	bh=esythQVuryoUGRLBhz3pXJLj+QNuOFSiBTryFcJRaDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e2LFUrxF1/N5het15vH/DtGShnXL+PbByleLK1YZZhgtTgTRleAFwnUSY8UqpOgsNaCcjoOBlKDAFTRpf2M+7LCJJ0nb7gLMAbyJDQK5YaTAwG/LMciQR/e6MiMkzyIZXQSouylMBZ+CAFDFoav4gWZNW9Bk3/EFviKkIAHP/84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=fMmi9sER; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7HU7poWhX4sKhqzicMYToFngZoGx++IcmSBQHpm8EemMwQ3ZAQFG9Z6jBtcwBW6Kecu7mbXmVNn6yXz24UsTGysQYbjs7trXy5HD5P9VcGp5qXc0WnnvIuePI8WSKyetsojyZEMDMDQUa0srJQTqguoXIXDiIU4XnlsBMO3umlbaV+MKbMJHbZJi2F/RMktoUtSMbfR9uYwoge0LRf9W6YLqUvouiXmirk2lyisEk1P/w/Pvsabj/guQ5HgMDFIo9iQUi2iVH1hVEr6gIApWBaTXAnSH2/pVXldlyzES4Xqd5dc5/QslG6xshXHjihbSWdiFkfh0UYvgGIb4vMCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DMXxUb2qfimVmzHc5JIj+SRl3Y8VPYuJYSJYPOeDpM=;
 b=KU6TEoMbjH47P1rKHFbTct62tj17MIw2ZnG6JTZhmpTvaaLUcBppUWdB8IdYUd0SpmTvcKAlamRyJBRQvh5ji+NV+LsBI7z1moPQcJN2UOGnOC+iGEaRfBOOZBs36+D7Usm52z0RJTETovhNhHHrzww9c7ZeZI0vVG6gVscMiu/YPl9RmMCZny8BPPjf+mQqb29TRzKxeoE1WThU3rb98XgwEZFqWmGJu1XCNhjff52jEfA+D2z3XaOaYZkhwO/C4tobPzFfCMsSBNW9CAhSq7eTrXuhhYS6PgcCxSunlrkp0+jJrcw+t2uVLdqWdOJcN9D1Z0aV61W+SnaR3l2iVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DMXxUb2qfimVmzHc5JIj+SRl3Y8VPYuJYSJYPOeDpM=;
 b=fMmi9sERh/R+A2UQdm9YQXWmnEPY4TudTXybL2n5up8VDvPN0hcwyOKHckIDaAwiGeqIuLsrH2jx0gcGBVWb00a1qioTAzjKo2Ez+0stMc4zhThTViyPsMGT3Wyp0JGHypMBwQZLZ9CtriE3AZM1d3HbUxBH2pGj2k8Njr40C0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by CH3PR10MB6786.namprd10.prod.outlook.com (2603:10b6:610:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 08:55:12 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 08:55:12 +0000
Date: Tue, 7 Apr 2026 09:55:09 +0100
From: Joe Sandom <jsandom@axon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: update PCIe port label
 reference
Message-ID: <20260407085509.hryxli4qhjwipfss@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
 <bzbxyduvwlk42yj6mchu2denfvhqemahdeuuwxgzpbz52kmhn5@roukkyhpdbwf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bzbxyduvwlk42yj6mchu2denfvhqemahdeuuwxgzpbz52kmhn5@roukkyhpdbwf>
X-ClientProxiedBy: LO4P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::9) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|CH3PR10MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: db61ee98-8c83-41f9-2fb5-08de948360d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NTMdcfnAMBuy6h1GGYv71P1Zzf1DAOfFEOl17PeXwIoLeyDw5Xl68OXxgPeA7KeV+3LYvDrFtcEy5weFPYdIckOHg6lm/TtnurE9sFEryFWqdqhAX7diy8vX4QhJ8d49J57ZF1DpfVbH9uAqYjbkGyzgKdJ33MxRwo3VQEeflR1ndbSahyF8cIBo/hNeCXyaXfnBAFiUX2ahMGJCxz8xbkgfDRCoagJAO8UvEwtzhLYD5ZVYrymrAxwba41SoFmJDJnVEhgyo3uD/KiseGVQJ5gTdcIfYHN/Nf1NY/2KQIvA3IkUGDSUMVtZU0WbO0cfPAuN30Gw2KreGReQukuoeJoXk1AJxULUgch5lnZ9BhbOaRhVu9v/9Ix1G3GHCCbyW/JnSjXpLZTeGtgbHCX+vL9ra9XcRWIrB5/tgJsQTmIwVre0e2Ubvk/iz31CFZXeTsM0XyDzDKF6DK7Y7c1+JXHxl0vdgXwtu2kOqhLOJBnWdnzWbXF9EwaoT9eV3BDSSWZO2rss1LJvoTHFLdb3VUP6gYeP99oLqvXJwV12Zimw2e7DJclOJPY6hj+5W546BV+xq574VBZfK1O+9ld2FUH+D2k5eApgRHejGevinXkv7los4UIThFA5d7II1gfdreEGEphW5kJFMWD0DzccxMUenuKILN+ivykhAMHHrx9JtPKpPIoI1A4X/bKBrkKKYYmYyJqkW+wYZ9PKvOzMosOcuCTDDBUmwJq1ERJbr28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MxPdXSiwdNiHWRVnsAFi2SgpezvLGPLgvQ/VnmI/jIwgeAcz5af/jsZ8sosl?=
 =?us-ascii?Q?Zvo+D2SR9o+6iqX5BNe3cX8czfZzfpWxdQhNhrtBSruUyxjrW5fuCq2052LC?=
 =?us-ascii?Q?VBcAlj9vp8OpsW9ljWzvJ9QmGHW9pPuBu4lHwReFLBmUx0iPpCw+I22MY1we?=
 =?us-ascii?Q?yZByU4PXyslEoO6qEzs6geMkcR1IQCQTrw0YrHHs7oesWT9/m+fqLlZidBbW?=
 =?us-ascii?Q?KV8wkl4lftvnf+n5qm2ejxJfvkf/YEYMj/aDaa5ZsymfYWLjhtSdLCc+MLzw?=
 =?us-ascii?Q?eXQ5NK+qROFIzQitBUAnK5n3Vi4AncYEqNPvjsbMp3S8lBIPsT1MFqoHxQXV?=
 =?us-ascii?Q?B8TU+q9IkPAsUvk6xFKFYiYKufogGLJ31XaYNcpoCPjI+0K9oWqve5HEfcIs?=
 =?us-ascii?Q?AZdkS12MsSU3dLJcXOolY5s2jKppMcTuD7+fizoNUosu0FOiDaMh4t2tLT7y?=
 =?us-ascii?Q?fRF8T3SmDc3C4lBMPk0Nu7M9C0CFJBMDmRzYUvzXOlWyYvXZkFsZiwpZ90w8?=
 =?us-ascii?Q?hieeWKV4zK2v8HLofAQDq9ochqmRppNwKXxHfu1NZ02Hbevjbi7/sx0yrPOP?=
 =?us-ascii?Q?oYJQF1GszZ27lN0R3ybeDi+vNwqHMpRNFL81cQ1VWPaQ0XJMgBp4IYd5yJrT?=
 =?us-ascii?Q?teRZMr8gcmLzDWzOCrOGgURWUinCL/j2Qu9nzm0vdU2rwas6+PMyKPSu7IcZ?=
 =?us-ascii?Q?ueD5ygPHXpsSyBflcky8ZIvjiKB6PwWJBvw4cD6gb83wS2G42DQ61TOit9F5?=
 =?us-ascii?Q?O3LCe4d/vdJMu9AmLHBqHlhZVlkvhREhil/ymH9klPouMf58VD6YIMD6Z4qV?=
 =?us-ascii?Q?y2MjD3t9Wq5KNnq5cdlQyJe/ff+j5gIWf88IrD/abXTOVC6yUU9oKNm7N7/4?=
 =?us-ascii?Q?8Od1sVgl0s0tNIL+lBp0bcSr1hWgzA7gTB8X/b/v6IfDcHZIkWL56vqcUSjN?=
 =?us-ascii?Q?bZ9wRwtmvD3OICAYEHHn+BhOlJQMhKRmU6c8KNPHpg9zxdbVn6F9XSJEJG5R?=
 =?us-ascii?Q?4jnjmjE9MkYwlPspx4KtJIaS7jApLYXGa/vBVx4zdsrTrbPCuA3rPUcrdZL9?=
 =?us-ascii?Q?ItZO8Yau/Q38gGJbSuG3J/At11G3tj4VJveOjtU7xA5MUHReA5/C1JMtrTCf?=
 =?us-ascii?Q?0koORbqfrRtqLuzfvgWpgnqK9T2uh9TX3b3wJo4hC8aI1e3r3hM8mDoKn5V/?=
 =?us-ascii?Q?9yNerTKdmCymh0EMSkSq0uGUsyTw+uv/Ck1rmbz5cCaYss6aHznnN2H/s2QX?=
 =?us-ascii?Q?7jPQcwXQPJObGAYQjcf89NQZVfIiRiJ3BdBTMX45tangx92VpRKP4WAmUbAX?=
 =?us-ascii?Q?fk0A48YHwW1ONgUg0ND1LnDa01JvGGxfKVa0OkHRUJhZYlusvhFvqzx48Eym?=
 =?us-ascii?Q?8royPvEhn+1ydXwKUMn1P9NBco7iPPYl9NhFWS8lT+917MQ0BBDPi4tq+6jK?=
 =?us-ascii?Q?YzS2CtGxf3qvWP+Hv78IKc/o43pOeIoK3uF0ibA/mK9+kBmN13bym6Uo8uVh?=
 =?us-ascii?Q?kIRZB2zNzXOWwqyETkxM61wp4hVICIaK/hsMWmEFIgo2+i24giT5+9wSZLj3?=
 =?us-ascii?Q?RcObrpWvRMLxzexxQ8O7na9YCOP5h6BYpbTqTt063+sKFp3lTdhGYHmW2KA4?=
 =?us-ascii?Q?G8HKeb08eOr6cfFlEbsZzATxkooHfobdzePwtNa4knGhKB6DL0pr31YY6U46?=
 =?us-ascii?Q?S5ErODQscvt0KHcE369nkRSZwUsWOUdNW76hPVSTlka5GZlm?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db61ee98-8c83-41f9-2fb5-08de948360d6
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:55:12.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0kpsS5Lf4azW/8iA/LsHClzbvLLlgYE2C2deQKoWr7au3s4RE0bsXy+1pdmIgBGpzhECyJ7u9ze80UIjagHvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6786
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102080-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,axon.com:dkim,axon.com:email]
X-Rspamd-Queue-Id: 8FEAB3AB9B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 12:07:39AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 10:50:55AM +0100, Joe Sandom via B4 Relay wrote:
> > From: Joe Sandom <jsandom@axon.com>
> > 
> > Update the pcieport0 reference to pcie0_port0 to match the label
> > rename in sm8550.dtsi.
> 
> This one (and the next one) should be squashed with the port label
> rename.
Thanks for the correction. Will address this in v2
> 
> > 
> > Signed-off-by: Joe Sandom <jsandom@axon.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > @@ -1012,7 +1012,7 @@ &pcie0 {
> >  	status = "okay";
> >  };
> >  
> > -&pcieport0 {
> > +&pcie0_port0 {
> >  	wifi@0 {
> >  		compatible = "pci17cb,1107";
> >  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > 
> > -- 
> > 2.34.1
> > 
> > 
> 
> -- 
> With best wishes
> Dmitry

