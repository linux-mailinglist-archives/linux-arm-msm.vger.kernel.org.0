Return-Path: <linux-arm-msm+bounces-79539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E77C1D791
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 22:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 242894E056E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 21:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34EC299A8F;
	Wed, 29 Oct 2025 21:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/jEsqZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36E213C914
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774131; cv=fail; b=i2Lo3GZknNueffhW1fyvCz5boxvRS7/Lb+VyO5+76j/ihko6NdUFDnOsyS41oxWN+d+wkgAtQLPnRvEokATDlIozeD94t2m3VWH2YEhX/FA/xy05JlE80pJfZif5XUs4oVOdx88np715RvCyn1CMiLSm524zRiep22kpPV0QVVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774131; c=relaxed/simple;
	bh=n+lbtRJMHMZfbjRVw2oMK7Hs6aP5VU3zC6kzex4FHtg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r7s/EVmE5v1PMt7+UJHUOdyol4LJ0LRYeWSlZYgdSuwgs6vJuXzm1MU1JKk0rt/BWmStxRQ5k/Vbi5Nxam2Ae4ZoXVwNfMhKOszpVhpjJXDJcHz4MBIoI416wGW6m0I5oJodh8lYSGwUdrvE9jc7x3Je6AQHXCJpQCGzdqRGhaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/jEsqZ6; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761774130; x=1793310130;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n+lbtRJMHMZfbjRVw2oMK7Hs6aP5VU3zC6kzex4FHtg=;
  b=g/jEsqZ6GkzY3Krmiv7rs0DW782GVv+6knyKuUbWg9Kurmkhyl++Rgtq
   hrftfqsRbgLlbX02bUmEPLE4EA+KsyWJVIx/145WQCyFhtSwBO1xLYCG4
   lvCqAbOjOGDJCjQK4R8rhjEBKbPxd9UC/WFbYWKTvMNkA+l/aK9ZE2CR2
   dsJIaVOl2Y2jpuiQzuiNIPDgNg8oaQncof/fUeSr76uIS4Otxkx/WNHyq
   zAJvfZ3ZBR2Y/8nDQNkKMzbAkIaeTE0MVttbux+tW9UZrPIpI4lcWzGcE
   m1q5NeFPcUFDtiWy+8ZUAGHUmCIIwolobXEGolTXnLPkNdPRxkgw0cDfk
   A==;
X-CSE-ConnectionGUID: BiHcj6JEQ62sRD7KnVjZKg==
X-CSE-MsgGUID: hKhMAXzeQwCPSV3KOu0/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81537188"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="81537188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:42:08 -0700
X-CSE-ConnectionGUID: nL637b20Rnm6dSwsRAam5w==
X-CSE-MsgGUID: EpaN23oNQ9eO7cCgktx1vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="184973504"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:42:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:42:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 14:42:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWIuVwk4OfwLpIvV+1ssojw/3/8tDQU8cxtemJIij6mQNxsqCRutTdJEDkTmrfxzHU4kEaCLF4oTZXpl/ltu8lOIsP/yIlYKQbbo4y8WD+/Yi5BHu0d8PsJdGQFlO9Bg4YhkMjW2rZaPn+GgOvMIiIjW6+tNdAeYNKm4Sbd6BhrV+xGR9p+qnkOEQOyFaWP5uGUttPn6l2kEaqjpc4cLXJoQYuOpraoxXy0SR4r8jdlknJoMOAh22r72soGfadFGM7pU553sMP98Fjb4py16sMEzvH+/CWvefrfHwzqkufur4Ux8DjCFKhrIYZkMj1ad9b3Rc+VOWvv5MvCDCVWW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+lbtRJMHMZfbjRVw2oMK7Hs6aP5VU3zC6kzex4FHtg=;
 b=D1Q+sWbx6qVde87whAgF0Iwv37e2PqFHTVWbvRnqebHzPirKgY2LHey7PlL/VPRvWrTlG27d/pNGqjMbjE4FQhYBy2LGgjVXwcieGw+dAb2gSjD3CkhSTbYHcnVP/EmGv0QxoU4jp6pV0r9T7KO94F5QgTJllABe+fkK/B+nRF3Qc9kWUgrZ5Xd5zq39pYu/5lF/hStD6nJue1Gn6XWZ3VU9ehlrl3hP3rSJOMy5Tz79iLzuSx15EFmiKHW7LfoLjPGNLUhW/2IoN4uUnF9iemi69HPLjJqu9QETkc3KBQJp5rt6PG3ISqWj8tI4zUEzylt4wCF9yCVE+aA0+cCwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 29 Oct 2025 21:42:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 21:42:05 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>, "Nikula, Jani"
	<jani.nikula@intel.com>, "lumag@kernel.org" <lumag@kernel.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"sean@poorly.run" <sean@poorly.run>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Thread-Topic: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Thread-Index: AQHcSFowTO5eveyVB0OA9qufakJZHbTY3/6AgADJB4A=
