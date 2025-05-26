Return-Path: <linux-arm-msm+bounces-59395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A9AC3BA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4E021895B7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13211E1E1E;
	Mon, 26 May 2025 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KD7cNZ/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC141C64;
	Mon, 26 May 2025 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247980; cv=fail; b=XbZUeCKbaxHlekiGMMV5X1KhqgLMnPyyKZTfWKvdo09776y7/CoIZe5ICTkZWqjL2aFrqtqbdhg+KZZWmNDjq8ucwfVWlVfbzZyIbIQa++ZUjBWQu91ssSgstbiM14XTUUHymeQdnuTrfJf8cWPd9h7X9n8y2NsWyVutD8Yk288=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247980; c=relaxed/simple;
	bh=dqw7O4P07SNmemNVkTw1Jw5LGkISh3Qz3sh+R0Rjmvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ec1SAzzt7JRGMDMnwtlIVOihPABpUAIsewHDodbWHHoMUKtu8YWEOUSStW56qlDGimyap0HeJ/J0k25JMvfH2tzUNV74pm8BWJnHtjiLiHtCxtQuq4s9AYf3moBc5ehcrqHvgKHTIxmTfpZlMhk2aJK6ah1FoRDMevXaweZDy0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KD7cNZ/n; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNJh0p029342;
	Mon, 26 May 2025 08:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqw7O4P07SNmemNVkTw1Jw5LGkISh3Qz3sh+R0Rjmvg=; b=KD7cNZ/nRfwvufjM
	eEcG3HjnXLjGddmXbSo7FhYbKnHfKe/iIgfAl8c0EluaV+Hg/fVfti8O0sh0F3nC
	jt/oKBcu3mBB9IgobJ/2ruMsfeb2HgpYr8rboxQoUPmIKKfrmuGzrTjSys+1HEGm
	oXKcqBnSY+G0KVRS4/TqiDhDeMizCDVUF8nBoUbMZaxJYUXmeuMmfqvE5JXVui6w
	PI2eKv9StBRKo68fnjueWDqgw/TX07mf+6CvsJDMJwud0Xn8/qAUKltWr7ydjoHc
	mgXSzfB5bx/QvcCVCwVy/8wMMwtzedJE993ZgWfDkeN0hAaipR4zFFW95EwFcpFp
	YdGdLw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012036.outbound.protection.outlook.com [40.93.1.36])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq3qe5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 08:26:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8bN4snkTVm+hYxxftMzUYhAVjEbLey8CYSGLNmckXBr9AAjXjFJ3tlqlKP7nzjIaMMhuydQw1QFu3P9Qm+4PHVvsW1pBIE4+wpVvzV+PTWLHuxHmx3LRGwyg7W2Rf+vDvCsTeFQHpAHiT4/TNNaGAsHAQlwXeU/B1YynW6evFtC1JFPBKvsfw6ynvDWex+AAB2No1G6VzIRWv1U7jngsSbfyR6MCXPdix7ENaIjz2+2LfmUIjuBftwgOFce+G+IrvxocQrjfSJshjFBU3Z0dAEkHX18RiDEnDtuwx0oBlYyh8L3UBPHEvHE+Sja4l2mgTxjh79tBOtSk3iTc7Xqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqw7O4P07SNmemNVkTw1Jw5LGkISh3Qz3sh+R0Rjmvg=;
 b=VD1YI6vpVID05l1KYqxDPZREujIa+JRqAdb7+0jZKV58NBvh/MMfjDc4Bo9I++SeEIDQYcMyTXDnPMoTTWuEjJzVqeyb5H4dicTdcEsIpzMlS+o9vnqCg//XPNFCbeaXEeNDw4zLcYrKYm8yVFT5w/if1ICv+XmAALi068YEtzMGaVMHHJQ2gvMBpa8eCbJG1f7wFjM/4WCLkmAe9es0/F+hH3XUuy8FhxV6agUBzQkLxv260LeoM4CSS+B50LNSPhw9j6fQfUt97sAj3SrmeX2yxsFW+mF764PdksJhIAeGgZh+Z9JuxOYvtyp9ItBGqCuBaQdGLTxc6UtwsgFFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DM8PR02MB7878.namprd02.prod.outlook.com (2603:10b6:8:21::16) by
 SJ2PR02MB9654.namprd02.prod.outlook.com (2603:10b6:a03:536::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 08:26:10 +0000
Received: from DM8PR02MB7878.namprd02.prod.outlook.com
 ([fe80::1aef:b0de:4b77:426c]) by DM8PR02MB7878.namprd02.prod.outlook.com
 ([fe80::1aef:b0de:4b77:426c%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 08:26:10 +0000
From: Sarthak Garg <sartgarg@qti.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        "Sarthak Garg (QUIC)"
	<quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Can Guo
 (QUIC)" <quic_cang@quicinc.com>,
        "Bao D. Nguyen (QUIC)"
	<quic_nguyenb@quicinc.com>,
        "Ram Prakash Gupta (QUIC)"
	<quic_rampraka@quicinc.com>,
        "Pradeep Pragallapati (QUIC)"
	<quic_pragalla@quicinc.com>,
        "Sayali Lokhande (QUIC)"
	<quic_sayalil@quicinc.com>,
        "Nitin Rawat (QUIC)" <quic_nitirawa@quicinc.com>,
        "Sachin Gupta (QUIC)" <quic_sachgupt@quicinc.com>,
        "Bhaskar Valaboju (QUIC)"
	<quic_bhaskarv@quicinc.com>,
        "Naveen Kumar Goud Arepalli (QUIC)"
	<quic_narepall@quicinc.com>,
        kernel <kernel@quicinc.com>
Subject: RE: [PATCH V1] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
Thread-Topic: [PATCH V1] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
Thread-Index: AQHbL2YQpPwUL9XXQ06vwAorxuwAsbKxw9CAgTQH2EA=
Date: Mon, 26 May 2025 08:26:10 +0000
Message-ID:
 <DM8PR02MB78787D61019A2056D7843DF2F565A@DM8PR02MB7878.namprd02.prod.outlook.com>
References: <20241105093513.16800-1-quic_sartgarg@quicinc.com>
 <48df0005-34d1-4bac-9517-16dc6018aa85@intel.com>
In-Reply-To: <48df0005-34d1-4bac-9517-16dc6018aa85@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB7878:EE_|SJ2PR02MB9654:EE_
x-ms-office365-filtering-correlation-id: 9e222b9d-18d5-4ffd-d06a-08dd9c2ef836
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1dtcExWNHZDZW5hQzBnY1QyK2ZnU0RxYmpTR3JQV1JLbUEvQXNtcDJ4UkFy?=
 =?utf-8?B?WmsxdGZuUCs3bHRCN3hodUVGK2RtNlBUNG5nU2VjdUQyNURhYkRPc2dmZmsw?=
 =?utf-8?B?Z0N0bG5JYml4SHc3by9BblFKREQxekdoSlZsQmVlK0pKcnVKbjRiTTROdU02?=
 =?utf-8?B?T3NQcDcycFZTOVB3OFhqS2hQWm4vN0RKaVQvWUxCZnN6WXg4Snc2RWVONXhy?=
 =?utf-8?B?RS9QS05rVU8zeHdjYStWSm1jZlh2ZFl4MTk2L0ZFQ1oxeDVBdmhsTEdwTWYz?=
 =?utf-8?B?VnQ2eTFqWXhXWitFMTlOeXhHdWlwU3NKQ2FnNStzWGZMTHpWQ3RHZUJPSytJ?=
 =?utf-8?B?NFRXZXJsZ2U0Vm5jRmVrWUhrc1k4MW9kbDlTTWFwQTZPd2pLMHlXK2huUXdG?=
 =?utf-8?B?VzZYb3VRdHh6WUVOazE4dnRQdE9NT0pnUGdBL3BGMUptN3FXTUd5QUZjZGlY?=
 =?utf-8?B?aVhxUHlSZ1llZWxrdmpmVE5abkpMV0lTSzUyT1hRMzdTZjIrRkxWYU9FWHhs?=
 =?utf-8?B?UkEyOWtrOCtXSGNwOGJPZTRvdExTb0hRM3NJVGo3elBtbk1ReW9vRUpMYTkz?=
 =?utf-8?B?Q0l4dlY4VVVKamF0NTFuZ1VrcGQrOTBPc3YxMlV3aVhYcmFYa2pOS1d2UWxq?=
 =?utf-8?B?ekZXZ2Zjak5KYWZJbjhQaUUrSWlmaHlUK3FwblZFK1VYV3ozNVRJcGJoU2Nm?=
 =?utf-8?B?aVJSVXBDWWdZUVREbDhaMWRWbFVtbWpoLzZCeTRONm5XQkZDNk9EcEhHbk8r?=
 =?utf-8?B?MWJZZHFDbkUvSE5ndTg5UFZqcmY4VmtJWmhkaGZ1czVTTUYwNjlETTJLZW1S?=
 =?utf-8?B?S2V1K2VORktwOW01Q0NoMEVvV0hCNXdBcUpyWm1WNDZkM2htUmdHNHhuRHFQ?=
 =?utf-8?B?M0Q5TTNoeGw5NGVQNEhWYkpHdThUaGk3dFJKQ0I2SWtqRG9lcjFJUzN1YjVR?=
 =?utf-8?B?VlV6emNKeGRmT1pQdTh3aGNjSkZQQWE5c1hpT1RRLy9JWm1xSzlRcXFQM0pu?=
 =?utf-8?B?NjRhTUpubTQ0UkxaT0M4MU1XU0FOMEVYNFhYV3BRQnI2aStLQWt5eitqd1FR?=
 =?utf-8?B?VnVvL3N3N0FkN1J3UXRTOS9hSVB2MU5VRWlrYlhsdC9rZWNBTkUySHpIOHZV?=
 =?utf-8?B?ZFkwYzA0UE5jeldUdEUraGs3ejJtSXdSTGNLa3E5M0ltd3FGR1NtY2FyR0kz?=
 =?utf-8?B?L0RRQXNvd1BraWhXdWdoWEUwKzYwOHN3R1dSb2VMUFNGMjZQOE9TVXh2TEdO?=
 =?utf-8?B?ZU84V3dqZGI5bHlDUGFUcFljaERFN0VTQTdTTGd2VkN5US9KWEZsOXhHUVFZ?=
 =?utf-8?B?a2xVMjg2eXBteFBFWU1pTVR2NWJqTlZXL1E3T1FPelBtc0RqNXdOd0hsTnM0?=
 =?utf-8?B?eGkvaEFSbmVZRkR1aTN4NWdFREszZHpYc3RsQzFGaktYalRvK0s0SXNiY1JF?=
 =?utf-8?B?WlNJa0hieXZaUFYyaGppb09FWEdudmtZMjdTSEsrektnUUhrcXhjdGxQWlgz?=
 =?utf-8?B?ZUd0YWg1dEJiMytsWVZTcmdjRFVQK3NLeFF5ZjlLU0ZSUXhyZU9LNFVYK1RB?=
 =?utf-8?B?NGU0dXZJUWN1VjNiL2NYUnZ6dUFsUWU0azNaZEorUkVyc013bjQ5RDdCWkNF?=
 =?utf-8?B?TTNKYXV1UjRjTUpUMmNKaVZudElCMkN1U2o2MGFFVmNzTHB3Z3VZRmphVkg2?=
 =?utf-8?B?RFhPNi95SXNWaEtJK2xUU2VsZ3h0MmtuUjVicXV5akNMYm0rYVRCVUlIOFNo?=
 =?utf-8?B?SThCd04rdDNVbk5WOTkyaGt4NXVBUy80WklsZVBMNlhEc1lnNWNvUUFoNXJQ?=
 =?utf-8?B?RE0wdWpDRGhDZHVuZlczYmxIb1Vwd1l6bzVZTTRobERReTloMjh5OEZBUlhi?=
 =?utf-8?B?bWRXNnJPWlJzVWRsRWZvVmwrRFR0Nm1NZElaSWFBWmNNTUxPSmZwRG9GK29G?=
 =?utf-8?B?aFJKeURnZXlLMlpuZmpCd0ZCYmFHekt4L3gvRmQ1YnRSQlErQW1BVUVNRzhR?=
 =?utf-8?Q?nPcm8gj3eDL+brM6sob0i2n10tgxtI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB7878.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHVkK1JSaEI5YS9kSUtnODh6b0Z3Qmx0VmdzR3hZQUo2M1VHL0svSGtkZExj?=
 =?utf-8?B?VSszSnBtZXRBWktwN2pTRFdWRllsSEdVNkpQMTJ4UjF1MVY0NzdJNmI2cFpu?=
 =?utf-8?B?UWhxc1hXblFmMFNDQTI5czg5akRicUdwMHU3S0x3SlFnQy84cXFjUFBsbXEx?=
 =?utf-8?B?elhrbjQ5bGtqbndkVkk1VzlDSVo0c0ROQ0VKalJZd21wRko2RU9hSE1ocEFP?=
 =?utf-8?B?V2ZsdDRBSXpTODN5TTl1clZMdGkxUE1DZVBpS3Y2c3J0RlA0aGhrbTBoUm1J?=
 =?utf-8?B?Z00wRGxlUEdCcGJhNnBkOEpPekt0VWtHRnhNU1o5MGtuNytrclBnNmdTTTc4?=
 =?utf-8?B?UVdTUmNkOW5FS0xJUGlWM1c3T0xrRzhSVngxNGJmNjBMaWRLUmVlenI5azNt?=
 =?utf-8?B?QlRSWVIvSGtwWmxwQVZGK2R6d3NRQzJta00wayt5bm1GVFUvNHZyUHI0akFy?=
 =?utf-8?B?Rkw2bWF2RDYrQWlmWmxXR0JWeG9oeDhWT1l3VDRUMFdWQzJaZzNrazBCaU9K?=
 =?utf-8?B?MXVpSExwVEJXN0IyTGhxYzZTMllIUUtidldGclVPbTlvUFlCNm91OUpoVUc3?=
 =?utf-8?B?RXZRV3pFdTA5eG80M0hyM05NZ0Q1VXQzRG9lQWpqYTZwQjlIVmNyOE9tcFU2?=
 =?utf-8?B?NjZLODgzRm03dm5aZUhaMkZ0SWhHNzllZVBDb004dEZmMng3bDE2YTZBeU92?=
 =?utf-8?B?TnZYUXV2ODhJMjlKSTVxQk9EM0JHbEp0aFN2M053WmFMbU9pVUZrQ1B3SjJ6?=
 =?utf-8?B?WGl0V0t6cHZWMnRkZzRGY25NN1VURDU0L3BoYjhNaEhUMXJETVdvYytzcThO?=
 =?utf-8?B?cVFROUdtdlJaUXpTK1JDSGt5S0xYbDBBa2h4UWxXWXRuMDYvRTJ0NTVXWHRW?=
 =?utf-8?B?L1FnVW5FbDdxU3pOczc4ZExyWGxNZ1ZzemxLYzhkTTZuVHNrZ2tpN0lrUDk5?=
 =?utf-8?B?Q1FWQUt6UHJ1TVBod3d0WHdsSTFza0JNS2RXbEdSbjBIODliY1FMOFd1YlJO?=
 =?utf-8?B?QWt5M2h4M2VuSk8rbExMa0wxczVsSFRZV2JrM1I3NmsrbVZ0T0kvcFdiL2dw?=
 =?utf-8?B?cTRMWG13Y2U0N204MmE1azZrc0thcUlQZWVSTnRNZGZlWE4zWmJaNmlzeWVU?=
 =?utf-8?B?b05GZ1BmQ2k3eW5qMjQxWE13aFQrQXhOdXNqMG9WM2JvRWo0K3FlTDdxZ3F5?=
 =?utf-8?B?Z1JmVEVWVk5KMk1yVFAzMGhFZHpzM0FDeWxVd0p0Z0Z2MmliNjRzaHJiWk52?=
 =?utf-8?B?Q1JzS3lrak5VTEpqZUdWekVWTGRmSUdSamtlMFdKK3lmVWN1S2dSeExrVnp3?=
 =?utf-8?B?M1B3S1dQZVI4UVhLNE8rWFhtMUZhZExYZFFrV3JvSko0WEZPOVFBM0h0SWNK?=
 =?utf-8?B?cjBSUzgybU1TS2tiVlJmRUxRTDlsd0c4RWMvUHRoVk9wM1RCaXVhRjhsTG1y?=
 =?utf-8?B?Q3RrQk5FSzkwb3ZhRFM5SktpZGdRVWhVN0RGUDY3VnZ3MmxrNHMvR0dDVWxB?=
 =?utf-8?B?RWZtbWprZnIvOUtmdFQ3NDdtWDRicUNJOHFFZGkySXdYWlJaSzdYZGhwcytu?=
 =?utf-8?B?Vk1reUhYdjhKQmRQcDZwUm81Nk0rcWpMckkzZFdCMytoaEk4K3JTRjlnSnRJ?=
 =?utf-8?B?eWhCSVEzZzFCNzFkR2gwdXJNWjhkL1FkYTNweVlyYUdRdlByOTh6Z1dDQ1FY?=
 =?utf-8?B?K1pMUFZrWGQwSHFieUZUYUFaa1hkbCs2OTF6MWN2bzVRV2dxM2dOakloc2hk?=
 =?utf-8?B?MmlwZGJ2SjdwM2F2SG1VMWcrd1N3dEM2OXpzQlRNS21aa2h3NXFrRjc3c3BV?=
 =?utf-8?B?Y2I1aGNCNzQ4QWtEcU5lckxvU000NUtxeHVFSkFobk5GamxsOUdvWDlVdzlY?=
 =?utf-8?B?WHMrbWF4dS9IUStHT0grc2xhcmpBZVM3aFlPT0xhdjR1VTBIL0UwVHFodytZ?=
 =?utf-8?B?TTY3MzF2Ri9vdVorbFAzSEdVOVZBNFhwUjJ6UER4UE1IY3R1OGZnZExTM1Q4?=
 =?utf-8?B?MnNUZjZNM3lqS3FyRkJjNG9zUlp6VkQzdFQ2aThSbmZNY3pFTEFaTUVyMHY5?=
 =?utf-8?B?V0FEeG0wY1hTMGUvdzNvQjRNLzk0L3FWMFNNa2kydlFoZDNjUkVZVjh0ODhZ?=
 =?utf-8?Q?XEW/5VGJP3dqLluuWpUfQwCgk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mWamKz1+nWlqXfRJ/YZ4HonweI+Wc2IKjkBGKcQpp3cymX5yLiNm1xnpzbfO73XKReGx8kMbVtCKvuJ2jRI0Gt6jU2rK24rZiIMYygUT8C1XvTB8gGu4c77fVQLGAImNUrNA3ONqRuPTQE/DPq0i8JTRLc6HoGAJky4rMWhzMpi7GNMs747Db1ggw+XVpEoj8734GbxI0nB6CveNoRsXlvSO9BHbJ1wasDZ4+ye5D9UPjj37lQ7vWNMvZsifEnp1sJkn4UGZgCpIWQR/fbDvL6pQDMbeuxMhQfgVLk2annH4srkox7z5diVmzrpnYmfoMAqfvUZV2UjuDvWR+864qaI1jI5E9K+PvuOzX4wTVAgNxCwGT5Qjv0KnLIoHzox2apYp08JTF96DBxm1+wokaGaZWd3+4zjQGJohBOAVIexSz7nnL6ZBmyLEwTbug/1KJGs3tvGBR5JLbm6gtXjQdS7v12v/GI/egdiW6IDrw/uIa+od7TJaJnv0huUvvIMcQUa0bMuUZNJzzR+i5Dt28xcpRJoskRFxCbjjovm2Ee1GxCMLX5NLpCf8/OWeIXAvOgf6QJHWLKZXmtQ6VgPN+6CnfhgfuccfFQZJeifWSQUcmTkyMZwTrpRSWs4azhzB
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB7878.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e222b9d-18d5-4ffd-d06a-08dd9c2ef836
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 08:26:10.2866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tLTMh3JJMsv3iqTueDC/n1wDFQlmYfxqOxHkVwBCEbIV3OMoAMkm9H7YQknXcTnu9m/wufsR2mjcS2JVM7snv5/J1f/x7bA3nHyXL3afD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB9654
X-Proofpoint-GUID: k17r5sCoyKfck4EBkv09WyvtRED4zzv7
X-Proofpoint-ORIG-GUID: k17r5sCoyKfck4EBkv09WyvtRED4zzv7
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683425a7 cx=c_pps
 a=eoA+jwG2N97X2eoE7Om4vA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QyXUC8HyAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=7nK0qm2U5Gb7l-Suu80A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA3MCBTYWx0ZWRfX3VM4XK9eo5TK
 ElwFfUnAtVCLmOh0RXX0aAkYPE++GuG6usUWA/uFdYaECNfLx4m1gInJEj7FzrLHlFAKRtBkhvL
 D8dfCHBg9kFn/jVPeKvyjuTQs0vGq6rNhPARcruGjdvwYPhIePZHIkVYoQ5uEULHRrXhNLkojrr
 JFvaORVGkcw05JKVW6VsmWZJUAGkp5nqX5KMm74SZCDKcTbsupBpgooXYl0Ixp41WTS4k4En+ID
 ChZ/r753AiPwx7SIkyfdRZQVFXEdKyGUdIr+yIBv76GdslMw84xJt9aGsgO3dovsuh8UhBfrku3
 wUuwGvkY2D7/tmVSLr1Uoiw81snYIaHjEH8BhoeEC1Tv0uSPbX7Y+SUFli54XIP6UhODEJRQ2MR
 k2CRWoI22YrNZHpIfDGTfCzD2PnLT1Hbt05tbP1B+trR3pY9XrBWIaGA7tr7BkLIEH+b2fhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260070

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWRyaWFuIEh1bnRlciA8
YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTEsIDIw
MjQgMTo0MSBQTQ0KPiBUbzogU2FydGhhayBHYXJnIChRVUlDKSA8cXVpY19zYXJ0Z2FyZ0BxdWlj
aW5jLmNvbT47IFVsZiBIYW5zc29uDQo+IDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPg0KPiBDYzog
bGludXgtbW1jQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBDYW4gR3VvIChRVUlDKSA8cXVpY19j
YW5nQHF1aWNpbmMuY29tPjsgQmFvIEQuDQo+IE5ndXllbiAoUVVJQykgPHF1aWNfbmd1eWVuYkBx
dWljaW5jLmNvbT47IFJhbSBQcmFrYXNoIEd1cHRhIChRVUlDKQ0KPiA8cXVpY19yYW1wcmFrYUBx
dWljaW5jLmNvbT47IFByYWRlZXAgUHJhZ2FsbGFwYXRpIChRVUlDKQ0KPiA8cXVpY19wcmFnYWxs
YUBxdWljaW5jLmNvbT47IFNheWFsaSBMb2toYW5kZSAoUVVJQykNCj4gPHF1aWNfc2F5YWxpbEBx
dWljaW5jLmNvbT47IE5pdGluIFJhd2F0IChRVUlDKQ0KPiA8cXVpY19uaXRpcmF3YUBxdWljaW5j
LmNvbT47IFNhY2hpbiBHdXB0YSAoUVVJQykNCj4gPHF1aWNfc2FjaGd1cHRAcXVpY2luYy5jb20+
OyBCaGFza2FyIFZhbGFib2p1IChRVUlDKQ0KPiA8cXVpY19iaGFza2FydkBxdWljaW5jLmNvbT47
IE5hdmVlbiBLdW1hciBHb3VkIEFyZXBhbGxpIChRVUlDKQ0KPiA8cXVpY19uYXJlcGFsbEBxdWlj
aW5jLmNvbT47IGtlcm5lbCA8a2VybmVsQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIFYxXSBtbWM6IHNkaGNpLW1zbTogRW5zdXJlIFNEIGNhcmQgcG93ZXIgaXNuJ3QgT04NCj4g
d2hlbiBjYXJkIHJlbW92ZWQNCj4gDQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBm
cm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBv
ciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24gNS8xMS8y
NCAxMTozNSwgU2FydGhhayBHYXJnIHdyb3RlOg0KPiA+IE1ha2Ugc3VyZSBTRCBjYXJkIHBvd2Vy
IGlzIG5vdCBlbmFibGVkIHdoZW4gdGhlIGNhcmQgaXMgYmVpbmcgcmVtb3ZlZC4NCj4gPiBPbiBt
dWx0aS1jYXJkIHRyYXkgZGVzaWducywgdGhlIHNhbWUgY2FyZC10cmF5IHdvdWxkIGJlIHVzZWQg
Zm9yIFNEDQo+ID4gY2FyZCBhbmQgU0lNIGNhcmRzLiBJZiBTRCBjYXJkIGlzIHBsYWNlZCBhdCB0
aGUgb3V0ZXJtb3N0IGxvY2F0aW9uIGluDQo+ID4gdGhlIHRyYXksIHRoZW4gU0lNIGNhcmQgbWF5
IGNvbWUgaW4gY29udGFjdCB3aXRoIFNEIGNhcmQgcG93ZXItIHN1cHBseQ0KPiA+IHdoaWxlIHJl
bW92aW5nIHRoZSB0cmF5LiBJdCBtYXkgcmVzdWx0IGluIFNJTSBkYW1hZ2UuDQo+ID4gU28gaW4g
c2RoY2lfbXNtX2hhbmRsZV9wd3JfaXJxIHdlIHNraXAgdGhlIEJVU19PTiByZXF1ZXN0IHdoZW4g
dGhlDQo+IFNEDQo+ID4gY2FyZCBpcyByZW1vdmVkIHRvIGJlIGluIGNvbnNpc3RlbnQgd2l0aCB0
aGUgTUdQSSBoYXJkd2FyZSBmaXggdG8NCj4gPiBwcmV2ZW50IGFueSBkYW1hZ2UgdG8gdGhlIFNJ
TSBjYXJkIGluIGNhc2Ugb2YgbXVsdC1jYXJkIHRyYXkgZGVzaWducy4NCj4gPiBCdXQgd2UgbmVl
ZCB0byBoYXZlIGEgc2ltaWxhciBjaGVjayBpbiBzZGhjaV9tc21fY2hlY2tfcG93ZXJfc3RhdHVz
IHRvDQo+ID4gYmUgaW4gY29uc2lzdGVudCB3aXRoIHRoZSBzZGhjaV9tc21faGFuZGxlX3B3cl9p
cnEgZnVuY3Rpb24uDQo+ID4gQWxzbyByZXNldCBob3N0LT5wd3IgYW5kIFBPV0VSX0NPTlRST0wg
cmVnaXN0ZXIgYWNjb3JkaW5nbHkgc2luY2Ugd2UNCj4gPiBhcmUgbm90IHR1cm5pbmcgT04gdGhl
IHBvd2VyIGFjdHVhbGx5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FydGhhayBHYXJnIDxx
dWljX3NhcnRnYXJnQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21tYy9ob3N0
L3NkaGNpLW1zbS5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1tc20uYw0KPiA+IGIvZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1tc20uYyBpbmRleCBlMDAyMDg1MzViZDEuLjQ0MzUyNmM1NjE5NA0KPiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jDQo+ID4gKysrIGIvZHJpdmVycy9t
bWMvaG9zdC9zZGhjaS1tc20uYw0KPiA+IEBAIC0xNTE2LDEwICsxNTE2LDExIEBAIHN0YXRpYyB2
b2lkDQo+ID4gc2RoY2lfbXNtX2NoZWNrX3Bvd2VyX3N0YXR1cyhzdHJ1Y3Qgc2RoY2lfaG9zdCAq
aG9zdCwgdTMyIHJlcV90eXBlKSAgew0KPiA+ICAgICAgIHN0cnVjdCBzZGhjaV9wbHRmbV9ob3N0
ICpwbHRmbV9ob3N0ID0gc2RoY2lfcHJpdihob3N0KTsNCj4gPiAgICAgICBzdHJ1Y3Qgc2RoY2lf
bXNtX2hvc3QgKm1zbV9ob3N0ID0gc2RoY2lfcGx0Zm1fcHJpdihwbHRmbV9ob3N0KTsNCj4gPiAt
ICAgICBib29sIGRvbmUgPSBmYWxzZTsNCj4gPiAtICAgICB1MzIgdmFsID0gU1dJVENIQUJMRV9T
SUdOQUxJTkdfVk9MVEFHRTsNCj4gPiAgICAgICBjb25zdCBzdHJ1Y3Qgc2RoY2lfbXNtX29mZnNl
dCAqbXNtX29mZnNldCA9DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtc21faG9zdC0+b2Zmc2V0Ow0KPiA+ICsgICAgIHN0cnVjdCBtbWNfaG9zdCAqbW1jID0gaG9z
dC0+bW1jOw0KPiA+ICsgICAgIGJvb2wgZG9uZSA9IGZhbHNlOw0KPiA+ICsgICAgIHUzMiB2YWwg
PSBTV0lUQ0hBQkxFX1NJR05BTElOR19WT0xUQUdFOw0KPiANCj4gUGxlYXNlIGRvbid0IG1ha2Ug
dW5yZWxhdGVkIGNoYW5nZXMuICBUaGUgYWJvdmUgMiBsaW5lcyBoYXZlIG5vdCBjaGFuZ2VkDQo+
IGFuZCBzaG91bGQgc3RheSB3aGVyZSB0aGV5IGFyZS4gIElmIHlvdSBmZWVsIHRoZSBuZWVkIHRv
IG1ha2UgY29zbWV0aWMNCj4gY2hhbmdlcywgbWFrZSBhIHNlcGFyYXRlIHBhdGNoLg0KPiANCg0K
UmV2aXZpbmcgdGhpcyBhcyBiYWNrIGZyb20gYnJlYWsuDQpTdXJlIHdpbGwgdGFrZSBjYXJlLg0K
DQo+ID4NCj4gPiAgICAgICBwcl9kZWJ1ZygiJXM6ICVzOiByZXF1ZXN0ICVkIGN1cnJfcHdyX3N0
YXRlICV4IGN1cnJfaW9fbGV2ZWwgJXhcbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1t
Y19ob3N0bmFtZShob3N0LT5tbWMpLCBfX2Z1bmNfXywgcmVxX3R5cGUsIEBADQo+ID4gLTE1NzMs
NiArMTU3NCwxMyBAQCBzdGF0aWMgdm9pZCBzZGhjaV9tc21fY2hlY2tfcG93ZXJfc3RhdHVzKHN0
cnVjdA0KPiBzZGhjaV9ob3N0ICpob3N0LCB1MzIgcmVxX3R5cGUpDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIlczogcHdyX2lycSBmb3IgcmVxOiAoJWQpIHRpbWVkIG91dFxu
IiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW1jX2hvc3RuYW1lKGhvc3Qt
Pm1tYyksIHJlcV90eXBlKTsNCj4gPiAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIGlmIChtbWMt
PmNhcmQgJiYgbW1jLT5vcHMgJiYgbW1jLT5vcHMtPmdldF9jZCAmJg0KPiA+ICsgICAgICAgICAg
ICAgIW1tYy0+b3BzLT5nZXRfY2QobW1jKSAmJiAocmVxX3R5cGUgJiBSRVFfQlVTX09OKSkgew0K
PiANCj4gSXQgd291bGQgYmUgdGlkaWVyIHRvIGhhdmUgYSBzZXBhcmF0ZSBmbiBmb3IgY2FsbGlu
ZyBnZXRfY2QoKSBlLmcuDQo+IA0KPiBzdGF0aWMgaW50IGdldF9jZChzdHJ1Y3Qgc2RoY2lfaG9z
dCAqaG9zdCkgew0KPiAgICAgICAgIHN0cnVjdCBtbWNfaG9zdCAqbW1jID0gaG9zdC0+bW1jOw0K
PiANCj4gICAgICAgICByZXR1cm4gbW1jLT5jYXJkICYmIG1tYy0+b3BzICYmIG1tYy0+b3BzLT5n
ZXRfY2QgPyBtbWMtPm9wcy0NCj4gPmdldF9jZChtbWMpIDogMDsgfQ0KPiANCj4gYW5kIHB1dCB0
aGUgb3RoZXIgY2hlY2sgZmlyc3QgdG8gYXZvaWQgY2FsbGluZyAtPmdldF9jZCgpIGZvciBubyBy
ZWFzb246DQo+IA0KPiAgICAgICAgIGlmICgocmVxX3R5cGUgJiBSRVFfQlVTX09OKSAmJiAhZ2V0
X2NkKGhvc3QpKSB7DQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gDQo+IA0KDQpTdXJlIGxvb2tz
IG1vcmUgY2xlYW5lci4NCg0KPiA+ICsgICAgICAgICAgICAgc2RoY2lfd3JpdGViKGhvc3QsIDAs
IFNESENJX1BPV0VSX0NPTlRST0wpOw0KPiA+ICsgICAgICAgICAgICAgaG9zdC0+cHdyID0gMDsN
Cj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICAgICAgIHByX2RlYnVnKCIlczogJXM6IHJlcXVlc3Qg
JWQgZG9uZVxuIiwgbW1jX2hvc3RuYW1lKGhvc3QtPm1tYyksDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCByZXFfdHlwZSk7ICB9IEBAIC0xNjMxLDYgKzE2MzksMTQgQEANCj4g
PiBzdGF0aWMgdm9pZCBzZGhjaV9tc21faGFuZGxlX3B3cl9pcnEoc3RydWN0IHNkaGNpX2hvc3Qg
Kmhvc3QsIGludCBpcnEpDQo+ID4gICAgICAgICAgICAgICB1ZGVsYXkoMTApOw0KPiA+ICAgICAg
IH0NCj4gPg0KPiA+ICsgICAgIGlmIChtbWMtPmNhcmQgJiYgbW1jLT5vcHMgJiYgbW1jLT5vcHMt
PmdldF9jZCAmJg0KPiA+ICsgICAgICAgICAgICAgIW1tYy0+b3BzLT5nZXRfY2QobW1jKSAmJiBp
cnFfc3RhdHVzICYNCj4gPiArIENPUkVfUFdSQ1RMX0JVU19PTikgew0KPiANCj4gSWYgdGhlIGNh
cmQgaXMgYmVpbmcgcmVtb3ZlZCwgaG93IGRvIHlvdSBrbm93IG1tYy0+b3BzIHdvbid0IGRpc2Fw
cGVhcg0KPiB1bmRlciB5b3U/ICBZb3UgbmVlZCBSRUFEX09OQ0Ugb3RoZXJ3aXNlIGUuZy4NCj4g
DQo+ICAgICAgICAgY29uc3Qgc3RydWN0IG1tY19ob3N0X29wcyAqbW1jX29wcyA9IFJFQURfT05D
RShtbWMtPm9wcyk7DQo+IA0KPiBzbyBsaWtlOg0KPiANCj4gc3RhdGljIGludCBnZXRfY2Qoc3Ry
dWN0IHNkaGNpX2hvc3QgKmhvc3QpIHsNCj4gICAgICAgICBzdHJ1Y3QgbW1jX2hvc3QgKm1tYyA9
IGhvc3QtPm1tYzsNCj4gICAgICAgICBjb25zdCBzdHJ1Y3QgbW1jX2hvc3Rfb3BzICptbWNfb3Bz
ID0gUkVBRF9PTkNFKG1tYy0+b3BzKTsNCj4gDQo+ICAgICAgICAgcmV0dXJuIG1tYy0+Y2FyZCAm
JiBtbWNfb3BzICYmIG1tY19vcHMtPmdldF9jZCA/IG1tY19vcHMtDQo+ID5nZXRfY2QobW1jKSA6
IDA7IH0NCj4gDQo+IA0KPiBBbmQgYWdhaW4sIHB1dCB0aGUgb3RoZXIgY2hlY2sgZmlyc3QgZS5n
Lg0KPiANCj4gICAgICAgICBpZiAoKGlycV9zdGF0dXMgJiBDT1JFX1BXUkNUTF9CVVNfT04pICYm
ICFnZXRfY2QoaG9zdCkpIHsNCj4gICAgICAgICAgICAgICAgIC4uLg0KPiANCj4gDQoNClRoYW5r
cyBmb3IgcG9pbnRpbmcgdGhpcyB3aWxsIGNvcnJlY3QgaW4gVjIuDQoNCj4gPiArICAgICAgICAg
ICAgIGlycV9hY2sgPSBDT1JFX1BXUkNUTF9CVVNfRkFJTDsNCj4gPiArICAgICAgICAgICAgIG1z
bV9ob3N0X3dyaXRlbChtc21faG9zdCwgaXJxX2FjaywgaG9zdCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtc21fb2Zmc2V0LT5jb3JlX3B3cmN0bF9jdGwpOw0KPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gICAgICAgLyogSGFuZGxl
IEJVUyBPTi9PRkYqLw0KPiA+ICAgICAgIGlmIChpcnFfc3RhdHVzICYgQ09SRV9QV1JDVExfQlVT
X09OKSB7DQo+ID4gICAgICAgICAgICAgICBwd3Jfc3RhdGUgPSBSRVFfQlVTX09OOw0KDQo=

