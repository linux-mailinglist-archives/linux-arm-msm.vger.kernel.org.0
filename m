Return-Path: <linux-arm-msm+bounces-110516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNWfHDo1HWoqWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:31:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB261AE7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D85C730027F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 07:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BE12147E5;
	Mon,  1 Jun 2026 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Css4BSd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB932F748;
	Mon,  1 Jun 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299064; cv=fail; b=N1gyU271whQDh6HkBjG01RR3DGm/2xG0lZfyJ0kHkTOPON1EQzg+lWBNz2hgqYCRL0niwpxIJQChxlOo7XY3YqxkpzXLgc9qAwa0sMb/0DQgsA+GG0BkrpvvhRc1/uCDTXbT9W9w42VCcPTnIZhvDWq9vU5an1ZUk+l1r4xeOjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299064; c=relaxed/simple;
	bh=tRtvyHXeizGKHCbOF/WedIZJud2gcfNr8VFqel7I4rI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tBj4MCBTUZH0ySJoloOCm6IeDJGqkmvlqOvSmpL3zlESM3TE0JAM7KFh5oHgbsIlFnCv+88ojgTPPu4LQbQ0+nDaIZWWHVsHg2+Bdrl6YYSfnaPkonwB9R0P/QqDnMwQvlZsdQrLo1+oQY+hixNwMjVlNGRzsb2c9mEdIeWqOKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Css4BSd5; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780299062; x=1811835062;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tRtvyHXeizGKHCbOF/WedIZJud2gcfNr8VFqel7I4rI=;
  b=Css4BSd5a3o4CIIKwBvmzjRylM/owDlrGwlzdOJ2jAiekKdZK+r8+gd8
   anIW5lLhbtYOv7PeT25Mg8w36nj8jI9BghxC9PbypldqxjiQQl2DkWwzv
   9mghkMyKGaKd9To9W9cHAEt4QE9CvgFNice0F1UPaMFKZTkv70uqbdYyc
   AD/54vBYdWQ717QD9ox9cSpArEiynV6Vv0FP3JxNax3LsGNGtuvUJSHwR
   Y3SGQn5EOc09gwj8kI3FUz6o8rtOHAy0KSog4BlHtqiMrbyztk7Pn6oR6
   PVizAPvZ8WadRQfJleqnxgSe84dpjPeaifxvSUh1ldu2Rw8UUBwtn2g0/
   Q==;
X-CSE-ConnectionGUID: zrQc2F+BRp+SQLk8cHwVOA==
X-CSE-MsgGUID: JowapTnZT4q+DIQNgZ034w==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91359740"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="91359740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 00:31:01 -0700
X-CSE-ConnectionGUID: Ll5WyQzTQiiP23/CRyOmtw==
X-CSE-MsgGUID: kAUuuc58RmScQlSIkSBOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="239089263"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 00:31:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 00:31:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 00:31:00 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 00:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yg+/9Db8KmxqfdY/BxGMturDIRetZcYxeF4+x//9NEJHbaJU91UhDbk7d1br9lF67XxSUWekPbmVqpa8bXzmQiknIDivUntlQD0NK7y67B+XN4teta4Gp6T6jtB0RnjhPCJB49Gk8L3FzL4vJvHuCQAsq6VoNjvR2hw9Itth6hNiNBKlCwTHIDS9EJY6wNqLQz6HfKycdwpNZE07piFUZkq8/ZrhVDW289weQ0tP1UAWGOfTgNG20gcQa0iBKdkPzcQGd861J42Klt3MqAbo47gWdUQEjF/eay/cCcTmLgzYJ3YNIEyNHL1FMqABifw6VI24sWBEWypn8+BmvxTqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9adLXUGic9HvaTr3u+bD8hZQFTt91mpFSDoCCdmBk0=;
 b=f1ogy3l1f8nhiTgaQkGE9i8C80ivl0ubJVESQ7bK9CArVUSrlmzo5bDQypnM8Y753rEdV0eZtfPFugdwhKTFzJudlvGSiuydT39H7adBWAJMd1VOqlh4kWJuenK0GJmT0fLz1qmq5Y/1hX27xwK01Bk1aKNOyCq39q3eAEfXJtLsvqahonR5ddceTfkPe4Phr2oYNuaY8yoJyhZQw213m1X3e3YM2ySIX4BYwnrY2Gj2xIHdX37yftOmmVJJiELrCw2xmvUI3NgXJvZ9dLTF7j2HxVy+NXxEnvRD6L2sjl9lEby+laAK9dk6j0VtrAIIf9ykaJZNjDD8+70y3g+N2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 07:30:56 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 07:30:56 +0000
