Return-Path: <linux-arm-msm+bounces-59647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E7AC60FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 06:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690623BFA13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 04:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54F21F37C5;
	Wed, 28 May 2025 04:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="G1bXEKRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04olkn2090.outbound.protection.outlook.com [40.92.46.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D79139D0A;
	Wed, 28 May 2025 04:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.46.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748408270; cv=fail; b=V5BM1o4G2egPekn+cDmU2NMZ6yZhftl+ehlfkO3F1ePEhDhR0fXWuEgQ8kh7kOvn+OxWjxO9aL1/YvknWSo7bJns6/pnmowVXpDb8vqdtTrIi5VhLAhp/9jBm7WiFLi04doOqoyG/+AhIYoPoYo1oVXrL1WpEqb3mmIw8B6wfBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748408270; c=relaxed/simple;
	bh=XLSPDZOfFJFu9qcCraRXYdjhPrA15YcFWaxEe7Q2Yj0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=THXC2Hqpuz6ja/YFLNEK1IEiXODCBYtUVcjmAf9vw5yf3ly0WGt2uAQbEotWmsbpJCcjFv33m2gdOQ+phNNbjsAs3c9DXWUYO84Ok9qL7yl13V2jVoOAmE/FRSJI1AvHn/3UiIXLx/neoS88T70dGa6DyzB5OXeM/nCRbPiu54E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=G1bXEKRO; arc=fail smtp.client-ip=40.92.46.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9I0j3QRCPuY7WjAFh87p4atwMcCbpsaBBQALCkoJ/RK1DdgTmoFMqDE4/NPFffY/k0sz3jZXiCQFg8dfQV11HsCL0NLGeLcZhyxYuHNg+DuusXvYSEetk+dWqkPxKh1tSD7qJGafyVG3ze/E84G0MkuV7xh6mx6YIOMYk6YtA+EzXwbWVpERAg9HLn3XUyPcDMQlz6XVmkDe3w85lXSXPclFcBSrQqMVLqSpXRJhO0s2NYCg6i77F7yAHFQ03mD/3YXlzCNDJnU3GjD/oNMx+Q+pDzic7MZ5QMyf8ukX3ht3Vk2Q4S+iD2EBqZkgW4Y50qJVzDJJVkUO5R+yigJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nzhs12bei9HwL4ApSAJQzSHyZImBaMlR4C8Loi7d7Cw=;
 b=yIZLpllOB0ZOt6HgW/me67TQEZvF8cLetqY4qsQIRylwS8i1QvaE9nN7QhBisZLYAe9m1nnXEp3GySO9+ad5OEUuwpCC2AbIYW+/ZiaZ46T8wdOpCl9DTIoVL7ph6ryGELb0uLfiIzElFr/10H5glbUY1QpZyCZ010JjT4DQxMneL5lEw6je93JRpqrpqnKl0z1PKIlgnHfdTVc01H10MN207+s+os7eN+M+9xk1StPnJFKCR18Oj97haNXgu1j5h3LjlKxTpzeYt2hDuSHotJGuqBgpftuXmAnsstUiBAh8KqR2mIXwOnyAJ2zf3ThByrUKG3OeJu0oqR9db2upqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzhs12bei9HwL4ApSAJQzSHyZImBaMlR4C8Loi7d7Cw=;
 b=G1bXEKROydj0mN9OmJDXP5G6XUeGZzk8ffGbyWmYqb8ju010SG+0BZehqipkMMCVef5tFP50CAjZUkMwJyW54mYC0/4Ekd6YoXVc/PLmi8k0QP48ROxa3gJFUHRgNgQ1Pmd7mpg8XGND8Eibq8QdvP+DjdF9O6hUxRA2Zs/5oFfclYuSyh1rqa6ATNcjzrjs4TaJ54YqJJQl+Li0qYwYyYaMLx2pBEHlH0tyYhj7xvHeFZ37UuMbouWR8HGVAFGQaT5G751NKTw5xyROVocUNiH3s0pam/OhiNvJQnQau/LJPF8+U6H6HH2IwRUBMp6Vaqe0++axTIzcAE+Vjl6nSg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by MN0PR19MB6165.namprd19.prod.outlook.com (2603:10b6:208:3cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 04:57:46 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 04:57:46 +0000
Message-ID:
 <DS7PR19MB88839AC485C51FD2940BEE6D9D67A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 28 May 2025 08:57:33 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for the IPQ5018 Internal GE PHY
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, devicetree@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, linux-clk@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <174836830808.840816.13708187494007888255.robh@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <174836830808.840816.13708187494007888255.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: DX0P273CA0102.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5c::13) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <263bf782-818f-47db-9ef2-fcca0cf16199@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|MN0PR19MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: c72e18af-f452-4007-5356-08dd9da42f54
X-MS-Exchange-SLBlob-MailProps:
	/UmSaZDmfYCV7gMu87/GtwOd6jzNwNFlVVkOARdIFHq39e4DsnPcjaO6RMZ2lRO/WQChJFHjCK9ujAZ7Gr99VoVw7M46iWwNUSn75lNBk+US3vB2SpKVGjT7MVUFs6AKDz0jWqRMSnPTLSeDEqUdcd9au80Y/bQzt3ZfNjpSDI4NPLbbZ9VOPfxHRoqK77Gt6SYbAxz+yTQ5YZojaoivBh6FPrl04qQ2I/g9VBgI6BEw7/hDZZ1b/5aVt+97cmoYXspfsXJZMhfshS8Jx68y40T7UnnIftNL/ApjuPhf470Ioi7XectYwISDr5D72VeGYIB4A0RfRAZG5m0sfxEh5oRAzMqEwNO4oOvtZGmyJ/oFJYeXcOfjNH/YaYgRGQYwa1CyzLDa7ye037CtCypJeLnB+aP588nj62LgXvf/NEpLmwQlVYEI4ZLkjemB7KPKLhgzLsjU6PCmIFPbIDNJ/whq8e8EhJCQBOhhf0loACRU8ZI5/Ews3PsVBePcAoAzEsFwM60g01gcW/+m6Mh8LAX+lq+yACPKdgjMf1FXZfJZEp5UlAYbvw49Cir+fOqzeHZUcfcB3uDjw4bSEunniOdnaQoHuptC2YhKnRKopk43qYZ+fqoXN5C5IqePv3EPlUCTtALb5UN7sLPvqPfdsVR5T43/yOuzmRM9b0hwC0/a0lxM9JbR2GWbp5bYfzGZLBX+dlFLnttL68cnMsP97epLde0I9Zfk4AaxaRuslAAZj6E2XS9z1xgy3cSEQoDej5mj55beszDVgn4jIphR1PziiHvHoMabXbT0d5/nTkboD1H4Fl5WkrMGFfFw+R4nMedzGc1uOcF1w02SMCJyqg==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|19110799006|7092599006|461199028|8060799009|15080799009|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGJra2UrV0lEMzJ6ZWJhYnVhdGJHbXh0bi9lRnMvcWZvd3FOZEhJVkFEOG4y?=
 =?utf-8?B?dFNvR09YSEdpOEgwZ3BuWjhsU1BwZkhWYUVrc3ROaVNQb2ZQM245Smx0d0ND?=
 =?utf-8?B?eTFWUmEvNk1WMjZTaURvRCtVbzBBanZ1eUNiUGpZcUptREIyR2d6R0ltODFK?=
 =?utf-8?B?ZkZpaFBQWVBpRDgrR2p6T1BXY2RJS3kzSUM3Yk9QdWpEc3pKT2cwWVBuNXE1?=
 =?utf-8?B?WGpPbkdjRFpQdUpqKzR2OWZ2dEVOSVU1UGh4TnlSTG11RHhna2xlQkFYanZp?=
 =?utf-8?B?SzNPdWlnK0U0TDFjNkIvUVNMSG1ScTdHRExmTC9tRmFYVmZ6aVFHN0NhYkgv?=
 =?utf-8?B?bDNNckErSzdoYUhJSVRRbGhWZUZVU0NSVjlUYTRDYUVxR1NnNldoZnhxaU5y?=
 =?utf-8?B?RlArei9LYnZsYmhoSmpSRk52Y0dPZys5RitWQ3RSQ01JV1BMQ3RKYU1lQU05?=
 =?utf-8?B?L1dDNUcrSHVHdDdXZ0FuazhNbjU4Ly90NlBsdG1RNlVHM0dwaXRKZFVqcW9o?=
 =?utf-8?B?V3NsdkpUSnZMZ3h3dHNLS3hLUXlmL0VKV3I5Rmt6Ly9ReWk4c3JickFhT2hj?=
 =?utf-8?B?R1RZVlFOUTdFUHM2bkVyZ0l4Wk0xNzQzZVJMQVNodlN5TERxV2JhMXIzMFZQ?=
 =?utf-8?B?c0FWQ0xQOVZLQ3VIZHlHVXA0QTRpelFMNG9pSCtYVys0MHBwUzNvSmhwQzZ0?=
 =?utf-8?B?aHFPbU5jcHdXQkRnU1kzS0NLM1N5Y0pDbHNUYU9WN0pnUEJMWGpDaWV4OVVz?=
 =?utf-8?B?a3FLYjNqcW5KaHBTS1YxYUpBakwyeFY3L0lGRzA4OEY3TVpaRG96MFdSenN5?=
 =?utf-8?B?RXFubjdRN0V4dDNxYm43UENvdVpVemFyaU43MzdVK2FFY0pmSWRVclZjSWFN?=
 =?utf-8?B?YW9qeHhreUs5SFJkb2JubG02eXl1Y01kWVJ1dlFmb0tiSFpNdUJ5NGlCSGdL?=
 =?utf-8?B?NitzVzg5THVRaFQyaTZlVVBZN1RhcjNMWCtrVzJuVStHT3hwSUhPUFBKZ3pM?=
 =?utf-8?B?eXF2ZSt4djlpcVByVGNUZWJyMTFTZVdSY1BZMTd1MUJIUEpvS1BuOUhic2M0?=
 =?utf-8?B?YllIdnFZbE9DTklyNzlXUlJpa25kRGVXOHpjeDhaNnR6WUlrcDcvYm9VVmh1?=
 =?utf-8?B?bE51RC8remZRK0lXRVl5VHVuMXhadDZaQktwdEJlOXNjS0tRZU05UlJ6NVoy?=
 =?utf-8?B?U2Ria2dQbEtwZDlSbkF3L1N6dWk5T29CYnVtTEtYQUZ3WGp1Qno0cUtRSFpp?=
 =?utf-8?B?TUFmek9OZ2hUWTlzNnl5dG0wNjZvYU82ZlZzOG5lbjZ3NTVBMnl3K0YwTTZT?=
 =?utf-8?B?Q3pNc2w5dFEwZGlsQ1ZTempOdWxSVVFGTUtLTU56ckpqNnY2OUlpYTM3SHdM?=
 =?utf-8?B?eERvcVNnZHNXbGgvQ1NtbDFBcHA0aGY4MWpoOThBTXZyV0dWc1ZlQWRXb1px?=
 =?utf-8?B?Szh6ejVpdlIwZHlvd08zOW9PK09rL015U04zWVNRb1AvK2M1UUREWVlsYXNh?=
 =?utf-8?B?aUJTRm0wUkJrb0tKbkFLRWl2REUwQTZNT1lKVlg3dThGamNDaG9Qd2FrZUVt?=
 =?utf-8?Q?N7yYuC2Zr9jQmV6ywhnb3zKzjizRxSVeD9Sa/TaaBUe+m4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTZ0UldCcDhXbXUzcytHSWVQZ3RzK0N4WUVxSUlkR21naDZXZkF0SXkydmUz?=
 =?utf-8?B?cWlRWDBNMklMVzJGeDh6QitBUnFhWHFVOFdqS016VWNmNDB2UUdjRndYYjRU?=
 =?utf-8?B?SE1Tak9INUFkazBrK2xsdzArSG42QngxbGN0UnlGNkZaYWVKSkNvZkQ1RmQ4?=
 =?utf-8?B?SHRvdytnQTFrWUpjQm41OXZacEk5T2pQWEFtSWk2dzhTT3VzdHZYUmo1M2lx?=
 =?utf-8?B?NHNMTVRBaUE5UW1scjgwUXhLWXZxWCszUzNMbE11QTJNYTJ2RFppM1d0T2Ja?=
 =?utf-8?B?bDJ3MWx2UkRXcmNrcDl5ZUl1dXp4Y2IwS3M1S1hTeGFENEN5UVVHdVRGRVhQ?=
 =?utf-8?B?Znd6b2RVbnE5UVlVUXJMUEZUYmRlOE92Qk9TQngwRjlJN2hyRThZSVg5T3NW?=
 =?utf-8?B?MmpLWUlkN0NmZUpCVkRkS2taUDBzVVR0ZGdvSWN0SGRNQnZtcTJvKy9UTXhn?=
 =?utf-8?B?Q2ZQVmkzSlh4WlFaVnhudEMzaWgwamxSQjB0MVphMTlBeldNY3owSUZ0U2xs?=
 =?utf-8?B?QnRlNTlZbHZ2STRDYUJpM2VjMWVRZE45QjloYkpxRW9kK1FlMzM4aWNieFJw?=
 =?utf-8?B?aW96dStrbXo2STBsM1JzL1c3TDh5b0oxUG40bGY1ZDVsVHNBNXZJRWs2Tlhw?=
 =?utf-8?B?MU5oK2tMMW5Fbnd2dE9jcXpqOGFQY1dPaGdqZm5JaUtpaTZSWndGUGRmZUNl?=
 =?utf-8?B?R1hDOUZydngxakFhUDJESnd2WVJLclBvRzJicm10WWpOaG45WGFqWXdjdHNo?=
 =?utf-8?B?MUI0bHczZ0t5ZmZLZDhodzh5RHl3OGMrRyt5ZWIyNHBPYzZreFNXTVRFV2JV?=
 =?utf-8?B?eWd1UUIrT2JWZjV2LzRWZlVuT1pLRndrc05LUmpiVFpZZVYyRFZ4aWNSV2xq?=
 =?utf-8?B?TlpLUzFyai81MFA3OGdqV3R5WGY4Nis3YUJOTUNEdWEyOG5PKzNSSWVNcGR1?=
 =?utf-8?B?c0xmcDRqR082YklJUXd1eXZlblpzd0NmcEQ3S3lHaGhBbkxwWEZJcVhyK0Y2?=
 =?utf-8?B?dUVpVE9jSnFYTkdSNng0YTJvNWFSTnpxQUV0WElOU1BxR3FZNEtxdzR6SldK?=
 =?utf-8?B?T1FlY2t3cGtmWDhjamxkRDBHMjNpd29lZWIrSjF2dFZmWHJZMkJhdGx1TXF1?=
 =?utf-8?B?T2QyamZOOGtScmFsQUlLdVhnaUQwTGVRdVB2Zi9IV3AxRXI3d3hWWEM5OHBz?=
 =?utf-8?B?Z1VWSm1jTURvcGlJQmh6S0dCbU81QUxxUHJNVGswQ1lVbkJFQi9PcGh2M21O?=
 =?utf-8?B?aDJCNjdjSzA2UnNKQmhobHA0RUZGM1h0M2Q5OU9IVy9CcjNEL1pmVVpVcDJp?=
 =?utf-8?B?QnZJazRZelVBWlNkVktiZm8wNTRXazhkNWFEeW5zQXBPOVhoSW5EL0ZmYUlm?=
 =?utf-8?B?aVB5TUxDNzRQRURXcGJQbjNiN3dKTmpyTlhhak5sbkd4MjVlUGRQTWJlNVdF?=
 =?utf-8?B?Qi9ld3NVTTlib2JKcTZoeWhNYU41bVcwbmdRSkdrUCtHVFRZTVB1R1FsUDBV?=
 =?utf-8?B?QzRKUkdzWjhFSENqbTFsbVVsYVRINnNiTEEvM1dzczNaWTBvdW1ReWxld25K?=
 =?utf-8?B?cmZGa1dFZGtxOHkxYWY1N3JCSEMrZUkzQmQ2K2R3RExlWmFXM1IvRTU2TXhG?=
 =?utf-8?B?RUphVFkyNTZsYThOUFpKR1c1K2Y2T3ZEWE01L1RwWTRoZStoSlJaeWJiSmh5?=
 =?utf-8?Q?OV0N+N+vfhSgg1Mu8OtK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72e18af-f452-4007-5356-08dd9da42f54
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 04:57:45.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6165

