Return-Path: <linux-arm-msm+bounces-78549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D5C009A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0EA93359AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520182C0274;
	Thu, 23 Oct 2025 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aydXRKD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8EA2FE573
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217279; cv=none; b=escbenYlTmGpfbLoZWqNyzBQX+l6OGVs7qq5IhEOk59uGg2LrJz1I3uev+WVIECbmp1/uWFlFN6+2ZPo+yKAQ2U0clMKkjINxDn4+kIBunqlZCRxr0gpU6ox2/QiDoBgKAWaS7d68DHqmP61yGiXHnNYzdFVMZK3Z54S4UFejwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217279; c=relaxed/simple;
	bh=KLbKfhQdEVpsqoRQiUj+noXGDqfEwZDNBazhIEzNO4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlBPg1opq+9qJ10fuXXs39yVDChXYowkMsYWHLe7ffPHSc4GG708aSDQrdmCzZeJTt05BoIFsGkbrbWwWdhk098VVHHgTzS7iZphAO5EanZTYVE/FYZnDk7ijioE7hpWvUfNixqQBifatOkfBRpO3G6BmuBkqnJ/TNtagFLNYis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aydXRKD6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6ZRZr007464
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWvodgoQHlCAgUxLTGA2zNee27B1mcvQ6fjtgBWIkUc=; b=aydXRKD6CXTPjNb3
	7s39KU9XMjsR6l2oasW0vp92hs6LaLZYFvI93oWlMeVAaTE8wbm5eClsIzHC1IAV
	iK+rOnFqIwPz/7ckt/JLNVFGMLPf9ngHMlokZc0N5OzeVIm0cFe6diztG3VP0Plk
	vu63xt/WTX85GcKgxPv6in3PofN9U2ijEfTWho1U7wJcC7lKmhMWY3tHCVgLlaWg
	bVVqXYobTQpNQEA/plPfV9XZyr7wmTBVros+5dptcrRukToHW4wzLIzuCcDDXRsA
	onPmD1aCpx+l9KQwfHSdl0JkLC9wPjxrxFwu19KzaqgtMQHL3ObcfGrpilEQacPY
	1SJMbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344867s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:01:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bcaf68549so231227a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217276; x=1761822076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWvodgoQHlCAgUxLTGA2zNee27B1mcvQ6fjtgBWIkUc=;
        b=KelJb+JaY65xCdwEu+p/Nr4DQ3R6RVE/XpEbo88a8TNj0rOCo82RdnUitlfKZWyVmd
         ZMweKgeqtzVOHMYx9XaetFt+hRio5PlwoHabGl92EQFj5Do7pQVWpAjjzB10MaCKD/Er
         d8BGBFvU5NVIgkgCeBnsNcpBaRgceQlSf6phpNcyhicIqbBRTM/JRyUUmyS1mcOhttrQ
         Bm7riIx5xMlrrc+wR82xlvRu5y6brxAv8MFCuhD2f7IqI5kS3IVuqz7zOmMQ0ls9Ska+
         /PabpIBQsiFdN02qnbPm9Ah51czqUp69rMVGCJm9IedtLUGXOsTNYQB0Bp0D1PkWk9X8
         hvfA==
X-Forwarded-Encrypted: i=1; AJvYcCUDL9hURCDEwi274HZc9WhGu8NpnxWtkt2Iiv+iiwzFfe7HUrm00Jvw1e6fW3TYeX/OsVtKLKBbztUWKGr0@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/DP8m6Hu9o0+rdtQ8zX24bDlPPn2aTPJjnIMEFdu016ZCYjV
	yl3FYnE2Z1j38DPMGF6Sr//OShQ2TG5LnZ26hqWJJRE5DPRVe5qT+tQZIAVlQbfRe639yMP6xOW
	K+UoFMs+BHQSangR6CW0LZVyfupsZH6IpXV6bm2S7fRDyNeAiH0W+bo9QEwqyvAkHMUU=
X-Gm-Gg: ASbGncuYFzTQgrdK35tmFcYZSdA2DZlOQRYk3JVZLBRdWooyDC/7Igx1qw2oxXvKYVv
	/HRfFKHu3vAefAjl2T8cPCcUQhJXyBwxfhw91EX0wP1C9z/VyJe14/hZpRMmGUJKK4Qsei+MmHi
	zPK0FhDfbCFq9ag/XpwlvAUqhDLTGozDVL+k3yLIFl0sDrSmAMJhrqy6HUt8Nm+4QowM66jscL2
	5ISw8W9gCFqQcoCmLQX5zmgPpCq2IXs+uUF7//1B/TFbeuejccf60i62m1lNyFplvjiU+bzGaLq
	M9924b0AaiNSOS5kN1ql1V35D0TCX0wwNy/4BrorYM6TySp4x7zVLjscnNnr8pOORDcFYoD/YM/
	Q9pTvibOLUcTZD0HtBMP4KvYxTrF5
