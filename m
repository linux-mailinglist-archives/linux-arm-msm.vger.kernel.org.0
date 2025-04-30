Return-Path: <linux-arm-msm+bounces-56192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5AAA4208
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 06:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C5B9C01D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 04:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6551D1D86D6;
	Wed, 30 Apr 2025 04:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VXw5FMcS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3F10F1;
	Wed, 30 Apr 2025 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745988851; cv=none; b=dZkTcM52slmG7gVegGnH0OrA+eEL3lbB9m6E6gSkqsxiZaUiICrTz9g0PVSEXE+SdjOTnxaP9lN0TOdxcZNxpG5V+Vgp++593F14jIK+nahJV9K68b9qe80hcWA7XJtkjiCCnLEkDdPJp3vo7xhe6H+EH+rLf1VLyq483cVLjbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745988851; c=relaxed/simple;
	bh=Aix4c3hn5j3wfKJclUpF77tzFvmZ+SNa7avzPgKOl8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sbaBrVn5GlnYldEAFIkvnVWeVWJuNx0J75wncxcqnOHbagGzDofgylm5c8neTeLde0niD3a8MzchUVPgJn5sOz3+bO3Zp3PVvYNI/zzFARHi6syMbdzFucSeZMuMSxvKN5gOUfSaLEkBdWTs2rL7+160Rv6v0udIkKSognqaBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VXw5FMcS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLbSQT011940;
	Wed, 30 Apr 2025 04:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hpByXBgGzmNPXoUjb5CgL/6YmArIaKHzgPHHyq7dvME=; b=VXw5FMcSeuxjgrOO
	L5vhCXs3U+Qxc0IorPMomE/LrTGQcJSwsbuzWIoKulbJHfW7YTHME6urhnVD98As
	aDo3Mr/RGSxMf+i5CTgr0MTc0Hj+HrplWOico3Adh7XvOwHwQG/fxShGtYP4/Ijq
	+HwnXsntQivACc6qExayhhUvM+0SBh49AcN8v9BGD3x4f439+uFfzADeIS9Wo6Lx
	Bbq8do+TLISf9B3OM207MNEGfoFiRRR3zbTMrUH4lDl+MHphSrnqNLIt8n2IASPE
	QHHyc2QunNogsu8C1zuaKEDbH67qcnGyIlaxsdoW1VkctWZ6L4sXTzVyGao7GZRC
	nSsb2Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uartj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 04:54:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U4s3FX006385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 04:54:03 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 21:53:58 -0700
Message-ID: <1b09b837-2478-49a8-a7a1-0a49f0704105@quicinc.com>
Date: Wed, 30 Apr 2025 10:23:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
 <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rrL4WzSXuC-wTDNY7gePwN7Lok_poY_U
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6811acec cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NoTk0SwpzZkwhluMIYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rrL4WzSXuC-wTDNY7gePwN7Lok_poY_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAzMSBTYWx0ZWRfX/Q68h/VvO7x1 cpuNMugmxcr7clzGVsqfJ9q41pP1SAJ1bSXIuRblQUXlZ62qcemfuThFXR5pcJujFtPQsMY4dx5 W9Kd1pZo2ZXcwQ/0c80hve5b/fppQD9Ggwgpxe3vwBC9Gv6+ZL9/Htecxm3GwYC+FH0nv1zxSNW
 L1ScWAlZAGGwhAQvy4AdveeY4GecPrXxMWwfF7nQOR1kVmG1cZQCG7vVlUNFHnmn2jp8nq+eV+u hSFbmZOpNQqPtjkKiFLvToE2AM4DLK2qRRDeu0yTQo1sRQRq7U/8rCT2YM6ayNrwn6bDqtKtN5j VfAIZ4kFuPqeNdvZ836SXTnajmb7Un+tkIttpV5RBoa9Qw9obYqavBKBDwbvpcwAuC88tI544A9
 uEowUsLNhlGiz4MC+iNATdP0vx289ficDFtfzM502l0o7CBsKwTvOs9tBwsLKZkqAcULFqFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300031


On 4/25/2025 3:05 PM, Konrad Dybcio wrote:
> On 4/24/25 12:38 PM, Satya Priya Kakitapalli wrote:
>> On 4/22/2025 5:11 PM, Bryan O'Donoghue wrote:
>>> On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
>>>> Add device tree bindings for the camera clock controller on
>>>> Qualcomm SC8180X platform.
>>>>
>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>> ---
> [...]
>
>>>> +  required-opps:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      A phandle to an OPP node describing required MMCX performance point.
>>>> +
>>>> +allOf:
>>>> +  - $ref: qcom,gcc.yaml#
>>> A suspicious lack of clock depends here. No AHB clock ? No dependency on gcc ?
>>>
>>> You call out the gcc above.
>>>
>>> Could you please recheck your list of clock dependencies.
>> The dependent GCC clocks are marked always on from gcc probe, hence did not mention the dependency here.
> Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
> bindings regardless of how we handle it.
>
> This way the DT represents the real hw dependency, but the OS takes steps
> to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
> because the clock is never registered with GCC)


Sure, current gcc bindings header does not have the camera AHB clock 
defined, I'll add the definition and mark the dependency here.


Thanks.


> Konrad