Message-ID: <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
Date: Mon, 1 Jun 2026 10:30:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
To: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
	<abhinaba.rakshit@oss.qualcomm.com>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pradeep.pragallapati@oss.qualcomm.com>,
	<manivannan.sadhasivam@oss.qualcomm.com>
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38)
 To IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: c764219d-cc87-47c2-1486-08debfafb814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Hyan+vxGYhu/Qe07ciAQXcb8OZKnSTJZ7AHxnzRcgem7Lcdxmu/FzF58sNrolhCRdi5/mGvtS5eyIUJXQp1weHYpJAQPVmK9WtNrwNwSu3AJW8CCWkg0R0DY1XoW/dqrLl1bH0ADZo/vpZ9A//RmLb1XQJ+5acpfmg3PgfHjoyX7X9Lc1h4DTCizAZknek5o29juKU1aZWmIVG7rk7kZV8QJBAdHYuA6BkeLBR24FdKiIkoYv5JlhKWtgxF7vGBhvsx6rwPCHxBER0Wd533OLLiKiXvfMU9HBd4arLauTbwM1Wptfk3PAI5GXI/Uyy+pHbjibdWgxTVH9VRQOw8E+2+9BwH07L5Cg+fN1kXN3/yRz9ebVEw4FjmEGmIc+x3XlZGDPVbDTxVe2V02INnSzbE86xTh9rA45tn+WTkQCCag+6DXuvg2QWc8XDTDGHRbhm7u3lJrlVcnGgKerczc4N6IMwnyfQEIBAzW9FfxHx2j5+ntGKmERHf9eDOBcFbH/Rl+4tkFEcsWNMWGBDdODOr9FoFmQ3yA3YcV3wNCM2Xp19fT30k2Xtvt8CU30OOosKVdoNVKAgiWLYpQEt2RqgW2jG4iGUt4QUEEfMlYio7XRXmq1jAa6PBFIZfV6NRbDe9NN098cudJX8SRb84A4JxXm/q+qkeK+vLUSYrLF4quV0E70LUr7My1Bi4E3V4C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVHVkFlODcxMFdtOEY0VEVBRFFMeUhpMW41RFljYTZKeTh5a1RNUlV5Smc2?=
 =?utf-8?B?dlhaNlI0dEZGcmpuZ0VFaVYyNkVoVjk2eFlXSDl5UE1PSDhMR2c4aXNkcFhJ?=
 =?utf-8?B?ejVNNlZyK2hWVDdrWFNZMUtaN056cGdkS1UxNTBINkdQNktXRkNvOU0zbmFG?=
 =?utf-8?B?YWhMUXBweWI1a0MvelN0REtheE9Kdmt0K2sxc01hR3FHd2dMSlpESVd2cTRU?=
 =?utf-8?B?NlgrOWNWVmVsejJJajhQNzJGMGtha1ZqSVMwTXZPd3BOdFlYaUUzNWRlTlc2?=
 =?utf-8?B?aXI2dUdJOWpSZ2NOSzRBcGtudXhwRlU2M0twNU9ndVMrQ0kwUlkrRHhld2dv?=
 =?utf-8?B?NERPTlFkRHl2eGYyejF4T2dNbEFSZ2M3aSs2N3E3aGdhS0VibzVIaUpib05r?=
 =?utf-8?B?Yi9md1VJZWxwVi9iUXExUnV1alBGakQ5cnJxeHBnZnY5bDd0NDlsZy92Q3ZJ?=
 =?utf-8?B?RUEyVlpoODF1djZwU0dCNTRGZWpGc3JTWngxZHpoU3FScFc5Q2pZaS80cG1M?=
 =?utf-8?B?UCtVaUpOaHFwSVIzNUY5SEZSSjhJa05ZTEhydXJGMG1hS09jcDJxeUZiVWNT?=
 =?utf-8?B?SC9LWUlVK2hxbU5MK05UMThmZ1VTZ3ZlZGlGeEkzRnkzZXMwNFQ1K1ZnK3pk?=
 =?utf-8?B?a3lPZW9MQ0owdGpsNWdSQUFxWXdvRUxvcXZyMkZGNThOUWUwQWlMR3pZUUtv?=
 =?utf-8?B?c20zZlpHMU9hUFRqN3EzbFl5aW1vQUJ6SmFnZXQ5bFlnZTVUcmxBUWhxaUpE?=
 =?utf-8?B?RzNpVkNYQXRBejQwU1cyV0I1ZjRFTk9iQVhraEVHa00xc0drQUhsOXVVcWF4?=
 =?utf-8?B?ZUNTbUVLQ043eTVnNjJxVHNldWtMdGE2RGllMys3ZEZYUWJtN21MY0FPWGdx?=
 =?utf-8?B?ck5zZlgzNkpLRkIzcFZ5b3NDSE8ySHdMeUV5MHc0aldmcFJhN3ZkTVdDTkJr?=
 =?utf-8?B?WmluZ2FsbXVUL1pCNXlGbk81RmVza2VOYmQyQ0lNZjRMcnRIL2dWYWpGekJS?=
 =?utf-8?B?cC9GaUQzekRLY3dJQm5jZVFZYmExVXg4dXZLL3lYMkE2cmJYZmxYbDVDL1d3?=
 =?utf-8?B?UlIwalRLbkpza3FkQjJycGNFaStWWldzcHZ4b3pncWJXR1l4bFJMc09nSWJT?=
 =?utf-8?B?QkFYK1NFL1lWdWlDYlgzaUh0bXFNYjloai9kOFJpVnptVUY2STNMeHRVTk1E?=
 =?utf-8?B?Vk1VUUpPYURXNEVOOG9VbVlKVitodWdaQlFNQllFdVpkQzBaV1ZsbmtpMDh1?=
 =?utf-8?B?UEVjbkhUYllCbHhNeGdKRVhUOFhIcDU5amtnMmZQeko4bVEveTJDajk2QmJq?=
 =?utf-8?B?WGNYd1NWOUd6VE5BRXVkalRZNFBSRlNlSGVYWUY2eENjcDdkLzl5L01kd3pm?=
 =?utf-8?B?eDdTU1pQSkdFMEN3V1hWNHpKZHJDVUVXU3I3bTdrTy9LdjRJdXoxTjlHRlk4?=
 =?utf-8?B?NlUwNEpiMUZEeW1uVW5VTmRrdkpDOXNyTG5kWVhLWkY5QXI5elZ6MVBnN1Ba?=
 =?utf-8?B?WFZMNGZpMFhCMnFzQkFxUFdnbFd3VjlNUTN3Qng3Rm9NcjZUYWc2cVFrTXZU?=
 =?utf-8?B?YjhjVTdra2pwSmxzWkdycENVWHp5Vmx5bUJSbEwxeHVyV3p0UWhsTld3WmVn?=
 =?utf-8?B?T1k0YjFXekVmVTRRUkZIVXcxOUxxODRUYzduT3lBQmpBM1VJT0xTeWx3MU5W?=
 =?utf-8?B?bHliVWlLeEY1YnNoMkRaRmlFekN2Rjk2d0hFYXRNamF3QTc2OStyR2t2MTUx?=
 =?utf-8?B?Nzh4TXpZZVZtRWJLeDFOaTN6TU80NEw1YmdNb1NXNnJGY1NKbXFRcGU4Ui83?=
 =?utf-8?B?dWowVXA5bXlVQ3FsKzJwMWI0OHJxZFlMTUJjWHYvOUhud0FRK2FmQ1ErUlQr?=
 =?utf-8?B?Uks1WFg0QkpWK1BnSGJxTU12ck9ZdXNOQ1JwcklKQWp4Nm1XendyQVFNUm9n?=
 =?utf-8?B?WU5FS3VpZVpYaWpvcEFTMVNJbU9Xb251Vk1WRGd1dDRiMm9HUjJ5UWoyZkwv?=
 =?utf-8?B?RldxUit1ckVYWStsd2Ezalg4OFg3SzE3NXZsdVVmbjBERTBtaVlzdjJGRHBM?=
 =?utf-8?B?SFdNbUtEKzFMY3NFVVllMGFiYTVUMDNac2djanNqRVRnc3g3L2tPalNTdklk?=
 =?utf-8?B?Uy9VWXBDSGxhMUhpL2k0b1NpR1pWOHNOa01iaCtpM216Z1ROSk81cU1uSGVk?=
 =?utf-8?B?dzVPT1IxSkNsR2RYSW5sUnZWdUZualNwUnV6NTJ1ajVZV0djcklaellOemZT?=
 =?utf-8?B?cFJBb0FZRWtVc0dUWnJ1Zm9HYmRnbHRNVm05RWVLcnd2RjJNSStjckJOSksx?=
 =?utf-8?B?K3R6M0t3TGVwdlYvbVd1N2lyalpCaE9MUTFGY1VDWEV1Y3pUTUVRTUJOWFcz?=
 =?utf-8?Q?a1O06HZvLaDYzMO8=3D?=
