Return-Path: <linux-arm-msm+bounces-57205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1575AAF009
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 02:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCCE1C014A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 00:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E8E126BF7;
	Thu,  8 May 2025 00:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V2vEcPVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401665CB8;
	Thu,  8 May 2025 00:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746665174; cv=fail; b=uuZ2ubu/3scJdsVHahs+YANMfIiTri3jTBHZiLu5spzJL0eYVdEBw3DHdRQl+S+qDJJusDo5ooa9AQ6uaZO+yKepkInt+H82ZVJLPOvrfGrapvdAcnrjpaVCHyvVt1oA9RkREP5ihDU63DIV7hO/ioQ7TMU7eL66DxHcrbTFtE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746665174; c=relaxed/simple;
	bh=dgmqF20lsqBYGneC7A0s6abi5whSKqU7yo4Ur0mpvQM=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ux3nVjJFTkvLGFbd/ydQTBArE4opTwczj3TtYsZJlzS0jliqxRkNgjhy+WDTyjvgDvGEF1mM7rHc4pkt2sdicKo5zudDy4Kl2B4aZwg4Qm5k5/VnY13TCLbOzUCE6z7xl8sq5d0nsDogRKW/asmUIBeJV7EB3qwQB/bBmXniCUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V2vEcPVv; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jO/DWdIjH5rIYUMLFEVNhWXXrF2YvVq1/WSQ6bMQwbVPbS7Gmq6LtbaKZeNF1FlsOt0qHyyjxcsUR5h2s9eBF49wA+Z+jI0BCJbLCV8Ztms9RWWgrFh5KtI4vhj7o56tOyXTyCQgQiLfb941YCvXusKWZ+rv8YtVw1zv4xFT8wXFEXTyj9z4PkMhYGoifAhEJXAkT1EEHoW9eaTsRv1PIqpN/25LjxNqjZ58gUG3AkB3QHptEOW6w68Pt/+Nr/UYoO0py0UumxTVQo3S80ZxGhiMlAJiaMdpgJsFBPirfM67xQPQNSJ/Bfb5649dlxtnR5fIJ42Kz47RoN2pFrhfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciLAlXvDRxBVMITRaB09Vu8w/+qP70OscoG9vBnPUhg=;
 b=WxeueiWZ8EQ9raJJct+d62zIx1WbvX3oFwNNKjno9bWVLMSoez6jZllAOT6KtHLM0Po6AMFw89F5JDHUCqRVQpWJUxhvDHyEnRJkXKnt55TQ+T3OWkbjmM16gDBT1mjRHW8UeqAgCl+XKIKjIjic877Biv84MFU23EfBgL4jzbIObfgwI9PyivYpffIUX9Xvn4JcdiK1/SDLRurNcN8Rd9VtR4DoMfIftPl2u4cHjgz3i0e/JUToXSjyJdcwkSxs0N930f0Bs6nujSFzCXVgKnTszDJqGlJUYgBqLIYLvG35KrHtkl8gJF+dLrix51NyVtatZLjdawjcorfPZ+uRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciLAlXvDRxBVMITRaB09Vu8w/+qP70OscoG9vBnPUhg=;
 b=V2vEcPVvUililBULm+dRIqI2CenZZQUi56h8918BHOuAJCz3e0c+V3TLjmlv6UuaKIK9kK2aOluirKB0UhrKZ1kp36FWR6fPzdw/7YNEOkTXHmtaqMhiS/WZIsSnLHqc+bnHsu5sGPOzHjhLVL09PfdSxG9EXtqsYmRxKU1Ycac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10008.jpnprd01.prod.outlook.com
 (2603:1096:604:1df::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 00:46:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 00:46:09 +0000
Message-ID: <877c2s2alq.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: soc-core: save ID if param was set in fmt_single_name()
In-Reply-To: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
References: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 May 2025 00:46:09 +0000
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f3cfba-003f-46fc-926a-08dd8dc9b986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?49nASUQqYEKg/tk1Hh7YIv8XiKyBjElY4TsCBUcIcpQbtN3FxRBJ518CYx2i?=
 =?us-ascii?Q?gp16OOM2s22vYkisuDeU8o5FCF3V3zNNSuE0VfU7Gwh3pvn90IfbCKu0T7eo?=
 =?us-ascii?Q?VN6kwNxQ9fwwD4QuzC4UIyyMpEPg3d8e3Z5Y6V4lWsmtuuckuhIzF23nSP+u?=
 =?us-ascii?Q?/VKlqCI0r4bzbugcL4PjyMYg264tw3hfEWaeRqMxQ7vElz6bdqAVIEDSruZi?=
 =?us-ascii?Q?2oaQt+DPJevXhjWjhdANRdZUXb+xuD70kfEuYbfg1g+R6xXuEs29VA+IZSwv?=
 =?us-ascii?Q?nNEXRO7gFvvmMww6V6yiRAhj0zz4EdMWHCv3Zh/QHiyzWVAIhqxaBY97IFYh?=
 =?us-ascii?Q?kZRAk9i9N4WonZJ3awmKNlYGWfOOGIDMFKvrwhKzWbEcb9errAt8NJWWmjBK?=
 =?us-ascii?Q?k1Mx1X9AK+ONc47J9XGgVNNt1nqwF80ZAYy/InXOAP2ZtdzeRZluxo63en2I?=
 =?us-ascii?Q?yCACm9HYYDm/vCgBoJs+rAjWmf/tV1Isb/HcOG2DyVfbZVe39ahwHvUlOQdS?=
 =?us-ascii?Q?BU3bo6sLqKJhZPGh1dsTp8FaVaM6oV27FMhb5jQbdOy5aw1WRRyFhyNpDHBe?=
 =?us-ascii?Q?79RfXYSQpCNhR7LOPMOUarFAhVEnJjnT6FiRg2yUC/B1iINh8XaQ03dEwVVu?=
 =?us-ascii?Q?2BsKu5+OO9jcpYahxaEyvgYJ1XTjhqqNmiSCdcvJLgXOZzQ9upnwSCFxjZI0?=
 =?us-ascii?Q?F3mn2BfGyvaZyhaw0yeS0vVChjyKUXlvne68bUf/xyhsguaaCyZNkxMR7kNU?=
 =?us-ascii?Q?tAyzb8Skpl/xlR+9bZWxntQjBY7s5uz5rdLmyozrTpzJSlps51IlgGmafFJg?=
 =?us-ascii?Q?PiORuq+cXOZrjutx+ZIi1EPAdyapmdPrAi7xINBPwICv4K6kNQCb1yjG1UQv?=
 =?us-ascii?Q?SEJTuLCBvy9R3nfDsMvi8NG0JLwOMfGwcOaRwbAqHJGj801qCpX6eIu79Rws?=
 =?us-ascii?Q?Tr4DJOrRgqdC7sOc5/L34SRaaQe4MVR4MBWn7BfAWvNfmSfVkUt+Nbza9IQ4?=
 =?us-ascii?Q?X15oC4vwOG0SX/vYUN/6ydUUPLARjYKV7Qiscl0/4ZlMJrHaeBKSKQfCXmVk?=
 =?us-ascii?Q?zJacIhatST5WETmY4YW/fO8OGHfFtStj6Jx6DwTY6my1E0hesLb88PuOWzAJ?=
 =?us-ascii?Q?Wq4EXqaMpWpjNWw7YYMDywOw4sWDfzVo2gA9vxxJ2o3lLPMvBDMDT7fdohXi?=
 =?us-ascii?Q?8oVbYan+kS90x9uSdLCKi/uOJoZjeEC1i6sxyvYoW1fPo4wZK7v7+o1HlFEa?=
 =?us-ascii?Q?kfMbulFXjgX1e99qt7eto4zAJlhRDOifsUzKurxEyEKmmONCoFEqah49/Lfj?=
 =?us-ascii?Q?3qLrsbi8ILsrEMI9Rg8gYc1Eo0qUJ999KugqC7blvikO8mikR8CclEDSZM73?=
 =?us-ascii?Q?n9E4FA5pKODcBWF49xUeu8P0JEIi5GQOHT8I5PGqgslJU5xrq89f0JneBgBa?=
 =?us-ascii?Q?rDWj9Ar9KvI5W9qb1gkP2TpVOg5xXFIGQ9mgsTfYYrnuWSMqXEHAOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M9oHTFvU81mI8MXSoSFSez2gNlz0vLRhGzuhgZsFnDfX+5daEeJ4ll7c3nMk?=
 =?us-ascii?Q?UrD04mmQez8OwZvWc1fGL5ylG+7TA4YppQhtvfKxSjtr8TkC3aF+63UC/x/n?=
 =?us-ascii?Q?JGu1gsVsT4ljLyQsj9ARkUJy5IHVgzmXf89rgouFOEx+UfuvzuHU0ab38VAc?=
 =?us-ascii?Q?jX/YjRxHQJvvgdkY33sXHuBLTAZbqvMwOM1o94BzD5kW7OwwOCbSW8S9+Hfd?=
 =?us-ascii?Q?d2fZguSwE25eowWwXe+pykZUPU7QKNKmxqrdkDly0qN1r09wrUlE5xU8TkDA?=
 =?us-ascii?Q?dYeIjDO4l4JMfqyLQGHawPippcf9e02W9msnIHj/4yagWAuKwEvYMZLmg2NB?=
 =?us-ascii?Q?tCMk+AsJZOXc2r6U7HZm9coGnrKukUL1M8dTQ217JUPMfe25fcH9qoseWlpL?=
 =?us-ascii?Q?fSN4qHFppMsWMVqU4garQnz3cmd0qTRfiXTKYwwuJDYa1DGlho6hnz6FKS45?=
 =?us-ascii?Q?IQV18U+RDQCFGmzYcn+BNck7eQi6eYwZcGT8lSlPNvsjVdqzB0IVAiBXhyMp?=
 =?us-ascii?Q?Q46UZSd3TXxWNIu0seqekhp+yE/TcOsaNOpSBuL+1cZIkhbWIMGUGKc5PVji?=
 =?us-ascii?Q?3hYUepj57eufgKUilyH2Mzy5a/A42WmCno5eF5Kv9HmCDAQ2vO9SPws8wZyc?=
 =?us-ascii?Q?R621NDOJX0l2Fd/mI/w8OMLIcOxfidzORGJp05XftOzjTdr3BsnCaMmXcxBf?=
 =?us-ascii?Q?OBc7IGc13vsTLXrLTpCc/zGdnX+IG5O3PNnbz2uSA0LsG+esFhV+BaKZxKe5?=
 =?us-ascii?Q?JAQDBNWF0RuigEUK36u4d1hmu0lI7zqf05H1YT9a0EJYOldZ2xWjZ9nI35+v?=
 =?us-ascii?Q?+RntkcnQCkTr246gT9fU6oczVrYx0f33EHP8BatpYv5Nqd4OGwMKvhueAFVU?=
 =?us-ascii?Q?JlGPKvbyNKXVJvPodyUowaZpeJ6c7heevE999F6yh2e9o1fxvPsLVa18CcXQ?=
 =?us-ascii?Q?uxXlqcrPx1A35CE6HbVPfyuXyUj80YLeBgP42pIDNwFe5eUat1Zw6Bh4/8EH?=
 =?us-ascii?Q?6LbXm09izMHoXg4G7l62gT1kcRzu0fOypaffP2wxCBdkerkGS35YPpziN7bj?=
 =?us-ascii?Q?V+4hyFNbAAfUNip+WvTwkrFcqvREo1TLP9BMQOWdi7xXPPhSaPWELLimrOuW?=
 =?us-ascii?Q?oyFCk7qoICFrHWerbMDYkJjE2Q6x/eQkSoUKtEn1ds8aEOuEG6/MauV99ZNo?=
 =?us-ascii?Q?83QrPWnOOwONaudAQN5nU7D+D7zI3YWd0spsv+b/0+Qfc7BhrT0o2oG4Ok3m?=
 =?us-ascii?Q?dShMkfJ1CCJOBh7IAZ9h6eh2CbnLxxTkzhU2R6zQzfu6fNiyRUhv3n55oQ+r?=
 =?us-ascii?Q?lIRpSaz+NCH3lg8EgTi2NkTMf/7XElLoxnLZqLWPcYJnvUbK244NybX++h4A?=
 =?us-ascii?Q?Q7UpwX/fWIHWxED9ExVEPLLkaWuDw8i93Etkq9BelltcoqncYUx46p0K8fxE?=
 =?us-ascii?Q?0TiKPf7Sx6O/8QVPGgCRte9KWDnViJEuMIemeDIgAWXgTswKdrafgVhSaEiS?=
 =?us-ascii?Q?dkmUIc2RutHVNXV7qxJ6kU7pUav1F7V6ePASuQxUFD7Erb1WdKIVm8Y+Nphv?=
 =?us-ascii?Q?VM/UO+A0dZJC4Iq0APzYCgz0Jtpo9oejAGY89DemoU43BYJXQwrq3KGe/AOX?=
 =?us-ascii?Q?UtLeok8yWkVG7qQIOt5gjOo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f3cfba-003f-46fc-926a-08dd8dc9b986
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 00:46:09.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvKhQ2GYGzsxQrBQjUpbmSvtBVg6D0Dryo8HVYCfKgFE06V7jrqQt9ALPB9BnBaEOQOOqwE0ka4zKXUNRc5OLOyqXGwcMGRhAlEB4q+OTPo/qy6vHLQCoIPWCG4SRLhr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10008

fmt_single_name() requests "ind *id" and not allow NULL for it.
But sometimes we don't need it. Allow NULL.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ab615ec113d2..80569209ce05 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2604,6 +2604,7 @@ static char *fmt_single_name(struct device *dev, int *id)
 	const char *devname = dev_name(dev);
 	char *found, *name;
 	unsigned int id1, id2;
+	int __id;
 
 	if (devname == NULL)
 		return NULL;
@@ -2616,10 +2617,10 @@ static char *fmt_single_name(struct device *dev, int *id)
 	found = strstr(name, dev->driver->name);
 	if (found) {
 		/* get ID */
-		if (sscanf(&found[strlen(dev->driver->name)], ".%d", id) == 1) {
+		if (sscanf(&found[strlen(dev->driver->name)], ".%d", &__id) == 1) {
 
 			/* discard ID from name if ID == -1 */
-			if (*id == -1)
+			if (__id == -1)
 				found[strlen(dev->driver->name)] = '\0';
 		}
 
@@ -2627,16 +2628,19 @@ static char *fmt_single_name(struct device *dev, int *id)
 	} else if (sscanf(name, "%x-%x", &id1, &id2) == 2) {
 
 		/* create unique ID number from I2C addr and bus */
-		*id = ((id1 & 0xffff) << 16) + id2;
+		__id = ((id1 & 0xffff) << 16) + id2;
 
 		devm_kfree(dev, name);
 
 		/* sanitize component name for DAI link creation */
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s", dev->driver->name, devname);
 	} else {
-		*id = 0;
+		__id = 0;
 	}
 
+	if (id)
+		*id = __id;
+
 	return name;
 }
 
-- 
2.43.0


