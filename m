Return-Path: <linux-arm-msm+bounces-79604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376EC1F156
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84EAD4EAAB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3285B338936;
	Thu, 30 Oct 2025 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9nNHFK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67975339702;
	Thu, 30 Oct 2025 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814072; cv=fail; b=Vg0LIzmbdEOFJC5quS1UmMgQoSTBkbo9jE2yZolH/ft2eQfyPx31r81TBQQdpd3hv8re6hvEqxXL+nyBa8q2ZNysXjIey8PuTJHjV11MRYiiHfFS++LOkm0KMydsHmmaRPEo+WH8nqzCP7xSowPNyFZ2zqNCDJv/9ZDo6OazOho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814072; c=relaxed/simple;
	bh=7HJrQIcdvjrqvrwCfMdtv/Wofi/kGmpbuA1E5WFnSw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rWMM82gdoRnUdQB9YfeBH4kKl9R+7bVyogqegtTt8GN5mu2R+XkRhcl9c4A5+OJHVtWJfzFy3zDrRIWnE2ZL8XlBx6EDgKUQ7d4+Ii1tFtDO3m4GHYvRO2FJFMEsRFbbdzIS3zWExdwf/n1FXcMFPeQgbw8LwW6T05wBmyRzmOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9nNHFK9; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761814071; x=1793350071;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7HJrQIcdvjrqvrwCfMdtv/Wofi/kGmpbuA1E5WFnSw4=;
  b=k9nNHFK93ubIkopnoQIMTXZxwpvir1eAlQgaj1mmwQx6rm/RkRi+a3wm
   zWAAF6+48KD6rKLesuTIN0gwEE5EgsryK25Ni4Zedi5AAz7VoNmZW4hlI
   gFCvVF8ULW6eT23Cuc7JSuIWB2oy8xxrjbegJTfKsRvD2noXxD1ht7pvh
   euT7auksgMHzTJXcfiac34lKHSGr0Zv6re2eg5CGpJnG7lJlVrHQrQdvU
   HBeTv9CRYHluAwdjEp25GbcOvrjDjwlLkS534inSRWXADngAwS65fmtnd
   76JEhv4TEpdrRSFej3uhH3gjn7b99KovwVPsvljZd/zo+Mb3emak9zHRn
   g==;
X-CSE-ConnectionGUID: th4XkhNiTeaX03DtGwVjwg==
X-CSE-MsgGUID: 4PFZ4+1HTc2KlbQJ1X4AtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63981895"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63981895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:47:29 -0700
X-CSE-ConnectionGUID: 3bTe7Nu2TMuj83Cgky0jOA==
X-CSE-MsgGUID: PwwpMsq7Swa0EsGj/2CVEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185553276"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:47:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 01:47:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 01:47:27 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 01:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdNA1OmlDafitTHLTa0lr0aIaPqxHdElNox9RCjy8NeAwuSDmWgRq4PRcnCe23bi/Go0Sa0+8/vgUJFFaRI4V3XMBzIEKL0zokcqwFCpwKG4Z7fvUcEERhi6U5svnKk7/hQEkmOwjKTU4z8QCYcoPkb9LJ2IFWeHRm1kpyBPJF/Y28nNT07UWu50pR8vkDwLQPQrEjfD6wVutaDP7Lk8BzWwLGjgKGp90TW3i0FHq5LmuwyhkJ4odpq4rwvMw1BAclUgjysQfS6j6mePP3KAp47tFZiR5tB1HBICEDkn4f2zR/0Xe3uYOcZfgBXaKSLJj9/a4/OcJ3mpGG04A4M1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s1/VJEF3Mz6y1ZYiTygT6SlCVzCFUvaKEE+HsfUI14=;
 b=DPaZ7SWr7gnoeMtvT0AqBLCe3j7hrM+hIxX+Ru795ga0bIBdCBEp/SmGzivlKcKjsfqtGdADAO7Unevwf5ZuOKM/7NQq1HLPHc+nBHxtcFwMV1nvjU+P8hJB4sJ6rUTAvRQpkaPbBMYDkYsXHOGkqOMF+DQcbClhsSgB4ba4aNZC2qZQ/COwiM79E3Nfhh8LuYprR5a9eoerhQNXE2y+IFsBU98wLTGWPlCgk56BvC80h343oi8H60hlEW82iCYpJ4pbD/4+LT1W+F2DWNrxfJ0qUovAoBOyzZgY5fZM9SuVNs9UAyluOHKyKjEdlumKE9HG4qPSEEBpi9phMmKv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 08:47:19 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 08:47:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"jgg@nvidia.com" <jgg@nvidia.com>
