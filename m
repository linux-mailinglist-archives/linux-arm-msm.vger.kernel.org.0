Return-Path: <linux-arm-msm+bounces-60469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE241AD00D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF32D1895A73
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECC7287517;
	Fri,  6 Jun 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="paXE95nz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2022.outbound.protection.outlook.com [40.92.23.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7428750B;
	Fri,  6 Jun 2025 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207278; cv=fail; b=DCqXCwXWwwxNRnSjgq1EHk4+35gywfuazFq8yTpxOgSK3/Whz4dqrA/s4DYhQ0s2/sZOugvG8Rli34DYLx6NUClS4nFw7QyVM6ualc4n4ltcqFX+0Ap1TtqIBjdXitmbogKNU3fTjCe/9UdFE1Ta1//UxcrN5N3ebh1WHMZDAWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207278; c=relaxed/simple;
	bh=MU8NYn/GpsZda5e5ecPGNZgeP3GaB45iwUZmhYvHc7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=guqcw/OKthQIFKN0SoegjehkSYnMD2rztoEFz7+1Vw91NMTXtkMaj/xdd4sfCfUMG4VWFgUQyWnz4pYj7X6Ml9JOqgRJDEeSJqMCd7rcRglhshEnhbNAPqySvEc1NDYLzFhS+QrwP2FdOeWmgZUq8ltPnNO3C/fhNV5Kh9HPVzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=paXE95nz; arc=fail smtp.client-ip=40.92.23.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUvhheWTGHL8dY6QXMcxaDwvR1R158mvR7p9PaY6hrg5seN68UqgdRUxEn/o0psIixJzrerTohgw8Hk/3mlAkYz+f+d+wytsj3TTJkKPMrqK01Iyf6GAIpeduMecYE3kcpcdLo4cLxST+6yV3CQO29imllLY6FGQ1R8X+hvJGs++/jCADqbe+uqEpEwXmMdGFWal27m9p/b1L55ZDXxeEFAiIRrEJkyONc9T7PAJVi//dpSLuNOojjRVy6RwsYLQnYxdiYMybdKNxezWW5MXAPoKjVOIpE5i2vATbvOSn0jDzmv1pkzveOiqJuYmXYr28lsGnJA3mjQCoC4EmDQ8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRLGs0voHx+1nwpknaC2ZTPXb7zfIeE9oZFGT+qyFa4=;
 b=i7yEybwWbwCvWdmdUj/aZeto5Nq7C2ouGROtmFuXYg4As/UYfYtJ29FKxBzQD1MWMhZAJFwO9YcRjpME7CkT8uLtcgCEe69ggC6tsRght8vegF6PEhfSpfIuwa6j2rZHivZaPlksTaRL/8h27qssBAUj5W3OhVAr7B397hzinqNeV3Lux9Rt0GXn1CiiIVldc5nFn/qK6VrjRgkNgBAfYORayV9AwwcTkYw0JpylIB3Rq0vnzWjzKXFpbwFISH+eZTmNTcI1SRzTw7TrqRu/W8ostymyPZNvot+mnWIX2VJcqbzoemibIpIpSbXM/rnlPtFKcADIU/tePjdbQkgGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRLGs0voHx+1nwpknaC2ZTPXb7zfIeE9oZFGT+qyFa4=;
 b=paXE95nz2FpJ0wO8qFlyd4G4xqnXnAlwkhsm18pcYU2LYZSwP8BOoEH5/sRT8l7+3dW0DQaJWMZPwxrIoE/+VlX6GojQgA+cRUOfyoqIZgP8Nb/DTW1an8UdGxXgX+n7DMWetYMM8reu3qAOsX8tdyErFCXg4yHYXazcxDTUzIwNl2Q8TrBYiKte4wiYM5fgdM44L+Ct+jN0e+rOShgVlAEE78oVZ/DddOTZmT8oQiDsfkOOsj2uFu/tRv/zWQmX3joiD1Yv2bsiGjhoqt50m11btNzH60+VwOR/WThwfp44JwuC9Io6Xutate9eHSvPQQZ8HQjZ3tMRaNiXijgJYA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by PH3PPFD994488F9.namprd19.prod.outlook.com (2603:10b6:518:1::c55) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Fri, 6 Jun
 2025 10:54:32 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%5]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 10:54:32 +0000
