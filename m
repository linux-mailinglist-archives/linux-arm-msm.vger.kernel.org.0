Return-Path: <linux-arm-msm+bounces-102153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NajGvzs1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:39:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0580B3ADD12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 333B23004925
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6910B3AE1A6;
	Tue,  7 Apr 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="qf5PnSzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161239FCDB;
	Tue,  7 Apr 2026 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561976; cv=fail; b=t8ZO/OMGLQqvV3bAKV9pGzQyyCuCt8P9HLRUCg3xa8PeNi7VCs5S2fNE6MIUIKNGREgJM6eUiIHhIyXyqytFv6/+TfEsh93JPwZUhT4As4F0i5oLiu8Sl4W71NVllpOAkFEdQVk030qkna9HAivmxbiYGesJMJlmnTBLMRkekUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561976; c=relaxed/simple;
	bh=tLL7pJPLaYuuab8wCCI6VAYLknX/JLPEU5I7q+i9VkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rss73g7uDrO90QjOJ2OntdKEcs56CwtgioiByGZd73TkvxbkGrjzdNCAaQ/3U0q9woE5lnuCwYBxg+wBY7wpFfieE6hrj0dGJjYdOB5lhMpaEyU6zFrP+uVBO+/HZjasleYwAWROByNNPptVaIFMc5sCY//aZ2kH6SKTgNrnoD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=qf5PnSzV; arc=fail smtp.client-ip=52.101.56.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPDuxJtqwcSmmFfW8ouBEgnDdTN+2X3pChjdnj1tNjBj4DL7zQ1i6XZ+Jg895EiCKV8ntmpLDgAeiAinid/VYC9381SfSYsy8jL8H3gFBB4uR5pu1jVWwMq1+X1/Fd6R+TvdsRpBzuIP9FnhuBLomyX0DTnfB3L8VYSrY/ULC+mmYMCypaEDdqC/qG3Rwq7BW5wdL+yYIo9nDU5VmkuolKv+ON9UynjWsZfylmEX+qVuO00FE41FsZCRIrmJLMKsxgTk3kc3siS3QgMPuRLLRNjCODlK3vgyu407pOdQ4sidnW9lxWUl5iNAKGm35biPumvVkRwx9jEIOOcKbM/9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huBZGB0FfaFLivKmvMXHG5HiAJHFIW5hcdRm1NRV0mY=;
 b=ZZjgp/VB7oHtaWrbRmFgQ2O8w0zlwZfkZg4U3nYTZq4PpZ2PUlGLILADkt3utymF6lRAmdQqDq/kAGEG1OOk3LI+50tEnQdX3/6bgCQU4RRm5YDVsqWV7AI86lA7eo3fuiwIu6hS5sC3adU81jCXTYi74b1ChCLc0ctr6+IXjddXOQPs1iKeDmOU2u+QmnQ9al3Qi+/euvUa5INCdw9ALRSoNY4aPaDpVp7JBG7zxfgkh3ACvbbP7cG7SdSLidDLVjOW1SrGhovsiXkbj5vrpdZ5osbhVmbOPU9sMHzsAVCOHFgdV1k7VfUenQT9blVeA8cxFrJ7hYsO/LIcn6dcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huBZGB0FfaFLivKmvMXHG5HiAJHFIW5hcdRm1NRV0mY=;
 b=qf5PnSzVTLtsITnX+LNG6fzYKFw9tz71NsjNK6OlibdgZp1plopixkT139BgzMPRhaaFF3Pex1fyeVfqezlupGmyIxg7smQa90KDXsMh+xC/0T//ZklK3VLcUWnm2kogDwhMhgEOPUSJTIpe5A1MbQ3vVsARwAnawFPNrwWRXJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by LV3PR10MB7819.namprd10.prod.outlook.com (2603:10b6:408:1b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 11:39:30 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 11:39:30 +0000
