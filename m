Return-Path: <linux-arm-msm+bounces-118981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OpEIM3TrVWq4vwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:55:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB397521B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:55:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YN77Obya;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFF9D3033F95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C2D3F39EA;
	Tue, 14 Jul 2026 07:55:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4853E1D04;
	Tue, 14 Jul 2026 07:55:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015730; cv=fail; b=k7gVz8futt91P8z0R+0pCUInUM9hg1plLC3qMF+tz1Pt8YViOkbofvE7Zcqs93rSUM9Jgj5u9/3u924Z+r9VNnFrwmm8N0TVor/hn+A431Qcl0dVhgCe19QnTNFxNPIyboQ8c0sUzaV46u0fTMWNivblY1tGsz3L4RVSzg3QvYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015730; c=relaxed/simple;
	bh=Clg3t/f74uuzkcD+AkUKHYKgFi5pXZGwD2L+gMY7Dw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aJhK75ff+YNYzyg8/n/6FNNYDtL6BLFYFOSk4k9O/dcS6Xz1q0s9n+k3mwfyCup8aziL6nPv5B2zVd6H7eqkp69/qUK+/EFccFMxusYu+/njyVbanVr8K315hoDWUY0vdJJ4f/e2+3GVzUrU8uDeTY3RWiNJYlcOoS65JROd47M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YN77Obya; arc=fail smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784015728; x=1815551728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Clg3t/f74uuzkcD+AkUKHYKgFi5pXZGwD2L+gMY7Dw4=;
  b=YN77ObyaX7Ik90tyoI/uttcKpJJBGECEgQlh3JSwdSV4NCaB64202izi
   qyx/D8htC6k4aM4qtkzcocB91Ek0c12bIFIuVwKALJmSEKy8D3oVu9iDz
   2JrJlCkfryMywOPhfAcCWg5WrV82fEdlq1xSEMeMfodGI/3YHAxaeSm3r
   ebguFXXhiZitt+ahsLvP8/oqKz0htjEDWFTRa5+ysWQdm/Bmf9XsPFlCQ
   EuJfbaSYBbaZIEoY3zPKeEDBoQZzIJjeWdLoIHIlrqtTni+5P4mJeGGN8
   wXpGQHo0Hv7ouEn/3CgKiHLcyk/UwOTHCbzjCwIU8s8asHrpmIeB237Pe
   Q==;
X-CSE-ConnectionGUID: PDWNcgeYSR2xul1s+6Jz1w==
X-CSE-MsgGUID: rqL/yAjATWS6KVgqxpCbuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84751189"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84751189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:55:27 -0700
X-CSE-ConnectionGUID: s0godBuSQ82qlQBffyFubg==
X-CSE-MsgGUID: nw5G0U2PTA2ITOxncxZGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="255283622"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:55:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 00:55:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 00:55:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 00:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jubeW67QAkqNkPiMS85HJvqLF3WXYUdanLEd0s6/HMChCn1hwcE+sgNU4vuXEGuxDa0tkh86+uvbTRxY4miNlclWlyLC0FROoNgbBWk3KBkSmSaJQeTelFrcTjcfj8ytZ6Nf6AKWbxOeTGUC94uM1goX0xgG6Zm97Vn0+zjW64D4hXy2AANUS3zcTR906K0AIZp/kumWoEiz/fHPLVugGcNF8wAjtQBje/UPzMPGlttKQBpdNH/ARh/ebw39Htv7OVDzhkkr0QxS/155vpSfDFuT76o508fFOWZ8mlskAzsczdX1bwxzVjhl8Uxz3R+9rBrgQp4eWAwP3798J2l3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Clg3t/f74uuzkcD+AkUKHYKgFi5pXZGwD2L+gMY7Dw4=;
 b=SoMBW8HyGRwQXizZjbeo8JzP60gocBBTmcg+KE93gcnvR7Bvhxgg6TmD/Me3+lYvrXkIWdNCFvlWEa/pzhWNb8Bjr6ekc25T3FylmB6qVnr5Op9tXC4qJCqb8pVSXUulTxeGTDkccmeUaXbEIzzzYB+grYVP15bwc+QyNSAweQDV101DslndTH4vETblB78+aRpmmCoTZ/AA1+9TV6KZ+r3xYF4gW34vFLtRV8sqDHcSK1QyxxFOLgXkQwVt8l57ImkU5WETBQNGpAFD87HoFWZM04h6FpnO7Q9M+HB2pNK5HR7pJcMWc2PjbhDN0YtPDIIx2BBMR4+Z3HGUcJTDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by DS4PPFFCBF1B4C7.namprd11.prod.outlook.com (2603:10b6:f:fc02::62) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Tue, 14 Jul
 2026 07:55:22 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 07:55:22 +0000
From: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, Stephan Gerhold
	<stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, "Sergey
 Ryazanov" <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chris.lew@oss.qualcomm.com" <chris.lew@oss.qualcomm.com>, Deepak Kumar Singh
	<deepak.singh@oss.qualcomm.com>
Subject: RE: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
Thread-Topic: [PATCH 2/2] net: wwan: qcom_bam_dmux: Alloc RX buffers as a
 single coherent block