CC: "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "sven@kernel.org" <sven@kernel.org>, "j@jannau.net"
	<j@jannau.net>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "tjeznach@rivosinc.com"
	<tjeznach@rivosinc.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "heiko@sntech.de" <heiko@sntech.de>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>, "mjrosato@linux.ibm.com"
	<mjrosato@linux.ibm.com>, "wens@csie.org" <wens@csie.org>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Thread-Topic: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Thread-Index: AQHcO9UzG68S0waveEiEek0NizPUfLTadzaA
Date: Thu, 30 Oct 2025 08:47:18 +0000
Message-ID: <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
In-Reply-To: <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB7115:EE_
x-ms-office365-filtering-correlation-id: 134eb5b2-587a-43a1-85e9-08de1790ef20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?zFwgEXejoRwZpUwM1WwS3JLSTeqfHO4cBmjZM2JtH7FM7vf1ub9S3zuRgynH?=
 =?us-ascii?Q?bKuYMnOYy0mPYOy7mMgYKUUMTLjawOWSLlZyC5uswjfvtCHWY9lq3J8HHMQd?=
 =?us-ascii?Q?G6jBTzqRvZ0u5ARf7A5iHynI70VbHi7bDmixPJdXt6tZ0iFPwVZyf9z3i/0G?=
 =?us-ascii?Q?mlcvN07MBjXqTLw3WTG86ZSI8mFPtMV36z+GIDtxvN5sg0NUrJtd5ZchYv35?=
 =?us-ascii?Q?hRN9TMlKy4HbfaZe7GMkrk1H4BpwzuLc4DfH6u1tjhshR9d6scqyKf76fmtu?=
 =?us-ascii?Q?E4apEbBB2gWUJmHXMPCWEK+2EsSPXhdThWJXSlfgzEDaAxpXIcp4QIv1kjaX?=
 =?us-ascii?Q?rnFWEdCKvukeJRTeABkiD/xTBz7S3TUg47jy4Loatv1EcMsHhqDha3HoGCM+?=
 =?us-ascii?Q?kY71ozfoo1FqeuCQsG2s7k51697NfUMI6mB0Y6pug2K+qyuuPd1MdEJEObyV?=
 =?us-ascii?Q?hVasgPZvceQW1eMosut4HG4kLFI7ClCBubGfsLNDt9yymlwZYK8TR0IPsJqa?=
 =?us-ascii?Q?/zEWZWb08M254Uz1vj0dMSSHVnQw9iKd3ENHOcnIATqBOYLifKE0cTEWlmq+?=
 =?us-ascii?Q?ajfahPmgiseVgP3elnl8mHuvbL2FcbsKbMlkIAATYVu9PifOfCZV4zdJKgK1?=
 =?us-ascii?Q?sHUnsCWID0QDmGsyG5ryDC6d0Ig2+p1dCA3NNdIxE38edN/uOCPmL8gAO5Qr?=
 =?us-ascii?Q?RI3lcWntXIJoFmLJ/J9eRCfDHTsyrQL2uLvgdrq87k25RGx0rRQX9vx3Qy2B?=
 =?us-ascii?Q?Tl87/qktaHaK0x/T4LIjTOubfBAVL8VTk10y0IaDFX+nXrH3J7t3MxtRnIuc?=
 =?us-ascii?Q?Pr4aY/Tipt1WHYqxRLQWRJQ4lChAx7FziIyLDvI2j5SJ3i8TVuf+ZW4vrM3m?=
 =?us-ascii?Q?EX4ZBK0dLYjXDVb2HubKTaQV1/kizQiby70x3/d3BC1O0noAIZGXxeP30ENF?=
 =?us-ascii?Q?SX5wjgXWGzGhVL+KdwDGNnn1++pqAGhubtBr4kHN0P29rzrz376cqFBgYcFZ?=
 =?us-ascii?Q?NAte2ElecLeGSXq7RYoAFe8UBnHLxZxQjK5Uf5XyCXdNMUCy2eom3zFKFmp1?=
 =?us-ascii?Q?zBD4GQUgtylPqjiZmofFv9OwhCTx90CGXnLvyd+EJePI+AI3dMalGwYnYqKv?=
 =?us-ascii?Q?QhuXJDfYj1C/evvfKIzvo/SgEnW0eTx3cT4GrIqViV1Wv2kTOUs5OsbNS2uO?=
 =?us-ascii?Q?lMGe2D11tEbMz1RHFvsAepE4p1k03TdubKYBDdlBEN1yHQx/z0gbbaQlmpHb?=
 =?us-ascii?Q?qksVaMJYc46F3i5spuzQB+AEreh0Io/mhczslvuXUrUMwEwzByV0CxeMBT8G?=
 =?us-ascii?Q?Hlxqecx670lEy9vSjw5W4iDItWd/HZKGZl3G6dmYhM/ojipUmt5jQFvYYNKU?=
 =?us-ascii?Q?UjuaqLKBVbKg3Rl0sMaVxPhTQjGCQfDYaaTVzk0HPKGQuYmrZ9Fb5ywl43Ph?=
 =?us-ascii?Q?4fubwok8PPUYSwBwLI7yXWqLYgNDOi9Hm4wO9CHCsXqUYHyvook3df8dLZEL?=
 =?us-ascii?Q?j/mS4ObvXuTmeGdrBf/WGtMAc639bMnRS3Ha?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E1p6Zz6lEE2WVzQIwIIdQ/mZC1E75R/hhJvUKQiOwLjAeFcxuXBWY/CWUBrp?=
 =?us-ascii?Q?uGQpqvbnn2cnIsN+JBxSJCndzDWgv6rIJAdq8i+6j7CY2BP/+g1o+gzFOFO6?=
 =?us-ascii?Q?Lz3+jvil1OeOc4k+AkNsW6Ypw5qYPNja7+I+zZn/DLGJaP2RaZm9kjipIv9r?=
 =?us-ascii?Q?Ete1X+WrhInXqs610+gIC4YQBA4gLMtBhqzOm7f6412Ec2Fpqx3gpP4QvvSl?=
 =?us-ascii?Q?q1uN+BpSro7uoCZ5NjooWKXEK4QrliJiHxfQONvHUYrWpt+66Alg/XCFtP9S?=
 =?us-ascii?Q?NCKQOX7BouobFGO0pGUayXeZLMSwLI5fgCwzpIi+YNDKiJDetyYIKPtSpka1?=
 =?us-ascii?Q?JN3ut6I6143o6PDDmu3yOMM1z6TfmBX6Z++pCMQQdn+j2j9U9tiw2Dvgoued?=
 =?us-ascii?Q?IbBXsUnjgSZe8JTxKb+e6zpp6LsuCEC4zgZtQxj88+QE3wnGhh6GFHA6hcOS?=
 =?us-ascii?Q?D1NRNFETP/PQg/DoiPsQ62LPWaszwqOWWNd3gEEJju9/4c+A5XU1yedAHDEj?=
 =?us-ascii?Q?APJ8cWJ8jv4HIuRpYTSXzznM7+IuAQbwlFgIpfWT1cClXW2WA+rbuM/uefmT?=
 =?us-ascii?Q?UDTegALaDifYmOMpPIjo+zApjl/OQJlJd7YBbIm2RkC2zbnRBn1hPZ6SzKsQ?=
 =?us-ascii?Q?+eSdkwVytkoF6DFfEaC/FEpad/EMjdRtXX9NNZOfI9i/K88UXQux1TEl5vD3?=
 =?us-ascii?Q?D+AmJJUSjP1RSEbCeL0J5xD9ZJuokzj+mvMl/aPJCJFYNUWjeBGhoIayTDkE?=
 =?us-ascii?Q?9xUlJR6kFfwuSm7wEaGdnXplwv5RdAWvyf7QsZwtorAZuoF3dTimG+z5rJvG?=
 =?us-ascii?Q?gOdKE/vfQl8knk6Ip/WC4n3zT7or5hR/1TtUo/HMPuvMKLmbUgrZtwznqsEM?=
 =?us-ascii?Q?DY/lI2QtLCXqMyhUHRNjPZJ2lGcw56bRPMHNwHuXeT4Lvpe90olARzQ7bu1X?=
 =?us-ascii?Q?zEc1CCPKt0mcYJOLe5xQmikVtO3lEeTUaJgejNdZZOMWY/BjB9QgNIICsw5e?=
 =?us-ascii?Q?0+gyqxqPS71zpbtuZFcZrP/mq5EeS6MfMZHSXpM5l5G7HIPjgeqtYqRjEJjd?=
 =?us-ascii?Q?G3hvhFN/C5Lb+Xy3NjYd9LJKNeyvCtYuwvtjSsIbzlbLLuyTSWersHqTiaYW?=
 =?us-ascii?Q?u5vsd69wxzs2gj3n5VVjDqgshXzACmvDYeBpc32F3ZnKrvVsFlCAJGMVwcnW?=
 =?us-ascii?Q?QBHZDvtBevarZGwFm8x11WiqsIZRRgKe+jCwRbYKk9+r8MYZRecbmnKTCgXe?=
 =?us-ascii?Q?n1zUuuUYp3L5UbT3gNRg66hvVqrlkBk6QWk+/hnL+MzAr9ofVkZXSeTCnssd?=
 =?us-ascii?Q?DHZsjWEXvfkpZUReLoMqir92h8qW6QlH/U2EqoibPS2VIU7SzR/qsyp7gyci?=
 =?us-ascii?Q?ODhmALvgXbazP92GRv/00+5X51JTG0Apcctzzx3mqMzc4nN8TQLFs3zIGa6P?=
 =?us-ascii?Q?tPUVRhtMBqs0TWSa/c+NNh7es2GtUC24GC+jiZT4fppCfetw9wogLdMIxPif?=
 =?us-ascii?Q?rrhCPUJm5FRfcRRBrrZOAEqTW5tX3boaqw8u2eiEqOTGEyf7RFZpls/321Xx?=
 =?us-ascii?Q?7DCfwvCRvc43j+4p51/pkZzjehAm9L5i5siqVzDk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134eb5b2-587a-43a1-85e9-08de1790ef20
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 08:47:18.7654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAyTy0u1jKy7gRXLoVFdgw0c2bk8z3YyR3GlsBBSy/szV+pq6yWa7qufROcuJPnC3wAAtc/ukEM9tS9cmzXvIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
X-OriginatorOrg: intel.com

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Monday, October 13, 2025 8:05 AM
> @@ -714,7 +714,12 @@ struct iommu_ops {
>=20
>  /**
>   * struct iommu_domain_ops - domain specific operations
> - * @attach_dev: attach an iommu domain to a device
> + * @test_dev: Test compatibility prior to an @attach_dev or
> @set_dev_pasid call.
> + *            A driver-level callback of this op should do a thorough sa=
nity, to
> + *            make sure a device is compatible with the domain. So the f=
ollowing
> + *            @attach_dev and @set_dev_pasid functions would likely succ=
eed
> with
> + *            only one exception due to a temporary failure like out of =
memory.
> + *            It's suggested to avoid the kernel prints in this op.
>   *  Return:
>   * * 0		- success
>   * * EINVAL	- can indicate that device and domain are incompatible due
> to
> @@ -722,11 +727,15 @@ struct iommu_ops {
>   *		  driver shouldn't log an error, since it is legitimate for a
>   *		  caller to test reuse of existing domains. Otherwise, it may
>   *		  still represent some other fundamental problem
> - * * ENOMEM	- out of memory
> - * * ENOSPC	- non-ENOMEM type of resource allocation failures
>   * * EBUSY	- device is attached to a domain and cannot be changed
>   * * ENODEV	- device specific errors, not able to be attached
>   * * <others>	- treated as ENODEV by the caller. Use is discouraged
> + * @attach_dev: attach an iommu domain to a device
> + *  Return:
> + * * 0		- success
> + * * ENOMEM	- out of memory
> + * * ENOSPC	- non-ENOMEM type of resource allocation failures
> + * * <others>	- Use is discouraged

It might need more work to meet this requirement. e.g. after patch4
I could still spot other errors easily in the attach path:

intel_iommu_attach_device()
  iopf_for_domain_set()
    intel_iommu_enable_iopf():

        if (!info->pri_enabled)
                return -ENODEV;

intel_iommu_attach_device()
  dmar_domain_attach_device()
    domain_attach_iommu():
     =20
       curr =3D xa_cmpxchg(&domain->iommu_array, iommu->seq_id,
                          NULL, info, GFP_KERNEL);
        if (curr) {
                ret =3D xa_err(curr) ? : -EBUSY;
                goto err_clear;
        }

intel_iommu_attach_device()
  dmar_domain_attach_device()
    domain_setup_first_level()
      __domain_setup_first_level()
        intel_pasid_setup_first_level():

        pte =3D intel_pasid_get_entry(dev, pasid);
        if (!pte) {
                spin_unlock(&iommu->lock);
                return -ENODEV;
        }

        if (pasid_pte_is_present(pte)) {
                spin_unlock(&iommu->lock);
                return -EBUSY;
        }

On the other hand, how do we communicate whatever errors returned
by attach_dev in the reset_done path back to userspace? As noted above
resource allocation failures could still occur in attach_dev, but userspace
may think the requested attach in middle of a reset has succeeded as
long as it passes the test_dev check.

Does it work better to block the attaching process upon ongoing reset
and wake it up later upon reset_done to resume attach?

