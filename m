Return-Path: <linux-arm-msm+bounces-95210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGYiNqRMp2m1ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 22:03:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0AF1F718D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 22:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D889309EE35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 21:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3561239658A;
	Tue,  3 Mar 2026 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WOPmefoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0437C91D;
	Tue,  3 Mar 2026 21:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571759; cv=fail; b=XdVUXSIgxGOJ+2o8YFaF83mTWvuYCBDKbVrI/k/tYASWioFHaAdDZMDbVtKtt9dZO8jA4IudrZDbdY1DKZ8mKJOGYKKXn3WrTOfdCs9VWTtmwlLMQBlO1lQDWh6TdWd5ricVVfvZyfUNCQ2jLDes/ghee5nVODI+8Rjp7rvT5rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571759; c=relaxed/simple;
	bh=N4TxgSNEeAxJ+Hn+lrOXC42iffdTXxV8AKATvU9pH+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e6B0CGT6FvxVU2dBh114Qd2YRJU3HZRFpC5ZHoDzJc5fbpng7/x6HjJFhgAd8VtwhM+K372J18l9tmF3m0tmbWsD31+LymKcXPBmnRdjnZ+HfhKZbzDXE3wv0PwTmZVjsLuVsAi24I5g+iYp1IuSoNb0ecgiizb4fF/0LL5ZUZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WOPmefoh; arc=fail smtp.client-ip=52.101.69.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0c0XBSyLsHRJO2of9Id2jqXfmgMYtsiWmbd+b8Dh6pqwoKZntM1h6JZSIaXsTaAzxnGGmJ4u/qQwl9fqWVhniIy0I4aYnVHoRONvdJGSt3N9C4VJQwUNthDZE54I6yF7HTWp7p5N9zIGYqYZz+h1gcgeEhxYD06sni2nt2SCKOCMZUUW0pBBYDZ3lC6WJK/31H8HtBj4utboN1bpkVwMvt96kgGb8oVM50gWOqcr/noeCi7YyrPHejEgORWtX9ztvyjisodeVRml9UqwCPRiIcRa5nmR5b5ikXp9KF8glr04sK80BH7SnM3SS2GNeBhFarnfrJ9Cq4cR/VJP5QYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25PTrhWjTAhZEg63K5aZdBMhoUCXwapuX4m7iNV5lBg=;
 b=akR5geM4zhS+E8JraFd4l36OcD9GClueiEouZ7e0idS9/H9m6ch6gAB5JUyp+qgDuYUTSZOK0xtwEULEPt9Ll5KXtbWOh9mKRBC8wTVkqEITGpBuypjPQs0ncjQil5LwjTcjntsuAW+dWFPzagvbThkrrxkAHrE16vOYMLn7FQHmTZO8CRmlyr8j5/Kf5WNAlg6g+RgX5RZV/mnfSa76PzSAIM3/jvXs54Wuqu1TClsJ4//9+y+ghUG1NeiMHZQj+gRcGf9Rr1kSmaz8TzDKKfLf4yUizFPN4a7jp6W2kx1FVrey/v9ql64c3qwFFJDCILP2irs0t2FvLF1LiAAhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25PTrhWjTAhZEg63K5aZdBMhoUCXwapuX4m7iNV5lBg=;
 b=WOPmefoh+1Bt8O3Ky0leiDuDP8+L+ZXDzUih3K0cC0uTWcz+DR6I+7S0VMYi+cLouCA1VVDNgdT1s1D7bloUA6r0b0BskbZIklN5kaJmVWGuj6sMIgiza9ZGFhwS+c3rXGMCtWNdhq2sGHXBSIuaiUWov7Tenedxg+jxvESimU4sEjzJaeqeIp+AMED49gn1byIaI5+mvqOVwYcPK5UX+gG6A22B3mKvx05W57rQqJiT7K2UH554iUvqn+wiLG29e4tYAH6J6FeixGpsgZo7Eo9a8Xnv8cRIDl6153T9L/V/cJPCiKMmwNCLdVuAMfrIs/MdVyOACnM2jBO5Po+iDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	abelvesa@kernel.org,
	srini@kernel.org,
	s.nawrocki@samsung.com,
	nuno.sa@analog.com