Hi Rob,

On 5/27/25 21:56, Rob Herring (Arm) wrote:
> 
> On Sun, 25 May 2025 21:56:03 +0400, George Moussalem wrote:
>> The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
>> output pins that provide an MDI interface to either an external switch
>> in a PHY to PHY link architecture or directly to an attached RJ45
>> connector.
>>
>> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
>> 802.3az EEE.
>>
>> The LDO controller found in the IPQ5018 SoC needs to be enabled to drive
>> power to the CMN Ethernet Block (CMN BLK) which the GE PHY depends on.
>> The LDO must be enabled in TCSR by writing to a specific register.
>>
>> In a phy to phy architecture, DAC values need to be set to accommodate
>> for the short cable length.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>> George Moussalem (5):
>>        dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
>>        clk: qcom: gcc-ipq5018: fix GE PHY reset
>>        net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
>>        arm64: dts: qcom: ipq5018: add MDIO buses
>>        arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus
>>
>>   .../devicetree/bindings/net/qca,ar803x.yaml        |  23 +++
>>   arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  51 ++++-
>>   drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
>>   drivers/net/phy/qcom/Kconfig                       |   2 +-
>>   drivers/net/phy/qcom/at803x.c                      | 221 ++++++++++++++++++++-
>>   5 files changed, 287 insertions(+), 12 deletions(-)
>> ---
>> base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
>> change-id: 20250430-ipq5018-ge-phy-db654afa4ced
>>
>> Best regards,
>> --
>> George Moussalem <george.moussalem@outlook.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>   Base: base-commit ebfff09f63e3efb6b75b0328b3536d3ce0e26565 not known, ignoring
>   Base: attempting to guess base-commit...
>   Base: remotes/arm-soc/qcom/dt64-11-g43fefd6c7129 (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com:
> 
> arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dtb: ethernet-phy@7: clocks: [[7, 36], [7, 37]] is too long
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: ethernet-phy@7: clocks: [[7, 36], [7, 37]] is too long
> 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> 

These pop up as the phy needs to enable 2 clocks (RX and TX) during 
probe which conflicts with the restriction set in ethernet-phy.yaml 
which says:

   clocks:
     maxItems: 1

Would you like me to add a condition in qca,ar803x.yaml on the 
compatible (PHY ID) to override it and set it to two?

Likewise on resets, right now we I've got 1 reset (a bitmask that 
actually triggers 4 resets) to conform to the bindings. If, as per 
ongoing discussion, I need to list all resets, it will also conflict 
with the restriction on resets of max 1 item.

> 
> 
> 
> 

Thanks,
Georg

