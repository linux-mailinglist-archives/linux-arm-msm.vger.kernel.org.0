Return-Path: <linux-arm-msm+bounces-62823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728BAEBBAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26041C4794E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DF62E9EA6;
	Fri, 27 Jun 2025 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBKd143x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8A52E9746
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038033; cv=none; b=ef7aOC7/eLBdNiw1ssx7rLi2D4Zf2TnpBfQmiZsYkuVWdANlTyN/HgFGXB0O8/kQEZBgAbA02oENvIovWE5rB1vP6Wd3ZRlzNcFM1Csi5Gpsi1NJlKRBuPyHiF7/WgLVVwtg0se4EOLXoQFLYTmHg4ZlFjtCoDt/a3EVSwoFwso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038033; c=relaxed/simple;
	bh=hcN6A1q0WGNYWRvbQ4ctcnRMau6cAMlQLdGma13AKqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmOPIdYgn22MJPsE1MLsO4gsqt5jl2Q+aWs0BK7N7IlUFAs6U/P0cHxAaObDNrnDvGS8xda79Xx7u5L3OetjqZGIsPIzCYNcxskHur07Tuq/D3LdbDt7ARfWzKA37mdJqBCYWFmSVrt5Rj9bPY+Rg7TRHcYUjF+Bh3ea+6B9XkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBKd143x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMXHF014502
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZZ4tJ6lcu3L9BEzwOZsQXUridSAuhGxATa6ADiHX78=; b=iBKd143x7nGsvr/U
	az510V+NoAVosDvhr333MuNCoJFZ8A5MttWnq0EtcFeh28Ghplkm5Lq7TlpQUw4v
	fQNvLGkukd5rvfVoL5zgPcfm23z1KyxJtlaHf1ZTaTmASSy3fzeAneCaO2uJTgtq
	ey/HqXhoQY3f8xLEoyuV3A0eFSkhSs1LmcTUWie6hgDn3x5C/D5vwZm2M3ahJl2M
	2A3jYunp4+G7S6ouhPEih6l5IazRpURwL4IZgOU62IQ7uw47Ilw6osXTYrqjVIF6
	Y8Qq547i7HE8EME0YMJvnLt6u/2Wkj5Qxu1ItuQuHi9MUVtYxeP/F5quyL3VX452
	u4sEEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25vq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:27:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d41d65f21eso3346685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038030; x=1751642830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZZ4tJ6lcu3L9BEzwOZsQXUridSAuhGxATa6ADiHX78=;
        b=VPUtGvulSN2A0ziw6YbHHm7WpzRhvx/j1f6G/48v+7CPWLPbIID6V2lnwTBBZCpIU3
         GB1KFptSepG4gLLVaSBTI7oVhp1WQZwKX2cQHdhI5PVMdkraLCWioqhVQHAJicvRsrFv
         4XMRTxJ9qJGo3oFlLa2g+RR2L4EwSUz0faRWLhNQE9zAw/ebU5cTDYe8JiQY4+mEjXQ+
         LoNRGcyz2jtsqU8ORFhLuwpUYjx4dMAWcmNtE9ud/swHwc5LyqaVawZN3DpJAUOcvyRH
         ab2XnejpQKPXxDtNAcq3ecH/tp4kmZ2ZiT2Hav5WYNQ8UsBxzb40LQ5hmlRmXK3Iz2dq
         BiyA==
X-Forwarded-Encrypted: i=1; AJvYcCXTvncu2KxMybJkSqVxIcvS95RfQk1Int38IBCcXJfTqgORX7onZboNPe7OJkURhPWNA5l9U6dQSPMDsbe5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fKEWmh4qWwdu3jJYMIm/1eYhRIddw00WUeAxtRNEC9baU1Hg
	Y6Egur4CeIjdMJJZ0T44V3yV6YWavYn5nG07k2ichbQchodOoA4MFEvjpePQ63wVGqyEhPASMIS
	jsmAeqQxm6nKpcH834Q7dIyvpwcnMA/1MSRSOgeLt6QlFIBP/szuHyuRBxBbFL01DZWlu
X-Gm-Gg: ASbGncvre2IPIky0EXr2yHk3bRMjwAy7XU3RVP01YljiTXBbA9FV+bnJYtiqOvJm6J6
	DwfJ0la+M/6nT3QFnHvYgtv2UVVcMx2+NFjRfXC6I5rSQKRb5P6TGzEGpWZfkLRldZQ7AKPH8/9
	d2UiqBp6pJVz/xYkArGa+/bjJTdU+MtCvJd5s0Vj4KthzXffNSPX6/G0Kn4pmjMbEVhvZTJ+g4d
	F2uuepnhgoHZSeuV2maSzX/DjUHoxD2Bh9IQWHwsWG/744Pz22qqweKWRDDOa/kaVso64dHdAkp
	DCmpfPcQLLSI1BZx6RQhfKE4/KAJoJHdg0zIDCyfZQuu5XOZ5Tmp2OMTpYx+3yGLDVEOuQ+CTiY
	0lxc=
X-Received: by 2002:a05:620a:2a0f:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4438fc152mr232575485a.5.1751038029852;
        Fri, 27 Jun 2025 08:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzu9KxtnhJiSF0c+63jY7dHIfp2V6YLdELQCZgcMxDmXNkGrahzyOY+/NuiaXWENcUW8wxqg==
