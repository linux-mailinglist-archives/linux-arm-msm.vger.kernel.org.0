Return-Path: <linux-arm-msm+bounces-108722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGwMBCueDWpV0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:42:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D858CCEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24FB3220104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6574175A5;
	Wed, 20 May 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yBhD9NEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0343A4F2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276760; cv=fail; b=Oq4I+Vn8yCVLWgG0QV9IIFkCQgEIM+nFGPPUMc4R++2v6Ej4r42N3gAL6EtQP5Nd7qqVFAYXcqMj1K3wlJ8Su5BvEvtxnprBOATYOkyCftY73tIRxp63NRKae7alP1jHyYuqp5uS237LDLUrma/FO/jLEAG42o0MnrFXt7UexWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276760; c=relaxed/simple;
	bh=1/sUC5PPj9ttwJbYOrt1ESfQsQuz/RdgNTASg4kLWYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cmc3M6RPk05P63XVAHnnDksJ87zlJHHv0si3pvPMXWHX85u6VNeLp7rpf0wGKQosaT79HY497VP8IHfw51gWILZINRqhJUpKtByy8dX+cflrFIS3DdAdn/EQLeGe16HQ3eNDoToJ6vsSgH5988PRdAPlS//Ih4SncZ3OC7RyqHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yBhD9NEL; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBVDUkHGHe635HLGgfUFbdbTceTZ1seVufSRopb2U8WypItqBYjPNLGS4roe6MwhoUEqo8aGJuEeXjD5G0tYNGfbX6fRDtwQmKbCdqh/pMkxnB+EFN2Lnv2F4ZteaYm9NSANLIl8PoHjbYz8dFsttnlkA9V84r7p9EIODnLplZotQppyNI3tku2WLtEobXElhUj363OV6dXPyA0Di1sTD5pL1eS7pdJjM/ar/go3fhM4v88S4czSPiyJWTpw0mQ1vaAscC+kaacTrqq2QsifzvpQX/5dq5Pb2suJ/VPuKhGFLMFEtoJcSER/jDVQ1MqKOOO/99dsMQf36YrykbYfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhRakJ+S6bcYfmI/A0NuS3tZ9CKpKeLkotZO6WrG2Ps=;
 b=V6PaiVQOBDtKYw3ljzfXi5VNI6cF9ptwsy7yp2aJ7vCTUyKP4VWbmkm/iYrxysJ+322gbWF1bQqAGZXVnxV6N5QKaPHnELpWG5jkmqlrl/0sOStZhKAukDRt6iAzyC1v4qKmb7RX2K+kQYjf725W/fUzcPv8oViN8ZGecJVfcvrOQBf3vRdJsQHeh8m7OkWYnValBjkvYbI+GlYbAnGVkDhZZ07iLTe7Y+XC2nqeqYOJNuGqAh6Is5PIP4bhlZkP806B5XlV7bUoz+2Ok76X5I755ynvQVk2eAIUsfJO7Zf3pXPaUOJkhzQXRf5HD/pB8dPiMM/fEWNTYOlCMTPEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhRakJ+S6bcYfmI/A0NuS3tZ9CKpKeLkotZO6WrG2Ps=;
 b=yBhD9NELsC7LDHnxSIJzdN26O1iAqfJU6W5omHFNMtp6ICkl+E0ihSJ3+LLoYVavvpNZrs0dejFRFJWAOjwNIp4nfVUfkipComIKUGzQ5noFbC8j5EHNbvlX6LW1a6zisvqOjM0arfv4OczCAXg1r+o1pNlin6C6KM6DRy51DTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:32:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:32:32 +0000
