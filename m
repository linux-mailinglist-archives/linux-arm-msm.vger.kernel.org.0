Return-Path: <linux-arm-msm+bounces-111009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9SB4OMg/IGr7zAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A200638CF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=MVbcBjrr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111009-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111009-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6B153016EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E493385B6;
	Wed,  3 Jun 2026 14:33:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011030.outbound.protection.outlook.com [52.103.12.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B428224F3;
	Wed,  3 Jun 2026 14:33:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497197; cv=fail; b=C828b53M/ybrPy+cNEEDdRNP8JO9Iu93YIRrtxtmeKVsbrWTqULVVECfq5E8ZJh6QhbWko0luhTvd4JhC894TCHjlfZvBFx30e5OreY4F/5ri7E/Rpn714r98OqJOShNgMngYjkTrDUIaZNQA861mur6FcSYyCtyqLopWBUxRvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497197; c=relaxed/simple;
	bh=rZ7VB/8WOIyzYsNV/pRH+g9bkCQ4DNpuvnPsVBANhC0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qDEokue0yW5cgK3xhHBR3hZNlNPuV8dQNgDQQbU+716Mndx6OPTe31rhZhOea7Bq84kcoEl1vb3+KcaMpRUsRzC5nJ+EjJWufv2zCm8hqIzYi3/WlWCy0JzQVntKGdQtcaRa3VY9A55+2J1Pxg5RBrBaz8BCTGYrbR23LpS1MkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MVbcBjrr; arc=fail smtp.client-ip=52.103.12.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQSzRcpZiUGDRxwQXhTBFFTYgFM7ZrZbUyLDn7bWHgh3wHcsx9GbXrw1AC/GWWBbxwJGsrTb6BXJvNIaHtzxn0pv3zYyL2as61VQ0PJXN+kf6jxBb495ikMyKdzc0qvKb5LNTzi48/pGD0Fa7di+HSlD0CEkDZ/qeEGF1d6Yz9JK+QccIukP6+ZWYu3eB+5xeECTt3nuFGN8Of8/QW512zR0GLrjsb/B8YHvOu+sJWEAtiHzlYfoqPyWSjyAFNX/TdVGrdtYDcY3dWN37sRyOmPXJ9ErZncQlJyOnO76UzdLNs4SFJ6hedTz4cpX78fW+zqjBXKbVUhwSNvGXc40CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXkBvoeoRCN4znqhRsBzMtJTpdHGbKWN36Ewv3XRad0=;
 b=KFgrNAmUA2wLpNVe8M1eZYsWpQFMvuzPILYE3XwWQJWalBQO/3txkPJWU2NMKrOO5otHkdDSUtNP+ezhz0xY9h7OVv2tdU2Id1t8mOlnfM2Wlk5BnIuIqvvhxBr8L+TQ7iS06WvH+05AXDGs/sTBDfamhSioWvawNiA5C/KS19WBCBWsPB/HH+qcw6OffFb/wlGLJ69KLY3lCpuGbp+SiPoRwIrWmQgioNCnYbv+aW/f03EnLne4I8yAqETa+DhjBD924bOJxYM9rJUNfznbi0tprsDtsqrsZ4Dp5FFJoBA2aibGym723EtC+AgJhiFThnm9txYm89H/xI+o9MANKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXkBvoeoRCN4znqhRsBzMtJTpdHGbKWN36Ewv3XRad0=;
 b=MVbcBjrr9LiSVUJq7hXVEJy6RjhGGcORYN4/zjtB11GZXoWB1U/15XXNrOf3hVJ5Yq3GDHWwykxpoc0o5EvwEHEu7IsItSzK5LvbPiA4J0LleV3cfgUJXVa7EzzMdm+NWaJg99oMTMna/Ymd0B/0NDVzOcl5IzX7uNKsTDRj7QK6OXC2XZKIlLNm6u+LkMngAWTmRGuKItAF8/L6/0GPqaT4zAnaVhmRk2+DDeBaZyl90qPAlPdmvfbUFVkiaz3VW6hTcDShc5IlY72vT1YLCdH6jNGxvEttopxEMuAZ8ZZK0iRfE/p4OeowBaTlrIKdblu1JlFwDiOdeyFrYpiWxQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DM4PR19MB5737.namprd19.prod.outlook.com (2603:10b6:8:60::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:33:11 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:33:10 +0000
Message-ID:
 <SN7PR19MB6736DAE904C978C82B95334E9D132@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Wed, 3 Jun 2026 18:33:00 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
 <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
 <o4a5xuxznwkgpdj46w3xi7ouvktkwziedkbkdmd5aqdzd444qm@ggkfcgyzjk6i>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <o4a5xuxznwkgpdj46w3xi7ouvktkwziedkbkdmd5aqdzd444qm@ggkfcgyzjk6i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI3PEPF00007542.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4d0) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <a38214f6-c11d-43be-b028-b69d86a2cd0b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DM4PR19MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e643dbd-7e05-438d-4366-08dec17d08fa
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkfrsZE+qvEGYsfp0Cjh0VCHVMEoCk2GizosNHJfFKpgfg64Qc55wA584rpLYDCVuJriXotFBl7feAMACj2tqeDp2XAxCU5cfTiHViZvRBivINL6NigFhIllbmlKefkHSIdZOMVTBIZ0y2Q2Dv0mnEeH6oHLMKIVjZ5ZeUcHMx88BEcb/PwAzafDkiLd5sklb9hS7hbzO+YWA/Wn4oexhBLwPE9lkMNSR6kVHWHWR2jHXLeKDYcY8sxdq7l7Ze5p7mDhSIl+41tqMH/wws13TQ2hE+KwWQknKbpZYw+fW//rZ2NXJGzH7rGWXt0jn//jblttpop/dZhVmvDMQh/FfyywvyBGxTCChhsjfczyDMNt+J8yhDLkFfWr3EwzIOeGP2/fqwKS4yZGrNVeaINq6IkzwDqgkK0N029VoU/H7iiKx1CZGU/Af1wQ4NQh6Cf5BVP3yd2BkQLwFS0BWDR6IHLtXs3VySokwGZOw5rkxr3t9jLNnRvFWuFEldpQ/a2JFXX2HcEHLl1QODPCMdgDM2oEp+nZ2nznyLsSETrWa4mtzDlruage50VBYPiXU8dMKgGFWX499wUU2woHObN7sdNFGNjPRq9ax4+wGDiszmdCR1E72ejXKpbZD2jeHIvka9D6L7PS1ZikW1p8sEt4Bh0P9CKt7Y4/cOCo7LAKzGmnTKqAPhjTGoayBqcYL/PnTgtylNZD2jexwpF9K6h9t3/F7t0K7vazrORKK+vXcuXlvsw3bwQChBq8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|6090799003|37011999003|24021099003|41001999006|51005399006|5072599009|12121999013|19110799012|23021999003|8060799015|15080799012|40105399003|3412199025|12091999003|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkFYQlZ0ZU5XbW93Tk1COTdjOWhaVUZNYjN3WGV0di9XOVNzc3QxbDdZOHpy?=
 =?utf-8?B?NVJJZFFQVExuOFlaeDJHOUk2M0FVOWhuZkV1ZFJXT1ZLaFRtaXE3RVZaQ2Jy?=
 =?utf-8?B?VEl1NHJPeVc4eVh0QWZkczd1RjJLcWUzbVZwdGlzd1RDbDBLUnp2Qmx4bW1p?=
 =?utf-8?B?NzkwS1ZOMEEzdnFsd0hYRzV2T1ZLQzlpYW41VElod1Y3NkhUSjdYNnphVmlK?=
 =?utf-8?B?NGFFZ0NiQ1BSV1VqUHAzRWxrbGVkVzA1bDI4cU5RbHYydnlOWGpNdm5ZMXFN?=
 =?utf-8?B?Q3hhenRXRXFubWx3czVzSW8xaVlyOTAxYjgvQy9rK1lmSVFGNFZpNnBGdnl5?=
 =?utf-8?B?S2NqT3I0a1A2SSs1N2Y2VEdtMHBpUm1qQXEyZXJLMFcvSlV0V1N3OVZLMXR6?=
 =?utf-8?B?OXh2V2RvQkxGN0E2YjRFaktXUmlRaWVqUzNiUEhtdkVMcENjcWJqakpKd0ZI?=
 =?utf-8?B?eUF2d1hRSXB2TWlpVVdyMnpKc1QwSTZzaDg0S1FGYmRtS3lxN212VUJWZ3h3?=
 =?utf-8?B?WHJGZ0pzSmRhaGpKYWNKOFo3bURSRGNPTlJQVnBSNmtnczExSzdNZVZ3SVdn?=
 =?utf-8?B?SkpMeEhoVXNtUWluWjhCdnljRy9nQWZoRk5xOE1iZkdOMVZEci9BallQSlR5?=
 =?utf-8?B?N1VsRS9KdnY0SDdLYlFHbml1bFFrSUVocjRTTmMvZjdmTlJBYjB5T0NGcjZG?=
 =?utf-8?B?NWtUTU1zbkVzVUM3NC9rYVc3Y1V6NWpUYzhQeVRBWmg1aGRTVkxDOXMrYzV3?=
 =?utf-8?B?Y0RmdGI3MGp6b0RDR0ZYa2Z2M0ZyT0Y4YjJpZytGK05LeU8ydWVTRFNzWExx?=
 =?utf-8?B?MVZEaU42Nkl4ZmVZSVo0OTlhYnZlS0hUVlJwZkJmTlZ5TjZyalZNZG1LSlZG?=
 =?utf-8?B?c3FNM0h5UUNiRjQ1cFRRRDFaMjQ4SEtDc0grY1ZEREo3NVppck9YMlZZSitC?=
 =?utf-8?B?SGNWRkRkaVVVaHhRMG9EV3lMKzIzQzc2MVcrNnNocHZaYTZKbStjM0N1bXhJ?=
 =?utf-8?B?MmQyMHpJQWtBRFBRMFVQaGY1QVpYeUdsc1dNV3VIMDdFWE9nZm9KZzREa3VF?=
 =?utf-8?B?bmtOZmcwQmg0M002MmhqVm9NdHhRNkYrWVJlR3VhcllQenNncFVRTStpeHk2?=
 =?utf-8?B?SkdwQzQvUFF1bms0elFuNlZHeDg3K3U1MzJlVjVMRWIzc2lqVHRVSmxUNFVD?=
 =?utf-8?B?RHRDK01ZM3J3S1VHaGVibWdXa2RWT2R6b01FcGhJNnVhNGNvbzZZZkk5UXdl?=
 =?utf-8?B?LzdyOE9Ub2JUM0VWODNYSmp1WmJTMmpHVGNjV2dDR0wreTlINEFSVGFVQ3ZH?=
 =?utf-8?B?bmJIN2haanBpQUxmRFZNTlY1ODdnc21Ua0pVMUZkUnBkT2tIaHBSaTZ6N2xo?=
 =?utf-8?B?a1VvVEcyb29uM0owb2F4TUsySUpQTWlzcm5HWXpOZTZvWTlEWG9rY091Q0sr?=
 =?utf-8?B?TzJOTGlZMkpQMmd5Z2djZWtVOWpvT2xQaGY3aGpFem14RWhVaDBnNVBreEM4?=
 =?utf-8?Q?+V1y7MU6NXi/jn1qV2JbjM1cYSZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1udk8wZGFGMmlyVTR3M21BRFdBWC9oNFEyeWVwTnU1SEg5dUMyb1RxMmY1?=
 =?utf-8?B?NkNabWtXNnZjVmNCeWxyTmY2UkdmSm45cmQ0UGtTQXJKN3BlKysrU1lCYzNt?=
 =?utf-8?B?dmRHbVNiVE1qTkF4U1hmczdBUGxzZlU5VXp2d2Jjc29ucFY5aTFNNU05eFhM?=
 =?utf-8?B?WkM0WGdBWW9FRE5OSzVWZTdmVzdmbDVhRCtmbk9xQlFJKzF6S0VBWnRmRUEv?=
 =?utf-8?B?SnUvY3NPckNjNHhVQWVJNU1jQU8zakg2eGR4aXA3ckVKcllMMDlPTlVFV2cv?=
 =?utf-8?B?TjcySGw5NG44Wi9Id0pCczY5eTZZdnBvVDZ4aHh2aUNLRXNOSENTRm9WNjRP?=
 =?utf-8?B?Sm5FSjExdDFZdnBJUGUwSmdmVGpNbGx2eEExQVNIdmpEUnVlM0NQZi9FOE1D?=
 =?utf-8?B?UHJ3emtlbi9zOGVSUTR0b1hpL0wyL3pqM3R0a0JPTnlVNE4reU5kaUdoNk9j?=
 =?utf-8?B?bDJpN1A2VFhEanhRQ0Q3Wm1aYWtmd3VPRkY2WGRTR1JqYzYzNEx5VEI3ZkdY?=
 =?utf-8?B?N2l3cXgzdEtBRlJWeENtOFZFczFFODNXMG1BRFlWTnBtY3dndEYvVzVXbjZu?=
 =?utf-8?B?UVE0QXVpMlltdWQ2VThXTXN2TnExd2cvb01qc3FWK2FIYjRxTkN3bnJkOE1x?=
 =?utf-8?B?QUJHN01OVC9xOUJHQmh2MkNPcEZtR2EzVlhWMFpOZmNDSFpsd3JJenAvaWFh?=
 =?utf-8?B?Y0wyaHNvaWtEdTRVRGFzUVVtTWRGeXBPRlc0bStVemozeTdST3REcTgvMEpG?=
 =?utf-8?B?anR4d3RqMGwyWGpqdXVNLzdpY1JPYU9IRWRIYnRFZFJQMlRRT3VMaDlJSnVh?=
 =?utf-8?B?K0dJc05Sd2s3SmRKRWFCRU9OYytzeHE5dUV5L3pCdjBHS0hxN1dvT3RmdDl3?=
 =?utf-8?B?bUFZWWxnMitBWldBR0hCZEx1UVh3WU8wMGFZNnVyRGlTanlRNGs3d2NxQlNB?=
 =?utf-8?B?em5zY0JxSFpkTWVaallwcDlQREhyQ3BGbUVCZXlaSTFyYzZqS2FXYnk2Q24x?=
 =?utf-8?B?M0pQVEh3NUVMTHR3OVF3NXIwb0VKVzRxcHBESVF6aGg5ck96WHRxRWYzTVNS?=
 =?utf-8?B?TFlQdkFibGhUYlltT2RJSExmM2dwN2Y3VEpCMmVtSExXSU5MWTk3OFZOazJw?=
 =?utf-8?B?eFRNZkxCbEJxOVVjcHBLeFNYR3NzeHk4RTNyVVV5VDdCZTdZN0w1azk5enM4?=
 =?utf-8?B?NjdONVN6SVFNVy9xUnFSUFFCU1prUEpwVXN4QUt6d2Q1R2FHamFXNXBIdmp4?=
 =?utf-8?B?dFR3RlhtUWVXTGRTdEFLbTlCMmZQTlpVblBQMHFFRWdXemlPeFUrT3hRZHps?=
 =?utf-8?B?OVNsVWprdjgrTXdLWHNyMWdHd3JlL0xjWmtteWRNM2JPL3MrN2lhRk5VOXZZ?=
 =?utf-8?B?TXIyV2tYSFhobFpBMWdYYUJENGtDNEVZelY2c3VlM1JkK0N0bEJweXYyQzFN?=
 =?utf-8?B?TlZ6L2MvZXFXd2NBSVNqMDJnOUtuUUtLNDMwZFJnZTJzZXEvQzQrT0g5djd2?=
 =?utf-8?B?VC9GeW9uVXJFc2NzQWlQS2tpeGtsRHpHc3BVQXUxNmlRN2szejVoanY1SUkr?=
 =?utf-8?B?Yjlhdm9PdmtHUXliUDVsRXdtWU42aHNLcVM1T0FhdTZiSlMyZlF3YUpuekF4?=
 =?utf-8?B?c0FZOXdHVlVVZ0pWN3h1VVlHZ0JVSWhBSDhhRENvNWtkMzVKSHhTTCtVRGRv?=
 =?utf-8?B?cG9EY1kxbWxRNDNyVU9KL1NVakhkZjNKMmZVbmdOVUFCY2JxeXA3b3I1OXRT?=
 =?utf-8?B?UHMwQVN6M2hrMnN6aDM4QW1oa1ZXaGlxekpyR3RnejIzUUJ3V2lsSzhBUUZh?=
 =?utf-8?B?MjEyM2w4alR6T0hFQlM3dFFGMFlqYlIxelZjME53RjM0dStVWXBMdXRVODZO?=
 =?utf-8?B?b2ZhQ2NEcERWQ2NGREhsb3JjZGY2WHN5WDRNS2trSVQreUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e643dbd-7e05-438d-4366-08dec17d08fa
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:33:10.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5737
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111009-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:dkim,outlook.com:from_mime,outlook.com:email,SN7PR19MB6736.namprd19.prod.outlook.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A200638CF4

On 6/3/26 17:53, Dmitry Baryshkov wrote:
> On Tue, Jun 02, 2026 at 10:50:40AM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Acquire and enable the RX and TX clocks for the IPQ5018 PHY. These
>> clocks are required for the PHY's datapath to function correctly.
>> In addition, gate the clocks upon link state changes for improved power
>> management.
>>
>> Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  drivers/net/phy/qcom/at803x.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
>> index 63726cf98cd4..b7361a14220d 100644
>> --- a/drivers/net/phy/qcom/at803x.c
>> +++ b/drivers/net/phy/qcom/at803x.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/of.h>
>>  #include <linux/phylink.h>
>> +#include <linux/clk.h>
>>  #include <linux/reset.h>
>>  #include <linux/phy_port.h>
>>  #include <dt-bindings/net/qca-ar803x.h>
>> @@ -176,6 +177,8 @@ struct at803x_context {
>>  };
>>  
>>  struct ipq5018_priv {
>> +	struct clk *rx_clk;
>> +	struct clk *tx_clk;
>>  	struct reset_control *rst;
>>  	bool set_short_cable_dac;
>>  };
>> @@ -1062,6 +1065,16 @@ static int ipq5018_config_init(struct phy_device *phydev)
>>  
>>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>>  {
>> +	struct ipq5018_priv *priv = phydev->priv;
>> +
>> +	if (phydev->link) {
>> +		clk_enable(priv->rx_clk);
>> +		clk_enable(priv->tx_clk);
>> +	} else {
>> +		clk_disable(priv->rx_clk);
>> +		clk_disable(priv->tx_clk);
>> +	}
>> +
>>  	/*
>>  	 * Reset the FIFO buffer upon link disconnects to clear any residual data
>>  	 * which may cause issues with the FIFO which it cannot recover from.
>> @@ -1084,6 +1097,16 @@ static int ipq5018_probe(struct phy_device *phydev)
>>  	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
>>  							  "qcom,dac-preset-short-cable");
>>  
>> +	priv->rx_clk = devm_clk_get_enabled(dev, "rx");
> 
> Why are you enabling it here? Won't you get the notification to enable
> it if required?

it was mainly to cater for the case of a bootloader enabling the clocks
beforehand (especially during testing) and increase the enable count so
the CCF doesn't complain and spits out a stack dump when trying to
disable. Perhaps better to add if statements in link_change_notify to
check whether the clocks are enabled and then act accordingly?

> 
>> +	if (IS_ERR(priv->rx_clk))
>> +		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
>> +				     "failed to get and enable RX clock\n");
>> +
>> +	priv->tx_clk = devm_clk_get_enabled(dev, "tx");
>> +	if (IS_ERR(priv->tx_clk))
>> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
>> +				     "failed to get and enable TX clock\n");
>> +
>>  	priv->rst = devm_reset_control_array_get_exclusive(dev);
>>  	if (IS_ERR(priv->rst))
>>  		return dev_err_probe(dev, PTR_ERR(priv->rst),
>>
>> -- 
>> 2.53.0
>>
>>
> 

Best regards,
George

