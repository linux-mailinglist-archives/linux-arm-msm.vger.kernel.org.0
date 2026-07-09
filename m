Return-Path: <linux-arm-msm+bounces-117829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPFzLOgYT2rxaQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F472C638
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b=jrkNluwt;
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D05C53037D7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 03:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F80392C34;
	Thu,  9 Jul 2026 03:36:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012006.outbound.protection.outlook.com [40.107.75.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9293393DF9;
	Thu,  9 Jul 2026 03:36:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568166; cv=fail; b=rPRVcrO48vIu06KwimgTC6ebD8BUmdcfDWa6iTBhkK2VPpUHV5F2ztrJ+Am01+3L2gKcyzNKeyrRjArSznjFz2VMPlOpQ/0K35qJwZjNq0DsxXD4jnar7lDXDVJO0ES2o/U4h+shRyrND4F4wpDkuRB6rSw2z217Y+8ijBg9t2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568166; c=relaxed/simple;
	bh=nL8apRYhSnP4vaRiYyJinDi2id2sP/GyQIFGxOpz0aM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EoLS+fA9j2xGbo5rtjxeDMMaAF0viIFp29RnEQxawcOaRVmM0OD596VeqUPYOhMobO7G+KNGYGbahZqo5GDDTbo6aDYiy7Uikgi1v6JFBQ7fBXfAMb+jSrRsXnHJCwa1a1t6dcFgCXSteg6zQ13+wLRxSShjfvcGt8gqH3HS8Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jrkNluwt; arc=fail smtp.client-ip=40.107.75.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkWKLGFpIWQ+xDTSeoMjaD5XkNcFHDhBvCzpzMb8/WIkExCPAKuDWTsbo6BrycgrJyH6J+i27y3U2EyvAv5xgfg92/97tHujNjIIlEHA5qqYfbNioeuQXktb688hyRIIADGCPQ5Yl2UBvH/bFQWecZAcXzL2SkCUBHx2XNhPzlxd/dkrFOqJtG586rZaQomHfV2CIDbwgYP+Y9gDoqosZRqC7mJjoibtYvhZ4rH4jpA8hictr3Lh/OH2/9SfDA9TqnwuCQzLvMHP/Q4hKcX6yve+nV1Y7+b3ppZYwc9sotME+izG6HHR2OLxH1PMNkUq+pCVz7fhNp1/uLiA9+OCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+aoc3E3NJr+ae2vvA6K8h/+DFhzAnzo4kCFcY88w7Y=;
 b=SR7T8KWT4Xn9Ke1HJhK7IvwuCLZu1y0K9qM3NAXJrsbpEOwnbF+Sijr4rlRCfAXJihH9gotv4r54G7yRkzf4zN4It/kKqW/7D6/qVXPwqx6ADYaLGM1+K9CO2mmGljo3IDAUxoONJbl6F8fEV23sI3C6RweGcDc6U/P5UmXXjs71Ah+xuuoiaeMJZB2H7eYPr5z+R6Wz2ruhBKpHOwuYdjnmZdNsYfzEHvQRi/746IL8qhuWaAIIywjMDHCmHR1XgMSlVXss4MJD17f1AQzEBNNikvFHTP46eQknEB60CMbgDSZSmNUZdqb4gFHFW2K+hS/bNGxYQFmVLi/x/4Eizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+aoc3E3NJr+ae2vvA6K8h/+DFhzAnzo4kCFcY88w7Y=;
 b=jrkNluwtL7qEmOPXXLiQG8Js5jWuwssUUuC/LJdpQI3lOUN2MOh4RhgLt+FcbCgOiSe8lKHgJpaVTB26Nlhlz0LEiHT+uLMMD7khOVnsRxIHgk+rUObvTky0m4f0Fbdl+YbXbXV3rXhWqRcHEiskd4+YwbjLk0imd2SWE4nn5HTftp0IjyWylpgxqDzdwcRzp6U5pvtdJGM75kq+UVejcJkcAUDZmpI2Fnzai1tlFg9xOywEwdwFyI0GlXqGeD1MJRfQ4sgqDoOfUzAn2Iwo9xrsHO7cF1Bdb8VL1eKmz7bzKjYTsfszclp8rlcSCyWWr399pOaE0iA5DvCumA72Tw==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYZPR06MB6213.apcprd06.prod.outlook.com (2603:1096:400:33f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:36:01 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 03:36:01 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM SMB CHARGER DRIVER),
	linux-pm@vger.kernel.org (open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 30/43] power: supply: qcom_smbx: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 11:34:09 +0800
Message-Id: <20260709033428.362970-31-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709033428.362970-1-panchuang@vivo.com>
References: <20260709033428.362970-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYZPR06MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1dee93-263d-4b00-de4e-08dedd6b2044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uO38aFOeNBPYT+E+8BmKvOzDpJ0L1gKFCfV2trm33K6zD7XndCFM2g/1Ll3l1e1UqGRfHA/xqktQZkav4rrLlAkS30ilk3zd1g5PxFWYf/bp36ziaGFLavzSCx2qoTKoBJZNDhzhttfEUUKH/m6qLiv8mf2SJMSf5SXmqHhHwK95X3uXx+zwG3IhUSvku+e4D3s74VhZYOCUpuqhqnnFUtvRz2wbILO8ea7jN8W7nh37LcsJPYvK3KWuYU0u+myGK7KaDyx0jOccJmQH0A2FjlAUJ0i/fdlB7nVZ0lHiE/1fjP9BiGyz2LqK5zI5GQi09an2KFMWM9CJHKTN60eQmycIfIagQT/QaVfuGTRuZ75qAoyrLveWDbhIcAH8Ithm0PJtmivxYXKCjJXEBEzKfDGfx+FkYyXlF5kZN0VvjkP7GarZzE97RzaUuAsUXdiH1Osag/0xur4Av+//pyGYzMGZIQJ9YmA+R+qfeN9UXuHkNR+NYOm6k+9K/yS26KubdxgI7ckeD6XOyvkYNtQjMzSln04b/7dTWrh+5Qn+2VotzhUc9z0KgoWuhl33zOqXvEgThP5GsNic7c3+TOQ+aKlfYAhiAMVjkUq9fX3fxAdwOt6ZqrZ1BNtk6BQZTauUVEeuOWo49HLJdL2rDYBkYjd5I/NfGZ4wBBx7IwK9DdXzy6GYwkY8ooPrMkVxZknNejE4hX2nL1r5k2GRiGBzK+xOTErlQbRSUmBOkYkbSxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ur3EKhcD4uZNgtIrmuOKW3OwdykGJkC6GHasEdlAI99BhFlYKNTuZHiX+5T1?=
 =?us-ascii?Q?ssIDUlA2siJv5N6/kkS83tO1icfGJUxEeF1QqCTWoX5XmAQHsI1OxvqYzlXZ?=
 =?us-ascii?Q?/9yqC6bmTkONuBhl6/PuvbhmWitoTV0Kf51Ta4v1o8swAclMscXROHhemEX8?=
 =?us-ascii?Q?JhCwScKKf2J21gcFDFrqmarMTUJqdbm3CNtwlXT7PM5kxhQEd3/0olLOpV8m?=
 =?us-ascii?Q?vqZIFL0vQ7U0lIuSJnpwh2cn0HB15isikTn2xrPciNnFeB+b4+f98mDuzgmh?=
 =?us-ascii?Q?qc/U+Kx023qYC0hHieUXB4r7X+7BcfjMgWyliN/3pafF18203XtDrjCr3uJS?=
 =?us-ascii?Q?nMUF2bQqoAjW5smiuymOUe2nr3ayRCqwXYcPoCyiCFxTzwrqbXgYuCoB7Xt2?=
 =?us-ascii?Q?ZRo6bBCN8fa2gDpOTpkR0o4Xq9+OLWR0v7acXqucowHQUIJaxTEUm9VjSZzV?=
 =?us-ascii?Q?YbWQ6MoMMCwYhq180LP85IjlV4KaiRJE5rtn4a0XMxAWeBQoxXggffaZM+KZ?=
 =?us-ascii?Q?JniPPemq5ioqB/qJRRymIEWofiu2QDybKfObCK7ws7vmjgCsAQqBKu7NaLrH?=
 =?us-ascii?Q?eNirgnZFVZ/tpaCqGJDOIAeaq76oZuNKxKU0+sf8oG+8yzYW4oG1tB0zeflg?=
 =?us-ascii?Q?YBqYEmv5DN0sprYScbgStI0Xvd9lbX2TcXoI/qE63Gm+7WE2AMLLJDz6q/gc?=
 =?us-ascii?Q?1gIYUkkjUN2sC64k3B2DLRvzc7ovieU3vsHBuox+cIKAeFNFVgBaRFLscXe+?=
 =?us-ascii?Q?/rhkjp7pBD5jvGwPRD9dV+jD2k0/Ul91ymXJcszc5bcxVuSCm25gv2vPnycs?=
 =?us-ascii?Q?5KBouWz+fcKsoTP3T6gWJYYmOu7rNLtm68+3vIOFWFAEFvCegCJt5FcGiiWm?=
 =?us-ascii?Q?0UDIKVbPKSXZv+hLASkaLd5+rEsXsNs3A1J1H1xaro0J7OpVttPfJUmNj2+R?=
 =?us-ascii?Q?owVs6sIs2KBMjgyQe4frcgKErKy2cqCcwcabzu/eva+rHxurcezxD29746L4?=
 =?us-ascii?Q?g71RhzIbtC9MbcyIBfsl4yhZ+nZx2YgFvlNbGcBEQ2momwnXcAjotpLOATOO?=
 =?us-ascii?Q?5qRrvmZU7tJNv+08bogtwZEFJxgxMHenrnxEr6YCofbpoBfNaKlgN8Y3MJVX?=
 =?us-ascii?Q?bvXh20FRyIMi2iRlXkoyJ0QhFUWSJsvKpGuLH/lJy3+DnkfftCgRySkmmvdU?=
 =?us-ascii?Q?P21JTO8f9DiIk1dj8Z8clpD8wgEAZSNh356F2zOvHfltczH2dUgbOucky2Q2?=
 =?us-ascii?Q?9XWiqO20x8dg83xwScSfSvKCpx2ua2KqI4sRiQbsbzcuxHxDk5dr4yJF5yv3?=
 =?us-ascii?Q?6pPDqXwiLGq1hG1JudR/xvVkqVMDosLsv242G39sq1dBuG888V2CFliG6/iZ?=
 =?us-ascii?Q?QglR1HfWq3Syl3mtqLXxN6++pQ61T9LD9mATFXFHocaXHg7vio2YWI7JsNpL?=
 =?us-ascii?Q?Bi5P9E2QOCwAMDdCYzG2BJFt4gnhfGo5cYd2NPjANpk9nOi2GStFozR0KJ4Z?=
 =?us-ascii?Q?2jsqOuUOceXfJao/1hFq3+QZmxKeJ1U7/HWV3XYcmE+1CCb/nkZel4w7kjgl?=
 =?us-ascii?Q?wvt3Ij5iNR5HynIEJIFr8uT+lmy7FoIr0PLhpmjGusLzZlhckQk3WnZxyaOx?=
 =?us-ascii?Q?JlW+1EnrLQw01skp337J4qyX7jWBTzgJPlR+CYSDO6fntQR/VxjqXMcXwdqP?=
 =?us-ascii?Q?YeUCCApOUBBJqlv2yW/QlGjfZg18psYGNTiAi7hXhkN4WaoWuKp2jrhSly8g?=
 =?us-ascii?Q?HRLLAuM13A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1dee93-263d-4b00-de4e-08dedd6b2044
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:35:30.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5+3VELA5KNCd7sGAZTy/CtH2jHJ+LmqyaRxBojR24JHIoToERBU2loB0ecl9/d2aVYfVrU6EV7uR6L9Epm+ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117829-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:casey.connolly@linaro.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:panchuang@vivo.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:email,vivo.com:mid,vivo.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB3F472C638

The devm_request_threaded_irq() and devm_request_irq() now automatically
log detailed error messages on failure. This eliminates the need for
driver-specific dev_err() and dev_err_probe() calls that previously
printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/power/supply/qcom_smbx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index bf2e2ccc454a..7bda5cd77a75 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -922,8 +922,7 @@ static int smb_init_irq(struct smb_chip *chip, int *irq, const char *name,
 	rc = devm_request_threaded_irq(chip->dev, irqnum, NULL, handler,
 				       IRQF_ONESHOT, name, chip);
 	if (rc < 0)
-		return dev_err_probe(chip->dev, rc, "Couldn't request irq %s\n",
-				     name);
+		return rc;
 
 	if (irq)
 		*irq = irqnum;
-- 
2.34.1