Message-ID:
 <DS7PR19MB8883E074E64AC6FCAB1B1DE69D6EA@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 6 Jun 2025 14:54:21 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-2-421337a031b2@outlook.com>
 <20250605181453.GA2946252-robh@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250605181453.GA2946252-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0087.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5d::9) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <a8e2be4a-fc8e-4994-8a1d-8c953a4e4719@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|PH3PPFD994488F9:EE_
X-MS-Office365-Filtering-Correlation-Id: 30808b18-78aa-4f69-b629-08dda4e88423
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXa8TE59u1HHfDiiKEdRlKNQ9dU3DBoTaNCOe2vZI4l4hYoI3vFEnKhlcFJO9maSP4RtgKS0TakH6sQjOrhkqSooPfBlriR4unA1k2a17y4MzJiFO/YmM6a9xEedSfYjiUGc/zWUkvBE75lFuWWlXdXYlV/CZpWJgrGva/bNWzXBN9FQ8Lzl1QIzZTv/TDnNHNH3k6fDRr+XePF1yVoaEpdHYKy6Yj1Q3AN7sNQHlaMgYmjqXqXRZG6g73VDWx5P04CVB8iq81MyHzmJ0JHOf+dTkafDjMAx2ov+XisrcaGEKXw2SG7EumZeYJrwJMcz2mNKVZkbnQh/eLpglJtda3ZjpvznlbzjlWeYPRoWd/8sO/f1Z9uXf48O+LIAzl90FyqamWSbi1A+XkR3ck8O2txSao5DgdbYoaCqv/NvKdzVkWATXX0mg6CwhSM7sBGHNB/qssvfH3JUK2JS5iwzinYdHUR8zLHBq3lDqQN6m57Js/dkMQvz7cjbCI/pK98yaaJw0t0gMqmjFHRHFdb9C6vbFsxBE4NX69DJaYgv9GdSKU8xO3iEzF1TzA1KP7cPVf0foG4xcgd/R5xZHJVfpfIhCe6n5/IWv9Vh9j8n981JEozwNLY7YFWkoYtoWtgBgGmyRWAnHhrOrjSWOW1/xzArHPtYDin7NQoS9wwnvFd6l6RyOFqEeWAKC2dgWCYaQsySv6YdKPDp9EjhqHp3bO3Z/31pWUxrzpgTQGvdbQZM5J7XDt/0hn0s4hPyNUMl44=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8060799009|7092599006|15080799009|19110799006|41001999006|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk0yRkREU2lSYVhkTUZObHdUdTM0SUlKV3hBcE1xTFVGbERMeGk3Nmo1RFdT?=
 =?utf-8?B?NVd4d2UzUlIzUXN1TGdObXY1dHp3eENWOEZyZjdpUVRNUTFaaEZIU05uSlVB?=
 =?utf-8?B?YmhCRVNNclR5b2ZFWjE3dnFqSis1SG55NTYrTXl3ZWQ3Ym9VeTFiYWJvTk9J?=
 =?utf-8?B?YXlIQWU1ZTd1L1FLNjByaXpNUjcvdmxRMHpSM1pSOFhEN0hhQjRydFBwMGpV?=
 =?utf-8?B?Q0pMS2w4L0I5VG12SFAvVmpJOUxHQmhQS0YxVFVDbXBLd0RMeXVqYW54OStr?=
 =?utf-8?B?TWdZd3B1bVpqcjh0SFV0ZkduTytWbzlIVTY2NHNUVjkzN1g2dE1nMzBjdjkw?=
 =?utf-8?B?eHBYcWxPczFCamYrWDVGeVM5UEVKWEtaSFZ5a1VEM2ZLS0JrSjFzbjBTbVVm?=
 =?utf-8?B?WWFXOU1MRlNLWURsQ0lERng0aUFtUWhDMS9qNUJRWUpZSHFTNHEwYW9sMlhB?=
 =?utf-8?B?RVY0NTlKOFZJR3A4Zi9JQ3FOUXhYclRsODJocVZSeUo5dkcwbURDYTk0dHlR?=
 =?utf-8?B?N00zMTh5dUV3ZUlOMTdTQk5OQ1VrMnZxRGlEQ2dTb3dwS0VPYUVueEZMdkpJ?=
 =?utf-8?B?M0lJNjZ4NGJyS0ZXY005R3M0bTNMdkRSWmhMTzh4Rzl1OHZ1MHBJMmtURU5i?=
 =?utf-8?B?c3NnY1RkbWxIb1dlMlp6TW1GZE5zalZRZVliUGZKMTBOcjNEdG1UbkZoQ3VY?=
 =?utf-8?B?aTFqN0ExVkRjZWNteDY0ZG8rV0R3eGJ1UXNYM3l6QllkQ3UzTEhtdFpNalFz?=
 =?utf-8?B?cjErRGJNcFR0cTlGQTBiVitBZU96NFd4K0NIeGJLcnJUQW1ncmVycmlWcTNW?=
 =?utf-8?B?TnppUVNtaEVoandKWmlmSjJMdUpDWkp1eXI0bmJXTzlIRXNwNVRXNC9SQjRh?=
 =?utf-8?B?YTVxb05zRVFzNHYxclBXcUw0UG43ai9VOTY3VG9GMHFvM1VQaEZNKzVQdTY3?=
 =?utf-8?B?eEg3L1duL1IyY0M0RFZvMzVnb0p6MXJ1N1BzRzhyMjhxTGY0NzJZZUFZMG5q?=
 =?utf-8?B?TDVwQTlERmJ5S3VueFRHdjBRMVI2b1AxVm5wdFl4eVN1K2lxZ1NBcjRUdkhv?=
 =?utf-8?B?MCt2YUFiY2ltWUJCSFNkejRTN0pUT1NOdTU5MmNSNkFHVFg5eDN0bmwyeGNz?=
 =?utf-8?B?V0ZzVHhhY2phNTlJVUdTNlQ4QXJUbE41c3poRjRzVmpidGZXZ2RNc3oxdWFW?=
 =?utf-8?B?OGFzZ3psVmZuYTBETStWdDl4SXRzb1p3YmJiZEdDbTY3MzBUZGphdHlaQWJW?=
 =?utf-8?B?NWZJa29jY0QxOEc5M0hBQmlZMVQwamt3dURpQ2lQTzdXQ3ZhTlErSVVLS3ZP?=
 =?utf-8?B?L29UMzBmbWlvZW5Ra2hOdDRxY3NQU29KaXpmQ1hEWFVYYVJBRnVva25CZHNz?=
 =?utf-8?B?bU1uMzlpL3pwNjF0dHNKYTNoSGpuVFZFVnpXck1GMnhva2JSalJCL1pucVc1?=
 =?utf-8?B?eUFtSmIxdXVQWHVzcE83NVE3V3JZSkp5TVdMaXNDRElNMTJpUzJYVEFqYkNs?=
 =?utf-8?B?bkdoTk1iamtqRzBkN3lqckNSZVhBWmg5cWhTUkNmUkRBV0MyWFZ2ZzRSN0Jl?=
 =?utf-8?Q?h0ulutgubNkLb3U2yBG0iAEpI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlKZ0JCaXphOXo4REk5d0hjcmdkWnhLaThOU2FlWElaZkVuWCtPOFpKazZ6?=
 =?utf-8?B?OTBLdzUwdEhFb2pBL3hyMTljL0VIaTVkUWp2aVlWYVdKUDk3UTN6aThvTTNp?=
 =?utf-8?B?eFBVcm55RGdzbFBCb0FZalp5RHZlVXRWR1BXY25zZExjTWhHMUNwVklOV3pZ?=
 =?utf-8?B?TEcvL2FNanE2aVBVSzhoclhtUzNiZXBtTHJaVVZYWmpQNFFMYzlMYU1GR0Z2?=
 =?utf-8?B?SVlnODNROTd3ZWtHaWMrZERMaTF2d1MrLzZ0MXVsYy8rU3hsMmdhMzVvM3Z6?=
 =?utf-8?B?cStreGN5VDRJVEF4eEhsT3hvVStYVDFpdFBPcUFOOEt4ZlY4Y1lxcnk2UXhJ?=
 =?utf-8?B?WVFJZ3lTb2pLMmJVZVgyMnNNTEZkOTVyeHRoMU4xS3U5cUVFVmdvMFZIWUR1?=
 =?utf-8?B?MDBkWDNLdzNOdllmSnhxaVlnMjFFcTUrbG9DZmhJdlhQZERzclpaR002MUdQ?=
 =?utf-8?B?TjFvQ1lROTFlZ25sa3JxY2tuSUtNWWJGMzdINGFzbGtWUUlETGk5bU9zNW1j?=
 =?utf-8?B?VysxMXZRSVZHRFkzNWxZdmNzSzhpR3hjYnZ3cUtTY3ZZYWF0ZVhsWVJlU1JO?=
 =?utf-8?B?ZXorSmk1S1BQK2dYclNGeFlQMEtWdWJQeG9mSENFeFkvZ2lBL2dCWUpCT1R2?=
 =?utf-8?B?S1prK2hsUHlJcGdVWjltS3NTbTRLVkZmeWVlY1RZSGFENkJBaDlteVlXU1dK?=
 =?utf-8?B?TTA4TkNlaFFyQjE0bWVueStHQkdDamZYNXgxcnFQZDlvRldGQUc0Nml2K3lr?=
 =?utf-8?B?RTg1bFJKaHlzYzN1RGU0OGUxdG5vTUMxZE8xTDg0NThuc3licUF0QURGMG96?=
 =?utf-8?B?dGdCSmxxdkF4VklmRkloZ3Z0U0txZkNSZWxxUE5QakxiNG1IaUpsbk1zQkE1?=
 =?utf-8?B?RjBOdmQ1QWFvbVc2dGFGYkJjU2RFbTNLb3pvcmgraFFhSjd6SE51MzZyWHZ5?=
 =?utf-8?B?VTl1U2haWjVWRzM3NnpwWWxlbmF3SGJyK05hQXE1WU5NT0ZUQjJkMUUzYk5l?=
 =?utf-8?B?eEgvaGtNSW5EUTExZnNjVkwxSFlRNnFXSFA2d01GV3h0aHN3bzhaZitSMjRl?=
 =?utf-8?B?RHUwaGlDbGtCbi9RcVpkZVZteEtvYTFzWlB4TUVkNjJqUUpRYThtUkc2Ky9T?=
 =?utf-8?B?a3dVVFNqMFhoU2VjeUdneWc2NUQ2cmtJWEtXeStNNW51LzFZcHAyeS9yTFhl?=
 =?utf-8?B?ODJzWU1OMlNCL0NFb0o4aXVQamt1NEtVUXFVdjh2b0VqWlR2WktocjY3RnJ6?=
 =?utf-8?B?WGFqc0l2K2dkWmZEaDBzTm1ocy83bXg4Vlp4ck9DajRIbWFRVUhrTThWNFRE?=
 =?utf-8?B?NVdVN3VzOUMwK3RPbGNxK1dEUmxsZld5ejUwR0dvYTdSbmo0K2lCVElNS1V3?=
 =?utf-8?B?MC8rbnZXVFYwRWpZMFF1YndvZ1g0SUwwcEhVSjBvQkpzYTB6clJxTEZ3bTQ5?=
 =?utf-8?B?Mjg1OGFRd1lYZ3ZQaXdpUG9NMEZVZEI3ZlcvVHdMNmNkNXFVbWVvTVNVVFlQ?=
 =?utf-8?B?bEIwVnVMSm1XTkpJdGVEeFpERk9YMDVoTWZBNkZMSjZXRnQyZDlncmZoZGFM?=
 =?utf-8?B?Y1ViNzZHSytCQWhnOWpiUzFnakNKaXJTMFFEaGNWSVZKWU51Umd4NThxYXdY?=
 =?utf-8?B?ZjBoVEczZENlT0V0aE1VT1p1YWNWNWRyd2x3WjZpekRtV3phcW9jRDlZY2FV?=
 =?utf-8?Q?M33nkWO8tC1WPFRub7o7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30808b18-78aa-4f69-b629-08dda4e88423
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:54:32.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD994488F9

