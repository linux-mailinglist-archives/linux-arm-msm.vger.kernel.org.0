Return-Path: <linux-arm-msm+bounces-85238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50ACBDC37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68B003066AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D38327783;
	Mon, 15 Dec 2025 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jJd7VqHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020143.outbound.protection.outlook.com [52.101.196.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D0315793;
	Mon, 15 Dec 2025 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800717; cv=fail; b=TVJG0L/L+kWOeqiBGVZc2+tpO8KTszwcFOLwG1tV7KKxWM5BdRKUFRiUE0oG6uLqF/bkv7eXbsvSZfMmHUlM0fyPW58uxpE0PWRF35WrHlDmNIedIE2c+hV7bxCAJZsUj3Qo12OgDbs/Rms49jZQUD2s6TlVVmxRDtkUJF3OneM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800717; c=relaxed/simple;
	bh=WzQ0xwklj5hmbAkfm6yV9LPVL6cFQUGhRyn3RO8GwUg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XCUL8RkX+PdXoRR/FP9cKCe2/ULfsnSBbKo1ItdXHEDcovGOOPtlnoeTwN3gYThXcruCmYkiANcnMNlywWiQZHjwabfFvPJavISElnOJ+FOLJNYyO5U8Urh0AV876kjfkBK6SJtfCKIfKqBazbEtboRvImzPZK+DOtsayjr/+eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jJd7VqHG; arc=fail smtp.client-ip=52.101.196.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLf7LRtJF7CQCmE5bkKg1L0jhfLfGLfSNy/ep3md4stioQcmBiWqPsOowAY37ATSEjDS41Oax2svsuLznB6tg6gd9hhw1mcOgnuDx6WMJgXaX7iQDTM8o5nYxm6Oi1e4JH5DMVKGQXqfOH9gkc/imv45hgoLCEsZRGCkfl7nwuYQiXs+xu8Ba1eBXcRrn2u6m11GaVbe99F5YnljDS7XtvA8tsKNo78lGF1RMaN81RZvK4kp3FsojaszVtPqm/j6hM7KHaHodRQxjZmqplyt4lQpn730c6D3QtzEYmyV3QgAfaJpLlWVXbEjDegERmAnm9o02sbTkw1QuH3sU+bUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz06pc99Tf4xsSt/VZzOJk8S6awKslq3DBcKGzDHE3o=;
 b=O6cEKR+jQfwl3ia431kGMuDdBkpUvEfuEmmgPPz/t2zkT7f7J7leitEG8OwDIqzbbHy24+q4KNS0tTRIx7ghEXEWsIQVfP/M215MtsihQYvvtrBXqG2FWAF2yVzpR/KOmm/TzEDqpShTrIG6O6UG+m75XmTbteUIlaacGvbtStbfQx8eac6j6nP5AtJK6mCAtgkgSzwbWY9D8viX/DjXL0Yj6H4WLiJTubiJL9q9lrZkfyo67VuxJrc6DIMeddq3fosg5MMz9vVq19EgpomW5k8WJddBLokhkkFluesCfb5U+TVp5gW/AdP20V/f3d8ZPtcKMt5LGQq9yjsqpGiXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz06pc99Tf4xsSt/VZzOJk8S6awKslq3DBcKGzDHE3o=;
 b=jJd7VqHG16JSK7rqiPsLWsfbQXtTenF1zcZCNbz0wWveI2T8ZJfcqEHi8WweFgQtN9knHW6Ut6eViIhuIQU9ZOu4lX8HEJdASGaE1ZBRfq+n5E7cLdhHlsOFg8B80SDxBhzaBQFRBcDVZYUX/OXamwDhQ5i3z0fdtOKH6h0xa4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB6181.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:11:48 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 12:11:48 +0000
Date: Mon, 15 Dec 2025 12:11:45 +0000
From: Gary Guo <gary@garyguo.net>
To: Matthew Maurer <mmaurer@google.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Satya Durga
 Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Trilok Soni
 <tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <20251215121145.19b99bb0.gary@garyguo.net>
In-Reply-To: <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
	<4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
	<CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 1080ffd4-0e00-4032-ef36-08de3bd31f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2ZkzIb03ClyWK1WrRvbb5ak9gnKKHF/5k06Nqr0rUeworn57z9q09FCL8DCb?=
 =?us-ascii?Q?pVXFMfR6I70OlcXcQTU11s2jFRW12VigQl92iNXmfk9E702w4/bMZzXIZ5Sh?=
 =?us-ascii?Q?CJ7+CFDD0WRe2CmIzt2kE65pHpTlDlStTlek001Rt00Kk/skAzk3qbiu6Jw6?=
 =?us-ascii?Q?QO4GkXQ8VLTZbIjll+iErwLzJg6v5QwjbPpzxpJ0tsvUWXspo1wujNMucE5p?=
 =?us-ascii?Q?Dgk0/xwXw0WXYOEE9o42zuIbCJPEwJfcgWGnPO/Ha2AGMJHA0n9l1ClQcOwC?=
 =?us-ascii?Q?05BeQeP2vlnvH4EcShnIQfho7SpILGM68W8LAOqqCQJSkgLGFP0+gT9bpxxw?=
 =?us-ascii?Q?6O8YYTW96/qjfBKu2zzNYVVSBVuXiCyUXWw1GkyAyOqTRpQLRjtGiLGYN6IJ?=
 =?us-ascii?Q?iGutDIgMbyIHI1bWHyCS8DXkQMieLKp2n72a+d5oDhoZMpUduGoTlmMNyBR9?=
 =?us-ascii?Q?pBJMDecKKabD2h0KHTp4zdZUDcB2yhh5h+2lqU4yrm7OvqhnQFOI/pCPGCP0?=
 =?us-ascii?Q?OELBjxAfb2/0BfJ5JrwdQM3TgpNGrDW8oYGHsf+pCiK4ASQPm7F9Q+p1ycoy?=
 =?us-ascii?Q?lq48mFOusLTaU5KqJTNDYOZz6HDqyTS1N0vxKkgU8InyPlYbd2hf4r6Ut59m?=
 =?us-ascii?Q?dPrJUGjTfIvdUnmYj5X5CtyA95PpaDm+KxDNxrehzb6YD0h8fjMv8wAoIikb?=
 =?us-ascii?Q?SXNLBJHVaKtBRBYg6Dz2JGw1Hg2NtTre12FN+Wbjy3E4GGrN0km6uOTmJsH5?=
 =?us-ascii?Q?xmdrxbz2uyKyvZT+yeFJQxKXIz/2cXEeHpgdVmnKb7spib5nSmJrvld+SWQS?=
 =?us-ascii?Q?Gq2CFDBOW5GRcLoSu/pdX1RHc8LU/9K2VcUBkCp5wuYHneydkhKycyydo7y3?=
 =?us-ascii?Q?Sx4Grf15Z1iZ1k4cc6Lf3a9q2snlOb1E5rmh+3EW9qG2FWxnUhkOStS3T2Ev?=
 =?us-ascii?Q?xKl/mkNSCvQUr72W37NaM7hiwWIt7PRyqyNzhZmSwh65aqUp9wKV3t46JQjJ?=
 =?us-ascii?Q?lzpNmPSryo3dQaqoMl2KIY87ACQ775ME/8KlIReVwXdMluuFgz8/3GT5k7uf?=
 =?us-ascii?Q?WrmatJRL9sD4JmdCemKxLtpCLwHhzE1LS/qKrPY9bjkqYIALoKwaZqJmPwNw?=
 =?us-ascii?Q?Y4wXOXtMj+Kf0qeT1Hf+hxg6Av6T9zIFkhsBq3mI4D63ybPAb3SIbAb5vzaG?=
 =?us-ascii?Q?xO6x4FLaSHloHKbu0Q+0aMY7FT3scIkY/3JSbCokA/Dgbo1umudaSHgaptXl?=
 =?us-ascii?Q?q2PPeJxMELR/5gJJjIPQECT6CsLmqddU+fniKXqUKaoEw8Oz2jc9oO7kvRgf?=
 =?us-ascii?Q?uHjf3qOP6kSshqOVw3LkQGVajyhZZrqSkwvXDKGf6ze9wB0CgBi3dA+TV9xP?=
 =?us-ascii?Q?TU9d0tSgshflwMWY1fkeRXz6T/s29WC/ICDNpavBmgtQsw3UUEOLHg+QAD6T?=
 =?us-ascii?Q?FDoU5nvrQ79yln5wuddlUqAmc3EwdhkK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pLP1XCJPIBataqZ/lOAcqsS0+lTQf7p/nyc4tWhbxuJsV/iFbmvDy29rnIii?=
 =?us-ascii?Q?WwJI1D2q1szjwCBgWAeqq4aDIxcS9JamAtUcbVS452UpKr0PY9xdIN++Q9IM?=
 =?us-ascii?Q?UlVTSFM1nbNMX5MmHpdN4cVoQUARdlXi87741HDsd8Y6djRg8H72lzsOG1ak?=
 =?us-ascii?Q?AS0qQT0jgfIzRrlF52lmgmcQWnWBiABJUPR+i0dlXwdrF+apMc0zow72IEm2?=
 =?us-ascii?Q?X93FVM7r+GhM7ipTJRPxOSXZqbHT71+j9mWyumkqKWXgWfCqrB9ckuYJEao1?=
 =?us-ascii?Q?OvsXC5nWtP2PLDC+7t5qdzL4kv2Qe15aSQimAoc/jUgnBqKAJvbfpZtt2fXq?=
 =?us-ascii?Q?c1crfa9uAeXqOai1AnOy8lUTMAoea3rUsy8PQOOQCBg1r3AMa1OsknTfJ4Fo?=
 =?us-ascii?Q?iUCMc6iVsjipY5eHF4BxKt92RmdT6oglynxCBaHsGIsFFQfpjQMOXqsO8X7n?=
 =?us-ascii?Q?/rBIFeLmpKRI50MpD/l0opVCioPHIhZkozHUWPQLIXoMxan4xwCGo8vu7phU?=
 =?us-ascii?Q?IQvHfRxQHTsji+lswmJSeTeaLU8HYpPuJjlnPhK+LrSbe1vLjXUv2zaPrIv1?=
 =?us-ascii?Q?HiBy+q+7KMM4mvasNZqpfrmi/XiQFmKTqzJI3iZhDVQyCyk75lC2R6pRviYD?=
 =?us-ascii?Q?vHI4LL0Nqz+eE18HX2XA2ZfULKTmdpE0RgvpM438fi1XCJQNPBcKxu4/NhV1?=
 =?us-ascii?Q?y75RZhnTF/a18/8Vc9acxMstHLEwZbWTouuT90DclC7nFp8AXy3dVT7UJZcY?=
 =?us-ascii?Q?Yun9UrN4mhlkFzWGUEYflIDDFV912RhG2uLj7Bi3F9TqQC+4udqqoQTAVx71?=
 =?us-ascii?Q?yXeoInkuOU7tB10WOSFqb32pjjT4HUut0JNQLxBTiRln9SgV9Xwht8xdr4oO?=
 =?us-ascii?Q?fFBdCGRF9jeekkf70E3xcn9KUfwt1jrNJpNWHi7lCS+4yxxPS/hh0P77oLFj?=
 =?us-ascii?Q?hCYCrmAhwWOO++wKUPkiRma7pB6m/FmsyjdKwF8vcZpHBiJWf+igiFfcGA83?=
 =?us-ascii?Q?+VdH+/M1Gb+csh+CwRFGHKsLIAPHQztuIAIc5p9yt84KA37BhNiQUkegvfLC?=
 =?us-ascii?Q?VJQ1KW3kaF7I5aZf7I8J7IfOtLLTE8pRbz5HsooXqQhsq5sVwonFl3WZSNfz?=
 =?us-ascii?Q?lfe3Xjh1mZi7Zwbg/OUXsnHN7v9hQmtjY4WaTYUulo70uyrRhg6KbwOOqdvR?=
 =?us-ascii?Q?hj/QLvrDtuW+84r/gqII4yXupijvudg398/bYtpneV9WP5qWE1KGdIxdqLUE?=
 =?us-ascii?Q?fC/BTEJvLK4O2wc9vPY3VYz0KwVAw+06klZauw17RQdviq3jHZD2EsItwAzg?=
 =?us-ascii?Q?ki0ub4eO5TjL/WIkwi3/NgmADlA/NmHa8HeVUCLVagtzwrQ8qZjLTSU0C7j5?=
 =?us-ascii?Q?XJM5Cov93SBDPSo1h73iIHshWCAYormG0mj5R4kTeFvnfZ5KikxGzZWVMUCw?=
 =?us-ascii?Q?RMl0eCx4+hWByHIq6c6W5lbYVh31okA0UD78OVaZiPYIeA5AdOgUAI2QCJPc?=
 =?us-ascii?Q?mmohoyMY+ZQV3pI+Uq1Kmms5yTF737KiMmk5gmAIi8lmmFHfGm8yflIJWfGa?=
 =?us-ascii?Q?rCaes48tUwpOhDtUknvioKYX/1S3uvj9QQ8Lf2OE?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1080ffd4-0e00-4032-ef36-08de3bd31f80
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:11:48.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJVnpHhoCEbO0/ryvys+ZQph9TN1A7Wu2/VsFT2/diqI/Mtc5j59fGNpyUahHPDvx8BawnHfCmwVImRYtQvdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6181

On Sat, 13 Dec 2025 08:58:56 -0800
Matthew Maurer <mmaurer@google.com> wrote:

> Some options:
> 1. Make holes explicit
> ```
> pub(crate) const PMIC_MODELS: &[Option<&'str>] = &[
>   Some("foo"),
>   Some("bar"),
>   None,
>   Some("baz"),
>   // ...
> };
> ```
> This is the one I'd suggest if we want to get rid of the 92. It has
> the downside of some extra explicit `None` entries, but the array
> isn't *that* sparse.
> 
> 2. Factor out 92 into a constant.
> 3. Define the constant in terms of index/value pairs instead. I could
> use `const`-time code to produce the array we want:
> ```
> const PMIC_ENTRIES: &[(usize, &str)] = &[(1, "foo"), (9, "bar"), (42, "baz")];
> 
> const PMIC_MODELS_LEN: usize = {
>     let mut max = 0;
>     let mut i = 0;
>     while i < PMIC_ENTRIES.len() {
>         if PMIC_ENTRIES[i].0 > max {
>             max = PMIC_ENTRIES[i].0;
>         }
>         i += 1;
>     }
>     max + 1
> };
> 
> pub const PMIC_MODELS: [Option<&'static str>; PMIC_MODELS_LEN] = {
>     let mut models = [None; PMIC_MODELS_LEN];
>     let mut i = 0;
>     while i < PMIC_ENTRIES.len() {
>         let (idx, val) = PMIC_ENTRIES[i];
>         models[idx] = Some(val);
>         i += 1;
>     }
>     models
> };
> ```
> (The slightly icky looking loops are because not all features are
> available in const mode.)
> This seems a bit overkill for what's going on.

How about making a macro for this and make it available from kernel crate?
Looks like this should do what you need?


/// Create a sparse array of `[Option<T>; _]`.
macro_rules! sparse_array {
    ($(
        $index:literal: $value:expr
    ),* $(,)?) => {{
        const SIZE: usize = {
            let mut size = 0;
            $(if $index >= size {
                size = $index + 1;
            })*
            size
        };

        const {
            let mut arr = [None; SIZE];
            $(arr[$index] = Some($value);)*
            arr
        }
    }}
}

fn main() {
    const EXAMPLE: &[Option<u32>] = &sparse_array! {
        0: 1,
        5: 2,
    };
    println!("{:?}", EXAMPLE);
}

Best,
Gary

