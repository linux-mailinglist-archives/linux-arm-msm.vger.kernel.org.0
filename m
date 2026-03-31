Return-Path: <linux-arm-msm+bounces-101017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD5KHYuYy2mYJQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:48:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C980B36754D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7460C300F5E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC9E3ED5A7;
	Tue, 31 Mar 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TCED0JKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D23ED5DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950413; cv=fail; b=rN2mr+3hdM5JcvBfI7h7g9fv6K3ylOGKONIXAyZhRjd5MM/IX1ibZ+95m5tbHDfmmKsBvnHpUNSbl8SoOxmaHVK5p393rufOKRPa042kmA463vKYNSbArBkj52HdgdUGTg97jcr0+MGvKETIaeh08p3wqGtbBkv8WA/udOOGT/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950413; c=relaxed/simple;
	bh=jjRNBuCL1XFOuBebTavqfvCuvek7lWkuSNirG6gLys8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kFDEajhst3Moyy+T6UOdLlGgYPsOTH8c2ayTVNG/hqsqy2G5XLyfDS/kYyo9VlxvHxaBszUM2jsP4fIIiASBquSSfXtd4MYdmL5Jdg/xYCKyGUw6vtScetPaSy7RY/P4d58CIgWq4XsQVUFDE1xUbg0UALXLojHSVe418jyQ5Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TCED0JKj; arc=fail smtp.client-ip=52.101.56.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr47DFdjAgOvGVf/WoWWVAex6UCK6ahlNxXCkOHZRlO1dETd1LyqaVTcfA+cvNdWNjqZ/wKsBiU0t/yfRx0io+SWyZytCNFto5UTOyR3aUqeXtVJnJ2w6bBeWJi4uSaxbAlHfP/BzNt2ka4Lc7ZFuDHycmQJEEfnX0c0/6LJG3ahhDo1UCa0o0Bsu/9lTKIHoXFl4EpJ2AXJD319i+S8qlucSgBeGxhMP95EtkwDgX60tCLviaj5eoNhHNRLcoM+b6exe0ShkBg5vnCffwdr8/1n0gWjqYlPgR0eo3KL/otX1r/emQnDoQ8FzepGFMM64//yaN1quBHa+gVd5I2rQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ISJK8XWJAC0Hpkw6jQsnuYqpA1s+yZTQhivQ4OrxKs=;
 b=RtDMb+tEl0MMP760b7n9mQQM7WyWxr5+22rdEfKW+AslVCGKUjmypjnqbc0ceJB7a2nEpAe/poly+3skdyXT/uQLLMKQZq6OETryPe9H6rb0WRgxqHNcs3LRPJrNzAWfdCoQyOddCosWnGi2w9r6n+fluDyBhd1Z6kJx/m2KfFm90KmIP2rCK5sFgMxIJ4yay0p/rqDYX4mkHOADYs0FTFYgI693ifo9MW17n+hB5INWj18COpj0Gy36CJY+r47i99usFaJf+MnyOGwpNLbW7SKpnFT8S77QtPRuNyjcns4hW0z7UWbThEjX87U9gKLXrJG3tm6zQCLV2Zz/e01zCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ISJK8XWJAC0Hpkw6jQsnuYqpA1s+yZTQhivQ4OrxKs=;
 b=TCED0JKjgdhBYol6gZI/YouruBAaSxTyDhcbEjuvD7Qu07xI0HIf6dD9lwlV57uhRNdrjO7LOTOGa+R3vrV0pbibECnAsQqn5cmrhHUdYGYVmPb75QgthTFXSrDXM46fem6QkUW0QpDGTv2LidWKvXVymz5ub/qMQUm83xFKYns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 09:46:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 09:46:47 +0000
Message-ID: <ac68886e-d4f0-408b-9ddc-909cda18c6f5@amd.com>
Date: Tue, 31 Mar 2026 11:46:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/exec, drm/xe, drm/amdgpu: Add an accessor for
 struct drm_exec::ticket
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
 <20260331092023.81616-6-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260331092023.81616-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 50bc9d59-c5d2-435e-dfa4-08de8f0a6ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/MRL6+5ZwL22Z7KRF1MgzHtEYVofYO1+Qu7BRsKIChjjYZ48KxCcx+7Exz0hT2+8hWxh6z7TeD4tvz/T9vJnkRx16CnW+1X/lSwQZYW79pql058ambmw9I6moZVzTIKPWAtLLFfoi8zdB88n5c2LGOHc8YfrcaTbNEwRqlo35s2qA1Bo/LQKHu+omUj8dftWmelvH6alVV2UWQ2FsD92kcIChfu4DElzC1IfUk40JM58V0js4UDz/qekC+vz67vr7wqygHhHe6NrU5vVfJHQ2m1OIVgzHnIJ1N1zsHokPr/HC3xZsbgTkX/rDiQjSzmEMK6S28vU+e63CP1K68gy6fwI/X9gGetg5ejlCdTQTul+3jMkhOtE5owVs2dFyX/W1Zg2Ky2M5Te4rjmsyKuBnyxuUgcWG7tX3byMPPtBchVGZP2sSDxPUIdb6UYxqLtCOHtT+h0Lc6HphU3TqZi+l/c0nbXSBQq0VaSfE7nB5WCG7kMIfoqQmMg8Jd0LXvYyAAqAFuIrrFX9SdAfIK8h0C8lTaM8FWSKaCNxl1rzaDNIRGbl0bkgqE2CLw5XbpkkGTXsVwvLlZHeaqZGEW/ehA0DvUr0cIiBZLJLONcOgM3sUn7UUsLhKMtdxe7AwwWtWBwLUgD3zEqWCDqGMlWhRqtAsOGHLMEycLI9lp+R/JWs9+jrF+trg7zCVArubocdeMkmm+mEKipd0fl+spuGdZShyMkIqFbw57EqISwvBKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFaTHpYdkZPemRkRVJZY3k1cVRwZ1lUZFB6clpNVmlnK3JnNlVkYTl1aWlT?=
 =?utf-8?B?ZHpFTytidjBIQWxxaDVlT285ZVB4b2FoTHdOdzJpYTNOdzFkaDhoRU41dnpl?=
 =?utf-8?B?bXB5Q0tWV1hSMk1UQUx5TW1aMVlvR2podzR2WDlHeEFVNkVRcEpNaVN2RFFs?=
 =?utf-8?B?TXZnY2hXUGVUSmRzOVI5ZXcycnVrVy83SlpzeGRxVWtwL0FiQWtZejRnSDZy?=
 =?utf-8?B?amw3SHdER2kxamJQY1hJWUdkK1FxZXd0VE04TkVrWjhrbVlOYTlMZDlBRTdv?=
 =?utf-8?B?Rkp0THVqVzJrTU93K2t0NHBQUXNzMkpkcVBzZU02eEduYys3NEZPd1NaUnNK?=
 =?utf-8?B?cGVMM2FsKzFhR01abE1VSVlYSjJoUlJPc1pCNm5QRHFuVEZ6T0UyWEVIaTNh?=
 =?utf-8?B?TVY5Z2JxalpvSmpDVmY1YlM4eUZ3QkMrYXZsRWdYMWhEMlM4TEozUEhBSCsv?=
 =?utf-8?B?bnBNQm1oRGw0emU4RGlhZnUvbXczVjExcDVxZFNCaVhvS3VOMHRPQzI5TGZx?=
 =?utf-8?B?U1FMU2p5b1A1Kzh2UFFHSHR3VVU3SFg0T1F1RHJEZDRxUWlXUFdTR1FTUU52?=
 =?utf-8?B?ZGJYWUJualNyc3VhMkovY1E0T2x3ZHNuNHRUNlp0QVFqUWM2dmhCT25jZEJE?=
 =?utf-8?B?d2RuZTUyK0E2RTJPZGNaTzdrcDVhVklDVjBmYWtRZk5ZV0ozeXBTODNQUDdw?=
 =?utf-8?B?OWtMckJjQ2RvQWlvUUcxcGlPNjJCSGNqTDFtdkhkVm1Fc0JieGJCd2tFenkw?=
 =?utf-8?B?N0FJVzgzRXFXdHdaeVVzRTlxcXI3akNwb1FEWUVabVNxTWw4Q2Q5MkNVTWwz?=
 =?utf-8?B?SVQzbGtrNk1iZzNqVjNKdTE5ZEsrVFB1OGFPTXZ6RWdTTGVFMFRLMGdEYVBp?=
 =?utf-8?B?N3RYTkxRS2FDdi9OT1ZPTlpKdVlrSk9pQ0dINWVxUUMxTUY3V1lYTFY1MXJI?=
 =?utf-8?B?L0hROHliVTBHQ3VISFBJcnpqOHlZV3ZaK0lSTUpqUWlEVEU0NGphRytpUmNM?=
 =?utf-8?B?MTAxNHZ4Ykx0cTNhQjFPTUZpVDdoK0NhbC8ra2xGUkJhQk1iaHZNKzR3ekd4?=
 =?utf-8?B?ZlM5QXRPR1hyVitoOGh4b2U3U1hOWGdsemRIam0wM2phMVhtWlZvNWpsQUFu?=
 =?utf-8?B?aEYzOHRZcjhXNHY5cHcwemdWSFNWRlVJRWNIdjZjS0tYNStMdEoyK3AwY2xQ?=
 =?utf-8?B?ZnpYamJhSTdNQUtUTGxveUJmNEpHVlI4WkpQVnlLa2N5NVQwbHJtMGR6ZGlD?=
 =?utf-8?B?LzFpVkVEK3YvZDhsRVNwbnB6VW9PSlliWmNOSlBuWFdIWGgwMlk3amJhTG1E?=
 =?utf-8?B?RTYxWWRLZy9CT3dLMWIzQTZCdUVrQmxZWkkvVElZVU1yUFN3enk5ZVVHZGFw?=
 =?utf-8?B?Wkh1T1hNM2F4TjFYVDByUlZoMnRqRWV6ZStlVTFmTURkTXl5U0lieUJUWm13?=
 =?utf-8?B?TGxaaTBkazRrby9XQkxHTmY4SVp1Y3p1YjhvUDhSN1ltdkhYemd3Z2ZCRVpZ?=
 =?utf-8?B?czAva216M3JpTWJYUTYxNGRyVFAwdFlkczgzcU1iR2ZBck8xeDl0N1MvQUpx?=
 =?utf-8?B?YmNISGI0Tjg4RGZZbC9FSVo0NHUrb1M0SXFyQkpmV2tmbUQ2NDVtQ08vVkVC?=
 =?utf-8?B?T25sdkpySzlrNWZzRHBKRlM0THRNSUwyVzVvYW8xR2V1TjEzRDhxcjRESU5a?=
 =?utf-8?B?Z2VJeStoOE1kbCtET1l5cGs5eTU3eDhGSDNCaUhxc1lDSGdodnJHaWc5ekhS?=
 =?utf-8?B?bDczcUNpZkREaDJHMkNTbUF0bGhwamUzbkpndVp2OHh6NVVKOFVndkFVMGJU?=
 =?utf-8?B?YXRuSXdKR1VLcWpPWTh5NWV4MDh6MzV4TnlMNkNuN1pNOC9mbHRPRi8ydGVt?=
 =?utf-8?B?Mmdib0NVZjBWWjVMRUZCbGN4MVFuRXVjeHZhLzBad09XRnA4SDNIZy9yb3J4?=
 =?utf-8?B?LzBZa0ZRaUFjK3F6ck1yajhaK01QQ3FQM2NVVHpzWGNweTVZUUVYeDcxNXNE?=
 =?utf-8?B?c1JlcFE0MXN3MURzUlo3anN1U05pWStPZzZ5QlRQZU4wS0x2NGxKR3JPbUpE?=
 =?utf-8?B?K3VSM0M0ZGk1YWQ0c0w2NllkVDFOSWVSMVdsd016V2lNVzQ2VkVSYlFJeDFH?=
 =?utf-8?B?c1VrRGVabUg2dkIrSHRha21MSEpDYWRMZ0ZYTzEzK3ArZE5xMmU4c0xzZWhR?=
 =?utf-8?B?eXJRaFdPWVpyeTBrSVRXU2Zpa2ZyVHBLdmVlLzhFSEJKV0RELzRVaE91NHpT?=
 =?utf-8?B?WlIrWU11ZzRlSi9kT0o4WU1LM0hnQmp4Vm1LVmRtT3cwVTIvR3ZXOUUxb2o4?=
 =?utf-8?Q?YrOe3/0A5U5NBCzRRj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bc9d59-c5d2-435e-dfa4-08de8f0a6ce1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:46:47.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGQtcWtR+vHM3mAOHa/j7eF3sN6nnPMcbNDvyuEPTGvSsZN3hihdSh1BQzd3tPdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-101017-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid,intel.com:email]
X-Rspamd-Queue-Id: C980B36754D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:20, Thomas Hellström wrote:
> Drivers were accessing this drm_exec member directly.

I don't see a problem with that as long as we have documented that this is allowed.

Regards,
Christian.

> Provide an accessor, drm_exec_ticket() to avoid that.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 6 +++---
>  drivers/gpu/drm/xe/xe_validation.c               | 4 ++--
>  include/drm/drm_exec.h                           | 5 +++++
>  4 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 29b400cdd6d5..8a4fb9a62485 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2998,7 +2998,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>  	/* Validate PDs, PTs and evicted DMABuf imports last. Otherwise BO
>  	 * validations above would invalidate DMABuf imports again.
>  	 */
> -	ret = process_validate_vms(process_info, &exec.ticket);
> +	ret = process_validate_vms(process_info, drm_exec_ticket(exec));
>  	if (ret) {
>  		pr_debug("Validating VMs failed, ret: %d\n", ret);
>  		goto validate_map_fail;
> @@ -3039,7 +3039,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>  			goto validate_map_fail;
>  		}
>  
> -		ret = amdgpu_vm_handle_moved(adev, peer_vm, &exec.ticket);
> +		ret = amdgpu_vm_handle_moved(adev, peer_vm, drm_exec_ticket(exec));
>  		if (ret) {
>  			dev_dbg(adev->dev,
>  				"Memory eviction: handle moved failed, pid %8d. Try again.\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index c4ee19603460..c725a7976c63 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1157,7 +1157,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  			return r;
>  	}
>  
> -	r = amdgpu_vm_handle_moved(adev, vm, &p->exec.ticket);
> +	r = amdgpu_vm_handle_moved(adev, vm, drm_exec_ticket(&p->exec));
>  	if (r)
>  		return r;
>  
> @@ -1358,7 +1358,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	cs->out.handle = seq;
>  	leader->uf_sequence = seq;
>  
> -	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
> +	amdgpu_vm_bo_trace_cs(&fpriv->vm, drm_exec_ticket(&p->exec));
>  	for (i = 0; i < p->gang_size; ++i) {
>  		amdgpu_job_free_resources(p->jobs[i]);
>  		trace_amdgpu_cs_ioctl(p->jobs[i]);
> @@ -1793,7 +1793,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
>  	*map = mapping;
>  
>  	/* Double check that the BO is reserved by this CS */
> -	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->exec.ticket)
> +	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != drm_exec_ticket(&parser->exec))
>  		return -EINVAL;
>  
>  	/* Make sure VRAM is allocated contigiously */
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index a611438eaafe..8dff4d0ec895 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -156,7 +156,7 @@ int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_d
>  
>  #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>  /*
> - * This abuses both drm_exec and ww_mutex internals and should be
> + * This abuses ww_mutex internals and should be
>   * replaced by checking for -EDEADLK when we can make TTM
>   * stop converting -EDEADLK to -ENOMEM.
>   * An alternative is to not have exhaustive eviction with
> @@ -164,7 +164,7 @@ int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_d
>   */
>  static bool xe_validation_contention_injected(struct drm_exec *exec)
>  {
> -	return !!exec->ticket.contending_lock;
> +	return !!drm_exec_ticket(exec)->contending_lock;
>  }
>  
>  #else
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 5ed5be1f8244..50d056a87de0 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -151,6 +151,11 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>  		goto *__drm_exec_retry_ptr;		\
>  	} while (0)
>  
> +static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
> +{
> +	return &exec->ticket;
> +}
> +
>  void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
>  void drm_exec_fini(struct drm_exec *exec);
>  bool drm_exec_cleanup(struct drm_exec *exec);