Message-ID: <8c245169-3e4b-4a13-b784-6e7a2f21eb3d@amd.com>
Date: Wed, 20 May 2026 13:32:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/exec: Remove the index parameter from
 drm_exec_for_each_locked_obj[_reverse]
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
 <20260520101616.41284-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260520101616.41284-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 658cead4-57ad-431c-53c1-08deb6637b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	v0KRFCksHcmEyCZmajaCH6p2McAVAnszWfpGmlw5qA2BUNLI8G3AUYhGO8swJxwuIfepjHkTg4olWG6GqWnZ7QdOMg0GO7PNxHCJbYdctKqfLbgVuEc11gYNCG9mI5gmu0mogZdpXKywfKYJBF3l6oA8XelD3ko9pBbfkLGEv2HGa2bA39BX0GmAtB2vrYLj1UXglhYCBKew2ylZnu5dtW10KpLsE1lyn0+vnoeb5+hL/myLaMDiqmaiHPHAfyxPZdWWasFmOWjnKAVX62F/ISCyKm80ay/Yu1ydkzUx5i+vFOeEVDmvVnACBK1UcbvrkPsnUqejqooV6NX1lu/90GUI7jWeASKJpHBByI1/c09SjGJ/NxHteKAAFz6lIl5McJyMTKCKnOAJKKjBvA/nFYSfu7kPFDZ82k1k8dOXxGIMQcRB8pak+c24o+j+hVuWiPduObxB7Xay0y+ued2puBpoMmSlIgwMzDz3Q800vYNAZtA1AIXEMGmfHHqvgkWPUpW2KKeOB6vF6AqgBO2cNt4wfxxi089RI8XRyDfBmFRrrnrlAXDos2RW2brOQeVXQLMYw/zmarucFPb3Ha0/jmsR8wImnd1zDXug+A0F9orZWc9hUs7ZDXVpEjuUGho5b6MCXSx3n9bzMwUx82iDFRms13ygKRRfP0Wm34R1P9bUXSK/02NfYxQ1bxZWTXN9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0FmQmVJdlBQcDliT0FMY3RBdDhRclVJc3gwMFFiN2ZaaHd4bjBjeWIrWGR3?=
 =?utf-8?B?bmwxaUpxOEs0Uk43R0JJdDlFdEtscTBma0ppOTBzTTBKWk05MDduQlIzU2Qr?=
 =?utf-8?B?OTlaVWkyenRtcE84TmJaQ1lPVG0va0tVZ2lmRkF4WjJDRlVxS1Uyb1pndW52?=
 =?utf-8?B?c1lXdnpVVkRUTkVnZlowcmx3dDJCODN3NW5Ed1NFeEEvSlNmVUM0QW1TdjBO?=
 =?utf-8?B?NVFsVEE1Vm8yN1NKWTZPV0UwK3MzV0Y4UmNvRk14UnA1NmgwR0tSdkQxTlJw?=
 =?utf-8?B?RFJzTkxpaFNsbk9jMHBncnFNRFF5b04rTzc2eHlBYUNXc1VVWlFYRTZkanhU?=
 =?utf-8?B?UjNRejdWQVZqYXU5K0VUVGFabDNSYUFtTEN4eUY0K0ZDQ0U0akdGenN6RzJV?=
 =?utf-8?B?ZzlleGFFbEF6akoyQkpJdEkzMDg3Tjl6bm53VGVYcTViYzBZZzkvem45cmRa?=
 =?utf-8?B?SHJGMlUzaFhUWGd5bVB3SGtXOVlCQytndktxOUJzNHVJMm1wU0NjUEMwd1p2?=
 =?utf-8?B?Wm1YbHVSS2F3cFN1RENLUjcrdGJnVzc1YUZJV0pMYVk4RGdWbGZmZGVlZkxT?=
 =?utf-8?B?TktyQXVDdmx3dHNoYitLYXp2bGE5L1poa2pabXpFNktqZDVobVVJODQ0TlAz?=
 =?utf-8?B?aFdGaG84Z1U0N1NxeDJCeXpHR2xtWkpNTnRDbWRYWCtMZ1RlakYvdWU0WHp0?=
 =?utf-8?B?N3ovU25oQzlUMGhrOHNrdTJIdjc4Y29tVDV5WmE5SWVINlYvMkMzZGMrZTlq?=
 =?utf-8?B?T09NUnM4ZnpQNGxKa2RHOU1mdFpBU0thMGlZWWdLbHlDNEdmdEFzM2cwV3JD?=
 =?utf-8?B?ZU5WSGtCZWtzdUR4d3JpZytMUG03M0ROYU5LbW4rMFNCTzMvbCtIY3o4azJJ?=
 =?utf-8?B?QUx0SzdsSjZsZGtRZU1SMVBabWFMVVlrMGNMMW5UWUZBbEJlY3BRYmNxQ2E1?=
 =?utf-8?B?Z2hxS3Z2NnNIelhMTmdvYW9ZdHlQNmd3NVhBdUtONkcxWTJtZ08rNHUrNjVB?=
 =?utf-8?B?azBoc1Jnb3RPeXVuNy9MVytmOTgrVHhpek8xajRLNy9CNTNmclN3bE1tM3NG?=
 =?utf-8?B?UHFSRzNoc2poS0FQTjBnQklQT2dzeStRSVh2bUM0OHoxU0M0b0RKSzBuYWx0?=
 =?utf-8?B?azdDdHNMNmJrMFlyeHErUDBsSTRYbFJ5di91N3NReEo0U3VoT1FMRHVNd1pK?=
 =?utf-8?B?U3RhVkprR3Nxd0NKSUJFSTlaK2RNOS9qTnU1dkZiSk5KSlNrMTJ2Vjl6Q3k5?=
 =?utf-8?B?NDgxcmhvRS8vR0JjUklVN0tNeHFqdEdxcktPbFBOeHBRb3pOMVd4UFphM0Ey?=
 =?utf-8?B?YUtDblQvU0pWUFVteWlUWGRJbHZzS0lDaG5ndnJ2L1EwT1hURE1xNENuWjZK?=
 =?utf-8?B?T2dQTUMyQzRKbVl3cCtGV2RlVC9NbGR4WVFOREp1cm9meTJlc0o3eStKTUxl?=
 =?utf-8?B?NDEwTTlpQkR3TVE4Ri9zV3lkYy9oTi9QNzNobmthVUdFNm9lQVY3SitDaGtG?=
 =?utf-8?B?S1FZdWlNcHU2YWY0WVN3QWROaTRlS2M5cVNzWU5WZ3lNU1JSZ2tVQ2xLMkFl?=
 =?utf-8?B?Y0lWeWlQWWJUVmVhSEtwb01Ld0I4bmdlcGlKYzMyZHZ5N0FraWVvdE5jckIv?=
 =?utf-8?B?di85dHBvUnNXblk4emVzcitiK2dYeW5oQWxuczBzOEU2MVA5WS91Vmd6Vjl0?=
 =?utf-8?B?aWhQVEFiei9KdXVscUZiN1NRQXM2SVNNZWJWTi9IQ0R5L0Q5SUNCU1VCU1dz?=
 =?utf-8?B?MVczT3dzREtmSGU5STRFcUhnZnFkeDJtY3Q4SzF0eGZreEtJRGxsSWVPMjVo?=
 =?utf-8?B?UC9BTVdYOWhFajVma2QvRitwREFsdkpEQklDZlRSb2R6LzVuZHh1dzlmQ3Yx?=
 =?utf-8?B?cFhWVXpaT3F3eEl4UVlzcVREb21SR3didEMzYjBxVzhqSVhtbUI2MGxFb3hL?=
 =?utf-8?B?Z1h1S3gzSFVra0tSKzZ0VXVPT3NBMmhmSjF6aHU0M21pMlRONzVaU1Q1OGlC?=
 =?utf-8?B?NThDZVJFSWpzMlB1d09EK2ZCZkpZZzRQdUwwUnBZU2I5VU1FS0h2Y2dWdTFG?=
 =?utf-8?B?OVZWZFByMGF4RFd5VHppK3ZTR1FoZkpwU2hqNUFMdVMweENNRGs4SUdFbENX?=
 =?utf-8?B?QVVlclNqZW9qV0JZZ1RaYi9PdlNUWENqVnB0TVRqWG1BZDk2NzBFRTJHajZq?=
 =?utf-8?B?OFVINHFrS3RERURKN01FcElPeXpLTFpodlNwYWpkL1h2TlFudmRJWDRXaHZW?=
 =?utf-8?B?bTBRV2tkS29td0JwdjdXMWxKR3BLZ0J0OEdQNk1EQUNsTE9rYWJPcWQ0WjNr?=
 =?utf-8?Q?OO3a44YX49DGfmODkH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658cead4-57ad-431c-53c1-08deb6637b6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:32:32.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6DiPsSm7DkS59pVJXNuJC6AdWyRPHjF3UX9nnX3kcY0TWOPtzjs/wUaKmA1UoHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-108722-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4D0D858CCEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 12:16, Thomas Hellström wrote:
