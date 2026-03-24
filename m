Return-Path: <linux-arm-msm+bounces-99571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKwVOttCwmmCagQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:52:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23B304312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6453E3008605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675E359A9B;
	Tue, 24 Mar 2026 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="qm+U13xh";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="b5bbPyo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3D353EF3;
	Tue, 24 Mar 2026 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338673; cv=fail; b=SiCGzUKjFKoCLvORkAYM2LwxPxxxi2R5pqFR48IATYwXFbs/dm9iOBKF7px8xMXjPtiMa76eok6V59qKor4m6OYANeI27UQp+xO4jjOTu5MeVJKRK0SlkAmLO4Tk5jsnCU/G+kX6+YU5qIpPb7YDNsoZ8amVHaIrHB1GgqAXPVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338673; c=relaxed/simple;
	bh=CYyeZo7K9xH9YK/ojDVM7QUoAg+dG22/2Gv1+gQS0aA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=ZY5GA+txCyf16EzOmmytypW0YU4tzLBy4PU25EA/aYm402XHT5poSMfqFPQEhbSLWWZ06+fboIsdQWBmt2Ye3zPFBX0OMFnjd56dnONDKx7W/LwPMQus7yCIING237Q69QOfGhy0YMXOa7VFn2hjbCRyehPozLp8OcY2fy8ZOao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=qm+U13xh; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=b5bbPyo7; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O5s4Cb2902066;
	Tue, 24 Mar 2026 08:50:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=+gaV18fD5ZrH/OnvFt/NDa
	4X6RVEMoJvbC92DhYjf7o=; b=qm+U13xh6InFJwhVlxCyx0NrROgYyvg2l2vsHt
	kFFFxX0C74Tog+zPiWCErx5kRntPU2BAa3lpNj9nSCDM2YsiAccBPTyzAX/IicnZ
	jBSaC3HNp8JouD0RDOubgcawpKvj3f1wl7VArTQpm3RDdPfpeiZk4wINyYD+oN/T
	Nt6xUF5bLkHIqr7VOnJMM61pJm//SC+PL9DP+Hm8xygeW+ob4vMzjh3G8TsnjZJO
	Bf3CUW5sP59wIXNL84RKcHwWTD9SQIs+UHz0cFQFghzQztq0byzpu8ix73Bw1w4B
	2MATgCAzDAcRaCe5NXzsd906Om3ECx+f3mGhc0j0oeWPyOhw==
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11023086.outbound.protection.outlook.com [40.107.162.86])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4d2p699dha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 08:50:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPazea7Wyt83bq5C2RQ2TAagZCa+xzZDjkYuMS/g98YGZdUwRncPf1/F4mRDHq2NquMcBHOA5zQ5St/a5EoSURH+xOY+J23pkl+fRlyOJFyty9tc7l8Eg1CQeHnFwR3okF+sbdJ1XEHJ1YBzAcIU3s5H8WAoE9AofywN3D1txMsqJuyZ/7P/rqEakrkxDkLGAPA2Tmb4jxshm4SNJkGFzHgX3mk0dtFACM7ZAXwhi5FjuoPQvhF4eVD4K54H3Db4fQ+0YB/+nnrhpp8ENVB0N7K+Vq9fhHZ9v7P6G09ChzdosRm9gzi3iqi7stTv5m8mi5S5ixzIyhGvBb8YQoxGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gaV18fD5ZrH/OnvFt/NDa4X6RVEMoJvbC92DhYjf7o=;
 b=BA+XgY7vYxbf6o0IgGt9ms8D1rJe9AromYqsTKFUhw7m9nWoNViDYmFTPk27BJh27PqJmVFBJK1KCnQ/UolsRt80vBPz6tr/7pTy+yWP1f6/3fAP95wSCEocvpohJkFEB4Rci7B4oRq6U6BNKAtnIN0ihR9SLduCnOeVfnDV/DwwpstYf+rERWepXsgaeU8G4wK1+BbGam5Dg8zoh1aCKQsR++Ep3ExEhHzKi5L0MN3wt/AFEQ8ZiDRuivTWcleArfNQlZXEuP5OQnhuTUwQvV416X+Le+EyAv8G9oGoioxNPs+y+9iFNAgG87gIalTNPfF3DpZjROb9918T/yjVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gaV18fD5ZrH/OnvFt/NDa4X6RVEMoJvbC92DhYjf7o=;
 b=b5bbPyo7migcQI6yyjtnK2e50EsjsDL9BYKy2pRwcIRN7q6xyr/oh0PI1dSHEEiFD6fLU8zNrQhw3FzGBz6ywisTAL2TcMsVLaKA+uAB34hAJ08hT16JRI0ow8tySmiB1+YmxXGmla5inHMD65LsROEbqcg9CjbB8kPY9dVDUag=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by GVXP192MB1663.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 07:50:47 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 07:50:47 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Tue, 24 Mar 2026 08:50:33 +0100
Subject: [PATCH net v2] net: qrtr: fix endian handling of confirm_rx field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com>
X-B4-Tracking: v=1; b=H4sIAEhCwmkC/x2NwQrCQAwFf6XkbKCkdUV/RaR0u681B7OaLVIo/
 XcXjwPDzE4Frih0a3ZyfLVotgpyamh6jraANVUmaSW0nfQce/746jzrxlO2Wf01+MbZOOrCsKS
 jMSDxGrpLknCmmno7qv/f3Mmw0uM4fuy+QON7AAAA
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: GV3P280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::30) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|GVXP192MB1663:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f31f79-e1a3-4507-12da-08de897a0fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OGjlC/QJZ/WFqMJR0+33iNNqzjxBR81SvDbTb7YL2Hgq9qwz7sJfzSKcHKvUMbIVrGGzXYurq1c7h6aB/ivFC5S2mWAaa7eNSnYz0FrWRg6CbJWsm3UUp3PtNsb8jfAO7zRHfM4nnNk0KjJcmOePUlglSL5zfOI71x0A3SdOpCqItzZ/ksM62+aQXPhX2s4ZnyQjzuUlLuyr5PNvlfItLVeClEznOpDqS6HY9wmmn6TvpqiDrLL1J3TiQHFMG2sUEcB515zYmRqZPecDTRyBid0C5hJXd21J8qOPOcUMgF6qtd4RzVooch/eESGoVdQm6TVGgJH08MIOQVy+IB4d078fnbPNsM+DiWvQvkOLlnaEgIdIiPmATlgq/PnKq5rabIdTJ5bVi8WtfH0Qx8JkrSf/BcPkel+cFlc+F3BJoDhPjMe8N3R6upqcLnTRdPjrj9k8NghXxBO9V9GhzVZ+JIBDtkpTY3UHMEmiWoFWiAqzyQQQ3516kK6Jjz1khP7JFSv2UEvC1lGVhbByne8XaTRAzvnoeB7EbxPAeV1GT3CHIT9SvANxQqE9RftVZHvwIT9dCQGnbsAXrHt6eoOahJ9luzEq+om2lAdnNYv+OHiUX1YT2QWoZZMUkFHe9laXEthGB2rKPEQ9fNtofK8Ki2I6IdFksdas27vfNuYrG/t4WSxPJS547smNWaLpkRCCUWcSOrurc5sqaCvADMi/TEmobSuxP3iSf+Ox+gOyrak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0xXcVlwUXZTWFNrWVgxUFBRSHZaWHBJdWlMZ0F6Ly9TZStybUdUTlF0VEpx?=
 =?utf-8?B?cExuMmhLckNRSENHZ2xvazNzVEtTNzZ3a2RJa0kyWm1sdnhuL0hHMGd2UlRV?=
 =?utf-8?B?WHVaUi9ISWFJMlBsaU1jMW5QOFlGUW1SYWdNY2ZEUUJiSHg3MzNkSXp1Zmto?=
 =?utf-8?B?MDRHU0dvMUN4Y1ZjazYrM0dRQWxXbGlFL3JLb1BURUdVU0hMNllZbnY0bWVC?=
 =?utf-8?B?Z2p5LzJvWnIxMFQyY2oxZ0thTERCRVU2d1RwTmhyUmt1ZGtkSlRsK0hpNnFG?=
 =?utf-8?B?Smd1eW9zeGh5bGVUR0liOEFnQ2RNekNYYXdFOVdZckNkMjhSSXQ0UG51MUgw?=
 =?utf-8?B?dkZiU0lIQ2ZIZXlVYnRkcHBYVEVCdGltc3dabDJia1NnQ0IxRWNEZk1WTEpQ?=
 =?utf-8?B?RXJ6Q3NPR3lsalp2Uk9HcTNTN0Zab0MrVU5hdkE5ZzdKbVhVY2dtQ2NFU1VL?=
 =?utf-8?B?ZkliSHJyd2FiUDJRNTFaMEJaRjNwdnZtaCtRWTRvWkJCR1lpem94cVpLamwx?=
 =?utf-8?B?NTV0c3RHN1cvRU1YN3ViWEhNbDZLcGRHckY5RlJqL2x0b21pNEJVVmREME9D?=
 =?utf-8?B?cXF5ZlgxcXZhSWNrMytwd080NVRZYy9pdEhLOVUzb0VjQ0FyK3k2TjRRT3RE?=
 =?utf-8?B?aEFNc0pwMUNSTFlZczJDaHBjKzNxcVpWSENyR21aaDJDQ1BTL2taa1NKU3Az?=
 =?utf-8?B?U1hTenJzdEllRStOTkpmS1VNN2ZYV09oR05sSTFrNDlVTVlPM1o3L1V5d01C?=
 =?utf-8?B?SWlnRkNGZ1o5YnpFN1phOEVNdExxcVRid1JBN1NQY2hRb0M2d2lIbjIvM0s5?=
 =?utf-8?B?ZmJ0d1NuaDAzaFlYWjJzTjFDdGpYZWpsTTQzaXZ2Y25RcENHV1lOMnZZaEhv?=
 =?utf-8?B?VWc3TjAzbm9kWWswL2U1aFhIMEJteWYwQ3hXT1BTMGgzTUdwUjJVdjBYazJ2?=
 =?utf-8?B?TTdud3p4QXhNd2F2MkhvTms2SXM4SW1hUjZ5TTlsTUwwRGNpbERhbEc3SkZT?=
 =?utf-8?B?V3pMdUF4N3k5aC9ob1EramhiOE8xMjl6Sjd4a2V6TVFmclVONHFZMExhc1VV?=
 =?utf-8?B?ZENpVHpLbjhnTHZjRVpxUUNua0xYUy9LcUxTZ3Jud2plcVpyQjQ2OHZwS1NP?=
 =?utf-8?B?d2xDUStWVllWY0NLSjk1aHFGSCtCQWNJMjBEdGJTVzhsUmM1L1JqZ05jNW9t?=
 =?utf-8?B?K1J0eUxFMVRLRlpjdW42TjR3cW1LMUYxWW00eDRTaXJoUi9DQVZjSUcrYlBl?=
 =?utf-8?B?dzdIS2pNTTdSTmdMYkxJdG5ORXFtS1R4Q3ZSR0Z5SEZRRHFkVWdKVXNLRm1T?=
 =?utf-8?B?M0VWZENuVWVkczFBSUkrTTlYZ1hib3N5aVlZRmxiVE50ODEvemN1TjRObXVV?=
 =?utf-8?B?ZDFRMkFSSjgyK1VRMmpaMmlPbjYvaGVzK3lwcWJnalIwVVVEUURwOW9LcE96?=
 =?utf-8?B?QzNGd1VScG9tZFRCUTlaTzMrRW90dXFlOWdUdDNYc3FZVUdKZi9MeXUvd011?=
 =?utf-8?B?MEJSSlF1TWlLaGxjTU1tTlZndU82NEd4L0lrR0hEMmFkcFg1TGZsMGErSXUr?=
 =?utf-8?B?RW5id1hiU29sdjB4WUlLZEJPS3NlcjlZSHJ1amxpZ3pxazJEVUhjVUdGUFNh?=
 =?utf-8?B?SzVzK0hwL0U5eWNKOUZwSU45TXlESHozM0E1bkZVbTZPeitGZ1l0Rmhlamxa?=
 =?utf-8?B?b1g3ZnR1U2FFRFJSYlFDM1I5UUhINkNDZ0FIUTFSTHpZTklIMTZ0NDJ5VEhz?=
 =?utf-8?B?M3ozVmtKcGo5dzY0QkRqMGVqV3pQMjZReEJnam5XVEUxdWVPTFU0eGlUOStx?=
 =?utf-8?B?VEozci94eWJmeG82ZkNWTEhON2NlTG1tQ3kveXpSQ1V3TkNqTHpKdVRWMzlk?=
 =?utf-8?B?OU1hdnlBb1BBc1o4UWVqWDNpclcwc3Y1b3IrY2p4NXdsdzZZOURDYUJxcDNi?=
 =?utf-8?B?ems5aklwRE1Vejg0ckZUTFluRHFuT3RDbjBrdE1Ed1NrakpSeERaeWVEZDRB?=
 =?utf-8?B?bVEvWXZ3bWZmUDQrR1Zzc2pTR0hSdHVmcDg4amRuVW5ZbTZnOFArdS9GTEFo?=
 =?utf-8?B?blI1Mzd6Nnl2V0d2Z3hzanJqZTVZaGdKeXpLZjBlOWMwYnAwSEI5eURPemZK?=
 =?utf-8?B?eEZlaEEwb00wT09xUExaYkZmRWJKNXpsbDBURTNBQmlHNUVtSEhhNGJxblFt?=
 =?utf-8?B?YmxvaDgzU0REeWEvSk82dnpsWlYvck9SQlNidFl2V0ZVVS9xYW00UUdZY2xO?=
 =?utf-8?B?a29PLzhnb3lhQTBpZHd6Qlo4WSs4bjVUSmlNMFlFUFZvZWtEaGcvTjNMaGEx?=
 =?utf-8?B?VXp2TnZ4Y1dEcHZBL1pHL3BET2xNQ3JFdGU3N3l4TytOVTd6Wk5tQT09?=
X-Exchange-RoutingPolicyChecked:
	PsyWYTQso/JZv5lu+7GLEV9I2V9vAgaojpXv3FhSLBCvvdneoybLLuHqLGoFwx1vZTQ3BfLdl7fOmSb7HRCZqD0S07ACs3ygX6u4u9Lc7vlxgOoYPKUvX73vJO0DjDlbwjzr0foaKPsOPp9bMeI64SXPgwQfTSiV0RcTLZJX3OVpJfvDqQFUDoEsbFXd3J/JEbLSNW11WdbMK/ynrlvLvNoTSlE9w/EL1E5uMRO6iWeQQsfokDl6k9zFZyNI+lkRhnVC5qTBg0StkAZgUDFMRGgCziM1VAkpObcJNyjniIJCb5ZY2j8QqkrDGpXysyG8VZQZopIl/b4FH12LB0Dogg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WMvA8X14m1fUFVfh0EQ2Un0vsaK97SQjCeBO4wzpG/StSOnVJqKWtznzvQ3pgDFHaJGEOS0GnP647BGAgM96ty0BV4tLmoFiXOqI1JNdAPlEAFIH1Cr1BioWvtlbRMouWNY0tSzi/7fsTJ3WDA5R1k+16287MynazLs5h8ZQ91f+09qX+ELslYZpvdTrWcyyFRy+4qketxG5fD87oPyMCcySoAv8PFEY7lcHEfqhBqNLy9pH8OOdbCNymCt62wTCe5lMUK6UdMA/biwCKu+rQWmVKn/PmRZ6zIcIpaqPioHoN8pBVFHOn98bhCZ8Y+gibbyLZTehGYirPOn4slcNE+zwDvppDckLLaJxLBPezB/GWmKxCf//qN819YxiK4HC9+9mDsWXKMSZJs0BNgzqdFiySiiTu0mmZf2zrbR+0wnz0ghRWesPFlwpFo6aUAFiYdfFeK15ij96AexNfSLqRmGZ6SRrFD8O/98xaTgPI2mBJeOh3zumC4X3YzCD4cuPGIBnmBlB+5JWD1eL1x56qzOZ7u6OPKd1qyFKdC+HXSw2CnnPTL5cewtb4PirEgQRBUZkX2mMcj5o90GG5h6d6KKaVsBXl8ZZ1SQlkik+AUHuENuFcGsVUy3AHGjtzjTZ
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f31f79-e1a3-4507-12da-08de897a0fa7
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 07:50:47.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5yys5Ya5WBxba6Zx0bx1FbCd+DBeUFWhOyIrXeFkOUe2DCK08CnCB94Tfl8hNBD/cJ0lqPgGLSap0TC6LjgJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB1663
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GVXP192MB1663.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: q1AmKHBOzs3h0g2pfBxi4KE_2mmIXx5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2MiBTYWx0ZWRfXzG9/r81H2abj
 w8syXCdyK70w5Wf4EMyNQ5QVnomif+8YiciPTm8PyaVucOqArcQQUhn2Cs1ASqntHQOv65vg8RC
 J8vjiMfycPgVEyxUTUQfsm41+1hTUqp03BarrzBCMpPJZMXZIL6rTRfsENIGrb66ExwLV60fJv5
 UlOl5r57Qw7qrCFvfICkP6F4OyZIlGEspqtN0TH+6GhR9aX2qXi6Sb05qxr7IOHhBS3JdLQMvVJ
 L1yH42w18OtITzdrveKHuTzZ0WMZZ7cdN58ZXuBCYoeOVH4wqkePbWDBwqJ4ZwDzwMtGc+E268o
 zQt3vmmOaLmRMCarLB78X6ZfER4saD1andK4RgYhQsGIodF5cD3WOYpIOJkFKC3T+WBxPq8Vpft
 1EeG+45VAQ3A4r5dQP8ntidtk2zv14BCu3DrLbLqg3jTcIoLzUPvMuHdWKIIqF3UUVWzKgtUEHX
 J2KB/zQoiqpJze9DIzg==
X-Authority-Analysis: v=2.4 cv=K9Iv3iWI c=1 sm=1 tr=0 ts=69c2425c cx=c_pps
 a=vE3suJD4kV91rQmqWLzSCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=L7kWeJsKDjS4hqY5cmwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: q1AmKHBOzs3h0g2pfBxi4KE_2mmIXx5L
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99571-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,westermo.com:dkim,westermo.com:email,westermo.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE23B304312
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert confirm_rx to little endian when enqueueing and convert it back on
receive. This fixes control flow on big endian hosts, little endian is
unaffected.

On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
in native endianness, so the conversion isn’t strictly required here, but
it is kept for consistency and clarity.

Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
Changes in v2:
- Rebase on latest net tree
- Improve commit message
- Link to v1: https://lore.kernel.org/r/20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com
---
 net/qrtr/af_qrtr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 55fd2dd37588..bea1f1720e7f 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -365,7 +365,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	}
 
 	hdr->size = cpu_to_le32(len);
-	hdr->confirm_rx = !!confirm_rx;
+	hdr->confirm_rx = cpu_to_le32(!!confirm_rx);
 
 	rc = skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));
 
@@ -466,7 +466,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		cb->type = le32_to_cpu(v1->type);
 		cb->src_node = le32_to_cpu(v1->src_node_id);
 		cb->src_port = le32_to_cpu(v1->src_port_id);
-		cb->confirm_rx = !!v1->confirm_rx;
+		cb->confirm_rx = !!le32_to_cpu(v1->confirm_rx);
 		cb->dst_node = le32_to_cpu(v1->dst_node_id);
 		cb->dst_port = le32_to_cpu(v1->dst_port_id);
 

---
base-commit: 70b439bf06f6a12e491f827fa81a9887a11501f9
change-id: 20260324-b4-qrtr-fix-confirm_rx-on-big-endian-ee2b9637d265

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>