Cc: Frank Li <frank.li@nxp.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 1/4] driver core: generalize driver_override in struct device
Date: Tue,  3 Mar 2026 16:01:05 -0500
Message-ID: <20260303210131.2966214-10-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303115720.48783-2-dakr@kernel.org>
References: <20260303115720.48783-2-dakr@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d8bd2f-64e1-4db7-b931-08de79683020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	NFd/UOQswrCvuX4yQTRAtdCkcxtR2oV6CTXtt2MEx1r3CnuW5W4zHiYEk+A9I9VN6CBl8UQO1+nM4J103h+6JkYGp2Qy2EwtqJW0Nr5oUxyajkI22k1BkyWuetDCxpjmC0wGBIxlWj4O3Mjq7OAeQhSYTNOqns7IUEZ682k3erBKM/fm6oiCZew9OsPYBCfSa1/MQD3iAYcUNc0IW6VhezKeP7g1Zf2p/QHrCEPjmM79oVjdhC6aWG7mbWLveQRZhTUeL4UGcvd6MMWiYToqpS55kcTIsQSNxCaV0Lb1sx26PQNpq3HhQMtJPRnUDHpPxEqlX5z102G0mykPJRTvhrTxw9bvf+M5EtmQdZKiIqC/3tgHj8VnWUEQ0F7XL3dLhhcOmjiYSDDa2mxdFJnIJS3QhPVK+cOTKIBrAYKg0MGi9vFjJmFLQxD1MCUkm1GNRdB2GfJi03o8xEDVIIVFFtCmbVp7mxGCrX/txJP1I25u20UJ8EV7xPVlQ5KPHpngLq4Af9lpq6QnfbkqHHfHvZK3Alii7ASVObaSt/kFMyMLrPInKFseRX9J3uLndjamQ3LhzvjoaYDIG94RA48eg2v+DWYUVp/UyvgUiAy7elm5f8UhbuvSXYMxeWsg+Pbu6qw/CBl38MFOpDRQVKlKK3zwtodf7GL6rr4s/CtFKS4dISOqO47JoAJYZZ8uXnds4aNkRVxGrvMADAtgH1uMWLt3/Yob5gTUT/CQFJcUmUSUstiPn4JW1adeK7KJwXT8hoU2iFSR0TozBErbOWQ/RhG3jsh08V3yswHz/dR7OIkvMXMyXvW3Oq4wmuZEWFYn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8tDOkyk0ztXuZ/W+Pcdr6z6Qh01EJz8QIdUqssLnBY3NEwKInBFMro9t+2lJ?=
 =?us-ascii?Q?5boWY2VauOYGYn7YOEGikabumhUgttMNtBWHQYdcSP94hh2IpgIHkeG1yom9?=
 =?us-ascii?Q?jtXck2LsbQdn/rTsBbulDj8YKjv8fkafpNSasDZWOOTx8oXfpDv9lBfl7933?=
 =?us-ascii?Q?CC5vdWeDu+wUQOeSwYZClAqUMbOY41Qr5s9YzdZ2O8QVKVKlZktru00CodVr?=
 =?us-ascii?Q?WDb1ufqNctfk+XzBdr12lgZwNSDRBL6Ws1RSFErKDrFPKUJbx1XzmNcyLvqQ?=
 =?us-ascii?Q?nkJpu0x9Cxg36CTrZV5WikILemO9AcapwNQjxgjP6b9gR9ax3oxZXPorBfhh?=
 =?us-ascii?Q?yAvFSPDOgOWMBy651IQOVN1CQgqdDbghYktf9IxyhaAKO50lXG31Q3iI690d?=
 =?us-ascii?Q?pRJ4GyPlDV3KYNRqF1aZ67qrttUTegKMHyRxMiGdQddu+ZVnNfsefAoK4cH8?=
 =?us-ascii?Q?5bh97NFsaSXv9t5FaVUrfsWLzrgXxqcpkY7DD5VIPcszA45L4EGnvFBuFXTC?=
 =?us-ascii?Q?9l0hGQLPz65n98eOJgcwfBlCp7HaSt0/Nq08M0Dnl77JgK3QCd8ZKwXovH7/?=
 =?us-ascii?Q?fJdsHJ23aW5zGs3/s3vk80rF4uMj+O0GUyJKBz6pmnYVxc/Bdxu9EFupqgSF?=
 =?us-ascii?Q?2S2idfR1khFV6f0mmGiB/g21LTuy//F4DKn0SnvuOwnGeWKBkeJdirISYAmz?=
 =?us-ascii?Q?epcwwbY1v9Zpql/WojJp+h7Bm2ChPYOs0INlqpwg5oTp4IUgHhz2QNonPv1Y?=
 =?us-ascii?Q?Ihlj9GNtjyG9fYlwDygXHCLv2vGz+gjlaBM67JB5O2nzBurTjmPTYguXe5ec?=
 =?us-ascii?Q?ypYh8xZRdcfmL9N70Gm/l4pSITP32Mm9lZ6ANeS81cpSBD/kp1tNEsjULsJc?=
 =?us-ascii?Q?eM2lIp/7vZNuBIlz/DRQ87LNZX2crWSp3igmhNeXlFimkaU2zkHHyDeAlV40?=
 =?us-ascii?Q?Jc76aOH7E5P5K87UoIVsEJnSU56ZflKMYjsWodJloEZ/XYvDMeT6wzFxJsx+?=
 =?us-ascii?Q?aCh1Qk53TjlWTgu5LG0uj3nWYLtVta7D+EZUXrbuHiRL+RSKeAKuo9hGFw4G?=
 =?us-ascii?Q?VPPd6rR9WrYl/xwbZmqeepZHmstQoBFlQEVL5Ty/fQ9EJlC12Qcg/BsQBT1k?=
 =?us-ascii?Q?bqw/Crmd6/mDIHhdPwLLvDN9/n4GePGHHOXTs30UTNoHoMhVZtt614PkGYwz?=
 =?us-ascii?Q?tgL2OayrmH54CDtcv/AtvAPBaCueX+qj52aDLiAr8q2Dcjhzn0vHJeYgDaNK?=
 =?us-ascii?Q?M21y4Gxog4MAnx+/3eWegCvUJdqLXO16J6+Pn4Qc9pdesqoKyKx7dL+vcFsf?=
 =?us-ascii?Q?rbrAHyDf63EG/9q4sXkubh64nVUezU3njGN2+J3tnoCCfGL2wM0BBrHXd5EO?=
 =?us-ascii?Q?4SWSTsiSUbUZcCaTpIzmfK+PBqnXYk2rwI6yPvwD72i9SFXcUgVMlkxcs1CT?=
 =?us-ascii?Q?XN43Dxc7cYA8vGGSfGTBmfKOvxkQBG0dTFPZ/2UGYmrbetvWUZ6itTu5y7+/?=
 =?us-ascii?Q?x7veVUDli+5nzsDXn9jUrq3GqhWSPcYS7zx7CoYKbS/FbCa+gYe/GA8BXI1n?=
 =?us-ascii?Q?+7QvzNkiYMn3Y2U/nFwmTl4PcCMmQgFRCzaAuB03ZHuCxkPAmMlEkFhz4S7N?=
 =?us-ascii?Q?y3GZgtJVh0vRISNHqHGGNVnBbOIGFlmbkfxeyT69t7RN8OSSuuxU6d8WtZTb?=
 =?us-ascii?Q?8Z9AtcIFXdH1KR4szLs+VuO5wwKp3oQjfDlXWgUBYuz0xJAu20zyhfyyz1gL?=
 =?us-ascii?Q?ksDM+XHMsQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d8bd2f-64e1-4db7-b931-08de79683020
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:32.6105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyvHvoUTOGlzgOfezEApEgARBTE1gSDg7gpbFNv0aBFouZFKwbX74DzvuuyTkPWyzblqg26m5rVPUeXEDzUuPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217
X-Rspamd-Queue-Id: 9B0AF1F718D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95210-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