> Nobody makes any use of it. Possible internal future users can
> instead use the _index variable. External users shouldn't use
> it since the array it's pointing into is internal drm_exec state.
> 
> v2:
> - Use a unique id for the loop variable (Christian)
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  9 +++------
>  .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  3 +--
>  drivers/gpu/drm/drm_exec.c                    |  6 ++----
>  drivers/gpu/drm/drm_gpuvm.c                   |  3 +--
>  drivers/gpu/drm/xe/xe_vm.c                    |  3 +--
>  include/drm/drm_exec.h                        | 20 +++++++++++--------
>  6 files changed, 20 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 32af8cce3df8..97a851ae7bd8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -850,7 +850,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  	struct amdgpu_vm *vm = &fpriv->vm;
>  	struct amdgpu_bo_list_entry *e;
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  	unsigned int i;
>  	int r;
>  
> @@ -961,7 +960,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  		goto out_free_user_pages;
>  	}
>  
> -	drm_exec_for_each_locked_object(&p->exec, index, obj) {
> +	drm_exec_for_each_locked_object(&p->exec, obj) {
>  		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
>  		if (unlikely(r))
>  			goto out_free_user_pages;
> @@ -1201,7 +1200,6 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
> -	unsigned long index;
>  	unsigned int i;
>  	int r;
>  
> @@ -1212,7 +1210,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>  		return r;
>  	}
>  
> -	drm_exec_for_each_locked_object(&p->exec, index, obj) {
> +	drm_exec_for_each_locked_object(&p->exec, obj) {
>  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  
>  		struct dma_resv *resv = bo->tbo.base.resv;
> @@ -1281,7 +1279,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	struct amdgpu_job *leader = p->gang_leader;
>  	struct amdgpu_bo_list_entry *e;
>  	struct drm_gem_object *gobj;
> -	unsigned long index;
>  	unsigned int i;
>  	uint64_t seq;
>  	int r;
> @@ -1331,7 +1328,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	}
>  
>  	p->fence = dma_fence_get(&leader->base.s_fence->finished);
> -	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
> +	drm_exec_for_each_locked_object(&p->exec, gobj) {
>  
>  		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> index 4c5e38dea4c2..f6b7522c3c82 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> @@ -121,7 +121,6 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
>  {
>  	struct amdgpu_eviction_fence *ev_fence;
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  
>  	/* Create and initialize a new eviction fence */
>  	ev_fence = kzalloc_obj(*ev_fence);
> @@ -140,7 +139,7 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
>  	evf_mgr->ev_fence = &ev_fence->base;
>  
>  	/* And add it to all existing BOs */
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object(exec, obj) {
>  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>  
>  		amdgpu_evf_mgr_attach_fence(evf_mgr, bo);
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 8d0601400182..746210f3f6c2 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -24,7 +24,6 @@
>   *
>   *	struct drm_gem_object *obj;
>   *	struct drm_exec exec;
> - *	unsigned long index;
>   *	int ret;
>   *
>   *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> @@ -40,7 +39,7 @@
>   *			goto error;
>   *	}
>   *
> - *	drm_exec_for_each_locked_object(&exec, index, obj) {
> + *	drm_exec_for_each_locked_object(&exec, obj) {
>   *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>   *		...
>   *	}
> @@ -56,9 +55,8 @@
>  static void drm_exec_unlock_all(struct drm_exec *exec)
>  {
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  
> -	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
> +	drm_exec_for_each_locked_object_reverse(exec, obj) {
>  		dma_resv_unlock(obj->resv);
>  		drm_gem_object_put(obj);
>  	}
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 83020b6cf9ba..c422c5af1f4b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1557,9 +1557,8 @@ drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>  			 enum dma_resv_usage extobj_usage)
>  {
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object(exec, obj) {
>  		dma_resv_assert_held(obj->resv);
>  		dma_resv_add_fence(obj->resv, fence,
>  				   drm_gpuvm_is_extobj(gpuvm, obj) ?
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b01f31ed4417..080c2fff0e95 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -373,7 +373,6 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			  unsigned int num_fences)
>  {
>  	struct drm_gem_object *obj;
> -	unsigned long index;
>  	int ret;
>  
>  	do {
> @@ -386,7 +385,7 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			return ret;
>  	} while (!list_empty(&vm->gpuvm.evict.list));
>  
> -	drm_exec_for_each_locked_object(exec, index, obj) {
> +	drm_exec_for_each_locked_object(exec, obj) {
>  		ret = dma_resv_reserve_fences(obj->resv, num_fences);
>  		if (ret)
>  			return ret;
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index aa786b828a0a..dee6ebdbe416 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -65,31 +65,35 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>  	return index < exec->num_objects ? exec->objects[index] : NULL;
>  }
>  
> +/* Helper for drm_exec_for_each_locked_object(). Internal use only. */
> +#define __drm_exec_for_each_locked_object(exec, obj, __index)		\
> +	for (unsigned long __index = 0; ((obj) = drm_exec_obj(exec, __index)); ++__index)
>  /**
>   * drm_exec_for_each_locked_object - iterate over all the locked objects
>   * @exec: drm_exec object
> - * @index: unsigned long index for the iteration
>   * @obj: the current GEM object
>   *
>   * Iterate over all the locked GEM objects inside the drm_exec object.
>   */
> -#define drm_exec_for_each_locked_object(exec, index, obj)		\
> -	for ((index) = 0; ((obj) = drm_exec_obj(exec, index)); ++(index))
> +#define drm_exec_for_each_locked_object(exec, obj)			\
> +	__drm_exec_for_each_locked_object(exec, obj, __UNIQUE_ID(drm_exec))
>  
> +/* Helper for drm_exec_for_each_locked_object_reverse(). Internal use only. */
> +#define __drm_exec_for_each_locked_object_reverse(exec, obj, __index)	\
> +	for (unsigned long __index = (exec)->num_objects - 1;		\
> +	     ((obj) = drm_exec_obj(exec, __index)); --__index)
>  /**
>   * drm_exec_for_each_locked_object_reverse - iterate over all the locked
>   * objects in reverse locking order
>   * @exec: drm_exec object
> - * @index: unsigned long index for the iteration
>   * @obj: the current GEM object
>   *
>   * Iterate over all the locked GEM objects inside the drm_exec object in
> - * reverse locking order. Note that @index may go below zero and wrap,
> + * reverse locking order. Note that the internal index may wrap around,
>   * but that will be caught by drm_exec_obj(), returning a NULL object.
>   */
> -#define drm_exec_for_each_locked_object_reverse(exec, index, obj)	\
> -	for ((index) = (exec)->num_objects - 1;				\
> -	     ((obj) = drm_exec_obj(exec, index)); --(index))
> +#define drm_exec_for_each_locked_object_reverse(exec, obj)		\
> +	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
>  
>  /**
>   * drm_exec_until_all_locked - loop until all GEM objects are locked


