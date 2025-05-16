Return-Path: <linux-arm-msm+bounces-58219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828CAB9C5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 054F81895BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3E923F42A;
	Fri, 16 May 2025 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CtdLHoXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2085.outbound.protection.outlook.com [40.92.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DA23C50B;
	Fri, 16 May 2025 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399250; cv=fail; b=hhY0A2XI3tJ4ZjvYf01AcLlfsFbM4CEA+PsheR2nAMn0hOyd5Hp69nfxNJxhNBUm6eU+CTh9SYuQRGHrWB6pIj1+MYFJ4sFFA8HIiSXta+lRue48yw2ciukLHcR1u2s1xaXQkMQHmJfdyVUOPL0yfXF6TEiiwy+4HxoV5HUuPXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399250; c=relaxed/simple;
	bh=HPWReZnvPk7MttteZKnB386+oVnQINr+M7Dd6mS2Txs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GvcIk73gFBSsHIirZoO5DRh8nLD4t+W88635jVakIbo+wReMAnExo5uBBFIPRQN0zFUJRIRgn0vsvf7lU0BMKcmr3tcOKOd31fbJqwv2Q6oT8Xy0zMC8WSTlgVHP1Yx2leprcnWPizYGueSUhxhOcYq5xqle1zAKYvez+ll9wc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CtdLHoXj; arc=fail smtp.client-ip=40.92.20.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtWw+cBmY7WZ/NrwDLXfx7E/rax0iKQ6RVpCA9KJBw/jNqC6JB+BjLIi2ZULB/lCOeHrXvQr1lRvyqDPgD4PqiQ5eG/QgDmznQEZ7hRa6+eHUP6GJOxmpnuB4ViUj+XMBqMHTCgqcyM1bVMVP5AMFPaZyUZC3wHYvKlRk5YhlKliFK4QPkkllvAPCzG3/XLMDPMnul8BLe31WbLRiawq51z1+i4j1k00yNGIx2OnHWZkje17lZ59e8vQW8l5/pFk8Xly2jJLB+DHsH0SFsxijElhkjdz19ZRlumgIFssn6EV03dyduqOuqmxeP7NP1kXhIHs9c33/jl+RRBmXweiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkWqQYlkMrKHrLbejL5B6VryflfWd0zio3bk66fPFI4=;
 b=idbcTqpGAWs/zK4AjhFANkgjecumZrRLu3BAVJVXpVtxtgElu/1CHSFd5dyWxwxqIR8wivUl5BQ1/yVDznry10BTi3LqFLBAQvAtvC9qc47RYcsXs5/epiC3hgS3Lbhtr/RnSBcnNGvmctYD5w9Wwth5UUuOryvQy5/+Y+jdSPLO2ebSTVuCNzL1zQZcJF39W5Usxgq1vh+hQLGMuF7CPn3npUedonXhsFh4ESzDqa/tJiCVzx2tJYfV/nofT3lTVWKakR7f6tIEMyQYStcHOi6QY7HrDBx3g+k9YkmHtGmLj8bNPOpAqdZmJKge9H4X1eW4TrFUrfooZcsVMydFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkWqQYlkMrKHrLbejL5B6VryflfWd0zio3bk66fPFI4=;
 b=CtdLHoXjNAt0P7t26YIttEABTE23PnpFnzqMjD6KC+UqfBwkeFBh/f0MLjufPOXqfDYZKtih3Vqs/Xht7dgTq+ID8H9UhDRs6xlRgGuQUfwBXOJCY1wEc/UmYqpJiGgXRNsclrAeCsGe5XrDmZOkXXKmFSd4SSupyVbmPv7k3yQkmvc8wtBkvBIeIhHa6tYvGSqbc+nUwA79G6NCmhwyiX/QHPmu/eiRFPOEGpqK3Eqf9DkoqiipMZCppEhnLoRKAhSW1fywgdKnIuJCZ/nCCW5iAKaoMuuAowxattE2gLNFixS6s7kfyFGaLuvBUt0akR/LvtwggZeKs3fpndGDfA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BN0PR19MB5264.namprd19.prod.outlook.com (2603:10b6:408:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 12:40:45 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 12:40:45 +0000
Message-ID:
 <DS7PR19MB88834246DF8B6F50CBDF64869D93A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 16 May 2025 16:40:36 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add CMN PLL clock controller support for IPQ5018
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0053.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5a::17) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <1d21af35-4ea1-4151-992b-30f9769efd23@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BN0PR19MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dadea0-f659-4df1-d0eb-08dd9476e097
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBu6m38okHpoNWln7NSyvc1VSI6wIG5oma4YkOU0p/SjoUv1PhURL08gl8kac8hRmqzg3ORzFDxCwaBasrNsBzYROKvZbSuH1XtgLxJeLWhpQ8WecxqbzW0D6MAiJ9JOqw4yOjGVWyLL9oNBZGi2XmPMcoamY8neMOeny6+vdrv5q7uhhoaR0kiOoBnRzH2NOteSkaWL6XG2xQ3ACZwFsaWbfJrEY4eZ3l3v0ndr9EJQsrQCgXy2/KKgik/QJtBk1TcUHj3G3sdeQinNMHJdmOd6r6vtR3uV/zfuOqhQK+UDo5/RpgcBExOD3neReW5S4zpjo3B2SPpCSJu/KUKsH+3QZJhjk2KutfMd6usmOBoh+XULhjwqAELyLllHUvcqlL0HMBuJSRve8U3eOHhwmS6UExb+BFDhPDqpqVnkvtyhnxECpwpZugUgx36esVZ36iJsfnLrTkJ9RQctCVD7ZvpqhzO23GM2gzk3OSepZ3GeGC7efrx+3DzuRFWFjElCq7ChUjQ5dY5eLsd6Z0awCTJ0SlShEyadMDyMZ6CmVxJuIALAVORes3CEfd1oPMkVEvwtWOZB+pqNiaAFMOhw6cfJY56XyRCA6p/jHLo525b1eOK3s3QwpL93XXeFcmxg0r2IVCusqPBbbvTUb3uNl5Y29kzU2WyOSWO8oekH9N+akdZ0fUXit/tL+L0wYUvOE67iLj8jobGJnIijugvqOFRziTE9mzFaAdjtABHPpISStRy8S5QgJcgSxKLo0mtCSg/s2ytJ938IuSlULm9Ktj6o
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|8060799009|19110799006|15080799009|7092599006|5072599009|6090799003|461199028|3412199025|4302099013|440099028|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWgyTTQxSmhUdXRCd01xaUZ1MzhSZEpyUlM5Z2ZtZlFkTktlb1pBOC9LcjlB?=
 =?utf-8?B?bzlpWkx5ZEk3eWt4MHI3Vjl5TUFmeHNsSHMwak5GRU12NVdTRkMyMklrK0ZC?=
 =?utf-8?B?cVd6bjZ4bFA0OEF6ZkdibHNiQzRqSWIrVkVOZmVyN1hHQlQ5QW9xdjI4K0V4?=
 =?utf-8?B?QVJ0aU9ZeVNEcVFxVEdUdUxRNmViQnpoNVp0RFZOQU12VHV6TmdydXVCUEZR?=
 =?utf-8?B?UVM0WVRTY2xZaEg1dElNTlVEb3RBRlI4akx5M3ZHQzA2WllJZy9pbFZwSmhH?=
 =?utf-8?B?aVRYaU0wR0hlR2NPeVRndkFKbDRXVVJIeHNpL3U2Mnl3VjJ6SHczR3QwbDQ5?=
 =?utf-8?B?clA2Nnd5KzlUbFhobzFRNnRnNm1IOStyKy9yVWtFbDNnUGQrWnUzazVhb1BE?=
 =?utf-8?B?YlowdnNvTTJXV2dvUzcySTFNZFFLaTYrRmhpYUQzbDRWdzh0eUJTd09Oay82?=
 =?utf-8?B?ZHZBNEg2UjN5SEhlODlwTEZ0VnF5UjBDbFB6aGZoWTlOa0V4NnpVcEhSK0c4?=
 =?utf-8?B?ekZZd3lTZThPOUMxQ0tQcU9YTFNGZEJDRmpob0ZmSmtPZFBtK3FPVzY1YUJi?=
 =?utf-8?B?UFZxL3NPRzNZMi9kcUJmengvRkxSZjkxc0dIbmRaY0JnS2RWdGpYdzBob3Y2?=
 =?utf-8?B?SE5tTTZZRlNzYk94MzVvRktHb2FqQXJqWlFISzRrUmhacHpqbEU2eFBpNzc3?=
 =?utf-8?B?MlpYVEdvTWNUMWZVWHI1VExpcnhFZ0dTQzhtVzNIM1BmUVpBc1grRksyUHdX?=
 =?utf-8?B?cGxqaThoK1hlcXEvOFJEV1RKY2dqSi9YTi9jQnlLd2pZQnM3dUI2SzBVUTNS?=
 =?utf-8?B?NDVjWFk3UlpSRjN4a0VuVjRFUDlNMXdRWHF1OU9hQXJJOGFKeThHdG0yZ0N0?=
 =?utf-8?B?enRpMjZySXNHd2M3TE93SVRxWkZUU0ViZVRVMUVGYXVzdnIySk1kZ25YczBh?=
 =?utf-8?B?aU82ZUJESGltb0k1aDBSSGlDMEVrYWNHVDFneTBNMlhFelpxRFNJeFA5eDFF?=
 =?utf-8?B?dVdMd0hQNmt4TXZNcWFEWk81VzgrRHNNdWMwem0rMnBxNGJMaWRZd3VpdkR5?=
 =?utf-8?B?N1F0Z2l3MTJ3clRhZUdDNjI2Z3NrQXZFSmdkVURIeXpmcTcrVzdMcVg5bnl3?=
 =?utf-8?B?Um00K2pRNGRrVURlcVI3K2dVbVpZeTdSenhoNCtmTlpBelk3STVnS2doTVZJ?=
 =?utf-8?B?alMwQ3dnb04xM2orSURyb2NNNThLcXVDbXJVck55d3RCUmtWQ1NZK25hZ0Fn?=
 =?utf-8?B?MTYwd2prM2ZId2VtcWZQRGphb29ZempMbVNpK0hPbWVrZ0NOYUZwODlyK2RD?=
 =?utf-8?B?MUtHUWt0SHc4NW03NkFYQWdIeUQ3UHgxZ1VlOHRGQkZ6U0dDMG83NlgwNWRL?=
 =?utf-8?B?MXVBTnNQSHF6QUdNVXp1cTJjbnlUMXB5WmtWQVRBUUlrN2d1c1lHOTh4Tm1O?=
 =?utf-8?B?dUY3d2hUVUYyZ1Yra3VRY3RrcVlQS3lHZlJ4U3JocUhkM2ZCdEF1WUFGL3BB?=
 =?utf-8?B?SFdrTm1JNEVNSWdKa2RmWTU3WGRoaCtxOWNvdSt1MFJpdWxWdFJCR2ZGcnM2?=
 =?utf-8?B?SGVMUzFNY2tuTFVsM0xiWWRvRXdpWTREUUVEaUxvZG9Xa1ZPK2JNSTMyL3pN?=
 =?utf-8?B?Q2hETkNVYjdBcm9STFZVUjhNZmUzRmlpTTZ2TkkvVUxTSWNvUnlXdnNNV2tM?=
 =?utf-8?B?UFZCUXppL1NrS0ZCNzJudGpsbU9waXhuVjZFb0RseXgreVRKVEVyS3VIdTVj?=
 =?utf-8?B?bXVHVjZ1dTJna1E2UzlzcTVUVGRLeGsrTUdUdWxCYlBvSnBGMGJ2elp3bndC?=
 =?utf-8?Q?Hdh75V8fHQ88DihOzSDuxXtuVQB+FN1FXV8U8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUhjeTZJRTVCUkJlaHZ5VXdGZ1RhZmpsZm5EQStDcWJtcDNSSGNBS3UrZWxC?=
 =?utf-8?B?M25hcWR4d2x6Q0tiSUlFWW51UkduZFVzZnhvdzFsbkdsZTM0U1dmNFAwbmJV?=
 =?utf-8?B?bjh4TXIwRHVsL095TDE4REM3QU0wakRpNWhKQWN4Wm1jNDFQWG9pejVZaXNv?=
 =?utf-8?B?V1ZiNEdrcVpGVE5xZnBya21uNEt4WlRreG8rYjRFWWhzM2IxaDF4Yk9VUHo4?=
 =?utf-8?B?aVRNZlJ3ZU5YSlpjeGJVK3ovUXUzaVhYNDRLbnE1TlA0UGh0WUtOMFZpNE5I?=
 =?utf-8?B?R2U2OTZ2RkxCWkVrNWV0V1JkbHkrUFBrWStscDVoMkorekdQa0hNWWY0Wmxl?=
 =?utf-8?B?MnFPNE1XYzlJYTRicFcrOTlUNERNSHR2dmdMd1RnWkhub01rYjBKQWsvLzhw?=
 =?utf-8?B?VGJoTUVIeHRFSCs5WUlZUEhDemdjbTlDM3FuSkxKcVRyU0VvTE9GSFl5eEN6?=
 =?utf-8?B?Nnh4S2VkSU12WERDKzJKaDFwMXp6QzhMcnlTR3FOZTIxaWpzcERyVVpidWhE?=
 =?utf-8?B?TFRmOExWanQxMEkzTnJ6M0ZoRmFtK2p5ellHL0lZYUM1bEdjZkQ3R1VIY0U3?=
 =?utf-8?B?alpkMlRSR3hmalZhcFJCNlNhV3VuVjR4MG1jaWxMaDhwdGM0bDdhUnQ1OTFL?=
 =?utf-8?B?VXp1YlMvazd5SllCY3B6aHNkUDNQcUh6L3dRbllReHQ3TXBpanRnRFJJVmY0?=
 =?utf-8?B?UjJvbkhSQ3FuVVE3ZmZ2OFdZdnZEcWhrQjBFdUJDSGxnOVVqTFVJd3UxSjIx?=
 =?utf-8?B?T0N2QlVhS25aMXlGWVRHVzZCdVZISFVrbWN6alZiY3N2MC9CaFhDbm4yQWdy?=
 =?utf-8?B?c0ZvY08xbStMMHRDL1VuOVFTOVhmcnBLWm5LVmNkUmZ6WTJVUTVsdXhzQmZh?=
 =?utf-8?B?WnZwYjJ4Tm5iV2c5ZjJpOWhKcHNWUTNkakJFbngvdEMrZDhmaXFPKzdqZ0Ji?=
 =?utf-8?B?OThIS1djTFgwc2tESFdFYUFzclVFckNES1poVmxTczZMaXl1ZEZOZDE0bDJS?=
 =?utf-8?B?RG1Qa3ZnVHhCem9zMkNMTVNRR0ZTTjhYblN2Y1dKUU1TemdqODVBZTAxVHdz?=
 =?utf-8?B?cVZZcWQxS0V0c2FiQjU2c1ZEVjhobzJGY2h4QUlYbVNXMXVMVmRrWjhzRlFX?=
 =?utf-8?B?aHlFRUpyT2dudmdhZjN5anpJNCtacjNEQTRKNmpsYlNodDZ4U0RZSkZWaWN3?=
 =?utf-8?B?N3Nzd2F6Yk0vQTZoUkJ6TlNLMXpSNFRtaHJIUWVXcU1tT2tOUHJ3amxGU29h?=
 =?utf-8?B?WFBZMkh2bldqTnV4Z2NpN2lJaHFxZHRqN2M0YWI3bUNOUllneXg0MGlWZ29w?=
 =?utf-8?B?MCtQUHg1TkdqUnZOdnM0clZEeTdVMUdIaG15SzhKckljeGpwTXhjWUpxWWJt?=
 =?utf-8?B?VE9VM0pHTEVSWnhvbHZNNGdrb1lsdTNqME5rWWNrSkVzbmJnTy9pbXAzYXVu?=
 =?utf-8?B?anc1REw3WFlGZXkvY1FIYlBvckFKV3NQUVZKOXkrM3pVZ1ZKMHB2VnluOTVB?=
 =?utf-8?B?b3N0QUZnVGw0M1pRZFg5UFhCSWhkcDRvdXRVSGdUdGhnQ2Q1cE45RXIzekxM?=
 =?utf-8?B?V2Z3dnVTUTdhOEhtc1RGbFZkWFRydnhFVGk3VkgyRnVJTEVHTDBtc3NHMDZJ?=
 =?utf-8?B?ZXl6aFlFc3lESTdRU3gvOHFLaGs5UjNZSHYxNDB4VHhmODczTURPZktpTmtD?=
 =?utf-8?Q?eAljyzlthCDVD+L+h63x?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dadea0-f659-4df1-d0eb-08dd9476e097
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:40:45.8445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5264

Apologies, please disregard this version, something went wrong with 
rebasing. I've sent version 4 in the meantime.

On 5/16/25 15:43, George Moussalem via B4 Relay wrote:
> The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
> sleep at 32KHZ, and the ethernet block at 50MHZ.
> 
> This patch series extends the CMN PLL driver to support IPQ5018. It also
> adds the SoC specific header file to export the CMN PLL output clock
> specifiers for IPQ5018. A new table of output clocks is added for the
> CMN PLL of IPQ5018, which is acquired from the device according to the
> compatible.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Changes in v3:
> - After further testing and evaluating different solutions, reverted to
>    marking the XO clock in the GCC as critical as agreed with Konrad
> - Moved kernel traces out of commit message of patch 1 to under the
>    diffstat separator and updated commit message accordingly
> - Updated commit message of patch 3
> - Link to v2: https://lore.kernel.org/r/20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com
> 
> Changes in v2:
> - Moved up commit documenting ipq5018 in qcom,tcsr bindings
> - Fixed binding issues reported by Rob's bot
> - Undone accidental deletion of reg property in cmn pll bindings
> - Fixed register address and size based on address and size cells of 1
> - Removed XO and XO_SRC clock structs from GCC and enabled them as
>    always-on as suggested by Konrad
> - Removed bindings for XO and XO_SRC clocks
> - Removed qcom,tscr-cmn-pll-eth-enable property from bindings and will
>    move logic to ipq5018 internal phy driver as per Jie's recommendation.
> - Removed addition of tcsr node and its bindings from this patch set
> - Corrected spelling mistakes
> - Link to v1: https://lore.kernel.org/r/20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com
> 
> ---
> George Moussalem (5):
>        clk: qcom: ipq5018: keep XO clock always on
>        dt-bindings: clock: qcom: Add CMN PLL support for IPQ5018 SoC
>        clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
>        arm64: dts: ipq5018: Add CMN PLL node
>        arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock
> 
>   .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
>   arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  3 +-
>   .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  3 +-
>   arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 20 ++++++++++--
>   drivers/clk/qcom/gcc-ipq5018.c                     |  2 +-
>   drivers/clk/qcom/ipq-cmn-pll.c                     | 37 ++++++++++++++--------
>   include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   | 16 ++++++++++
>   7 files changed, 63 insertions(+), 19 deletions(-)
> ---
> base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
> change-id: 20250501-ipq5018-cmn-pll-8e517de873f8
> prerequisite-change-id: 20250411-qcom_ipq5424_cmnpll-960a8f597033:v2
> prerequisite-patch-id: dc3949e10baf58f8c28d24bb3ffd347a78a1a2ee
> prerequisite-patch-id: da645619780de3186a3cccf25beedd4fefab36df
> prerequisite-patch-id: 4b5d81954f1f43d450a775bcabc1a18429933aaa
> prerequisite-patch-id: 541f835fb279f83e6eb2405c531bd7da9aacf4bd
> 
> Best regards,