Date: Wed, 29 Oct 2025 21:42:04 +0000
Message-ID: <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
	 <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
In-Reply-To: <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5373:EE_|DM4PR11MB6501:EE_
x-ms-office365-filtering-correlation-id: ac3b0369-fad8-4662-9f5f-08de173400ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZW9MOU81SGxlMlhMZko5NHR3Q2UxRGZDdFh2RGs0ZXRlcGROcXhYV0hpaXk4?=
 =?utf-8?B?bEtieThqUzZETnpuNkgzcE9NdmNuM29LdUFEdUhYQjUzVDYwSEdObDgrc1Bx?=
 =?utf-8?B?cDJoZkFkM2RyejREUnk3MW1EeU4wRGExclZ3MWxXS0lwN3k4R1BEOXFwSUEr?=
 =?utf-8?B?OEZvM1ByS2wxWDNMQ2VxY05JWVduak5rbUdhc3RaRlBycy9yWHYyTkVoV0Jt?=
 =?utf-8?B?WEJ3czJQK2dFSzNIWGNyNXFrRzNmVEVhRFNQSkNQc0FvTlN0WU0vbTZvaXJa?=
 =?utf-8?B?R1piVkhTYVlMaWRLTUZuWUhtZ0QwUUttUE5JVEl6WEEyZU1zSURYY1F5Tlgr?=
 =?utf-8?B?c25kNFB2S3VNWGt5VVYzOGN3N0g4MmRKSGtkUzdQQUIwQSs3YzNWcnUvS2k0?=
 =?utf-8?B?MGliVjN2emVpaTJJU1krMitoeDdWTDRiTHU2UFg3RjlJa29oSWd0UnJqVElP?=
 =?utf-8?B?TWFoUFVhaGJoaHozQUthbmV3RHI0bHc1VzQxRHFUcWlweFFENVdJUk1ISDkr?=
 =?utf-8?B?WCtMK2FkeGNQd1dta0xOcWhEeVMrNDgxSGpseW1tMW42TnVmSUtodzZFRGRq?=
 =?utf-8?B?UWJ3RkVkT2loRitRMllZNk5XbkpmR2NJKzVwMkI0QzFZdHY0L1g3eWFiMjdL?=
 =?utf-8?B?Tm80MHNTcDBWckxmNWxPelRuRkd2dTVORlkxbnlzRTBiRkpuS2syZkQ2bDNz?=
 =?utf-8?B?K3hwNHNCeWFEa2c2YU5YQnRDUHFSMUd2MHE4cEo3NTlmQTJHazVPQlBVaS9R?=
 =?utf-8?B?b25GWDY3L3MrRWJOR3Z4WWdJK1lJbVIwNGFQU0Zib1BUUHRnNTBPMHpxMVlo?=
 =?utf-8?B?MHEwTVJncVBmaU5xNHVoSkJqSWlXelNmUEwveXY2UEpmUWNJWnlwMzhXZjZR?=
 =?utf-8?B?blFtWlZna1pWQmpMVUxSSUM3TU1WOVBwZjBURlZLQ2xrN1RFQnFwMHNGZGdO?=
 =?utf-8?B?SGJYanFzVFNodGJKaTM3aGhTTmY4TFNqVmtEaFJ6SWJQWVpWb2VxMGRjU0xH?=
 =?utf-8?B?Nit0TDl0NXlraHJ1dnRlY0xTeTM1SUEzbndoUmhNSmlTdjZhazFaME9uNEFw?=
 =?utf-8?B?VlBvNEwwWThQVkxPelRSOGdvRk5iakI5UlA2YU0zOFY5Sno5UE5XRFFIOUxE?=
 =?utf-8?B?a1NaUnRsMko2ZzMzT25VaVNHNEdZTUlRWHMzOEtXOFpOUzkyYnJlQkRvby82?=
 =?utf-8?B?WFFDalZBbFc4UEFFYlVuM3dFR1BpWjhLbFhZejNvbVpnUUJYUkZDeFRnV3pQ?=
 =?utf-8?B?ZUhOeVdyeXFRcjBiRitmbFBXeDlySHowWjdEN3lSeU1nQTFLbTN5QXZORVpY?=
 =?utf-8?B?SUNaaE12dGZnS3VtWWtCVjBkU1Y4OEk3UXduTTg5NU9BK2pmMzdPN2daOUhp?=
 =?utf-8?B?ZmdWU05vR1Q3YTF0bFhLNEdjL0MvMmU1clZwSnZ6ZVpoOFRlUzNHZ004c0Jw?=
 =?utf-8?B?QVJkMlk2cWJRYStEc2JjSm01VVlaNWxxQW81TkFqTFFoaW4raDdmYk9Nc0xx?=
 =?utf-8?B?UVhkMHQ3RVRzVzczR1FtMnFTc0QzcXdHTzlFeU5OeFhraUsvUnVmSEhFVm92?=
 =?utf-8?B?a2ZxYjdDWlp0dXJwVHpnRkJuRUdpVkhpNlJ6cWtsT3pDSmRBVzVtZ1dvdUVE?=
 =?utf-8?B?NWhKcHVtTFozd09DSzM5Rng3Q3RTaFJZUWFNTlprbXdnM3NucDFxaXlpeWMx?=
 =?utf-8?B?M1JmNXBabW1XcGI3eWt0Kys4RlpyeDliSHJ2M0JxWk1ZcklUaGR0UnI4dWdO?=
 =?utf-8?B?WDMyUGN5dWZrM1V4Qm5NaXRpRTgvRjcweWtTWFhUZURZWVBxNFBicjZ5T2Fo?=
 =?utf-8?B?NnhtVWFyWHdidTBGNmJtd2UvanpVWlRoMit3TGVPalBaNFpqNUsvZm1FTVhR?=
 =?utf-8?B?NHhJeWdwZHZLbWVpUWltYUlYcG5GbVpNaVdLZEIrbGFrUUV1c1M2RitSV3Vw?=
 =?utf-8?B?MDBaVGk1MjFUdDFFajNkejl2VkR6Si9zVXhibGN4UDdYNDdvQ1dHVGZ5SjlZ?=
 =?utf-8?B?dHpxd2IrMkpMcklDQzJteTlyMXpKVTBvK1c2VThBRnhEWFhqM0pOY0pRUEts?=
 =?utf-8?Q?+kmfUk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5373.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RktSUnVxTWlNZFZ5RWlkSVorWXFWSmQ2b0hMZ0RpM0loZ01Yb29NeFJBYnJC?=
 =?utf-8?B?VmJPUS9rZnJGa2dTelFDVG04Yi84ZUZXNU1WQmJPdjdnbis1ZFBiUXlIdmpp?=
 =?utf-8?B?RzlrWEJXVU1qNC9tNnlRQVBlWVBBWTJKOFFPZnpVSzh0UFgrSE0yY3lYYXNn?=
 =?utf-8?B?U0ZPaEFObTIyc0orMjNZT3VqaUQ5bVlqeTRjMUJQelZkMGh3RlhmNXczdFlw?=
 =?utf-8?B?TlQ5a2lYZThYUkc3bDAxdnJwVTZiUndNcHE1K0JVMEh3SWgxVlBQQlljcHMw?=
 =?utf-8?B?QjJXQUlLNDUwMHgzZ2JJSkNyRk05Vks5dXhzMVVQREU4NWtqTU1WSTFKOEtk?=
 =?utf-8?B?TUxzKzRYZWRmTWFmdW1JTytTWVp6RWg2Q0Z0S3BMbEpFRXp5emtyWjZuM1o2?=
 =?utf-8?B?YUQyemZlVWF1T3RYQndNS0xERmdkbForNTNKNUp0MWdqSHpzQ2o2RlVGQ1RL?=
 =?utf-8?B?a2NPVUJiUmpGa0FLc2FXZFV1WFI5Y1BVblRpd1kyNFZFbkU5aUlVYy9VZWVV?=
 =?utf-8?B?S1IvaFZ5cnN4ckVRWDNpYUxoS0V2dWorVkxvSzIwelF1aTJQUkNXaDZpV0Vv?=
 =?utf-8?B?YitjSDFGTUVuKzFYVS9yRUtySVB5ZldjWGJRVVFaV0V3RTEvdHJBU25Pa0tn?=
 =?utf-8?B?TkxCaVZBbUhiUzdZcTM4cmxKVkRjdVpHVXhhczN3WGJWeTl5QzhkdWlmYTg5?=
 =?utf-8?B?eE14dG9jbElKUGFzRVhabVp1TnRUYVd0SldjNTRyRUxlV1o0VE9ZRVVkTUZ6?=
 =?utf-8?B?RG5FaHpmbFA3a3RLV0RQWUVOYTBMaDBsRDVDZGR1Y3JYSmM1SWZLWGZ0TDRV?=
 =?utf-8?B?aVVKK002QkRVbFRpTDZpaEJib3kyWXlPdUdlMS9RSTBXMmpkcUQwaTNManFR?=
 =?utf-8?B?cFhiL0RUYVhlb2djblFsYlN2WlFNMTRHcmNXbmwzV2h2SE5kOS9CaTE0OGY0?=
 =?utf-8?B?R3A2QmNiN0d4ajN5Nk9ZZGhhUS9tWG1pbWJ0K1VGL29XbUJQeFhVVHV2U0gr?=
 =?utf-8?B?eEJnem5uRUYxR0k4SElqVm85UG5ZQWlkZjlLUXJIVEd2N2ZmNFpCM1VReW5I?=
 =?utf-8?B?bzZkK0tacmM1bXJhZmIzTmFVUy9QUkljaDV4cWd0WWtNR1lXbzZzSU9Ua2FB?=
 =?utf-8?B?VDdDbGZablNQbXBrTkozV0Fwb1NCSVg5UGtvb0R5bzVwNzVTcXFlOUJRKytU?=
 =?utf-8?B?VDMrMWJwZWpsRnI3ek5DYVptd05acmo0eWtVckVvaFB6NXR0SHE4OEZSeE9B?=
 =?utf-8?B?TU1MTzVBQUtKSGpEalhIRlVKaG9CSDFGcXhnejV1STZRNCtYMXpUMitLd3lB?=
 =?utf-8?B?RDIvYzF0MXZodUNndUgwTXhiWFRWN1diZlIvMnpxOGJqOEpGb0R6YnZpbXg2?=
 =?utf-8?B?K1ZWQzdqd1VkVFJLcFFuS1Q4Q0RwdjVtVGJLZFZnSjlJclUzMkZOWmMzUUNE?=
 =?utf-8?B?dWkvUGJQbHhOVE1ORC80SG8wRGRMMGU2Z1YrNFN6MGpvUWw3VlJTR05Yeito?=
 =?utf-8?B?VWc2dW5XZTdHWmRKZGtQSDRTNHhWVGczblo1aGVTL29RWXdTK0Jod2swZDlx?=
 =?utf-8?B?K0xIRDBoWmg0V3o2akN4ZmdHQWFZVTNBV3BWRTF6K2RncDhveUFuU1pTOUZo?=
 =?utf-8?B?SWxrME9nS3A3MmJheHlERFYzS0RGbmJDMEd3TmU4N2xQSmNsRFVITVJnNGN5?=
 =?utf-8?B?b3lEcy92RnNmZk0xQUN0eHZxa2ZONVlUUUlVTTdhQXBUNDlNWkFKVUlzVlN5?=
 =?utf-8?B?TGNqMm43ZkdGRmhNTEhxanBRZXdoUnYvRW9qQXdvS3Bkci9uRFpTdzl3cTBC?=
 =?utf-8?B?VFBCWXlVMlk1dk9GM1VZN2xzNE91c3dmUElFVVRaQkcvRktVclRkL1RqaHpw?=
 =?utf-8?B?eEVId1BjQit0Z2dkLzlsOEFQTHJRRitobU5FK2ppQ0VhZTFmVWNzOHp5a1hU?=
 =?utf-8?B?eHZqYUprcXZaa1g1MFdZZnNvczQzTFN5dFozNUFPYVgvdW15NEY2Rnk2TzZz?=
 =?utf-8?B?cHFGaWdSTFgvanFZMHFpLzJiQVc0ZmdYWWdkWml5RUpQSWd2cjl5QmNhK3VN?=
 =?utf-8?B?UFJpVFVXMTZVQ2ZUQllOamhFVmNaQk1IZkZjYVNtV2ZXZ1IyMGl2QW5pbWNr?=
 =?utf-8?B?Vm4xTkMwK1phelhsYkRzMFJFTmIwVXFENzlKQlcrbHZxcVdoS0pSdVczVWo5?=
 =?utf-8?Q?35ftlWyD2mByIRK3MR9KBVY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <822736A927E58741A0E64E0717218956@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3b0369-fad8-4662-9f5f-08de173400ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 21:42:04.9527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQoDoUEqBeFXd3mjJ8DQtmwbEzepN+9uQH+qL5e0mvZO8C3xRopGzHyCVBXgJe5KcwOwWoNeIkGfo8nyiEu2s0yDbkwCtVU3sk5qSTR6SLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDEwOjQyICswMTAwLCBLb25yYWQgRHliY2lvIHdyb3RlOg0K