X-Received: by 2002:a17:90a:1101:b0:33e:287c:cb2d with SMTP id 98e67ed59e1d1-33e287cce1dmr2745966a91.2.1761217275931;
        Thu, 23 Oct 2025 04:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7sjBjqEtUr+LFigXCOi6Pc0gZjDtpKqghp/7YaBoW9/xfSqioLyHdakc+MWVYZtwoh4Wh1Q==
X-Received: by 2002:a17:90a:1101:b0:33e:287c:cb2d with SMTP id 98e67ed59e1d1-33e287cce1dmr2745921a91.2.1761217275163;
        Thu, 23 Oct 2025 04:01:15 -0700 (PDT)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373f5sm2070267a91.4.2025.10.23.04.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:01:14 -0700 (PDT)
Message-ID: <e9c24261-d54f-4d43-9101-a8c7bbae0399@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:31:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 mtp and qrd board
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
 <20251007054445.4096630-4-sarthak.garg@oss.qualcomm.com>
 <f8671543-bba7-4ed5-ad69-297df9bcc43c@oss.qualcomm.com>
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <f8671543-bba7-4ed5-ad69-297df9bcc43c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XywPVw_WQSqG0m8aIuxnWofbC1quV0-5
X-Proofpoint-ORIG-GUID: XywPVw_WQSqG0m8aIuxnWofbC1quV0-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX6VnhV1zq/KKN
 NH9+gmJcH8R3sR2qYCAEvX0ha+1YG6OtqfdvRyG+Kxd4cAQK5mTL2mOrq83nIaNcxuYT0cPJc+g
 ghCOqA3wJtsH/UlXEXu0JDy634+OwbgD9JOpoXfmaTaMy6GuaH9LemBssMXCK3y5k3/vIXZoBXq
 O3FN+KoGtpPM4W/0mkbeN01twDrPW8uQCeNSxpZXfE/ujHy8PnlTTaoZDU5t7g6+ZYMLmjjyPUp
 8rCC7Da3neAM1G2993PRais/EtDcQUsYXXjjHJc4/wmoCzyfsaemV9I8K8B/SluWPmpcMgqIBDr
 S2tJUYJXV6W38azNwgjrr6cOJOb+ZSPsA0FOunZSIPslIw0pxRPmCOu5LSwaaWMepBivj1Zd+o1
 DFnovXpyV+xlRhgFRK7bNG3wiszLww==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fa0afd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9AcWnSgGjwGhTpeVYLEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023


On 10/8/2025 5:49 PM, Konrad Dybcio wrote:
> On 10/7/25 7:44 AM, Sarthak Garg wrote:
>> Enable SD Card host controller for sm8750 mtp and qrd board.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 15 +++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 16 ++++++++++++++++
> Normally this should be one commit per board, with e.g. "sm8750-mtp:"
> in the title
>

Sure will split in separate commits per board.


>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3bbb53b7c71f..26548191d95d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -1030,6 +1030,21 @@ &remoteproc_mpss {
>>   	status = "fail";
>>   };
>>   
>> +&sdhc_2 {
>> +	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
>> +	vmmc-supply = <&vreg_l9b_2p9>;
>> +	vqmmc-supply = <&vreg_l8b_1p8>;
> Any reason you didn't place a \n here..


Missed it will place in next series.

Regards,

Sarthak


>> +
>> +	no-sdio;
>> +	no-mmc;
>> +
>> +	pinctrl-0 = <&sdc2_default>;
>> +	pinctrl-1 = <&sdc2_sleep>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	status = "okay";
>> +};
>> +
>>   &swr0 {
>>   	status = "okay";
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> index 13c7b9664c89..8d018eef44da 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>> @@ -916,6 +916,22 @@ &remoteproc_mpss {
>>   	status = "okay";
>>   };
>>   
>> +&sdhc_2 {
>> +	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
>> +
>> +	vmmc-supply = <&vreg_l9b_2p9>;
>> +	vqmmc-supply = <&vreg_l8b_1p8>;
> ..but added one here?
>
> FWIW I like the 2nd one more
>
> Konrad

