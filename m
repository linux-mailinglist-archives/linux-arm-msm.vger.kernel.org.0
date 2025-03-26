Return-Path: <linux-arm-msm+bounces-52557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925EA71FD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 21:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78DD017729F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 20:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3474253B6A;
	Wed, 26 Mar 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k6+U8l+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B214F125;
	Wed, 26 Mar 2025 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743019407; cv=fail; b=ajlkIf7/KIyFWFlHGL41647w1PSoUbYBdIDEhHup2OqUOP1tAagXeOE0Vx7XRriXmLreITEEKkSZe8X9nRZDEV/4iRFLFoXLII6PJMlJMBckRHlI2IwHHpaz3d2Ry+aXF0iVUlszzH/NIBJRweYr/WzIWVyBx9mBw+k0Ifeh8Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743019407; c=relaxed/simple;
	bh=IahewOS+muPAv1IXVTcnbKRABQrNE+lNtFc6mudC2FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OszsvYKmUQVRcBjA9XJVKISB1Fzrdvqgkt+Y8NxmUPg6UdGq+hrWGqT2DIQtwk0lpk5bTBctTrPOqszet3LENBG3v6LWE+wTArUrwSv5iXSv0TXhDitPgjSKZJ8re3UrTno/2iA7PM4jmrF2MJCclQTsYHwLworo311dQILpPAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k6+U8l+3; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoGBvlzxfrDcymvz1b4k+IZ4XT4ktGUPwYPNoIisi1HFqyn+6ge+H2k8buSfycGz7L4Q1zUrT1RhN8Dbq4OIoa5HEUKzlRFV4qwaUCUUkbxnOzSjJhoO55onVtGD/ItFpMZL1ryDktHWZPCgY9eacefua4FwqkKXZSEEbhyiglg0MyITl0nN3rNRFzB13k+IH8y1lCzvAwPu5v3FzD6JrWZd+XCo5+j/13ZVv4DuVJKhNYeUL/GlDCtbMWBRMZw7vcyCEYkz4v2g/mBBWHoYL0ORYCcc9UoTSOKC3hHFXmtL2ncTRO8+HMLpmbJq25mXbhzmQiTLghsUgoaY1M7pEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goXNyANh1Lj0Pxos7K4Kk6Sxv/RarecHCKU8FUeiFXI=;
 b=DOzWpn9ADn2GS0Jaw2saK5sWpc/9YHGjhlqy30ABl09RmhcK8HX+Db4m4BvLi71iOx1Qft8kbCcqVK02Pk3J7Ib0EEvXhC0LvnutFK7JbZ4Z4ui4oL/tchkk6l3REM9Z4HVyRW19laeZk+VZXDzNTkicjGfstVI9X0r5Avc2ei5ia//+c5IqDt3ikSnlJnw+zA8Aj7yBx17Q3f55SC0GsUruo9OaU0o/pVbp34MJZJAlstLpx6bVoHa6SXuLq6dyUy6iQqLuLb5qTrEXZuvT+BD2L1HS23admKCrSurOKlmNN1Ij/W59E8rARy2rBvQJ4LkZq63gNL2S/aEepsWvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goXNyANh1Lj0Pxos7K4Kk6Sxv/RarecHCKU8FUeiFXI=;
 b=k6+U8l+32mtQEEX/ayOCenn6hO4NPpx+wHagPWG4ieV0JNYRidSO5wMgHC1HecrHGEqU9639ThTtUjd/w/li9gd5f383DTZ7OzhkKytqcJqHKQqZ2aEnvKRWjrbsIjuBvKXeK8oBwUA4h68UgcM9nwQ2bJG5Oq+KXT/+9ut/VQiRFdR0rMaTq1ohCgDF/0HJisW3b+EhBeLmEBe/o4M6WRn/YtLkbqqyh61eoCDf/oSpsZ3VCvsnp6b6GYcO2Logys7/3eVNxkAK0ZJEO04dozn6IxIn06BnuZc8fH6dAPnzh/LMBdxcadtVUDnmrVPDvhYm+tu0/KRIwR9hz2nhWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8764.eurprd04.prod.outlook.com (2603:10a6:20b:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 20:03:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 20:03:21 +0000
Date: Wed, 26 Mar 2025 16:03:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <Z+RdgfrQ2zs9Szt3@lizhi-Precision-Tower-5810>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a81327-997d-4216-e1ca-08dd6ca141e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MqVmQIAl4vuOFM2jmNMz/m6uG4GfHyowaiexJKJ8Rdb1etVYlUryQ1APbjk8?=
 =?us-ascii?Q?1KDAh5k9/QynILGFh48cyPyJBrBCcBZYc2edXAzMpM3kGjH/rvXg3Q0gmHhp?=
 =?us-ascii?Q?5HQP6ZXeS7TO0kDNmFYHuajoAXQc7qH63jKWCj0PfecjNiS6ju+881zwzLwU?=
 =?us-ascii?Q?iLREzg8H/vWS8Bh2gYpmjFXQEZgDy5at0/WO53Ajq6U6Y/2U5MVPfkRMGHtR?=
 =?us-ascii?Q?QDuQkoMxYOqnxRiNAwEobE4X4SPk7tVW7HI1aqSUi8dpMDVabLE9JrxepABx?=
 =?us-ascii?Q?Ub5JBv4aOb6W5tJST/kIFnBpfADpYfrEG2Mv7YjCKql6ownv6c6am/QmmJzX?=
 =?us-ascii?Q?8Kj184VZ+HN+mEt+OQXm9uEpAy8urnl7OiNf2RJcmGyKp5cW9IiDuElRVvZ1?=
 =?us-ascii?Q?eDiX5aBkl+deEUCsH2XU9Z4kBVQUONNF8KLQzw0u1M1vnllNJPvtkNLlQ1T7?=
 =?us-ascii?Q?6/nPak3fMkjZJiQIwEZ6m2gL+1FPvw+v0Ikk+lCqt+kq36Xr5z4usbeyN9xp?=
 =?us-ascii?Q?ae3z+wdo1H1dq+40cR1u100S/n+kV1kU1NWpnBMg8rLqpsvewv3wKSCpZBY5?=
 =?us-ascii?Q?L5jCBqwLuz0304c/S/lddyxRshMtdfpJbhSMp9x6lmJMHZl2Jky1X7MP0vMs?=
 =?us-ascii?Q?dkvYSKJ0mwR4gKfhpKO1knhU1WbFg90yeSy5uWAiJlnKeT+O6783FPig5x9Y?=
 =?us-ascii?Q?f9i/IYvv1siRfQvJ+BiuKum4IfXoQ9Cyt6z7lQFcwVHrJhPpRsb49+fQ9+Ay?=
 =?us-ascii?Q?PsIuby1WArhnUBBOWPxacslvLA93YZEktlDxe/efLeM6AYGhxiE0U/MhPTBN?=
 =?us-ascii?Q?SxhIA/3CkrGxbiPZqZfGvq2xMS1DkCdGXORC/cIAuRrbXmMBjy74xatEttN7?=
 =?us-ascii?Q?VIRwr2HpGbRmi2nHImVX+vCmE00QkDMSs8DJVI0Ojs9YyY0tYT6NAeUAT2pE?=
 =?us-ascii?Q?EqeG4dkR9St4+Crilce+3RsQCOgzo51WQnlClCsg287SfrZFo3HX8m9xbVr7?=
 =?us-ascii?Q?gb+bKKHkX1RRMTuAYvtRDAMcMNbJQUVi1d8oS5aXXPyUxuKcgR3lbTyr5mKr?=
 =?us-ascii?Q?ezrgCaVHldOl1DrpXTxRN/lhVdO5oISPI/usEqaq3e8FYfmVVAU5bZ5pC8gN?=
 =?us-ascii?Q?GQUTWtM3nanFRrC8HcSyRdH71yv/dtGJfQ40XfZMyvQ69bERNfub29jcwUi0?=
 =?us-ascii?Q?LDQW/Z/n3+uAopgV2PhKA5TBIYgZT3i0FWoUhxGqFMFOtKaVvdNe0RKkVZV/?=
 =?us-ascii?Q?Em8vEv/ZBIdD6ZOMEuPUm4KCdyi9D3sxGT1GcxtOOuF4jXgWyO3PSKgsFN5E?=
 =?us-ascii?Q?piCyaSSz6AJrybtrq+fE2qf7A2Q+JDCOUnuHruVZxYpbGJKCcXx4jm/lx18f?=
 =?us-ascii?Q?0WwQ/ctN/gR1tpDDo6qfKrKMRhn6/Jpu9ImVyUNikz8mqeiEEAANqV8HpbMb?=
 =?us-ascii?Q?kU807Skjgk6w7iXC0S/x0SFL7V5OahCs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gVTrGcrgAbcbUrDxsTLKz2kopuiVVpX9gMSiLVUwPPXGDKQQ0WVZ5nfd4dkQ?=
 =?us-ascii?Q?/2TSYpGAOnnqJ+EPdYt1DXHdmLmuWjvfbECUyghQgx/pMjHu/W5dCBDXfom1?=
 =?us-ascii?Q?Zb4s1YuxfqObBCIqT8W0Dc/luNsIe1BDQSEzNaWYg2PJGW8VuyvqrppUFYy3?=
 =?us-ascii?Q?CSYJlyniloyp78i5IXxtmdmEmSaegzXZhwo9S/ExllqfBvPojnVU/LJGegPm?=
 =?us-ascii?Q?e1QSWcoQNNQ1Ag/o1EcKlYMbjrEPOUrl8VAvJGrR/561PoN70KZm7l8J440H?=
 =?us-ascii?Q?7wPk5ezpnA6dHQtXRVIjj1NrE6Om1YAOKwCrN+U/b8B1VEUiwctv175Mg5eb?=
 =?us-ascii?Q?RUH0cUgr5WvXFJQKAg1RK7j3Y1J9oKp0eqiNzqBu7+ngRbR/wX9px6G9lrBt?=
 =?us-ascii?Q?wzSRVDXc42XD1n6aQvCu3i6M5fjTUT4wqMwsIysrxVSFQmxmztmJ9a+S3rXp?=
 =?us-ascii?Q?LaFuuQ0/jlatKsgZfWbQXvSpSK3PTJASx5ce3bG8pDkS6NvRq5CuvmANVxpy?=
 =?us-ascii?Q?QQw6gvfzxqwE6W4fmGVJ1ENl2EyKr1Tr8OJNCuVJBPOy8rQMYeV4cIOCLCVa?=
 =?us-ascii?Q?/E11bNSowLpMxUkq7Bmj9TBO3cloaXWGlOA3eL1JAc7Qf3plbUB6lDqsMB9h?=
 =?us-ascii?Q?+kjP6gycmJWgw4lxOo74NTFWtzs091s0jzUmXupKPJXg4ZGITzUwTtYg0aeU?=
 =?us-ascii?Q?mVIpSWbau0/fTgOVFtTdwvix/DwWgRvexFu6lvOLIbzeVb/a4NEt2Wiw+kIS?=
 =?us-ascii?Q?gsNFJn6HEfMtRscljKL+f9NTTrKRR20I9or+MV16aWn+WSN2ly16eZduGU5j?=
 =?us-ascii?Q?Mj392wqifERCPNegQ6gVrpqa5dTHtCaVMoEaHiJye2DPU++HZ96xr9XoET7W?=
 =?us-ascii?Q?vHn5Ncz0LIQupJPzMMbS7LX7KyggH11eMCmf+fgXjvo2K0fLsjAJsLnh645u?=
 =?us-ascii?Q?FbDsqYBy9/iLaf0yLo6eXu3/3aXvlEIrPZ6Z4u3moT6l/PkWsDuCjZctyMM3?=
 =?us-ascii?Q?102aWyu3kUFJ7BroL0gfFvw4n9phXP2ikMqzK/cSm5uXgN2uuGjHeldag3ml?=
 =?us-ascii?Q?CDA4/ayf710yd7F4GDQYligS66arRGXhXLrz9PJgnBFH+AfyC5spwylfrs3a?=
 =?us-ascii?Q?aD+sNACPoNyRRSP37BDgJHOPWY0PFEfCZg72piVOprXKIoXapQgCXwDuamwu?=
 =?us-ascii?Q?xCMxayut9GBDBn+heepoJupM3k6dPSSrh9ejpY4p4FzrvVKsmEL+G9mkf8Sr?=
 =?us-ascii?Q?WHApkbNZ+02sUAfxxj6Z2eVS6kLDMJxt3l/QZ33lLodu8rswUL/RsZRUCnAS?=
 =?us-ascii?Q?/eVBm6nCRt8xrAROxPonu1Jx8swFnqzsFwThybU4iMhlRmwsZTZdml2QjVpX?=
 =?us-ascii?Q?Kq6JeTsgfCWi7S2McJChLWNssSvWUhJPq3cFqAlJYfVuTEVAxESt+rixOiKx?=
 =?us-ascii?Q?XSj3S7ElQ3/48HPxtSkphR7BBai0EyzIo4saRv+JmeKaAbNiFseYbyMf04u1?=
 =?us-ascii?Q?kIDRuvSTo0+MxwBEI0HvlvBOmsImcKjxJw1hdH0bfgWYpnke5W8Udvv+1dbA?=
 =?us-ascii?Q?2+lslKqK0gSBReeUNWUmWV4hUVYOouZfzC7Ckgx9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a81327-997d-4216-e1ca-08dd6ca141e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 20:03:21.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEabctlM29R/TvJCUsz4jilUAQuDylCnFDN9BYKJjhFhwQfKbh+etfw3BTpDHSObxxkfpL7lH9yzqMq4PEu6IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8764

On Wed, Mar 26, 2025 at 07:46:40PM +0530, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
>
> This driver supports master role in SDR mode.
>
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.
>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/i3c/master/Kconfig           |   12 +
>  drivers/i3c/master/Makefile          |    1 +
>  drivers/i3c/master/qcom-i3c-master.c | 1107 ++++++++++++++++++++++++++
>  3 files changed, 1120 insertions(+)
>  create mode 100644 drivers/i3c/master/qcom-i3c-master.c
>
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 77da199c7413..5370cadfe236 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -44,6 +44,18 @@ config SVC_I3C_MASTER
>  	help
>  	  Support for Silvaco I3C Dual-Role Master Controller.
>
> +config QCOM_I3C_MASTER
> +	tristate "Qualcomm Technologies Inc.'s I3C Master controller driver"
> +	depends on I3C
> +	help
> +	This driver supports QUPV3 GENI based I3C controller in master

It should have extrn 2 space

	help
	  This driver ....

> +	mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
> +	this option, support will be included for the built-in I3C interface
> +	on the Qualcomm Technologies Inc.s SoCs.
> +
> +	This driver can also be built as a module.  If so, the module
> +	will be called qcom-i3c-master.
> +
>  config MIPI_I3C_HCI
>  	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>  	depends on I3C
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..f6670a63b34f 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>  obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> +obj-$(CONFIG_QCOM_I3C_MASTER)		+= qcom-i3c-master.o
> diff --git a/drivers/i3c/master/qcom-i3c-master.c b/drivers/i3c/master/qcom-i3c-master.c
> new file mode 100644
> index 000000000000..54778a6baa70
> --- /dev/null
> +++ b/drivers/i3c/master/qcom-i3c-master.c
> @@ -0,0 +1,1107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + * Author: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/geni-se.h>
> +
> +#define SE_I3C_SCL_HIGH                 0x268
> +#define SE_I3C_TX_TRANS_LEN             0x26C
> +#define SE_I3C_RX_TRANS_LEN             0x270
> +#define SE_I3C_DELAY_COUNTER            0x274
> +#define SE_I2C_SCL_COUNTERS             0x278
> +#define SE_I3C_SCL_CYCLE                0x27C

please use low case hex value

> +#define SE_GENI_HW_IRQ_EN               0x920
> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
> +
> +/* HW I3C IBI interrupt enable */
> +#define M_IBI_IRQ_EN BIT(0)
> +
> +/* M_IBI_IRQ_IGNORE */
> +#define M_IBI_IRQ_IGNORE BIT(0)
> +
> +/* SE_GENI_M_CLK_CFG field shifts */
> +#define	CLK_DIV_VALUE_MASK	GENMASK(23, 4)
> +#define SER_CLK_EN		BIT(0)
> +
> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
> +#define M_IBI_IRQ_PARAM_7E BIT(0)
> +#define M_IBI_IRQ_PARAM_STOP_STALL BIT(1)
> +/* SE_I2C_SCL_COUNTERS field shifts */
> +#define I2C_SCL_HIGH_COUNTER_MASK	GENMASK(29, 20)
> +#define I2C_SCL_LOW_COUNTER_MASK	GENMASK(19, 10)
> +#define I2C_SCL_CYCLE_COUNTER_MASK	GENMASK(9, 0)
> +
> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
> +	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
> +	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
> +
> +/* M_CMD OP codes for I2C/I3C */
> +#define I3C_READ_IBI_HW          0
> +#define I2C_WRITE                1
> +#define I2C_READ                 2
> +#define I2C_WRITE_READ           3
> +#define I2C_ADDR_ONLY            4
> +#define I3C_INBAND_RESET         5
> +#define I2C_BUS_CLEAR            6
> +#define I2C_STOP_ON_BUS          7
> +#define I3C_HDR_DDR_EXIT         8
> +#define I3C_PRIVATE_WRITE        9
> +#define I3C_PRIVATE_READ         10
> +#define I3C_HDR_DDR_WRITE        11
> +#define I3C_HDR_DDR_READ         12
> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
> +#define I3C_BCAST_CCC_ADDR_ONLY  14
> +#define I3C_READ_IBI             15
> +#define I3C_BCAST_CCC_WRITE      16
> +#define I3C_DIRECT_CCC_WRITE     17
> +#define I3C_DIRECT_CCC_READ      18
> +
> +/* M_CMD params for I3C */
> +#define PRE_CMD_DELAY          BIT(0)
> +#define TIMESTAMP_BEFORE       BIT(1)
> +#define STOP_STRETCH           BIT(2)
> +#define TIMESTAMP_AFTER        BIT(3)
> +#define POST_COMMAND_DELAY     BIT(4)
> +#define IGNORE_ADD_NACK        BIT(6)
> +#define READ_FINISHED_WITH_ACK BIT(7)
> +#define CONTINUOUS_MODE_DAA    BIT(8)
> +
> +#define SLAVE_ADDR_MASK           GENMASK(15, 9)
> +#define SLV_ADDR_SHFT          9
> +
> +#define CCC_HDR_CMD_MSK        GENMASK(23, 16)
> +#define CCC_HDR_CMD_SHFT       16
> +#define IBI_NACK_TBL_CTRL      BIT(24)
> +#define USE_7E                 BIT(25)
> +#define BYPASS_ADDR_PHASE      BIT(26)
> +
> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
> +#define GP_IRQ0	BIT(5)
> +#define GP_IRQ1	BIT(6)
> +#define GP_IRQ2	BIT(7)
> +#define GP_IRQ3	BIT(8)
> +#define GP_IRQ4	BIT(9)
> +#define GP_IRQ5	BIT(10)
> +#define DM_I3C_CB_ERR   GENMASK(10, 5)
> +
> +#define I3C_AUTO_SUSPEND_DELAY  250
> +#define KHZ(freq)               (1000 * (freq))
> +#define PACKING_BYTES_PW        4
> +#define XFER_TIMEOUT            250
> +#define DFS_INDEX_MAX           7
> +
> +#define I3C_ADDR_MASK 0x7f
> +
> +enum geni_i3c_err_code {
> +	RD_TERM,
> +	NACK,
> +	CRC_ERR,
> +	BUS_PROTO,
> +	NACK_7E,
> +	NACK_IBI,
> +	GENI_OVERRUN,
> +	GENI_ILLEGAL_CMD,
> +	GENI_ABORT_DONE,
> +	GENI_TIMEOUT,
> +};
> +
> +enum i3c_bus_phase {
> +	OPEN_DRAIN_MODE  = 0,
> +	PUSH_PULL_MODE   = 1
> +};
> +
> +struct geni_i3c_dev {
> +	struct geni_se se;
> +	unsigned int tx_wm;
> +	int irq;
> +	int err;
> +	struct i3c_master_controller ctrlr;
> +	struct completion done;
> +	/* Protects per device CCC command or transfer from get_mutex_lock()/unlock() wrapper */
> +	struct mutex lock;
> +	/* Per device protection between process and IRQ context */
> +	spinlock_t irq_lock;
> +	u32 clk_src_freq;
> +	u8 *cur_buf;
> +	bool cur_is_write;
> +	int cur_len;
> +	int cur_idx;
> +	//unsigned long newaddrslots[(I3C_ADDR_MASK + 1) / BITS_PER_LONG];
> +	DECLARE_BITMAP(newaddrslots, 64);
> +
> +	const struct geni_i3c_clk_settings *clk_cfg;
> +	const struct geni_i3c_clk_settings *clk_od_cfg;
> +};
> +
> +struct geni_i3c_i2c_dev_data {
> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */

Remove it, add it only when use it.

> +};
> +
> +struct geni_i3c_xfer_params {
> +	enum geni_se_xfer_mode mode;
> +	u32 m_cmd;
> +	u32 m_param;
> +};
> +
> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
> +							*master)
> +{
> +	return container_of(master, struct geni_i3c_dev, ctrlr);
> +}
> +
> +struct geni_i3c_clk_settings {
> +	u32 clk_freq_out;
> +	u32 clk_src_freq;
> +	u8  clk_div;
> +	u8  i2c_t_high_cnt;
> +	u8  i2c_t_low_cnt;
> +	u8  i3c_t_high_cnt;
> +	u8  i3c_t_cycle_cnt;
> +	u8  i2c_t_cycle_cnt;
> +};
> +
> +/*
> + * Hardware uses the underlying formula to calculate time periods of
> + * SCL clock cycle. Firmware uses some additional cycles excluded from the
> + * below formula and it is confirmed that the time periods are within
> + * specification limits.
> + *
> + * time of high period of I2C SCL:
> + *         i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
> + * time of low period of I2C SCL:
> + *         i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
> + * time of full period of I2C SCL:
> + *         i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
> + * time of high period of I3C SCL:
> + *         i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
> + * time of full period of I3C SCL:
> + *         i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
> + * clk_freq_out = t / t_cycle
> + */
> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
> +/* op-freq,  src-freq,  div,  i2c_high,  i2c_low, i3c_high, i3c_cyc i2c_cyc */
> +	{ KHZ(100),    KHZ(19200), 1, 76, 90, 7, 8, 192},
> +	{ KHZ(400),    KHZ(19200), 1, 12, 24, 7, 8, 48},
> +	{ KHZ(1000),   KHZ(19200), 1,  4,  9, 7, 0, 19},
> +	{ KHZ(12500), KHZ(100000), 1, 45, 63, 6, 7, 110},
> +};
> +
> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
> +{
> +	const struct geni_i3c_clk_settings *clk_idx = geni_i3c_clk_map;
> +	struct i3c_master_controller *m = &gi3c->ctrlr;
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_idx++) {
> +		if ((!bus || clk_idx->clk_freq_out == bus->scl_rate.i3c) &&
> +		    clk_idx->clk_src_freq == gi3c->clk_src_freq) {
> +			gi3c->clk_cfg = clk_idx;
> +		}
> +
> +		if (clk_idx->clk_freq_out == bus->scl_rate.i2c)
> +			gi3c->clk_od_cfg = clk_idx;
> +	}
> +
> +	if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void set_new_addr_slot(unsigned long *addrslot, u8 addr)
> +{
> +	if (addr > I3C_ADDR_MASK)
> +		return;
> +
> +	set_bit(addr, addrslot);
> +}
> +
> +static void clear_new_addr_slot(unsigned long *addrslot, u8 addr)
> +{
> +	if (addr > I3C_ADDR_MASK)
> +		return;
> +
> +	clear_bit(addr, addrslot);
> +}
> +
> +static bool is_new_addr_slot_set(unsigned long *addrslot, u8 addr)
> +{
> +	if (addr > I3C_ADDR_MASK)
> +		return false;
> +
> +	return test_bit(addr, addrslot);
> +}
> +
> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum i3c_bus_phase bus_phase)
> +{
> +	const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
> +	unsigned long freq;
> +	u32 val, dfs_idx;
> +	int ret;
> +
> +	if (bus_phase == OPEN_DRAIN_MODE)
> +		clk_idx = gi3c->clk_od_cfg;
> +
> +	ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
> +				     &dfs_idx, &freq, false);
> +	if (ret)
> +		dfs_idx = 0;
> +
> +	writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
> +
> +	val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
> +	val |= SER_CLK_EN;
> +	writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
> +
> +	val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx->i2c_t_high_cnt);
> +	val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx->i2c_t_low_cnt);
> +	val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx->i2c_t_cycle_cnt);
> +	writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
> +
> +	writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + SE_I3C_SCL_CYCLE);
> +	writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + SE_I3C_SCL_HIGH);
> +
> +	writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
> +
> +	val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
> +	writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
> +
> +	writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);
> +}
> +
> +static void geni_i3c_handle_err(struct geni_i3c_dev *gi3c, u32 status)
> +{
> +	dev_dbg(gi3c->se.dev, "len:%d, %s\n",
> +		gi3c->cur_len, gi3c->cur_is_write ? "write" : "read");
> +
> +	if (status & M_GP_IRQ_0_EN) {
> +		gi3c->err = -EINVAL;
> +		dev_dbg(gi3c->se.dev, "%s\n", "I3C slave early read termination");
> +	}
> +	if (status & M_GP_IRQ_1_EN) {
> +		gi3c->err = -ENOTCONN;
> +		dev_dbg(gi3c->se.dev, "%s\n", "NACK: slave unresponsive, check power/reset");
> +	}
> +	if (status & M_GP_IRQ_2_EN) {
> +		gi3c->err = -EINVAL;
> +		dev_dbg(gi3c->se.dev, "%s\n", "CRC or parity error");
> +	}
> +	if (status & M_GP_IRQ_3_EN) {
> +		gi3c->err = -EPROTO;
> +		dev_dbg(gi3c->se.dev, "%s\n", "Bus proto Error, noisy/unexpected start/stop");
> +	}
> +	if (status & M_GP_IRQ_4_EN) {
> +		gi3c->err = -EBUSY;
> +		dev_dbg(gi3c->se.dev, "%s\n", "NACK on 7E, unexpected protocol error");
> +	}
> +	if (status & M_GP_IRQ_5_EN) {
> +		gi3c->err = -EINVAL;
> +		dev_dbg(gi3c->se.dev, "%s\n", "NACK on IBI");
> +	}
> +	if (status & M_CMD_OVERRUN_EN) {
> +		gi3c->err = -EIO;
> +		dev_dbg(gi3c->se.dev, "%s\n", "Cmd overrun, check GENI cmd-state machine");
> +	}
> +	if (status & M_ILLEGAL_CMD_EN) {
> +		gi3c->err = -EILSEQ;
> +		dev_dbg(gi3c->se.dev, "%s\n", "Illegal cmd, check GENI cmd-state machine");
> +	}
> +	if (status & M_CMD_ABORT_EN) {
> +		gi3c->err = -ETIMEDOUT;
> +		dev_dbg(gi3c->se.dev, "%s\n", "Abort after timeout successful");
> +	}
> +	if (status & GENI_TIMEOUT) {
> +		gi3c->err = -ETIMEDOUT;
> +		dev_dbg(gi3c->se.dev, "%s\n", "I3C transaction timed out");
> +	}
> +}
> +
> +static irqreturn_t geni_i3c_irq(int irq, void *dev)
> +{
> +	u32 m_stat_mask, dm_tx_st, dm_rx_st, m_stat, rx_st, dma;
> +	struct geni_i3c_dev *gi3c = dev;
> +	unsigned long flags;
> +	int j;
> +
> +	m_stat = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_STATUS);
> +	m_stat_mask = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_EN);
> +	rx_st = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFO_STATUS);
> +	dm_tx_st = readl_relaxed(gi3c->se.base + SE_DMA_TX_IRQ_STAT);
> +	dm_rx_st = readl_relaxed(gi3c->se.base + SE_DMA_RX_IRQ_STAT);
> +	dma = readl_relaxed(gi3c->se.base + SE_GENI_DMA_MODE_EN);
> +
> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
> +
> +	if (m_stat & SE_I3C_ERR || dm_rx_st & DM_I3C_CB_ERR) {
> +		geni_i3c_handle_err(gi3c, m_stat);
> +		/* Disable the TX Watermark interrupt to stop TX */
> +		if (!dma)
> +			writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +		goto irqret;
> +	}
> +
> +	if (dma) {
> +		dev_dbg(gi3c->se.dev, "i3c dma tx:0x%x, dma rx:0x%x\n", dm_tx_st, dm_rx_st);
> +		goto irqret;
> +	}
> +
> +	if ((m_stat &
> +		(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
> +		!gi3c->cur_is_write && gi3c->cur_buf) {
> +		u32 rxcnt = rx_st & RX_FIFO_WC_MSK;
> +
> +		for (j = 0; j < rxcnt; j++) {
> +			u32 val;
> +			int p = 0;
> +
> +			val = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFOn);
> +			while (gi3c->cur_idx < gi3c->cur_len && p < sizeof(val)) {
> +				gi3c->cur_buf[gi3c->cur_idx++] = val & 0xff;
> +				val >>= 8;
> +				p++;
> +			}
> +			if (gi3c->cur_idx == gi3c->cur_len)
> +				break;
> +		}
> +	} else if (m_stat & M_TX_FIFO_WATERMARK_EN &&
> +		gi3c->cur_is_write && gi3c->cur_buf) {
> +		for (j = 0; j < gi3c->tx_wm; j++) {
> +			u32 temp;
> +			u32 val = 0;
> +			int p = 0;
> +
> +			while (gi3c->cur_idx < gi3c->cur_len && p < sizeof(val)) {
> +				temp = gi3c->cur_buf[gi3c->cur_idx++];
> +				val |= temp << (p * 8);
> +				p++;
> +			}
> +
> +			writel_relaxed(val, gi3c->se.base + SE_GENI_TX_FIFOn);
> +			if (gi3c->cur_idx == gi3c->cur_len) {
> +				writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +				break;
> +			}
> +		}
> +	}
> +
> +irqret:
> +	if (m_stat)
> +		writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
> +
> +	if (dma) {
> +		if (dm_tx_st)
> +			writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
> +		if (dm_rx_st)
> +			writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
> +	}
> +
> +	/* if this is err with done-bit not set, handle that through timeout. */
> +	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN) {
> +		writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +		complete(&gi3c->done);
> +	} else if (dm_tx_st & TX_DMA_DONE || dm_rx_st & RX_DMA_DONE	||
> +		dm_rx_st & RX_RESET_DONE) {
> +		complete(&gi3c->done);
> +	}
> +
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +	return IRQ_HANDLED;
> +}
> +
> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
> +{
> +	int ret;
> +
> +	mutex_lock(&gi3c->lock);
> +	reinit_completion(&gi3c->done);
> +	ret = pm_runtime_get_sync(gi3c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi3c->se.dev);
> +		/* Set device in suspended since resume failed */
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		mutex_unlock(&gi3c->lock);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
> +{
> +	pm_runtime_mark_last_busy(gi3c->se.dev);
> +	pm_runtime_put_autosuspend(gi3c->se.dev);
> +	mutex_unlock(&gi3c->lock);
> +}
> +
> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
> +{
> +	unsigned long time_remaining;
> +	unsigned long flags;
> +
> +	reinit_completion(&gi3c->done);
> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
> +	geni_se_abort_m_cmd(&gi3c->se);
> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +	if (!time_remaining)
> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
> +}
> +
> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct geni_i3c_xfer_params *xfer)
> +{
> +	bool is_write = gi3c->cur_is_write;
> +	dma_addr_t tx_dma = 0, rx_dma = 0;
> +	unsigned long time_remaining;
> +	u32 len = gi3c->cur_len;
> +	int ret;
> +
> +	geni_se_select_mode(&gi3c->se, xfer->mode);
> +
> +	gi3c->err = 0;
> +	gi3c->cur_idx = 0;
> +
> +	if (!is_write) {
> +		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
> +			xfer->m_cmd, xfer->m_param, len);
> +		writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
> +		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
> +		if (xfer->mode == GENI_SE_DMA) {
> +			ret = geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &rx_dma);
> +			if (ret) {
> +				xfer->mode = GENI_SE_FIFO;
> +				geni_se_select_mode(&gi3c->se, xfer->mode);
> +			}
> +		}
> +	} else {
> +		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
> +			xfer->m_cmd, xfer->m_param, len);
> +
> +		writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
> +		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
> +
> +		if (xfer->mode == GENI_SE_DMA) {
> +			ret = geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &tx_dma);
> +			if (ret) {
> +				xfer->mode = GENI_SE_FIFO;
> +				geni_se_select_mode(&gi3c->se, xfer->mode);
> +			}
> +		}
> +
> +		if (xfer->mode == GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
> +			writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +	}
> +
> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +	if (!time_remaining) {
> +		unsigned long flags;
> +
> +		dev_dbg(gi3c->se.dev, "Timeout completing FIFO transfer\n");
> +		spin_lock_irqsave(&gi3c->irq_lock, flags);
> +		geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
> +		gi3c->cur_buf = NULL;
> +		spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +		geni_i3c_abort_xfer(gi3c);
> +	}
> +
> +	if (xfer->mode == GENI_SE_DMA) {
> +		if (gi3c->err) {
> +			if (is_write)
> +				writel_relaxed(1, gi3c->se.base + SE_DMA_TX_FSM_RST);
> +			else
> +				writel_relaxed(1, gi3c->se.base + SE_DMA_RX_FSM_RST);
> +
> +			time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +			dev_dbg(gi3c->se.dev, "Timeout completing DMA transfer\n");
> +		}
> +		geni_se_rx_dma_unprep(&gi3c->se, rx_dma, len);
> +		geni_se_tx_dma_unprep(&gi3c->se, tx_dma, len);
> +	}
> +
> +	ret = gi3c->err;
> +	if (gi3c->err)
> +		dev_err(gi3c->se.dev, "I3C transaction error :%d\n", gi3c->err);
> +
> +	gi3c->cur_buf = NULL;
> +	gi3c->err = 0;
> +
> +	return ret;
> +}
> +
> +static int i3c_geni_execute_read_command(struct geni_i3c_dev *gi3c,
> +					 struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
> +{
> +	gi3c->cur_is_write = false;
> +	gi3c->cur_buf = buf;
> +	gi3c->cur_len = len;
> +	return _i3c_geni_execute_command(gi3c, xfer);
> +	//return geni_i3c_fifo_dma_xfer(gi3c, xfer);

remove these commented code.

> +}
> +
> +static int i3c_geni_execute_write_command(struct geni_i3c_dev *gi3c,
> +					  struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
> +{
> +	gi3c->cur_is_write = true;
> +	gi3c->cur_buf = buf;
> +	gi3c->cur_len = len;
> +	return _i3c_geni_execute_command(gi3c, xfer);
> +	//return geni_i3c_fifo_dma_xfer(gi3c, xfer);
> +}
> +
> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
> +{
> +	u8 last_dyn_addr = 0;
> +	int ret;
> +
> +	while (1) {
> +		u8 rx_buf[8], tx_buf[8];
> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
> +		struct i3c_device_info info = { 0 };
> +		struct i3c_dev_desc *i3cdev;
> +		bool new_device = true;
> +		u64 pid;
> +		u8 bcr, dcr, addr;
> +
> +		xfer.m_cmd = I2C_READ;
> +		xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
> +		ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
> +		if (ret)
> +			break;
> +
> +		dcr = rx_buf[7];
> +		bcr = rx_buf[6];
> +		pid = ((u64)rx_buf[0] << 40) |
> +			((u64)rx_buf[1] << 32) |
> +			((u64)rx_buf[2] << 24) |
> +			((u64)rx_buf[3] << 16) |
> +			((u64)rx_buf[4] <<  8) |
> +			((u64)rx_buf[5]);
> +
> +		i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
> +			i3c_device_get_info(i3cdev->dev, &info);
> +			if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
> +				new_device = false;
> +				addr = (info.dyn_addr) ? info.dyn_addr :
> +					info.static_addr;
> +				break;
> +			}
> +		}
> +
> +		if (new_device) {
> +			ret = i3c_master_get_free_addr(&gi3c->ctrlr, last_dyn_addr + 1);
> +			if (ret < 0)
> +				break;
> +			addr = (u8)ret;
> +			last_dyn_addr = (u8)ret;
> +			set_new_addr_slot(gi3c->newaddrslots, addr);
> +		}
> +
> +		tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
> +		tx_buf[0] |= ~(hweight8(addr & I3C_ADDR_MASK) & 1);
> +
> +		xfer.m_cmd = I2C_WRITE;
> +		xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
> +
> +		ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
> +		if (ret)
> +			break;
> +	}
> +}
> +
> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> +					struct i3c_ccc_cmd *cmd)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	int i, ret;
> +
> +	if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
> +		return -EINVAL;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +	for (i = 0; i < cmd->ndests; i++) {
> +		int stall = (i < (cmd->ndests - 1)) ||
> +			(cmd->id == I3C_CCC_ENTDAA);
> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
> +
> +		xfer.m_param  = (stall ? STOP_STRETCH : 0);
> +		xfer.m_param |= (cmd->id << CCC_HDR_CMD_SHFT);
> +		xfer.m_param |= IBI_NACK_TBL_CTRL;
> +		if (cmd->id & I3C_CCC_DIRECT) {
> +			xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, cmd->dests[i].addr);
> +			if (cmd->rnw) {
> +				if (i == 0)
> +					xfer.m_cmd = I3C_DIRECT_CCC_READ;
> +				else
> +					xfer.m_cmd = I3C_PRIVATE_READ;
> +			} else {
> +				if (i == 0)
> +					xfer.m_cmd =
> +					   (cmd->dests[i].payload.len > 0) ?
> +						I3C_DIRECT_CCC_WRITE :
> +						I3C_DIRECT_CCC_ADDR_ONLY;
> +				else
> +					xfer.m_cmd = I3C_PRIVATE_WRITE;
> +			}
> +		} else {
> +			if (cmd->dests[i].payload.len > 0)
> +				xfer.m_cmd = I3C_BCAST_CCC_WRITE;
> +			else
> +				xfer.m_cmd = I3C_BCAST_CCC_ADDR_ONLY;
> +		}
> +
> +		if (i == 0)
> +			xfer.m_param |= USE_7E;
> +
> +		if (cmd->rnw)
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer,
> +							    cmd->dests[i].payload.data,
> +							    cmd->dests[i].payload.len);
> +		else
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer,
> +							     cmd->dests[i].payload.data,
> +							     cmd->dests[i].payload.len);
> +		if (ret)
> +			break;
> +
> +		if (cmd->id == I3C_CCC_ENTDAA)
> +			geni_i3c_perform_daa(gi3c);
> +	}
> +
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +	return ret;
> +}
> +
> +static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> +				      int nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	bool use_7e = false;
> +	int i, ret;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
> +
> +	for (i = 0; i < nxfers; i++) {
> +		bool stall = (i < (nxfers - 1));
> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
> +
> +		xfer.m_param  = (stall ? STOP_STRETCH : 0);
> +		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
> +		xfer.m_param |= (use_7e) ? USE_7E : 0;
> +
> +		/* use_7e = true only for last transfer */
> +		use_7e = (i == nxfers - 1);
> +
> +		if (xfers[i].rnw) {
> +			xfer.m_cmd = I3C_PRIVATE_READ;
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer, (u8 *)xfers[i].data.in,
> +							    xfers[i].len);
> +		} else {
> +			xfer.m_cmd = I3C_PRIVATE_WRITE;
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer, (u8 *)xfers[i].data.out,
> +							     xfers[i].len);
> +		}
> +
> +		if (ret)
> +			break;
> +	}
> +
> +	dev_dbg(gi3c->se.dev, "i3c priv: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +	return ret;
> +}
> +
> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, const struct i2c_msg *msgs, int num)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	int i, ret;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
> +
> +	for (i = 0; i < num; i++) {
> +		struct geni_i3c_xfer_params xfer;
> +
> +		xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : I2C_WRITE;
> +		xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
> +		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
> +		xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		else
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		if (ret)
> +			break;
> +	}
> +
> +	dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +	return ret;
> +}
> +
> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i2c_dev_set_master_data(dev, data);
> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +
> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i3c_dev_set_master_data(dev, data);
> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +
> +static int geni_i3c_master_do_daa(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	u8 addr;
> +	int ret;
> +
> +	ret = i3c_master_entdaa_locked(m);
> +	if (ret && ret != I3C_ERROR_M2)
> +		return ret;
> +
> +	for (addr = 0; addr <= I3C_ADDR_MASK; addr++) {
> +		if (is_new_addr_slot_set(gi3c->newaddrslots, addr)) {
> +			clear_new_addr_slot(gi3c->newaddrslots, addr);
> +			i3c_master_add_i3c_dev_locked(m, addr);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	/* Get an address for the master. */
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0)
> +		dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", __func__, ret);
> +
> +	info.dyn_addr = ret;
> +	info.dcr = I3C_DCR_GENERIC_DEVICE;
> +	info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
> +	info.pid = 0;
> +
> +	ret = geni_i3c_clk_map_idx(gi3c);
> +	if (ret)
> +		dev_err(gi3c->se.dev,
> +			"Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
> +			gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +
> +	ret = i3c_master_set_info(&gi3c->ctrlr, &info);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +	return ret;
> +}
> +
> +static bool geni_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> +					     const struct i3c_ccc_cmd *cmd)
> +{
> +	switch (cmd->id) {
> +	case I3C_CCC_ENEC(true):
> +		fallthrough;
> +	case I3C_CCC_ENEC(false):
> +		fallthrough;
> +	case I3C_CCC_DISEC(true):
> +		fallthrough;
> +	case I3C_CCC_DISEC(false):
> +		fallthrough;
> +	case I3C_CCC_ENTAS(0, true):
> +		fallthrough;
> +	case I3C_CCC_ENTAS(0, false):
> +		fallthrough;
> +	case I3C_CCC_RSTDAA(true):
> +		fallthrough;
> +	case I3C_CCC_RSTDAA(false):
> +		fallthrough;
> +	case I3C_CCC_ENTDAA:
> +		fallthrough;
> +	case I3C_CCC_SETMWL(true):
> +		fallthrough;
> +	case I3C_CCC_SETMWL(false):
> +		fallthrough;
> +	case I3C_CCC_SETMRL(true):
> +		fallthrough;
> +	case I3C_CCC_SETMRL(false):
> +		fallthrough;
> +	case I3C_CCC_DEFSLVS:
> +		fallthrough;
> +	case I3C_CCC_SETDASA:
> +		fallthrough;
> +	case I3C_CCC_SETNEWDA:
> +		fallthrough;
> +	case I3C_CCC_GETMWL:
> +		fallthrough;
> +	case I3C_CCC_GETMRL:
> +		fallthrough;
> +	case I3C_CCC_GETPID:
> +		fallthrough;
> +	case I3C_CCC_GETBCR:
> +		fallthrough;
> +	case I3C_CCC_GETDCR:
> +		fallthrough;
> +	case I3C_CCC_GETSTATUS:
> +		fallthrough;
> +	case I3C_CCC_GETACCMST:
> +		fallthrough;
> +	case I3C_CCC_GETMXDS:
> +		fallthrough;
> +	case I3C_CCC_GETHDRCAP:
> +		return true;
> +
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct i3c_master_controller_ops geni_i3c_master_ops = {
> +	.bus_init = geni_i3c_master_bus_init,
> +	.bus_cleanup = NULL,
> +	.do_daa = geni_i3c_master_do_daa,
> +	.attach_i3c_dev = geni_i3c_master_attach_i3c_dev,
> +	.reattach_i3c_dev = NULL,
> +	.detach_i3c_dev = geni_i3c_master_detach_i3c_dev,
> +	.attach_i2c_dev = geni_i3c_master_attach_i2c_dev,
> +	.detach_i2c_dev = geni_i3c_master_detach_i2c_dev,
> +	.supports_ccc_cmd = geni_i3c_master_supports_ccc_cmd,
> +	.send_ccc_cmd = geni_i3c_master_send_ccc_cmd,
> +	.priv_xfers = geni_i3c_master_priv_xfers,
> +	.i2c_xfers = geni_i3c_master_i2c_xfers,
> +	.enable_ibi = NULL,
> +	.disable_ibi = NULL,
> +	.request_ibi = NULL,
> +	.free_ibi = NULL,
> +	.recycle_ibi_slot = NULL,
> +};
> +
> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(gi3c->se.base))
> +		return PTR_ERR(gi3c->se.base);
> +
> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
> +	if (IS_ERR(gi3c->se.clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
> +							"Unable to get serial engine core clock: %pe\n",
> +							gi3c->se.clk);
> +
> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
> +	if (ret) {
> +		dev_info(&pdev->dev, "SE clk freq not specified, default to 100 MHz.\n");
> +		/* Default source clock freq is 100Mhz */
> +		gi3c->clk_src_freq = KHZ(100000);
> +	}
> +
> +	ret = geni_icc_get(&gi3c->se, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the bus quota to a reasonable value for register access */
> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
> +	ret = geni_icc_set_bw(&gi3c->se);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int geni_i3c_probe(struct platform_device *pdev)
> +{
> +	u32 proto, tx_depth, fifo_disable;
> +	struct geni_i3c_dev *gi3c;
> +	int ret;
> +
> +	gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
> +	if (!gi3c)
> +		return -ENOMEM;
> +
> +	gi3c->se.dev = &pdev->dev;
> +	gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +
> +	init_completion(&gi3c->done);
> +	mutex_init(&gi3c->lock);
> +	spin_lock_init(&gi3c->irq_lock);
> +	platform_set_drvdata(pdev, gi3c);
> +
> +	ret = i3c_geni_resources_init(gi3c, pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error Initializing GENI Resources\n");
> +
> +	gi3c->irq = platform_get_irq(pdev, 0);
> +	if (gi3c->irq < 0)
> +		return dev_err_probe(&pdev->dev, gi3c->irq, "Error getting IRQ number for I3C\n");
> +
> +	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error registering core IRQ\n");
> +
> +	ret = geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
> +
> +	proto = geni_se_read_proto(&gi3c->se);
> +	if (proto != GENI_SE_I3C) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(&pdev->dev, -ENXIO, "Invalid proto %d\n", proto);
> +	}
> +
> +	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
> +	if (fifo_disable) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
> +	}
> +
> +	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
> +	gi3c->tx_wm = tx_depth - 1;
> +	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
> +	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PW, true, true, true);
> +	geni_se_resources_off(&gi3c->se);
> +	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +
> +	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(gi3c->se.dev);
> +	pm_runtime_set_active(gi3c->se.dev);
> +	pm_runtime_enable(gi3c->se.dev);
> +
> +	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
> +	if (ret) {
> +		pm_runtime_disable(gi3c->se.dev);
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		pm_runtime_dont_use_autosuspend(gi3c->se.dev);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void geni_i3c_remove(struct platform_device *pdev)
> +{
> +	struct geni_i3c_dev *gi3c = platform_get_drvdata(pdev);
> +
> +	i3c_master_unregister(&gi3c->ctrlr);
> +	pm_runtime_disable(gi3c->se.dev);
> +	pm_runtime_set_suspended(gi3c->se.dev);
> +	pm_runtime_dont_use_autosuspend(gi3c->se.dev);
> +}
> +
> +static int geni_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
> +
> +	disable_irq(gi3c->irq);

why need disable irq here?

> +	geni_se_resources_off(&gi3c->se);
> +	return 0;
> +}
> +
> +static int geni_i3c_runtime_resume(struct device *dev)
> +{
> +	int ret;
> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
> +
> +	ret = geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return ret;
> +	enable_irq(gi3c->irq);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops geni_i3c_pm_ops = {
> +	SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, geni_i3c_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id geni_i3c_dt_match[] = {
> +	{ .compatible = "qcom,i3c-master" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, geni_i3c_dt_match);
> +
> +static struct platform_driver geni_i3c_master = {
> +	.probe  = geni_i3c_probe,
> +	.remove = geni_i3c_remove,
> +	.driver = {
> +		.name = "geni_i3c_master",
> +		.pm = &geni_i3c_pm_ops,
> +		.of_match_table = geni_i3c_dt_match,
> +	},
> +};
> +
> +module_platform_driver(geni_i3c_master);
> +
> +MODULE_AUTHOR("Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>");
> +MODULE_DESCRIPTION("Qualcomm I3C Controller Driver for GENI based QUP cores");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>