Hi Rob,

On 6/5/25 22:14, Rob Herring wrote:
> On Mon, Jun 02, 2025 at 01:53:14PM +0400, George Moussalem wrote:
>> Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
>> SoC. Its output pins provide an MDI interface to either an external
>> switch in a PHY to PHY link scenario or is directly attached to an RJ45
>> connector.
>>
>> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
>> 802.3az EEE.
>>
>> For operation, the LDO controller found in the IPQ5018 SoC for which
>> there is provision in the mdio-4019 driver.
>>
>> Two common archictures across IPQ5018 boards are:
>> 1. IPQ5018 PHY --> MDI --> RJ45 connector
>> 2. IPQ5018 PHY --> MDI --> External PHY
>> In a phy to phy architecture, the DAC needs to be configured to
>> accommodate for the short cable length. As such, add an optional boolean
>> property so the driver sets preset DAC register values accordingly.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>   .../devicetree/bindings/net/qca,ar803x.yaml        | 39 ++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> index 3acd09f0da863137f8a05e435a1fd28a536c2acd..fce167412896edbf49371129e3e7e87312eee051 100644
>> --- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> +++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> @@ -16,8 +16,32 @@ description: |
>>   
>>   allOf:
>>     - $ref: ethernet-phy.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - ethernet-phy-id004d.d0c0
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC
> 
> blank line

