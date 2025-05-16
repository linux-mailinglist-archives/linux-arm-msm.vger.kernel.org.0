Return-Path: <linux-arm-msm+bounces-58154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDBAB9343
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 02:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E0918918A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 00:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3B979CD;
	Fri, 16 May 2025 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QT/YnIUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BDE4C9D;
	Fri, 16 May 2025 00:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356107; cv=fail; b=DreP4XV06kTeRRgInPjHGyXQyVpXvfUPPqkUk+7+iYQWFIJhkzvKNfeuCjs/0T7l00M+lgER+TB/PZjU00SKKxck7YZo7UI7kjBYjs05OXPM7UDXsEsRUfIPv+0PiYAZeMuN9RQybJ26b2ZMD7W9ymcJgaBOt2t1+KAQItS3s2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356107; c=relaxed/simple;
	bh=8GXnX3qFh07GcjADaKKzo1aNzVXnJdML+kgAv9tw6Q4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JpnsBrybEwGNSOmGROyLrFYb09ESAybQIUKntaRnRdgv+9cQKlWPjuEltz+icLjaGsCS3Nc5fumpFo53cA3yxUIe6ZB5jTj1Odj0g8eFtCFeIDO3J0+hAfLcbg+wS4rczEXZLMpgvQnlLb5Rwd2Vk4OGpkDJqJRxCe8BWmN39Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QT/YnIUo; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIyg2LniTbFwEOWjzMve2Jmx3hYRCMK/xEMS653GBEhdqZyq1KkUQlhmKYyGqvotaBFHHoFgAlzddqj6WtZE2Fhwd+MKQupVNokTG/kejHWAVbh0Gbyfeff36QGesA4jsixzmnZ0nKrRtqkxdbcSEvj8tMFMTmm+vz8mR+rAAUPbddObR7oP+UUQb0nK0iRO06hw2YUuhE1le7EzUFEN+CIxI05AB/pTJtwkd70TMWLgeZ9crgnQwaKtAr7w76VVYI6f1nXfqltKsZu0cdPNfM6yOYEBke5WtHr5XoqRHCcHMZUqBMJAqhQcmpCVksHcV4+VdIBqqOtAnRJlocLg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok3eWNxtRYIeBYH6hFKE/Sg444mGiBpU7iAOJXyzF+Y=;
 b=szRN+JlPn84Ld8Zqgo6qz8psPnS5FyrZ4t5fj6K+RJUYFLV+m3eHEGd84kAUlRLt7tEJDLJLNNfzJoi/UsLxmELV1e/UVNUc2KLE4SNzQbBt1lPilMAZgpoiDS8q9IRvs9uNTeEeDKx5at6FRCc60bKxSPqi8mMMPa2MsTrGMqQdquOEFNV0+e8YajuBTrmXlAIrcDDmLCFMLnyz64HxcWXnqt8y9mOG9nzzsat1DPQla/dnzl3jjJ9jgg08gqctncorX514ZAtOQlDKGxombr8pdMNqxtF82fXjpfdjmggt4+DSQmpsmOLi+FedmZQLNG9Jr9iZyVdCa6GSZBwTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok3eWNxtRYIeBYH6hFKE/Sg444mGiBpU7iAOJXyzF+Y=;
 b=QT/YnIUoNYekFMZHmsUs10nafo3JwCgsjWWjorb4esd6+WikZMUfDWPqgIvHQFlUZClb5v+xZP4PFO2mnU7pd9Z6OHBOvXuB1CTP5wsYywbCWOgw7yzr9BZTDCPVsTaR4ug528AwOm6jvyqlBoRnBspTsGK9gY/KIKuH3Y8I7YE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11293.jpnprd01.prod.outlook.com
 (2603:1096:400:367::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 00:41:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 00:41:41 +0000
Message-ID: <87cyc9tmii.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: qcom: use drvdata instead of component to keep id
In-Reply-To: <aCWcLfJTkggghagV@finisterre.sirena.org.uk>
References: <87r00uy57x.wl-kuninori.morimoto.gx@renesas.com>
	<87plgey56v.wl-kuninori.morimoto.gx@renesas.com>
	<aCWcLfJTkggghagV@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 May 2025 00:41:41 +0000
X-ClientProxiedBy: TY2PR0101CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a05d671-9b78-4061-66f6-08dd94126cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4lnus/yrl4sx6e+DKfTz9PCtOMO1QF54zy/XgJ5byhgCPyeOpIRh4hH8jtVX?=
 =?us-ascii?Q?HAz1DJQVr8bhMHxYxGJEeWQkatRDlqn3KjRVZJjNgibNXsO3ZjSYbN1re0Ze?=
 =?us-ascii?Q?vP7JAdwZabTvnlWMG4TdMvLUch7zTNPLZ9ecOP6TbXWqPCaGCJN6n0CTw61T?=
 =?us-ascii?Q?Uk1/IAobhD+LkCPxRVPTKZx4nYrm/W7RKvDCAUxpbeW8JkktZYqStTbN8xI0?=
 =?us-ascii?Q?YPXJ1nUvqULmoA1rONFhWvSvU0pIvwsZ2nVebh0A1EEBe4xv3nTPCIzxs4uL?=
 =?us-ascii?Q?j9bU3Yd67s7he0252x628e8qYM9gMvZ/BNF0xEdw1hdvydFNH6rum02jw9NU?=
 =?us-ascii?Q?CFoDpvIxIH7IyKd9+rxtFUyJ97cfk8Q+A54OlDoHEAt9sR0PYnMLB/R4wBTn?=
 =?us-ascii?Q?JYvmEPUeBFJswuhqMY9z56o9L69BULlS1QGv/K6ASwRvEmD24GdCt1NwCxop?=
 =?us-ascii?Q?712blSjqP6t+9cmfQqYcY8qZo3tD7QV1hbC+XwiCYo6XuqirGsvhOiD1pvUl?=
 =?us-ascii?Q?zqk8gjEPihdZht5Mp1Z3puPjDhiV49AFwJIHRCpD2Ba0BZKx4JQMBYc1kmcX?=
 =?us-ascii?Q?wauV6P/LMWgoqetVZv9zWGME4LuyLltcCmOHUPIvgLw073bXCYoUMYgym4Xk?=
 =?us-ascii?Q?7V96a8B2ntwbnnMEn2wvgwmgcsURrWqyEa5MD7/xdXFDRpRa98Ljc/uc5UCm?=
 =?us-ascii?Q?r/9axO/DVABcg2W4Xtzt7rL5lG7YV1me6vQDk4Kxe0zQgFmRYmYEw1J7gc38?=
 =?us-ascii?Q?glW7s5yW1sZjDP7tKiphyiqb8ddytyvc3RCj2IrmOjOrz8H6Zj9IBLrAyuMe?=
 =?us-ascii?Q?836V5IsVJNFE7MzICQAbhsXnQZ+5K6P5Ke3lGlykvn0i05WEWurQ817Yc857?=
 =?us-ascii?Q?8VLBUegaC15NR7F9mp33I4wVaLFomG+4LsJmKDebVNhfn/aKVJE0Ezbo4/rJ?=
 =?us-ascii?Q?Ivr5452VzDp5Ezf7v5Ladg//WudKtsp5uTclpa4+eU3i1dQlHJxRqUQ6XQiB?=
 =?us-ascii?Q?IsEHI8yfDxnIoAXbfXAevUmlFQvFJwMXtA/70VtrYThQ8wqtfCbnMsK7A/ir?=
 =?us-ascii?Q?VmDyxmjp68EMOX3/h8gaaHfUGsaFHfPTFkSQdGIkH0QaV4Gu5dpLieovKFCC?=
 =?us-ascii?Q?HVrY99q7Slcm8paDqbiKJaFaMMkRBBatWlYNYKWmxU0iweye3FZi3vyOuTLF?=
 =?us-ascii?Q?t5G6ciSWXosnQKAPXCRcgiKI8NfiXS4JJ3WfTAXzxYs3PNFKlk/hbNMOZPXF?=
 =?us-ascii?Q?xVSO7c1TdGNBsClRRPYjzcFbn5q867+R2ZdGaFZa0wNiio/nWnWdisNHYpAL?=
 =?us-ascii?Q?4F4C2k6NnNfHfSp8CZ+SQRquEzRV5RsKwyQdKggPDzKCgq1tAaKwElKZlWuv?=
 =?us-ascii?Q?Fwedowa3Q+Y/ZwsqR5Tq4vfISGWRABglB05A5W4DmlvrpZz7ZFPQoA2V5xms?=
 =?us-ascii?Q?X5NI3yn8oee0KEwUxa3P/kwkZbixd02qZtBHurq3RLn7Zhaxe62CdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6NMiF79hGKNFcwQ8fi5AhL594DhjGpxBI0L1n8UbOn5/D/jyOF4qR909NtqW?=
 =?us-ascii?Q?gL8ubEFK+O5MRkcBkJCAnxdtkbph0kdf54B6RoeiZxtXyGHnWiocr2A1uwok?=
 =?us-ascii?Q?FlWblp1zAtBbOZo2RIVuaZfMkJkTmEUDGMySlkQGMOTqaci1i4tAYaK87wH6?=
 =?us-ascii?Q?W3YrzqNX3Z6E4n+ymxDYi6Rm26Nn9Yea+qpfAsjLwwPqBeCU7/fQ4qgzwgJ2?=
 =?us-ascii?Q?TDDRqUCsGav4NfSbG37q6CnMFmYPosUqj28bLySwLqY5EO6skyPAu+GGayHp?=
 =?us-ascii?Q?9wb/kPgyzIBEfl2qn4qLtBRcPuHsCc4A7pbYrAquiPpkBPdYm+O8GW9OgJVi?=
 =?us-ascii?Q?ATF9SxBlhnTsDBNofyPDpp0JtI1aiht+ZynhjhpKEZyE1FDTBWmCrwlh65ip?=
 =?us-ascii?Q?gjpTt0gJkHiqIHhRc8PRSuwew5td8rkdTbF0J8f2Iwaepd6tbsV6LnlSE1VY?=
 =?us-ascii?Q?R6G/7PjdcPD+UmcQnpv8khBtdbBGqH06hiJsnXPXc7s7ifkujhFcqslvweMy?=
 =?us-ascii?Q?B/v5yEcL9K3zNTRumfBIofiLvRWl4fVH0v9zV/sYwxhpPgByaRXW8YHV/bMH?=
 =?us-ascii?Q?xOjwbij5NwvjYylU9H4DV2kkF9nzR5IOB74IP5mhMEptYNEWdch4wq1Fmzn/?=
 =?us-ascii?Q?4bqnudX+yHnDO19hV+RJVat84f0mjjk30rk+dTYpNytIL//mVWzhelyPfsGN?=
 =?us-ascii?Q?IbjlnBJ9zojR5teJzloCm2p0J98dk0PgA90jLjaB23Z1c+TIL7D/geXIDv2O?=
 =?us-ascii?Q?olJe9LWsMLvj1HzxjrIyCkyzOHUrjMZT5mpav0SmXIspx+PmifDz8CvtDHS0?=
 =?us-ascii?Q?LlzE001yzzqXCZtDPhyAO4m4oZnMU3nXlpNXDAH0B8j029YP91LoVJwP+2cV?=
 =?us-ascii?Q?bkJO0LLvsHGd85eeeJRbrbKvaVc/eUBfIdTCfs7O5COXDvE+3uKnLIJwwh00?=
 =?us-ascii?Q?wmBwCJ3t4xWwnbknAqx7Si4MGrHMbRA7WSzvzOEDIRhHiM+/qvCHqE2Jwo2D?=
 =?us-ascii?Q?0vhuh+7munmPM8WNC82WarPsJr9NgEzvmBxCYdcD4U4DUQwSn1n8KKMTdiJv?=
 =?us-ascii?Q?X2dx1aANJLJDJ3tnVXxM3Ny+LFHsMFpIT27+izcIm7XcE5+C0Pkwvuq5ZTUO?=
 =?us-ascii?Q?POsdyYPpIyNFP5aPeB6zdJsSgTYcjYqkpHIol4iINrGn+lVOkE3VB/r0k3Pu?=
 =?us-ascii?Q?uEFcguzcbZGLeCUpxl5/6OutKzKEQ1zYF6pgilYHH2OFFzWU9u225Dgyq0eS?=
 =?us-ascii?Q?Mf3qBCLaSZTlZ4ex4eqIGT9R8MpamXvcR7nYILTzBrbJwmgbtgAw0bK06hm7?=
 =?us-ascii?Q?o+tzM7y1auIMYxHpv4AIOERC3skTjwHoYQT2iTPulQUCO1ZtsP0Eoj2DlO1H?=
 =?us-ascii?Q?+hj3s0Mz/fV9KOnRl25Czd5LyjBZ3Dc7eTJcNuOcIielZP+TVI8pPq/Zzqi1?=
 =?us-ascii?Q?sQbLcSw+sjf4RSaWj2DBaTsQHkyEVTfihIiWxXNzyhCNKR4bpDXGFblTvgbD?=
 =?us-ascii?Q?ZzPfdXk8+vrTCctbNbseDuqEF1ZlukFb8TsNFcYMSCp770VrGZuSzgAgOhC6?=
 =?us-ascii?Q?kc8FxfYAi8huDFIRXqH7q3xbGyWUWmANFXdBGxRs5hOWj+/kHrF+ioz6qCZa?=
 =?us-ascii?Q?0A4TAN3Ugdct9ZJ7iaxcSmo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a05d671-9b78-4061-66f6-08dd94126cde
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 00:41:41.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AN64d6tD5iPECugKt3oE6Zd8OpjCTZuPM2S04IGllWKJVEuykfQohZygNgKwJb/i+lMrKlcKH0UO1mcAqcEeJom/5KMstkoCMtohgU0G6KYfqp30tuAh5zqBfEZt4tkn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293


Hi Mark

> > From: Srinivas Kandagatla <srini@kernel.org>
> 
> > Correct thing for suspend/resume path to handle is by checking these
> > flags, instead of using component->id.
> > 
> > Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Oops, sorry about that.
Will post v3 patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto

