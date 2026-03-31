Return-Path: <linux-arm-msm+bounces-101013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGCMMI2Xy2mYJQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:44:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D0367445
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E5493005306
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAEC39A7F4;
	Tue, 31 Mar 2026 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vWgs9z/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A237AA9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949791; cv=fail; b=jNIKVF2VaiipDZkNxad54ORlx+UiGV2+n9x+WY5eD6Wg8uNspJokwYJeXCLlx2aCFj64rDSrHBMPwW3ZsCJcmNL2vfrYkk3qNADoxvE63xjOgxpc1o8fVN9PJi6JKtlFUmr5fNaRnudRyxlvA6Dh/VMQ5LXEdkLaG6LjK7Sy8yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949791; c=relaxed/simple;
	bh=a/PnN5hXabscdZdVMboSzkdpzYncHE2MN1AwCP7ivYg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=idFW1Tl56nb5zwxKD8qMyBzu4/y7vPN8XQqpAwMR90ywokzWjZYfJ54BzkGVi7PqGzh/6NcV2fkszCnoQ3Jaxb2UOTnVNwMKNWFGoZ2R3JMAVORt5t6rUr4MWXwi+KY4Dnl2nHP78HtdKnKbjZZGzXiP6W9tgLRz0d4WZqIGdTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vWgs9z/Y; arc=fail smtp.client-ip=52.101.53.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V87u4J3UWim2ma98vnl8dZoTa5xlbMUHM/dGLSV68vb4WElxAdhGQAEi3ln98CJSLccXfC6nJozfzMtVZu3UTkU9vHLT3Arnw08AbhT7xeeYzd/n6tc7NV2+B8odLkb2tvB6B+geKQk6nCRvRdJg8OW2R+SFtgdzLG61ibnhiRhMLKmYMQk6vWyyRolG/WRNz9epAIHjBtDRJQpFoZKT+1niNYSDCtEPaFi4eKk2/IHUJL48hshg2KfUIQbTSdv+/v2oKun3oCmf4+fC4m5j4Au3fIH8miwyxMRE8uTNmz8qzdKJCMe9+TMZpD9W/tmOxLTsSs6fYKPhq32e2FO1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWsiqcjc2b7vHJHt6TQdpGCSlxffbfJX7tcsRyDo3qw=;
 b=F50oe/2cMVRHcR6N0f/18+fLcPWlPD0/IFlxiK8ij/woAc2JsZk8/YVekpaPSyj4uVxxr+Wc0wbjVkjLc6KHq8j27NO39A7JLpf7bL6Zp/B+dfKOrOk0oNDPbc49V60d/kqZ0/MBnLkbIhgydsG05aPhjYnkIZNWELfI8Y8Cbh5dyw4XKKzuVOmufaC3wW4JnTrgVMP8hG2/QBI77Djv2C7pHXoxz6NyR07DU5nsx3UTzilj9DFaFrZK7PywebJ7igf+GCTgraPt9YaBNWpe2iHrpCoZZYGl5+xJ4r0fubj8Qq3YvC0Iy5+wUmV9lqoH+/DnLXRb0kEBkVjA+DpAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWsiqcjc2b7vHJHt6TQdpGCSlxffbfJX7tcsRyDo3qw=;
 b=vWgs9z/YTrqk/SdZLCr12oOFeEY7kOMKRC0b6G9DNj5yOyIWZIiOiQVrhBPI5lllsqURToPn2W8jRa3RbVKWwHgIs03i3Kl9ANMbuAJtrTqwj27PEIeDSKqyRUHmBDuC4490UjO//C8gjkgdLDMpyO/JBBcNp6WMVQeO9LJXQ7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 09:36:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 09:36:24 +0000
