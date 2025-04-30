Return-Path: <linux-arm-msm+bounces-56216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13327AA46B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B18B4E26F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C92822172C;
	Wed, 30 Apr 2025 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOuJSZXF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3262206B6;
	Wed, 30 Apr 2025 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004600; cv=fail; b=fh6vBC3QFoxHtO5Sew8D4/KU/ZW60SDtqJ/FJiVFpAr8PbZ+nBeXsUSNdWX7lwgEBRB4xavNT0JOtLGWCLU48nvKg+zAJkA0advI8TQ/GQmh/Ytz87hHZ5pkMii5KjOAiDLidCEjIklQD+TdmVnkuFYKGichW2b+0CHH2TamX6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004600; c=relaxed/simple;
	bh=yqCq7Z9xPLU+Zkh6e3IBlt49EsDRW6wuH2BTHsxPkOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cvtdfDJJ7wIpF6siBPLTTusTJIib/FPHv4e0KDVrDVU2GHFLtPCT3oQR3Wa0tTVlg90vfyvRalpyrIuVcO3wSGNv/tcZeTgsKcnMdSTkrR/iCWQJnB9EtgkV82AH1vHozpIHBiSI/fT++sb86KkKPtutChIKa+U+VSSD6jde6AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOuJSZXF; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746004598; x=1777540598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yqCq7Z9xPLU+Zkh6e3IBlt49EsDRW6wuH2BTHsxPkOs=;
  b=VOuJSZXFyuy2gP/A/PMGr0LTRAqMpGBqrVuvv4jGeMYJIz5AF5q7IwK5
   olQAicmFd9oAHQ4Zu1HCuINYVa0J64TeXUk5GOmkdHuWlbI93APbA13qZ
   bV70X8dP7ICz8c1NCENxaAlUax2uXxnipINcEsubt2/XzbRKxqe/MGTF5
   CH30oB2O/ZBO+mtHKTmYpLYg3amIgT8oIauogHqRb8vVVDMuQZinZwGI/
   u4WGs00R08rrqn7WQzQ2LDK9SYDXyaaFvdxmeNKxZSMT48GQcePKpZiTU
   6pqBCE92ZEdSNb50EludpiHRS5Ol1mqI+WFLJcYslI4IPxFaEe6tWtbQB
   Q==;
X-CSE-ConnectionGUID: md7zCawXQYGA9bTUVEFQhA==
X-CSE-MsgGUID: /4z2v5ELTOiyqFB4qp5PGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47805017"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47805017"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 02:16:37 -0700
X-CSE-ConnectionGUID: Wyo4qRQqR4CW1CdyqXUTtQ==
X-CSE-MsgGUID: 5xR87c/HRs2wjoGqEkbsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134581284"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 02:16:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 02:16:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 02:16:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 02:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzxJ7J+AA5+Wos4xP2uP1Wn2Jb3xKiTQRYguNLXy1tq1xvuLWWdzcpUIWH05+xImABUm6qiK77cjAI38Dm6LOvddKgkzHEl+Pw+4NYIHNsm24q4ov1BSfOtV9DxKRuEjrHZA+znOi/O/SCVBQKuU/cO4SG7h2CF0POAIOKrGIgc1VF39zCTrgR2of6fpctEC59eHJFgsQtLhDvBeAUXOTV8GtQG/yNFW+8uf4Ac8+ctnAlVAhykop71jwl8yNWfIL60GWu5apuiq5A8WQlqfyBTCydmnGVdaCWxwCo/KUmw0Lw8AfId1L7qZpoDZHETssCv7KrWDaNGOQi0oNZdWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8lQ/tQY6ZhEzEASBrBtpHwlTs0yxkNDTItdI994bhM=;
 b=RSY+5GqJF2apcRDIDLci+yfMSS1OIImfuFGNBcAbsDf8E22MescDIBXrMe+Hz0SrzQ37pjXDp03bQ35RReGXn+oUnUh+7Sl9oAaywWZHoa9FQYFGhR+MyIyyJjK3mACUzk8Tm5x3VtCmz6WuSRN5/dI6BvglCOjgh94y6pBMUDBMJ7iycd4rDcf5OJDxFwiclHe0o3SSlDHCIXYN4rcDLBR0U/8B6+OXlcGrIQ02KHU7qbD1LXsNb15NHeyYNAhHamiDQmmu3dlhgfNLC4oIaIfSCwHyqHsdp9LC1PXYBU3t80r3QlWsKqP2GfWAA0QYyrgXlmLmnUtx7vCqyuf7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:16:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:16:32 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, Lu Baolu
	<baolu.lu@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, "Gerald
 Schaefer" <gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Joerg
 Roedel" <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Matthew Rosato
	<mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson Zhai
	<orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Clark <robdclark@gmail.com>, Robin Murphy
	<robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, Niklas Schnelle
	<schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, Thierry Reding
	<thierry.reding@gmail.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, "Krishna
 Reddy" <vdumpa@nvidia.com>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, Chen-Yu Tsai <wens@csie.org>, Will Deacon
	<will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang
	<zhang.lyra@gmail.com>