Thread-Index: AQHdE1Ks6bcxF0U78ESzr8E8Eg3aj7ZspRfg
Date: Tue, 14 Jul 2026 07:55:21 +0000
Message-ID: <PH0PR11MB59022A1E06830365E6D224B4F0F92@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-2-3f29da7cca76@oss.qualcomm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|DS4PPFFCBF1B4C7:EE_
x-ms-office365-filtering-correlation-id: dde0887f-4720-4be7-f70b-08dee17d418a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|5023799004|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info: hwgzH571GhYwhSUtry5kRJ02guWBF+rN9GLwHQbBA36s29F70tlhxhVi3nmBllvVwJZaEfhDNDPn/cRFFrK9cAxBZh+24v/LNMoDjFJu0RZY0myynviNJgtuTSBHJ7GdmpGgSbjLV/3kXlGlefEYLNgtGcVhwjEIA8DcipzUwlkfwFNlHRXBerO/UjqQtuV2EBdecOpdQCr5uAUk6BxfQvg1NTFd7fpppQ7+qEmSTjmEZX0bN733/saLiV14BvRAtS02/FfEE2Mba3rkBYUjs5xbClMYElGNxR+dabw7kcRw6mrKXcA/OJ4LaTdbKIBbWJ395E/78MCDjNY7PtYGPhwHQtn4S9g1K7iigjRkffnLe3pw+4EyLVJ4b5uxJZjd1kgZGMAbFBb83dlF32EXmf23Rw8f4NnDxEi5XBSIEGU6rcTsBd71rtoXoYtwdg1QbOzN0B5KSABCx5LmxPHfjQRzL6uAgjb1JPnHZyN1Sarara42tJpimmszd2IYRCychoavImoBzyXnPQzxFUrINYPl5DJj3miXnazELuumFltgq0CeRm1Xe/PCqQ2fi6RRS4n4r1qV8gi+tha3rcpaBt1NzZTS4xsZIJSvVdKjXTaFhrI6kA5i4bpe6urtKu5lVo7uusVAE5woUk8TeMxa4p4PkLGuhzq/Bn+Nvp3YVWxhmk2u5N+orQWXx5s1fSn0eRoW7VfnPJ61m9vCVZu0sulOePGEVSHD36kyOgVgMmZB09BZtMthJsO+YKGI1LT/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(5023799004)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWppVk1TV2hoMFZzU3ZETFRYUDB0VXh5aEpiUEg2d003R1NQeUU1QlQ5YThD?=
 =?utf-8?B?Yi9JMndSKzFQYlBUaDRPQnpGKzJza2tRSXdSNFJVYVhpWC81Y0tlb01YY2hL?=
 =?utf-8?B?OG5lUkJZdmVhSVFKVTJ6OCtFNDJ1Mko4T0lONGpsWTZDVWRpNHM5ekNwRCtL?=
 =?utf-8?B?RG1yOFRSTFhSSVFIVmQrUlIzN2piWmhUYm9BbkcyL1UzWWNWbnZKc29SS2d0?=
 =?utf-8?B?Um96Q3lyRWVwdW8rWitZKzN2RFo5dTA5blR0S0F1WW9kR2NIczArWG9UM2FS?=
 =?utf-8?B?WXJaN2N1QXNSOWV4VGRIWlhnUGJoOGxzeWJpRWlmV1R2TzhkUjNLSEJKQ0tE?=
 =?utf-8?B?bnluSGhvRmp2K2dGZ3J0OWNKVGFQanQ2ZGZVNTdzaThvWUdTcXkzS2ZsblVt?=
 =?utf-8?B?TzFmSGs4M2d0TGpRRUpTY0hUUlc4NmtZdW9BMjRxRDVOTytjcEhpSmk4RUFN?=
 =?utf-8?B?blA0R1NST0tFS0VWd0o4Nng1RWJsWDRHdVorZmZDTVEwbTlvZkJkL0psemxD?=
 =?utf-8?B?cFluL0RKYm5ZdWdoNHFNbVVZNjBHdWtvK2doS3RwSlgyOHpEa2xmckc4UzhC?=
 =?utf-8?B?dmQ0WEE0Um9sam4vT2U1amF6ZjRkbEp6T2hHWSs0QlA0ZzJxMFF1UmUwTHVv?=
 =?utf-8?B?ODdBc245b0oxL3AvT05MUjZFMTVtVGtLL3hZblhqa1YwbzN0b3hsNnVLaDY3?=
 =?utf-8?B?K3Z6TXRZYi94cDhCR2NhQUtWa2RqcnBzYy9yNGlXUVdRWDdJVU4xVkpxMGxX?=
 =?utf-8?B?OEtIb0duOGd5K05yejQ2TlUzQ2o0elZnbmN5R2tiRTlkOGJqcVhablJNZ0Fr?=
 =?utf-8?B?NmY0UXBCZDZlWHB3WnpML1E0RkVyRFRxRW5UOGZjOFNIYXpVVUxsQkpCcUtS?=
 =?utf-8?B?WjhJRnZIRUtiaS9PM21SUFBTRWYvOFFvbytFZXFyQjg0cnB5VkxiS2l6TWZK?=
 =?utf-8?B?UjlOUzRVSzJxck9nTnBHRXBzU0NzTzZHcEhFSm9Cd3BTNXJLL05yNGZteGZt?=
 =?utf-8?B?MVFLRHZHWmc1dytPNTZWU0lyYk1WdC95d1U2WTFNV1kxV05hV2VBaE8wNDkw?=
 =?utf-8?B?Uy9uYjJxTmw5YUFjc3hYTFJhM0tNNHZQejlCbHVnUE1tWjFaMmg3NlRLd2Vt?=
 =?utf-8?B?alptTEcwTXZOb013dHBkUjBUNUJtQkVjdHBpbWFWT3FJQVIzOVlVVTBwNXdR?=
 =?utf-8?B?cGFaYzltb1czUm5tR1ZSRXh2TCtza2w1UEx2RURraGQrbDFqK3ZxSTBjNHda?=
 =?utf-8?B?WXpnSEp5UFQrcm5oK2NJbmIvTk9uRmhpeXRqNHlkRVBZQ0FNRHdiWmJzUyth?=
 =?utf-8?B?eHlYNGM1MDJzUmt0R0lSSEp0eWxxKzRCRDJXaTNHVkUyZHZlYXRWYjlRYkRm?=
 =?utf-8?B?RlpHbG92cUhqUXczSVJ6R2pmM0JPbUpscmNLMWpUZm1nR1BqS2xqMGFkcmtJ?=
 =?utf-8?B?WU41M0MvS1NUa2p2S1NQZ1FhcEh1Z003NjhGQVZ1dGkyMm5SdHVyQnZsRWQw?=
 =?utf-8?B?cnVqOHBJamVTdFJ3OGxJa1QyTlpFM3ZDTmJnb0F5djZ2WnVQV3R6QVhDNERQ?=
 =?utf-8?B?NzR3cXBrWDJNbHl6ZVRHaU1wY0lvV21wdHN3UDNHZzZQZGl3SjZ4Ni8vT0M3?=
 =?utf-8?B?TWQxN29VZ2laYkpMREk1QnRMRmdaVXA5VEljMEo5bVBCenAyb3FJZmVURXdn?=
 =?utf-8?B?SnJ1YmhvSlFzTjh1d1RQTVlGWWs4NFpHcEZlWnN6dUswcVIwWThIR212L1Yx?=
 =?utf-8?B?ZEx2enhtQS9mV1lOcG5mTVRJT0plM2drN2EvMysxUUlicUZEL3JtaVdXblhW?=
 =?utf-8?B?L25FSTZFWXJDTC91cFVwVllCN0dsblYyT2JXWkhoSTVtYXF6UVJ1LzRWbWxP?=
 =?utf-8?B?c2lGekhGNEZBRTNyRGpRNVNyeXRPVDVidW93aVNlRUh6dVNZLzF1NWNLUVFU?=
 =?utf-8?B?cUlEV3FjZFR3WjczZjNlRVROZ0tNb0NrcWJ3djJXWHA0b3k3YWpsWnVkSi9u?=
 =?utf-8?B?OTVHSjBWUzF6dldXdC83VXlXcXpLdWtaU0lzd0YvOGN3OHNSMDZSNit3MkVL?=
 =?utf-8?B?bDlDVzhNZTV6TGdmU3RoL3Z1NENHN0NIUUdrcXpqWHh3N20wTWpOclJzTGkx?=
 =?utf-8?B?Y2h5VG5PbFFXd203YzBnN2FYakhrbml3YW1VQU5nRUMxVmlOTGhzb3lqNFVN?=
 =?utf-8?B?T3JObzA3ajIza0JMdllRK3RSVjcxeUVmU0dPZzZMRXlhdFJOb2txWTk2eVpI?=
 =?utf-8?B?ZDgyZWNWRi8vRVFNS294T0ljVXV0N1YzVGliU09jNzdycEIyZkdha2hzM0ZL?=
 =?utf-8?B?U2p4MElvc2NJOGlFQVJHRDNLc3kzbmVEbDhVZDNnNkp4S2NuUXg4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o/hI1U5mdo2d8XFjJiiw7XV37wVGXs0GECqrkymqGkOwXQ63rM+Crhtnbhbh0eJkWqM7c/xmZFW3PuKWKrubQdySlsR6vm6B9igp0050OhAShEGzlK/YPMunFKdDzH25icOUVoYP87XiYX42Cc9JtzmbNrJjMbw9Jo3zVwfeSHjVYuxIJpHn4GRiVnwyiKH/Acp2vQ1BTXpkfwkgwB4apfRAem+UjEweAiDmk6j42Yrf6zBp/2dK2luMmmDcTdo3jbzJ79ptWXuq0ckgyGZLbDRMvRnAVwU1volwtZ9hq6AAr0pF+h2RViiscTeyyiYmCgXk1NWhVAQiK46PQlH8Wg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde0887f-4720-4be7-f70b-08dee17d418a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 07:55:21.9542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97+FRWQWuzQcRPOb2Upywrxb/0jxJh+C60VGiALesRVouandJX28Cp2Bd8iS4FXnV7qLKkua8fRUV0jrjBzNIKUMATgFZlhZJTWl7JPjTCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFCBF1B4C7
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.56 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118981-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jedrzej.jagielski@intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,sipsolutions.net];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jedrzej.jagielski@intel.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AB397521B7