X-Received: by 2002:a05:620a:2a0f:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4438fc152mr232573785a.5.1751038029320;
        Fri, 27 Jun 2025 08:27:09 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bda4sm140761466b.141.2025.06.27.08.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:27:08 -0700 (PDT)
Message-ID: <7df8a438-364e-431e-8424-209ad7482efc@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:27:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com> <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com> <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
 <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
 <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eb84e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_MKmYBsjHzb_8gZMir8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UK7AdIulj_c2xt8t6aeMsYm_q4RkVVOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfX+qmGI/ay1B+/
 0TTuJXNmZZjN9O3MbbNCbqNQOQqiIbwhQRNjVDxJIISYbjhRp+XQ2kAMRruwDMP36s3twgB9m60
 5a3Tyq3LWbrPmCp0nj2M/AU6XB/v4FUznsTjtoL4XHfHQ6OARgjlrvpD6UlpIU8aW+O5aErXJrn
 7jgOM2f3+Al2Axo7Lm91iqeyBZRAFbROEBOIu17RuPzmoK6DbWwN0VUCb2ivDURi8M2To6gWNhS
 JWHV0VJFyCl8AwK63C3jtEp6nE5cZuvr4ABngKMwKTYto9UV/Hx71DT31v9VOWk1R+cl/spRh4c
 QYsiYyUBYKr/VqY7+NYK3RUQry60unQjurU55p/0bUM1ARbq04ICWNN4JuxtwU0BtQETBROh0Hn
 j1D2R28nplBGTVJK9vNv0on4UImp5/JKuEiaWGYXdNWBaHVUwEp/rlpb/Rtt4sgL0sDX4hXQ
X-Proofpoint-ORIG-GUID: UK7AdIulj_c2xt8t6aeMsYm_q4RkVVOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270125

On 6/27/25 5:23 PM, Vikash Garodia wrote:
> 
> On 6/27/2025 8:50 PM, Konrad Dybcio wrote:
>> On 6/27/25 5:12 PM, Vikash Garodia wrote:
>>>
>>> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
>>>> On 27/06/25 20:28:29, Vikash Garodia wrote:
>>>>>
>>>>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
>>>>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
>>>>>>>
>>>>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>>>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
>>>>>>>>
>>>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 57 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
>>>>>>>>  			#iommu-cells = <2>;
>>>>>>>>  		};
>>>>>>>>  
>>>>>>>> +		venus: video-codec@5a00000 {
>>>>>>>> +			compatible = "qcom,qcm2290-venus";
>>>>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
>>>>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>>> +
>>>>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
>>>>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
>>>>>>>> +					<&rpmpd QCM2290_VDDCX>;
>>>>>>>> +			power-domain-names = "venus",
>>>>>>>> +					     "vcodec0",
>>>>>>>> +					     "cx";
>>>>>>>> +			operating-points-v2 = <&venus_opp_table>;
>>>>>>>> +
>>>>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>>>>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
>>>>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
>>>>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
>>>>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
>>>>>>>> +			clock-names = "core",
>>>>>>>> +				      "iface",
>>>>>>>> +				      "bus",
>>>>>>>> +				      "throttle",
>>>>>>>> +				      "vcodec0_core",
>>>>>>>> +				      "vcodec0_bus";
>>>>>>>> +
>>>>>>>> +			memory-region = <&pil_video_mem>;
>>>>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
>>>>>>>> +				 <&apps_smmu 0x880 0x0>,
>>>>>>>> +				 <&apps_smmu 0x861 0x04>,
>>>>>>>> +				 <&apps_smmu 0x863 0x0>,
>>>>>>>> +				 <&apps_smmu 0x804 0xe0>;
>>>>>>> keep only the non secure ones.
>>>>>>
>>>>>> ok
>>>>>>
>>>>>>>> +
>>>>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>>>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>>>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>>>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>>>>>>> +			interconnect-names = "video-mem",
>>>>>>>> +					     "cpu-cfg";
>>>>>>>> +
>>>>>>>> +			status = "okay";
>>>>>>>> +
>>>>>>>> +			venus_opp_table: opp-table {
>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>> +
>>>>>>>> +				opp-133000000 {
>>>>>>>> +					opp-hz = /bits/ 64 <133000000>;
>>>>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
>>>>>>>> +				};
>>>>>>> Fix the corner freq value
>>>>>>
>>>>>> can you add some reference please?
>>>>>>
>>>>>> I took this data from an internal document - not sure why the downstream
>>>>>> driver supports different values or where those were taken from (AFAIK
>>>>>> they are not supported)
>>>>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
>>>>
>>>> I took them from actual documents (which might or might not be obsolete,
>>>> hard to say but they were the latest version and as such, they
>>>> contradict the downstream dtsi).
>>>>
>>>> So I'd rather not use downstream - could you point me to the reference
>>>> you used please - I wonder if the fix is required downstream instead of here?
>>>
>>> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
>>> is the src for different venus clocks.
>>
>> This is not a good source in general, GCC often has more rates defined
>> than the consumer is supposed to finally run at (because they were deemed
>> power-inefficient or similar, you can pretty much set any rate you want
>> on the clocks fwiw)
> Count wise, i agree. Value-wise, afaik, corners should match OR are you saying
> client scaling request for 133.0 MHz is ok when src is generating 133.33 MHz ?

I *think* we're running a closest-match in there.. but I'd love to
have the clock and consumer drivers agree on the rate exactly
(which in this case would be 133333333 - and the clock plan in
our docs agrees)

Konrad

