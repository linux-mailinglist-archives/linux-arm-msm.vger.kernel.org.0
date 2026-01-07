Return-Path: <linux-arm-msm+bounces-87893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 96959CFDE19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16E873002BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D427324B1E;
	Wed,  7 Jan 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nn23gOxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010022.outbound.protection.outlook.com [52.103.2.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25B322B7D;
	Wed,  7 Jan 2026 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791844; cv=fail; b=Zcm8c/RlFh5U+UGI5ZHvuERSUki17gr3QeJAz2nbXdsgyxydXpFhvWNppWlfjNgwMI/kOr0R6phoLoKW2gvXSdnnEqKlRQutScj6CYeVBgkWy2vfFDfVb1DrvHn4/PvnJbWftx28thHA+pFWXlGYD1VDUwanBFoYwXXAeo99T8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791844; c=relaxed/simple;
	bh=mSnZ5J4wdq+VaPq43fkWXHHe7C2LQ7XznaXhcFyrUoA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XEpaX+3nQwidQ64zueQ/EUBMG9pyWrQgdO8YIdAjEhf+CTsp2a8+AFNEG44bRJLnodhertv0HpZMGjXUIbZFxa/HAslJjLQE6TO6vL4h+IoWrDgOfLkluFPmp2+WUkRAjL7/6Ntlvao4qnSnywPHpcrgdQpa7K9WvyUB6pzukiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nn23gOxB; arc=fail smtp.client-ip=52.103.2.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcR0xRt8ufN+Q1tROaolEpAJEFpqQMa/w/7UdLtYWNfWp9eY1s+L5BQCe/QevMBXlENYUrk4+Tv0Vgl8jK/WkK6zJpwRgash6Xgspgl90LbIiAEpiIJdm7SncoEW6E8IzoW1exOrXD4XomwGrY0MsBH5DYl7oJTzNXhvJNF80joQaAq8c5eE70sSnvqJRJxAbf75NTnKFbPMAzbBNr7cu6X4VasPueR2drlvqQzocWxTtJQ8WY47ZCrZtOILyHBFfI6DYCZnAS9nwaf4UqbH33yK8+IrrJ+4qeBKOGLWuYzfWlzCtWB/Xp0H1BSBBO6vsZ/TYYqVuXZwvzG5CAFTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkBZS5t6c7jdacPjWR98hE4zk1UldMKLj2EjJ30FEnE=;
 b=KpPTSb6qSCTLeuR2iFZrSGDIn3ZSnFFejZqK/FM6Sj+nvh8JmnPF9CCsGkbRjCRK4WYqct7tdyZMipkhzObmro+26pQ3tfQEqRLLoq4ooVCocIvgU/aL7dnch/FBa9UfRVLpSOF4s+bUbiPz3UDqEGiI4bCmcGKnRRHsLOAllji0ac6qhmo+V/235YeKy45ZWpjlosDo4KXbxtG+GAqkd3pxG1mgFSg/AcJp712SFxW/FUqfPbyd1SzQztio9fRIIsf3qsC13oEppU9NB+ewAsu7AA2CCXIM3JyDrgpgahkU0zV6C1TqSZZWk0BjntJ2GdO3qP4AiQgGRtrJssqHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkBZS5t6c7jdacPjWR98hE4zk1UldMKLj2EjJ30FEnE=;
 b=nn23gOxBsLPukE0aIf3h559eO0VthI58Da4X2/fZ0/PYpjUZBM6iaC1asxVjPEB+46FOVTyo0+dvATy5xCgM6sWNsAiNjPHmSW3zzm5J/0YnZerROVnNp7cvLVpWuTb9GZKEy1LR1Cr2f5slT+TTdUgE8FwJ84L89qC4Ba+xdZovYgT++7hxkHkG0YshZB/JnEkPGdBTiA7vvNPtbUid6RDtUIgGdy5vFxFctndxw+4GD9G5vCElTtUXlkD0z9zj8zldt7P3isNqMjUg/TVx4mVx4pGg4oZlq8XvMmxjCVkwYIzmfIQpWkLXzmQaqTnQ+nFfOgVTrQf/Goqc2d0J9g==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by LV9PR19MB9109.namprd19.prod.outlook.com (2603:10b6:408:2e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 13:17:19 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 13:17:19 +0000
Message-ID:
 <DS7PR19MB8883C5FF92412F106B8D41529D84A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Wed, 7 Jan 2026 17:17:05 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Luo Jie <jie.luo@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
 quic_leiwei@quicinc.com, quic_pavir@quicinc.com, quic_suruchia@quicinc.com
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0098.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5c::14) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <f34d7fb8-02d1-4b9a-a9dc-fb8d788de96c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|LV9PR19MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffa487c-d25a-4871-ee0c-08de4def1588
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6d5vbofsfC/jnGJ+j4hG4ECFsguheN8gB42HcU0uuJAOVtFOaLDM+PpPKyrlfxgJWnlGXPZX5S1djt8iYhIWB4mpqofCbviMXPloIg1EB41NSFj0Rnh2xrIHxx29m2f3I5FefzmSBNKXkLN2ci14lHsR3hu7Nom45K+mctI7DtIkDkgyaiw1G+0ddx5DhYSkmwMTm5FTsDBZDh0ZUD1r3b5ZqjFWXCr1nlfhcEqLaXN50R93NwBMsbljw9BKRKAyDOMIYvHHn443N81h79bqNcucB13ldTvmlJs57y1xwfrOECNCZuaXFDxPdFMFpcg5ZEVAfBf/c6vzjY9lmBZpzUkd2VBelxSciA/Jle1W07R0cTFH4cJFVIb9GXyYeP4I11jM6nee3Daidhn1k9/gQjofixNE+/0OSI33XVv4iAk4YeIBEnS/y4Lil654xAnqsA75df+9r3eUPozIJue5QjZrAd3MmgyxaYKYkf11wxqMWJPx3Lo/OeiCeQPUepMi+nakamH3wMSjoBem8+nMeXakslr8Ov//+X8NWq+LaXL+FLVtoV9MdROxaLvJlQkv9Eu+DDpMxBWBPyvUsVZTQ6VuL84zu3QsEhr9mfjRHPcLW1BcktGO3LrbOQnB/5Jei90jXkOq3F7mf7JuNqgMJEIUbS3XEQl89SyXdvt9uVRvDQkpZVCON1SwE5seYYnXU3PYQe4Qn5ikQX7ui4OtzIrpaEZUCGcrwQPhKR5SVCJPzITqU2Lw/1jO0XTjIc/AL8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|6090799003|15080799012|23021999003|12121999013|11091999009|21061999006|41001999006|8060799015|19110799012|3412199025|440099028|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmkvakE2MjhxWlN6d1NoejJpdmk4Wko4VjkzcmVvYml2Qk5SOHkvNVRyc01w?=
 =?utf-8?B?VDVzSzlkdWFrOVNaTnpJY0VEWWVaQnVCRDRvUGJYT2RwaVdndi9wdmNaZmYz?=
 =?utf-8?B?Yk05bW9zQkNzVUlLZVg4U2swZnpRK25ZN0MxdXVDSmJKblRWT0p6enZheElo?=
 =?utf-8?B?ajQxa3BBYnZ1cURHMm5FSE9YQ2M3UzhOT3NLTU9PeDZRYWZmQmtqUlA3SUF6?=
 =?utf-8?B?clU3Qml0ZEZFVzZOZWFSVkxKQjB5bFZjQitTVjJSaGN2U0ZTaE1IZ3BzTm8x?=
 =?utf-8?B?MjMxN016UDdWdGdIMmQrLzV4MEdiQXZKUjU4UWZ3R3laclcraEZCeHFNR21R?=
 =?utf-8?B?cGV1SVA0c3ZGREVHcEdwRzhRajNVK05USGdhL0gyaFEyNWt3WnJSL1NISHhm?=
 =?utf-8?B?UTFqL0JUaDZNcGFrVHNPN2xQS1dxTWN5RHlIeWRNeEhMaTJlWHEwek5aM2NB?=
 =?utf-8?B?MUlpaUpRTnp4N3NSYkF6YWx1Mkh5WTJJdEZnQ0E4NllUaG9sUUFFeGZQNG8r?=
 =?utf-8?B?QmNZdUhTdDNWUmppM256T2pJa3JtWmN2cVJQb0MwVmFhRnA2V0JUcnpEQmlv?=
 =?utf-8?B?RmVrSEhtUUZyVTFXT2JFZnErR0ZZUXhRTEE2cCtsc3crRGZmVkRSa0JOekZ4?=
 =?utf-8?B?OS94bnVuYndWWk85RlcyTUd3TlFLbE5mSDh5TE9aWlA3d3dMWUVTZklMQ20w?=
 =?utf-8?B?NlpVb0ZmanV0d3RsZ0tTM1NtaVhvSDBvbjlDU1hBN3Z1ZXI2K0UrMGZxSFlw?=
 =?utf-8?B?UG1SUnJNMTg2TWRmOUNEYjF5enpvYlUwaElXUW5ickZDS091RXJYRGNmUng4?=
 =?utf-8?B?NytxNzFuS0g0MXV0dHR4cHZPMFg4aGMzTUtPd1NIY1NxWU9oL2ZVakpzSFJQ?=
 =?utf-8?B?bDN3aGhDZ0Vnb2VxVHdBeDdwREZWdGxpSHVoTFRub3o4UXc4RkhJUFk2d1o3?=
 =?utf-8?B?Y2pnUTJ3MzZpcCsyWXZYcENFK3pyeWZjbDFDdmRGVFNLT0E0R0pwZGIzTUNZ?=
 =?utf-8?B?cTBUY2QrNU9rSkRmMVErVXRXaUJBWmRXNUlsWmoyQXg2ZkZTZWZFK2ovN0Y5?=
 =?utf-8?B?S0JJak9LOFZUQnJSOHVvMjVqOCt6R3BIcC9WTExJNVUxZDkvUitxRDhYUFdY?=
 =?utf-8?B?TU5SVitwd0RGeTh1T1NLbGFPQkppalRTV1VZSHM4eCtLMTlMSTRRVjRhWTVt?=
 =?utf-8?B?dEhIcENLN01UL1RjMWtoV0dnZXFWS1dCOFI1ZUR0YTB5Z2E0MGd0RUpSNzBZ?=
 =?utf-8?B?TkhEbThaRjJYemJqVXZnb0QrQTk2TytmYmRLNlFBTW1nV3p5cWZMTnF1TFRN?=
 =?utf-8?B?SHQreW4wQmVyblB6bjBBd0R2WWtTR09Xdkp4WW16TnNadGZTT0w1cDZnNEN2?=
 =?utf-8?B?TzNqQW4zTS93ek9mLzBRSkJyWDlabUtJdWFTRTdXSzFYVWMyZEVFd1greThW?=
 =?utf-8?B?Y0lRV1c0WWpSbEdiQjNYVlRKRExPNGhkYytOL1JKZXpTYndEclV5TDlOUHBZ?=
 =?utf-8?B?bnZXVm9TQWRDRDkrWndhQ21xUWZrMm96R0xZR05TOGdGeXhPaVp1L2tRWnFw?=
 =?utf-8?B?WVBMTnY4QjVWdG94WC9NNEd6Q3J1KzNheUZxVTRHbnJXb0tiWGJGdU1OY3FY?=
 =?utf-8?B?cW5tc1puZExxZkxka1ZaNjJUbXdiTDQwQ0NFOUxRV2lINjllVnQyWW5iVlBo?=
 =?utf-8?B?VDVFTG5ZN2tacG1UMTNTU0NYZGNjMnBHL09tNTVSWTNraXlTK25ST3g5dERT?=
 =?utf-8?B?dmtTL0NrWncrZGt1bmRZcEMvYlk3ZkNjOVZ3OUNTWFNQUG5seU5nVVl6U2Rq?=
 =?utf-8?B?NkwxVUxEVzZWZVZ4dm9mdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V21kYVlDTlJmdzE0bzJLSTlCZzMzejc2Q2dHV2RKT0RIa1dGMGN2cTZZVGpO?=
 =?utf-8?B?b2VvTEtLVjlJRVc2UHo3SjRGQ1VwTit3RGtlM1dyN3dZdkxDYUJweGMwckRO?=
 =?utf-8?B?UVNYY2FMdXVMSDVCTEpscXRWcngvTWV5Tk14aFdLaS94eG1aeURqYVBqd05E?=
 =?utf-8?B?dlFHRUxXaDJkMlRvTVZyNmpQTkl4aGVZcUZQZ2lILzNoYUd6WTNCWDBscEtq?=
 =?utf-8?B?dmZWSWZRR2FVdDFQcjMxaXVyY1NhQ0xsSDJnRGV0Q2x3QTJuWTVTK0pkYVBN?=
 =?utf-8?B?UGh5cjlVQjMxckdXOFVsNStoUE95M05NMVAySnNzOW14c3k5SHUzbFBaMGhN?=
 =?utf-8?B?U1ZEN3NpeXU2UXNDc1RtOHQvcHh3V3V4ek9tT0ZmTjJWNnF4dVdpdGhEK1JC?=
 =?utf-8?B?c3pXNlFxWHJyd1lMMDQ1Z1MrYkhRS2JIUjM3K0tXNXVDRWh2T1NxRFljY051?=
 =?utf-8?B?bi9RbEtTdlhMc0VUZlk4RjY4dDYyWllkSE10eEdueVFwdGJGNVJOcTZoS05v?=
 =?utf-8?B?MVljdVBSd2xVNzZia0Zkd3BieXc4cXUvTklZTWpVZzh3MlFHK1o1NDA0LzVW?=
 =?utf-8?B?eFA3QlVqMHg1QjZWRXNEMk41eGcyb2RMOTMyMkdqUlNYeFdmcUUxdm1zbkt2?=
 =?utf-8?B?V0VDMTVrc0tIZTE5ZWRuQk84RmxHZDVXZ09oZGMvU3h4UVRWVVJSSGVCbjBW?=
 =?utf-8?B?QURXUnp4V1ZGRHNRK3FVT0hkQS9xYWFDNkY2c1Blbm5BR3ZCWEtYblNVcElZ?=
 =?utf-8?B?c004QlRSeGpOZStYaWxVNDVRSkd4VzRnaU0waXZjUmVpTERib2JUN21SckZE?=
 =?utf-8?B?eXB3Nnk1b3NQWC8xamtCejJIQ1dVQ0psWVhkZGZpYmpWd0Z1OTQ0Qys1TU1V?=
 =?utf-8?B?NHdQZXlLQ0t4Wm1mZmhLeXJvOWtoSEJBSWc0UWN4UjFVV1FJVi9WVkpxWTZL?=
 =?utf-8?B?V3cyU25VQlZFQjVXdXpFNjR2Y2FHc3MweWc1Wlk2Mzk3UXNibGdGOG9tZXZD?=
 =?utf-8?B?LzNMbGdMU3RnbDRlN05SZUdCM3hMazE2WnJjWElmR2dVWlR0M29KZ2VpbmYy?=
 =?utf-8?B?cy9OR2hHVjdqTTI2UEFyRktLVzdiSUZ2eFBiLytvdXNmWjFVblpObER5bHlC?=
 =?utf-8?B?aDVhU2czRGFQK2hyRmZoNXZPUnFRSERCWDdKdE8wSWZpOTNqUTdRMmRWT21m?=
 =?utf-8?B?SXFJY2RlYTFiZ0Q2dHBJMWR6MU12N3RFV2FMWGZmSTRweEgra1M1S3E3K2NS?=
 =?utf-8?B?QmJqUjV0TXRRSngwWW1qaUdTZm9CMmtEOEExYk1BSHhnUGFTNHlCQWFuMUVP?=
 =?utf-8?B?VG5TdUhqaHN1Zm41L2pOVkMxZUxGaTFTKzRVaHRLc2d4WnduUHVzUXFsQ0lR?=
 =?utf-8?B?Zkg0NklRUzBsc0ZETHVFWFh5Y1lhR2hia0NRMTlwK250azE3YjJGLzMwZ1J0?=
 =?utf-8?B?NSsrbWVaUW9WcU9ycDZMb3dvYTNsVWswcHNUQXRlVHA1SUVQMGRILzF1NGhT?=
 =?utf-8?B?a3QyWlVYaEVuS3RaV0piTUVqZzY4dVNDaVN5QU83cTVVanJ3alhqT01ibEtB?=
 =?utf-8?B?V2JyOHcrekJHT0lGRzROT290QSszaFZNTmxNK1VIMXN2OXJmRmdacVF0Tkwy?=
 =?utf-8?B?emVaUHNPd1BhZlJ4MjIxVUVqMzNuTEs5NTRoL0lQVTlHRUUxSmU0cXVHYzNQ?=
 =?utf-8?B?RGo1RjVjM2JwN0IwN21YVExhN0VVQ1FJc1ZieTFhNkRpTEFYNW40MS95UHdF?=
 =?utf-8?B?RE1Db2Fhcm9BQWx0RHVJRlM0dE1lbXVLanVQbWNHMkxaaXVQN0VYMGpGd0xS?=
 =?utf-8?B?SVZuSVV4VGk1Snl5NkZPN082Y3UxbFV2S3o3NHRvQ3ZMb3N5VlppV0tpeEpH?=
 =?utf-8?B?ejJMVEhPNjV5b2RJdzMrYVdNZEd2UFZvYUFIcUt1Z04xNWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffa487c-d25a-4871-ee0c-08de4def1588
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 13:17:19.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR19MB9109



On 1/7/26 09:35, Luo Jie wrote:
> The clk_cmn_pll_recalc_rate() function must account for the reference clock
> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
> with a reference divider other than 1 calculate incorrect CMN PLL rates.
> For example, on IPQ5332 where the reference divider is 2, the computed rate
> becomes twice the actual output.
> 
> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
> rate = (parent_rate / ref_div) * 2 * factor.
> 
> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
> IPQ5424, IPQ5018) that use ref_div = 1.

