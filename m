Return-Path: <linux-arm-msm+bounces-88058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2ED03DD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FAEF303D34E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867E73B8D47;
	Thu,  8 Jan 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qn+8OAhG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012018.outbound.protection.outlook.com [52.103.11.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BDD3AEF58;
	Thu,  8 Jan 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867193; cv=fail; b=b55iRLBV6MzuRxyWCXGBDw4c7Up2K8HIFxjzfOQnuG2BaD1dxjc2e2TAcOjrFKIU9voZ+FgyDALsa5VAurS9EyJCqaFaobqOqkrETCObucxkLrV8/lwZiH0uNgJO8BvbupOQQ7bcDvgYZS3wlktf3BCIraQEJnpzPOOGuZPZhVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867193; c=relaxed/simple;
	bh=IgYZhOkz3pmOqmHWfsxaGNLBBb/tIswhi2gIxK4BS8U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oF71w0ce1ZCdUtyjtqfaFTcK7oyEBmmTEIqcxw9euXYFjcisot1Mb000lf5jkH5gzV12uQ3gDGf+6o0+p/R82/r0kIb4HFaSoSZvCwBq44+GbPnbDMP6SmFGeRLjpTol62zN+s/zZCbz0D+rH4/g7KAs4SDDtxT+7ZVEAXqPil0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qn+8OAhG; arc=fail smtp.client-ip=52.103.11.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3nyB/bTC1hnxuSqIVcAo3PxSIQoE8NZ96Ry+2F6ESgZbikPPj8i6746BnjeIIJgfavJV5IVzLmC7qcm9cAnmXTlFgdYl1HNsvKiYuEELh+fKbebySvOfKKWXdVLAzEF32h+sB9F+QEaSvuu5IghhItk9xNMXdPpBwfRgdSqc1sq5+iFAg/n5S2+0GnFSGpalFKAPpBgP9SuTIs/vfH8mWS5jV9CiNbKLqO0+TQrTEL5PcISoA3e6KHzOyMQXkpsb4+zDi1fcrZ+X/U/NhS+BVNoya/2CwxFdDhXMHh0/e6GHLl1hqaoko/G5PUJWJOPMYyhXqc4R4YL2usWxX8gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40ve92LmNtiRtKsKrBrPHBaIYm0ud7GCPEmdErPL4QA=;
 b=P2Qmm6R5jgrt/heu8FPD+YMc7dAkzXkTNR083AeIZVV7npIHI1JTnhrkrMlsf5Nu8aJnVhph+bv10P9/Xos7c0CWVJ/McPk1ZeJeJLjDTPXml1GyB0o6osV0fqfxLV55phWqVFVi8FeTAgUCrUuaggAenRyTTJ8QQ7xOaIZgBfgl9MFa+vflGR0N8RF3N/wD5/gWlYBeJ/AEuZXHgaTxuKVwyz6avnYtYnZGydxuiLcgkxb+CtaLo5imrVE44N04tizTVUD8CUxqvImhT/CiPE5VQ4WX3SO+ynZG9Tba+ZoJcLuo2Xzt/TSQtV5iN7w6vPuRX232dNy/C69oL5Hvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40ve92LmNtiRtKsKrBrPHBaIYm0ud7GCPEmdErPL4QA=;
 b=qn+8OAhGvckDJQx1QEw8d4tKW0c3qbZBqqF+ySxgtGFKu7v2sVypHEHTS9q9CpOMg11xMVw2+/G4MGhprKPlHCLaYPSfcFIGpy2dMUpBzt/rw9bAKtREEQc4xrv/KM3zrWQjo0B6FWo3SNENof2A6u6tBHQa48lXDsGZcHksKsHe1uOzcmt7Ukz53QRu9lG2Yf0Vyp1vzHJ7VfDBolakGiOwkaz7p+71Zfvnm1wd37LyHSWCohCCdJrVC0NqV8GyOIekJFg5Wh1GxzTO80bTIwUe+KaN4CPSsYHr7hbPbeAOJ3Jm0LjEMH4sNMVd/dyEW5Ayui8ZFndgNfwjvmuYAA==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by BL4PR19MB8904.namprd19.prod.outlook.com (2603:10b6:208:5a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:13:02 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::5880:19f:c819:c921%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:13:02 +0000
Message-ID:
 <DS7PR19MB88830A00467D27BF2D79286A9D85A@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Thu, 8 Jan 2026 14:12:47 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Jie Luo <jie.luo@oss.qualcomm.com>, Bjorn Andersson
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
 <DS7PR19MB8883C5FF92412F106B8D41529D84A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <196858fc-e425-4cc0-a4b8-94a0ff4e512d@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <196858fc-e425-4cc0-a4b8-94a0ff4e512d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0120.apcprd02.prod.outlook.com
 (2603:1096:4:92::36) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <d6da2f91-1901-427d-b5b5-5f51a851b65c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|BL4PR19MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb99b2f-bf65-4798-4dfc-08de4e9e8162
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXZ5XHxNrJCjRnjimRBgM6SZNhIxDVu/EKeqGlxcOVlkLolIOU27k233TolUaC2T/FNaGWpQsOCNgNIex/1ELyxzgfgaiKPv/M/3qlgsIKNWwvMW1xOMpFZrAc5KJ26U+AYSXLQyfNeB7zBTWcFX61WL6qAr4uI+lITdoJ58d7pWtYmMyp8VSFfqWCYiG5/rd6sDEGY94TIqc7dL3jXO3LoaLX8ziXPoRBo2SsUhs+iG2V4drm2f7nA8wp9FUh03I0/8rzje2cVNB7krO59cjb/RoP4CICSf/7aIHw3H2p/WmPLPtkoHVSbBwCeyFnGw4X6uNJYq2JQKDqSOMzL0kVG5aR24l47VqAvV2hNnHC/0/L9QxOC1ywbTnvQii80WIHEvLYkKPyoO4wldyXncBoq3ScRiTaUVlxhg5O3YF9xNx+kBIgPrtiu/pH7R/ug7gIWJef/cKc/QZ5D6T6BZRmjaG0eitJTYA7QCsiN/kWaH1p1D1cRYTDjn/OY6NBLZOa1N4yRF4pgMH9BqZKrIIwvYeuOYKjIHsmXov4/ACr8z+A1YkTkziRY3h2+EQ/SLrG4asQveapTBBKQUBIcoAUW6TapG95Gqm41uyLM1ii55Bs0p8wCEJ3aHx6m8wGFwd/wJtVdpy2nwaIE36m4kOExpXe0d1XoKY1T0w7BAW/FaoGkOVnO2Ljxq4Vlja0qI4h2zR1kV7Rgp+7N76h8jLqaeS/ghsoBf+8vbZoBYWqgyce//FMraA/xeKrpxbB5LHc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|11091999009|15080799012|21061999006|461199028|8060799015|5072599009|51005399006|6090799003|23021999003|19110799012|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3FVbzFWZkRlU2pMYXBMYm9ZTHpuaHFNZy9hWlQrYytYVGR0U1JDd3dKcHNM?=
 =?utf-8?B?d1dpL0g1RzYyb3NEN2xzUXEyVHdEeEFvREdoRDNIZnFiS2hUUzZwbUI2NmVC?=
 =?utf-8?B?WHpDM3dyY0txdnRQbXVab3dmTWl1WW5vS1lKTEkwdjlzRFYzMmwrRnJxNzVa?=
 =?utf-8?B?cUNaTG5GeFRoRDhYcnJjeG41ZklNVEViTTZpeVRRMXNtOThZSHM0a3NqQXpX?=
 =?utf-8?B?VmZIK1lvZXI0Y0dMOUlZT3k5Q1RHZzZqYjJLWkVOSGgvSHd1blJGSGlaZFUv?=
 =?utf-8?B?ZlBVWm50LzUvc2tCZ0gzeGxmMXVGZ0taSFUyNUhmQ1ZVMmRBLzc5S01FTjRG?=
 =?utf-8?B?TkFvSTVLdkloQUdlQUZxRXZjSUE1RHYvcFlJT2xVTERqcGRYNnpKeXpMcFdU?=
 =?utf-8?B?ZTJsSnkvVlFHYThWN1dQeE5ucnpJTmIrSktBYWNFSmZuemo1eGhpaWs3UE1K?=
 =?utf-8?B?cjNIc2lLeXNJaUpkcTZNcjF1enQyREUxK1VkM1oxdjYxdHRrWVpFeGhGcEhM?=
 =?utf-8?B?MXFGcmd0bHF0MEg2bXdkQ1dkajFYQXdscDdKYUJpSEdQbUJONnlKbXlhK0ZD?=
 =?utf-8?B?QmxoZldxSnVPaStyR3hhZ3QyWDZIZTVxWFBGR3VaN2FPaGRQYzByZFhyZ2t4?=
 =?utf-8?B?ZmhiaUhKMU5GR3poNWc5Z0dSU2RIS2pFU1lqQ0NrZGh0NSs5YlRQbzJKSmpU?=
 =?utf-8?B?YXN3SW9WNVc1NFFhNGEzSml6ZW0vc2R0SWU5VmtQeUJBM3dGY1VoSTdod3Ir?=
 =?utf-8?B?WW1uVTg0SUVnMWRSOHFrKy9TbEJndDhtR1RNOFJhS1VhdTVZcHlWYm9EU2VP?=
 =?utf-8?B?WkJUQzRKT3dPWFArdDlTdTRlZG1ibldYM3RKYTBXZVVXdGRYdzVuOS9mekR6?=
 =?utf-8?B?T1FyU3RSSnhFOVdrSm5FcCtsLzJmZStUTmJOS1BFUFVMeDlnbTNYK3JnZWRJ?=
 =?utf-8?B?K0FMcVlWNHM4SnZQKzVtSmI4cEl4S3h6d1FoOFFRR2VWMjlZb1BhV1dKS3RV?=
 =?utf-8?B?MU9RYm9sY2N5Y0RPV3dVcFF4TSttRWJIblZNS0xPS2RFM29UdWZ3bjF2cVBX?=
 =?utf-8?B?VDY2WklEUGFwYW5yYWE0a1N5eDduWmhEYWdVa1ozb1FrU1Zxcjk1UDBQYW9o?=
 =?utf-8?B?bHhlVE00R3BpMjJqbnhydEg1Z0dzQThrRlhCWXViOEVFcHVOcmJSSWcyWXp4?=
 =?utf-8?B?RnBnZDlpUkNLVGl6b2Z2QzNXY2xwaEdiRmZsSW54RHFRWDYyZ1dVL0o5UmRy?=
 =?utf-8?B?REZTMnJxMDhNdGowc0R0THVnUHdsaFRCd3RyaXl4T3JIUTY1MTcwWjZ1ZmJL?=
 =?utf-8?B?aSsxWEYydjB1Q2NVVHJQYlZSWWRuZjQ4eXBPdytxWVJHWlcwMnFDZzdraTJT?=
 =?utf-8?B?N0xldGxIbVNydmZ0ZGp4Q2tXcnpGZFE1dzhTd2I1VFNpN05pUnh0NlpTRjVC?=
 =?utf-8?B?bk4xSEVWbTBvc282eWtRdkpVTy94Vk05Y052em5ML2ZFQ1BiaTFhZlFCbDJ6?=
 =?utf-8?B?RzVYL0pwaXIzVjhxZGJIeHhtNWlrSmQ1ZzlVUDhIcjRwWCttQU5xVVphNGNS?=
 =?utf-8?B?amM1VUlLWnYxUjNnUzV6RnAyMlBkbzg3OU5QK000YXdCUkM5MDl5RGRQZkRi?=
 =?utf-8?B?UjFDdTV3ZkM4Y1BYVDE4V2hzZ1JKV3puMDQrdjdaYkRCK0ZZOEEwTGdoSHVV?=
 =?utf-8?B?S3U0anQ1aXFxUWphRnZ5NDFtM3FWbTlkM2h3M1lQa0Q4Q2IzaG9ORkNnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VlLzArYm50bWJ2TWQvc0swZ0tvQXBYU1g4Y05oRlVPZUtnbEV2UXNISlBR?=
 =?utf-8?B?S0xHNmRPUkpORnNkeXRQKzlDb2pMUXdOa3dYSzJEY0YxZmZ0N0dHUEY3aUln?=
 =?utf-8?B?dTVIeTg5NDh2S0loaHhlMDJQU2pXaWlJNnBEdlAxRTZzWFd1MmMzRFJzVUlC?=
 =?utf-8?B?a0dEaXZDODZPUlVkMVlxR1R1U0QycXJwdjlBeGNPUUVkeFdwVHFKZ1NUd21o?=
 =?utf-8?B?a3Y2SG1HdVVhTENpSzA3S1NFWjhuMmJQOFduUTNpSXVHUU9HbUx4Vmo0L3ZP?=
 =?utf-8?B?TFRLOTFyMXBJdXZyeHAvNWJxU1BwTzQxNFNnMGhocGpnQjJFWk5NaWVMYlNO?=
 =?utf-8?B?cDhjMHRHRnNLNi9NYmVTeUZ2ZE1TdGVQM3pQTkVQNEg2YW44V2VVbFBrcnEw?=
 =?utf-8?B?V2ZUb00rRVBlb1VJM2JXRVdtWmE2SjZnbHpXcm9XU1FxYUpNY1BUNzUxYzdS?=
 =?utf-8?B?NGc5YWRWa0h0VmVJSVExY2pKUjcvbTdmY0FyWXJ1bGtBL1hPd3FJbWVEMks1?=
 =?utf-8?B?UTBNUU12SGY0eEpTWUxlM2Y3dUJraXFMZHo3UlRwUDZDak1iZE0zWlJNZ2VX?=
 =?utf-8?B?UTB5TEgyajV3VFZoK3hlUW1GZUNyRHFTVVkxMVRIUkJaajJDNFZjNDZRcWtm?=
 =?utf-8?B?blJyWUt1eFV4YnlUR0h4aTU3b1ZqQnV3NXFpemhoVEc5SldXd0E0R29nT0xF?=
 =?utf-8?B?UTZVOXN4d25zWHI5V3hSRE9acndXQ1B6M1dMMnlHWGg2TFptdkUzQms0MkpH?=
 =?utf-8?B?YktTOVFmcVZobU1QT2VrYkJWZVp1SGYvQlYxZWJ4M3RqeFUzWWRNWXF3S2ww?=
 =?utf-8?B?TEZVUVp2cDFoZFRsek94azVhVzEvdmd2WHVYK2hRY3hZN2tvWEVmS0xtajVk?=
 =?utf-8?B?eDd0eTFFS2w5ZkZ6Q1pLTm5OdEs5RldVUEwvUWpIV2N5Q3QrQXU0MnlkKzlx?=
 =?utf-8?B?QTVVTFpDeXphZ3ZZd3VIL1pXbXNsQU1FZTYyV0kxdWJMc1dkcTNUU01sTlIx?=
 =?utf-8?B?NkM2MmpNOGdsdW8yQmVjUFgyUks4SlZWNjZGVjcvdVFiZzZyU2RySXpkOFpJ?=
 =?utf-8?B?Z1ZicWdPK0tmTlJLTFRLNmw3TkJrT204VFNQT1RpYnMzSnJaRXlOSWZ2QldU?=
 =?utf-8?B?UHZ1R2tHRXBXbGtNUXdydE9DMWIrYUVvUi81UjZBclpKNll6QlFkcFpJUHZo?=
 =?utf-8?B?VUdJWWFhYW1uTjhadk13NGkwV0JJeG1IWHMrblpLenN1ditKUmtNd0I1bTV6?=
 =?utf-8?B?VWU2RTFiUkV2Z3RwM0xTb3c4SGxQWGY2RFM5UVVENk8zTjdBdVdCbkgwMjNk?=
 =?utf-8?B?WlhNQW9GekU0K1V0WjNPR3FiV2pGeVRGVG1EMXpBODdnNzJZRjhSMTdIWHZZ?=
 =?utf-8?B?dys3STJKM3VIZ08wMk5GaVJIYlBQcFUzVWVCU0g3NnloWk50cEY1dEYxS1p5?=
 =?utf-8?B?MUliOWNyaGd0MlhsaHJxdTNNNnJPQzRKTlgvRWhZdDlubU1XMFlMclAySWZz?=
 =?utf-8?B?ZENVWGxEckljcmY4TWdIVlpaL1Zmc05EbnNFV3pNcGxocEY4L1J3MDNOcURR?=
 =?utf-8?B?bVZWdk1aY1M1eHBrdDU5R3lhZWFxWldLTnRvZlEwUitOSFNSS2MyRmZZajZ4?=
 =?utf-8?B?OFE1QmNuUGY5N1VHL3UySThGU3hBMTQzczExZGF4dWV4N3hRcjNaRUZWMW0x?=
 =?utf-8?B?Z2xHN21tV2VoN2tYMTI4bDRWelg1WnloN2VyRDI4emg4WW5WMEl5MXBGcndh?=
 =?utf-8?B?M09RZFFYbnVuV1hFc0psR1BYMzNHZldKeHVGUjRSVVNYY3QvZ0dTbUFQOTVy?=
 =?utf-8?B?NXluVEl4M2RobWpOTXExRjRKM3M5cmY0cWI2MjlFMEdOdlVYY1RNck5SSFo5?=
 =?utf-8?B?Z2xhU2JLSTI5c2JkdUE2cmVvUUdiRUtvemFKQ0Rnb0JzdVE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb99b2f-bf65-4798-4dfc-08de4e9e8162
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:13:02.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8904



On 1/8/26 10:42, Jie Luo wrote:
> 
> 
> On 1/7/2026 9:17 PM, George Moussalem wrote:
>>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>>> rate = (parent_rate / ref_div) * 2 * factor.
>>>
>>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>>> IPQ5424, IPQ5018) that use ref_div = 1.
>> Just tested this patch and can confirm IPQ5018 also has a ref_div of 2.
>> With this patch applied, the correct assigned clock rate of 4.8GHz is
>> also reported:
>>
>> root@OpenWrt:~# cat /sys/kernel/debug/clk/clk_summary | grep cmn -A 3 -B 3
>>
>>                                   deviceless
>> no_connection_id
>>  xo-clk                              1       1        0        48000000
>>   0          0     50000      Y   deviceless
>> no_connection_id
>>     ref-96mhz-clk                    1       1        0        96000000
>>   0          0     50000      Y      deviceless
>> no_connection_id
>>        cmn_pll                       0       0        0
>> 4800000000  0          0     50000      Y         deviceless
>>          no_connection_id
>>           eth-50mhz                  0       0        0        50000000
>>   0          0     50000      Y            deviceless
>>   no_connection_id
>>           sleep-32khz                0       0        0        32000
>>   0          0     50000      Y            deviceless
>>   no_connection_id
>>           xo-24mhz                   0       0        0        24000000
>>   0          0     50000      Y            deviceless
>>   no_connection_id
>>
>> Once accepted, I will submit a patch to correct the assigned clock rate
>> from 9.6GHz to 4.8GHz as the ref div is now properly applied.
> 
> Thanks for validating this on the IPQ5018 platform.

FWIW:

root@OpenWrt:~# devmem 0x9b794
0x00006C32

50*96KHz=4.8GHz (correct). So:

Tested-by: George Moussalem <george.moussalem@outlook.com>

> 


