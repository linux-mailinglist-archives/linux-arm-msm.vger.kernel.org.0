Return-Path: <linux-arm-msm+bounces-29334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F334E95C703
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C1331F21935
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 07:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2914913C9B3;
	Fri, 23 Aug 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="JOQy9DnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2059.outbound.protection.outlook.com [40.107.117.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5451D28DC3;
	Fri, 23 Aug 2024 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399687; cv=fail; b=BgSofClT2HEDSAV+j+h2G3uNBcmaF/FoSZEItd7zry2GBH9tM704q58NnN4fnRFJaZxO9gp66Fxgvd/wCr2D4L+TFeJag2AgcldlmLK3DeYkHkKsYDZrn7JaCexdkC42MnuLgsBPPQgzpteabiVXcSCBG6I9ZxgiqaTI4besp1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399687; c=relaxed/simple;
	bh=OpkDP8iOm2UCfdoEa1Ii7UlWLVXfgLyYn8iUqXpGrRk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eL3Shm2ClrAJMI/674GMM73c0NgByPzLSHpKh9n3JstzFSPj5awhP/Jd/alPMopehbfqr3bYVhPELc2iIccbz4Jc7MXsQr4ZNK+1j8OQLwhWMy2bN+NUC1VvxIXtLuANZ/mo0sSmiFHNt6bAONiSvk7fH/oirW+BsPDZERcNRBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=JOQy9DnS; arc=fail smtp.client-ip=40.107.117.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7HmNV3KWsYD8DBmgN/cw9ZTzD5NBBm/j/xUWEtukpscJsAfvSELSqcHDmvyJxAPHTQQRvhwXeM14w/7/L9fDRFCBiQ+GJu1L20Ep+vwC5swr+aporER/D0MuGB+pKKkofuzsM4cTxCk0RzPobOI5R7Oj3J1nizCBVQqg70B6ZekRUVROdvdrNBvMJzlawmdn5f1E6j3yVKNRmVIFbgz0rQ0SknzHLpcnDuKjxs7xutSoXBS9+svT56jIp6yjynpy0bE2TgHoKIy0j1V+RSZE/FyvkpNCSio1mcACzYXS7RmjyFVYNK1DNq1lHUgrWIkkYWdtYqWQ6Hk+be+9WaJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HUA9Rh9awtogemMnI7dYT8dTbpTFgKgR3AP77HpSYM=;
 b=XzfpNJWErE2xbJ5PnOFUWOrxqDQFTlgcyBw4kOVmU9H5wueD8mWSzJ1rdn1x4ABzwx1/8/ZbL4lsAddIJ4FUrMX9mi4DMQL4QU5zrAA/zmTwLV4EttiPH2k4fiTrgj6HfFiZB1Hxr4BXeziHg3f5vMgcgRgMwhNA3leZ7k221rTKrAK46iRMYWZesoDk/caJIa2jmpTjmFOirxdmy6DPtVqxTt749iI8bOtXSL7ZnWBOLTWS62ovrXOpJ635rCZ51lK5U5O/q4UvDKeo2Qo6pYaQhf5VtcuYbvcMgxvQIQpLpWrP2OT0rBcHNXsz3xC9/ToJ4O9AI+Kc+mYBGidpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HUA9Rh9awtogemMnI7dYT8dTbpTFgKgR3AP77HpSYM=;
 b=JOQy9DnSeLSlulE7znV/NRnxTW4prBKGCj2TqlyUAuSOgsns/fzBPL7nCEBg0Jldfu/Ki1x52lU7tvFL42LyOn7JTjcyESu1a1Tubq1+6CzqLrANnxHbuOh4OZ3FWtv3RTVWsAiG0Qh6/wr7/6wpCZ8PaxPBTE3FkwqaQy0kO/rFcnH3XSSokel0VrppLtZc3K+axdPy2uTTW/5ISf/fqG9FVYUr7DVdCJJuMwB9/5HT6LUDC8c+XiW8wfQSQfN4V5/NqryM+xM8NO4S4w2AVctis/qqKi5r8erh7LF8QN3HcJdN3DfEGjYfYvOgYV0sxj/IVyCgg0npcRQE0mXkUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6459.apcprd06.prod.outlook.com (2603:1096:101:186::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 07:54:42 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 07:54:41 +0000
From: Wu Bo <bo.wu@vivo.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Wu Bo <wubo.oduw@gmail.com>,
	Wu Bo <bo.wu@vivo.com>
Subject: [PATCH] bus: qcom-ebi2: change to use devm_clk_get_enabled() helpers
Date: Fri, 23 Aug 2024 02:09:39 -0600
Message-Id: <20240823080939.2084108-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: f91ce90c-de91-4bf2-dfa4-08dcc348d7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PT1lZWUXkSntXUIAOydFDAmCfUYhX1RwqobIjt02h9tMhflNisr50xjW5UyQ?=
 =?us-ascii?Q?An9aUxYVKOxfI+xprDg9kY0Uag3Xs4yImgbaoP4q3H9VmStTxf8vkBtMLDlB?=
 =?us-ascii?Q?R5fHnpmq60bCHyoFAMQ1oQTvQrN/lWK9H9tzRAIm9TDs4hZLC85vEdGCRAf4?=
 =?us-ascii?Q?u1oio3yIq1ss4/RgjIcPdDVxVw3BhwHUmgct+nlFJZqfxRZknhG2Y3mhL1UI?=
 =?us-ascii?Q?g+FslBbKtLMd50empHhEBGoc2BHDk+IWbWR8qKQeI581cCR0HEFtxWy/HhpL?=
 =?us-ascii?Q?MUW9/0QAi4nTPex+DeHoDe8+7yaVi8gLeooYkCyCViMT15YXG4k1i+Tz4C6q?=
 =?us-ascii?Q?puKgi+Zh5D5j3BpyQQOrHQmX3/CXhxlz/EAxlrOvds4IZnoq8CoBRhSVjpDY?=
 =?us-ascii?Q?eiRehxlaRL47472/n6P/+1nhEjJGcbdym0zK3mmmmHbxDczfRMrTL5VuNGnt?=
 =?us-ascii?Q?T5c1Dn5354r/I+N4Ei3ppfn25GuMj8fSLL1ESYjyqRbDzMJYjsJvWnqDamWh?=
 =?us-ascii?Q?VJpzUCx7LdTABP4N6702i72UwL67N9AI04uoyctOvDjEqukiD+aaUnVfa4eY?=
 =?us-ascii?Q?kPFdQYNiz+WEtooqqYMFg4bHgzgCLLqEMvkx5256LjaRQOsRygfFvjkWa8B8?=
 =?us-ascii?Q?GwkWqqZPSPZTJy15cDxN67h9QvmVM5RbhfkV9Icr9qn2XQrw/7+vyauBPUv5?=
 =?us-ascii?Q?bpfsNaH17GS7T6sVFNspj/62pl7LltCjOumw4qVlL383F7HKx0G5EHdPuNVI?=
 =?us-ascii?Q?hSocjJduqiQNiyH5SgDgpR6cGV6N63p7Ubli8bnIiNltHBKjbJvHHhzIRHCp?=
 =?us-ascii?Q?mN4BJnbSplflXX+2HEipbntFP5g/ZCF3Q04+5LgKmsfsur8rJoetSOmaMEAE?=
 =?us-ascii?Q?N9xSWfUuFqoxkqPJ+gvaXEKHh7Ie3bdtfkQSqGwyODJ6NI5cj9dEf/oLkhsN?=
 =?us-ascii?Q?VYUgpAairGsIuGr6BWdWct54VMK2B9BcyEbVSuoxjXcLNMYmU5iD+2Wv3xAU?=
 =?us-ascii?Q?FbcTLsmJ3KESiIquiTe8TVyK5oomqQaiIoAr1Jk+Fp62aKq51joEhOnQroYk?=
 =?us-ascii?Q?oG3PX7/X2YTJTzD6oMA6DmaPBLyP815fIqAFyC6/4GcZTmrrO06Opy7E6HnU?=
 =?us-ascii?Q?HwOqzaSeoLuUzSOjagFJpC++/bgAiVymiLb+N8QorlN9dBZ9VX3BCcQm5UGX?=
 =?us-ascii?Q?z52MWwZuva0xtyaAK5lrh/1rElX5QU+XroS7k0eLpH+2kXKAMtfApX8ww18b?=
 =?us-ascii?Q?oGne998LHMaOmM2AlSnbYxlt2MD0/9QdiSknd5c/Yj5yNUZ3BWFa9Se1ZY/m?=
 =?us-ascii?Q?zYm7HqCFtN16TLPbyLmGCXU8/qJdHfKxEUwIynVZwwG0QEUOp3/eGdCg6KsR?=
 =?us-ascii?Q?4wZohxTbWyWFjtDkqsKtQTMudWqz1vEX2ITP9gEEs6lFsOIybg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4486.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zznbNQhyCGau+imTV10ob1fRbkiIw95Sl5RxWX6rr1eA96qTt0qBodF+nh4z?=
 =?us-ascii?Q?nJ2LP0AE8zCWbzKkdnKFtEIXuoOT9C7+TMhWhB3WJ00T3r9cz86gVsI8a4iO?=
 =?us-ascii?Q?tvjL9hKqrJup49JIn4BD2OH5R0MnH+A8IJyubEe4bdDc/FGKKC8XDml+gFF4?=
 =?us-ascii?Q?A2jsHLUfLj9tMzQg90tckbfZOe/Pc392tRXe0PqSRKN7cAtymCBoP5WE2J6a?=
 =?us-ascii?Q?ibGTPPlwLzQ9APLr3j8TbXMRC16XL0RSRBSyfzkIDkqu7BOTosDwwKU0Xs7f?=
 =?us-ascii?Q?GnhFUj2GBFmYey2kvLhvElXDnm7oBc3Rv9AQXuGstRwiP7RmcdFFyl21fG4M?=
 =?us-ascii?Q?/UOCq37tbvLu7AR8CE1HwSQyVAJqx7C2PsNJ8pfnbfW39t3KOOoKI7fZA3aS?=
 =?us-ascii?Q?i8x2et7541Gl3q4J2G5HVgcJDOVQBxgkxnnL3RxP7oh6YJDxnhxwcsDafQa5?=
 =?us-ascii?Q?sc7o9YtxssQdyhrUpS6ZprJZY5uqcR5NiuIMqF2lhrOVpcQ6DR1xUg6zRoiI?=
 =?us-ascii?Q?/zO5gJuBch+Pof3MaC3KzibQZgVdUKZbN+RDd3pZvr9Qc5Kiqc8z6+a5cWx4?=
 =?us-ascii?Q?jScq6FiJ4U6snu8FVDpL6JtwB5EsLF5sVWs5Jzr14Np9BHcPc0tq9tHfYmNs?=
 =?us-ascii?Q?6GZ2lXIoW5sni6o+IDc7S3muxWCKye8iHSZdrwZFZMKeRDxEHR/ncxA97O1A?=
 =?us-ascii?Q?a49c28g5rBMU9i43DHWnFppVKwsn+g3nXSxobHbWcsksN1wJfEA5APrSNkcg?=
 =?us-ascii?Q?Mmhm/dwOtKdRV7K2RJ0A1ZBLm/BVAi9dx/yXrtk3tjFKnMozc5ZdK23J7wip?=
 =?us-ascii?Q?VNY1nvbC51uFwrQyFG99jeaxAfT88kjky5t9AnToDCV0fQ73ckbBqOQr6BaN?=
 =?us-ascii?Q?lLtCiC9BnQAJsJ8++sROLg4j3al2TI01HvhChns4DICdeBsUBjqFXoPyXjZY?=
 =?us-ascii?Q?TQJQiIi3UsJHpespnduH75nVbFF1Tz0ZVpiKLzI8IPGT6QiqC6tUdf6PA58S?=
 =?us-ascii?Q?6fw797fKfiYHhjp9dZUnnE47i7xp9GkZ9pjoHAGyjuZ71nPbGnUMPbJPhfoL?=
 =?us-ascii?Q?Xjt1X6ly25jtwJ79x4/+HwKLvD+ZszrpBusLh5FLgNH/DlfIVHqqf1+lX7TH?=
 =?us-ascii?Q?T+RTd4cB/ZX9ibGRsazBNb/BcjJtqvFIjDx3uvkPe48cZO6zBnr4Ej54gNwJ?=
 =?us-ascii?Q?SXsG3UnjUxWxEQBfhuZCWAf+fM4dffxL+/5pmIjMmXKr7+1mMq/qP3yGv4Uc?=
 =?us-ascii?Q?21w8XYb1Qa4dTRmF78h20mbXe22TPLDTi6Ji/LjE8VT3QoUkOAYxyEDIHjLd?=
 =?us-ascii?Q?ana5xqGhL0qDkJahgOKTggskswRRs7duTAM8jDc9tFXYOTgw+KKUaqO9zKVu?=
 =?us-ascii?Q?0mFHc7zrnDV395dyA+DjQUx8MFZM2A+CR/R29nW0u+kW3TZVcRIOqvv3Goel?=
 =?us-ascii?Q?wfNJOyqD8/jMwRzmgY4C6OPTOt+vBBrQlJ7O34b1+E1fJEOImh/tJU1dt/mf?=
 =?us-ascii?Q?LT2DAH8ia5MWb443kMoSxO6OsBC25G1r4fJnO0UrijxwKH+SnULlsQ7ZMdu+?=
 =?us-ascii?Q?Quy57syEI1cvEYZhpjhNiyeft9tyLAWjK2coO8q+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91ce90c-de91-4bf2-dfa4-08dcc348d7ff
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:54:41.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnelerlhqW3TzkZTJ2xbhjxWzbELZ7ZQanWD+CAHXEYtDzQweWOPuBFHWvA+tWfo7T79WuDNXNy3DxifeLZOtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6459

Make the code cleaner and avoid call clk_disable_unprepare()

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 drivers/bus/qcom-ebi2.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..a5c721f6180b 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -303,40 +303,28 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	u32 val;
 	int ret;
 
-	ebi2xclk = devm_clk_get(dev, "ebi2x");
+	ebi2xclk = devm_clk_get_enabled(dev, "ebi2x");
 	if (IS_ERR(ebi2xclk))
-		return PTR_ERR(ebi2xclk);
-
-	ret = clk_prepare_enable(ebi2xclk);
-	if (ret) {
-		dev_err(dev, "could not enable EBI2X clk (%d)\n", ret);
-		return ret;
-	}
+		return dev_err_probe(dev, PTR_ERR(ebi2xclk),
+				"could not enable EBI2X clk\n");
 
 	ebi2clk = devm_clk_get(dev, "ebi2");
-	if (IS_ERR(ebi2clk)) {
-		ret = PTR_ERR(ebi2clk);
-		goto err_disable_2x_clk;
-	}
-
-	ret = clk_prepare_enable(ebi2clk);
-	if (ret) {
-		dev_err(dev, "could not enable EBI2 clk\n");
-		goto err_disable_2x_clk;
-	}
+	if (IS_ERR(ebi2clk))
+		return dev_err_probe(dev, PTR_ERR(ebi2clk),
+				"could not enable EBI2 clk\n");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ebi2_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ebi2_base)) {
 		ret = PTR_ERR(ebi2_base);
-		goto err_disable_clk;
+		goto out;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	ebi2_xmem = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ebi2_xmem)) {
 		ret = PTR_ERR(ebi2_xmem);
-		goto err_disable_clk;
+		goto out;
 	}
 
 	/* Allegedly this turns the power save mode off */
@@ -379,11 +367,7 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 		return of_platform_default_populate(np, NULL, dev);
 	return 0;
 
-err_disable_clk:
-	clk_disable_unprepare(ebi2clk);
-err_disable_2x_clk:
-	clk_disable_unprepare(ebi2xclk);
-
+out:
 	return ret;
 }
 
-- 
2.25.1


