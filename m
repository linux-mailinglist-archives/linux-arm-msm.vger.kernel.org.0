Return-Path: <linux-arm-msm+bounces-60171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E6ACD534
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 04:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE7B3A638B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 02:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB910347D5;
	Wed,  4 Jun 2025 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YYOqD1gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8901862A;
	Wed,  4 Jun 2025 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749002822; cv=fail; b=dV1wVaBKLqCjjJ9r0lIcUqQzda2Zr28d68qVdb5lSiXH0uAjZtF10rtyeHHqIqe86gbIbmuiPE80YnKSX+q0N+h3hriEzHjYE37yqzseK2/7LIApIxSZo1/+oFbYRhr1AlGJYbk1apX37nNOxkUVCXcaTiN42M/hhSG0GwYOf4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749002822; c=relaxed/simple;
	bh=jynUJB63Farrgfypiwb8lWVFP+cBiiNPtwfyMEsknBQ=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ohH15svke3lP0AP3pT/GFWAm8lPscfHkb1sfiHx8Y6InuqAZbG5HyCAiTVphGDHc+VA4WNXwpgxNVqoCpaWju7UZxiWxE8woelYcGHC9DxtszA7tkO1+hWpR8UysCyPRRJPinUR7EAb8JEAaZjFy4sLSwavvz3h5YwKnRheQfbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YYOqD1gO; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ5Du6kUr0U5T+76WjagkwM7J3uDlkRoyzHrBG6DzjJSifCXCwgoU/2nP/J8UKfdP4mpIDdaGMEO+UiDvCu7MJKw+ebTGavjgbXFgktumpqeHO/19zXtzFMBLKemzHhdKHJei709/0gLOF4L6vH59l8mGFbAZ972x8rWUluGXPbeyR6v9vcvORGrf+oS3ZTHCQ0R5Xg/ya5xEochxwBYbA5Yj/ntnWFJj9A6etvaSFJhouuPXWiclqutEfNrfNv7Br5buwczpcXR+YSpWcZBmk4lTL9StHHXPF3gn76NJlxDlE6scfaOlRF7Zyn0ybCP2921vKDVFeaGk1ogJkhPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmZw9KPaZVIoLLiJQL1xuQawHcvvCLg2afQ7D9bPec4=;
 b=k565N9R97AsyvqJRFokfde0HfWazfYp/s98X5IaWARdzp2qXyHFXzHZQx9/4DvjWkKuzE0UV3UhHPxuEYCwsy8iV0t+uupy0wDkZcbe5BW6lmWLIMOUl9qBSoQdGtwpwiDwwb+wMv0qXVdXpVK24X2DPi3Fd20wl/WDmXid6VoyWOji+uomt+wElxj75IUjSHattIhLGl1yHaq6dbQN2VYoLauD5p2CNDkcwqaWjh1X8s/c8qa6RmEF5IpVU3TloQMuR6QbNfknrNe01RRDeIlsGzlLYkza2eVOFv9o4rO9i0hgmbre9t/HSfiTo9ANt99cUrUYLZeDcDxIB3ZuIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmZw9KPaZVIoLLiJQL1xuQawHcvvCLg2afQ7D9bPec4=;
 b=YYOqD1gOvjZLkTN6sQkzQe9pZuCJCjCS4Tp+b9jxAfV1Og1HT+ky8bO1uyF3KUDe+alrYJtwLjxtpzhwErklP3fjiomULcG71IhPAFlmsm7ZcliNprUdjZny871BGZ1CxpDe6BDW1vCeoWF3n4qltK1ukw3bzeRT7XHdKma741Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11277.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 02:06:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:06:58 +0000
