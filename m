Return-Path: <linux-arm-msm+bounces-83778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C27C92077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BC963A36FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65F5329E40;
	Fri, 28 Nov 2025 12:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="KAdfq00l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31596329371;
	Fri, 28 Nov 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764334636; cv=fail; b=RcF1mlgFUYdA0OMMGsfn2qGOeNmplhCNq9KMucHeThgW0N6Iq3jYjQ4uRUEsPiIV9V1Tt1JMmdJvih0+c+83+Lgzxs5fVq0mh4TK/K2q69R0LBIDsfUENR/vNKJvjfYTqcZUfvEqIC0hxreOcGnOuD9UDTgFTuoGNNZR3EJ0TVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764334636; c=relaxed/simple;
	bh=kvpbcKVxkQll4v0iym6rMSsSXOA3RhNPJPvvydQwvco=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LmxkAbOH3kSMHfU7eivf3LKqqNe2Z5bg1wP/IqZQzRK+LFwEd9audtWHNOyZF3RhvYy90vxSJ8gGpg1PtS2ZvNJi7Mf3CZnaF+F+VqIiMSh90KopNJv74DlPfDdc1MHvpGKpNg+m21WpLGgVXpcSSXQ2api3SFPYbHRz319WVMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=KAdfq00l; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASB10dd676991;
	Fri, 28 Nov 2025 04:56:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=LayaRx1hvJBS7GuvCrZMlVQXGloT8LiGec6pI2rcHgk=; b=KAdfq00lFnjB
	sHCL949oQsm4kzEgNLJ5rwthZR7+lLnKlC/+eKqdXaCw4cRo4U7tJQn0R0icRN9N
	EL0bCvoMs/DtVbi//TU/gK5MK3fOMNFPaNQAqicQlFM0keEJufJjpfJjlUrkttGt
	F69pgprghUuNcm/mHD9YJ31CBAFGOrea7DGCeeDVxPIFS3fwSSvQcvsEBLZDUB5l
	J+5EMC0L89U4AdBaooOTznbCxZlIFSM75eqssURbroe+0DdrZ0oryd2M3LYHzjDk
	DaUqXKu3ycNMCKJ4o4UjOFaH/WgS2mMU5ZBGIFUjUctyjm1GPoP5stGaS9mh9YlB
	p714FJLXJA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4aq3dptbn2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 04:56:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv/iSGiBYPducW0Jnu4uDhvr1df+lLUj3SBHFoEHCfSWMDSaRsxdZ99fAUz+Idvuk4sLm2tWzKkIeyrfR5rp83mmjAf0nC1SKs5z6532elDorrxkT2DF1ePwXdb5iuXeF8DjgB4WFPIDJY5ZqjAPOr/hUPXB7nY6I+4KNjIzzUuI53iJeJpTiZxD90/SpLfmXXdyCrMi3kDvHcOdj5yBF9BeMlAqE6ZIhW4kQMy+igQZWEP5hCxA942CKMzsd+mSgvzFVuZtM+ZpvZ6H5M/MCzLszAnrr6SWxDEm9gCUV0I9oikJRTx0P3N/BnpdRSPXtzM1lqamb9x4Fehv6yJPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LayaRx1hvJBS7GuvCrZMlVQXGloT8LiGec6pI2rcHgk=;
 b=n3qBGkzpF9zyTEWa4/NQ3pNk/DyuIAANy0gJGjYFVcW1C9EuYeDitQKXlP/5dQNHbPsBOi9nCXdZQ4R6PtgORD4nvYzz7lb+Sk9d1qTrPS58RP1Pp/U2d4OfFoXroD8koFVqnd9x00BVRCncKxNYK6H1p0gQitGm/3xRFALv+92Rio48v1+AY/4ABwwHSH3hyd/E84bRB30+i7WVn1UhKsuRUvljDWxUn7jJu5vwqGS/33y5BC0L3NQzDNHWaXEazQTxQGv2RbEYr8GQTIHwHQzXdbZSCrZEoIe6hk4kDoVsr2V0mDM5ms7f0B3B45nKKUR3UzzhF+5SkglpajcD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DM4PR15MB6201.namprd15.prod.outlook.com (2603:10b6:8:17e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 12:56:27 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 12:56:27 +0000
Message-ID: <3f18152f-dc2d-4f5b-872a-4a24899a01a5@meta.com>
Date: Fri, 28 Nov 2025 07:56:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
To: Andrew Lunn <andrew@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        thomas.petazzoni@bootlin.com, Eric Dumazet <edumazet@google.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Herve Codina <herve.codina@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
        =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
        Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
        Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
        Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <f753719e-2370-401d-a001-821bdd5ee838@bootlin.com>
 <92076cf5-e136-4bcb-8ae7-58fdf93dcdf2@lunn.ch>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <92076cf5-e136-4bcb-8ae7-58fdf93dcdf2@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:208:52d::25) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DM4PR15MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: fcea5c49-67b2-4cfc-d1f7-08de2e7d8b1a
