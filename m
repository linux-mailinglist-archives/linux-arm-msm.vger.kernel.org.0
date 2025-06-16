Return-Path: <linux-arm-msm+bounces-61379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7DADA90A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4E507A2E8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092E51EF38F;
	Mon, 16 Jun 2025 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ut+iaheC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9127454;
	Mon, 16 Jun 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058021; cv=none; b=ovuXOzCNlfElPCL87cjyhsiiEzxEHeZKHI0GjmboFr1nYqn4yY3TOGBHjEb35p9M5pe1kDcCyHwDACxOvabT/i8ffH2ORdeFrlRIfKkYym423GLIkEiHRu/ltEvzh53kI3bcqYy9EgNac6sN2aMu+g3aYMXHkukgUQV3HacBQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058021; c=relaxed/simple;
	bh=ZcPyktvC8/BMCPxJnr/YjIEJAevHV6gQcOeDTaW+V5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kVS+NxtUfbeGamc8eA9R+7YUTDt+9shkA8dH7z+/yxZUs4sF/Rm5VgCuIBx0r/3DHZO6XoYCOHpZ+4MXNpop6B06dnV7bZ7NOJmAdxAckGP8ztkvWhdDD18PbODylc4KaaJhObt/N2ouePm1pOzffK2CosBmnRyy3kK/QGFz6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ut+iaheC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G0ftJq020136;
	Mon, 16 Jun 2025 07:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iiYFh1iDLd6z+wc7j2RToD1j0aZ4b8r4b47pXlebrU=; b=Ut+iaheC7aj+sRjr
	6SxcvKOY4v5l+mKEzgv2vXNo7QnlqzfVefC/4P7rNGMOMD0JYzWry7wYj1U26NHe
	ilf69rZr+UGgGbx6PuyKFahURk6Dor+lFtRybBC8CTGIAT6P6BC7j+kEUAGr2MXe
	QddoBP+aHEEj5tlaSuxJMCm+O2B6ru7Dc8SYGnFsxitwEJbIuSMUzs4f3DcTLHRD
	IMIJRP6PLzABixkClmx6FPbAzn4/oJxMbO2GrhVWFpbmiJwMWJrK11cab158Z6wf
	FN3CHbPpqFNwR7AVZ6ejHaLowb8nnScRkMMXJ7yGHOrNF6590s21+XQ70J7hDlyb
	A9C83Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5j1cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:13:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55G7DYva025981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:13:34 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 00:13:29 -0700
Message-ID: <b5f9cc8b-31df-4353-8259-2416a279855f@quicinc.com>
Date: Mon, 16 Jun 2025 12:43:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
 <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OcAlPssoEf9g9ldr9gdJATv3olof5fAz
X-Proofpoint-ORIG-GUID: OcAlPssoEf9g9ldr9gdJATv3olof5fAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NiBTYWx0ZWRfXwDjOrXpwnBpO
 E4MDArqn/aprRzOP85Ye5vXZ15XWzO2XGG0sbQxh7Bgny3w8CVel1i2yPo4OPaWLgRyKkYTKQPR
 WCw2JQM7allMQOzGHDXIq6QEnBPeV3BIgT9KHIOoulmThqF5/vDbiPRSxvOyLdzVm0fqQYY4UC9
 gIjQ0x4xEMKZ+Q9pUrXU5xFkpR/ZPPw4KEnx5/0Dp3rFV7yhskcXDw0GANfuSEA6Wpm1MopADiB
 2r11Y1bZJ3mnK+MdLdgUor8ac4tLxBHnFhqx4+RE9/gTfhZPpYF1RrduYMuveJJXzgzAynsxEX3
 RGErMYiDcDMeapo9BzNCvZyj2465yGdeYxj5udkO8DIEKmV/No1iJaR4MrV2zoB53Qz/N3+kT0E
 nELw0kZTWUXTtcTVH+j4tHUob8mKJxoCsztfbrLJ8gKiuXraEi+LD/dcWj3dbUo5d/fv3OiZ
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=684fc41e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=DI5BPqGSqfWA6GWAS2gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160046



On 5/23/2025 11:55 PM, Konrad Dybcio wrote:
> On 5/23/25 12:57 PM, Sarthak Garg wrote:
>> Add level shifter support for qualcomm SOC's.
>>
>> - Changed from v1
>>      - As suggested by Krzysztof Kozlowski redesigned logic to use
>>      compatible property for adding this level shifter support.
>>      - Addressed Adrian Hunter comments on V1 with resepect to
>>        checkpatch.
>>      - Cleared the bits first and then set bits in
>>        sdhci_msm_execute_tuning as suggested by Adrian Hunter.
>>      - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
>>        as suggested by Adrian Hunter.
> 
> During internal review I suggested we could introduce a generic quirk,
> perhaps called "max-hs-frequency" which would update this
> currently-constant value:
> 
> ---------------- drivers/mmc/core/sd.c ----------------
> if (status[13] & SD_MODE_HIGH_SPEED)
> 	card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
> -------------------------------------------------------
> 
> (50 MHz)
> 
> which I believe is where it comes from
> 
> Konrad

Sure will introduce a new dtsi flag "max-sd-uhs-frequency" and update 
this hs_max_dtr value in V3.