added newline

> 
>> +        resets:
>> +          items:
>> +            - description:
>> +                GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.
> 
> blank line

added newline
> 
>> +        qcom,dac-preset-short-cable:
>> +          description:
>> +            Set if this phy is connected to another phy to adjust the values for
>> +            MDAC and EDAC to adjust amplitude, bias current settings, and error
>> +            detection and correction algorithm to accommodate for short cable length.
>> +            If not set, it is assumed the MDI output pins of this PHY are directly
>> +            connected to an RJ45 connector and default DAC values will be used.
>> +          type: boolean
>>   
>>   properties:
>> +
> 
> Drop

removed

> 
> But this schema is broken. There's no way for it to be applied to a node
> because there is no compatible defined in this schema nor a 'select'.
> You can introduce an error and see (e.g. 'qcom,dac-preset-short-cable =
> "foo";'). Really, any phy using these properties should have a specific
> compatible defined here.

added PHY ID as compatible in v4 which I'll send out once the merge 
window reopens.

Under 'properties' node:
   compatible:
     enum:
       - ethernet-phy-id004d.d0c0

Q: do I need to add the PHY IDs of all PHYs that the qca803x driver 
covers or will this one suffice?

> 
>>     qca,clk-out-frequency:
>>       description: Clock output frequency in Hertz.
>>       $ref: /schemas/types.yaml#/definitions/uint32
>> @@ -132,3 +156,18 @@ examples:
>>               };
>>           };
>>       };
>> +  - |
>> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
>> +
>> +    mdio {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
>> +        ge_phy: ethernet-phy@7 {
>> +            compatible = "ethernet-phy-id004d.d0c0";
>> +            reg = <7>;
>> +
>> +            resets = <&gcc GCC_GEPHY_MISC_ARES>;
>> +        };
>> +    };
>>
>> -- 
>> 2.49.0
>>
> 

Best regards,
George


