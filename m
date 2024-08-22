Return-Path: <linux-arm-msm+bounces-29251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E6C95B059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D0271C22DF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B757F175D3D;
	Thu, 22 Aug 2024 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HsJf0Lev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060.outbound.protection.outlook.com [40.107.117.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC621802E;
	Thu, 22 Aug 2024 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315281; cv=fail; b=lrLzXVCInxl6v5CvhBUoC/q7jV7Lf0HX6Ik+v774w9pte0cAyd3Yo51rPQVqA7EG4L3q37vH1jvdNliofkbDMBa3JdLgEtniSXHbokPe6ncDlVnWaOob0gK/jjnxh8Z49rHzgTBxZ/sjrPzEn+9sWOQ1GLKoGyE4GbLeWf+AnZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315281; c=relaxed/simple;
	bh=+kNYS1qDpB1JQXrF9UorAUvoDL6VKko9p89X8q9h66w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=vEQVgRObp+gbZTxn0sMRp8CtARpOzQslSQ4d3QnjC0dECnLL7DbkI5zyRbg+TIfBQ9I//rc7sAigXPpkWZIabrbbweHVOZKFlFNo3DCMgTvXG3HnFC+vHRDhFkuPvutxo3Dp/aM1UbONOGoHYxqpWrPcBwzbS1N9A7Gj8IoxeJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HsJf0Lev; arc=fail smtp.client-ip=40.107.117.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xn4yBSEe+68Mz7MqLXi/XtxyFBCYuKWQqU3VB1gFQMuzIHLzoV5G9LWmetkC7DGYIbZUqRROi0SnCc6vXzyGdkM4vwloLmokAqtPIdHBe600SIkUaG+2AwVrW0Ap+7Yf/doVX3BjwYVYoqJMPmJYq1Y6TF9SONbm10Z71VnSIdTgX/evF+PpiTLWPmoVKo73dWsWIrLCBXR5wgm+htrbp3WKpM4Ddadw3Hw3sYRVb++C5GSliVRsT6tXKEiInaepvJYXBdoOWDnohVLXYrnSs4uwhbtIfWAON9G00KKLeT5D4hDBl6JuSat4BQ5PUtoIw7PV76sXGxsqMqeTNV2dCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu6n7IxUvl2LYHccg43geUSQPhqCZaluIDW0CJlfK5I=;
 b=qA50f73c8VzReJrGtFCu5B+owFIU3BubOEoIZibNbQBYAScYTkCTvSLxIn4zHVS1wlcEcEjPn6HX4zgQkjo31X2n73nG8GkVHSuI1bO1igPII9xmdUECW5drZR+rpfQctR598aq1G5ED0JBFkPPfHmppGGaSyB6xPU9cegDVR71kmFHMn2XgF0PenT6JeYJE1UydRya7XvGSPc6d/OP743plT4aiFHH5OrYNnkT+0qOo4IbjkOUq/pY1ChIPLFEdMJ+uNPraax0vDsaCAd+j44xgJbQUCKo+2pZHlDZOB1YMFt2KBR6kgHL/1AEKm5Ts9kL92Ao5iai2+ZuE4CHSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu6n7IxUvl2LYHccg43geUSQPhqCZaluIDW0CJlfK5I=;
 b=HsJf0LevILG0d0t8UbcZNT/EIypqFdVPNBOFUFfFzeFd5GES5diWJEDL/OJRauGWuq2ULHz0o0+rapW6MxWCEkiC++LxYbGTe7MFYoCGw4wAiSmycF/UUXkbAAk4TL9JqB4XEr0w+/ZY8h3WpCebAi479TMtfviIa3uBHCr0cODKyohK/IynmRIR1F434R4+O9d4gzMNmjbvUEvGcm6SG10q+8QNrGUANMCY7Avur2lvJQ5qgesGEilp1ajcHz04Yifysf9WmyybEHVlMLgkKSosbnXRUBo9NpSL43XaR0m8JMxmyUDmq/sNt1H+fBNzNnuUG420D+rHhLgl8dGOcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:27:56 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:27:56 +0000
From: Yangtao Li <frank.li@vivo.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	frank.li@vivo.com,
	konrad.dybcio@linaro.org,
	liubo03@inspur.com,
	robh@kernel.org,
	yuvaraj.cd@gmail.com,
	ks.giri@samsung.com,
	vasanth.a@samsung.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/4] phy: convert to devm_clk_get_*()
