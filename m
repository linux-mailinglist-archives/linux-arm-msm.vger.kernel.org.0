Return-Path: <linux-arm-msm+bounces-59552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64DAC4F2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2353B1978
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C04725A625;
	Tue, 27 May 2025 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aEulWUB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2046.outbound.protection.outlook.com [40.92.41.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448023FC5A;
	Tue, 27 May 2025 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351024; cv=fail; b=L6onu/uTEn/DJV38EFuOQWf1UX21OMGgvA9E91kqLaUVUHGIpCqTluk/O2jqyIZeMwDsVJ+z5OWl5UuGjb8b5JmsBAhCmx1+LsxNFtDiniTt0ForyiibLhKTmwoFgK44+ZhnxqPR/MVkXdDYXv/AULjiZB1E7MSQH/B0lFI0H10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351024; c=relaxed/simple;
	bh=LFRpQ/4KaNx7TDRzy2DeGWPILy+vmykHXz5epk8VnRo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uXO6FppMR2ACOrGKKE5afVA82fmuY8VzzF6pxNgrfhCA2OCh630jEd2knfClTjtJR8SwqkmL82nRxD2YI89kJFF3IBx66QUhhFnw89ytu9yPVQFHMFhNwrFHnU3IRaEJGhtqMo18LFpZmOOw2wo4Q8xBP1vIxyMKAXIJm+ft0g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aEulWUB9; arc=fail smtp.client-ip=40.92.41.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+7KfAiWOUIOwG+9FSxtMbn6QffMF7Uk1glW2Ov4cqyRouV2b0fLW4askTY9pcRa3NIYJw/q/gM496ASkDFFCbLKZZadVr5Ugl8B6mzPpZih94w9qqjGolDFReg7KRutAdzOMUaMHOy9zOVgeBZNIbyCn6+V+6Ums/tWtuyGkXadLyA9gk3edMSUuYOisnFywsQij/2ueABL5jIrxqblgb/Yl0hRzz9l1KSv9w00nuYxzgDJL8HqOigLD1UNgUhuHhKIfgUqt2pJz7lBej8J+IihSDQWfzYbMydl7YtWyK0iCfF1sghNb70UIUQzEv0j6M5KzWTphdV+nkXTgjwI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yk82GV7fM6c9DTgqxPKAvptJK8UAfUhkRZSDV4rKjMg=;
 b=ZADmUcsFPOu+KOTFG9WdvA5G7RUJ4lUyzbY2ZH1uRdlcLeyxGIdImpbc5YPfb8BKD5dX18P1HJxmJQ48NGK7ze5s+fFSAFUxNKRHePXaKu9WLkSP82srhzp1/6UKICyf2xH5IPYZP4WycUDkltYv9nmJQBNfh3qnDqBEco4/W/WiSlFkwz1mRKubc2kfjlAdXA/PYgfFF5gzdpTdHxKj0+mwCAVx0mg2Yir+KLeLw7e8b3paPH+gbGqPYwnvv83AhdME2Jrt3aTAHGXYpMmLwZ9nUQzAvx6KARh0BZPyURyUrlK7QGHwUqcWK8PTqtGuG289Q3mbPoV3Ihjvv4nB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yk82GV7fM6c9DTgqxPKAvptJK8UAfUhkRZSDV4rKjMg=;
 b=aEulWUB9Yp0+sK2bFIlAzCI1q2a0mf7n1fIuq2Kwz9wdGSYnpksaM4E8Yd6v3y79nZCsSarTv1Rktpx6KzrQnKLUOH7+DxjbuuEqt5ttDqaGCD9fI8nVh6nCvdL/6F1041DT1xEKK7KWvvfpCj3IoaEmSVL3F0hQs2AZq/33vuQfRNZHxhSARYSJZlS5imdrPb0AY9U1WS+0+V8Izaj9VbhSJ6LXMCepcL/VbjpFKdGbU68N1PNAVCMAq3oyZS+qqNLaTHOlqCkOWr5GyHgZlye6hyBzAiFdl9YIs58iSF5M9yBb797Zq5lzfU2hH8J9dDkzeoFI2D39+fu7rqU+iQ==
Received: from BL4PR19MB8902.namprd19.prod.outlook.com (2603:10b6:208:5aa::11)
 by DM6PR19MB4124.namprd19.prod.outlook.com (2603:10b6:5:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 27 May
 2025 13:03:39 +0000
Received: from BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4]) by BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 13:03:39 +0000
Message-ID:
 <BL4PR19MB8902105E717BC98CF0EF4F4C9D64A@BL4PR19MB8902.namprd19.prod.outlook.com>
Date: Tue, 27 May 2025 17:03:23 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <7d8c3a31-cba3-40b9-8cba-52d782e5cf00@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <7d8c3a31-cba3-40b9-8cba-52d782e5cf00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX1P273CA0021.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::8) To BL4PR19MB8902.namprd19.prod.outlook.com
 (2603:10b6:208:5aa::11)
X-Microsoft-Original-Message-ID:
 <57e0a5b9-02f7-4b8c-b9d1-fe98e15c8c92@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR19MB8902:EE_|DM6PR19MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7442e50b-6e6f-401e-e3d0-08dd9d1ee5a6
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBu6m38okHpoNWln7NSyvc1Vl1k4Q3ddjrxXMC/b9gBUc0v0PnyUdP86pZuJX9gME90E991/etUfwDZ4feU/W7Vkn/uBCI+msgX5SnehMkqwYh2ENzNBNvL3+A8eUJUkZwCd9UoSr0qP5ZxnTAJKLTXvoLyE0aMEJofxHpzCdts8Usk3+FZl4HLrh3KZ9QZcEYvENqUGlj22qw68kXQYH6koUmVQaAhYlSUwKRvNDrcu+dQOABXJk0GOz/oa/EVG/3Zq8ABs0CMc2lMZSR+G4DPB1flFisqVyst0bFcJJA+hd99Y8h9bql0vSeaopmxQemTBQaObPe/FwnNd0ugh7kswHELpiMFO4CHOrc8R46CbT6y2fD0JEOi/OiVvJI8KBOvRw7N4PK66oPN273aFJT/QDcMSKQkTdglH5QQcrGVfn9SorIENJU5IEV+OudmWrxIiML2ASVWjKyADZwlPMU9l9hnsaMWXpgja2HV3NL8o7kARAyA5Z+Clc22tnrAi7JpYTLkwj1Qj2t6oU2atwLQOxAsgYhZ0BW2nfsMMnvRdH9OFvtA5kHCaBuvljVXEWardx+xTvJKVOESZDNCaqLzFZH+e/8r+vy8lp1czzvDG/XuP5cv8XkPONGtUVQuI9O2s0pbaXExS4KAK5yt1tdBWa7e0lBZO5LLfzzirFKIXAZjHDre8UFTph0N8bRyMI61uzlOSl/6gSfodhS/8tlRP2ucJhNlQ6wMjkhON7HYuZDo9WWWBnf57imbTK4drV89HtlewcOCuDDuW4eLKlq9v
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599006|19110799006|8060799009|15080799009|6090799003|5072599009|56899033|440099028|10035399007|3412199025|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WG1tTWR5U09ORkg1Q1BUa2ptZVRGcnVXTTVsMGhobTBlNUtGeU5RajloOGlK?=
 =?utf-8?B?Y0tpOWszTXZtb2QzV3cva1diQjhPODNqRmxqMTRVSVpqeUZ0Y2YrQ3VGejFR?=
 =?utf-8?B?dklMLzRHQ0V6R2J1YnZZTDdlYVg2WXQ0RmNTUXQ5WnhzTkF3VHRtcGlvdHJC?=
 =?utf-8?B?MGR2dk9kYlJIT2xXdmk5VERpRmF1QVFiaHFLVnVnSjZqTThFTDRXNStSenA4?=
 =?utf-8?B?TTQwUWVnOEFDNWlYMXZLZUorUERVOWdzWnpKeGZwMkF1WnNUdTBaNDZnSkJp?=
 =?utf-8?B?S0tteXZaQ1FwVE9hemlqaktUNEYvemEyRHdDb1d2aVRUVGR6L0h5ZnhlZ3lz?=
 =?utf-8?B?UGdUdHJQL2VLUDYxVEJOcUlKZkxiNGZsME9abERJVGVuK24vMmhNRTRvanVM?=
 =?utf-8?B?aEFIMjY4YW9hRzJHS1JjQWJlcHpLaTVKVFRRSEt6bXE5L3U2a1JaQXB6ZDJQ?=
 =?utf-8?B?aGxST1dHNDRnaFYvQTN1R1ZoalZObDFwc0pSOGdxSGQ5ZUNSbndrNTIyL1Qr?=
 =?utf-8?B?b2FtUkJDYU85b3BRRkpOYzQrL0hnYUYxaDhjcGRkbmxScm1QUXBKai80VFhh?=
 =?utf-8?B?V01yZU9OREJrZzBZV2QzbW1FWkdtSDFsVWYrRG9sSVFDTHp3MW9sdE1SRlRB?=
 =?utf-8?B?RHRJSGNVNzBnd3AvbE5kdDV4aDRXS0UvK2c1NmdvcTZVV25mYitWMXo5N2h6?=
 =?utf-8?B?Sno0d2lOaHN4dFV6YjNoMlU2Q1BZWWJwTG9jYVBDQk5UVm9YTzNseDhRTURW?=
 =?utf-8?B?MTI5Ri83K2VSUzVCYjBHN0p3VGtFaHlkRFVoWStUU2l0L0trSS9EN0Z2Y2I5?=
 =?utf-8?B?cHZEYUdLK0FZYTArcmx1UEJEd2V5ZGhmSDlaNE1xeG1MRno0R2l0UGVUQ3Nk?=
 =?utf-8?B?ckFQZFl5Rms4aTFucnM2VHEzcXB1bEdPQis1enA0bHF6OUFFSk90S2hZeHdF?=
 =?utf-8?B?Rmx3bnU0R0tIdDVIS1laWHY5a1l5bzA5dm5CcnphQzNVb0dUU1Zob0pndjFi?=
 =?utf-8?B?S0ErZW5xL004eDRsWnFsZTZ0bit6aFJ5RE96WUJzR1VVWDBMT0xjVTZlRm1a?=
 =?utf-8?B?YnJSeC9ZUHJVdk5QSUpYNG1tcWV0ckpwT2NBN2JpdU9tVTdkNGU2NjZwMmNx?=
 =?utf-8?B?VitsRSt2djFnMllteUVQU0xYUTFoYVkrODRZK0NpNWtqRFlJZjczZDlQVHJa?=
 =?utf-8?B?SnV5U2tMZHdrZ0dHMTI2LzhnVFpJM3c0c2Z5eGhjeUFGYjZHVXYvVGN2elJq?=
 =?utf-8?B?emtQVTA4WkVRT2I3TUduSVdzSWpsWHlYVkd5WFZtL2pXNHkvMDcvWGRHWVJ1?=
 =?utf-8?B?UmNCQ3VFaW1JejN3Q3A2TmVQaE92YWdYSW12U1B1YWl6ZXBLV3huL1g2SVFS?=
 =?utf-8?B?NnlMYVVWWnNtNmowWHlVdGx5c3cyQ3pXQ0daendYUjQwcTlCZDF3bWNHZVFW?=
 =?utf-8?B?UElIYXVmdkRBT1U0VVA2M2QyaE1zTUd1eXlNZTNZbEZXK1hndE90NXMvYUt6?=
 =?utf-8?B?S2VCOGFPY3cxL2RpLzN6cDlzOEN1ckFMak96K3FnaksxUXhvNEhxQ0xKb2pJ?=
 =?utf-8?B?ZUJNL1ZPSWZoZVR2TnJCRlpUL0J6RWs0SkFHRElacGVTdUdWT09KdFlOSTZ0?=
 =?utf-8?Q?l/p8T9NOWrhjtnC8TpPKmR2uCSLmXYi6oJEV83c7tFFs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REFzVzRqQXlHWkVrZlVjUXg0dTdWWGVnQ096OVBOdHBKZXl2UWRNMElzK29a?=
 =?utf-8?B?OUtCb0dEaTRJTXJhaHNWQW45b3pkSjcyeXYrUTJ1KzQyeXFycVRxaG10eGFt?=
 =?utf-8?B?WnNkV29KT1JYTTJMR1A4UFI5WEhRVDlzd0U3N3JiTkxCRkFraFlBYjVKR3BE?=
 =?utf-8?B?UlZrVkozMVU3dlJXRndONkZoUTd1QUEvWU8weDZaU0k2blhYcCtnNEt5ZGV5?=
 =?utf-8?B?MEZERHJCVGVCWmtsdTBWRE5mdmtneDJzUFEzRU9GdHVZZnZkNGF6Y3Bna3Vq?=
 =?utf-8?B?VVRCY0lEZlJXbmh2VWNuMENvMDBGN0JDNG04a200REw3V3pDZVowckh1czln?=
 =?utf-8?B?S3ZTcTlsbkxYSkJUcjdwM3I1aFhhYVRWeFNQRmtXT3JOaFBkVy91KzdmL2Fa?=
 =?utf-8?B?ZVJzeG5Dd0JwejNEeWtkRVFCNUlWS0t3MUVmaFB6MTMvbVZJWDRwY21KVk9F?=
 =?utf-8?B?RVZGUTZkOHFNbzNhVkRTcmJQQkxqb002Mjl1SkZ2QU50M0Y5RkIzazZpbkFv?=
 =?utf-8?B?Zjd2aGV4cW9kOW50NHpJT1Y1clRobjBtbWlJVXlkS25NRW9ZeFFYL2tYajFY?=
 =?utf-8?B?WWVjL3pEdWszanJLZlZPeU1tV29reXBpU1U4c29iSllTZFBVMHlKMGp6cjFv?=
 =?utf-8?B?bU9pdnpoWkVydGl5dGRoRXo1OFFHaDFnU2dPbkhjTGZRTFlUVFE0SGNHM3hS?=
 =?utf-8?B?ajR5NUdYREx2UVpqQ2kzdXYrQVVKRHlPTnFXNEZlN3psVjBldzBvOUthZ0ZD?=
 =?utf-8?B?MVk0OVJQOVZMNXBlK3BubkljdTFxVzZnR3BKWTB1Tm5NTjRkcjN3MUlGMlFk?=
 =?utf-8?B?TEE5d09RZnhCQ3Y1VkkzNXhhMWEvM0xLVkRzWUpnalo1L2RUa0hTTDVPOHJm?=
 =?utf-8?B?eVVJRHZhSUlOK3FCcWw2eXY3TFowa3ZTdHU1aDZwQXI3RFlQSXlGc1ltQ0Uz?=
 =?utf-8?B?NmU0QlFjQTVrV2J6bkxId1ZUQkpEM3Fvcis5dnBlQ0Y1eU00NENsM2g2MlJN?=
 =?utf-8?B?QjYwYmQ3MmpsQUIwaktQNXBXNUdjZmpvTnJoMS9DbnZDWi91eEVzNy9RaFlL?=
 =?utf-8?B?NktFRm54WVVnbi93U2xUUGhGQ212eUFnTERRSmNuM2htSkJCdDI4M1k3cEg4?=
 =?utf-8?B?NWxzREFvc0pzMkFpaDhYeFpPNlVaZlR5L2hHM3BtcHg2Q1dNYUYwSEFpK3Vn?=
 =?utf-8?B?aXo0L1BwcTFDaUxQWFkrRXBlZ0tuOHhRTmhCTnBiMi9XaHdSQlIrc0FELzVh?=
 =?utf-8?B?Ym9Xam1XU09QblhsSnJwajhDOHdQQ2VjdWdpVms2NGNwbkk5cFhCb2Rpa0pP?=
 =?utf-8?B?a3Zvbit6d29vKzBvTVdqSmNMUGhlMmExemRTU0F6eWY3V1poNDJJd0huelZn?=
 =?utf-8?B?Z1RyeiszcW5lNTduWWNWQ3ZmRHhERUkwUE9nN3JSN1VZbC9uVEpncE5aOFA4?=
 =?utf-8?B?ZGJKVGYrTGRCVWExYWY1T0NFSVFndTVsSU5Fc2FjeFVVbDE0NEtaZHo2QWI0?=
 =?utf-8?B?ZC81Y3M4WnhkV1BpZDAxODlXUFIwKzMzcG9OQ0tnbkl0MTdDUUNNT0tKb0Y5?=
 =?utf-8?B?anNsbkNVdW9GQ0RlZWdoay9LRnRtVTdMY2ZQTEY0czEzTDIydVc3eDRVVjZy?=
 =?utf-8?B?R05GRytBanhhYVY3S3JYUDgzek5Hc040c0Z1ZE9iUUpuVnpJc0d5cVZIRnJF?=
 =?utf-8?Q?33ADWj3ZebJOfPtfhdAS?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7442e50b-6e6f-401e-e3d0-08dd9d1ee5a6