X-LD-Processed: 8ae927fe-1255-47a7-a2af-5f3a069daaa2,ExtAddr
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Wmk5bEd5TWQ3QS8xRWlwdGp4cFM2R29KMjJFK3Q5Q1FwMlFjd2IwN21BcUN3?=
 =?utf-8?B?amk0ZmJMQk9ZTkxKalVKOUR6Wnk2ZHl1YlNkWGUrZ2VQSTRjSHdibmViL1Zv?=
 =?utf-8?B?Rm9qTUdmcXBxVlRRZmVaVVpOZzlKNmdDT3hWZjQwV3lHSUxBZmhvaUcwVG5C?=
 =?utf-8?B?L25Qc25HSUdhQkwrNnFpNlcyVXpCZUNKUUpwUk1KNnI5NFZCRkNjSjZyaCs3?=
 =?utf-8?B?NkRreHcvNnpWOXpTTHZUTk4zbHRnWFowNmlzdGdXaVZPV2tQUU1GckEvSWgw?=
 =?utf-8?B?dUs1RVRjLzQxZ1dpUVl1Q0FVMU1lSjZRdzFFd213T1BvR08xRVZFdnRhdFlW?=
 =?utf-8?B?UzhKbWJrb3k2N3BZbEYveWFXcnl6UmJ3SkFWYzZ3VEdjR1puckJXKzY2U0RJ?=
 =?utf-8?B?QTRwbE5SOUlhUU9qVVdZQjBDbkIrVGtIUjBZV2FWTWRLdG5kUHd6aU5RaFVE?=
 =?utf-8?B?SEhlVXkrc1JoenFDelN6L1NSK05HM1NpV0NQeFNDNThDQlcra2lwK2RETEIw?=
 =?utf-8?B?czVNS1I3R2daOXJnTklKSFhHd0htT2RjcFc4Q2owYjJ0a1VmZmgwc3ZERmxY?=
 =?utf-8?B?Z2pIREJtQjRLbHBJSUtmN2kxYlpTUUZqRzlOOTJLWmMrZkJ6bWU1OWVpS2pr?=
 =?utf-8?B?VzhteHNtOWR5VkVTL1BycUtvb0tCRGZ0ZllLT2NrV2F4SG1ONkdIWjBKV1hW?=
 =?utf-8?B?N3FteHE4K2djRndvZHBMOG9LRWF6VWQvdXY2RHVKM3ZDcjBCSmQrdFpPRU5h?=
 =?utf-8?B?c0FxY3Z1ZmNpVkNacjc5TzVpako1ZEVUd25CaE84Y21XMTd3QVlrSEhsTzhR?=
 =?utf-8?B?M3VnQUhDeWVmamtMU1k4THdBZFFRc1JIRHhaZ3J1RGMrOGRyZEg1bk1RWFpK?=
 =?utf-8?B?RWhXbldSUTNmbGhZcDVENGFWMFJ4SUJQenAvayszZVlKMDRsdEI0Uk05NjFX?=
 =?utf-8?B?dXhHUkM5dWVYKzIrU2drd1BwbFppbVBOeVh2bTlCc1pvSzV6WFNhcnVjWXJm?=
 =?utf-8?B?NEpkbjVrUW8wdHlDTk5pWUNEZzhqWHJwZWQwM05YakQ5Z3lSbWoyVS9mOE83?=
 =?utf-8?B?WFNUTkNEOFNKemoxV3RLZjNuYjVrL0hFM2dBY0ZIbklTaTdRM1JwUFYvZk5R?=
 =?utf-8?B?VENEelFDZlJHV1h6ajZDcDZpRTJCa1BRaXdKRVdCYjR0azQrcmc4L0xiR3hB?=
 =?utf-8?B?ZEI2aTJBakZoUkxNMC9USXFCdncrNGx4ZU5rbGdFd3RWVFFhc1dzMEZXemlX?=
 =?utf-8?B?b3Ziak9idXJOVWNnOUxXelZZQmtRTndESS9oZTl0WGpTdTFldWEvSGhmZ2pR?=
 =?utf-8?B?MFpMVEM1TERJeGFkVWlzSlBkdS9RRng0Ym1CeFZzcHZVTEx4a1g1RGVnWXVQ?=
 =?utf-8?B?a3RjRlVYd1BoNkpPWGFhTC9YYlZDN3hKY0Y0TEpIYlBodVRwOTlsRVh3VGNl?=
 =?utf-8?B?SXVMMk5hbXkyYjUxejU2cGlpVU1iZDhQVzVVeFhPRjNRd0JQQ0FtdjlkbTBB?=
 =?utf-8?B?ZVBoMUlXaTJBOHdWcUJOQkpwcFhORU1VNGtPMzNXLzJzWkFOQzV6bnZHTy8v?=
 =?utf-8?B?TWtzNEdENXc1NTRLdmxXSHk5b1IwWGJjUTBpek8vMFVVOWRkK05pT0EvQTRK?=
 =?utf-8?B?VWF3WEhWL3g5T3dPZlFhbTR0MWVpT0VBTDZqaXZWTkx1enRBUCtZK1Y5Qy9W?=
 =?utf-8?B?ZUVlUnJ0c2w0KzJDZzVuQTdOVEVXNEpnMFFGRWJVQTdCK0N6OW44bjlNbFFT?=
 =?utf-8?B?TVhhVWJMc3RSdVhxTklFalRQWVFGeGhRV1VoVTRnbUgwRVg0ZVlXdTA2aVZF?=
 =?utf-8?B?dEhsYW5ONVh1aEdicWhmYXdTVHBucnlITU82QStSLzdHRzJJdjUxbkswRCtz?=
 =?utf-8?B?UHlaWmR0YWJ1MDBQTGM5RjdrT041Qm1mSnJGdlRyYXBRWXdId1VkR0tFZlpl?=
 =?utf-8?Q?7hMuwJFfjqCvOUC2DoZEKTvc2brD6tBz?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U1VBdENPU0gxcVM5ZTdHbGlHRmExNlp1MTNFZjg4N1ZjYUpKYmVJazR3L0Nq?=
 =?utf-8?B?S3MyM2VOR1JYVXN4Nk5McERzTytpMVMzVGlTclZrc0xNTGxHQlNxLzdXSXlL?=
 =?utf-8?B?RWNHVnl1SGhKbFBpRWh6b2EyN2dmcVluL2pNdDY0RE1nb1F3UlBqejB4ZzZ5?=
 =?utf-8?B?Um5HQmlnQXBBYkFvSmZQNlhGN3JIQTRLWVpYZ0cvaTlmZmp6MVQwM09qOUFu?=
 =?utf-8?B?Wkc4RUhWdXA2N1duTFZPUXVMUC8xajB3NStIelNlZ0VKZ0Z1UjV6OTk5YzdR?=
 =?utf-8?B?R0NoTE5ZVGRYby9BUWFqMFY3UTgxamxrY3VkNHV6WTcrWnhlVWNaK0Y0aGlV?=
 =?utf-8?B?MGRaRjFkT2NVeHRnUVVIUHl3bk5Fb3JyYXMzUi9mTzhrQ0E0VVp3ZnZsSEZ5?=
 =?utf-8?B?azA2cnByQUQrRGZ2YUVtWktkc2ZKMnJGTjlLUXYwU2MwdzV6MnpJVmRGNzRv?=
 =?utf-8?B?QkIzSHBDLys0TWRVRUNiMEhlRUM5MThjaDFmZlcyRDZJNkVGQ21aQVdiZEFC?=
 =?utf-8?B?ZzdIenVEdUg3NTdoWXNSMVpReEZHZTZHRnFzZUxndklYUklISXRnMjZ3R1Rq?=
 =?utf-8?B?R3Y2OEU2OWpPaFJmeElqaHdsZ1psZUhRc3lRL25sQnJWakdNT0NuTUw1cEtL?=
 =?utf-8?B?YmZUQjFYRGR0L0EyYjBJd2dlSGk2OVNDMWRsRlhYd2dYYnRINTBoZUFyRmRM?=
 =?utf-8?B?YWhYMHg1b25sVXQxNVppbVhIVUVRM05hclVZN3QwVlp1WCtpWHF4R2kwTW1H?=
 =?utf-8?B?d2t0S3VTcWNGRHIrUXpUWlRxRU8yM2ZaaGxGaUhCb3VRbnVtb29IK3hQVGlU?=
 =?utf-8?B?QU45UkVDUnZtcktRcW9CL2lzL0x3RFVWVDNsVFpFS1FWb2hKTHNhR1pnQkZk?=
 =?utf-8?B?Um9wYjErVEJSSWx0ZXNEUU5nMnhMN2xueXJHY1Zzb0preXdrckVUdzV6M0wv?=
 =?utf-8?B?VlNvZk9BemhjLzNGcDVoSVhGL3hrMkJ5b0lMMUJpMEh1RWk5TnZrM0ZPWUdL?=
 =?utf-8?B?VWQxb1R3MXBLekZIV2d3V3g2OFRKOXVnblVIOVlPQ09hRWM4OE1MQnhaTW1s?=
 =?utf-8?B?M3UxamMraTg5bVBCVGo5S1VzNk0rbjFnZ2ZSQlBMak43dUY2SUVmdVpwaHpx?=
 =?utf-8?B?OTlPY0dQK2o5ZmpNL2dibEZKSHNuWGUxSVlTemFuNjdwZlp4UkppK0lHL0Zx?=
 =?utf-8?B?SElsei92Z2FDejU4d01CY20xSDZZZnllNXM4cTZqQlFWUGoyNklwS1JxcXRr?=
 =?utf-8?B?L3RUNWtlRDFHWnBXUDJCK1Ywd0Z0TUlBQXRONXhGZnJZZWlkVjRHOElHempn?=
 =?utf-8?B?OWZKMG0vd1FHaXpkT3hKRXpjTCtGaWc0RE4wZ1Q2RU80QzBaeXdwTE9uSGpk?=
 =?utf-8?B?RWxSeGFxQVFQeTRxeHpRYzFxZEI3MFFCOUFpeC91Ly9Ibkh1RXVPazh5OXpH?=
 =?utf-8?B?dnpPbXFST2NpV1MxM2lGUU1vVnFuSmFaVS9SamFpakw4TGN0cDkzWWdQNVlm?=
 =?utf-8?B?bUlodmRoQUp0VlFqdEdwbkMvM2NLMnU2QllGU3NDam4yUmZIWE0zVnkwZlNX?=
 =?utf-8?B?TGxBK0dwTklpUFhmaEI3ekJKcTBWcXIyYVVaYW52K0NwSWtxYld3ckRiT2Fh?=
 =?utf-8?B?dHExTXNGRUxJd0w1ellwNloySFFZblZpMmpBTnlHTDJlQ2VINGZGN2NKZVNL?=
 =?utf-8?B?YnZrUzRXVWRPUlJqaktjODE2T0tOQlBCaXVab1ZWaHRxSVBudFdkcVcvQzVC?=
 =?utf-8?B?SFlhazFTOFBXd2IwS2FPSHR6NXhFQmxmbTE1MGFCa1J2WnhNOWVMTUl6NDF0?=
 =?utf-8?B?Zm45YmdjZ2l5RTYzV2ZvZ2d4SEVwRE1UZERITU9NaHVTTnVQZnUzSGwyaHRI?=
 =?utf-8?B?ODFLajIyQmZ3YWc5QmozQzd2ejZVRmtMYVdTUlJ1ZW9HTkhTZDc5RG5lUERH?=
 =?utf-8?B?NzhUVkNCQ01MTjVwdjhZZHUyWFQ2WlFkRk45MmRMaDFMblpLc0sybjZaaC9x?=
 =?utf-8?B?ODhTZDFwSmYyMlpHdC9zOTkzbkxleHNScUhnK2tTNVJyL3ZnVVVhdDZzaWZL?=
 =?utf-8?B?SHZGZElaNnBVcWRZbnBLVFBUZi8yd0xIblVnVWl6djRQQmoyd0JxQUFoOUhS?=
 =?utf-8?Q?sjXg=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcea5c49-67b2-4cfc-d1f7-08de2e7d8b1a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 12:56:27.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H1QuXNp2SLro8Gi8hUSbDU442YNJuCvp4cN//KnSuNY+OacfyGHn3xr6Lg9GG7T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR15MB6201
