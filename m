Return-Path: <linux-arm-msm+bounces-118079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 04HYMTbnT2rvpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:23:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CA73437D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:23:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=B93se2NS;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118079-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118079-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D296C3037157
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48274DBD6B;
	Thu,  9 Jul 2026 18:23:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012046.outbound.protection.outlook.com [52.103.23.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191F3876B3;
	Thu,  9 Jul 2026 18:23:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621428; cv=fail; b=XnGUND5D+mPB5UFAZTwQifsVd+Gcc+pW3zpZpisgts89I2goYpuNh+yLLgkyAxy/WXuhS0lpHxfrgDzKiCtuoTzDYkaaVd/3th4OAQFnX/sIKz0X0HMrpGAIneQ5OMhE3KQcrj1a6279Z+iaHWE7aveaGtcQbvtQi73CwKxW8BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621428; c=relaxed/simple;
	bh=h+I6OT2yeXp+24YDrNux5ISXltGeG13k9xlsT5nv0Rc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aRIUiecY8DkTTSKSfP8CArwXtIHRC/E9jKmv72zPArLIllxTx7p7wCDKbNd1Ihz9gWL/bvETJzew+caBByOQZDWFwyjaC74SBDepZrztlphl/3HFhNdfHIzHuP3oFCKYKX8GhlgPf9aO2oEencb1I8ksC1w3fmhUtv+C6XqMpqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=B93se2NS; arc=fail smtp.client-ip=52.103.23.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLiBoRt6o08Wct5o4vVbzYU0K7A52sM274DKMRA36gzaNPG8ivL2aBdnFHwRvRcviRQGPG4kl3hvGV6FyCebP9t0ryGeURW879P+fkeTbkkrDxPNVW05E7HsLziAQBxReoMrZU3XSwnfFMG3K1zitJkA4OOiIhlehAbw3NpMm7AZTa1Lb+9j6xJJ6722KK5gIblGS7DoceoSDz804w8/NJwL1xnd8P0RoJ3e/6Gya/77Lwa7Xj4Lwfb9IJjcke5AM5tjxtE5HVnULNVj2q9nkgoB0EkZYscKDen4DWEhVMs/Lmd77Jr5/AVlqhSKe4nQCvneazd19nHQ3vypphXVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0VIcbsFp+zB+eSZ0kafj21V17fP9R3ou9YPUJDoO+M=;
 b=Mx4wgGaZEAZ0/jFMwc0F67pJH84ZLPvhu+351UQVH1hdh7R/JdA5Z5RNsF65io0BnFa/sb4Kc292JVH/iQX44nHr2vS5XcASmBL2DldFN93hOet4DBlUmSSBNq5wGuAeEEq87h2jyAmcMNun2tkD8zpWN76ZOk6RxS3jr1CocoXrgVgbs1tICjilTTTHdOICvUuWwsPctd5BeSPyXKfyWTJnlctWfVqxzOE/D7ZKnv5/W0P5nL8KFCPQy4fVphalGNCDd8OcXfoVzzNylly7soVdUTqzsjU86COsMhR1m2lv7wbMmFyHsZADv4tGJhdx5UFFgIZXTm5ACFWe8Cnu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0VIcbsFp+zB+eSZ0kafj21V17fP9R3ou9YPUJDoO+M=;
 b=B93se2NSTAsQhR21WNw4QqcTjrnOTh01Gbc/o/W3n1PUO3PHZnyUVXnijjOOsXrx4KCQHbbG4IpqdzX5nzlqErcAYfRSE3i8OSfWovC5e/c+BDUkjk/2wsEcUzXCZVWQ4MogTFuSwydfY/eRRKhAwwXNzdkx21JxyxJWegSrCuMoYJ3jNzqLYR9c4+dJ1VOrPy9iGzdB55L0kyo3Wzb/lWa2Jjelc4hxJz6cqkvwEjF3Ql4WzRZWUnLSY24ijJTmCknJO8B/a+8DtkH9oJY+HYdzugqDueUvLY7GptWFnQ/MHr2R8HOBfc4SUOM0lVi6boL7n/a+983mVq3DRGe7Yg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DS7PR19MB5830.namprd19.prod.outlook.com (2603:10b6:8:79::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Thu, 9 Jul 2026 18:23:42 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 18:23:42 +0000
Message-ID:
 <SN7PR19MB6736EAFFCAD701A031567CF29DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 9 Jul 2026 22:23:32 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <db6c35f7-b2d2-490b-b2ed-4805eb0a967b@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <db6c35f7-b2d2-490b-b2ed-4805eb0a967b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0030.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5b::7) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <f76e6049-916d-4ffa-93de-9de10be9b901@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DS7PR19MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: f19803b2-6a74-48bd-0773-08dedde7338e
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOECHkn5/xzV8uaWAIdSWpmFhoJ4bbtHgF4JBZSl1hxnqt2+Ud38yJMaFxQcQU+m92KkRqcc4kvoyIUsFR5i38YS/FOExZIT3VG+tPxodRXnnKcPzfNAFKf0QxfavtnMj7Q84TybismBMTs+d0RK+nPc/PY2mkc85HP+vwQkRbX67wFdfhGFistrWgCvY6lcsdNGSClBssyPRKxtdjSilV3ahvM5dLIE+vGd7DcA3aiBjWZ/0f71+hx/rL85JOHFV2s7/hIGyVOBJipKdS8mPRxDedKIqnBxCAhnQsyt/EduHsm7TBHvhgrVE9HPHkp1Qe8HZC/QwrkHosuH501QNB++PUYwntO+77VTReyqXWlmsGpbxn9aKWrhtJshVGcGczi1ttkV0SjhfbIAwC1U+XXfEX3OgVhYg0dT/ETHF4PYt7Ww2Gud/hjBESJJrxzwHX96dz5jR3QrIlvhLzZxOc4FIJUXvs2+A/28Qa/s7r8Xg0Fxni+/mHXzthzWiYOCyfJNqLOd7kS+e2NXOeIjIiiOxlyo1iS79oclm/ux6rbWD1umhKOYX2UgAG5/c7xcnc/HlMgxsrKKRzzacrO7wZWqGdMxGt7IrNQvIaB13mONLJc4CbEpxqXO5GgJOyqTuT9ljRgR6F0rrV+9R4chjst+wCOQvCgURkd/a/c0ovU/gYqoxY5Q/aQIA39vf6YFi8mDA5iy1dM/l0rQWrr5y9/qX2cEX6Ptb8rRqToC5tsEc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|15080799012|8060799015|24021099003|37011999003|23021999003|19110799012|25010399006|6090799003|5072599009|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFlXbjNyODM2azRCQkVudXJMcDg4WTZPMDJWdGVlYXVkYTRXamJwbWRhSVhG?=
 =?utf-8?B?Q0hIaytRazJtbFVjY2VCeFhVZnhRSm1Xd1Rtdyt0UnI5bDdDVFJraWIxazNK?=
 =?utf-8?B?WFpvcTVqK0dMeWdmNlRzNU9jNjdpYXlNcFVFN3FnVE9UcHgybm43U0RWYm1B?=
 =?utf-8?B?YlVYNzhBcmgrbUVQeEQrSHFDWE0xQy9SZkw5dTdrK2dwUzV2c0FQY2Vtb3JS?=
 =?utf-8?B?WHFJMGd4WWtJTDIyQWpIQ08rY3Z1WHFqckluNWRpek9WWFlPOVEzTnV1VUNY?=
 =?utf-8?B?bGdRak1FTHhRbE5CYlBUV29zbVJIdnlwenNWZE9FRU96WVRWeGpla3dFWklL?=
 =?utf-8?B?MElncVk4ZUNiOUI0RWpJRzhJVG9aOWtBck5KZ3AvekViRC9wUUc3N09wbG9E?=
 =?utf-8?B?eUhCNkk0RG1scXcvdndUTnJVeUJ4WGxQNFhQMUZjWkVhR1Z4T1laRmlIZFVh?=
 =?utf-8?B?ZEpuUGI2YVZDRXNlTWFuN1IzaFRGRkZHa05veS9GczByUVdhWi9HdzBUNHJP?=
 =?utf-8?B?Y0NsdWI4THNONVdsb1FYbHNZM3pRc2xKSG1LcFRyak5TZTZMTXoyM1FXQnNj?=
 =?utf-8?B?SHEvUUZOUG0zQkdzNnJDMVFqL2JwMURJaE9BTUhnaThMS0huMVNJb1IzcVhC?=
 =?utf-8?B?Nmg5WERoZ2dCc3Q3ekJjNzYxeXJxeFJqRkliRXVuVmpkUk5VSklFaHlFdExq?=
 =?utf-8?B?a2dCTEk3c3MrOUN4cDZaaU5VblBlUG1mWkVVUnhwS3BkcGRXQ3dnTG1maDJw?=
 =?utf-8?B?OVhoSDZ6R2tBZWlZeS96ZmVMRGszWGpQNndoSE9VcTRiRE45NWVhMXUzWGU5?=
 =?utf-8?B?bUNQbTlaVGM4UFZESGZ1MGRPR2hzc2w2eERZYVIxTHBhazN3VTV5SzZOTE5D?=
 =?utf-8?B?RkFiQmZNZGdEeXV2and0bXVlWWZ3UkVpMkw3bytaVTJiRUVTNk90ZHFhRXZP?=
 =?utf-8?B?NkpCNkVlaytUUDZBUWdVNWJyMGtTTGUybUNaejZUUE94cnZmbzJzOXFEbkQ0?=
 =?utf-8?B?Y3hBcjVXQ1lrTWppaE0yWDd6OHR5dFg2T042Ny9iU0RDcmgwSHdWazBJRGkx?=
 =?utf-8?B?R2RyakZvU2g2dWYyM2VndFpnYXE3UFBmOWRuQ2l4eXpEZm04RGpzS2tKOTJi?=
 =?utf-8?B?aE9mZ1dWb3hrUCszdStSZ2xGb0RhODc5NW0rdjhJVy9sZjlZdnovSWp4WHVF?=
 =?utf-8?B?UzM1OXFiOEdmaHc1aUJ4cTJaRXpFVWUvUXZ6OGdjNWw3VVFJSWN3dnJnMERP?=
 =?utf-8?B?SjFjZUxGQTFzREIrbWswZDlOTmovL2YwSXA5OEhRR05OS1daK3BCUDJqUXYv?=
 =?utf-8?Q?dv22gHbC6W2yJkbx3tjI1PvkNWPyrdKh6K?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3luSjJQNzBaTGdnU25tZnpDY3pkQ2VCYlRsQVFwMFViL1VFWjhVbWRsU1Yw?=
 =?utf-8?B?Z3ZUS3hNQWlyR28xMWl2YzZCY2tvSDVsVEVhRE5TRVg0VEd5aTM3a0Q1bFlQ?=
 =?utf-8?B?dlNueVFFQ3o3N1FyL1R4RXVzdHdQaDc5UU5lc0JRaUZBVGlzaVAreG90bUxO?=
 =?utf-8?B?RzlCb1FWdzVWYVhNWTFuT1lzMWlWckV0Vlh5VXVSbmtwUWwySVh3WVBkNXlS?=
 =?utf-8?B?amQ3RjhpUDVhQjViQkN1N0lXbUV0UDM0TFoyTktDSjV1LzBwUjZiWmlhVkN2?=
 =?utf-8?B?NmRvZ3p0MnlTRU9BaWg4K09ZWWpsOFdHazM3cGhsY0RPU0JxRmNpMWV1M2x5?=
 =?utf-8?B?blFLTnlmRlBFd0hUVU9vUUNKSThGVXRBSDJzRHpaZlc1OU5kWDdCZGx2Z2k3?=
 =?utf-8?B?UFE2Z0hSUitKRWFWdUNxaE5xWVdDYUdyQ0R3SGNlQWhKM2wxV3h0QS9IdS9R?=
 =?utf-8?B?MVhrV1MwcTNFNXdIcUM5YmlHdXpKNjV4OGJWTW5wT3VmbnVmKy85VzFrODAr?=
 =?utf-8?B?UloxSTRLRDZCQXZWTXE2a25Lc1R5MXA0SEw3MkovQnVtd3Fqc0JIbVhIUzQ1?=
 =?utf-8?B?UFZNYjAwKzBOSDE4NFlHK0t2WlVLVE9CTUtsVnRNQ0dJR2NNTEhzdEtIT0wv?=
 =?utf-8?B?QUN5aE1GU0NDR0JVMkI4Mmc0Q01PMldKWnVSOTJZdTkvVjVTWVNDT0hyVUU0?=
 =?utf-8?B?VHllQ0FvNzBPa2ZaZkV5M1NjSEZzZ0QxZHlGNUtIZEd6b1lhSE5LMVlZMjlU?=
 =?utf-8?B?a2hzWmx3U0JBalIvelFaNlUwWkdpcUkvNUdJcEZHVkVVTXdPNS84aDFSam9t?=
 =?utf-8?B?MlFPZzcrNm9zWk05OHlicnYrM0p5dXp2djllaEpDK0pZR0Z5ZkZLZnJWQzZj?=
 =?utf-8?B?TWhGS3N1T2d4Skx4eHN6YVg1UjEvbGdseklZbHpFYkRwRldlei8zRmlSL0dh?=
 =?utf-8?B?U2JGQ3cyYW5ET1hPUXVkanpZekIvMmM3cHAwdWlqa1YwTVh6NzUyby9nN2Fi?=
 =?utf-8?B?dnJpTlRkNWRKYmhSR2IvVjJaa0lmWUFuZHVhSlpHM2RESWZqTldlSWNQa1o1?=
 =?utf-8?B?cnUwQU43YXlNYjRoZG5sUW53a3RrbUtVQ1RXY05DK296WFNaaDdqYjA2YUFN?=
 =?utf-8?B?UWNLaEp2Z1pqakdNZksvQWRsbFkvN0c0NTZ1TVBOcWJydlNKanlKeHcvUlFy?=
 =?utf-8?B?SmN0S1A1c2w5MGxzY2FPcDBHQ0EzWjBYcjc5a2FEL3dwMmtmVDF1cmUrSUd0?=
 =?utf-8?B?Z0l4dGp5cWV6VDhlYXM2MVhwTTlQblhKS1Q3VHBmam9jOEZjclhTcXI4bGN4?=
 =?utf-8?B?bHhoYUEvSnJPTWNiRUp3dEFacGRZOWxNaVdIZk15RytXOTdVVjBteTY3eDVl?=
 =?utf-8?B?QkNZV0IrV0lBSEd4RzloRVdaVWt3WVRnakYxZDdiMlFJMWdBd3FpUzFSRzd0?=
 =?utf-8?B?T2tGcndINDRuWUxmRk9zR0VPOW43eWdIVEcrWEpHS0RzSEJaSFNqWlc5NThK?=
 =?utf-8?B?Q0hJZXN5Ym02TVlWQitrMGVsQ0lMZHZXSE5seitZanBVV0pTTWZrM3hFTU9i?=
 =?utf-8?B?SWNZUHFrTlhZMjBCUkNLcWlsd3JLZjRhNHdFWkV4cjBlQ2twaTAyMXBiOG9o?=
 =?utf-8?B?b3BzaDlxcDNNU2FkV2RZdjlDb3Nsd0FQSzJwbDlWTGdkbEthaWs3Ry9uVXZ4?=
 =?utf-8?B?ZHJ1ZThQS3dIelYyQndzSlIrMDZaYW1iSklwVGt6VkNZR1UwaUdIR05LZFBG?=
 =?utf-8?B?VU9XdENvZGFiRWtvcTh6VXdWamcwUXFvSktiSllNcHlWOVRLUGJ2NUJvb3VW?=
 =?utf-8?B?S2ZSa3IweWxFSFpyMkxxMTR4M2EvNXByN1VveWc2UlV3WHBxUHUvdDBuM1d3?=
 =?utf-8?B?Qk5KZm5ST3NCNExPTXlGTGFWQ2Q2STBlR0hkR0ZTaVVVamc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19803b2-6a74-48bd-0773-08dedde7338e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:23:41.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5830
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118079-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:email,outlook.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,SN7PR19MB6736.namprd19.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 621CA73437D

On 7/9/26 22:16, Konrad Dybcio wrote:
> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> index 6f8004a22a1f..8c252fa3ff5b 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>  			reg = <0x01937000 0x21000>;
>>  		};
>>  
>> +		bluetooth: bluetooth@7000000 {
>> +			compatible = "qcom,ipq5018-bt";
>> +			reg = <0x07000000 0x58000>;
>> +
>> +			firmware-name = "qca/bt_fw_patch.mbn";
>> +
>> +			clocks = <&gcc GCC_BTSS_LPO_CLK>;
>> +			clock-names = "lpo";
>> +			resets = <&gcc GCC_BTSS_BCR>;
>> +
>> +			qcom,ipc = <&apcs_glb 8 23>;
>> +			interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
>> +
>> +			status = "disabled";
> 
> Since the firmware is unsigned, I think it could make sense to
> enable this by default
> 
> any which way

I've found that the controller is not wired up on all ipq5018 boards.
For ex. Linksys router boards have it enabled and wired up by default
while you can enable the controller on some Xiaomi and Gl.Inet boards
but the controller isn't connected to anything.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

George