PiBPbiAxMC8yOC8yNSAxMToyOCBQTSwgS2hhbGVkIEFsbWFoYWxsYXd5IHdyb3RlOg0KPiA+IFRo
ZSBEUF9URVNUX0xJTktfRkFVWF9QQVRURVJOIGZpZWxkIHdhcyBkZXByZWNhdGVkIGluIHRoZSBE
UCAxLjMNCj4gPiBzcGVjLg0KPiA+IFVwZGF0ZSBpdHMgbmFtZSB0byBhbGlnbiB3aXRoIHRoZSBE
UCAyLjEgZGVmaW5pdGlvbiBhbmQgcmVmbGVjdCBpdHMNCj4gPiBhY3R1YWwgdXNlIGluIHRoZSBj
b2RlLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+ID4gDQo+ID4gQ2M6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gQ2M6IFJvYiBDbGFyayA8cm9iaW4uY2xhcmtAb3Nz
LnF1YWxjb21tLmNvbT4NCj4gPiBDYzogRG1pdHJ5IEJhcnlzaGtvdiA8bHVtYWdAa2VybmVsLm9y
Zz4NCj4gPiBDYzogQWJoaW5hdiBLdW1hciA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT4NCj4g
PiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2hh
bGVkIEFsbWFoYWxsYXd5IDxraGFsZWQuYWxtYWhhbGxhd3lAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9saW5rLmMgfCAyICstDQo+ID4gwqBpbmNs
dWRlL2RybS9kaXNwbGF5L2RybV9kcC5owqDCoMKgwqAgfCAyICstDQo+ID4gwqAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9saW5rLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHAvZHBfbGluay5jDQo+ID4gaW5kZXggNjZlMWJiZDgwZGIzLi41ZDQ2NWNmNGRi
YzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9saW5rLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2xpbmsuYw0KPiA+IEBAIC02NjUsNyAr
NjY1LDcgQEAgc3RhdGljIGludCBtc21fZHBfbGlua19wYXJzZV9yZXF1ZXN0KHN0cnVjdA0KPiA+
IG1zbV9kcF9saW5rX3ByaXZhdGUgKmxpbmspDQo+ID4gwqAJCXJldHVybiBybGVuOw0KPiA+IMKg
CX0NCj4gPiDCoA0KPiA+IC0JaWYgKCFkYXRhIHx8IChkYXRhID09IERQX1RFU1RfTElOS19GQVVY
X1BBVFRFUk4pKSB7DQo+ID4gKwlpZiAoIWRhdGEgfHwgKGRhdGEgPT0NCj4gPiBEUF9URVNUX1BI
WV9URVNUX0NIQU5ORUxfQ09ESU5HX1RZUEUpKSB7DQo+ID4gwqAJCWRybV9kYmdfZHAobGluay0+
ZHJtX2RldiwgImxpbmsgMHgleCBub3QNCj4gPiBzdXBwb3J0ZWRcbiIsIGRhdGEpOw0KPiA+IMKg
CQlnb3RvIGVuZDsNCj4gPiDCoAl9DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3Bs
YXkvZHJtX2RwLmgNCj4gPiBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gPiBpbmRl
eCBlNGVlYmFiYWI5NzUuLjYxMGI4Y2JmMTEyNSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAu
aA0KPiA+IEBAIC04NDksNyArODQ5LDcgQEANCj4gPiDCoCMgZGVmaW5lIERQX1RFU1RfTElOS19W
SURFT19QQVRURVJOCcKgwqDCoCAoMSA8PCAxKQ0KPiA+IMKgIyBkZWZpbmUgRFBfVEVTVF9MSU5L
X0VESURfUkVBRAkJwqDCoMKgICgxIDw8IDIpDQo+ID4gwqAjIGRlZmluZSBEUF9URVNUX0xJTktf
UEhZX1RFU1RfUEFUVEVSTgnCoMKgwqAgKDEgPDwgMykgLyogRFBDRCA+PQ0KPiA+IDEuMSAqLw0K
PiA+IC0jIGRlZmluZSBEUF9URVNUX0xJTktfRkFVWF9QQVRURVJOCcKgwqDCoCAoMSA8PCA0KSAv
KiBEUENEID49DQo+ID4gMS4yICovDQo+ID4gKyMgZGVmaW5lIERQX1RFU1RfUEhZX1RFU1RfQ0hB
Tk5FTF9DT0RJTkdfVFlQRQnCoMKgwqAgKDEgPDwgNCkNCj4gDQo+IEkgdGhpbmsgaXQnZCBiZSB1
c2VmdWwgdG8ga2VlcCBhIGNvbW1lbnQgb2Ygd2hhdCBpdCB3YXMgYmVmb3JlIHRoZQ0KPiBkZXBy
ZWNhdGlvbiBhbmQgcmVuYW1lDQoNCkdpdmVuIHRoYXQgbXNtIGlzIGN1cnJlbnRseSB0aGUgb25s
eSBkcml2ZXIgdGhhdCByZWFkcyB0aGlzIGJpdCBhbmQNCmNvcnJlY3RseSBpbnRlcnByZXRzIGl0
IHdoZW4gaGFuZGxpbmcgYXV0b21hdGVkIHRlc3QgcmVxdWVzdHMgdG8NCmRldGVybWluZSAxMjhi
LzEzMmIgc3VwcG9ydOKAlGFuZCBmb2xsb3dpbmcgdGhlIHN0eWxlIHVzZWQgdGhyb3VnaG91dA0K
dGhpcyBmaWxlLCBzaW5jZSBJIGRvbuKAmXQgc2VlIG90aGVyIGV4YW1wbGVzIHJlZmVyZW5jaW5n
IGRlcHJlY2F0ZWQNCm5hbWVzIGluIGNvbW1lbnRzDQoNCndoYXQgZG8geW91IHRoaW5rIGFib3V0
IHVzaW5nIHNvbWV0aGluZyBsaWtlIHRoaXMgaW5zdGVhZD8NCg0KI2RlZmluZSBEUF9URVNUX1BI
WV9URVNUX0NIQU5ORUxfQ09ESU5HX1RZUEUgICgxIDw8IDQpIC8qIERQIDIuMSAqLw0KDQpUaGFu
ayBZb3UNCktoYWxlZA0KPiANCj4gS29ucmFkDQoNCg==

