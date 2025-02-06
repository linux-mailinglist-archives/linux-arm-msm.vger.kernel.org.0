Return-Path: <linux-arm-msm+bounces-47045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7241A2AE19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 17:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED11167312
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 16:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94FE235379;
	Thu,  6 Feb 2025 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="USzzln2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFDC4C8E;
	Thu,  6 Feb 2025 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860509; cv=fail; b=XOsDjEyQCj8sgDrl0qf0Whf7d9zbA2e4jbMEVyJjr2YXPa4D8bLTt7yO99EFm1cYKSggmgrGkioXPDm/ov+0cOakSaQbHwHJPQuJAlbgwJ6fpP4kgyxCQBEuBC94Mrci1nLiOjnArUMmiWOQPa8UjzLzLO7iDLQQCya/gNxUBsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860509; c=relaxed/simple;
	bh=aGx0GlsLE04m/IRv1vVBb2xC1LJoLiAWiM6ubMY/BL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=an9tDaBRH/vVaRLf4A5xBLDZEZcwJNFiq1QvEs/v+BZz/aQZbcE+fNXpmFd25N53kjOizz1uHfoYd1sQr+0F6oc6smciwBOdfcbi94ml3fJxm9tF37+EU4ZQ6FtdbhNaZodvC1hj9FmdN5EvK+rhNEBxGL8eksSOyZ5VKPhTgJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=USzzln2q; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaLmtkIfHwIG+bNccHGmq9l6nKviUUACchHCrQ8QqsJstFOCq83HNNIi5T0GzUEv7NUkZl0Ym6cUcdA2hSJziVxqnqJCI+uMrWjZWUvDRjh4JpMHZ7Nq//i91Zo9rW2yAylKVZquQnqOtLm0oMKgn/DevijGD/zLncLBqdY1Ta1NvPRGiZfjnfByHKAJ677vyFsm2QHWcHoy7/bxv2g5hf5+ZZrYROC7EdrRNcwIr0ZmsSTZpx2VHg/EtZV3BcQm6pLCcZ5A1snmV+ev8oZWLeuK77gC/Uoye11tvMwqY6GSkPwQMlrgCFvFsUSo9hPwtFQJWPNoHNjv/vtq4zqQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdm38HuWxG57i0RDBCs6eikvzWGQ8Y7UUuZCM2WM9jc=;
 b=Myojbiq+8mggjSYQd6LFsz8/35A4TH9qAir1/LVm+0rciM94SEfKG7vrrd3ZisSZouzFag0AlYvO7vvKJUFpL+XTcYgDYym9wxKC16FAtGkhqGOElG8L6tWx/kfi9VOOvPBPcZyzhEychZL0hNDkSQGYxntLjMEraen0uqvK8MLtwbqXtNboBwAEy8QPwC0QFZlcCihS8TYUBz8XKIZ4ZD1GQ2rco7jGxV/DL3yXOc/9VllouU13KbOsDKWAYGlXybfYjVB3TrcmsVFlDGNuYDRptkbfOm+Z3kNqmZA6+6i+48pmJ5zwa06sS4UNWDt95m+F7qs8dCpOyF4WtUIySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdm38HuWxG57i0RDBCs6eikvzWGQ8Y7UUuZCM2WM9jc=;
 b=USzzln2qAfxUgc6OQTwxZQ8IjCeeH1Qxh6iewgvGXXk1zb7wpEn9suqtgws+/s9LHn04jsab3IxtkvOw6IiQJXRfzWyHeoGGLruTI11POdDgWGEKq7eXcIEZ45gTR+wNS4RzHW4jROPVTakjAWPH3rMwd57G+eHOHB3kmLZzq5Ony05vKHHBE0qk/PNC1VmxKXk7dSJnVU4S87Fx1tr+ZzlbOpQgaXj37O91HiP9wLvA3/kLze9M4LGLhNUiLRoVh4rOHgBBT0SS8UOFNvEbOIClcWbdai+4UFDHunjBnSCX9+Kn1PX3x0T4RQeB5IPow3Cwb6NUuafkrDRDu+n6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10113.eurprd04.prod.outlook.com (2603:10a6:800:230::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 16:48:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 16:48:22 +0000
Date: Thu, 6 Feb 2025 11:48:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
Message-ID: <Z6Tny4zxj7JZnNOS@lizhi-Precision-Tower-5810>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
X-ClientProxiedBy: BYAPR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a28b171-d915-414c-63d9-08dd46ce0f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7RFwXJBse7kLTTM4CRw7NqIN3wdXkBehWn0ZJfwt9efz80EyH2t1i6KcNRrC?=
 =?us-ascii?Q?ce8e4NW1k7PA6crV45cgsiqrz/LUV3xxqwFQHX7gVY026gW+E7TJl3lEoyUc?=
 =?us-ascii?Q?feI/moBimxWGbo372Bxij66z/RyyQLkddp66+pBg/OTFj+eKWlTCiJ+du42o?=
 =?us-ascii?Q?ROHZQwnORvWB7OufO8HFlSRzfkipmb5fgnjHgZnCWSDX7YDhvFeAHYidFNW9?=
 =?us-ascii?Q?atqOO+wViaF5D06itBY9v6fVrDgb+8l6S4yyGzDAdMgI3+GCnre/vBUO7reS?=
 =?us-ascii?Q?+kvhtMNJkubYYz2P/BT9VBINgJqgGmi8LWLAHxaCJiNAj3/r1qMjjfI1H6qH?=
 =?us-ascii?Q?ljRCgXkYVxVNbe0CN65S+gIH/51KlBO+FfWqHfRqjuQCSjaksnmXvywkhWgz?=
 =?us-ascii?Q?R4NVkbcEfzf2tosdeZPtLqS6ZJIiVpr3lB1co0P/qQ1DcqPLCUW1zjJGwOQV?=
 =?us-ascii?Q?nUBXF0Lb0HIV9/HOFs8fej1hOvwXdUiZEJSBp/bEunpIDtWzyPzRXaAZmrQO?=
 =?us-ascii?Q?/4Hx0XHes0EjTBeM8zODCyKFvCQ2kvm/GhrTzlsnwVECyPE3+W8OQU5DFz1M?=
 =?us-ascii?Q?Qx3hx1+7eOvLPi/frFLHibDskj/ae8ORK8a0qzyTfo0O3buk0+4L7HZxnf3y?=
 =?us-ascii?Q?r74EWgizGXCVLe91m3KZhLwLVdLjNV9JocRUcglkQDGx80yGzt+7BPYgoXwS?=
 =?us-ascii?Q?NAbdfdJinK4kzxhQVk0sIp1ogT3Lk9+oeiUU2EeC36aUiyIMl+V6ynKdGntQ?=
 =?us-ascii?Q?kNZ3Rfv6vT3ODFVHicrihltcAadO6uFiIKNM5aSSBJDpPUaDjQ5DH6I4aWo+?=
 =?us-ascii?Q?TLcxIInaOc6E0+Y1usJEH/uyAvv40vRXgmUCuwlbJCgZLOw8EEBU1xvL4d36?=
 =?us-ascii?Q?S072UjqkZvWwqUlv6UzYX5/CDI7aXIxv/v3oDSh15MSIaxQNTDhG6jABlm4X?=
 =?us-ascii?Q?rWDY6mg4q0ZzlduWzyVTxc8mYnBkm+SyNLDy2J/0tWank2bvCKk2bMLNpdZh?=
 =?us-ascii?Q?NDAAMdHVV7WjYofSSjJeO1LgLz7Lfth8UDrLdkhvi4dfDBgekeeJOeSLkzHC?=
 =?us-ascii?Q?Nhy+kDds0sHk3xTtsTEPCwA+38V7XBMOLi/76Q7IXkzxpbOONWscji9BRwRv?=
 =?us-ascii?Q?2/6Dq4rnlWyviCNrz8WJToVZhUgcmM9S8IQ5cOO+twJBDng18u+tdVE4HNNG?=
 =?us-ascii?Q?UI68JNVExntDUuKFSeXbScXMlCUA5Oww7dZucKLE/cM0M7Lphb50oatqYy3H?=
 =?us-ascii?Q?C/56+MFSzllXkqg00TsGaOImmTY+XYn0/H4Aws37hxetoMSDHfXkCJvSY+zg?=
 =?us-ascii?Q?4HX2SWQWIJP4VWRc5FjuzmhMcQ+4PsoE9WFgVMfIUbVgLAUVN8OP3c+D8ZvE?=
 =?us-ascii?Q?KCmWgTPLzqW6RyjpmZZ0KpcDJVeT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?71c8daOteQLrR4dbr+hq0OrB+IAYG/EL3WqxcRIo3gtNK1oMp9xSG0QuBw/k?=
 =?us-ascii?Q?51k7/VtXVmzYBDKg35dmS5IHhiGzBxjHaiMp9Qz1Q4/LohbX1FjCQ/C8L3QY?=
 =?us-ascii?Q?/MIjS0K2BAhxXrQaY23SrOUsLKNfjEQaHynI+J4GwtTCmsvW5/FsbjCyv+f4?=
 =?us-ascii?Q?ntDlzYng8fdmhyM4p2oXNDcKu5XJN+5Oh/g64ldIL2jcyZHJztIjNneeSyL0?=
 =?us-ascii?Q?g0ZX3ffmF7J/+Ar9qfOdGn2ZdgtQVqhrTE0I/jJfUnarGUXAozZY/S98X/6c?=
 =?us-ascii?Q?b1XT249gRxtx2eRfaT7m/Zc9PjpARgc77EdemP0hmhPdhb6Bky+MjyTAenre?=
 =?us-ascii?Q?0Fy0rF5rw+PQWXtSlxwITpeMMQEbzS005AyrLNlAWmyUm4pTUwlpCRtkUuME?=
 =?us-ascii?Q?YwK60SS9s2PMfZtqx0UjxZCAEll67rtu3kCFBlyGwYW2UgPBQuRVmwS5MyPd?=
 =?us-ascii?Q?ZZInYQks1zgD5cXgz9tMGPY0WSzbg5lMmUhFbRAop81xtcT6PXFmZ0yu8YNU?=
 =?us-ascii?Q?7NfDWDpP9+a5RJYYZ55rpdcDhcxAJqigYFv7Cw3BDo5mn0LKk9X/aVc1ZCUG?=
 =?us-ascii?Q?u2Mv+B+iX+pPbBTJ+IAJmRN/nba+sAjITemz2SRjZIc44cjzy18YrIE5Ldi2?=
 =?us-ascii?Q?XW0/PYSbdx1tRrZF8LMZTZ2lFoIYO19J5pvVCl5STreoFK/6QjRNRcnK+3V7?=
 =?us-ascii?Q?c4yMcgyLkTInIuZoLVyIqJTpCmrbiFECwYq/lSGvFpjr+aRvMrsrpji7F3v9?=
 =?us-ascii?Q?MIIsw2vA3B6s00mWfzGyE7MPhRPjn/QcTOWtlNSCRGOcUc8BW3F3Y6nbHZL4?=
 =?us-ascii?Q?o/Y+ZKTFNEXQZsvQsHZ5MQ3NamJ4g34K16QMGN2r60sCRXe+x/vw1SAsVkac?=
 =?us-ascii?Q?lF6SbWyNdfDO9BWKi8+XXVflDjCjYJjetDtLGVeIiJCkqV4BkPiLa7K1CoUX?=
 =?us-ascii?Q?RrPpvmHnNatulbr2G7kFiaZRfbGS8gzIGKLsXBx4wXbyxoz1J4qPuudkg0th?=
 =?us-ascii?Q?yd9TdcJAxReE0agS+gyvXhh0IOIIjDfnExez/miOEnA8KiXrAL1duVTnF3k+?=
 =?us-ascii?Q?5M72ObxwzUSTcRaUFpmF5OUNq59gE3Kv+84u70ylazJJOyYjyV/8wYcxVgsI?=
 =?us-ascii?Q?G1kngvNwO5ANRLlXcmPvLuOlatiHdiUZEVnM8hbl3VyPtkMydsOcHJqvX6zm?=
 =?us-ascii?Q?PJa860NKWtX92ZasE/vXJ4SRuxLsGKCcqEIf6MkG/WfSjdF7YrX4Lac63XMJ?=
 =?us-ascii?Q?26UyLnUuE6jlvFat1s41cislYt/ebMwNYeJWPkyPk7yO74eZuu2iBrGHsXtw?=
 =?us-ascii?Q?o+4pzNi5Uy2s5O4TtdWQBNqK/VRlYjXdpT1285RKgGz57eWEJmpjrNweqAVL?=
 =?us-ascii?Q?TvK2bpIMA0UzYjnW3p4dsajtCDgxOZf10BHYhOUHeoBdQScCLdbmHAIW+kNM?=
 =?us-ascii?Q?OKBKYG5+j72zxJThWhpyXk7ipf9+1gOoR+IYP2r1xKXBiNlUkJub3XCEAf4f?=
 =?us-ascii?Q?DN4xAHnsmYu1rOE15hwa2XnSuas2nytlZks2wAd0l8z0zR9LcvnSDPkNIM2A?=
 =?us-ascii?Q?N9XM+qrpvv+a6ZgrNXVQ+oLOftquOzprnmuVBnHN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a28b171-d915-414c-63d9-08dd46ce0f12
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:48:21.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dW5cu4zZF/mGh/UocUY4YG5J7oY6IqBT7yztBXJWw/wPCZyi+CaIHV8yvdHlgVzb3/sQDicCVFDHbFN/wt59eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10113

On Wed, Feb 05, 2025 at 08:01:08PM +0530, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C master controller, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0. The driver supports the master role in SDR mode
> only. Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.
>
> Key features of the Qualcomm I3C master controller driver:
> - Supports I3C master functionality in SDR mode in PIO mode.
> - Does not support IBI and Hot-join requests.
> - Compatible with the MIPI I3C v1.0 specification @
>   https://www.mipi.org/mipi-i3c-basic-download-1.0
>
> This addition enhances the I3C subsystem by providing support for
> Qualcomm's hardware supported I3C master controller.
>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/i3c/master/Kconfig           |   12 +
>  drivers/i3c/master/Makefile          |    1 +
>  drivers/i3c/master/qcom-i3c-master.c | 1190 ++++++++++++++++++++++++++
>  3 files changed, 1203 insertions(+)
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
> index 000000000000..40566e388386
> --- /dev/null
> +++ b/drivers/i3c/master/qcom-i3c-master.c
> @@ -0,0 +1,1190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> +
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
> +#define SE_GENI_HW_IRQ_EN               0x920
> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
> +
> +/* SE_GENI_M_CLK_CFG field shifts */
> +#define CLK_DEV_VALUE_SHFT 4
> +#define SER_CLK_EN_SHFT 0
> +
> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field shifts */
> +#define M_IBI_IRQ_PARAM_7E_SHFT 0
> +#define M_IBI_IRQ_PARAM_STOP_STALL_SHFT 1
> +
> +/* SE_I2C_SCL_COUNTERS field shifts */
> +#define I2C_SCL_HIGH_COUNTER_SHFT  20
> +#define I2C_SCL_LOW_COUNTER_SHFT   10
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
> +#define SLV_ADDR_MSK           GENMASK(15, 9)
> +#define SLV_ADDR_SHFT          9
> +#define CCC_HDR_CMD_MSK        GENMASK(23, 16)
> +#define CCC_HDR_CMD_SHFT       16
> +#define IBI_NACK_TBL_CTRL      BIT(24)
> +#define USE_7E                 BIT(25)
> +#define BYPASS_ADDR_PHASE      BIT(26)
> +
> +/* GSI callback error fields */
> +#define GP_IRQ0	0
> +#define GP_IRQ1	1
> +#define GP_IRQ2	2
> +#define GP_IRQ3	3
> +#define GP_IRQ4	4
> +#define GP_IRQ5	5
> +#define DM_I3C_CB_ERR   ((BIT(GP_IRQ0) | BIT(GP_IRQ1) | BIT(GP_IRQ2) | \
> +			  BIT(GP_IRQ3) | BIT(GP_IRQ4) | BIT(GP_IRQ5)) << 5)
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
> +enum i3c_trans_dir {
> +	WRITE_TRANSACTION = 0,
> +	READ_TRANSACTION = 1
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
> +	/* Used inside get_mutex_lock()/unlock() - To manage per device CCC/tranxfer */
> +	struct mutex lock;
> +	/* Per device protection between process and IRQ context */
> +	spinlock_t spinlock;
> +	u32 clk_src_freq;
> +	u32 dfs_idx;
> +	u8 *cur_buf;
> +	enum i3c_trans_dir cur_rnw;
> +	int cur_len;
> +	int cur_idx;
> +	unsigned long newaddrslots[(I3C_ADDR_MASK + 1) / BITS_PER_LONG];
> +	const struct geni_i3c_clk_fld *clk_fld;
> +	const struct geni_i3c_clk_fld *clk_od_fld;
> +};
> +
> +struct geni_i3c_i2c_dev_data {
> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */
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
> +struct geni_i3c_err_log {
> +	int err;
> +	const char *msg;
> +};
> +
> +static struct geni_i3c_err_log gi3c_log[] = {
> +	[RD_TERM] = { -EINVAL, "I3C slave early read termination" },
> +	[NACK] = { -ENOTCONN, "NACK: slave unresponsive, check power/reset" },
> +	[CRC_ERR] = { -EINVAL, "CRC or parity error" },
> +	[BUS_PROTO] = { -EPROTO, "Bus proto Error, noisy/unexpected start/stop" },
> +	[NACK_7E] = { -EBUSY, "NACK on 7E, unexpected protocol error" },
> +	[NACK_IBI] = { -EINVAL, "NACK on IBI" },
> +	[GENI_OVERRUN] = { -EIO, "Cmd overrun, check GENI cmd-state machine" },
> +	[GENI_ILLEGAL_CMD] = { -EILSEQ,
> +				"Illegal cmd, check GENI cmd-state machine" },
> +	[GENI_ABORT_DONE] = { -ETIMEDOUT, "Abort after timeout successful" },
> +	[GENI_TIMEOUT] = { -ETIMEDOUT, "I3C transaction timed out" },
> +};
> +
> +struct geni_i3c_clk_fld {
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
> +static const struct geni_i3c_clk_fld geni_i3c_clk_map[] = {
> +/* op-freq,  src-freq,  div,  i2c_high,  i2c_low, i3c_high, i3c_cyc i2c_cyc */
> +	{ KHZ(100),    19200, 1, 76, 90, 7, 8, 192},
> +	{ KHZ(400),    19200, 1, 12, 24, 7, 8, 48},
> +	{ KHZ(1000),   19200, 1,  4,  9, 7, 0, 19},
> +	{ KHZ(12500), 100000, 1, 45, 63, 6, 7, 110},
> +};
> +
> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
> +{
> +	const struct geni_i3c_clk_fld *itr = geni_i3c_clk_map;
> +	struct i3c_master_controller *m = &gi3c->ctrlr;
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, itr++) {
> +		dev_dbg(gi3c->se.dev, "%s:iter:%d, scl_rate:%ld, clk_src_freq:%d\n",
> +			__func__, i, gi3c->ctrlr.bus.scl_rate.i3c, gi3c->clk_src_freq);
> +
> +		if ((!bus || itr->clk_freq_out == bus->scl_rate.i3c) &&
> +		    KHZ(itr->clk_src_freq) == gi3c->clk_src_freq) {
> +			gi3c->clk_fld = itr;
> +		}
> +
> +		if (itr->clk_freq_out == bus->scl_rate.i2c)
> +			gi3c->clk_od_fld = itr;
> +	}
> +
> +	if (!gi3c->clk_fld || !gi3c->clk_od_fld) {
> +		dev_err(gi3c->se.dev, "%s : clk mapping failed", __func__);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void set_new_addr_slot(unsigned long *addrslot, u8 addr)
> +{
> +	unsigned long *ptr;
> +
> +	if (addr > I3C_ADDR_MASK)
> +		return;
> +
> +	ptr = addrslot + (addr / BITS_PER_LONG);
> +	*ptr |= 1 << (addr % BITS_PER_LONG);
> +}
> +
> +static void clear_new_addr_slot(unsigned long *addrslot, u8 addr)
> +{
> +	unsigned long *ptr;
> +
> +	if (addr > I3C_ADDR_MASK)
> +		return;
> +
> +	ptr = addrslot + (addr / BITS_PER_LONG);
> +	*ptr &= ~(1 << (addr % BITS_PER_LONG));
> +}
> +
> +static bool is_new_addr_slot_set(unsigned long *addrslot, u8 addr)
> +{
> +	unsigned long *ptr;
> +
> +	if (addr > I3C_ADDR_MASK)
> +		return false;
> +
> +	ptr = addrslot + (addr / BITS_PER_LONG);
> +	return ((*ptr & (1 << (addr % BITS_PER_LONG))) != 0);
> +}
> +
> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum i3c_bus_phase bus_phase)
> +{
> +	const struct geni_i3c_clk_fld *itr = gi3c->clk_fld;
> +	unsigned long freq;
> +	int ret = 0;
> +	u32 val;
> +
> +	if (bus_phase == OPEN_DRAIN_MODE)
> +		itr = gi3c->clk_od_fld;
> +
> +	ret = geni_se_clk_freq_match(&gi3c->se, KHZ(itr->clk_src_freq),
> +				     &gi3c->dfs_idx, &freq, false);
> +	if (ret)
> +		gi3c->dfs_idx = 0;
> +
> +	writel_relaxed(gi3c->dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
> +
> +	val = itr->clk_div << CLK_DEV_VALUE_SHFT;
> +	val |= 1 << SER_CLK_EN_SHFT;
> +	writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
> +
> +	val = itr->i2c_t_high_cnt << I2C_SCL_HIGH_COUNTER_SHFT;
> +	val |= itr->i2c_t_low_cnt << I2C_SCL_LOW_COUNTER_SHFT;
> +	val |= itr->i2c_t_cycle_cnt;
> +	writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
> +
> +	writel_relaxed(itr->i3c_t_cycle_cnt, gi3c->se.base + SE_I3C_SCL_CYCLE);
> +	writel_relaxed(itr->i3c_t_high_cnt, gi3c->se.base + SE_I3C_SCL_HIGH);
> +
> +	writel_relaxed(1, gi3c->se.base + SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
> +
> +	val = 1 << M_IBI_IRQ_PARAM_STOP_STALL_SHFT;
> +	val |= 1 << M_IBI_IRQ_PARAM_7E_SHFT;
> +	writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
> +
> +	writel_relaxed(1, gi3c->se.base + SE_GENI_HW_IRQ_EN);
> +}
> +
> +static void geni_i3c_err(struct geni_i3c_dev *gi3c, int err)
> +{
> +	if (gi3c->cur_rnw == WRITE_TRANSACTION)
> +		dev_dbg(gi3c->se.dev, "len:%d, write\n", gi3c->cur_len);
> +	else
> +		dev_dbg(gi3c->se.dev, "len:%d, read\n", gi3c->cur_len);
> +
> +	dev_dbg(gi3c->se.dev, "%s\n", gi3c_log[err].msg);
> +	gi3c->err = gi3c_log[err].err;
> +}
> +
> +static void geni_i3c_handle_err(struct geni_i3c_dev *gi3c, u32 status)
> +{
> +	if (status & M_GP_IRQ_0_EN)
> +		geni_i3c_err(gi3c, RD_TERM);
> +	if (status & M_GP_IRQ_1_EN)
> +		geni_i3c_err(gi3c, NACK);
> +	if (status & M_GP_IRQ_2_EN)
> +		geni_i3c_err(gi3c, CRC_ERR);
> +	if (status & M_GP_IRQ_3_EN)
> +		geni_i3c_err(gi3c, BUS_PROTO);
> +	if (status & M_GP_IRQ_4_EN)
> +		geni_i3c_err(gi3c, NACK_7E);
> +	if (status & M_GP_IRQ_5_EN)
> +		geni_i3c_err(gi3c, NACK_IBI);
> +	if (status & M_CMD_OVERRUN_EN)
> +		geni_i3c_err(gi3c, GENI_OVERRUN);
> +	if (status & M_ILLEGAL_CMD_EN)
> +		geni_i3c_err(gi3c, GENI_ILLEGAL_CMD);
> +	if (status & M_CMD_ABORT_EN)
> +		geni_i3c_err(gi3c, GENI_ABORT_DONE);
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
> +	spin_lock_irqsave(&gi3c->spinlock, flags);
> +
> +	if ((m_stat & SE_I3C_ERR) || (dm_rx_st & DM_I3C_CB_ERR)) {
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
> +		gi3c->cur_rnw == READ_TRANSACTION && gi3c->cur_buf) {
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
> +	} else if ((m_stat & M_TX_FIFO_WATERMARK_EN) &&
> +		(gi3c->cur_rnw == WRITE_TRANSACTION) && (gi3c->cur_buf)) {
> +		for (j = 0; j < gi3c->tx_wm;/spinlock, j++) {
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
> +	} else if ((dm_tx_st & TX_DMA_DONE) || (dm_rx_st & RX_DMA_DONE)	||
> +		(dm_rx_st & RX_RESET_DONE)) {
> +		complete(&gi3c->done);
> +	}
> +
> +	spin_unlock_irqrestore(&gi3c->spinlock, flags);
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
> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct geni_i3c_xfer_params *xfer)
> +{
> +	enum i3c_trans_dir rnw = gi3c->cur_rnw;
> +	dma_addr_t tx_dma = 0, rx_dma = 0;
> +	int ret, time_remaining = 0;
> +	u32 len = gi3c->cur_len;
> +
> +	geni_se_select_mode(&gi3c->se, xfer->mode);
> +
> +	gi3c->err = 0;
> +	gi3c->cur_idx = 0;
> +
> +	if (rnw == READ_TRANSACTION) {
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

if xfer->mode != GENI_SE_DMA, what's happen?

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
> +		dev_dbg(gi3c->se.dev, "%s:Timeout completing FIFO transfer\n", __func__);
> +		spin_lock_irqsave(&gi3c->spinlock, flags);
> +		geni_i3c_err(gi3c, GENI_TIMEOUT);
> +		gi3c->cur_buf = NULL;
> +		gi3c->cur_len = 0;
> +		gi3c->cur_idx = 0;
> +		gi3c->cur_rnw = 0;
> +		geni_se_abort_m_cmd(&gi3c->se);
> +		spin_unlock_irqrestore(&gi3c->spinlock, flags);
> +		time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +		dev_dbg(gi3c->se.dev, "%s:Timeout with abort command\n", __func__);
> +	}
> +
> +	if (xfer->mode == GENI_SE_DMA) {
> +		if (gi3c->err) {
> +			if (rnw == READ_TRANSACTION)
> +				writel_relaxed(1, gi3c->se.base + SE_DMA_TX_FSM_RST);
> +			else
> +				writel_relaxed(1, gi3c->se.base + SE_DMA_RX_FSM_RST);
> +
> +			time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
> +			dev_dbg(gi3c->se.dev, "%s:Timeout completing DMA transfer\n", __func__);
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
> +	gi3c->cur_len = 0;
> +	gi3c->cur_idx = 0;
> +	gi3c->cur_rnw = 0;
> +	gi3c->err = 0;
> +
> +	return ret;
> +}
> +
> +static int i3c_geni_execute_read_command(struct geni_i3c_dev *gi3c,
> +					 struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
> +{
> +	gi3c->cur_rnw = READ_TRANSACTION;
> +	gi3c->cur_buf = buf;
> +	gi3c->cur_len = len;
> +	return _i3c_geni_execute_command(gi3c, xfer);
> +}
> +
> +static int i3c_geni_execute_write_command(struct geni_i3c_dev *gi3c,
> +					  struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
> +{
> +	gi3c->cur_rnw = WRITE_TRANSACTION;
> +	gi3c->cur_buf = buf;
> +	gi3c->cur_len = len;
> +	return _i3c_geni_execute_command(gi3c, xfer);
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
> +		dev_dbg(gi3c->se.dev, "i3c entdaa read\n");
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
> +		dev_dbg(gi3c->se.dev, "pid:%llu, bcr:%x, dcr:%x\n", pid, bcr, dcr);
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
> +				goto daa_err;
> +			addr = (u8)ret;
> +			last_dyn_addr = (u8)ret;
> +			set_new_addr_slot(gi3c->newaddrslots, addr);
> +		}
> +
> +		tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
> +		tx_buf[0] |= ~(hweight8(addr & I3C_ADDR_MASK) & 1);
> +
> +		dev_dbg(gi3c->se.dev, "i3c entdaa write\n");
> +
> +		xfer.m_cmd = I2C_WRITE;
> +		xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
> +
> +		ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
> +		if (ret)
> +			break;
> +	}
> +daa_err:
> +	return;
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
> +			xfer.m_param |= ((cmd->dests[i].addr & I3C_ADDR_MASK)
> +					<< SLV_ADDR_SHFT);
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
> +	dev_dbg(gi3c->se.dev, "i3c ccc: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +	return ret;
> +}
> +
> +static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> +				      int nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	bool use_7e = true;
> +	int i, ret;
> +
> +	if (nxfers <= 0)
> +		return 0;
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
> +		xfer.m_param |= ((dev->info.dyn_addr & I3C_ADDR_MASK) << SLV_ADDR_SHFT);
> +		xfer.m_param |= (use_7e) ? USE_7E : 0;
> +
> +		/* Update use_7e status for next loop iteration */
> +		use_7e = !stall;
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
> +	dev_dbg(gi3c->se.dev, "i2c xfer:num:%d, msgs:len:%d,flg:%d\n",
> +		num, msgs[0].len, msgs[0].flags);
> +
> +	for (i = 0; i < num; i++) {
> +		struct geni_i3c_xfer_params xfer;
> +
> +		xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : I2C_WRITE;
> +		xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
> +		xfer.m_param |= ((msgs[i].addr & I3C_ADDR_MASK) << SLV_ADDR_SHFT);
> +		xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		else
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		if (ret)
> +			break;

If schedule happen here, it will take more than 100us, target side will
be timeout.

> +	}
> +
> +	dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +	return ret;
> +}
> +
> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = devm_kzalloc(gi3c->se.dev, sizeof(*data), GFP_KERNEL);
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
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = devm_kzalloc(gi3c->se.dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i3c_dev_set_master_data(dev, data);
> +	return 0;
> +}
> +
> +static int geni_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
> +{
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
> +static int geni_i3c_master_entdaa_locked(struct geni_i3c_dev *gi3c)
> +{
> +	struct i3c_master_controller *m = &gi3c->ctrlr;
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
> +static int geni_i3c_master_do_daa(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +
> +	return geni_i3c_master_entdaa_locked(gi3c);
> +}
> +
> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(gi3c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi3c->se.dev, "%s: error turning SE resources:%d\n", __func__, ret);
> +		pm_runtime_put_noidle(gi3c->se.dev);
> +		/* Set device in suspended since resume failed */
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		return ret;
> +	}
> +
> +	ret = geni_i3c_clk_map_idx(gi3c);
> +	if (ret) {
> +		dev_err(gi3c->se.dev,
> +			"Invalid clk frequency %d Hz src or %ld Hz bus: %d\n",
> +			gi3c->clk_src_freq, bus->scl_rate.i3c,
> +			ret);
> +		goto err_cleanup;
> +	}
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +
> +	/* Get an address for the master. */
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0) {
> +		dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", __func__, ret);
> +		goto err_cleanup;
> +	}
> +
> +	info.dyn_addr = ret;
> +	info.dcr = I3C_DCR_GENERIC_DEVICE;
> +	info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
> +	info.pid = 0;
> +
> +	ret = i3c_master_set_info(&gi3c->ctrlr, &info);
> +err_cleanup:
> +	pm_runtime_mark_last_busy(gi3c->se.dev);
> +	pm_runtime_put_autosuspend(gi3c->se.dev);
> +	return ret;
> +}
> +
> +static bool geni_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> +					     const struct i3c_ccc_cmd *cmd)
> +{
> +	switch (cmd->id) {
> +	case I3C_CCC_ENEC(true):
> +	fallthrough;

I remember needn't fallthrough if no code after :

> +	case I3C_CCC_ENEC(false):
> +	fallthrough;
> +	case I3C_CCC_DISEC(true):
> +	fallthrough;
> +	case I3C_CCC_DISEC(false):
> +	fallthrough;
> +	case I3C_CCC_ENTAS(0, true):
> +	fallthrough;
> +	case I3C_CCC_ENTAS(0, false):
> +	fallthrough;
> +	case I3C_CCC_RSTDAA(true):
> +	fallthrough;
> +	case I3C_CCC_RSTDAA(false):
> +	fallthrough;
> +	case I3C_CCC_ENTDAA:
> +	fallthrough;
> +	case I3C_CCC_SETMWL(true):
> +	fallthrough;
> +	case I3C_CCC_SETMWL(false):
> +	fallthrough;
> +	case I3C_CCC_SETMRL(true):
> +	fallthrough;
> +	case I3C_CCC_SETMRL(false):
> +	fallthrough;
> +	case I3C_CCC_DEFSLVS:
> +	fallthrough;
> +	case I3C_CCC_ENTHDR(0):
> +	fallthrough;
> +	case I3C_CCC_SETDASA:
> +	fallthrough;
> +	case I3C_CCC_SETNEWDA:
> +	fallthrough;
> +	case I3C_CCC_GETMWL:
> +	fallthrough;
> +	case I3C_CCC_GETMRL:
> +	fallthrough;
> +	case I3C_CCC_GETPID:
> +	fallthrough;
> +	case I3C_CCC_GETBCR:
> +	fallthrough;
> +	case I3C_CCC_GETDCR:
> +	fallthrough;
> +	case I3C_CCC_GETSTATUS:
> +	fallthrough;
> +	case I3C_CCC_GETACCMST:
> +	fallthrough;
> +	case I3C_CCC_GETMXDS:
> +	fallthrough;
> +	case I3C_CCC_GETHDRCAP:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> +}
> +
> +static const struct i3c_master_controller_ops geni_i3c_master_ops = {
> +	.bus_init = geni_i3c_master_bus_init,
> +	.bus_cleanup = NULL,
> +	.do_daa = geni_i3c_master_do_daa,
> +	.attach_i3c_dev = geni_i3c_master_attach_i3c_dev,
> +	.reattach_i3c_dev = geni_i3c_master_reattach_i3c_dev,
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
> +static int i3c_geni_rsrcs_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
> +{
> +	int ret;
> +	struct resource *res;
> +
> +	/* Base register address */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Error getting IO region\n");
> +		return -EINVAL;
> +	}
> +
> +	gi3c->se.base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(gi3c->se.base))
> +		return PTR_ERR(gi3c->se.base);
> +
> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");

Generally, needn't '-clk', just 'se' should be enough, change binding doc
also.

> +	if (IS_ERR(gi3c->se.clk)) {
> +		ret = PTR_ERR(gi3c->se.clk);
> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
> +	if (ret) {
> +		dev_info(&pdev->dev, "SE clk freq not specified, default to 100 MHz.\n");
> +		gi3c->clk_src_freq = 100000000;
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
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: icc set bw failed ret:%d\n", __func__, ret);
> +		return ret;
> +	}
> +	dev_dbg(&pdev->dev, "%s: GENI_TO_CORE:%d CPU_TO_GENI:%d\n", __func__,
> +		gi3c->se.icc_paths[GENI_TO_CORE].avg_bw, gi3c->se.icc_paths[CPU_TO_GENI].avg_bw);
> +
> +	ret = device_property_read_u32(&pdev->dev, "dfs-index", &gi3c->dfs_idx);
> +	if (ret)
> +		gi3c->dfs_idx = 0xf;
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
> +	ret = i3c_geni_rsrcs_init(gi3c, pdev);
> +	if (ret) {
> +		dev_info(&pdev->dev, "Error:%d i3c_geni_rsrcs_init\n", ret);
> +		return ret;

return dev_err_probe()

> +	}
> +
> +	gi3c->irq = platform_get_irq(pdev, 0);
> +	if (gi3c->irq < 0) {
> +		dev_err(&pdev->dev, "Error=%d getting IRQ for i3c-master-geni\n", ret);
> +		return gi3c->irq;
> +	}
> +
> +	init_completion(&gi3c->done);
> +	mutex_init(&gi3c->lock);
> +	spin_lock_init(&gi3c->spinlock);
> +	platform_set_drvdata(pdev, gi3c);
> +
> +	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
> +			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Request_irq failed:%d: Error:%d\n",
> +			gi3c->irq, ret);
> +		return ret;
> +	}
> +
> +	ret = geni_se_resources_on(&gi3c->se);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
> +		return ret;
> +	}
> +
> +	proto = geni_se_read_proto(&gi3c->se);
> +	if (proto != GENI_SE_I3C) {
> +		dev_err(&pdev->dev, "Invalid proto %d\n", proto);
> +		geni_se_resources_off(&gi3c->se);
> +		return -ENXIO;
> +	}
> +
> +	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
> +	if (fifo_disable) {
> +		dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
> +		geni_se_resources_off(&gi3c->se);
> +		return -ENXIO;
> +	}
> +
> +	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
> +	gi3c->tx_wm = tx_depth - 1;
> +	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
> +	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PW, true, true, true);
> +	geni_se_resources_off(&gi3c->se);
> +	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +
> +	pm_runtime_set_suspended(gi3c->se.dev);
> +	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(gi3c->se.dev);
> +	pm_runtime_enable(gi3c->se.dev);
> +
> +	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&pdev->dev, "Geni I3C probed\n");
> +	return ret;
> +}
> +
> +static void geni_i3c_remove(struct platform_device *pdev)
> +{
> +	struct geni_i3c_dev *gi3c = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(gi3c->se.dev);
> +	i3c_master_unregister(&gi3c->ctrlr);
> +}
> +
> +#ifdef CONFIG_PM
> +static int geni_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
> +
> +	disable_irq(gi3c->irq);
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
> +#else
> +static int geni_i3c_runtime_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int geni_i3c_runtime_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops geni_i3c_pm_ops = {
> +SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, geni_i3c_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id geni_i3c_dt_match[] = {
> +	{ .compatible = "qcom,geni-i3c" },
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
> +MODULE_ALIAS("platform:geni_i3c_master");
> --
> 2.25.1
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