Date: Thu, 22 Aug 2024 02:42:42 -0600
Message-Id: <20240822084245.1594474-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7cf16e-63d8-4919-d279-08dcc2845302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oYzT+QK1BqT53wISAVIH9gE9KeI/cynJVQTyd7RHBNZMQ9r3R/Cvj98OdLFA?=
 =?us-ascii?Q?NcGx02Nk2b5ATNSPy7Jes6GtsENN47g9bsMMADSY1TUqJTcgKcC/5eAO3Y1o?=
 =?us-ascii?Q?WaSQ4/cRiiXz2CnSIo0qQQM1YwL5j7UxwZcT4/MXmEjr6VUBp+CG0kBn6fsr?=
 =?us-ascii?Q?rP3NpAOVIk+/mBghFw/3zL1DSWqdp26ZNH1f0Kk8B4YdSF2wPujKiX3fT4D5?=
 =?us-ascii?Q?CzMEB5maUscehMKXkTuffQRtEJBsvNKev2nN4UOSSTEmkL7mFWhLY2e230dC?=
 =?us-ascii?Q?By+hnkHZLRf4P0EZtnb3JlYeZjY6LBO5h3Z5BklKnr8Ruaj2V9nO/hKPjnrB?=
 =?us-ascii?Q?bg04urkW6yZCnQsXfxeIQfyy5ZUBmPxrs/RbehyJyWaH1tEhqx4WBHLzU83F?=
 =?us-ascii?Q?2erjWCxdeLloHH4N25offDW87Cffwur0Ekebf4EeL69t1+qSR+zA9hp9LI/9?=
 =?us-ascii?Q?29Sa0IH0nYM5OBOX02KnD1gCGQwe7oU6TLsiQy6mFOGZ8nA5KJ0t9hdRXMHf?=
 =?us-ascii?Q?jRVwMKhin42TTOxXCFiJigA9Q8U9r9svSskXdE7MUmgtQ0MFG3AB2GycYF4y?=
 =?us-ascii?Q?seAAnAg7O9v+TJCrWKf6CXAS5E/aKQHaXR76RMao20jsSrRavfOY7517KLRQ?=
 =?us-ascii?Q?w0TPiLVUZDu6A5h894mr6OXosleSNJiS9op+JQOeStG95vJz3i/wINSgSmSl?=
 =?us-ascii?Q?A0ATdj6HR7qJjV3cErR/Ybf7qfNqXa2iJ+kzkwMG2/wjZUZNkNOuxwREayL5?=
 =?us-ascii?Q?OnhfGrDqb77brB2kHR6LzQhrW7sBMWtGO0HlcnnAduF3FMYwLB+0zvUaHSK+?=
 =?us-ascii?Q?83Ak5gfDd1uArjDtdp7PI3X13PHYJMtBsWDIytIkshmFULp68ZRYoGgs21qj?=
 =?us-ascii?Q?iCzlxg78/AkeUSNQnlVgvmrzhOIk3tFA96bV2vuuEoWvvDzu4gM70lmBp1LS?=
 =?us-ascii?Q?DnpA/jC+uejpKunf5tH24S+B6FcifPZ5hNA6YwtfsKwTH1HG/Q4lg3wt6CKi?=
 =?us-ascii?Q?amwI2Aw0CSlVBTOhPLZ9mpVvSTWjMUCQv8evDpejQiVNMHpVovB2Ko+YuT5V?=
 =?us-ascii?Q?l2sg/765Uv98x1nVA8V9zs2n948OoqB9CoJVA5eBnV7brxQdO8to63MMHEpW?=
 =?us-ascii?Q?RElo3yHnqzin2AJXpBCIV9sCfCLN9DBDu/6JKK+ArydVoRMdx1GESef+006r?=
 =?us-ascii?Q?1AzOOfd9muhieBKtz9tQ4XDxLB1U0XqPB8+R3f6vaO1lldTpS4C2bSsRisGM?=
 =?us-ascii?Q?oNwMWeBWkhIN9r1QEWL7viYLI1J0pN9XQk5I9b6iu6heND5x95biU7uJD9md?=
 =?us-ascii?Q?Qxj7XURAwGncle151raRi4YVvUXD500FmACGqAxe5NkVATSI/4XyfM+/+zZB?=
 =?us-ascii?Q?inEAV6KwFOBXigWCVw35jUQQaIFud1vLmZuXWd8V5vD7cMxPSQg5v15H0J3l?=
 =?us-ascii?Q?cZwoKaagg0w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fMkAaMGfWmUCZivMSma4XIDyFtjAnAq10akxxHoTaEoqwUWoc2KuL8IuWvVa?=
 =?us-ascii?Q?yQgcpQ8j/0hOMgaX9TBvE8WGdCV0l3F4AyeoGYIs5kGIs/tvfYwiRh0pRYFy?=
 =?us-ascii?Q?Lt/xHRWNHCAyJ7NlQJNnSy6WVjB4XNHAavZTiCkPpV2lRRgZ764cWp3M76eC?=
 =?us-ascii?Q?CjfyULYyvwrYK0N96G0l6o4LydgDvItnddf9+wCtrVBXUNFmbFvWtDkESjXp?=
 =?us-ascii?Q?YE9SFP9qJBaB7kkwTbpy+XQCVLovn4U094XvQjVYZIqc1SchS4qrAPLnPGd3?=
 =?us-ascii?Q?lG2YORRmgRVFU6kyPEH88v2tSeXES/u5KKwHhtT2Pvan6RsfCgS5n80QMd1N?=
 =?us-ascii?Q?tSxqvUF1nHzF6YstGUYZz33Hj6I3AIeQFwBdrF4Tr8cFOOItp7MR+CE3sbmC?=
 =?us-ascii?Q?fKbpu7ueFslJzB2rvOzTtzAGbrzOwWq2nRcPkuBBvK2/PaAnt5iCT/fvTUDg?=
 =?us-ascii?Q?6zvXQQKWpaYGtoQmW9nDkFMLKk03cv0n8fW8bvexffIOwTTbT82ILQvRh2O5?=
 =?us-ascii?Q?v2gPRGf91XMHmBAyXlwC0iqugeu409cpwYX7/XCgzMtsnllpkstbFNB+V9p2?=
 =?us-ascii?Q?BofQaFsMRdjE01npWfYCJHNCCyXwfGRSOEgCsmoANaXe8NYzY3sa2xmWcIEn?=
 =?us-ascii?Q?kIQQnqersBiMupi4LhoS+O1VvDOrbs9dNpchKP2pJgCuIq+xKrw27hjRhZZ+?=
 =?us-ascii?Q?ga73O/T7VyGyq/d7WWgStsmjo0B8tQaplx9njsgaZbOoBEd2HTaZ74CIUTgV?=
 =?us-ascii?Q?AXfgORB3pCYj+B9I5FHjom8zdS2IuhEp2KzWtuDR+6bWZjX6MU2NUaRPvFIJ?=
 =?us-ascii?Q?TKvMjQPsOlFC7bDIUTAX5sT02gLX8R1QQEL8GihQvqx1ipKjWbu0Z7WBUwAI?=
 =?us-ascii?Q?bsBDj+tFN0CUOUiRCfk7VEYB6FFUv/W2Urp71srmBMcUjOhowAyXNO80geEy?=
 =?us-ascii?Q?BZ0Mk2Oh7brvVL2wSTOCvh3N50MfcVDBO6LGm7rGwU1TH7KfQ/1BxoUcRUga?=
 =?us-ascii?Q?iWK7VW7hHdJKZ4O7esU+ONeRXGcLyk1KfNuRfgwIR/kyHSqIHqcKZ3gWcLrv?=
 =?us-ascii?Q?tq/wV/zC44VXkq0SuAvKdMq0jH25T2OjY+EthwLlWP0aUbExq41S5x2mn2Fi?=
 =?us-ascii?Q?fUb9K87OVrlWJp6+LBFeJeIAtPXGtOYhqXnUlFYd5Z89ZV9kQEiuHCHwAbt8?=
 =?us-ascii?Q?O+g4rsPC49oW/NKOJk1bCvwc44xTe843U8STlyS8JV4LdbXd3kG/dHrGw97O?=
 =?us-ascii?Q?NQj1NAvIyXVu8NWk8+fnTJ46t7a0zFTimtr0e/FGDW2vqwcncjLxt28Yh5OA?=
 =?us-ascii?Q?EiwWkMXscF31uJtWSi8DIIihulEq+rG87YDbki38UZkWn2kCRNVUxxz4dW+m?=
 =?us-ascii?Q?vY6wu/yCtS/sg1uUwDGZZQhXgNKMLGBnMhDxDfK8ulvVmG1H/QZrBvFnMGtB?=
 =?us-ascii?Q?QLLafWfLCucceSOH3g6FpwxIzpq0GLwlr5Gkxy4jkA4hfln98s6UjN+2ocvf?=
 =?us-ascii?Q?agCaXCQLD0ZsDXgZ+Hkywop8Ippxaj8Q5FU+pFIJwyTDqhwVdutvMOzUS5Oe?=
 =?us-ascii?Q?5hQ8zPA/uBozSikNODmNatcrpSeXv4p0Nyp9kSVT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7cf16e-63d8-4919-d279-08dcc2845302
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:27:56.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OKrm1o0W9FuAc7qSgxMsLLrQIFV+6LC30Im8ma877YOQ1jq3NascZGg+078szkhlEL85WR5U5Df3sq51iRNKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

This patchset simplify code w/ devm_clk_get_*() API.

Yangtao Li (4):
  phy: ti: phy-dm816x-usb: Convert to devm_clk_get_prepared()
  phy: qualcomm: phy-qcom-apq8064-sata: Convert to
    devm_clk_get_enabled()
  phy: qualcomm: phy-qcom-ipq806x-sata: Convert to
    devm_clk_get_enabled()
  phy: samsung: exynos5250-sata: fix missing clock disable in remove
    path

 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 22 ++++----------------
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c | 22 ++++----------------
 drivers/phy/samsung/phy-exynos5250-sata.c    | 20 ++++++------------
 drivers/phy/ti/phy-dm816x-usb.c              |  7 +------
 4 files changed, 15 insertions(+), 56 deletions(-)

-- 
2.39.0