Just tested this patch and can confirm IPQ5018 also has a ref_div of 2.
With this patch applied, the correct assigned clock rate of 4.8GHz is
also reported:

root@OpenWrt:~# cat /sys/kernel/debug/clk/clk_summary | grep cmn -A 3 -B 3

                                  deviceless
no_connection_id
 xo-clk                              1       1        0        48000000
  0          0     50000      Y   deviceless
no_connection_id
    ref-96mhz-clk                    1       1        0        96000000
  0          0     50000      Y      deviceless
no_connection_id
       cmn_pll                       0       0        0
4800000000  0          0     50000      Y         deviceless
         no_connection_id
          eth-50mhz                  0       0        0        50000000
  0          0     50000      Y            deviceless
  no_connection_id
          sleep-32khz                0       0        0        32000
  0          0     50000      Y            deviceless
  no_connection_id
          xo-24mhz                   0       0        0        24000000
  0          0     50000      Y            deviceless
  no_connection_id

Once accepted, I will submit a patch to correct the assigned clock rate
from 9.6GHz to 4.8GHz as the ref div is now properly applied.

Thanks Luo!

> 
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index dafbf5732048..369798d1ce42 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>  					     unsigned long parent_rate)
>  {
>  	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
> -	u32 val, factor;
> +	u32 val, factor, ref_div;
>  
>  	/*
>  	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
> @@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>  	 */
>  	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
>  	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
> +	if (WARN_ON(factor == 0))
> +		factor = 1;
>  
> -	return parent_rate * 2 * factor;
> +	regmap_read(cmn_pll->regmap, CMN_PLL_REFCLK_CONFIG, &val);
> +	ref_div = FIELD_GET(CMN_PLL_REFCLK_DIV, val);
> +	if (WARN_ON(ref_div == 0))
> +		ref_div = 1;
> +
> +	return div_u64((u64)parent_rate * 2 * factor, ref_div);
>  }
>  
>  static int clk_cmn_pll_determine_rate(struct clk_hw *hw,
> 

Best regards,
George