CC: "patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH 0/7] Remove ops.pgsize_bitmap
Thread-Topic: [PATCH 0/7] Remove ops.pgsize_bitmap
Thread-Index: AQHbuRPVi33TepR4cUGRaenWa+TQJ7O77svQ
Date: Wed, 30 Apr 2025 09:16:32 +0000
Message-ID: <BN9PR11MB527642B10DAA685204CADD2E8C832@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB7205:EE_
x-ms-office365-filtering-correlation-id: ae6ce83d-28e2-4e1d-c92e-08dd87c7b302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?Hf0EgFoXnJKiWK/H85jHyh2ND0/l+iZW0q0Dqiu3YwJKCt6+IWc0dl4IA0Mw?=
 =?us-ascii?Q?/ob5/L8G1yGnmP+2fWSApyZhN5wq3wq/KjivPksu2uIiiwOzANlwnzeeSfxF?=
 =?us-ascii?Q?J9KxaupUQbgu4BYMbaVaahA9BiaZZ85+A/ieYeEUj/V6Y7XQCJueAriDiDD/?=
 =?us-ascii?Q?YYzvjND6KzyBEuJ2s3aJtkt5ZUvjoWlKPutzM3n4ojRifRbD3xnxPrYWXtH9?=
 =?us-ascii?Q?1oNV/MSFPBdgRLnc3RVfLHPPofhFZzkwvTa6ameCACDvVYgsN+OaEfqxgi5x?=
 =?us-ascii?Q?FROZMrbS7lWKzxRzMmNJ5obY3MDoPfLTbRC6xHvInGTsHXjUc6vDtyXBq01J?=
 =?us-ascii?Q?0VP0RUcmut9kSFmej8G6+CfchnwxCB9NXyQdHn6wg3fyk/wzYHOXGCBTcFLu?=
 =?us-ascii?Q?pl2pZMZ2hbcI/nEvBKmTQE6Elle4BsseOiYzDslY6mqbMqriRGtgAKKe2+iX?=
 =?us-ascii?Q?x4jpB6YrgfOltOYHb/xD9gEbGSkccReOVG2LKZPTt+5FdDrz1LG16r+7v7R+?=
 =?us-ascii?Q?YQXqsfegCWbeQxgz6RJG0RLRW2fQIHSbDc+e8Yy0W6W2EllajwWsOHIM2Eb6?=
 =?us-ascii?Q?56Mb32KJTHj4LCcu5EKIe3wuJZmKKd6lLG+YFjGpKjCikPyb3zxX7K3gh/wt?=
 =?us-ascii?Q?oLgDQ+rjRNVokSyDmAhyNUlqfvAY/kBQrOkiYtwInyRDnUBeNLFSpT1py5uF?=
 =?us-ascii?Q?HgnmjwYeZlu5bmKsBBGqNf7H48GbgEddsmZMyvmSbmnJbZkANWo+xcaXePiw?=
 =?us-ascii?Q?IlUOuw6w0f1ND/xrQZubBgl6hLXrmM73mUfpvCTBxBeXEOFEcfUQjV3/Mmjw?=
 =?us-ascii?Q?Ri5SiUsezth/FcOUpEenKx9czX+L5Dq+L4f7WJTp7SuVxWvk8WsgMCR1k7/c?=
 =?us-ascii?Q?4OBEZ1rZ9xHabjYkmVuGjwFwzhmcHDPD5YhpuZuR5jhnX+6UciLHnlkrctUE?=
 =?us-ascii?Q?UIgGH646LmX9jVlHopHCu8WvCAB8unJ/JmGb+JvEhiU2OwRrnJKY/a9JC2m+?=
 =?us-ascii?Q?cPfnMdCy0dH0zWoUCmmhB7FrT7NYeLGF92Ok4k2yUtgPSt3Xt/PI/NsYm4Ct?=
 =?us-ascii?Q?hsnrbcK2XEHnWgkd/jbWb6z9f5RJ2/DQ+2iPkIu8YZrT43CYYZSI0mu2zmKe?=
 =?us-ascii?Q?KjxYMlzvQypzmHKmN2YJeeihWVm/55LIy2GM9a1zez7zq6c/88za2D0LEbPC?=
 =?us-ascii?Q?Hj5uwKX2zn1dJ/MI6C8wZCAc23OLEsnI5q4JkaASLVqUwtADQkWwDBP1uDQQ?=
 =?us-ascii?Q?zTkooX5ZYgrERjQ9FHGKoXZ2EljnpR8Kdi7MbmMsgvmdR6cSme+AykcoM6Il?=
 =?us-ascii?Q?csBSbTZ+Cfs+ZHPl7DsmKhrUm5P/oBlU8KTk8beDv+ET/MQgWaH1ckty1VmQ?=
 =?us-ascii?Q?G6hOsL1pG0DUbtWl0LvMX6XBfT5PudZcdy9FO7vu/n8Gzd2ald/atX6SkSDH?=
 =?us-ascii?Q?zs5cMSLtB8bwKyqupcFIKzTc3yUfxIHmZRekPCoJTUQsZ0OYWWOWHc5MRs60?=
 =?us-ascii?Q?zku6odGSFNOdpkU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TzSDki8SE6KdQgvp4ZETyc35BmWZJALc6bnkSP74+x5ZOehubJBBEkc+6zRk?=
 =?us-ascii?Q?56mTEkteTCSHgc9BTibSvjYUZbwBmqOOROfO0cWRiR1VebHg7toE4ztgaw4J?=
 =?us-ascii?Q?Dw5s0/I+G9oZnhfy7T50JFykSvsg/NUL3ZF73CGHIL+d5BgFO+lvFD8aVB/y?=
 =?us-ascii?Q?tLLw1kmOpPfTiGmXhdQh6XNv3h28Nid2HpPyBbC/orwk/a1HxtaLIKWmjRH2?=
 =?us-ascii?Q?x1deYhCKJA+wi2TQUJ/hWeGaTzcU7F9NVgxtpYcEop1OHASukm8923kWOLD/?=
 =?us-ascii?Q?o2xWbQBXeke7vzIYSahnWMYnPjtUjXCyvN8Vx70uZxFJc6NBvMVW5t3TJeQX?=
 =?us-ascii?Q?/oimiQ0mblVmWQY6iJXbO4iLNv9YFYhVjh0NaFcmrURtSjeLG0somYIp9lOl?=
 =?us-ascii?Q?O6GNfUSv+f6bMjpxU0A9oAWwmR8RpM+XdmynkXEbA3MK4iWDYGoDlOSB8OCh?=
 =?us-ascii?Q?X5nT3pEUC+OvDqS7JaLjmaTZEDOb/JElCny7sSY4V+a9mSGKmRVm6xSQoLtw?=
 =?us-ascii?Q?lvB7boKQi+3VSYnGC871Uj9MEPUvoBbNH0O0aNAAh7gC4hFgP6h6JYvvJA8f?=
 =?us-ascii?Q?8Ii+LbYYGaxD/ooJjShYjmyOHYz7Zlkxyk5mN+swED1+EhCRvxNb8oDqpjck?=
 =?us-ascii?Q?Nmquz+QmRbw0LAnM23HzAl8P24iDt4bz81mhAmawKzwSWDsaSuBxpFmolNHd?=
 =?us-ascii?Q?5tmAh9wYqM+UyGchsis+vpwBZKomt+2WMFiL/srneYgTFF1m9MNMFPXZlzuD?=
 =?us-ascii?Q?RiV4KFsbe4UezLCbG2JFUsQiHpOUtRUfFo5yMusjkLmt7fb1Yj439JZN2U21?=
 =?us-ascii?Q?IENvQ5FqsWFv13LXKUWjJmS+07RulovGd3nG2WdXg6QgPVdFJaQnkSWWBBN7?=
 =?us-ascii?Q?SS261QyeSy0Q9dr5RmfkkISxYEypQTM7zORizXC1aVCfgGlbM/q31SZJKpzd?=
 =?us-ascii?Q?pc+OO+qH7fR0Ba0E7Dk00B5cONUO734Px/FZK6wtsUlkzHiQJT0hBcGqfKOK?=
 =?us-ascii?Q?muRvt4bNbJoS7PeSuucMRMuDifCEXBxTj7KJpFiXnuSuAES3aMg7RVQ9yAYN?=
 =?us-ascii?Q?3Jukh78Frk6oqQDEYTEiiw0ZTM6c72Dk4tXfOxbRsJJV0klWRr4s+lCOxQBJ?=
 =?us-ascii?Q?WHvkToVurYoklUFbNtXpPeO5iTEk/ISMtvWrvcwrfPxwuqCXCYX46ZNXbELP?=
 =?us-ascii?Q?LXXPxANglGDdGqyIUS27IvajZw9i4qgII11Oxhm0qVh8h+3vq88SITX0/+Fv?=
 =?us-ascii?Q?PeQAqPbYF+q5G9SdWe6Pksr7yQr3Hq1FB/dkqanOg3ErLphzWw5mmo12DPIu?=
 =?us-ascii?Q?04NwVpho3c/0ImqpAakbBwAjFXVGAxHCZa4qZU/4My/1RwA8UN7pjoXbfPpq?=
 =?us-ascii?Q?drCneAuIA7frdUNcO7pRD/gvvudJ4bQOO6JYlpFDpMWMpbfQf/LkCQSucTF/?=
 =?us-ascii?Q?CpHK8+pFD3oejppM33BjquRRZdLNdFXGB3rygl6sMYAuQK6OktWgXG3fvj6E?=
 =?us-ascii?Q?uchXhuFnd6Oyq/qAvzw+WQgTjyYnmZOpd58cLOpBk7wszrR6ZVjLR/omVsbB?=
 =?us-ascii?Q?lQLMbUpHQdjlqnV9V+qzHDhg4B/buZm6eerM1U5G?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6ce83d-28e2-4e1d-c92e-08dd87c7b302
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 09:16:32.7738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHfHbVuVnFhbAadLUqVIOk8blq1zT+BY5YpVTeYF13I0TDsYCDawqMsHkNqfEZTvyvTNFpWLtcik+UhfWHqBNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-OriginatorOrg: intel.com

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, April 29, 2025 10:34 PM
>=20
> Now that all drivers are using domain_alloc_paging() and dev is never
> NULL, we can have all drivers correctly set domain.pgsize_bitmap during
> their allocation function.
>=20
> There are a few oddities that have accumulated here over past changes:
>=20
>  - Some drivers always set domain.pgsize_bitmap during their
>    domain_alloc_paging() call but still provide a value in ops. This is d=
ead
>    code, delete it.
>=20
>  - Some drivers calculate a system global pgsize_bitmap in the ops, but
>    it is now trivial to use the per-instance value instead. In several
>    cases this is dead code, delete it. This also allows
>    constifying the ops in these drivers as a hardening measure
>=20
>  - Some drivers have a fixed pgsize_bitmap, put it next to setting up the
>    geometry in their domain_alloc_paging() functions.
>=20
>  - Finally a few drivers still use ops because they have a delayed
>    finalize operation. Set the constant pgsize_bitmap in the
>    domain_alloc_paging().
>=20
> Then remove ops.pgsize_bitmap.
>=20
> This is based on iommu next, and must go after the virtio
> domain_alloc_paging() conversion.
>=20

for entire series:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

