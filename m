Return-Path: <linux-arm-msm+bounces-99883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHQTLtngw2kgugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:19:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C2325967
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080D03108D49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D85D3D1CA0;
	Wed, 25 Mar 2026 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JibfUA4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E83CF022;
	Wed, 25 Mar 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441778; cv=fail; b=i5LeiG4MLaaEzpm6UBYKQAq/CmARdKZa7/TVhJsPGObTKmr7XCtG2+PefhAVkwmcSFHO928UojMetAoDH4Z1PE7aRwmRUloj83fNAJhfByCLnjF85zexBAGaRcq6apMGCNoTpvt1btetnGQVWwlPxe4xQVRzIpCssZeuIyVdfrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441778; c=relaxed/simple;
	bh=qnvw8i3oezTbgABt8lwlgiqtSQmR8ol0yyLktv8qx7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gub6YNrkd48zCNKs/oIpWnWXyZh4F/McIrW9Ae31BzhXyeNUARg6bLx39RKD7L/9IR7LfQUh7xt6U2GpnMfNJDUafpyvzzD4GorWS+lA5ZeLik+pWnaru9l1HOp0TwTTDn5ZY3ikSwT4XrWVM3lII7lmXWp+At6pczqr5BDPLLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JibfUA4s; arc=fail smtp.client-ip=52.101.65.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEG4fwgS8qh5lFnku+mrpCGI+8s3828obDeBmJ9gNjTEkAVdf4Qtfm3b/ZBH+9bBCFTNAibP0sNonKfQfcgSwRA6auLGRx1IHJQhVxkrropV/p/zXlqxvBsSdKI05UHnmHN7oeb47fLEKneZU+PS+MJEBwoPpBZU+PLpxRVGXOCbwkqjLwoXtErqhDb6RVr9bGMpVs4Xjbdtfo516JaWMR3Ob6JdX5/mZjpY32BF+08+oPZo2XPfhOMgYUcS3Rem5l3LPSWWzum5AbwhefgKjPjfeczca/DoyKiHZWcDrkg+jQZKSAz6t4oW2qYRjoV5jpuJI8WUvfYbNvtDuXQthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnvw8i3oezTbgABt8lwlgiqtSQmR8ol0yyLktv8qx7A=;
 b=Bw3kHiL5O6Qa1+l0FEro5ZeSfQFTvNsHUmevTWRMGQfxgKDp0QCsLZG71hlcsnkyjrjO7lLHQtFiIYL+A59/S0rGw1031FI9f42g8lrl9z9GsSKKL/RC8DotPzeQFnzZFAlBh6NLDELpB6nR4y9ZMjyhOcBaLzlgB3iGGo6B2y9NMtpBEalgaZfyUwBxPXVUpYa9+EKD7EcK+9hW6QCC0vg/YT1vvWepAUBFZayJVmGF8O6xh0jy4Y5p2UPgQJgEjCUTPYLIcr3G4FLrhkNlkdWnZmHhR6cQEamxhkKH/JRIuZ35k6vGc04nw18e/mdRRmmO0hSWh7NI24UCx9MM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnvw8i3oezTbgABt8lwlgiqtSQmR8ol0yyLktv8qx7A=;
 b=JibfUA4syZKR6JOdlXXNEH9QWtI/tKLLhkmDzaTRi3U0r8kjMnPsOTqFsdS0lc4RrAyCeeK0H98eB96Dv7t1xenkLnphngK/CH8iDND4LsiZf3fOl+P62E0As2FoS8x+Q1JhDuDVcfwR9fb0kFuFt8oPJu7IF9F/EJ/xlhtFb2TMpW/i5Sg1Y17YhT9GKNCTyi8oxhrn++VJFPdHhrDcw0WBpGlYaahWS0Q1W7Q628SQprL2eUX8FBbVbRWq2aKpnHUL93qGsmtrfOjxh4bg5VWZ3MfZsvCUCMZ6HbLpiUPYc8fWaNB+Ve+NhddwTLOKfa8OowdAVkjq0OVgKNwaEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DU4PR04MB12027.eurprd04.prod.outlook.com (2603:10a6:10:63e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 12:29:34 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 12:29:34 +0000
Date: Wed, 25 Mar 2026 14:29:22 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Drop the PHY power_count check
Message-ID: <20260325122922.wzihturkkfpr73qn@skbuf>
References: <20260325120122.265973-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325120122.265973-1-manivannan.sadhasivam@oss.qualcomm.com>
X-ClientProxiedBy: BE1P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::15) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DU4PR04MB12027:EE_
X-MS-Office365-Filtering-Correlation-Id: 999d6e5c-d95e-4405-b01c-08de8a6a2c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|19092799006|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q0M1sXai/sjHZjmVMwm21Fbx9j/CJZ9AhI1HKbLqTetneMky/tPRKxj03T1v1Afl/g6YrmZrXXAKdwwN572JBxPFOtRTZRanlfaWWyznD9+FydIg+GU7LS88zVuJAIFDhh88gvNCrcGqG9uZvSw/p6okKdDXlnKRju00pwegfQNJbZh/8lsfETitNT6KnwGYyYgkvV9WRcl4UXuiYHPzvt0i2ilvEZ3rChYV2jrQkfXaauWD3draMicFcGXZYG8heobowSO55SrmU17CNANY3BQBFAbaQgzcldhHhMmsuD3eiLZk679GlUaaNcsNqhVsiOO2mpC99kzT7daNP/CfKokhPEdTIIhKyfgZ1BYpSuyyZhr8C9cEIR+DQlZiFVqS+2Nzw46B1zkxUXfbVVDaMarx04LI0JtBdzz7isHTI8E4AYp2K4myXUX54l+OEvQPSz+tz1bHzkiwFIMVPZ9ADlRap9UTILuVYKAWCfsqo1lHsHemVVgsjgTls8oV0FJsA7ovs98oBrNY3cD/fjvz3gQsdcwXzmSHaQK55EqzRqoj02RshlvYK/ogvHrLdY2oikhnFJqmlsJdm3FJ81EKl+ELEJQGcZ6vzv61EcUFo3mSajL/BnF7a47XLo15+KA2LW/srwg8qBx10hgdIgzQkeI0O2UcceKVq/wBR6axz2IY5AuzekKIqAIcyLZ3rlPePsEI/mH8qj6IJSr+//4rt0/VP4GOV5A600BILvvUB7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(19092799006)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rfyl+952nd3LHRIiMEAt25fj6u6+xsHJJUFCdQtTa/wCfGZNzCg1lfzUduap?=
 =?us-ascii?Q?Iz0SprDP7xHq+8AjkUFO7fitA7AcEFti/GtZNCl42tqjVH0Ul0jNUNbtKCjN?=
 =?us-ascii?Q?qRj7nvTdltDkpcaplI+EAzNGKndnILFzLbO6jb8NCSE5oBJOVJ/YVOCj5dQW?=
 =?us-ascii?Q?Bx1sGDPOMvfXeKwaQ6FHcONcyTG8Mo62dlyJUZl5DTd5Gk1o2Z+BO8DdN/aQ?=
 =?us-ascii?Q?9vqu+yYEbqAQCxVgVZ3FpN8vlqZegyuqqz0bvCU6XV3Fk2h78YKJN8vwHxm0?=
 =?us-ascii?Q?fMR5qsW4+XBtw/a2CFOlzzURG+aJNXeWBPb72q6tKqDU4ZBG+7ARCMR9jrur?=
 =?us-ascii?Q?gUQdA1Un4c5cJaP41a1Txlg77LsNw8MIkFwQfKkOnYsdlbyR3g5LBKNw/uL0?=
 =?us-ascii?Q?UcC/gupmzi1HfZfHgXXSb6TYGwvSUqjuL7nOJgJuFwcgmPMVrY3jcT8woJkF?=
 =?us-ascii?Q?1fGQfRsQat0JF1VqqHi5BUL56iimR7nbnKGnsZXKLHDUgPHE8L4RrrJdATtq?=
 =?us-ascii?Q?i7uWnrdOVc47KrAk9jRj4XmdY/S+ZS9EEGx+8Dybo8+Ly5YbLHJLYsrMJKxn?=
 =?us-ascii?Q?pVQlMMlD9E7O5Wg2Fcxugec84iev5KcRCNgQd2jKyj9Zw0X+Fj+L6NcxQe4O?=
 =?us-ascii?Q?m/jyRd/uQtKLAIXzgFJiY2LwTlMB/Qo3i6JA5zZNTrBHtcQjXALgmYxH1134?=
 =?us-ascii?Q?8fuoD1ZtbPHuugpzcsvGF4U86pxn9A08RjXdHyz34JS9k26VvkgJX3TNqfKn?=
 =?us-ascii?Q?qZbE+Ch4/DyUUaB0ExbHuo506HXZcTqIwxoLF0GDTr0iLGHHjUYD9tegeNsJ?=
 =?us-ascii?Q?oPImBzyf0vO5VJnSTKZILA81158oxoolmIH+F957aJVLPvwoolvtIRx3Zr4u?=
 =?us-ascii?Q?fMJY3VXry2eXQn4IFEth4H42Wo3JWzkAMtI/qKHMKK0p+vtoMZztrp4vTX01?=
 =?us-ascii?Q?KOl6nvqBOHshRbzMGfDTRvcjPFTEW//Avf04aZQko37KIJlHvAzn+Y78gmLO?=
 =?us-ascii?Q?XN6CKpgztt4WuNUnL4qNoFzuR36u1unzKaMVilm4qbtAQP1tniInfy1+ZNXY?=
 =?us-ascii?Q?MbHbYAgOi4LYqjVqC9C8wFo1V7n8elhiNaBwUfKjcBWcBip+yuQagqqkJ3xR?=
 =?us-ascii?Q?YDz4giBSObY+wi+0sqSzxW/RIhOzZfIwDVswv8E/HDVfSehPORws//TeEi21?=
 =?us-ascii?Q?qpZoA++TeYKblk1fc7GKxwD0Wd9O4AUQE6cTmJtOlwHg6XYXtUj6UKfabPZa?=
 =?us-ascii?Q?h5HH/1pSS6IRWUzaHQif8i3uv4nTngVrn8+IH2OCyqYZ0AMl8DiVTAPgp/pW?=
 =?us-ascii?Q?dvCnr0VTh1rlbSzblyoxnlUFNfXgNddp1dMalZx/Wzm8eCsknj0D+D0g/RqK?=
 =?us-ascii?Q?Cnm0WX5LjHGmUW0gMC3woNt8lUahC9x4FsO1UHphgNY+IdYKXQv+cxFMThpL?=
 =?us-ascii?Q?q2/qX3hO4FgHuMrUz8eeRPOvsXnS+xiIRIcWIyxHUQoWaTZSK34L9e95A9Wl?=
 =?us-ascii?Q?rpYm8rGUKbn/nEtovarSxqDVBUnG6pVI4DffT/SvzuwvmevCchOWJwkuVuNE?=
 =?us-ascii?Q?/q1DSz8LM3pmqnJU/pcuPOWtbrGUmi3nKsD3XpFMFzHM48MqQGWmY1KN6LVd?=
 =?us-ascii?Q?rLDGGmpt9MCd1kVUFOQyYyoez0OK8qxKMptfFFBZAPw54fZ5mSn0ndo4EJ9h?=
 =?us-ascii?Q?M/whrVZ0Fa8oDScQ2hAjiw64d+VHSSnSz1bKmB/Sr443Te7/Lasr7UCuAiXw?=
 =?us-ascii?Q?ZlT0f9vX8dIIyI3jqO2CMcqTg06AOFs3QNBKlTZP+im/WFDWyo12ZdwU5aYq?=
X-MS-Exchange-AntiSpam-MessageData-1: x54iviozCtk2rQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999d6e5c-d95e-4405-b01c-08de8a6a2c15
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:29:34.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHP1iel7PwLfbRH0Hjpl/PJcPBIQOefLrF7wvewxRp2RNahP2YhC7IQyoJqffM0mecwWJg0FXw+JEKgZcRDdCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12027
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99883-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: 152C2325967
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 05:31:22PM +0530, Manivannan Sadhasivam wrote:
> phy_power_off() can safely be called even when PHY is not powered on. So
> drop the PHY power_count check.

Sorry, do you mind writing a more elaborate explanation _why_ you think
that phy_power_off() can safely be called even when the PHY is not
powered on? If 0, the power_count would become negative after
phy_power_off(), and a subsequent phy_power_on() would merely bump it
back to 0, thereby not calling into the driver's qmp_ufs_power_on().
If there is a regulator assigned to phy->pwr, this would see a call to
regulator_disable() with no prior call having been made to regulator_enable().
At the very least you'd want to explain in the commit message why that
is something to be desired, so as to give reviewers confidence that
conscientious thought has been given to the change.

