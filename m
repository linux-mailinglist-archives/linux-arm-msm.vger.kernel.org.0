Return-Path: <linux-arm-msm+bounces-47170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0DA2CAE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 19:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526871885E91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B048A19DF5B;
	Fri,  7 Feb 2025 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="AuWZwFkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2032.outbound.protection.outlook.com [40.92.107.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E619A2A3;
	Fri,  7 Feb 2025 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.107.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951921; cv=fail; b=TZLvH6F4bZo4QGojh2nfVskp5mK/WA/BosNAWnA8bJJgGoJSoBrYOB0v2hPYh3jc2FhyPj0/VuO6glDZGPAW1c/P6ze9yW+N7UErFu9+sAxaiGKceU+iLG91DLXH03bkRRhNLU64ZoALFpacw3NyD5WO0OaXlkigXt6vN7yh8e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951921; c=relaxed/simple;
	bh=6+D2fZHM0BscXGo4Q6usz3qffYXCQlHCOPJbCAcLUNw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uTsiwc737PeNQpc++SnZfA9tEXY49UlDDiOjyaCVox9Y9NaqPnBCSx+aeZ7dpqc3Mj/4Swjw60lPny5r9xkA41z/H2S3v0zlw9R4QDYRLKkfisgY5e/YBd/2bBH86RKVP7ri171Kse9RakzGgvKqTaC2mVIvwgg2/opzwCcYkU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AuWZwFkf; arc=fail smtp.client-ip=40.92.107.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPVPemUnDIIx52rweQpZQESruSjkl8s/6193O80YQzLag6H7Ms6gtTYZT/QWCCxPdxlW/vebTVYvl/SIMP1rhcR+8Dt/EZe921mFR2XGS2Q4yNtJDtXxd9Oqpg07ZtEoUTGfVh7SA42TqawiQQ4flaq4xMQAjEJHo905fZX4Vx3Nr0G9scnFeuXPJ0Mn+d7sFfX8H5Og/6eQcmmZpohYJXm3Vga+XFF/brGWMjBy2LRnQ+5L8VVVLsy2vPTicsoU9trPDworAzKHEgBe4Cc7RieuA3ZcLD1C/owFTXCrgKaHpkZqo+zUSFk7sibTeNKQ0t6KgGBtYEnKP5+gCbnBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhxhTNyRTuRAGim2qZHcIUPhqwgVM2rugLqjatB49Ps=;
 b=IIb37aU5WQJ5z3Dyq8yVswHPxP9FGmitWe2d/P3uLwhPjFkPK6IolfRSiIlDc/X7nJdCeRHTjQqSs0k3mZw7ahZcY0QAzKW+dDpyMUasV4nS885LVYV9lj4U6z3uDHhAu9N1YSTIvtnIiNhZP39qEdNT0/OP2eIKEKcvkuxLNifX3fGUZu05tMJg1feAAVQYKxC4IwzCJCjjM2lbk5UPq5Q4p2OMQCu+GduoWQ8/P6pB0zMu78hJMtfNyz+2NgAfkU4dA7w7qTceKwF0W91ad8jfz/slG2QSjF3xKty2FeIBO0qkzySXmuzzP5sii/KR4m3nRbEplVmLszdVKceFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhxhTNyRTuRAGim2qZHcIUPhqwgVM2rugLqjatB49Ps=;
 b=AuWZwFkfyrhYvz3WCEeKYKcfeZQMVMSS0KjdKD1hofeIsgSqqtVAGyVpN9ZpRJgr+IjrQfCAV1CuKZlLNBQBV2orobSy9PTvoJebZdy5VZaZ197HN9rLuAFAJlHCDa/sbd8yTL2GXTxHhWJu4PhtRRiCF2CNmPd+IUrDoYkW8az2y6NzHJcwdpddHo+Q87F/gFP8Rw+TfXvIz5kHjbd62w4RkKFeiffh+kg7BDGjmC5z2Uxlz1kjhqvtZ+lCRXvSLUTRrzsrNfUAv3eYsgcpRZ6Lcbr5+17fUPflvu3r51VGcNpWIM8JU87ZGygGwlTHdlqjvZK+lzcm0aUkhttrGw==