X-Proofpoint-ORIG-GUID: ReaW5ID4y1rSZNJ39CcgXZ3rC7vvuCjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA5NCBTYWx0ZWRfX+dkOUTDDm556
 VAIy/0Trypwb1GTpcxCJfZNbjHL7NkyWYpYEtvLYA7KO6/d+Li1lF3maMC51tMu8rhj3fuww93p
 VUuWfzf2bisePV7BnN34NA1OVvhBuJvtbEfT8vtmvdAPSYom3gSSjeH36aCtleguQeYaK1lhGug
 chZHUokpAalgODane+r++I3jRxGUPISFuCapVdVmepmpE/B40VxC0oKYsjpiOn0BtTiH7/+Jflj
 Q61nN/VwL8bI93PuTKlsDDnZ0cJPxLV8cgfrNjKigmIvmd1OFvLgO5Jp1Xfl+bIA2QChHELdR1D
 Xb5yRCnJTyrF/xgzpGmlFYj3gw1XQtTKcMNJrW3SI5fMeEy6wyeyTwf6U2LorgBt0S0yTbVzezo
 CAD2wY4bOG0C5Xr1S/7L50U9EYfrdg==
X-Authority-Analysis: v=2.4 cv=fL00HJae c=1 sm=1 tr=0 ts=69299bfe cx=c_pps
 a=MNM/txilNqeExyaWs+jKwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xILOqUm9zN4ZMKwqPUkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ReaW5ID4y1rSZNJ39CcgXZ3rC7vvuCjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01

On 11/27/25 11:03 AM, Andrew Lunn wrote:
>> It's a bit tricky I guess, as the call-site in question
>> is introduced by a previous patch in the same series though.
> 
> That is an interesting point. Does the AI retain its 'memory' when
> processing a patch series. Or does it see each patch individually?
> 
> We encourage developers to create lots of small patches, in a patch
> series. The AI needs to be able to handle that.

Hi everyone,

The current prompts don't have a good way to find other commits in the
series and look for later patches fixing issues it has flagged.

This is a common problem on the bpf reviews too, and I've been meaning
to tackle it for a while.  Claude can already wander through git commits
pretty effectively, so I think we just need to pass both ends of the git
range that make up the series.  I'll experiment with that next week.

-chris

