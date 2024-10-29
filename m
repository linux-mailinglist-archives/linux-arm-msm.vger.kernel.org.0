Return-Path: <linux-arm-msm+bounces-36270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE69B45AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 10:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF831C22120
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 09:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DA41E7676;
	Tue, 29 Oct 2024 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jefCVg/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848411E1C34;
	Tue, 29 Oct 2024 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730193934; cv=fail; b=FcCUAzvTwl+ydADnIti7ffKWoBcJPyZPOyeVvDKlIOXDbWlMadchRNP+rcfGlh0QJuxdahZ51xKVg3lp4Cto7TGpjKldV8mIekotaZ2tpxx03rqvlidO3mhy7iZ8h6gUOT/GCoUPbfpSWJVUTS8fL/eSjoSPdiJag3GGjJkY4qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730193934; c=relaxed/simple;
	bh=BYd4r/1wX0M5hcNUjG8+JuxMuuUJD1J8Vp22bp2U6ls=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i8RjvWwrJ9KkSvMP0UCw8RvVsdTvJm8mfxoUz464fS9nYuAa3LTqLcUZp1HAqSGujrOAFNkzd7fUu1LO7/jcwaH1Rd7KVeB2+0aETAnImOa8fU4sTz4deFJn6QWGFSjmwPxFB5t904mu5C5IptM8lCtqjwSSclLaGrZQhVUkM3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jefCVg/i; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730193931; x=1761729931;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BYd4r/1wX0M5hcNUjG8+JuxMuuUJD1J8Vp22bp2U6ls=;
  b=jefCVg/iVN/kH38EeCFUvgxn7xZJxjKZK2XOCrNKzGH/6qKh2cufXXM7
   hkwMVldrxPxW2+IVMN9WzhI0sn0RRHVgGq92JDUtI9/W66Mv38iSy/mEH
   10mZSzjmmPzY9TMmUzBWLPgvYGjAiIhUFIuhFf4kKDoHNmzzDVN1zPjen
   qt1e1u3o3A+A7sp8Ah0lxCvjOwmayi3eCKnyrs113X5GeKH4w+9e2gtBn
   BEQk5y4IbD5EHaoSjjoU/Icpc5273jjpHkfx+fcgBe4yYoworYclOd8SY
   MfCORaddgw/qle5/HE9DuSakKoqIJpyCCYi3KJI3gQlZjS5wdOb9ofPH2
   Q==;
X-CSE-ConnectionGUID: CpVqMtm6Tzqh0uiCc7G+hA==
X-CSE-MsgGUID: wtUMf1KKSle5XWoGuP08wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="17455940"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="17455940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 02:25:30 -0700
X-CSE-ConnectionGUID: /Boari7nToWQRLawqTyVkA==
X-CSE-MsgGUID: U6NtUwEcRn+66uGQzXkCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="119360072"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2024 02:25:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 02:25:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 02:25:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 02:25:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwcR3Hv//C1dHOt7lgUty8RT3mn+5u0jh+V4QB3MzH7tBY83pPBbxXDy8EDLu1hE3iHVVnK+zCTjAhcoGOqv/A3tkhm2+fim61M1ONM+1TyZ10+H7xYbiiNVs8caAh3kZ/npFVtgM1C2mpXNr9wyZ2tJgOGtPMmOVNjzRutONs3eu9wKdY5EHw2to9hDgPpWjpE0lCxaYgKJpPvZEJyhDkHfCkso3fMog43sR+PnN8TMNZXejsL/Cl9pzfAZPFH7ivwf6fe0hjza6tb6h0SHFtp7JeQC8cWQUfj7bytx++26vpO3XGnqwzvGI7aY5dAfUEc8yIjtJg7m5iZb22ykDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJZ4LxLTdUQ5ow0BQS4fH3A0I237UwdEEzZcDht84Hw=;
 b=ggG3NjqM85hIiuKmtFu9ghInzmragl3wHrcoROtxh0aq14fa77KXwNHhHcGfwNWrX6OTTB7+atmbJCwdpYIRtNwKbhXmvkEPrgMjNf5SNQs8PBBm1GOCdbCoBTKUN+pWAEPZsZIbcDbvMIMj6hi+ei6j7k1ja1it4UeGv5L3x/qooVHVaG3dbFqsj1h6aRtRdr11i0k3mmTx8nEuQ9bkOFeKhLVKgCvDdK7wF+85DPkC90NZdVC3qEl+CO+XSaXna3B/gw9gErpmxnOdIi9eH+e/626sG3p+BADqm4KHVv6R4yf173suOEGfUfmRJjPJWy5F6zoKv/3MZC9EAK+zqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 09:25:21 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 09:25:21 +0000
