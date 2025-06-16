Return-Path: <linux-arm-msm+bounces-61380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277EADA90E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5C416F4BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741231F03D8;
	Mon, 16 Jun 2025 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FDJGkOsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8027454;
	Mon, 16 Jun 2025 07:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058052; cv=none; b=b8s7tpfRXDCtSrTBrEEycb3Mq6rUG70yUEyYgTK9s3Ejq4Y1n+2KEqRNY+UuAUNvTb3tR3lG8FefVZfIwub/LAKQVwhPKo4kXHPATXOz1kvFQY8L51CQUmgrCw8bzhbJld2mpbypfyN/xMJEwrUR0asvPr+sKoH5MyUO7j7qLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058052; c=relaxed/simple;
	bh=8mjw1p7jH5U3R+sYOCQOnSj98L74qXNWmdd6u//UBqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QVcKrnTqt7Uaq4Fb1iZL5Ua8loDau7Gzs+w4Qt3AmC3l8IoHBjJeCwi/AVJN0gIww9aP7OncbuxyU8nDuzaUsgku2ibonr6jBiZg9cQb5zp8wPRaG/2B5n3GVb2HeoYoMDhfOzz2ls0f4YYekojMTSzfPC1t1FBCgDG9uhos9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FDJGkOsc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMjLD4021701;
	Mon, 16 Jun 2025 07:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfE33/hzYMpvHI+EVdkFbVpEI44vnDFenLTTlPLs3Sc=; b=FDJGkOsccrC5PNe3
	1M6VVACtfXJTwNcC5RBpbdN0WWkmRZfEUeOGzThS1CsZVaHmV5wk38NXs5gtkdFA
	KWSdm49mokPGagmkliA+J0v9iufSVO5kUv109VlINMz3FrbfrUos5vhUv0CG6lWw
	0Lu+9pkfs3tfpE7UVg/DW1UQNeNhOOZuONbnU4+0VLARcffA/tXyAEmm65NVsRrq
	MEo+DTjsZVAErMW4jtkcBAkJAeeKYN5qakt0DNCkW2+fT7Bu7GO7U8eNy1NxY0+1
	2BrV0Z3zkca+cQCVCWeHA2yctr9VL1oQln5JpRh6gvqym0c/2OGi7IYE4F+MD9qs
	ttL4JQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9ude8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:14:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55G7E5Ir018364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:14:06 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 00:14:00 -0700
Message-ID: <b35d6797-c574-4b85-878d-502fb4b22152@quicinc.com>
Date: Mon, 16 Jun 2025 12:44:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
 <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
 <CAPDyKFoKh6KLtn6-Rvttt9zKh2fk7T28t_jC7KC8peYE+RkL5Q@mail.gmail.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <CAPDyKFoKh6KLtn6-Rvttt9zKh2fk7T28t_jC7KC8peYE+RkL5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z3sYcZ34SVXSTAF2ZUKEExoXLFmsFZgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NiBTYWx0ZWRfX7YPUs/OdImC6
 0XRGG3+pcdBlpaEMtlRrZHjus4lJzuaSVOn0c/gfCX/UgDly4fRdxf02UTJFSqE6EnW0Fwr3rdF
 NXuKxpVVZLHy3GzK59y/21qyCmUxsy1MLQ0spSwtrUuFfzcBl4nBK9H3PWQvkyykXIWPvf/61jJ
 gYAA9oSdtmJvsIQLtUQthX+u6YY3PGPwqvb/y3PwjeSRuZO0DR+vDi4BR/uAkWkYlA0urfXfmw5
 AVtjepMDUHClpHlEQoUQrOLn1FhqhtNBO8psvdrGMr1eLDRF4zaOKB24ffdKi1yGTZwFKC8EqoZ
 xMajAerulR4OLSNRLQJOt7AYk/5vpm/7Ey4lGcBjZuBygVDKoGGgN/Q4eRPJVc4/3nYFb3xcqvS
 HZ/MXBBjXXHZPghqJiImND+9DAgtYQbYy1MKabDgrlAKcWIJIAvaVho/YxvqJuhuYmHuWgj4
X-Proofpoint-ORIG-GUID: Z3sYcZ34SVXSTAF2ZUKEExoXLFmsFZgL
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684fc43e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=R8EqlNOSqXiF4fyEEKEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=980
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160046



On 5/27/2025 8:05 PM, Ulf Hansson wrote:
> On Fri, 23 May 2025 at 20:25, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/23/25 12:57 PM, Sarthak Garg wrote:
>>> Add level shifter support for qualcomm SOC's.
>>>
>>> - Changed from v1
>>>      - As suggested by Krzysztof Kozlowski redesigned logic to use
>>>      compatible property for adding this level shifter support.
>>>      - Addressed Adrian Hunter comments on V1 with resepect to
>>>        checkpatch.
>>>      - Cleared the bits first and then set bits in
>>>        sdhci_msm_execute_tuning as suggested by Adrian Hunter.
>>>      - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
>>>        as suggested by Adrian Hunter.
>>
>> During internal review I suggested we could introduce a generic quirk,
>> perhaps called "max-hs-frequency" which would update this
>> currently-constant value:
>>
>> ---------------- drivers/mmc/core/sd.c ----------------
>> if (status[13] & SD_MODE_HIGH_SPEED)
>>          card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
>> -------------------------------------------------------
>>
>> (50 MHz)
>>
>> which I believe is where it comes from
> 
> I agree that a DT property for the mmc controller would make sense.
> 
> Although, this seems limited to SD UHS-I speed modes, so perhaps
> "max-sd-uhs-frequency" would be a better name for it?
> 
> Kind regards
> Uffe

Sure will update this logic in V3.

