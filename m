Return-Path: <linux-arm-msm+bounces-59527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 070CAAC4D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EEE83A90CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579B1258CCC;
	Tue, 27 May 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YVRd2HsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2036.outbound.protection.outlook.com [40.92.22.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961FA3C30;
	Tue, 27 May 2025 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345040; cv=fail; b=D6Ws3c+kA63HuyfnRpougeJjt8iYBlsiE2vaCfnGyrPYPH7sC4DuHqjWG59S7bLXiRogmatMNhIDxFDYrbOPg88fwpF/u//kDEO0lE7jx/A9mN1jXSe3eXUaVgn7N/Sf3zynHTLHKjRxyci2yPP1eTiAu3BUQrClGGL8jPH9YWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345040; c=relaxed/simple;
	bh=Ns+hiOHrEk25HgOddSgA3KCpzEeqtugeKb3NsLb/JNg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hFxULCYtzru8hERLc+q64GTmKtQ4iSrN6Dv20aypSXlFP39BDGK9a7QCE4/jfrrCUzHKdhjf2tUz9wAozfGGxTIsz9GZ6almdADQrSLOEaEng0XECCX30aoCOjbz1LrNBl0ZBWrhtp+baVpSzgtdkpjx1k6TM6tF1D5fzEPAK6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YVRd2HsG; arc=fail smtp.client-ip=40.92.22.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oj3NWWJZzZpEFiQr82NBwqr73N7GIJgoCWj+D8Oin9WoWh5Finw2Y9o5xMJY18RgmWjHG2pvw9VDauNbObbK4/TLNRaq7goRAWFUlhzjOP5l5vQiS+XmKg8E3EMNuhPPDYd4GO3vNHiRJecQoPiUuZOmsbxIh8g2jFJRYVZOxWXtnDhWC1qv9x34SVS30hC6jB6GnccLeL8vrbY99u8QjSFVrvDBeXQHAvOVDL/xNTwGXubVK94baDPidi/L2M3iNPne+lZnVcr9AlOq9HCYeM8jCHVITAb3dR44kPtJR3NCtYvm4C6R8bAe70caafxgSTr/p7QSJESp1qvbqQQClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UR3BS3ghMjBAwaJ6Jt+YDBWc3Wf/qvrf6QVrazotvA=;
 b=ALjoMHHJ5dlA3ZclzeqIGLIKR9XHAbOWbFBh7K21ur9vqm4H+MzDqlO0NJznKsdeAvtzyiEg45wNi7/P6WSZd3ec8rb0316ResWnyr6g7OJdscCLwoBXJuuthLQ/g0/9Nrf1FCXHbKRtX8yb7KUsMlskkYlL+yJWpmyEfYgj2hglwSiJPt0wMOPwZELGFKFHPq1UMtc4ek7eRPRtPtXP06MF1F/D0Hk995K1Oybd3SJSdIrl/aVkCrijllJPT1HsfEvL6GZMdT4ndlifnJa9tMvD7u0AlionSaMo9r/Ol5TZndk3P9FzYfx88QBihRzFXsupSBYvHdN2enIRPH0C+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UR3BS3ghMjBAwaJ6Jt+YDBWc3Wf/qvrf6QVrazotvA=;
 b=YVRd2HsGdxL6Ln49QeHeWNEwl5UcgJxkJb6XYQFPEgNkp29LkWALiWv/BcvLswGIE0A5SRJuNvP3mzn2nhiO74MHEX8TKA19l43Z9f/2GUHWJjV86l8LaqJuuShHJMnb91+GELCB9wd7/MNjTqnRsw4KLrWSzgonDSJS0tf2KfOAh5oRwldfnoNmuk8+7MJMQmdRV+NBW0K3zIHGG0omrFiwA3De40tUAGlIvBZdRK1Ae/Z8UMtqwJG5qMjOyk1Cj7LZStY9e1zmApprrPVzK81qQJ0QB8YUMAczil+OIW3qcw51lNsMsfBL6HJ+d9UI5DFaAEyQGk/Qp3mHLP7x6g==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by CY8PR19MB6940.namprd19.prod.outlook.com (2603:10b6:930:5f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Tue, 27 May
 2025 11:23:55 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 11:23:55 +0000
Message-ID:
 <DS7PR19MB88838E2C42CF1EF29AD266BB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Tue, 27 May 2025 15:23:42 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq5018: add MDIO buses
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-4-ddab8854e253@outlook.com>
 <9e471d88-1ace-47ea-b1c0-cfb088626199@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <9e471d88-1ace-47ea-b1c0-cfb088626199@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0008.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::12) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <de6517e4-234c-4292-905a-78d23bd4fd9b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|CY8PR19MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: b211064c-03e9-4942-b06a-08dd9d10f6b9
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxOH7qI4NO56RN0VWu/oHBfs9Lq9BoAJtgfLKmLMQ2Z3lwTzcZ4UWnbjT+osvZHv4itIknUxOh0+j2jhlQIDh5aGh06QcICdc2Her6bh/cZLe27LlftD7Kx5KCgG2qBJXd/GXjjFOqDKadewxGmv8RCM/dqT1tQRyaCg23rlbIUdr4u/aysYowcC/gpcnbX9vvlBmMaohqxkahZf3gspdXjHOCNIeCk/CS6OJGKvF5lprHPCft/D/yN8pCj5R93jlYHiA2Z+VyMRR9lrE8MF7AOL6MZKDF7/6cKROO9lI0MlETlZsSSsz/ByILJcVhxoJ7XbISJpmO6HIN5MSY/NwWqjSQLzTER+lIzV74YegmigoBc1xqo6Vk8OsqG7ZVRiNr2Bx8xdQVLpmp6SzVNatExe13vp1xCptkKDX42ZWTSLOn+BEi9mSGN2IjJ7h5yip9DNTq2Qyyoheu0xc87JVyZz/pyu4u96FKUeCRGpRumt2gux2u4VNjgtQkyslb61fp1KA7tRLj0AIPzh+ekoDe+4ZqoamcEH7K6SOYcYnoTO1z5b9cajC02wjbPsBXl8Tfle4euxandnqVJ3aWoZqLBHOe0jB7Kv9vcYeR7ygkVCtNK8Modymomnsd/CQZaFz1hh9YOM7lzDXbvhoQv7TZsT7kwT3pKx243LIfHGV0Bep18KMC/g+fsgv5vZ4qFuzspnDO0xPkDhtqM0ik8AaS4dFj5wKb13IZlPQI+fEOer8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|15080799009|19110799006|461199028|8060799009|7092599006|41001999006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXpOSjFUY292dCtWSnhFZE9zMUZpQ2p6aldhV09DV1QrWU45YlQ3NStGcDd1?=
 =?utf-8?B?RHVqb3lSZ3hMcUQ3MlF3VjR0TVNWOEU3OXZtdFZwbVZ3RTI0UWw0Z3F1Vjcw?=
 =?utf-8?B?KzU5OC9PUW9QaXZ3K2hJWThCUVdpY25kWUxXbll0VDQ5RGN0NjFBVTlDc3di?=
 =?utf-8?B?elJLaGduYUNVWjV0aUgvekVSN0txZ3FJaFptMmZVdVZHdUlLU3dMOCtLYWdj?=
 =?utf-8?B?YjhsV0VsVjJMYkxqR0g4YnhSQlhKLzVIa2xzTU0xYTNIQjN5VGdOVHBIbGdG?=
 =?utf-8?B?RnYxd0xEL2VwQmJ2NTdQakZXajY5QmordUU0c014M25zYU9kTU50Z1NBRy8x?=
 =?utf-8?B?cG56V0ZnYzhMUllYOTRFZVdhaUdManQ0a2orYXRDWVVuMHpLMWpxWFVyQUJF?=
 =?utf-8?B?b2ZjbGFjZnB1K2xsZ3ZoWnlBVzE1dW1vaU1OQnV2bEtLZ3FocEpvSVVGVllv?=
 =?utf-8?B?Z242VzlVRFRMOGtFM09rbWtTaHNYNFdwRDR5S2N2UDVLVVBZYURjWHN4YXdR?=
 =?utf-8?B?eElqZ3M5MlBOK3RUeTZJZGpKUXh4L0NkbkFkZXZubEVNalQ3NkFuY0xMb3A2?=
 =?utf-8?B?eEd0eXliTS9KQ3EwUDRvaHhJdVF0Y2IxdjJKUnRacis5VEJpOTBzUjJHaFlv?=
 =?utf-8?B?bDZpMTVhbTF5bUJiMWtKV282SU81djhrcDFEcWRCbXgxL2ZNb1l1Q1hjdFcw?=
 =?utf-8?B?VGVrbUM0RVRBbXhTR0hmbGJtcjNWdXVCeTB5TkdDWHM5eFFucUZMMWJwaGRX?=
 =?utf-8?B?NkUvY3hHMTZPd2VOazluQmFOTE1YOFpqKzlEaE5FZTJHUHRoTXk3ei8wbnkv?=
 =?utf-8?B?clNzVU1IUHdySmYwaVp2c0ZKbU1JQ0trWGVlbHVtcCtGdVdUVzF3OWlrU2No?=
 =?utf-8?B?QWtDNmltRmU1L3pZOXlvbXMwY2RSUDkzUitCc2V5WmR6M3RqOXZMTDJuQnpi?=
 =?utf-8?B?blhWeCsvWUhFS0RZT2NyVUFUWWdUVXNtZE1XbFZnV0Q0MEZ3dUlzL3IwV1Fk?=
 =?utf-8?B?akNyZUp3SlVhMm9tQlFndEMyMzFDNkp3TmNOdWZhWDZxVGpadWpjaVoyOTF6?=
 =?utf-8?B?VkdzcjhacUIvTE1yelhjRTI5Q0tJTExTR2Y1c0lWUmpiNExzSGFyMXJtejRL?=
 =?utf-8?B?VUFsR1FFdkYrLzFDRXJQUVp0S2hQUVcwbXlBdTJWSDdEM0wvQUdYNGZqMTZL?=
 =?utf-8?B?M2w4UzdiZGNHNHJuNDN4aU1sODhhY01CMHQzbTNFbC8rZWFpSCt0R0lxNWNQ?=
 =?utf-8?B?VFFoT1M1WHhjUDVPZ2srRVpCNTdXWDkxWDE1L1AxK2lXbDhkQlM5eVVzbkFo?=
 =?utf-8?B?am5hTW90czloWTZrRXBJM1FmSWxkU2JQMncwRFN4VXRMVU02M3l3Sjl4di8y?=
 =?utf-8?B?bzYzNzJLSTZiUzVpcmVPQ1hPK0UzTlpNejVQWWY1SVBoK0JBQkowMmdCNWNG?=
 =?utf-8?B?dW5JNU5yMFFodVBCNjYyYUJMWWo3SjFiVjVpTmtsbFo1Y3FpREdHWHRnRWVi?=
 =?utf-8?B?aUdtenF4Tm4raUlxOGR1WkV4TDF5VkJwV3dXTHk3dEVXVXlpS1IvaHQ0K3Vo?=
 =?utf-8?B?R2lNRDdtZ1JVNnBEeEJ5bzNjTDJqOHF6N1ppYzJJTUNLRU9KVWNnb1RUY3lV?=
 =?utf-8?B?K1YyeGdseGtzb0NVTlNPNkpuUnVHcjZhR2pxT0oweFdXbVhzTUpJblFEenR0?=
 =?utf-8?B?aFJNTlRuWWVhRWc2V0FEZHdqd1Jqcm1reUpqbHdhOVFXRGtFcUJWOFVjYXQr?=
 =?utf-8?B?dkNKdUdzTFdJMXVHaUxqWHU1ajBGb2lpUXZBL25pajNGelN4SjAvQnN5MFNr?=
 =?utf-8?B?aGR0OTZaMXFuNXA2eEMwaFEvNVQreDRWUDB1Q0xod0QrZUhUMm4vWFdWdnF0?=
 =?utf-8?B?ZUdWb1VkZkw4MGlUeVRibWNNa09PUHplcVZRUm1WVDVEeHFGTmIvQy91Q0xx?=
 =?utf-8?B?WHY5K1V0YzdmQytjcjdwRThNd1NtV1dGUHZ4QVJLVUhnVVp3Vm1RVlk2Z3RC?=
 =?utf-8?B?d2FXVXNDMk1nPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHdlUURMbzcwbE9IUGxGZXpkQWFMTGpMWlB0U2RwVWZza2N2UEVXdWRsSXFO?=
 =?utf-8?B?eGVTb3pOSUFWa004eGFBeS9LTGYvL1lERmVxOUJkR3d5WkZqUDUxRTFKYk1Y?=
 =?utf-8?B?ZkhUeGNOYXFzUDkzaUtwMFR5bHdYUlFlcGlWWHh2U3lhZGh6SldKMGlYZjNV?=
 =?utf-8?B?VjdqZDRWSGpxcmxKVEZ5eUVVWWxVRkNUdDVpakZKVVlzTmY0TmRxMFAzd084?=
 =?utf-8?B?NTY4a3FXL1VDQnlidE56OUxJVlgyVEFWREJRZEJoZCtjMWZicGZydlZlSjR3?=
 =?utf-8?B?MEtNMFBDWGZtejAzWjd6cGx0QkF6WTVpcUJSUjA0Wjk0VFRMWXMzSEtxckl6?=
 =?utf-8?B?ODBxOXZMUjVjeHlIcjVQVnFMbVNteGM5b1ZmY29IblNWY1dma0ZzTUgwUk45?=
 =?utf-8?B?azg3ODZEZkxwcXRlRjVMWXRQVTFoTTZrM21KQ0NWY1U4anJ1NFJTVkpjU0NE?=
 =?utf-8?B?ZlJkYURIY0hkWldpc1BkZWFPbjlNVWdweUNaRlJ6aldwQ3k5cVdwbHRtOGVw?=
 =?utf-8?B?SjlIdUVSMisvMlR3WEYrMW9KUlU1N0FKeHFpY1RHeFR4YnNmZnhpS2tQUlZ2?=
 =?utf-8?B?YytpbW9sUUlHVXhXb3RHM3dNTHdyU2pLY1FEak9LdGJjdUd3dzgrbHBrTmtt?=
 =?utf-8?B?WGpjWXpmZUxreEVTK1ptT1dmSUp0T3J3V1ltV2l1MHVXdXBINVNzTDkySUlE?=
 =?utf-8?B?LzZqZHdlVVZYR2I5VCtXaHNzdVBLYTFCdC9iTTlzU0lWQ3hWeitmUURrY1Ir?=
 =?utf-8?B?MmxPcHgydVpOUUxMYWI2VFEzMDVTdkhYUG82Zmk0S3ozZlR4VHRuZ2N3bFI1?=
 =?utf-8?B?S25DZVF6eHpleUVWQU54YnA2bTh4SzBYeS9LRDJVZGhvSXhuald0dTMrWDMz?=
 =?utf-8?B?N2RNZ2tacmJkeHVhUFlJOW1pN0tQdkFsMnlwS2dqYTRqQXRjYUxjVHBMVlFE?=
 =?utf-8?B?bGhOQjhJYmVERWhGSjdwWUxkZ01KSEEzWVVwUm1UaFZ0YVdXUGlkRnlRWXU4?=
 =?utf-8?B?VkplWWxIUk1sM0RGQjBiRllDcXJ4Z1FWeVZ0MzJ3dEVrQ3ZSN0ZkS3hHTjNo?=
 =?utf-8?B?SnB0azJPenI1VTIzbW4zZ1dIREFJMExvSEh6MEZnWFNtOSt6MjB1V09VN1lo?=
 =?utf-8?B?RzZBSEZ3K2trVFhhQTUzTEJSS0VYOE1DdE9mN1NQcWVxZ1dxSDFJakZ0NXF1?=
 =?utf-8?B?K2RuT1I2cTg0Q2dkNG03YUtKYXdocWdrWjlwMFQ2NFFYOWVaV0F1UzluaUZK?=
 =?utf-8?B?aS9nWE1xYlR1aXgxcVZkbmMzVHR3YlE5VXdGVHVjVE80U3BoZTU1bFE5aytY?=
 =?utf-8?B?TTF4bWYxRGFNUEQySklURnZkMzJwaXZPdVgrMEVubXQrUDg1c1NyOVpaQytn?=
 =?utf-8?B?SGNXNG9ubnZ3NXg5c3RDK1MxNmovcXM1bDQ1aXRkMWxyYkQ4ZE8yTUg1T2JT?=
 =?utf-8?B?dXl1UzRybWYzd0hXTHVGdkcvRmNLZzRxOTJYa2NBU3pKRVowOURQQnMyS1dC?=
 =?utf-8?B?QzgxVVVQZDNGMGFsMEswSW1KU3c2Ris1aVhidVY2bmpKNyswa0wwZ1I1WUt2?=
 =?utf-8?B?K05BSXFiSStocEpoazVHd1BHekh1WkppVTRTYXBVdUFLTWszOU40RGtzbW1T?=
 =?utf-8?B?Q3pvNU96dnlTREdIZnhoRmRwcURDZlhaQjNjUmZhbko3TXhuUm9iQlQ3RVVB?=
 =?utf-8?Q?vHPUUsaXGOmQwB0VrWnX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b211064c-03e9-4942-b06a-08dd9d10f6b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:23:54.6380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB6940

Hi Konrad

On 5/27/25 15:07, Konrad Dybcio wrote:
> On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> IPQ5018 contains two mdio buses of which one bus is used to control the
>> SoC's internal GE PHY, while the other bus is connected to external PHYs
>> or switches.
>>
>> There's already support for IPQ5018 in the mdio-ipq4019 driver, so let's
>> simply add the mdio nodes for them.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> index 130360014c5e14c778e348d37e601f60325b0b14..03ebc3e305b267c98a034c41ce47a39269afce75 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> @@ -182,6 +182,30 @@ pcie0_phy: phy@86000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		mdio0: mdio@88000 {
>> +			compatible = "qcom,ipq5018-mdio";
>> +			reg = <0x00088000 0x64>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			clocks = <&gcc GCC_MDIO0_AHB_CLK>;
>> +			clock-names = "gcc_mdio_ahb_clk";
> 
> I see there's resets named GCC_MDIO[01]_BCR - are they related to
> these hosts?

Yes, they are specific to these mdio buses, yet not required for 
operation, just like ipq8074 and ipq6018 don't list this reset in their 
respective nodes in the dtsi.

> 
> fwiw the addressses look good
> 
> Konrad

Best regards,
George