Message-ID: <878qm8uunz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 2/3] ASoC: soc-core: save ID if param was set in fmt_single_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Jun 2025 02:06:57 +0000
X-ClientProxiedBy: SL2PR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:100:55::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11277:EE_
X-MS-Office365-Filtering-Correlation-Id: 5369a8b4-89cf-47ff-46eb-08dda30c7cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EI7X32V/yFU2mLuV1WutC3dRm+VJ0HJirfQwlxwSAH5CegSPi15AokxoOWqY?=
 =?us-ascii?Q?Bvnosjtb52sCBwrIlZSZzTNspBKxZ2PP+rpwKsIAY6p8/WDxeoZOxPqrGj6t?=
 =?us-ascii?Q?8+oTQh6p/ukz4LIwAQLWbdezDjWvZ2M0tSw+2wf0Igns0xhWL8QHcdvHXVsx?=
 =?us-ascii?Q?Jlnu1rrCJSnmmHmJTpa36VMO7ILzCC9eBm7RL0fgKdmXIT6UeGPhlhNHCFlo?=
 =?us-ascii?Q?7YSSJnSoqBsvvp0/LyU9gCw4T91ayB1uwKFYaPsxWT/LlOYfDrs8YL8IRfeJ?=
 =?us-ascii?Q?kFOYMLkkQmSDEpLfqXrQC6d2sMglAOAux1c8nCJe9CVbe7bzttO4FGDBvbes?=
 =?us-ascii?Q?OHqMYKVZcvzbAHreKZSpCkcBPVvBDWCXsY4d1MkRN0MCwM8iKg7y5BTkc4GL?=
 =?us-ascii?Q?iL6mojBg35xB+XWAPj6qBRHjPSjmUoyq+yb+0RZ5sbT7Ha0i2hPa1KEiP7x4?=
 =?us-ascii?Q?XExtdL7/7rw4KggdkgNXhhqFi5ukfFlBr00vNHMTF2ZO7HFKIE18FnfkxPqe?=
 =?us-ascii?Q?p3dJD+b0uKynWBSKIaXHk4khKgD9jgcRnHhhhjvyW/LSw+jAv7sijqominO3?=
 =?us-ascii?Q?SNEDQozY6WyYYIA6X5V3pLw7XfK2oFWmCD/3tTbSOWezNQ/t6vxK7Ur4bHE0?=
 =?us-ascii?Q?mbw3Qs+f9zhvOrpMFFU818m5Qxx5bwFElhiVMkpmHUdTTftyNCtKZse9ETO4?=
 =?us-ascii?Q?9ViPwTSQdUq14qw5pkcTnCPJzxla3AuKp6KwQ6lWd0vxgb2/NRdUspeYxG5J?=
 =?us-ascii?Q?qYt7+/KMyaPuun7Fj8L9kC7SVNXdTxOJ/i3b8QGVo3nxFusWyBChOCRUNPzf?=
 =?us-ascii?Q?+FiHutydNnR1EcZIu8ywjL3SecRRdRD8XsHKe9+0yl/4Nh9c03WUnuP21BjR?=
 =?us-ascii?Q?I7YFM1Z/zgRmWPUkHM227BiKlkXD25rbwmBDSDF8uhw7XLJRxud54XYlaY+Z?=
 =?us-ascii?Q?tQWFN4KpWx4Qxc8mspBbnIKzEoGQ+QzwCLTsTC1sZz09KA9gL34goGorS0fB?=
 =?us-ascii?Q?YFda0NrSXqEHbYnW63J45XkK8kCHnG0Q9Ghmp0i8fw1jYJ9os2e496f8Cy9N?=
 =?us-ascii?Q?Q6I+cSquydxxNB9YcfrEQEaViUvgSnbO/AQYZMTcOn5mHh+FQrKolxn5Jmv/?=
 =?us-ascii?Q?8FqMt/YNBAMlxzkjh30nPxYB1WlJYTnEoUJ9JBHR2h5vZ2WRw5Me07ZEvBbg?=
 =?us-ascii?Q?rVrFd/A3vm2PH1IfDvZwrfkeoKNxqCztJ2+dfN0No0i2pgRigEM6fXnD2ezH?=
 =?us-ascii?Q?liwA5A2CoCodG5sNmqYax+XSluLOwnpjKf6dHSlfHUz5kXp+VUYjShYS7RI3?=
 =?us-ascii?Q?+02WjpbVgtN9TdQr7Qt7thBmr1en6lT0fHoUZ3jscTf+Wx3e90qsBwwn2Jmz?=
 =?us-ascii?Q?Qmerg3VQ8Ifj6cKkxbSU7jp8DEUAwX3owUVbdHsNMRCYFYR34OB8b3i5uM4T?=
 =?us-ascii?Q?gzxj3vsaXlDjwKdTLWhwsltpuHWw2ldNBRTF8xc74R7UYDFLwT8pIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i4t/Bh2Tsszudc3Tc+A+rVxYlbDw6Wfz5jSg8rK5oiT+iHNnhoYnp2Y/VIL9?=
 =?us-ascii?Q?jgEUB2Ev/vgGUnhMHG0t6FPouTYsqThjT15iKPo9AULNfRe7QHGKf8ypzeY7?=
 =?us-ascii?Q?iTwlpxrGkSOJZWbz7qpa10qrWD2DmZdj2Q8zpy6y3lnisBt2xdbF4Zm2l4iu?=
 =?us-ascii?Q?xfqnWAySzSJ42v9HSzsiOY41rF8B1vdwsirOQEbZgXW9URJwvMquLOxRsj66?=
 =?us-ascii?Q?rB3uliyq+vu5FgJOLU+aljEiIjn3bOCVeQ/9g0fOdSxUXkzhJZBhS5cvzH2m?=
 =?us-ascii?Q?UC9xN0XllfbZGlAqJwCBNFaCnguaurwUzbOiDNioNTkIDRDgtXfn1vFjYIBX?=
 =?us-ascii?Q?daUH0aJMrNhK2EqXuWSV8/QiNJvO2w2kOi+r5TbW2yKHbI1Fjp8je3tbJAug?=
 =?us-ascii?Q?BDI/ax4Fzt2EPNuQQLMaQH3dB5IoGagAddujR5zX0zmNdjfeRpTeBrKYF5an?=
 =?us-ascii?Q?V2yGfKqCqnNPJ8MTZeoNHs/akS9E05pm93yinafooigt1gvmaZ5FSLd0NnZ/?=
 =?us-ascii?Q?Neb29mvOLCZ6YkS0vlUvHPAMEvoBUYFIWCZXCFQ0qflRqkJesYUz9hRqG/IQ?=
 =?us-ascii?Q?BBE+Tl07/EafzKCW7Q/8iT93jJ4KrfLZtcndmUfifhb4cvJnNgVIWNehjDGi?=
 =?us-ascii?Q?XGhv31Eh4bfXxgVLUCNxxBLVYlB4hZmZvkUS+4Q6hIeC+GV5ALSQtlhxa41Z?=
 =?us-ascii?Q?0RmiivccGU3NOPnr8BR3zw4zZk5k2ncHObmCk/wBrkpB3iNqJmx3pONVjXGx?=
 =?us-ascii?Q?fRcDTG5PpEf2KFoIsDWhP0kwtu+seFu2l9OrwlCm8sGRdz48wMbMFcgRlqgV?=
 =?us-ascii?Q?M628+C7a+lG+wLQ+uN5H8alAx1Tmgf65rsFBaMq8NybTOUqtr+3lWcOGPW73?=
 =?us-ascii?Q?5fTXTrsp2B0tZFRPNvLUjY73U2pS7DRqvAitSqTzDTdiRC5+RLvsI2rn7pTP?=
 =?us-ascii?Q?/Kk8Y2cTq0TvJqE75oDWKao02U1h832nFsmo5oDdMqi/UQ/+ppFHF2Sdlurp?=
 =?us-ascii?Q?nycwfHuP+zYlXuSoFV6oSwKx/+egEm54G6AZ2uS/r1AAezdQjg3xGcn3mVZw?=
 =?us-ascii?Q?EVmGqSBKOzLPMj52Sg42XdoQKHZYBpv9IoFcRTEp0AhM9t5bEn5tc0pJpb4n?=
 =?us-ascii?Q?n02GvX8sY0Q9LRh2H7aSGv4RaosSU1uHk7yddpacxyGoRrOhOKU9wnXpKpC4?=
 =?us-ascii?Q?F8i8BRlWY2zUWRW2idUZcbIMF1gH3T3Rvj9Bv8y5o53aPFxKlMTyqGszDaHW?=
 =?us-ascii?Q?HkwWvCrk50yGU60UMxG9Y6QBoq9hu0D+WIfCMAcSgF7ze6QnqRTm8PjdLCrQ?=
 =?us-ascii?Q?GrNjcDGVXUnFiYWhPxH0o6ueOlmqIk/t0cRiEJyz87hQjFdbeFIkJ0RzEbEI?=
 =?us-ascii?Q?CSuf2STNE1xY63u4LHnCGpLe3kZuN8YZaPyJ2ZsG8k/uBk9z/B/h5MjCZMUz?=
 =?us-ascii?Q?OtTwifqfl6ST+gbFTffhOm4+ij7Zv/gGONCyMAoikUmtrzygk5RIALdevaKs?=
 =?us-ascii?Q?MBa4HDrsxseovvcehNXhd5E4vicqsdc3LDv/B2zNVllCXZTt181BTs8JXJqK?=
 =?us-ascii?Q?4ShPGeRSD6aUoOPAWOrcOmTTUMoppJzSS8EXGvnefYBGWIud1CJnuVp0IR/o?=
 =?us-ascii?Q?V0pP1hOwXv7+HKjE+wPsB2A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5369a8b4-89cf-47ff-46eb-08dda30c7cc1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:06:58.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL4Sqppc6DVtzgaYs7b4Op38sLPIeny45+mAOtYuoJSxcWzc4ZBddDk1vi0YGalenc+XuCPSsSMRQzCc5e2kiZa87GePsAAWwOzo0QhJg5FzB1vkFgnzEArHvTv4bAGL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11277

fmt_single_name() requests "ind *id" and not allow NULL for it.
But sometimes we don't need it. Allow NULL.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 67bebc339148..ecea2dddbe9a 100644
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