X-Exchange-RoutingPolicyChecked: HKKQhdQAa/aaOsIU0KdVtB/PUiA1AqE/g6Jd8HzEv3MT6VO7STiLzXbvFyHc1Ssx0JIN6Jo4jl8bIkLOECUdTkoS24JpPH6hivavZcRocoI33ftldlrmK1bk4MKOVJnxQbUoe2tEelGToce3FUVDXJq7Yt+ZYgNinmKMkXiOytn6RCqNSj+NFHOCYsAnf2e03q6L2cuFU4y3rqVtl6Lc10MgQ4a32pDIcB7ZKf7ui651chOFwyro2Z2ErQ2OpFsXC94Z+D5W0Y3jmTgUHai877MDSNzqOe/EZndBLQjlxe0U3UMcMnsAXaWUCrFPgsBsn+M1esEh6mQuZptyWrd7gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c764219d-cc87-47c2-1486-08debfafb814
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:30:56.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4E4HTPb8/mdHB4nDpYPHbciuJQ/rCpDnMQSlEDee8Y1zfW7e7QD7ed+SZ2EB2WkyAD1z3xiZD4HF9GK+/zwnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110516-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,intel.com:mid,intel.com:dkim];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.hunter@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DBBB261AE7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 11:10, Ram Prakash Gupta wrote:
> Set ice clk rate from sdhci msm platform driver, needed for
> target which are having legacy ice support, and need sdhci msm
> platform driver to set rate.