RnJvbTogVmlzaG51IFNhbnRob3NoIDx2aXNobnUuc2FudGhvc2hAb3NzLnF1YWxjb21tLmNvbT4g
DQpTZW50OiBUdWVzZGF5LCBKdWx5IDE0LCAyMDI2IDc6MzMgQU0NCg0KPk9uIFF1YWxjb21tIFNv
Q3Mgd2hlcmUgdGhlIG1vZGVtIChlLmcuIHRoZSBtRFNQIG9uIFNoaWtyYSwgVk1JRCA0MyAvDQo+
TkFWKSBpcyB0aGUgQVhJIG1hc3RlciBmb3IgQkFNLURNVVggUlggdHJhbnNmZXJzIGFuZCB0aGUg
WFBVIGVuZm9yY2VzDQo+cGVyLXJlZ2lvbiBhY2Nlc3MgY29udHJvbCwgZWFjaCBpbmRpdmlkdWFs
bHkgRE1BLW1hcHBlZCBSWCBidWZmZXINCj5yZXF1aXJlcyBpdHMgb3duIFhQVSByZXNvdXJjZSBn
cm91cCAoUkcpLiBXaXRoIH4xNiBSR3MgYXZhaWxhYmxlLCB0aGUNCj4zMiBwZXItYnVmZmVyIGRt
YV9tYXBfc2luZ2xlKCkgY2FsbHMgZXhoYXVzdCB0aGUgdGFibGUgYW5kIHRoZSBmaXJzdA0KPmlu
Ym91bmQgdHJhbnNmZXIgZmF1bHRzIHdpdGggYW4gWFBVIHZpb2xhdGlvbi4NCj4NCj5CQU0tRE1V
WCBpcyBhIHNpbmdsZXRvbiAoZXhhY3RseSBvbmUgaW5zdGFuY2UgcGVyIFNvQyksIHNvIHRoZQ0K
PmRlc3RpbmF0aW9uIFZNSUQgZG9lcyBub3QgbmVlZCB0byBiZSBhIERUIHByb3BlcnR5OyBpdCBp
cyBsb29rZWQgdXANCj5mcm9tIHRoZSBjb21wYXRpYmxlIHN0cmluZydzIG1hdGNoIGRhdGEgaW5z
dGVhZC4gQWRkIHN0cnVjdA0KPmJhbV9kbXV4X2RhdGEgd2l0aCBhIHNpbmdsZSB2bWlkIGZpZWxk
LCBhbmQgYSBzaGlrcmFfZGF0YSBpbnN0YW5jZQ0KPmhhcmRjb2RpbmcgUUNPTV9TQ01fVk1JRF9O
QVYgZm9yIHFjb20sc2hpa3JhLWJhbS1kbXV4Lg0KPg0KPldoZW4gbWF0Y2ggZGF0YSBpcyBwcmVz
ZW50LCBhbGxvY2F0ZSBhbGwgQkFNX0RNVVhfTlVNX1NLQiBSWCBidWZmZXJzIGFzDQo+YSBzaW5n
bGUgY29udGlndW91cyBkbWFfYWxsb2NfY29oZXJlbnQoKSBibG9jayBhbmQgU0NNLWFzc2lnbiB0
aGF0DQo+YmxvY2sgdG8gSExPUyBwbHVzIHRoZSBWTUlEIG9uY2UgYXQgcHJvYmUuIFRoaXMgcmVk
dWNlcyBSRyBjb25zdW1wdGlvbg0KPmZyb20gMzIgdG8gMS4gVGhlIGJsb2NrIGlzIG5ldmVyIHJl
Y2xhaW1lZCBhY3Jvc3MgYSBtb2RlbSBwb3dlciBjeWNsZQ0KPihiYW1fZG11eF9wb3dlcl9vZmYo
KSBkb2VzIG5vdCB0b3VjaCBpdCksIHNvIHRoZSBwcm9iZS10aW1lIGFzc2lnbm1lbnQNCj5jb3Zl
cnMgZXZlcnkgc3Vic2VxdWVudCByZXN0YXJ0IHdpdGhvdXQgcmUtYXNzaWduaW5nIG9yIHJlY2xh
aW1pbmcuIEl0DQo+aXMgcmVjbGFpbWVkIHRvIEhMT1Mgb25seSBvbmNlLCBhdCByZW1vdmUgb3Ig
b24gYSBwcm9iZSBlcnJvciwgYW5kIGlmDQo+dGhhdCByZWNsYWltIGZhaWxzIGl0IGlzIGxlYWtl
ZCByYXRoZXIgdGhhbiByZXR1cm5lZCB0byB0aGUgcGFnZQ0KPmFsbG9jYXRvci4NCj4NCj5FYWNo
IHJ4X3NrYnNbXSBzbG90IGlzIHByZS1hc3NpZ25lZCBpdHMgdmlydHVhbCBhbmQgRE1BIGFkZHJl
c3MgZnJvbQ0KPnRoZSBibG9jaywgc28gbm8gcGVyLWJ1ZmZlciBtYXBwaW5nIGlzIG5lZWRlZCBh
dCBwb3dlci1vbi4gQmVjYXVzZSB0aGUNCj5jb2hlcmVudCBibG9jayBpcyBub3QgcGFnZS1iYWNr
ZWQsIHJlY2VpdmVkIHBheWxvYWQgaXMgY29waWVkIGludG8gYQ0KPnJlZ3VsYXIgbmV0ZGV2IHNr
YiBiZWZvcmUgaGFuZG9mZiB0byB0aGUgbmV0d29yayBzdGFjazsgdGhpcyBpcyBhbg0KPnVuYXZv
aWRhYmxlIGV4dHJhIGNvcHkgb24gdGhlIFhQVS1lbmZvcmNlZCBSWCBwYXRoLg0KPg0KPlBsYXRm
b3JtcyB3aXRob3V0IG1hdGNoIGRhdGEgYXJlIHVuYWZmZWN0ZWQ6IHJ4X3ZpcnQgc3RheXMgTlVM
TCwgbm8NCj5jb2hlcmVudCBtZW1vcnkgaXMgYWxsb2NhdGVkLCBhbmQgdGhlIHBlci1idWZmZXIg
ZG1hX21hcF9zaW5nbGUoKSBwYXRoDQo+aXMgdW5jaGFuZ2VkLg0KPg0KPkNvLWRldmVsb3BlZC1i
eTogRGVlcGFrIEt1bWFyIFNpbmdoIDxkZWVwYWsuc2luZ2hAb3NzLnF1YWxjb21tLmNvbT4NCj5T
aWduZWQtb2ZmLWJ5OiBEZWVwYWsgS3VtYXIgU2luZ2ggPGRlZXBhay5zaW5naEBvc3MucXVhbGNv
bW0uY29tPg0KPlNpZ25lZC1vZmYtYnk6IFZpc2hudSBTYW50aG9zaCA8dmlzaG51LnNhbnRob3No
QG9zcy5xdWFsY29tbS5jb20+DQo+LS0tDQo+IGRyaXZlcnMvbmV0L3d3YW4vS2NvbmZpZyAgICAg
ICAgIHwgICAxICsNCj4gZHJpdmVycy9uZXQvd3dhbi9xY29tX2JhbV9kbXV4LmMgfCAxMzQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+IDIgZmlsZXMgY2hhbmdlZCwg
MTI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC93d2FuL0tjb25maWcgYi9kcml2ZXJzL25ldC93d2FuL0tjb25maWcNCj5pbmRleCA5
NThkYmM3MzQ3ZmE4NGVlODY5NDM5YmY4YjUwMzAzN2ZhYWI4YmVmLi4xYjEzM2M1NjIzMTYxNTI2
OTY5ODE0MDE4N2NhMzE0MWRmZTQ4ZGJmIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvbmV0L3d3YW4v
S2NvbmZpZw0KPisrKyBiL2RyaXZlcnMvbmV0L3d3YW4vS2NvbmZpZw0KPkBAIC02NSw2ICs2NSw3
IEBAIGNvbmZpZyBNSElfV1dBTl9NQklNDQo+IGNvbmZpZyBRQ09NX0JBTV9ETVVYDQo+IAl0cmlz
dGF0ZSAiUXVhbGNvbW0gQkFNLURNVVggV1dBTiBuZXR3b3JrIGRyaXZlciINCj4gCWRlcGVuZHMg
b24gKERNQV9FTkdJTkUgJiYgUE0gJiYgUUNPTV9TTUVNX1NUQVRFKSB8fCBDT01QSUxFX1RFU1QN
Cj4rCXNlbGVjdCBRQ09NX1NDTQ0KPiAJaGVscA0KPiAJICBUaGUgQkFNIERhdGEgTXVsdGlwbGV4
ZXIgcHJvdmlkZXMgYWNjZXNzIHRvIHRoZSBuZXR3b3JrIGRhdGEgY2hhbm5lbHMNCj4gCSAgb2Yg
bW9kZW1zIGludGVncmF0ZWQgaW50byBtYW55IG9sZGVyIFF1YWxjb21tIFNvQ3MsIGUuZy4gUXVh
bGNvbW0NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd3dhbi9xY29tX2JhbV9kbXV4LmMgYi9k
cml2ZXJzL25ldC93d2FuL3Fjb21fYmFtX2RtdXguYw0KPmluZGV4IGNjNmFjZThkNjQzNzFlYjhk
MDBjNjM4YTM5YjIzNGVlNTQwYjgzYzkuLjI0NzIzMGI3MjBlNjAxMTg3NmQ1YzQyOWJhZGJiNWEx
ZjM0ZmM1NzYgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9uZXQvd3dhbi9xY29tX2JhbV9kbXV4LmMN
Cj4rKysgYi9kcml2ZXJzL25ldC93d2FuL3Fjb21fYmFtX2RtdXguYw0KPkBAIC05LDEwICs5LDEy
IEBADQo+ICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+DQo+ICNpbmNsdWRlIDxsaW51eC9k
bWEtbWFwcGluZy5oPg0KPiAjaW5jbHVkZSA8bGludXgvZG1hZW5naW5lLmg+DQo+KyNpbmNsdWRl
IDxsaW51eC9maXJtd2FyZS9xY29tL3Fjb21fc2NtLmg+DQo+ICNpbmNsdWRlIDxsaW51eC9pZl9h
cnAuaD4NCj4gI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQo+ICNpbmNsdWRlIDxsaW51eC9uZXRkZXZpY2UuaD4NCj4rI2luY2x1ZGUgPGxp
bnV4L29mLmg+DQo+ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gI2luY2x1
ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gI2luY2x1ZGUgPGxpbnV4L3NvYy9xY29tL3NtZW1f
c3RhdGUuaD4NCj5AQCAtNjIsNiArNjQsNyBAQCBzdHJ1Y3QgYmFtX2RtdXhfc2tiX2RtYSB7DQo+
IAlzdHJ1Y3QgYmFtX2RtdXggKmRtdXg7DQo+IAlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOw0KPiAJZG1h
X2FkZHJfdCBhZGRyOw0KPisJdm9pZCAqcnhfdmlydDsgLyogbm9uLU5VTEw6IHNsb3QgaW4gdGhl
IGNvaGVyZW50IFJYIGJsb2NrICovDQo+IH07DQo+IA0KPiBzdHJ1Y3QgYmFtX2RtdXggew0KPkBA
IC03NSw2ICs3OCwxMCBAQCBzdHJ1Y3QgYmFtX2RtdXggew0KPiAJc3RydWN0IGNvbXBsZXRpb24g
cGNfYWNrX2NvbXBsZXRpb247DQo+IA0KPiAJc3RydWN0IGRtYV9jaGFuICpyeCwgKnR4Ow0KPisJ
LyogU2luZ2xlIGNvaGVyZW50IGJsb2NrIGJhY2tpbmcgYWxsIFJYIGJ1ZmZlcnMsIE5VTEwgaWYg
dW51c2VkICovDQo+Kwl2b2lkICpyeF9idWY7DQo+KwlkbWFfYWRkcl90IHJ4X2J1Zl9kbWE7DQo+
Kwl1NjQgcnhfYnVmX3Blcm1zOyAvKiBTQ00gc291cmNlLVZNSUQgYml0bWFzayBvZiByeF9idWYg
Ki8NCj4gCXN0cnVjdCBiYW1fZG11eF9za2JfZG1hIHJ4X3NrYnNbQkFNX0RNVVhfTlVNX1NLQl07
DQo+IAlzdHJ1Y3QgYmFtX2RtdXhfc2tiX2RtYSB0eF9za2JzW0JBTV9ETVVYX05VTV9TS0JdOw0K
PiAJc3BpbmxvY2tfdCB0eF9sb2NrOyAvKiBQcm90ZWN0IHR4X3NrYnMsIHR4X25leHRfc2tiICov
DQo+QEAgLTkyLDYgKzk5LDEwIEBAIHN0cnVjdCBiYW1fZG11eF9uZXRkZXYgew0KPiAJdTggY2g7
DQo+IH07DQo+IA0KPitzdHJ1Y3QgYmFtX2RtdXhfZGF0YSB7DQo+Kwl1MzIgdm1pZDsNCj4rfTsN
Cj4rDQoNCmRvIHdlIG5lZWQgdG8gaW50cm9kdWNlIGRlZGljYXRlZCBzdHJ1Y3QganVzdCB0byBj
b3ZlciB1MzI/DQoNCj4gc3RhdGljIHZvaWQgYmFtX2RtdXhfcGNfdm90ZShzdHJ1Y3QgYmFtX2Rt
dXggKmRtdXgsIGJvb2wgZW5hYmxlKQ0KPiB7DQo+IAlyZWluaXRfY29tcGxldGlvbigmZG11eC0+
cGNfYWNrX2NvbXBsZXRpb24pOw0KPkBAIC0xMTEsNiArMTIyLDkgQEAgc3RhdGljIGJvb2wgYmFt
X2RtdXhfc2tiX2RtYV9tYXAoc3RydWN0IGJhbV9kbXV4X3NrYl9kbWEgKnNrYl9kbWEsDQo+IHsN
Cj4gCXN0cnVjdCBkZXZpY2UgKmRldiA9IHNrYl9kbWEtPmRtdXgtPmRldjsNCj4gDQo+KwlpZiAo
c2tiX2RtYS0+cnhfdmlydCkgLyogY29oZXJlbnQgUlggc2xvdDogYWRkciBwcmUtYXNzaWduZWQg
Ki8NCj4rCQlyZXR1cm4gdHJ1ZTsNCj4rDQo+IAlza2JfZG1hLT5hZGRyID0gZG1hX21hcF9zaW5n
bGUoZGV2LCBza2JfZG1hLT5za2ItPmRhdGEsIHNrYl9kbWEtPnNrYi0+bGVuLCBkaXIpOw0KPiAJ
aWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgc2tiX2RtYS0+YWRkcikpIHsNCj4gCQlkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBETUEgbWFwIGJ1ZmZlclxuIik7DQo+QEAgLTEyNCw2ICsxMzgsOSBA
QCBzdGF0aWMgYm9vbCBiYW1fZG11eF9za2JfZG1hX21hcChzdHJ1Y3QgYmFtX2RtdXhfc2tiX2Rt
YSAqc2tiX2RtYSwNCj4gc3RhdGljIHZvaWQgYmFtX2RtdXhfc2tiX2RtYV91bm1hcChzdHJ1Y3Qg
YmFtX2RtdXhfc2tiX2RtYSAqc2tiX2RtYSwNCj4gCQkJCSAgIGVudW0gZG1hX2RhdGFfZGlyZWN0
aW9uIGRpcikNCj4gew0KPisJaWYgKHNrYl9kbWEtPnJ4X3ZpcnQpIC8qIGNvaGVyZW50IFJYIHNs
b3Q6IG5vdGhpbmcgdG8gdW5tYXAgKi8NCj4rCQlyZXR1cm47DQo+Kw0KPiAJZG1hX3VubWFwX3Np
bmdsZShza2JfZG1hLT5kbXV4LT5kZXYsIHNrYl9kbWEtPmFkZHIsIHNrYl9kbWEtPnNrYi0+bGVu
LCBkaXIpOw0KPiAJc2tiX2RtYS0+YWRkciA9IDA7DQo+IH0NCj5AQCAtNDY4LDkgKzQ4NSwxMCBA
QCBzdGF0aWMgYm9vbCBiYW1fZG11eF9za2JfZG1hX3N1Ym1pdF9yeChzdHJ1Y3QgYmFtX2RtdXhf
c2tiX2RtYSAqc2tiX2RtYSkNCj4gew0KPiAJc3RydWN0IGJhbV9kbXV4ICpkbXV4ID0gc2tiX2Rt
YS0+ZG11eDsNCj4gCXN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqZGVzYzsNCj4rCXNp
emVfdCBsZW4gPSBza2JfZG1hLT5yeF92aXJ0ID8gQkFNX0RNVVhfQlVGRkVSX1NJWkUgOiBza2Jf
ZG1hLT5za2ItPmxlbjsNCg0KcGxlYXNlIHN0aWNrIHRvIFJDVA0KcGxlYXNlIGZpeCBpdCBoZXJl
IGFuZCBmb3IgdGhlIGZvbGxvd2luZyB3aGVyZSBSQ1QgaXMgdmlvbGF0ZWQNCg0KPiANCj4gCWRl
c2MgPSBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zaW5nbGUoZG11eC0+cngsIHNrYl9kbWEtPmFkZHIs
DQo+LQkJCQkJICAgc2tiX2RtYS0+c2tiLT5sZW4sIERNQV9ERVZfVE9fTUVNLA0KPisJCQkJCSAg
IGxlbiwgRE1BX0RFVl9UT19NRU0sDQo+IAkJCQkJICAgRE1BX1BSRVBfSU5URVJSVVBUKTsNCj4g
CWlmICghZGVzYykgew0KPiAJCWRldl9lcnIoZG11eC0+ZGV2LCAiRmFpbGVkIHRvIHByZXBhcmUg
UlggRE1BIGJ1ZmZlclxuIik7DQo+QEAgLTQ4NSw2ICs1MDMsMTAgQEAgc3RhdGljIGJvb2wgYmFt
X2RtdXhfc2tiX2RtYV9zdWJtaXRfcngoc3RydWN0IGJhbV9kbXV4X3NrYl9kbWEgKnNrYl9kbWEp
DQo+IA0KPiBzdGF0aWMgYm9vbCBiYW1fZG11eF9za2JfZG1hX3F1ZXVlX3J4KHN0cnVjdCBiYW1f
ZG11eF9za2JfZG1hICpza2JfZG1hLCBnZnBfdCBnZnApDQo+IHsNCj4rCS8qIENvaGVyZW50IFJY
IHNsb3RzIGhhdmUgcnhfdmlydCBhbmQgYWRkciBwcmUtYXNzaWduZWQgYXQgcHJvYmUuICovDQo+
KwlpZiAoc2tiX2RtYS0+cnhfdmlydCkNCj4rCQlyZXR1cm4gYmFtX2RtdXhfc2tiX2RtYV9zdWJt
aXRfcngoc2tiX2RtYSk7DQo+Kw0KPiAJaWYgKCFza2JfZG1hLT5za2IpIHsNCj4gCQlza2JfZG1h
LT5za2IgPSBfX25ldGRldl9hbGxvY19za2IoTlVMTCwgQkFNX0RNVVhfQlVGRkVSX1NJWkUsIGdm
cCk7DQo+IAkJaWYgKCFza2JfZG1hLT5za2IpDQo+QEAgLTQ5OSw5ICs1MjEsMTAgQEAgc3RhdGlj
IGJvb2wgYmFtX2RtdXhfc2tiX2RtYV9xdWV1ZV9yeChzdHJ1Y3QgYmFtX2RtdXhfc2tiX2RtYSAq
c2tiX2RtYSwgZ2ZwX3QgZ2YNCj4gc3RhdGljIHZvaWQgYmFtX2RtdXhfY21kX2RhdGEoc3RydWN0
IGJhbV9kbXV4X3NrYl9kbWEgKnNrYl9kbWEpDQo+IHsNCj4gCXN0cnVjdCBiYW1fZG11eCAqZG11
eCA9IHNrYl9kbWEtPmRtdXg7DQo+LQlzdHJ1Y3Qgc2tfYnVmZiAqc2tiID0gc2tiX2RtYS0+c2ti
Ow0KPi0Jc3RydWN0IGJhbV9kbXV4X2hkciAqaGRyID0gKHN0cnVjdCBiYW1fZG11eF9oZHIgKilz
a2ItPmRhdGE7DQo+KwlzdHJ1Y3QgYmFtX2RtdXhfaGRyICpoZHIgPSBza2JfZG1hLT5yeF92aXJ0
ID8gc2tiX2RtYS0+cnhfdmlydCA6DQo+KwkJCQkgICAoc3RydWN0IGJhbV9kbXV4X2hkciAqKXNr
Yl9kbWEtPnNrYi0+ZGF0YTsNCj4gCXN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYgPSBkbXV4LT5u
ZXRkZXZzW2hkci0+Y2hdOw0KPisJc3RydWN0IHNrX2J1ZmYgKnNrYjsNCj4gDQo+IAlpZiAoIW5l
dGRldiB8fCAhbmV0aWZfcnVubmluZyhuZXRkZXYpKSB7DQo+IAkJZGV2X3dhcm4oZG11eC0+ZGV2
LCAiRGF0YSBmb3IgaW5hY3RpdmUgY2hhbm5lbCAldVxuIiwgaGRyLT5jaCk7DQo+QEAgLTUxNCwx
MCArNTM3LDE4IEBAIHN0YXRpYyB2b2lkIGJhbV9kbXV4X2NtZF9kYXRhKHN0cnVjdCBiYW1fZG11
eF9za2JfZG1hICpza2JfZG1hKQ0KPiAJCXJldHVybjsNCj4gCX0NCj4gDQo+LQlza2JfZG1hLT5z
a2IgPSBOVUxMOyAvKiBIYW5kIG92ZXIgdG8gbmV0d29yayBzdGFjayAqLw0KPi0NCj4tCXNrYl9w
dWxsKHNrYiwgc2l6ZW9mKCpoZHIpKTsNCj4tCXNrYl90cmltKHNrYiwgaGRyLT5sZW4pOw0KPisJ
aWYgKHNrYl9kbWEtPnJ4X3ZpcnQpIHsNCj4rCQkvKiBDb2hlcmVudCBibG9jayBpcyBub3QgcGFn
ZS1iYWNrZWQ6IGNvcHkgb3V0IHRvIGEgcmVhbCBza2IgKi8NCj4rCQlza2IgPSBuZXRkZXZfYWxs
b2Nfc2tiKG5ldGRldiwgaGRyLT5sZW4pOw0KPisJCWlmICghc2tiKQ0KPisJCQlyZXR1cm47DQo+
KwkJc2tiX3B1dF9kYXRhKHNrYiwgKHU4ICopc2tiX2RtYS0+cnhfdmlydCArIHNpemVvZigqaGRy
KSwgaGRyLT5sZW4pOw0KPisJfSBlbHNlIHsNCj4rCQlza2IgPSBza2JfZG1hLT5za2I7DQo+KwkJ
c2tiX2RtYS0+c2tiID0gTlVMTDsgLyogSGFuZCBvdmVyIHRvIG5ldHdvcmsgc3RhY2sgKi8NCj4r
CQlza2JfcHVsbChza2IsIHNpemVvZigqaGRyKSk7DQo+KwkJc2tiX3RyaW0oc2tiLCBoZHItPmxl
bik7DQo+Kwl9DQo+IAlza2ItPmRldiA9IG5ldGRldjsNCj4gDQo+IAkvKiBPbmx5IFJhdy1JUC9R
TUFQIGlzIHN1cHBvcnRlZCBieSB0aGlzIGRyaXZlciAqLw0KPkBAIC01NzQsMTAgKzYwNSwxNCBA
QCBzdGF0aWMgdm9pZCBiYW1fZG11eF9yeF9jYWxsYmFjayh2b2lkICpkYXRhKQ0KPiB7DQo+IAlz
dHJ1Y3QgYmFtX2RtdXhfc2tiX2RtYSAqc2tiX2RtYSA9IGRhdGE7DQo+IAlzdHJ1Y3QgYmFtX2Rt
dXggKmRtdXggPSBza2JfZG1hLT5kbXV4Ow0KPi0Jc3RydWN0IHNrX2J1ZmYgKnNrYiA9IHNrYl9k
bWEtPnNrYjsNCj4tCXN0cnVjdCBiYW1fZG11eF9oZHIgKmhkciA9IChzdHJ1Y3QgYmFtX2RtdXhf
aGRyICopc2tiLT5kYXRhOw0KPisJc3RydWN0IGJhbV9kbXV4X2hkciAqaGRyOw0KPiANCj4tCWJh
bV9kbXV4X3NrYl9kbWFfdW5tYXAoc2tiX2RtYSwgRE1BX0ZST01fREVWSUNFKTsNCj4rCWlmIChz
a2JfZG1hLT5yeF92aXJ0KSB7DQo+KwkJaGRyID0gc2tiX2RtYS0+cnhfdmlydDsgLyogY29oZXJl
bnQgUlg6IG5vIHNrYiB0byB1bm1hcCAqLw0KPisJfSBlbHNlIHsNCj4rCQliYW1fZG11eF9za2Jf
ZG1hX3VubWFwKHNrYl9kbWEsIERNQV9GUk9NX0RFVklDRSk7DQo+KwkJaGRyID0gKHN0cnVjdCBi
YW1fZG11eF9oZHIgKilza2JfZG1hLT5za2ItPmRhdGE7DQo+Kwl9DQo+IA0KPiAJaWYgKGhkci0+
bWFnaWMgIT0gQkFNX0RNVVhfSERSX01BR0lDKSB7DQo+IAkJZGV2X2VycihkbXV4LT5kZXYsICJJ
bnZhbGlkIG1hZ2ljIGluIGhlYWRlcjogJSN4XG4iLCBoZHItPm1hZ2ljKTsNCj5AQCAtNjQ0LDYg
KzY3OSw5IEBAIHN0YXRpYyB2b2lkIGJhbV9kbXV4X2ZyZWVfc2ticyhzdHJ1Y3QgYmFtX2RtdXhf
c2tiX2RtYSBza2JzW10sDQo+IAlmb3IgKGkgPSAwOyBpIDwgQkFNX0RNVVhfTlVNX1NLQjsgaSsr
KSB7DQo+IAkJc3RydWN0IGJhbV9kbXV4X3NrYl9kbWEgKnNrYl9kbWEgPSAmc2tic1tpXTsNCj4g
DQo+KwkJaWYgKHNrYl9kbWEtPnJ4X3ZpcnQpIC8qIGNvaGVyZW50IGJsb2NrIGZyZWVkIGF0IHJl
bW92ZSAqLw0KPisJCQljb250aW51ZTsNCj4rDQo+IAkJaWYgKHNrYl9kbWEtPmFkZHIpDQo+IAkJ
CWJhbV9kbXV4X3NrYl9kbWFfdW5tYXAoc2tiX2RtYSwgZGlyKTsNCj4gCQlpZiAoc2tiX2RtYS0+
c2tiKSB7DQo+QEAgLTc2Miw2ICs4MDAsNzEgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBi
YW1fZG11eF9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IAlyZXR1cm4gMDsN
Cj4gfQ0KPiANCj4rc3RhdGljIGludCBiYW1fZG11eF9hbGxvY19jb2hlcmVudF9yeChzdHJ1Y3Qg
YmFtX2RtdXggKmRtdXgpDQo+K3sNCj4rCXN0cnVjdCBkZXZpY2UgKmRldiA9IGRtdXgtPmRldjsN
Cj4rCWNvbnN0IHN0cnVjdCBiYW1fZG11eF9kYXRhICpkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7DQo+KwlzaXplX3Qgc2l6ZSA9IEJBTV9ETVVYX05VTV9TS0IgKiBCQU1fRE1V
WF9CVUZGRVJfU0laRTsNCj4rCXU2NCBzcmMgPSBCSVRfVUxMKFFDT01fU0NNX1ZNSURfSExPUyk7
DQo+KwlzdHJ1Y3QgcWNvbV9zY21fdm1wZXJtIGRzdFsyXTsNCj4rCWludCBpLCByZXQ7DQo+Kw0K
PisJaWYgKCFkYXRhKQ0KPisJCXJldHVybiAwOw0KDQppcyB0aGVyZSBhY3R1YWxseSBhbnkgY2hh
bmNlIHRvIHJlYWxseSB0cmlnZ2VyIHRoYXQgY2hlY2s/DQpvciBqdXN0IHRoZW9yZXRpY2FsIGNh
c2U/DQoNCj4rDQo+KwlpZiAoIXFjb21fc2NtX2lzX2F2YWlsYWJsZSgpKQ0KPisJCXJldHVybiAt
RVBST0JFX0RFRkVSOw0KPisNCj4rCWRzdFswXS52bWlkID0gUUNPTV9TQ01fVk1JRF9ITE9TOw0K
PisJZHN0WzBdLnBlcm0gPSBRQ09NX1NDTV9QRVJNX1JXOw0KPisJZHN0WzFdLnZtaWQgPSBkYXRh
LT52bWlkOw0KPisJZHN0WzFdLnBlcm0gPSBRQ09NX1NDTV9QRVJNX1JXOw0KPisNCj4rCWRtdXgt
PnJ4X2J1ZiA9IGRtYV9hbGxvY19jb2hlcmVudChkZXYsIHNpemUsICZkbXV4LT5yeF9idWZfZG1h
LCBHRlBfS0VSTkVMKTsNCj4rCWlmICghZG11eC0+cnhfYnVmKQ0KPisJCXJldHVybiAtRU5PTUVN
Ow0KPisNCj4rCWZvciAoaSA9IDA7IGkgPCBCQU1fRE1VWF9OVU1fU0tCOyBpKyspIHsNCj4rCQlk
bXV4LT5yeF9za2JzW2ldLnJ4X3ZpcnQgPSBkbXV4LT5yeF9idWYgKyBpICogQkFNX0RNVVhfQlVG
RkVSX1NJWkU7DQo+KwkJZG11eC0+cnhfc2tic1tpXS5hZGRyID0gZG11eC0+cnhfYnVmX2RtYSAr
IGkgKiBCQU1fRE1VWF9CVUZGRVJfU0laRTsNCj4rCX0NCj4rDQo+KwlyZXQgPSBxY29tX3NjbV9h
c3NpZ25fbWVtKGRtdXgtPnJ4X2J1Zl9kbWEsIHNpemUsICZzcmMsIGRzdCwgQVJSQVlfU0laRShk
c3QpKTsNCj4rCWlmIChyZXQpIHsNCj4rCQlkZXZfZXJyKGRldiwgIlNDTSBhc3NpZ24gUlggYmxv
Y2sgZmFpbGVkOiAlZFxuIiwgcmV0KTsNCj4rCQlkbWFfZnJlZV9jb2hlcmVudChkZXYsIHNpemUs
IGRtdXgtPnJ4X2J1ZiwgZG11eC0+cnhfYnVmX2RtYSk7DQo+KwkJZG11eC0+cnhfYnVmID0gTlVM
TDsNCj4rCQlyZXR1cm4gcmV0Ow0KPisJfQ0KPisJZG11eC0+cnhfYnVmX3Blcm1zID0gc3JjOw0K
PisNCj4rCXJldHVybiAwOw0KPit9DQo+Kw0KPitzdGF0aWMgdm9pZCBiYW1fZG11eF9mcmVlX2Nv
aGVyZW50X3J4KHN0cnVjdCBiYW1fZG11eCAqZG11eCkNCj4rew0KPisJc3RydWN0IHFjb21fc2Nt
X3ZtcGVybSBobG9zID0gew0KPisJCS52bWlkID0gUUNPTV9TQ01fVk1JRF9ITE9TLA0KPisJCS5w
ZXJtID0gUUNPTV9TQ01fUEVSTV9SVywNCj4rCX07DQo+KwlzaXplX3Qgc2l6ZSA9IEJBTV9ETVVY
X05VTV9TS0IgKiBCQU1fRE1VWF9CVUZGRVJfU0laRTsNCj4rDQo+KwlpZiAoIWRtdXgtPnJ4X2J1
ZikNCj4rCQlyZXR1cm47DQo+Kw0KPisJaWYgKGRtdXgtPnJ4X2J1Zl9wZXJtcykgew0KPisJCWlm
IChxY29tX3NjbV9hc3NpZ25fbWVtKGRtdXgtPnJ4X2J1Zl9kbWEsIHNpemUsICZkbXV4LT5yeF9i
dWZfcGVybXMsDQo+KwkJCQkJJmhsb3MsIDEpKSB7DQo+KwkJCWRldl9lcnIoZG11eC0+ZGV2LCAi
U0NNIHJlY2xhaW0gUlggYmxvY2sgZmFpbGVkOyBsZWFraW5nXG4iKTsNCj4rCQkJcmV0dXJuOw0K
PisJCX0NCj4rCQlkbXV4LT5yeF9idWZfcGVybXMgPSAwOw0KPisJfQ0KPisNCj4rCWRtYV9mcmVl
X2NvaGVyZW50KGRtdXgtPmRldiwgc2l6ZSwgZG11eC0+cnhfYnVmLCBkbXV4LT5yeF9idWZfZG1h
KTsNCj4rCWRtdXgtPnJ4X2J1ZiA9IE5VTEw7DQo+K30NCj4rDQo+IHN0YXRpYyBpbnQgYmFtX2Rt
dXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gew0KPiAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj5AQCAtODA5LDYgKzkxMiwxMCBAQCBzdGF0aWMgaW50
IGJhbV9kbXV4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IAkJZG11eC0+
dHhfc2tic1tpXS5kbXV4ID0gZG11eDsNCj4gCX0NCj4gDQo+KwlyZXQgPSBiYW1fZG11eF9hbGxv
Y19jb2hlcmVudF9yeChkbXV4KTsNCj4rCWlmIChyZXQpDQo+KwkJcmV0dXJuIHJldDsNCj4rDQo+
IAkvKiBSdW50aW1lIFBNIG1hbmFnZXMgb3VyIG93biBwb3dlciB2b3RlLg0KPiAJICogTm90ZSB0
aGF0IHRoZSBSWCBwYXRoIG1heSBiZSBhY3RpdmUgZXZlbiBpZiB3ZSBhcmUgcnVudGltZSBzdXNw
ZW5kZWQsDQo+IAkgKiBzaW5jZSBpdCBpcyBjb250cm9sbGVkIGJ5IHRoZSByZW1vdGUgc2lkZS4N
Cj5AQCAtODQ1LDYgKzk1Miw3IEBAIHN0YXRpYyBpbnQgYmFtX2RtdXhfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gZXJyX2Rpc2FibGVfcG06DQo+IAlwbV9ydW50aW1lX2Rp
c2FibGUoZGV2KTsNCj4gCXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZGV2KTsNCj4r
CWJhbV9kbXV4X2ZyZWVfY29oZXJlbnRfcngoZG11eCk7DQo+IAlyZXR1cm4gcmV0Ow0KPiB9DQo+
IA0KPkBAIC04NzksMTMgKzk4NywxOSBAQCBzdGF0aWMgdm9pZCBiYW1fZG11eF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gCWRpc2FibGVfaXJxKGRtdXgtPnBjX2lycSk7
DQo+IAliYW1fZG11eF9wb3dlcl9vZmYoZG11eCk7DQo+IAliYW1fZG11eF9mcmVlX3NrYnMoZG11
eC0+dHhfc2ticywgRE1BX1RPX0RFVklDRSk7DQo+KwliYW1fZG11eF9mcmVlX2NvaGVyZW50X3J4
KGRtdXgpOw0KPiB9DQo+IA0KPiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgYmFtX2Rt
dXhfcG1fb3BzID0gew0KPiAJU0VUX1JVTlRJTUVfUE1fT1BTKGJhbV9kbXV4X3J1bnRpbWVfc3Vz
cGVuZCwgYmFtX2RtdXhfcnVudGltZV9yZXN1bWUsIE5VTEwpDQo+IH07DQo+IA0KPitzdGF0aWMg
Y29uc3Qgc3RydWN0IGJhbV9kbXV4X2RhdGEgc2hpa3JhX2RhdGEgPSB7DQo+Kwkudm1pZCA9IFFD
T01fU0NNX1ZNSURfTkFWLA0KPit9Ow0KPisNCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgYmFtX2RtdXhfb2ZfbWF0Y2hbXSA9IHsNCj4rCXsgLmNvbXBhdGlibGUgPSAicWNvbSxz
aGlrcmEtYmFtLWRtdXgiLCAuZGF0YSA9ICZzaGlrcmFfZGF0YSB9LA0KPiAJeyAuY29tcGF0aWJs
ZSA9ICJxY29tLGJhbS1kbXV4IiB9LA0KPiAJeyAvKiBzZW50aW5lbCAqLyB9DQo+IH07DQo+DQo+
LS0gDQo+Mi4zNC4xDQoNCg0K