Date: Tue, 29 Oct 2024 17:25:04 +0800
From: Philip Li <philip.li@intel.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, kernel test robot
	<lkp@intel.com>, <andersson@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <konradybcio@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
	<geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <neil.armstrong@linaro.org>,
	<arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, <quic_srichara@quicinc.com>,
	<quic_varada@quicinc.com>
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
Message-ID: <ZyCp8JepAWTJ/TNR@rli9-mobl>
References: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
 <202410260742.a9vvkaEz-lkp@intel.com>
 <ca0137a6-3ffa-46ad-a970-7420520f09ae@oss.qualcomm.com>
 <b34cfd80-88de-4f7b-ae55-3b65abf8924a@quicinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b34cfd80-88de-4f7b-ae55-3b65abf8924a@quicinc.com>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 118a1620-1476-45ce-6962-08dcf7fb9c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X00uzMDfHgM8oOrDUVUn2aFhFlAvUL4VXummkYy4D1luZg83t32xkGRxAfpB?=
 =?us-ascii?Q?dFN5zAiV+zom6ch3IOcxxbVrOJeRzO0zpmyht9s5Oq9lIS7YE9Vk9z0E9NW7?=
 =?us-ascii?Q?ErGmia+7lxAgrFFgxGxFBO1Vw7buPfARiM+kgQBgc8D7Rd70iweAovEN5tUr?=
 =?us-ascii?Q?1snVhTBxcDFWMgyQRrndTCtK6XIbtr+dPpVGoQK2G04wGRNnY5IyT0mtm9Y6?=
 =?us-ascii?Q?3C0mWhRR9vW8lwU90SgXBimwMj9MHa3B4yhIgyX7pCBwcre2oiMHa/N9WDjK?=
 =?us-ascii?Q?RSmCJBDzZh/VkUN8KgK30Ox7ZoU0ES+6MJ86TUnIG1Dxq1A9RqWhiudg+a9Z?=
 =?us-ascii?Q?xMu+t0MXMjTfVwT4bpUvudjb+c+2TxvjIPhVjuYzr7VKqtEp6n1WKN6pohMh?=
 =?us-ascii?Q?809CYkzwH75Gh/9gNzOYI3jI+foGekMLPa8gfycvz9facscnzF1ieIyQUfyI?=
 =?us-ascii?Q?CKrR6dDXuvtcYjiTwaOAxXUiDy/i3de/DyMoNCBDz7nFwhuNQXrj5xFOhPud?=
 =?us-ascii?Q?G+S1mGXGKP3xDArSMiHCf+wfq0KzA7x+KjkLfPEOeCX/M/2XrCSHH0mJdt/3?=
 =?us-ascii?Q?DzDrhhme9E7vpePrOx6YzAh+LmggpgHD9/NqBeLc20EhzZ6HFVMBc+7SuEJ1?=
 =?us-ascii?Q?1z63aCSxkgQS2NQQglNV67QBIN/AJgBzw+6lEdFonKXlT/DvbSK0K6m4r+aH?=
 =?us-ascii?Q?MnsB7ALz2jJKw3CyQ6u7gC7h6h637pjScCyHDLKAwdX4hqtLJsbFuujifepv?=
 =?us-ascii?Q?CxmBcIox3T/XyVOC6V5GL6WiWlGDSNeuspHuqxfWs9oGXjWN5j3xdLYpNeT+?=
 =?us-ascii?Q?jaoCuW8rtnTE4ubfWVHcNGQNdxkmC+io31F6zRt5C3d5WY04EYmnOJFPAUVD?=
 =?us-ascii?Q?Q2SXTZHiKaaDOvcMPk+ru1OqTCONinttFqwggKLE8UM5bYCoa+Nyw27zGlZa?=
 =?us-ascii?Q?6RQt06bpw866yWNpa1BdIOTGvLQNRCJgDwAvDyT2PUzC89e8Imj069y7ygp4?=
 =?us-ascii?Q?XE7+xfxZJWs8+lO4fcU2jsgwuolQQjIB7Fb5N1PyQfeeZVhoX3yfaMEDVRXE?=
 =?us-ascii?Q?9M5Fl2XyGns/PJf4PUYrSGtZkDMlqHN9ducoQlwtuRvvzel49X9oromZxjKg?=
 =?us-ascii?Q?zccshuxZQ1cswv8Th67v6HCyHndF3p5v3HoYghW4mQCyK6+1sLeMrYe5iCXi?=
 =?us-ascii?Q?xM6OqJicH9EN4O+HCogkJTQEDNyKrV63wu9WbYls7trE2MmwVoz6vz02X6g6?=
 =?us-ascii?Q?x5F1BjnBPCPCfHg7KbuwgrCvQwchMHWClukWR0X17g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DdMvtu4fD8hmIZ7Xe7gHFD5FjNJ4uPtGW3E+NGuIrvf2WtdUe0+iNz7hdCSv?=
 =?us-ascii?Q?QfiE8Te1OCD2ezrhC5l2KH+kaDZOZ8FS7jWVhpjupqW8WEXzU1RqXoEj2fMb?=
 =?us-ascii?Q?3oK3+UEJ8Go58c7Nue2aV7BMdPS9Z+0q4UbTBnYQ19o9YYNUZOflM0oRZvIN?=
 =?us-ascii?Q?Fa2wfaxD6MHY4aVjswtmpHskifKTeF+RyQQcqQe62ZyYbf0cJB5y2Y1WkDDA?=
 =?us-ascii?Q?T6VWkl+oBvkEYpsG4sYoFj3LeNkfl5FrmHwvMdpsfjuViM5jOZqetIjo9qlO?=
 =?us-ascii?Q?38gkd5/7YNrO2eyxdC2/1IruKUvbKReO0WiZ264aZkNOX09A9obC2eduYGjZ?=
 =?us-ascii?Q?A+2KcTrtZbmIN85aZX8WSKL7CeZbgRlQ6OZDxWmWbACKYBx1Dj3l9MMVVGnb?=
 =?us-ascii?Q?Wtc7n6F/BUWlwz2EomeQtA0gQQ6bXJ3vxgM08DlIEmWnAe3+saowtJmohp+s?=
 =?us-ascii?Q?Xkdd2GIEnkrLhmJbJDULe6YKfaZxU2qUrj8AJNNXBTH/LSp31Dj4R/rF2LjD?=
 =?us-ascii?Q?PgJeo1A24csyq/x6gsbNKe2V3saaRLOHb1FtioCmz3qUorDExwtnpHe+E2+o?=
 =?us-ascii?Q?R93JLjWOuzL5o2ikfQgVI9uQ/nOse/MLeNqbXyPpmoXHe7gyv6SAY1Ym9wwV?=
 =?us-ascii?Q?vohtBnLduxYKBMc2vgd//+bamq55IsDDfMDn+iY+4iXYmDFEejlsOjLMpIFI?=
 =?us-ascii?Q?Ee5yRpqZKbF4u+5724arnsDvIrw8W2+D9Ihr1hjRMkXKbYtlzaNA3fnVluNk?=
 =?us-ascii?Q?mNvAjgh3oFWWfdRT/jhS43w2yr+qtSIarkFrWsDYT/vKcaYIoguXdpgE9aP+?=
 =?us-ascii?Q?2kkp5q9CW4cxxkjHz+AmEUdh6Mmr9vjDm9aRnDkQbmI1Q8/ykJKiD3upMYiT?=
 =?us-ascii?Q?o1X560fZSDBVkmk+j7dtgfYbPmj9Ft1rnjCuPyZ5AHgD0GvoeWiuir4MYPu0?=
 =?us-ascii?Q?P71fxQxE/zIn5bnBNvQ3gEEuOqygmgjpPOTQD0LKKrW9cMF4/thdtkU9/Ew0?=
 =?us-ascii?Q?i1oo2Kw0LJVS86LTZYCt3KYfGhDdC5ycsZ+ndWQMB1glzoOUSFSiALs+AEo/?=
 =?us-ascii?Q?SoNw/B2xxvdWGMLM62ZpsV7vrlnRFy4qiwnhqEN9Ppm9eNyYZRU7vGGizVL3?=
 =?us-ascii?Q?823ZQ3Z3KbNFW8F6bekdwod+d5uqALlZKD2muUQhZyM4K4wWFZyh5cWbnaAb?=
 =?us-ascii?Q?O/Ze96IJJpaGhBnTJcVRtCPkdxplG71Sv88LAgRZjRWrj2BP47a0JnPsREm3?=
 =?us-ascii?Q?yq1a6Z4W85Ikd4c9E7ClB8qAfNln4bYd42EtpSfujBf2+o4tud8sD7zhC6dS?=
 =?us-ascii?Q?X5JSxrGUAgQnrv0RYX/m8oQTydltNOj94m72DB3ZymI5CmaH3pHHwSNqNBQ9?=
 =?us-ascii?Q?ZVOSEhSUIMxaiPJDTwk3/PL4nk65g6fFyNmHWICLeUSAPv5fE0x2GYPk/DIo?=
 =?us-ascii?Q?QSqWcGBFJpxP6YEl1Ox98Y5JO/Y3UrYOczbA5FU9ZRWkWcPHpsk4PJ8deALZ?=
 =?us-ascii?Q?qqr+S8fHqD3avAoDx04D/go1EADl15kVROlfgJUkKTSpHqQ3j1/LcGlPvcnD?=
 =?us-ascii?Q?97o2zX/J8NHcS+WzfbF6BrsBi9k3XzBBUao4Ty6b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 118a1620-1476-45ce-6962-08dcf7fb9c65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:25:21.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNJZONV03Yp9nkhrrCshcdK38c+5cOmlUQurLC6fnKTK8ZHzLaV6O4vUwtFof/Csp+19kHq42WmXtznVFRvh9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