X-MS-Exchange-CrossTenant-AuthSource: BL4PR19MB8902.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 13:03:39.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4124



On 5/27/25 17:00, Konrad Dybcio wrote:
> On 5/27/25 2:13 PM, George Moussalem wrote:
>>
>>
>> On 5/27/25 15:31, Konrad Dybcio wrote:
>>> On 5/27/25 1:28 PM, George Moussalem wrote:
>>>> Hi Konrad,
>>>>
>>>> On 5/27/25 14:59, Konrad Dybcio wrote:
>>>>> On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
>>>>>> On 26/05/2025 08:43, George Moussalem wrote:
>>>>>>>>> +  qca,dac:
>>>>>>>>> +    description:
>>>>>>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>>>>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>>>>>>> +      link architecture to accommodate for short cable length.
>>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>>>>> +    items:
>>>>>>>>> +      - items:
>>>>>>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>>>>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>>>>>>
>>>>>>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>>>>>>> Drop entire property.
>>>>>>>
>>>>>>> as mentioned to Andrew, I can move the required values to the driver
>>>>>>> itself, but a property would still be required to indicate that this PHY
>>>>>>> is connected to an external PHY (ex. qca8337 switch). In that case, the
>>>>>>> values need to be set. Otherwise, not..
>>>>>>>
>>>>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>>>>
>>>>>> Seems fine to me.
>>>>>
>>>>> Can the driver instead check for a phy reference?
>>>>
>>>> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
>>>
>>> I'm not sure how this is all wired up. Do you have an example of a DT
>>> with both configurations you described in your reply to Andrew?
>>
>> Sure, for IPQ5018 GE PHY connected to a QCA8337 switch (phy to phy):
>> Link: https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq5018-spnmx56.dts
>> In this scenario, the IPQ5018 single UNIPHY is freed up and can be used with an external PHY such as QCA8081 to offer up to 2.5 gbps connectivity, see diagram below:
>>
>> * =================================================================
>> *     _______________________             _______________________
>> *    |        IPQ5018        |           |        QCA8337        |
>> *    | +------+   +--------+ |           | +--------+   +------+ |
>> *    | | MAC0 |---| GE Phy |-+--- MDI ---+ | Phy4   |---| MAC5 | |
>> *    | +------+   +--------+ |           | +--------+   +------+ |
>> *    |                       |           |_______________________|
>> *    |                       |            _______________________
>> *    |                       |           |        QCA8081        |
>> *    | +------+   +--------+ |           | +--------+   +------+ |
>> *    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
>> *    | +------+   +--------+ |           | +--------+   +------+ |
>> *    |_______________________|           |_______________________|
>> *
>> * =================================================================
>>
>> The other use case is when an external switch or PHY, if any, is connected to the IPQ5018 UNIPHY over SGMII(+), freeing up the GE PHY which can optionally be connected to an RJ45 connector. I haven't worked on such board yet where the GE PHY is directly connected to RJ45, but I believe the Linksys MX6200 has this architecture (which I'll look into soon).
>>
>> * =================================================================
>> *     _______________________             ____________
>> *    |        IPQ5018        |           |            |
>> *    | +------+   +--------+ |           | +--------+ |
>> *    | | MAC0 |---| GE Phy |-+--- MDI ---+ | RJ45   | +
>> *    | +------+   +--------+ |           | +--------+ |
>> *    |                       |           |____________|
>> *    |                       |            _______________________
>> *    |                       |           |      QCA8081 Phy      |
>> *    | +------+   +--------+ |           | +--------+   +------+ |
>> *    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
>> *    | +------+   +--------+ |           | +--------+   +------+ |
>> *    |_______________________|           |_______________________|
>> *
>> * =================================================================
> 
> So - with keeping in mind that I'm not a big networking guy - can we test
> for whether there's an ethernet-switch present under the MDIO host and
> decide based on that?

AFAIK and unless I stand corrected by others, we can detect the presence 
of a phy or switch, but we can't detect how it's wired up. It could be 
connected to the GE PHY or the UNIPHY. Hence, the need for a property.
> 
> Konrad

George