Date: Tue, 7 Apr 2026 12:39:25 +0100
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
Message-ID: <20260407113925.4imd3lxkcrq47pu3@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
X-ClientProxiedBy: LO4P265CA0160.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::19) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|LV3PR10MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe754be-3579-4bf6-f31a-08de949a5459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Myc773aiTCrlMGy9IWJV+m0EJilPjnBJckKApbhoP6+gjjCPZxOBtiKOBCAjUZJjgFiFzTiV0x1YGhOKd2wypNYo18NY0RW6PgqPCyVPAkCTG7LLrwIxHBnz6xniF6nK1v1Zg1mUveBn9tEXmOyI4D6+j5cv2lCZpQLiggqQnzZPf/osTFMUFzsN63DPSQoFcjW3VFfGptzOqBWQl0yFHNOEs7rzcDnLHT7k+RBJ+JhvmoQVIZUfH3RGvu3grPmpsx8z4sQ1H2/oNyxAq6KQM+m4I7A18njjyUm2ZVJTPrYYWu3HJEjtS4jf8zZP3626zGyoKg2cwHNoEaJWhKKbW0afucnj2Tp5whpM3nJRhO3V0NVnAutSVc2nTO0JTxpY4+IFcXndW6UOpse2GUo/asY/eFo8WNrcmx30vKfgJ53vOjoP3cJvnTlG79ZMvBYBFzrFahnQunFb1vIL6pAGx/XiRvuqX7ALzK2pKbzgGcnBlH7mz+JyhVSuO/WWgqKfBbkf4pHqY+HApMf+HPUtJ1VZ2fKJSjnPkkDQ48OnZW1K3Gx7cpinPjJf/srflMq8GTWT7yvKDQb2S8u8faD8vw9PEYU+D6cugm2RbaRxaSnRG0AMJykjiYjMy2l7n2lzriF95kgyq1rx/AHFkhypiAGQ0Vx2uxh+sfJVJ7xLimHWYItNkL8LCjmAGgjnSSq8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZ9C1/KOVlUo0XP2aK6eB6f+XrM/4C8UVAwRVxnlQZy8+aBv+LsOUFLXD0RY?=
 =?us-ascii?Q?pzgi2sJSqgsYBa9yKk59sEH86b3yxThQ+U+AlcL+0BJZuWhiiwH9pZrDL92v?=
 =?us-ascii?Q?WPiviShHl6IYGcrAJn3yJror/JVDPGu9oZKFLyRhyejDh+OR76S4P+R9/SQE?=
 =?us-ascii?Q?RhAxhK+2b7NQYyTSl/Zr7CLUxf6vos87yucfQElQTBIC6oWctsxd9IOOeCTs?=
 =?us-ascii?Q?CZ3MX0ayL9lkpBrgbt+Cs2Tuso328qI0qS2R5rUF/E3sJmYWt4j3BR7Y319D?=
 =?us-ascii?Q?/ojJYq0/NLqelJ9KCaMG8gEk1z8Nt7USDvSx5kLCU4D88iu/sMLXugGCYR5m?=
 =?us-ascii?Q?C5A/OOpm6BHehkAP3NBW6Acrwof+mw3T90XfADQWr6nwwEBDM/GlCbyWzxnS?=
 =?us-ascii?Q?JadRoiwt+AjKOyn+fCOIxep8sld0t70iUE6fexVsW+0dScP/0HYsP8OB+uAj?=
 =?us-ascii?Q?CWb4J8WXWoagDfqwFMtZ5ZeS0NNzdYgFuKChlb4mNSdHYJi/z5aDDR9fcfPU?=
 =?us-ascii?Q?dfdCC1pjJKP7Wdmhpe2Sild7s/z/vueyrolbySczqT1EdHXaJNGkBk+Y2AQB?=
 =?us-ascii?Q?+A09euTBI1mEfAVU4wPQ3MSucnezNql5gg7rZpKExsgce7IrvcMXQcMNxe+5?=
 =?us-ascii?Q?+XW35ynrIJrE9Por8xYlj4aTfY/RgZPZY2o8x3nfhbTYG3/Yfx5yQoIJF7fU?=
 =?us-ascii?Q?QmB6MEXN3S365ob3eAwg3Tuwlk2aU5HjFolRiAnzIbdjEGSPjcklb9c1z2Hq?=
 =?us-ascii?Q?OHLkezkDgkLk/Xc/s9i/eChQajePShzpSsMMK/b0wCVshOf2DljvXwyXV1rB?=
 =?us-ascii?Q?6NE3+/g+wVdW/g9kbhBQ9V85vYfYKvW736HRGqb+jEmIERfLCIUR+cRWt6p7?=
 =?us-ascii?Q?Jo4YeWYg4E5NkGZlhGJtM3TL8cBrGjSgr0HCfqAYhHkAp1AlFjTaUfVHw79F?=
 =?us-ascii?Q?Elmy4NGjljcq6fk4gIs9zs53PFWdwYGOp8ULzErWOPbG1spHp8LGIoGn2/HB?=
 =?us-ascii?Q?/CyInDeqhrGA6XwqAzazCgFMB4a/wWIr6YfudjViU8tfQ0OFor3sbakgEEgp?=
 =?us-ascii?Q?X6EUZ1Q0NO3TY6EHqqt8AUQSgeUQkb1XftxZ0MhoPKEa/hDCUXeppx33cHan?=
 =?us-ascii?Q?pmv8pvy9V1jzBSPMPtPZI2SmVKNsXxY6f2oj4t131RnuhC/2csEmmU2JZO52?=
 =?us-ascii?Q?KZEI2r9igYzsOpyqdlJj8hw/fmf2bZpufXJKtayp+z840XNAVbylP4tBFdUM?=
 =?us-ascii?Q?EAkh3BDjsSNwfY7iyvPB9ZqepNZjS9ZeuRseWUHXeIGFRPpZVOJ82Jp1/TiW?=
 =?us-ascii?Q?VJtFoKbnK3UCrj2WAXe1wJz1Oj5huMh1XAQOG1r2RxFraTvJn7h4AyxwwerG?=
 =?us-ascii?Q?d09je2Of5XIrKoiUg2Ex64v/fQWQzI/TB/O/K1l6soEncj7o9MVef1AW8UdH?=
 =?us-ascii?Q?6Lx9vFvqYjR9eRI+e0dVHTGofO961eYxFU6JwdKGp8MfSkrixC4To+g1vQ0B?=
 =?us-ascii?Q?q3C3yOiDNlTD2zvjMk86fFmI4kPEK3AO3m2EWzI6vqrSpOeL7+oVw+7PnTiB?=
 =?us-ascii?Q?KAxdgxVmkb3wOJh35WdRAcgAnVbpBlrgXdFApdFL1sk1/39rXaIi4gnuL5rY?=
 =?us-ascii?Q?Zat0uuWmeQI842AsRRhrcE2Iaza+b6rML73GZxkK9g2pNckOvpy6aAJSiuQ6?=
 =?us-ascii?Q?vpF3jNZsri+AcS5aNWYS0uHItH9K9MuWvD7BcfAuPmDLtpMx?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe754be-3579-4bf6-f31a-08de949a5459
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 11:39:29.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+V3z8sTFkTrMdbP22ZmcPbBh7ks8JZcz/icn8KxC97xVku0pMnknzhDLe7TWdO667/7ypjApYcN8DdDtyOBHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7819
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102153-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axon.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,axon.com:dkim,axon.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,urldefense.com:url,2b:email]
X-Rspamd-Queue-Id: 0580B3ADD12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 12:20:23AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 10:50:58AM +0100, Joe Sandom via B4 Relay wrote:
> > From: Joe Sandom <jsandom@axon.com>
> > 
> > The RB5gen2 is an embedded development platform for the
> > QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> > 
> > This change implements the main board, the vision mezzanine
> > will be supported in a follow up patch.
> > 
> > The main board has the following features:
> > - Qualcomm Dragonwing QCS8550 SoC
> > - Adreno GPU 740
> > - Spectra ISP
> > - Adreno VPU 8550
> > - Adreno DPU 1295
> > - 1 x 1GbE Ethernet (USB Ethernet)
> > - WIFI 7 + Bluetooth 5.4
> > - 1 x USB 2.0 Micro B (Debug)
> > - 1 x USB 3.0 Type C (ADB, DP out)
> > - 2 x USB 3.0 Type A
> > - 1 x HDMI 1.4 Type A
> > - 1 x DP 1.4 Type C
> > - 2 x WSA8845 Speaker amplifiers
> > - 2 x Speaker connectors
> > - 1 x On Board PDM MIC
> > - Accelerometer + Gyro Sensor
> > - 96Boards compatible low-speed and high-speed connectors [1]
> > - 7 x LED indicators (4 user, 2 radio, 1 power)
> > - Buttons for power, volume up/down, force USB boot
> > - 3 x Dip switches
> > 
> > On-Board PMICs:
> > - PMK8550 2.1
> > - PM8550 2.0
> > - PM8550VS 2.0 x4
> > - PM8550VE 2.0
> > - PM8550B 2.0
> > - PMR735D 2.0
> > - PM8010 1.1 x2
> > 
> > Product Page: [2]
> > 
> > [1] https://urldefense.com/v3/__https://www.96boards.org/specifications/__;!!K76kBA!1fgy0ADknA_DP0VqDvEXe9TuFrmdabqHK1RDt53uY9WoeXsV1Bm8UJUetOp2eUzEDZ-FiipcbKzEafTxbNkQjsehrU6oWw$ 
> > [2] https://urldefense.com/v3/__https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit__;!!K76kBA!1fgy0ADknA_DP0VqDvEXe9TuFrmdabqHK1RDt53uY9WoeXsV1Bm8UJUetOp2eUzEDZ-FiipcbKzEafTxbNkQjsftljQwig$ 
> > 
> > Signed-off-by: Joe Sandom <jsandom@axon.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile            |    1 +
> >  arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 1610 ++++++++++++++++++++++++++
> >  2 files changed, 1611 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 4ba8e73064194926096b98b9556a3207e8f24d72..f8c65771f76629d7fafee15ac8d7bb62cd24a20f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -184,6 +184,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..280fbd3a09997e3e2613498e25ac188680484cc4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
> > @@ -0,0 +1,1610 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2026 Axon Enterprise, Inc.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include "qcs8550.dtsi"
> > +#include "pm8010.dtsi"
> > +#include "pm8550.dtsi"
> > +#include "pm8550b.dtsi"
> > +#define PMK8550VE_SID 5
> > +#include "pm8550ve.dtsi"
> > +#include "pm8550vs.dtsi"
> > +#include "pmk8550.dtsi"
> > +#include "pmr735d_a.dtsi"
> > +#include "pmr735d_b.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS8550 RB5Gen2";
> > +	compatible = "qcom,qcs8550-rb5gen2", "qcom,qcs8550", "qcom,sm8550";
> > +	chassis-type = "embedded";
> > +
> > +	aliases {
> > +		serial0 = &uart7;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	clocks {
> > +		clk40m: can-clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <40000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +
> > +		pinctrl-0 = <&volume_up_n>;
> > +		pinctrl-names = "default";
> > +
> > +		key-volume-up {
> > +			label = "Volume Up";
> > +			linux,code = <KEY_VOLUMEUP>;
> > +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> > +			debounce-interval = <15>;
> > +			linux,can-disable;
> > +			wakeup-source;
> > +		};
> > +	};
> > +
> > +	hdmi-connector {
> > +		compatible = "hdmi-connector";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_con: endpoint {
> > +				remote-endpoint = <&lt9611_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	/* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
> > +	/* Workaround is to use bit-banged I2C */
> > +	i2c_hub_3_gpio: i2c {
> > +		compatible = "i2c-gpio";
> > +
> > +		sda-gpios = <&tlmm 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&tlmm 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led-0 {
> > +			label = "green:status-3";
> > +			function = LED_FUNCTION_STATUS;
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			gpios = <&pm8550_gpios 2 GPIO_ACTIVE_HIGH>;
> > +			default-state = "off";
> > +		};
> > +
> > +		led-1 {
> > +			label = "blue:bt-power";
> > +			function = LED_FUNCTION_BLUETOOTH;
> > +			color = <LED_COLOR_ID_BLUE>;
> > +			gpios = <&pm8550b_gpios 7 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "bluetooth-power";
> > +			default-state = "off";
> > +		};
> > +
> > +		led-2 {
> > +			label = "yellow:wlan";
> > +			function = LED_FUNCTION_WLAN;
> > +			color = <LED_COLOR_ID_YELLOW>;
> > +			gpios = <&pm8550b_gpios 9 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "phy0tx";
> > +			default-state = "off";
> > +		};
> > +	};
> > +
> > +	lt9611_1v2: lt9611-regulator-1v2 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "LT9611_1V2";
> > +
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +
> > +		vin-supply = <&vreg_l14b_3p2>;
> > +	};
> > +
> > +	lt9611_3v3: lt9611-regulator-3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "LT9611_3V3";
> > +
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		vin-supply = <&vreg_l14b_3p2>;
> > +	};
> > +
> > +	pmic-glink {
> > +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_hs_in: endpoint {
> > +						remote-endpoint = <&usb_1_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss_in: endpoint {
> > +						remote-endpoint = <&redriver_usb_con_ss>;
> > +					};
> > +				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_sbu_in: endpoint {
> > +						remote-endpoint = <&redriver_usb_con_sbu>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	pcie_upd_1p05: regulator-pcie-upd-1p05 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "PCIE_UPD_1P05";
> > +		gpio = <&tlmm 179 GPIO_ACTIVE_HIGH>;
> > +		vin-supply = <&vdd_ntn_0p9>;
> > +		regulator-min-microvolt = <1050000>;
> > +		regulator-max-microvolt = <1050000>;
> > +		enable-active-high;
> > +		regulator-enable-ramp-delay = <5000>;
> > +		pinctrl-0 = <&upd_1p05_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	pcie_upd_3p3: regulator-pcie-upd-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "PCIE_UPD_3P3";
> > +		gpio = <&tlmm 13 GPIO_ACTIVE_HIGH>;
> > +		vin-supply = <&pcie_upd_1p05>;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		enable-active-high;
> > +		regulator-enable-ramp-delay = <10000>;
> > +		pinctrl-0 = <&upd_3p3_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	upd_reset: regulator-upd-reset {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "UPD_RESET";
> 
> Reset usually isn't a regulator.
Ack.
> 
> > +		gpio = <&tlmm 182 GPIO_ACTIVE_HIGH>;
> > +		vin-supply = <&pcie_upd_3p3>;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		enable-active-high;
> > +		regulator-enable-ramp-delay = <10000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> 
> Especially since it's not controlled.
Fair point. Will address this in v2
> 
> > +		pinctrl-0 = <&upd_ponrst>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	usbhub_reset: regulator-usbhub-reset {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USBHUB_RESET";
> 
> Same here.
This will be removed entirely in v2. Checking the schematic again,
this is not actually needed
> 
> > +		gpio = <&tlmm 41 GPIO_ACTIVE_LOW>;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		startup-delay-us = <1500>;
> > +		off-on-delay-us = <1500>;
> > +		pinctrl-0 = <&usbhub_rst>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN_0P9";
> > +		vin-supply = <&vdd_ntn_1p8>;
> > +		regulator-min-microvolt = <899400>;
> > +		regulator-max-microvolt = <899400>;
> > +		regulator-enable-ramp-delay = <4300>;
> > +	};
> > +
> > +	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN_1P8";
> > +		gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&ntn0_en>;
> > +		pinctrl-names = "default";
> > +		regulator-enable-ramp-delay = <10000>;
> > +	};
> > +
> > +	vdd_ntn1_0p9: regulator-vdd-ntn1-0p9 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN1_0P9";
> > +		vin-supply = <&vdd_ntn1_1p8>;
> > +		regulator-min-microvolt = <899400>;
> > +		regulator-max-microvolt = <899400>;
> > +		regulator-enable-ramp-delay = <4300>;
> > +	};
> > +
> > +	vdd_ntn1_1p8: regulator-vdd-ntn1-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN1_1P8";
> > +		gpio = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&ntn1_en>;
> > +		pinctrl-names = "default";
> > +		regulator-enable-ramp-delay = <10000>;
> > +	};
> > +
> > +	vph_pwr: regulator-vph-pwr {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vph_pwr";
> > +		regulator-min-microvolt = <3700000>;
> > +		regulator-max-microvolt = <3700000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> > +	sound {
> > +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> > +		model = "QCS8550-RB5Gen2";
> > +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> > +				"SpkrRight IN", "WSA_SPK2 OUT",
> > +				"VA DMIC0", "vdd-micb",
> > +				"VA DMIC1", "vdd-micb";
> > +
> > +		wsa-dai-link {
> > +			link-name = "WSA Playback";
> > +
> > +			cpu {
> > +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> > +			};
> > +
> > +			codec {
> > +				sound-dai = <&left_spkr>, <&right_spkr>,
> > +					    <&swr0 0>, <&lpass_wsamacro 0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6apm>;
> > +			};
> > +		};
> > +
> > +		va-dai-link {
> > +			link-name = "VA Capture";
> > +
> > +			cpu {
> > +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> > +			};
> > +
> > +			codec {
> > +				sound-dai = <&lpass_vamacro 0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6apm>;
> > +			};
> > +		};
> > +	};
> > +
> > +	wcn7850-pmu {
> > +		compatible = "qcom,wcn7850-pmu";
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
> 
> swctrl?
Bundled into bt_default since it's tied to BT
> 
> > +
> > +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > +		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> 
> swctrl?
Thanks. Will add this in v2.
> 
> > +
> > +		vdd-supply = <&vreg_s5g_0p85>;
> > +		vddio-supply = <&vreg_l15b_1p8>;
> > +		vddaon-supply = <&vreg_s2g_0p852>;
> > +		vdddig-supply = <&vreg_s4e_0p95>;
> > +		vddrfa1p2-supply = <&vreg_s4g_1p25>;
> > +		vddrfa1p8-supply = <&vreg_s6g_1p86>;
> 
> [...]
> 
> > +
> > +&gpi_dma1 {
> > +	status = "okay";
> > +};
> > +
> > +&gpi_dma2 {
> > +	status = "okay";
> > +};
> > +
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_zap_shader {
> > +	firmware-name = "qcom/qcs8550/a740_zap.mbn";
> > +};
> > +
> > +&i2c_hub_2 {
> > +	clock-frequency = <100000>;
> > +
> > +	status = "okay";
> > +
> > +	typec-mux@1c {
> > +		compatible = "onnn,nb7vpq904m";
> > +		reg = <0x1c>;
> > +
> > +		vcc-supply = <&vreg_l15b_1p8>;
> > +
> > +		retimer-switch;
> > +		orientation-switch;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				redriver_usb_con_ss: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss_in>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				redriver_phy_con_ss: endpoint {
> > +					remote-endpoint = <&usb_dp_qmpphy_out>;
> > +					data-lanes = <0 1 2 3>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				redriver_usb_con_sbu: endpoint {
> > +					remote-endpoint = <&pmic_glink_sbu_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c_hub_3_gpio {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	lt9611_codec: hdmi-bridge@2b {
> > +		compatible = "lontium,lt9611uxc";
> > +		reg = <0x2b>;
> > +
> > +		interrupts-extended = <&tlmm 40 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> > +
> > +		vdd-supply = <&lt9611_1v2>;
> > +		vcc-supply = <&lt9611_3v3>;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				lt9611_a: endpoint {
> > +					remote-endpoint = <&mdss_dsi0_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				lt9611_out: endpoint {
> > +					remote-endpoint = <&hdmi_con>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c_hub_4 {
> > +	status = "okay";
> > +};
> > +
> > +&i2c_master_hub_0 {
> > +	status = "okay";
> > +};
> > +
> > +&ipa {
> > +	qcom,gsi-loader = "self";
> > +	memory-region = <&ipa_fw_mem>;
> 
> These two should be a part of sm8550.dtsi
Ack. Will put this in a separate commit and also tidy up hdk/qrd.
> 
> > +	firmware-name = "qcom/qcs8550/ipa_fws.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&iris {
> > +	status = "okay";
> > +};
> > +
> > +&lpass_vamacro {
> > +	pinctrl-0 = <&dmic01_default>;
> > +	pinctrl-names = "default";
> > +
> > +	qcom,dmic-sample-rate = <4800000>;
> > +
> > +	vdd-micb-supply = <&vreg_l15b_1p8>;
> > +};
> > +
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0 {
> > +	vdda-supply = <&vreg_l3e_1p2>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&lt9611_a>;
> > +	data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l1e_0p88>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp0 {
> > +	status = "okay";
> > +};
> > +
> > +&pcie0 {
> > +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> > +
> > +	pinctrl-0 = <&pcie0_default_state>;
> > +	pinctrl-names = "default";
> > +
> > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > +
> > +	/delete-property/ msi-map;
> 
> Why?
I tried extending the msi-map to cover the RIDs from the QPS615
PCIe switch (matching the iommu-map entries), but this caused
ITS MAPD command timeouts. From what I could gather, deleting
msi-map forces the PCIe controller to fall back to the internal
iMSI-RX module, where this worked properly.

For reference, I checked the RB3gen2 since it also uses a QPS615
and there doesn't seem to be any msi-map defined (in kodiak.dtsi).

Any recommendations to resolve this properly?
> 
> > +
> > +	status = "okay";
> > +};
> > +
> [...]
> > +
> > +&pcie1 {
> > +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> > +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> > +
> > +	pinctrl-0 = <&pcie1_default_state>;
> > +	pinctrl-names = "default";
> > +
> > +	iommu-map = <0x0 &apps_smmu 0x1480 0x1>,
> > +		    <0x100 &apps_smmu 0x1481 0x1>,
> > +		    <0x208 &apps_smmu 0x1482 0x1>,
> > +		    <0x210 &apps_smmu 0x1483 0x1>,
> > +		    <0x218 &apps_smmu 0x1484 0x1>,
> > +		    <0x300 &apps_smmu 0x1487 0x1>,
> > +		    <0x400 &apps_smmu 0x1488 0x1>,
> > +		    <0x500 &apps_smmu 0x148c 0x1>,
> > +		    <0x501 &apps_smmu 0x148e 0x1>;
> > +
> > +	/delete-property/ msi-map;
> 
> Why?
Same as above, for the RB5gen2, both PCIE0 and PCIE1 have QPS615
PCIE switches.
> 
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pcie1_phy {
> > +	vdda-phy-supply = <&vreg_l3c_0p9>;
> > +	vdda-pll-supply = <&vreg_l3e_1p2>;
> > +	vdda-qref-supply = <&vreg_l1e_0p88>;
> > +
> > +	status = "okay";
> > +};
> > +
> 
> [...]
> 
> > +
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/qcs8550/adsp.mdt",
> > +		       "qcom/qcs8550/adsp_dtb.mdt";
> 
> MBN, please align vertically on the quote mark. The same for CDSP and
> modem.
Ack. Will correct this for v2.
> 
> 
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/qcs8550/cdsp.mdt",
> > +		       "qcom/qcs8550/cdsp_dtb.mdt";
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_mpss {
> > +	firmware-name = "qcom/qcs8550/modem.mdt",
> > +		       "qcom/qcs8550/modem_dtb.mdt";
> > +	status = "okay";
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry

