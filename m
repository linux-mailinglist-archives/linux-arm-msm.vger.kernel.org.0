Return-Path: <linux-arm-msm+bounces-93244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJd6GzgllWlJMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 03:34:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A15152B01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 03:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C058B304046B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 02:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067042D46A9;
	Wed, 18 Feb 2026 02:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Su3+IWbJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SooGRPdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B054CB5B;
	Wed, 18 Feb 2026 02:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771382067; cv=fail; b=t2bVqihw8ol36aUUBscJ4w7+vyvMGETIRdEzu0BlDlPaeSFXU/teRYdbegoVfQF8ME9DPks/ONo/F/9z1Eh+ee65wqMq7+ejUluW/2EEB9DSNvl4zjSaSS+rQsfYUVJUIRCKtakU86pCU4WT3XsWuQvcXOUPADMgbvAzwQ5c5yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771382067; c=relaxed/simple;
	bh=SQCNhOEEJjBM3Xom0ZZV/oIgMnne8d0+5sbO4Nd4EWM=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=ge1r+M4APiOmLVNdK+lOWfIKZmFZpbV+AfuT/lzhBFswja1CWIRi0Y+VbIccNim5tRmK8AJmyseLuSq1Oar1EpQ47a0IF7on+66hyn3Ci23Hedwc5at6LoRoo5mUGsh7FTR5QBEJUZzD2KOaUI9WCm/Zs2CW+B0/TBpmtSSGQNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Su3+IWbJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SooGRPdg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNg4E3789654;
	Wed, 18 Feb 2026 02:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ayyMn//1BJ+caFnw6/
	HfaDoAVpKyrm3mz0jIDu41ZLg=; b=Su3+IWbJi5Kho2UlKGkBdZJq0epODhOmsc
	rBhoYEjFQzVKauWqdCuT04OVm8YKU+4e2/55w7sCknXGrbomjsTuKfRfCnUl5vGw
	ITpZveel8bomga0fS7AhaadGV98B6M/IJ2FGtvxvTQkxsz96BydrzDqBvsIRwktE
	mhtuTfGGD7qjTwi+lHXqRs+hE/l6M/CUy/QLTYvMHwHpPIZpJcvrBGhYisM8vyWc
	ns0Ihjn8Xd1npAI8seuT4yGVyviTXbA84bMVXp4+jNZRoKalRBg6WeSloEohmR0h
	AnSLRU65ZPpg/K3s7iZzIF1NlyW2v0ms23n0KOpDBFgD4EvQo9Ng==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r4stg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 02:34:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61I211jJ022927;
	Wed, 18 Feb 2026 02:34:04 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2d18db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 02:34:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5Fyu9XRQBFuk2Iv8mzMs7xOUbZoGVkJIEJAkgmlIyIZfx4fo2lzdrlkuzAE7Tg3/bVcC8Jl3fGHkiKOmsKs/HaQo9eiQNM7j5CPEYh1wpAY2SmKMbAgFQhyFvcssgDtbOclNsOBoexRkPordw5XLaIs2Ec++YMf0ixkq9i/wCgTE0WBOq5LIb7+2CdJbTlKq6mfDmaARlDq6jj8bSIoA+S6X+MgLckPpXWXeU95ISsrgway0qHWEyv3tvP+Pi7hxWLd+SYm0+CJ2OUZgY+OknlRkezhHWl09bkehhWCcQLSupN5uohldRSOAl4h6vlXcMmqVybFHYDUAfEWmVdbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayyMn//1BJ+caFnw6/HfaDoAVpKyrm3mz0jIDu41ZLg=;
 b=xi9NwK/gVV/Cv3IU4SGis9J+1ohHdqdvqj7eiUrE4EH/zF9gawAWS4u2iXpWEFX80Xqr9dAiWMjp0hHgA+43IE2WkPWWahXd8zfmKSjVlm8fdMzIAhpnqmF3bY8Fp3fehji6KNKfRkilxgiYNme7V08SLaTd2ljHj6smQfjF/ikAl3IR5HJ82wwhXN2NAKuI3MXlly4PUpF8uCIwqPtQE2NVO16IAYQiFNjJYjYyIJ5MITfBv8lyCFj7V7GFDLC09+qc4WnPhQLorvHzwFVCJdib6mDx1jSwNeK6+ijhXyYgPZkYDe0JW68DVP0g4TLEcPXc8PTObX2eFgoIvaoF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayyMn//1BJ+caFnw6/HfaDoAVpKyrm3mz0jIDu41ZLg=;
 b=SooGRPdg3bSTnKzMndNy7npksHI/8PR91L7bPXOVJMgW7ZV1Lw4qMSBjVVI4OupWKoqGawdqO5w8DzHWNxXQ0L0a6xeopqMN5jZHWrLzvqnX87qxBI0O39BwFYrewscX9zkRxNuJUQADzDhOiH1Fl1ThmNlbK49OxAVi/ZEv0Ic=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SN7PR10MB6286.namprd10.prod.outlook.com (2603:10b6:806:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Wed, 18 Feb
 2026 02:34:01 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 02:34:01 +0000
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Herbert Xu"
 <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        "Alim Akhtar"
 <alim.akhtar@samsung.com>,
        "Avri Altman" <avri.altman@wdc.com>,
        "Bart
 Van Assche" <bvanassche@acm.org>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        "Konrad Dybcio"
 <konradybcio@kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings:
 Document the Milos UFS Controller
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com> (Luca Weiss's message
	of "Fri, 13 Feb 2026 15:08:51 +0100")
Organization: Oracle Corporation
Message-ID: <yq1a4x6eq7v.fsf@ca-mkp.ca.oracle.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
	<20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
	<DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com>
Date: Tue, 17 Feb 2026 21:33:59 -0500
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0389.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::11) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SN7PR10MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d07463d-7386-490f-207c-08de6e962ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lJyJ76OgyJvUVphUcU6dELIQ1AUzz1f6nsibjhhbMOT8WuL0XNKwuZssyiYV?=
 =?us-ascii?Q?2KmctlvNUMQSbQvhwZ00DI2khZxeEeIzeDbGNy/RY1s6dfg01UksWRc9yP7x?=
 =?us-ascii?Q?S8pUql+IEsjaJb7BgDoTQX+mcxcwTslq+mYCqihGOakMs2mGDrAAlOTCXSn+?=
 =?us-ascii?Q?njtuz7llBHLlFAr920MdBYZczfIv7cue+1zlcPOjVTwCn+jBAXmmgaRkpnrl?=
 =?us-ascii?Q?pKHbQ4ErTWgCuS78PS6wAjvUZxTpqpiDlnuHippdrLb9SKrvzAUQIbMm4YIM?=
 =?us-ascii?Q?OuQVUT800KZvBQwg0jJERtbronh++zx4X9pVNtkJI20y2xIWhYoNGR6o29dk?=
 =?us-ascii?Q?PFzAWuzp9+I3SvKpCpEMS5ypfh077h7bYrRNoJuL95IGvax8Fjtx+eolcxYI?=
 =?us-ascii?Q?XYlz73NoqYU9LsHULasTzvaHkWDtmQSCchOe38aJpPhv4dMJE7aboEFlAjlL?=
 =?us-ascii?Q?aTmXWOy2XMRCtjqlE4i5bx1Mr1pRORkHvAHVY9OOi1Ku1WUxWpbSHk74GyiG?=
 =?us-ascii?Q?GOPzsrgCAeELIpFMSXXy9EyKA038ty48yOXPEuf86q/aHgwTeDh4QUsNjqOz?=
 =?us-ascii?Q?JQoPqob82M5nnyW2vaegwBLTasz0BLCCPs2+3bOo+VxbYXYH3c/hO0iE0AMD?=
 =?us-ascii?Q?Fm4JD1gbh84WGYwGYZHXw4HhBZ3m+hyMi1gzSNyYzB5lUFQKnyImpP3ibcgR?=
 =?us-ascii?Q?YsfAkCK5vqXEpz0/LDpOfdFqTy06o1wjc25Sr0qq0gUbK3KxIOvoN5bRjpYu?=
 =?us-ascii?Q?FL/AzUnX7UfdmK5+JRuZpb4s/IHIbMIBmjRnVDBXi4gQ9b5lnISH4pZMmTe0?=
 =?us-ascii?Q?bfcYOog3PJA+nesFL04o19CzAkYjiTe9Yq+B/AkiLIHm75SXiWy9nAJggJ2L?=
 =?us-ascii?Q?1nt57TWvEjRSQ8XPHT7QlAZvD33K08oXZv1GdJ/OmPUhgeMIBg7PQHvcECgD?=
 =?us-ascii?Q?OG3NM4gHLmjyi8h/h0tp/8ySnzl1F1OWVRuBSXQD80qRd8nzUMFawfEotu+u?=
 =?us-ascii?Q?zne4unPMKVzuZc7uOC/E+wNc5Jl+o12vs8thbW9+MOIfRrQK7+huljXd0MMF?=
 =?us-ascii?Q?GFt3L7VGGli6+/v0+EocPo7AyTYZTesQVkeV+WuM+JqphjNIN/qORPrKKz8J?=
 =?us-ascii?Q?sHtnqs4xky3RRyQuJPPMF40RXYvWTyL2oWomofpSxh9JQzZ50xFgOgsHvOUX?=
 =?us-ascii?Q?M7uhScET4SvgUgSRkPaGwquh+SGR+WvYf9ICSOvSlJw5i2hF0zfYrQ2+VBB5?=
 =?us-ascii?Q?s4bRJLv5Og1qPgE4wJHqoCt5EH62TmwyRT+5ucnMjoSp+ftjQvp6DMKvEKFg?=
 =?us-ascii?Q?UhJfIdojtyNyExW2um7mWoPP1mYTEb1+Z5GlbXPfD++c2lFB/sso1P/SWmG4?=
 =?us-ascii?Q?gzho55hHjUU9Fxq12xnVZB7G11uTjnlWo3upHA/+xn6MewudjwO8FtYI6orW?=
 =?us-ascii?Q?fiWNaaUuvV3ULV0HhDxtyLcS4upPEzbKEKb8pTnWyMpKQAJMLZvzPf/xd3zr?=
 =?us-ascii?Q?e0q1Vw1/YplWGnceRpUcwvpeqQn4oKj9nb5kCGIgkNyY6b3T30NQdi6GMQuu?=
 =?us-ascii?Q?p819IwCfk5RDVChTE90=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ryLI6ET8Iw+r/eoWS5R0mFREShn+Agl8Qozyd/lvIM0A+WluI3sY5qsAq3+Y?=
 =?us-ascii?Q?b/SgJlRv1A7KT9DfTiTiIvZU+1T06yqd0IxeGunBL8Q9SaHoqn5ZiGryfxiD?=
 =?us-ascii?Q?3A9QZBJKP5yFx7VkMMhmUX77VADyDeEGkmLbK3/EOvYWuQhOMaJshpiezZXv?=
 =?us-ascii?Q?OfxjM4CydlMBqGtJ+aehF9uay93ZUNpOOn7evoVuKx7Jc8dcnpcCjBAHd+OW?=
 =?us-ascii?Q?YL07xGtbcgS7VfhqCs6o/hmL5GPj7RBomZrV21q9nBhnq5Iil3W1GAoYY2r5?=
 =?us-ascii?Q?Nl6nkeiYNMzT5bO3qKyeV8a59ubcBujEP1e0Xdkjh49rhFTDGqm/Rh9GkXCe?=
 =?us-ascii?Q?8RbqtSFAn+C43eA77kDrT3Sz6aJjOv5umLvlpigOOpfOSD9mdQcISC6mbm+O?=
 =?us-ascii?Q?OBSUcnZMaJCniUM2qSW8tKZ5bRtLgepe7jEiaAdtzlacMtfiONDGyNJzYUGr?=
 =?us-ascii?Q?bjzqSgfrP+HOZzn+mdnHRxviuoM5ZoBCC3EscFD/tFpFLo1TBhd3jSe5IQ3g?=
 =?us-ascii?Q?N9yH8yO3NORHCLNnvvORGWjcB2gEx3UODvrvdMfrrHbeURJ6AOUzZS2WW+4T?=
 =?us-ascii?Q?AgBvpDIXNNYq/YodaEEpOlRg7IHAJLMjAhrsPODoYFs0oUxiyrGL7c+NIwGp?=
 =?us-ascii?Q?xSRbKGiZXPe9+s7WEN7Xr32qX8AWSQon4DnmqGI2PIMNfTC91iD6ihW8HfGu?=
 =?us-ascii?Q?SJ4gERJoHN6CxmTKUadyWKxPf10tdS7Hw/MDdp/NmYWzrNMivbdUCjlaWp+N?=
 =?us-ascii?Q?W8uQFhbPpmuxbSYQ66AVgRYfuVr+UZ+2xPgw7Bsf2ubT2PpJE72HlXl5KBV7?=
 =?us-ascii?Q?Eho5JySqDVj9/reAyN07wtk9/mT4YpkxmfOVzTNjtAoz7NbZxOc7dBk7G2Q5?=
 =?us-ascii?Q?lrBax9eSOpbwr+CUvmjULff7eq9cwqqxe0KWEHaJRo0ZL/KNMzlV1w5GVhDB?=
 =?us-ascii?Q?BRTpUP9DQBkD3YFK4BnMG0TPH55HJh7dr6+Zc304R9ft2jwEDIih/NZ058Ne?=
 =?us-ascii?Q?AcrN0/zJy8B3bgc0y8LGAY/3OEQ1M659rqnyz3YJkCEVAI1O/kUF3TAXVraB?=
 =?us-ascii?Q?MNeCnAGpoKkjw3iXbltWlgFgf80ETw86zTeeqH4QzcNKghAWJ0HHTLSZF4MD?=
 =?us-ascii?Q?m5SEf/vUFmrCYBVF/U8czPi5bDf11/84r8NA3EmsAPYJMGvaSAve1iCFUw5+?=
 =?us-ascii?Q?hwL19kNmQPxytKJny4Oe+CCJiiuWiWaYnyVB4pjZHlmg4GsEjoHJVZLx7KwW?=
 =?us-ascii?Q?qUwY7rE1yOqXpii4Ef8Jt9y9Tv10xsP1hrF3b9w3BWy8Sxs54KdM9Fi+S1Lo?=
 =?us-ascii?Q?EWUyA56I5ONVMe6Apu3fVQpO1HxmJtvIfa5/kJZM8eNaxS42612zUS9Wh3RA?=
 =?us-ascii?Q?Y8Xy6JkSB4g7BfDqkn77uZiZIBqIxLgVS/EZfnJbCR278uVj4cWJmbW4SWo5?=
 =?us-ascii?Q?ekRysLcwlzimE3As0FklkbULOv7gy6Zi6vPQ3RvhZFMmH1paSlnqoTzd7y2J?=
 =?us-ascii?Q?T5mJ301wtXbW9M3wEVb2GSfYMIFSAR/l6lOxd9WPd4+5b6D5K6NQUzF9lXFN?=
 =?us-ascii?Q?XTKVjp7Ope85L6I/l848H/VCbq3Dgp07CGpnxd89G79n+jgpZaS5i4w4nPcZ?=
 =?us-ascii?Q?wYLxaZHpXNoiTAcaCmp82ifIhOxJhRKYInNaTmDZKbpw0/X7pt4t1TdAuH8B?=
 =?us-ascii?Q?+Jh9/XzJOfit9LRgU+D9hFiO/3z38oXtLDFfL3xo084bx/xoXLxmIbarMrrY?=
 =?us-ascii?Q?vHCThubfGj9XxA5Dr89kz+uvrlmBEfM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ob/jr68SJXYg0hIdmsMe+hCv7RjpJrIPLfFEBLZ5x04z6UtC1zV11yG07Fi4YMpla0pTJrbSIfU+iH6brKMrqcDrG+6qJLspYTfmwj0LrCYCjvFJHHEn8zYa9ueCC+aTKot6OjWpQrFprz+7JDsm4G9HAmtWdIEOUVy3JdQGxtoXTpy+4m5vGBKpBUnKDqxj3k/R0Y7BZKh1raCsRB9aJJOQ07R1y3Am3oucbutqsWbIj4UZJvk48tHkh/tnnK1PyxmoXQD9K4sPun6oAenrv0Mt5o/T3pU3kM4OK5TBF/U1V3lTAVgLM0TivwCb+cwwLP6Ot+7WagroPg1kV3v22RGKuJNX22cDyaF8LBvj8UCYOuAXgDxsbvZ2SKaQs3tEY4u3TO57L7G3i8gwxOivcSWQ1pQfjFrEE9cCDuD8bNJrqfR2y2bVXz6cVraKufn1G+eHGpWcLOlz2tmm4F3MZbqbXamess/ZSGjCSwT8tHiZzXO4+u0hKsIV067tQiiHMwcXCj8hwycvWwN9VxJWIAk4t5wp4XTH5oJb3hdMbQ1Bk7ymvykTx8HgowPD+GWfGj3arh/5q24JwHKdoH1FNSnt+1ew+rJlCsBT3FAhEXE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d07463d-7386-490f-207c-08de6e962ce7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 02:34:01.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncKrJ/5qZL31+VujOkcRJZHsGBZXjO0JlIQ3LuJ6tmjLAVLIBXDkHd7dqp/PLrC+nXiffrGcpn+WkxIqQAoJl1hzHWB62XhKFbfv9KBQ4ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6286
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180021
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDAyMSBTYWx0ZWRfXyWzGO4fOa3S5
 IDTkmPr9rP/l1Azzv18VQ1Y/spudHpjfixMklJUgVxjm46N4bytkNETeXFZHdsQGS4VMrswv+JF
 /LQyjGwRHdgclEomiXrt4zAgdGjxfD8Tc4bxtlKf0fOSDPKZtw7GkG8wIgSXFViTTKNPEbxA6xY
 sJK8Td7AwFpYo+oQOME689rYi0ciQ7+kmsI/9oMHCOLmZqLKVZwDVzTbON6BIDU8wrAMcZEQJQZ
 L90WjME/S/xNSrL7NUnJ/uX86PG1X0Xu3w3P976CEm0GL2ZT1RBydUrrOQvofjWN/h4mEwi3PnL
 K/fLqq3yEdkiELmcrNYJCbPEuU2+bXUt6TxYQDFwwLamYYIcMC3e3eXkcnDicdOW4h8hr7vh+4K
 77JvjoUCdXdEW8lEk1iGzjbyWZnXMEBQFy26zZmmrBELafZOrdn/+umYwbXD+c52jrNv5aLWsZQ
 d5mPCwVwy6I/0b9GorA4L8yKrNWUkJ+iQrfTA438=
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=6995251d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=xWk1y4nOfzAZi7r3KPEA:9 cc=ntf awl=host:12254
X-Proofpoint-GUID: wE_R0Bxt0aco5PRKuHLprHm3BgsuTxIh
X-Proofpoint-ORIG-GUID: wE_R0Bxt0aco5PRKuHLprHm3BgsuTxIh
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93244-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:dkim,oracle.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ca-mkp.ca.oracle.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 17A15152B01
X-Rspamd-Action: no action


Luca,

> I've added you to this email now since you seem to pick up most
> patches for these files. Could you take this one please to unblock
> Milos UFS dts?

Sure. Once the merge window is closed...

-- 
Martin K. Petersen