Please expand upon what "legacy" means here?

For CQ case, qcom_ice_create() prefers "ice_core_clk" before
"ice".  How does that relate to this?  Please clarify that in the
commit message also.

> 
> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b4131b12df56..c6a073718aa4 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>  	/* core, iface, cal and sleep clocks */
>  	struct clk_bulk_data bulk_clks[4];
>  #ifdef CONFIG_MMC_CRYPTO
> +	struct clk *ice_clk;	/* ICE clock */

Why keep ice_clk?

>  	struct qcom_ice *ice;
>  #endif
>  	unsigned long clk_rate;
> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +#ifdef CONFIG_MMC_CRYPTO
> +	/* Setup ICE clock */
> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
> +	if (!IS_ERR(msm_host->ice_clk)) {

Does not attempt to deal with -EPROBE_DEFER, although bus_clk above
doesn't either.

> +		/* Vote for max. clk rate for max. performance */
> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
> +		if (ret)
> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
> +	}
> +#endif

Could put this in a helper+stub function in the "Inline Crypto Engine
(ICE) support" section, to save having #ifdef CONFIG_MMC_CRYPTO here

> +
>  	/* Setup main peripheral bus clock */
>  	clk = devm_clk_get(&pdev->dev, "iface");
>  	if (IS_ERR(clk)) {