X-OriginatorOrg: intel.com

On Mon, Oct 28, 2024 at 01:12:04PM +0530, Manikanta Mylavarapu wrote:
> 
> 
> On 10/26/2024 3:35 PM, Konrad Dybcio wrote:
> > On 26.10.2024 1:31 AM, kernel test robot wrote:
> >> Hi Manikanta,
> >>
> >> kernel test robot noticed the following build errors:
> >>
> >> [auto build test ERROR on clk/clk-next]
> >> [also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc4 next-20241025]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/clk-qcom-clk-alpha-pll-Add-NSS-HUAYRA-ALPHA-PLL-support-for-ipq9574/20241025-121244
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> >> patch link:    https://lore.kernel.org/r/20241025035520.1841792-7-quic_mmanikan%40quicinc.com
> >> patch subject: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
> >> config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/config)
> >> compiler: aarch64-linux-gcc (GCC) 14.1.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260742.a9vvkaEz-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202410260742.a9vvkaEz-lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>>> Error: arch/arm64/boot/dts/qcom/ipq9574.dtsi:766.16-17 syntax error
> >>    FATAL ERROR: Unable to parse input tree
> > 
> > I believe you also need to include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> > 
> > Konrad
> 
> The above build error is because kernel test robot didn't pick the
> dependent series [1] mentioned in cover letter. Not sure if that is
> because 'base-commit' & 'prerequisite-patch-id' tags were not present
> in the cover letter. Will include them and post a new version.
> 
> Will that help the test robot to pick the correct dependency and
> resolve this build failure? If the dependencies are picked,

yes, with extra info like base-commit, it helps the bot find the right
base to apply or to ignore the patch if the required base can't be found.

This can help to avoid false report.

> <dt-bindings/clock/qcom,ipq-cmn-pll.h> would automatically get
> included.

thanks for info, and sorry about the false positive report.

> 
> [1] https://lore.kernel.org/linux-arm-msm/20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com/
> 
> Thanks & Regards,
> Manikanta.
> 