Message-ID: <4dd19e54-382c-4122-8dfa-1588099e08af@amd.com>
Date: Tue, 31 Mar 2026 11:36:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm: Remove abuse of drm_exec internals
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
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
 <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab62c28-14b2-4c0d-7efc-08de8f08f983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hHlqN5tYXsfQHRH35nWRGQUHrV7wkewKI3LMTcB0WSnW7a/UlIvAkINZDnY+QtVyl14QYJl2J+wC7RJ+lxpxRSQQJQuHLK3YGoSLycx2Wfx8IjSp7S86xRLcfJgq+VtLPUMmzk3x09Hz+rTQNDp/Qg6QSYciSsDOvr/QZrwCARy7MMBZIBTob05YToz3sIimKUzTBR5amMZRSil4tf8k3s/lhRzYTWIF7M6ye+wr6Q04EZUV7sfxohYCJvgmYPUiMT8qYmBhPncr8bg9A2Lk8+eKQFqT2UxBdjdaiPEpddoU/fG5pi25Y650bQpHGtqnyBz5zdhHL3HbL11NuCErT0dQkBS3Ovn7+YjXvN24Fc4ODOXW66HZjZo6fHd3UyHo/QTczlAb+3BjE7IcEgQRdEo2ofakslch8D5wCzp1iBuApAQ2crexniAj4F+gLxkDH4/ZeWvankRD5yxf0ZRtEoc055r/1DzyUNf5uh86cKWVl9xnZS67Gs8EQSwR4MV+zivzOJtNCXrq7wBz9HW1iDxucs6V4SPAYSyeUh5YZXLUH/KROoQvvaU06mEuYIcyjPCqCsmKErvmg2aYC0UDqYh1FqFLBwuQNpXFC2nBf4ifsIwQB1nwPwqAxiKph4SmclAphUVYU/ME2MagTd7dyABjpLTt8Etpew98ZZeeI6Zn4ojoB9Jh2ubQ1Z1up12U9e3kdCZnhA4Hg9YIcFvfVXC8TF1qFnuzmyI/Lmd0YSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTVDcU9oS1YzZUJVa0VrM3hwRWxRenlqTUs4cGZpYWlMaU56dHdFanFzSzcy?=
 =?utf-8?B?L2hLdVIreTdFZVdEUTUzMHh1NUNpcmNoN3daalFOcXZnRjZjaWdjeUttNnBX?=
 =?utf-8?B?VlFYRC9CZ0RjSHVtRGJYNEJpTGVzZ09La3VjQUJ3QzVzUy9Jc2UvMGVwSmpF?=
 =?utf-8?B?M2VraTBaZDFtcXVmRjZHQ2RKY0ZGcTMzMTVrQXBsYk9KT1FKRVdCTkNOeWFI?=
 =?utf-8?B?UERtWVJmNStZblBNRUZDL0VrYVRhcWViZVFuSnpMQjBCaTNCWFA4TTFVVC9E?=
 =?utf-8?B?WjVCazc3dHgzZEsxamRzR0JmblhYVXhPUXF6UXFSN0FrU0ttOWl2dkErSk5U?=
 =?utf-8?B?Mnd4djYzR01OZHZrNG1QSmkrYmJ2WGYxNU9JV3ZjK1QrRzdLS0VIWDZpNTNO?=
 =?utf-8?B?aWVteFNjOXlBZ2FlTkFhdDM4b0xBTi9UZWgrcWdnc09WcEVwMWhWdUxBNmtO?=
 =?utf-8?B?N2dDZG5yUVJkeW1PYmF5UnMvVWREMUhzWE9UclF4cFo0VEtFSnZyUmlEYzRG?=
 =?utf-8?B?MG5aQ3lzOGZwUWxwSFQvemRaZTNIYzRlbFRpYk1RRm84eE9RTVVqa056SnNk?=
 =?utf-8?B?Q2xiTElHTUo5WTVkZkJOL1RXSEdtOHV4UEpYL1VPS1RrdDh2eENiTUFlYWpi?=
 =?utf-8?B?MFlTeHh4ZWVia0EveHFEYzN1VmRDcVh2K2Zpck1KdTR4eG1Gb2k2RCtvakN1?=
 =?utf-8?B?RUNIR1lHMFlra1BZbTlKbEJkRTVVZ3h6N2hsdlhBOWRhUFVmV2MwR2F3NGFj?=
 =?utf-8?B?ekVFRnVwK1pqUWxSbFBKWEVMNjkwekpxenFVREMvUkNrS3p5TkJHSDJZd0ZV?=
 =?utf-8?B?cVI4VzBsdkxQUEhoeWgvS3A0SVFEVEdtODlGVTh4K1h6MEE4U1VWamVsazVS?=
 =?utf-8?B?TEVVbS9aczdsVzBtaUp0bEEzOXlESjNFTEoyTHZEZm1RZ3JiNTB1dWxmN1pu?=
 =?utf-8?B?VVdMb0Z2WWhJRHNHalJkdS90dXlXQXB3WkJmSDViOHEwQkxYbWhMQzhBVldy?=
 =?utf-8?B?aHJpV2Z5R2k0eGcvNHV0VHJJYXVGTmcrOTFvMThCNmpaSzdVUVh1UFNEWEw3?=
 =?utf-8?B?enVrMzBwNWdJR0VIYUZXd3lLUkhJSlBwVnF3TXcyRDZYT0gxT0g2VFpHdEtW?=
 =?utf-8?B?dkZMN210QkpGNkNlQS9rUC9iRDBKQmtvOHRNT29kNVZrbGlnTmF3SzJYVExI?=
 =?utf-8?B?cHNleUVJbmEvcTJMNDJLb05OL3RTSVRMQzkxVGFjeXl1MnV1ZFV3YzBydUJG?=
 =?utf-8?B?eFVsL1RFVXhrWllFOUliZWVSOWVyWm1wbWN3VmJOVzFwQW1pSFpMM1RKblJF?=
 =?utf-8?B?aW5FR3pGM1IwWUhTYTF1MTRnak1KeGdOQ3hjNTRhdFFrUFVoQ1E5YTlEQmd6?=
 =?utf-8?B?N3htclRwdG4wdHJ4eEJqaGxOc2hvZCs1M1MzQ0ZTV2tmRjRSUmZkc1IzTlRB?=
 =?utf-8?B?QXRSTnNKMlRiMitZQjlxK1dRU1Zna25CbUlaMElCVUE5TGFTRk1vb0Jpc3Jh?=
 =?utf-8?B?Rkh3UkZXeXY5Q3REK3Z4clpoWG9NazRHeW5kZUtZNUJpVWd5MWRzMjBlaVk0?=
 =?utf-8?B?dGwwMW5EVVlFekljYWNtQjFEUnRkbm12UEZVdk9lY3pMZ3RpTzFERGdDclp2?=
 =?utf-8?B?Y0FEdk5sd1g2anFlKzJDdVVFb0srdzVnK293b3ozRXRsdkZXeDJTVS9DV2Iw?=
 =?utf-8?B?cytGVTY3c3V4aDZEK2kwSmVHLzVxcGpqSTRhcFphd1Jkdm5uSXY2U2xibXBM?=
 =?utf-8?B?L3pxQVFjNTREcGFaSVBlaTBFRUF6QkxEcUplQ2Z5STljSmJRTXZGT3FZZTds?=
 =?utf-8?B?OVdqRlZmc0xnY01QMTBQUnFyaWxydFVxMk5veVJzc2Z2YmJFRlFYWE1IbGFK?=
 =?utf-8?B?R1dOQlMxcUtLckZVTGtPWng0RFg2Z1pSMklQck5rY0IwTldCSjJPbDZTTUQz?=
 =?utf-8?B?dXdpMktraHdTRWs5eVJBWVBoVWNZOENJZDllKzJlRnY3dHVNdE5KaDlrQlRu?=
 =?utf-8?B?R3NzajIyc1NjZktPdWlsemZBOENSWWh2RHdhV3h5cytHcElqaXZZWGFzN0Fr?=
 =?utf-8?B?ODVwbFhwaDBRSTZKZnRmOWxzUnExNkd4TC90eDYyeHBhdFhDZ3lRTHU2R1RI?=
 =?utf-8?B?OFptMzUvUElpRGdIaEpXU0VQOU92QzBZdms2ZHErWi96cExxOW90N3lMUCtX?=
 =?utf-8?B?UjhIWlEySmJsYVloYVk1YklST2JNelllWmNhWk4vQ25PTjRxVkttZ2xsN0Y1?=
 =?utf-8?B?M0ROT05vUUlUMFYxV3lmdDhpLzlMM1c3REZ1L2EyVHdwbG1GWjRtUnRUYUtx?=
 =?utf-8?Q?kBV749yc/2pL/73xS0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab62c28-14b2-4c0d-7efc-08de8f08f983
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:36:24.3265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqWUBVqMMxeEYk2UIB/wqlcrqPTfBsRK7Ai7p+EqQpSH8WWHrkJ3ubyOSOrmgdHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-101013-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: E22D0367445
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:20, Thomas Hellström wrote:
> The code was reading drm_exec internal state to determine whether
> the drm_exec structure had been initialized or not, and therefore
> needed cleaning up, relying on undocumented behaviour.
> 
> Instead add a bool to struct msm_gem_submit to indicate whether
> drm_exec cleaning up is needed.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/msm/msm_gem.h        | 1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index cb32093fda47..762e546d25ef 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -452,6 +452,7 @@ struct msm_gem_submit {
>  	bool bos_pinned : 1;
>  	bool fault_dumped:1;/* Limit devcoredump dumping to one per submit */
>  	bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
> +	bool has_exec : 1;  /* @exec is initialized. */
>  	struct msm_ringbuffer *ring;
>  	unsigned int nr_cmds;
>  	unsigned int nr_bos;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 75d9f3574370..26ea8a28be47 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>  	int ret = 0;
>  
>  	drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +	submit->has_exec = true;
>  
>  	drm_exec_until_all_locked (&submit->exec) {
>  		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> @@ -304,6 +305,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  		return submit_lock_objects_vmbind(submit);
>  
>  	drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +	submit->has_exec = true;
>  
>  	drm_exec_until_all_locked (&submit->exec) {
>  		ret = drm_exec_lock_obj(&submit->exec,
> @@ -523,7 +525,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
>  	if (error)
>  		submit_unpin_objects(submit);
>  
> -	if (submit->exec.objects)
> +	if (submit->has_exec)
>  		drm_exec_fini(&submit->exec);
>  
>  	/* if job wasn't enqueued to scheduler, early retirement: */


