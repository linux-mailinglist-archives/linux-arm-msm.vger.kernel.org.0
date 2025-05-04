Return-Path: <linux-arm-msm+bounces-56679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A066AA847B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 09:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC9418970E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 07:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0384F17AE11;
	Sun,  4 May 2025 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PrR2gNrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2051.outbound.protection.outlook.com [40.92.41.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AF137E;
	Sun,  4 May 2025 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746342893; cv=fail; b=ln5P1uQwoSgvDeUwYV7tfx3iB1fVPp+UIYR6pDib46R5ZZLWpeyeEPc+99mSgTah4lxpYrPQfZAFq/F8x61mNvxpyUy+ZS9Tqy3d+SJVy6ksHyQIbpjqRG2qLR6cBIJM0cTA63AoiTMBSLgMTXQH635RY4Z3yBiNXP36xkqjgTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746342893; c=relaxed/simple;
	bh=8hxyPuiISk8dnOpZjkiPBLTinERuPf2yQigNatMfz5Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iPj9gqCotOUV+wDpDuDVp0B/WcAlZ672GXEm3MJLzLGpxNl+0G3gHmsI+bHTX+lM7Sd7odEY8ph7uVP3dGdT2EZUQUej92dI4xtRaoSnaKKd/LujcLR+PsMLsHvzV3557wJc7/OFeCT5cIhuLWiUET3mLlCY2wR5S9nh5pYF+m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PrR2gNrc; arc=fail smtp.client-ip=40.92.41.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAYlkWjITtjPrg4WVPww/OvA8eA+/px467dIPWvdzCf130o0C4t1QLxjnV1MnB4Kdp1fnd7FilDTaW44RFvgVxra6gVDOReekCFsbeljHShf5VpfgPGvZ8Pm/kya5R89JEKr0pfM/+7i9lmoNSBGPImwTzcQCNm0hlcFiA/54mkewDmUF1FhyobwumKnd2JLbmvYZMHsnnjbYIOORSTK0Xn2VI3+f8OMWkZgEXv3Bagp0lBPX+4XBkBs/sErOXl/CTb8ACGVXIYhS99yYLKOKPiAyUdQolPzbGT22LCVnNU9Kolf7pF+9p6w/b1h6eaXzmELee+dXIyMD67MG2V5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBYGParveyG4Jgo5qYzFkuy8hDzrxiFHfZWtZ06AN78=;
 b=CgjpcWrikm2QP/dfUj/QLXCXBY5/fvH8Fng1B4oPbTAluZJrIVZelkj1xeJjoMs1HcuHosaMc4J+1qIzJVTZnK4CjIDTBBbE1Bg50ArQSbDSFsyUfiE2BwtA/Rkirv0QwWZVyZ9PdwiVY4xLP8FlrFlXqL0Jimcgo5dCXCSWb8Za2L1orRx/IHrw+sC5ZSe8nuE9loAQIN4J1NuhZciHQhLaOFRD5JV0PW0Uky1lL0h+g8wFgJNQPkyY1CqPqshtahAKiiVN3JWT7IV+Mfz1RjoxNeJnsqF8HYFoCNkbmetNz5JAGB9Jv51eEe2cqZkW04EPVnE1P6OsIW6L072LZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYGParveyG4Jgo5qYzFkuy8hDzrxiFHfZWtZ06AN78=;
 b=PrR2gNrcGkwMMzwZAmAMMxjk7oRyIiRRkjBt3qT460rYFNcpRA6yAbTxGps4OHGqHexJ1iG3xxI8Q+ZUY71O38JozloVcVSwyw81rpalC38CIKm/TTwQTiIrLb0aPYN+kpkYRdRyC0xviiPm0xXXMn0k7npIalM7Kdeu8giohx/oRHWhM6k/sEiX/eSUUVPaLV/LFVTGu2cehJWMmaq9lqhPLE1KWvAqOswpP+Y1dz5UcJj5xMOkJe4AtQVScOIINP2oA14Vdg9sKzuZNJWSE2BkXMyMo4CWM68mSesnlDiZAArekm1hX/dLJZ7nR4sxDUJ2xYJUU0OD7pjN6GSAkg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by CYXPR19MB8488.namprd19.prod.outlook.com (2603:10b6:930:d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 07:14:50 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.026; Sun, 4 May 2025
 07:14:49 +0000
Message-ID:
 <DS7PR19MB888324A56948A30D7C5358D09D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Sun, 4 May 2025 11:14:39 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Update IPQ5018 xo_board_clk to use
 fixed factor clock
To: Jie Luo <quic_luoj@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
 <frlw5n2fxu5wxrlaahiuwlgaeg4rsqk7ushpcgvc2q4mzorrzf@e4axknhir4el>
 <DS7PR19MB888312EBE14582523C3B95209D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
 <35dbe18b-2c10-4af2-8ffc-05278158be68@quicinc.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <35dbe18b-2c10-4af2-8ffc-05278158be68@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX1P273CA0016.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::21) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <909ba966-8c04-49bc-96c5-27cc89916f15@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|CYXPR19MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2750d228-1aca-41b7-75d7-08dd8adb5b27
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxE0JGXYrS9fy5PsgWBwh4JQWIIfHwbyaGFmW8GLWVlMzK2OUxiJeRnxcktLY0QmxTBdXS2Gcu45Nccu+yACc20WqAsn879d35F9xcwICzbLn7L6FYj7jACnSawO3pZeTOhoG/+TqDOtoqw+/cHsZE24JMdxqL+B8oPqyOoCe1VXJiWyjF97Nx9LhtIQ7g+WQfWnVF8wTLt3tS6bKlYZJdsqjnkeAnkjJp0JokJpuMsJ9CGsnGyla7Z1iDbWSZMZxeXGdcfi807MuAAwHKVYB81BOjnWsK1ZOW++xQbMqcinNI8EB1zAFHQLzPnQBPDXCpy7LbtgY8nsL03jdK0vOhXSrSVXWXfaeT7WldCHIpreXrpSJkm5flHUhZI7oNTZ8Utj6SVVieTNDxYJ+s1nylR8/uji1eUdHlgy9D1D+UVKjH9BqNYAwe9NPNBR51ScxLyPz5htnVCXbwSLGoDQSTCBfmhwLKx4XqQhO4W9vzDbUyDYPaohobAX8Vxp4rCvs+pwjZp3Qa+gTmmMWqAYuUXFJvIXuUI9Eu6h6V0G4+IyjiSlWITXq3RA4HeLg++eM/R7HMVStIzJavLcV8MTwby0/I7jQ1xfRpRp2BfmtYn8bbPwNP13aOU/6dSgZMWv6CMfMik4gzliqmvyTxVSNZUW2XmqYPTPhbB0ox7xdHt75kIApfG+m2Hd/aHVLiW46aD6vbM5xRSY4bgMJrjkBDF+kF626FJ52NldFL6G6+fP4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|7092599003|15080799006|8060799006|19110799003|6090799003|461199028|440099028|3412199025|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1hvSG8yN3RoV25xRGFtSmFiUHo2MnZ1RUlyVnlpamkvU3AvazVqVHFUalJO?=
 =?utf-8?B?c3lFelZ5NzhScSt1V1hqRHNCQ3VNYmlnZWl4OGtSVE96TnJTYjErdm8xdU1I?=
 =?utf-8?B?b25MeGNiV1lVYklJUENsYWNuY0NLN2M2MW50akZHVU9UVXFyYUQzcHNmUFBE?=
 =?utf-8?B?Ni9YU0daYkJUdmpYS3ZmMGJlbkpNVkdJY0hrRWJrVXJVb3UrZWpXSVN2bEZj?=
 =?utf-8?B?QlJaMXd1S3FqOGhlNmN2eGNPbHVPUDlBNGI3QjVVSno1TVgva3hEL0JOYnNi?=
 =?utf-8?B?WGsxUVhkOW55NXhWdjArbjA2WlZCVkljWEo2cFhvWU1KZEUrWFZTRXJpRDRj?=
 =?utf-8?B?MlFsWmgzYW9VTXlyWXRsWFhoRWJQL25CVStZaEFBdy8yZDhKTW01T0RJTGZ3?=
 =?utf-8?B?dS9IRU8zMHlDVEJoNnEwTGx4QzRLVkgvWFRyTUIxYWJ1RlhIMVVrRnB1YjNr?=
 =?utf-8?B?UXFIWmhyVU9mVUl0SlVRSU81a3dYZWkrbzNsQkN5RFNaWWNvbWtPallnVnFU?=
 =?utf-8?B?bnVvM3MzalVkTC9vZW9TZVFnRWtZUHBlcEY1SCtTcHF2Q0tNM3lINWVUcG5j?=
 =?utf-8?B?RDRhL2NBdS9hZ29nK3IwUWtiTy9lRHZXUU5EMGl6QWJIL2JNeEE2M1lFRzlR?=
 =?utf-8?B?Ymp4Y25LZVVSZk81QlkzUVMzQklCTEpiQ3hiRGdVdnBvRE1xclFmUStsMWlo?=
 =?utf-8?B?VmhxSTBSOUlkcVdIazVUMUZ4L2tXQnEzVlM0Q0JBZmNjeWM0TGc0NUdqR1hQ?=
 =?utf-8?B?TVI4NUhUWW5UeFZqRnFZWFlPRzBCR3RaVEVHQW5WZW1ReS9DaksvUUNiaCsx?=
 =?utf-8?B?QXBJOTJqMEsxZ3B3VzZmayt2cW5mY3ptZXRtODJpbFh5ei9RWEsvN1lLV3dB?=
 =?utf-8?B?Z0E2Y3MwTTJqWmVlZ3hIVGxISStpTDJ5czV2QkIvWEI2dnUzZ09jcXF3Nkti?=
 =?utf-8?B?cnRETjVmT2VxWlZyc0tkcDIwZzZhMm1taXRLbFlXSXlOMGh6YmVWdGlkTCs2?=
 =?utf-8?B?VGhQaS9OUXNCaW5LaWdQS01kZmR0L2xFQ20wUGZRWGd0SldadFBKbVoxTVR3?=
 =?utf-8?B?UzhSZjdDNjUrMVRzUVJvS0ZjWU9teHNlR2xLUEFndjMvOWRKWUdoOWhSRHdU?=
 =?utf-8?B?L2JtWWJNZDBidnM2dUNVQVJzV3pmTHhEdDdicGg3d0duVUNzbU03MXFFMmdn?=
 =?utf-8?B?cHo5THBETnk1SjZXVXFhRHhISTBBdzM4ZmgrS2k3MmxSbGRXdm4wTFZrTllN?=
 =?utf-8?B?TU9XY3ZkdWZqMU1hSEF0UUZZQkZ2K3ZEbFBEOGZYYnNmR1dIUTNRNzRhNllK?=
 =?utf-8?B?OTRCcUduOVg2Q1d1bWFuU0hTbjNFUThHNEhsSm4xR2ZQU3lhRUd0REhxM1BD?=
 =?utf-8?B?MFZjR1lHdGRHY2VyRGxSaGI3Z3RuNURvQmNrTWlyank0M0RtQnBIcGdJejFn?=
 =?utf-8?B?aEZFSjdFclh1ZzN0eTlrTEdkdGhyQ1dGUW1pTzBKZ2wwb1NrcWErN21XSFZI?=
 =?utf-8?B?SjV0SmJiQmk4NnE4YVZLdGZxc3FDc2xvMDNGKzhscFovbVFHaW4rZzQ0dlZX?=
 =?utf-8?B?T0N5cFZabTVaRmxOQVhOL1BKSzNzaDk1aDRNZVdjRllSSVNrWHlBeFVEWjhk?=
 =?utf-8?B?dXdGMExWUkN6MkdzYlJGZGhmMTdlVnc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjJLWG5vQmliT29GSW02Nis0TWdDNnNHdFk5c3FJUHNOVktGak92cVVqaDdz?=
 =?utf-8?B?cFpXVi8xWUtGdmpsY3A1aE1tWDBIcmQwNXRlRXZ1aGp2eWJxZEpHNUxPY0N6?=
 =?utf-8?B?eUQyeFNEalJibE9QdUpXc3RpRi90S0FBMDM2QVo3SDhRbDBiNkhXWm1XSm9B?=
 =?utf-8?B?eEFobklDRmFWc29ETjIwTDZPZE9kcFRlOFlaYWhGZ3c2QThCcUxhNTlscE5i?=
 =?utf-8?B?UDdxMG9sdkhMdVg3UE1iY3F4Q041Y1pKdmVYdnZlS3Y3SnB5VS9YYlJUSjlX?=
 =?utf-8?B?VWtQMTVoVHhSQ3pkMmtyYkdwbXZGUGN6cjQvTG9tN08ycjJiU1MwMlRNanVr?=
 =?utf-8?B?Z21FWXdzNVJaaDRPNmJTblhYRCt1dGdZU2JvWEY4QVczR2FrYUl2bXIvSllY?=
 =?utf-8?B?Y0tvOVd6MHJWWUtqQ2ppbHY1cFArMHlLTHdUbG1GVUpwcFhKK2Zya3ZQYTJG?=
 =?utf-8?B?bHFWT3ZRRzc0OXQ2R1orZWY3UjBQeFlzQmpBUUtubnl2TEl2a1pYMGFMVzM1?=
 =?utf-8?B?RFpRRUkzcHQ5SnQvRkxTcTRJTUV4akZoSWFRSjB2ZTZmVUNGN05DcWxSN0x2?=
 =?utf-8?B?dUdmU0xPbzdyM21qaUo5K2VoMlVPVXNuRG0zbDkxVCtDWmJhYUZ3TXZmaEpu?=
 =?utf-8?B?ZTlwS3l3NktZc0RhZjlUL1ZMQjdJUCtlME5RdUl3ZnBKOXM3dUl4dDdsZXFx?=
 =?utf-8?B?b2ZvdjhGVUJ6a2Q3RU9CWHYzdnI0VVR2TG9DMUxhT3lyK3MrSWVoNjRNTTZo?=
 =?utf-8?B?dXR4Yk9RU2JDNjMvVzFIT0RCdi9MNlAxbFBOWDBUbXpXNnR3YXBKZUpVYmhE?=
 =?utf-8?B?aEU5d09tdDFSMWd6SmdHY1RLai9NKzlaR0laT0M3eDU1MzY1THN6RG1VNkhU?=
 =?utf-8?B?emFvbTRSYXZqYmM1dEZMRWF1emtxQ3RsY3VmaFNxMzlsNWNrbmlTRVVYcFdG?=
 =?utf-8?B?Vm1RMVU3RmdNUE5xVDhKUWpvRjdvWVJwekYxU2tMeHNDMlhkSlp6RDExanpE?=
 =?utf-8?B?UElEZ1lQYUhHTmVUMkprcHRsbU4wd2k0ekpWeVJsVmRteW1oZGcrZ0VFRFE4?=
 =?utf-8?B?aDFhOVhqa3BqT0dERTA0Slc3WmlvZ3U5R2kwMHcycjlKQWpsSDFkTGloeXNV?=
 =?utf-8?B?SGdYaHBWcmlTcHIxMHpDN3djMXFLTW4wNk01N0p0ZlVWSTFrZ05wVkIweGJH?=
 =?utf-8?B?cXEzTHhTL2FuaEFJRkNmM1RhazlaV1B6N0N1NFFnZWZrWlYxNEN1SXVmbk9j?=
 =?utf-8?B?UE16aTF4bzZ3ZDFWeWJXZm9zbkpGQVFZTGRwN2VtVms5WjcxVWdtSStBMVR0?=
 =?utf-8?B?bUFXejh3a2QwdVlSZjNuTlpMSEZrd2RmSzFCcC9ockxGOVF4V2RqZ3kxQTE4?=
 =?utf-8?B?eUo5S3dhdUF2TENOcG5NdDdCTS9JRk9hVnpRdC83YnpUY0JNMkNjay9ZTmlO?=
 =?utf-8?B?Z3A4cU1QWUp4TEJaanJUS0dVOEhPRXpJem9LN0VJWHpKZW5ZazJUbXJVaGRi?=
 =?utf-8?B?RFZETHYvY01CQ3oxSXEvRkpoWjUxQzVvQzJLWW1VZFJqSEZxREZoRVZTeFl3?=
 =?utf-8?B?aGU2M2ZZVVVnSU9rbElrTTIwdHNZUFV5UU1VeGcrcTNDYzBLTzZaODF3am1R?=
 =?utf-8?B?V3luM0Q3dkJ6WkdrV0xEMGRlVDlubktRaUtTWmNyNEQ4cU9hQk45em93bTZw?=
 =?utf-8?Q?mg6dVil+vCblD5DJgsOH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2750d228-1aca-41b7-75d7-08dd8adb5b27
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 07:14:49.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8488



On 5/4/25 06:17, Jie Luo wrote:
> 
> 
> On 5/2/2025 11:53 PM, George Moussalem wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-
>>>> v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>>>> index
>>>> 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
>>>> @@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
>>>>    };
>>>>    &xo_board_clk {
>>>> -    clock-frequency = <24000000>;
>>>> +    clock-div = <4>;
>>>> +    clock-mult = <1>;
>>>>    };
>>>
>>> Is the divider a part of the SoC? If so, please move these values to
>>> the SoC dtsi file.
>>
>> my 'best guess' is that the ref clk for ipq5018 is always 96MHZ and the
>> XO board clk is 24MHZ, so it should be safe to move it to the dtsi, but
>> this is purely based on the 5 different board types I have.
>>
>> @Luo Jie: can you confirm the above?
> 
> The xo_board_clk is achieved by the bootstrap PINs, which should be
> always 24 MHZ, we can move it to the RDP common DTSI if it is existed.
> 
The RDP common DTSI doesn't exist. If the xo_board_clk is always 24MHZ 
and the ref clock always 96MHZ, can't we move it to the SoC DTSI? Else, 
I suggest we stick to setting the div/mult in the board DTS files.

Best regards,
George