Received: from SEZPR06MB6959.apcprd06.prod.outlook.com (2603:1096:101:1ed::14)
 by TYUPR06MB6219.apcprd06.prod.outlook.com (2603:1096:400:352::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Fri, 7 Feb
 2025 18:11:56 +0000
Received: from SEZPR06MB6959.apcprd06.prod.outlook.com
 ([fe80::67f0:b5df:46f2:9f97]) by SEZPR06MB6959.apcprd06.prod.outlook.com
 ([fe80::67f0:b5df:46f2:9f97%5]) with mapi id 15.20.8445.005; Fri, 7 Feb 2025
 18:11:56 +0000
Message-ID:
 <SEZPR06MB6959D314F07E836E83A5E50D96F12@SEZPR06MB6959.apcprd06.prod.outlook.com>
Date: Sat, 8 Feb 2025 02:11:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/3] dt-bindings: arm: qcom: Add XiaoXun JZ0145
 v33
To: rcheung844@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
 <20250114-xiaoxun-jz0145-v33-v2-2-495e986579ce@gmail.com>
Content-Language: en-US
From: Yang Xiwen <forbidden405@outlook.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-2-495e986579ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To SEZPR06MB6959.apcprd06.prod.outlook.com
 (2603:1096:101:1ed::14)
X-Microsoft-Original-Message-ID:
 <9abe29af-9b57-4ea5-9311-8216e7f98204@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB6959:EE_|TYUPR06MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ee8751-0b35-489e-6a25-08dd47a2e7d0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|6090799003|8060799006|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmlhdWhzdzV6VDRVcnF3MDk5enlKY1ZnUHhSallJVW8vM1NCTXJMYWN6NHBn?=
 =?utf-8?B?UDVVUEI3ZjBLR1VtWCtINEtsS2ZCSXF2MmNzcmlqMnZUenFpT2Y3OHZOV21M?=
 =?utf-8?B?ai90Z0J1ay9ZekJLbEcxanR4dnc5MzBLWDhiZERPWkVPL3A0Y2dzam1yYVg2?=
 =?utf-8?B?RXk3R3pRK2hlQ0VBZTh0UTdzT21UQlEvb0hvbVNqTXhmRHRSZnFjRE1rMEdh?=
 =?utf-8?B?WjhMcWlhYlVHKzlLNkdnVjUwZlBXdFhnaDZVdXNKTkpXcStSK2tEb3J5L2RQ?=
 =?utf-8?B?RWxFSGNuTVlLc1ZPRjU2ajlEVDRqY29qVzdidWc5NWZ5citKVWJUbE90WUxp?=
 =?utf-8?B?eXFyVTNwZ21YWEJxYkVyZEoza2pnYlZCcDRlWjJ5UndUZUQzeExXNkRBNERv?=
 =?utf-8?B?bmdabTJFTEdkSWVGbXQzVGIwUTRSNGpiN01ONkNBZ1FDaU5Gd3JHRjUxaUpu?=
 =?utf-8?B?VkRTZDBjUmNZVHhhT0Q3WDFZQnhnT24zUVY2eDZ4ZHp1Ukl3eVVJQ3lFWU4w?=
 =?utf-8?B?cVZiMHF4U1JZSEdNUXpOTW5pa2g4S2dtYWRBamhxSXhZdDhUZW1mQjFIZCtF?=
 =?utf-8?B?TDZwM1NYQ0FUZEFncVVjbmJONTRTSFNTc3FzQkJEUk5sSEFnUUJ4MGswejkr?=
 =?utf-8?B?Y1IvTmJoUWM3MFZFSTVyays1ay9abWVTQVlLWFVnNHlXTVRVMFlPaWJneC9Z?=
 =?utf-8?B?Rm5BMm5JTmt0TWZleTJFVkpjQ3dGdWZKUGVITFgzMTF3TmZMMXRRSFRXSUR0?=
 =?utf-8?B?MXZ1QlpoTFVsT3pyR3l6Nlh2blpRMDBlMERFa2pQTEcrTW9TaEJ1UzU1UGZ1?=
 =?utf-8?B?Q3lJMkpiWmdqeDB1QnJxcTkrbUpwNFdTOEdLUS85bGR4elpMNDM0ZW1MeTda?=
 =?utf-8?B?Z0lIYzFlR0Z6dlBaazEvMndVQWZILzNySW55WjVYNk1rN01BSlpKNThHUjNs?=
 =?utf-8?B?T2E3VHJrZmpZSVZwYlJKSy9jUklkNUNKR3JuSnZraFQ2YjB6RUFyaVFSLyt0?=
 =?utf-8?B?NlhnRVZBNE5SeVREK2hmQXluWGJzZGVDamFDdUV5RWlNS1FxSGlGWENRU0Z1?=
 =?utf-8?B?Z1BJSlVjRnl5eW5tY0p4dHRrYTNZOE1xOHY2dFRFYk1JYmYxci9WL3ZaYUUz?=
 =?utf-8?B?VU54OGhkVlRtODR4SktqcWg2YldxWFNLb1VBTHZzand0Sm1SRXFHMEFGWDRl?=
 =?utf-8?B?UVZoT3ZwRGhBQWZ5S1Z3MjlLaWtBaFN1RjVqTlA2aHdISXQ2cWpSZmlycG9x?=
 =?utf-8?B?c0F2cDNyNzdZb0thOGc4a2trNzhRT3ZLbEJ5MFcxWUN0L0M3cXp2MTRyM21h?=
 =?utf-8?B?bmFuUC94dmVLVmlPWG5MMnBzcGszWmVTeEJyYk9hUHo4bkpnR2lBYjlJUjlR?=
 =?utf-8?B?YUZYL1NPaERZVXlsOHAwZkhzN0pPV2t5blVaakFPaG9pczAxdFBTMVVDc1p0?=
 =?utf-8?B?Y2swQUFPRlE5YllVbFBrbmlUOU9JS1d5dTR2L3RBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWYvZVN2WjFTSHM0ejdjd2I0ZXkzclB1QlRWRGRHQ0I2dXdRWDVXQUNWU3My?=
 =?utf-8?B?bE9yNDZjRnRPMzE2eDN5SGRJOW1DNW05NXowTUVjUTFLOTMxUE43NGNLR1hJ?=
 =?utf-8?B?Y3dxZHlZTDl6cFkvYi8zUjhSNmNMckVaQUVCRWE0aHFDN0NtaUFVZUp1d0hu?=
 =?utf-8?B?QjdNRlB5eUFEcFo2M21EMzFnWDN5SHpLK1llQmZ1ZGI1RGxQZTg2c0NIM1BY?=
 =?utf-8?B?cVhRQ0xHbVROWnpxbWxHYU04aDV6ampESHVNTHMxaVpiY2NhWnpBbmNsOTBv?=
 =?utf-8?B?cjAxUWtJZWQvKzRrQTEzUWxwR2p2QWxId2J1M2hwZzE3WGsxR0QwOUN2NUQv?=
 =?utf-8?B?d0gwN1BhYytGRnAyZEZBNnhSQkZRdGtjVm45T3hEdkRjNTcwQ09mZllXOFov?=
 =?utf-8?B?Q0YxRXFrdUx2eHh6SWtCancySEVBMEptMlBsKzlrbWxhNXNZOEFQbmhwTnF0?=
 =?utf-8?B?YU9VR3lRck5tRzk4aFpRZ2QvenF0NHU3c2ZLOStCWXdKTGxER05RbVpKekIr?=
 =?utf-8?B?eXhxdE5IblBpYWEvMnltejZDcjI1bFpNa01HR09ncVBkTFBwS1F3Qm40S1hF?=
 =?utf-8?B?QmI1UVRjaURGV05WSWkvWVJSS2QxWVRaekcvck9xU0d4aUg5NHZEdEkzSlVL?=
 =?utf-8?B?RVBrRzBsNU5lTkozTjBEbFU2NWhacTV4VHkrN05BamZQa3EwQ210ZHVQWE5q?=
 =?utf-8?B?SlV2Wm5pbE8yQkdHSWF1ZWlNaitjYWpUTDhBRHppNzhNR2xWT2xVSFZBU2E2?=
 =?utf-8?B?bGFSUzdJT255ZmdxTFhUZ3NCOGNTMlhxY1Z3RFRYVlVCb0xIWGVSS21FOUl4?=
 =?utf-8?B?N2tmZFR0di90YW5pQm9QRU9rTi9JM295eTdxdjdxbERhUEM2R3lIVnJoT2Qx?=
 =?utf-8?B?b1ZqbC9WWUxzd00vZndTNElIZVVLT0NtYU92cjgyL3ZQWW5zRDdmQ0tnMXlr?=
 =?utf-8?B?ZVY3dS85Y21aMlJka1dOd3dibVZQaGZsM0d0TGpoTngyMDNLUG8vMExUNmRa?=
 =?utf-8?B?TnlaREh6S3VWVDBiTllTT1dOWEtFOEJLOEJrL2Z2d0RiRWhwZHlBU0JRbThF?=
 =?utf-8?B?c2htTEpObDh6b3N3eHR6QnZLQ1ZjNE1sRkYwNEdpa2FxZ2F4R0V0cG1FQnVI?=
 =?utf-8?B?emI1U2c4aWtRek9yelhzeHhCUG9RNDR2UUVQMVUvdzRsMTZsUzRiZk5oL3Ar?=
 =?utf-8?B?RUtJUHlGMnRzd1hFcFpEcGtxdzdPaWdtdTJJNmgwdmhCSmlZSHgwaUN6aWVs?=
 =?utf-8?B?V2FmSkhqaXc0aGVCQ1JINVcvczRIVmcyUk5XMW01T1czWXVyQkwwaDlYUldM?=
 =?utf-8?B?MzBRS3o4VzljUE1QSThSK1JaMzFSUVNUOExHL0Z2S3ZXRzdEQjJTa1VVWDM0?=
 =?utf-8?B?YnBqSWNNSlZEaTVpYmJSZ3NPSTRqUS9UZTZuRnJmN0NjL0ExNlRBd09lcmJk?=
 =?utf-8?B?RTg2bnVWc2IzZlJLTkQ4dGVuU2hDZTlpanVQa3p5UWgzcnVMRG1uV28rQ0Nj?=
 =?utf-8?B?VjFKMkFJd3BSbEl4L3FVcDVKZ1ZyVnZ6NnZPaHFuUXZLL2JoUC81WmlJNDBX?=
 =?utf-8?B?RmQ2bHBVbUFxT0ZQZnpVNzJXckY5MW1VeWd4Y29VcGZVNmpabGhnaTBLaDVW?=
 =?utf-8?B?T3czT0licmZJL05CVEl2dHlEcjFPdjZXZHVHWE1WcTFvVHNWdWhmVzJqOXRq?=
 =?utf-8?Q?IC6kfRpcFn2cte7THcaN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ee8751-0b35-489e-6a25-08dd47a2e7d0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6959.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 18:11:55.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6219

On 1/14/2025 10:46 PM, Ricky Cheung via B4 Relay wrote:
> From: Ricky Cheung <rcheung844@gmail.com>
> 
> Document the MSM8916-based 4G LTE WiFi modem.
> 
> Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5cb54d69af0b7206e0f6a66023a203b8d7087696..92dd91cb66b7b1b26b013a7d32c20dfe44690569 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -245,6 +245,7 @@ properties:
>                 - wingtech,wt86518
>                 - wingtech,wt86528
>                 - wingtech,wt88047
> +              - xiaoxun,jz0145-v33

I've heard that there are QUITE A LOT of jzxx variants made by the 
vendor. They are almost identical and can probably share one dts. Have 
you ever tried your dts on them(i.e. jz02 etc..). I think they are 
compatible. maybe this can be renamed to something more general.

>                 - yiming,uz801-v3
>             - const: qcom,msm8916
>   
> 

-- 
Regards,
Yang Xiwen