> +static ssize_t driver_override_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	int ret;
> +
> +	ret = __device_set_driver_override(dev, buf, count);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}

Potential issue: if __device_set_driver_override() succeeds but
modifies state, returning 'count' may not reflect actual bytes
consumed if buf contains embedded nulls. Consider documenting
expected behavior or validating input length upfront.

> +static ssize_t driver_override_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	guard(spinlock)(&dev->driver_override.lock);
> +	return sysfs_emit(buf, "%s\n", dev->driver_override.name);
> +}

Potential NULL dereference: if dev->driver_override.name is NULL,
sysfs_emit() will print "(null)". Add explicit check or document
that NULL is acceptable output.

> +	if (sp->bus->driver_override) {
> +		error = device_add_group(dev, &driver_override_dev_group);
> +		if (error)
> +			goto out_groups;
> +	}

Error path bug: on device_add_group() failure, code jumps to
out_groups but should jump to out_override (which doesn't exist
yet). This leaks the sysfs link created below. Reorder or add
intermediate label.

> +	error = sysfs_create_link(&sp->devices_kset->kobj, &dev->kobj, dev_name(dev));
> +	if (error)
> -		goto out_groups;
> +		goto out_override;

Good: label renamed to match new cleanup order.

> +out_override:
> +	if (dev->bus->driver_override)
> +		device_remove_group(dev, &driver_override_dev_group);

Potential issue: dev->bus may be NULL or different from sp->bus at
this point. Use sp->bus for consistency with the add path above.

> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> +{
> +	const char *new, *old;
> +	char *cp;
> +
> +	if (!s)
> +		return -EINVAL;

Inconsistency: len parameter is passed but then recalculated via
strlen(s) below. If len is meant to be trusted, don't recalculate.
If not, remove the parameter or document why both exist.

> +	len = strlen(s);

This overwrites the len parameter, making the initial bounds check
at PAGE_SIZE potentially useless. Clarify intent: is len from
userspace or always recomputed?

> +	new = kstrndup(s, len, GFP_KERNEL);
> +	if (!new)
> +		return -ENOMEM;
> +
> +	spin_lock(&dev->driver_override.lock);
> +	old = dev->driver_override.name;
> +	if (cp != s) {
> +		dev->driver_override.name = new;
> +		spin_unlock(&dev->driver_override.lock);
> +	} else {
> +		/* "\n" passed - clear override */
> +		dev->driver_override.name = NULL;
> +		spin_unlock(&dev->driver_override.lock);
> +
> +		kfree(new);
> +	}
> +	kfree(old);

Logic is correct but confusing: cp is set only if '\n' is found, so
the condition `if (cp != s)` is checking "was newline NOT at start".
Add a comment explaining the two paths (newline-at-start clears,
otherwise

