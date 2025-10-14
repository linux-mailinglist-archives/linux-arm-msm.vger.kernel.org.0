Return-Path: <linux-arm-msm+bounces-77118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E079DBD84AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B2DB3A3CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9F2DF13D;
	Tue, 14 Oct 2025 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTIbnxel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A782D73BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760432019; cv=none; b=iIZcyfK9eZKT/LoEULzj98mhDNKhvE7vy+6PBxyPHQlQiT2q0uK56QDc7MnCS06VhdsZCqAMRrtK9HpYZawV2SO7M5nVKzPZvIgkZSl1aIVHpPbMgtmHwQL4/cn9Ccm597uKA4G9gOpElUjBSE32/Xu7qZVc03N52VKt3angaCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760432019; c=relaxed/simple;
	bh=ixb/fdiw8StgSMnPp3lrzYkEhBChXbenwOwYOc+9cJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rB4VKz2oYh/FpycpWJTcyUHEN9LZWYUcrS2pvWcuaBLrWtNRmvgQEKIb2aBEIPh0fCMtmPGUAs5it3B0wfAiy+l/fZZVrK99G9vwI+v4CTG7bWPwqJyLA0IrCCqhTerUC45z40ngJoUmuwbz0SUg1J/s0KlW+TK4JAimnLEhSkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTIbnxel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87IoL018115
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yu6GxXvjzVdp0jD9TyFSB0cQTPVuV4yy/C3ICodMY8c=; b=kTIbnxelhGa2sVP3
	boJK3HyeqmX/0HOgmXYWMij4nlauwxuwRmcj0aAOZC4nC4JsZAFPBu3yvdYA6Gjl
	aJPSbjTRO5XYviCOe3d/StKOp4eBS4kFaxp8IpxTRPa9EkjQhRE97dB3bco2DMyy
	ExLDNvHIFyeDsenozVaaiXx8hbeOVQkVIE+06H8xn0QlAnPwUFvtvhDDXpzbJJUQ
	RES2xTPr6phcaIik9jHxJXDZ694LxbumoYb98FK4U+Y6oFD4smz72AGvwcXiFbD2
	WD+GJ8WUBOOrW0qJQc2Wn1Tv9xMjgxPvsZtyrVRg2G5DU5HoODBTW92jlmzk1aSw
	ffoEog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferyt6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:53:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo287819885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760432014; x=1761036814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yu6GxXvjzVdp0jD9TyFSB0cQTPVuV4yy/C3ICodMY8c=;
        b=m8c6EBmnOqhFMfYM4UKdrinePz8HMZ7/RY7yhSb4ce3rbIhFXQf9SDe8t6mG2KREpQ
         0PR0Chk+3wORTuOQmShO1oOnb7kMgoYI6BK/WN0ulUNf1aantGABvrMRVnSIxZg9HvA1
         29fsqANGQYsswLuJwuHVOk8B9mCG53Ek8GwOxGrj1TVbethKogmi2pUbRcvODuxDTXIq
         QFB1D5di59Exct0kNVMvZVg71dv1teHLc5I2/sVNqYJIEW6jn+5o1ne2Yt1/7nTejhRK
         wehuoTiJvuZci9/14dq3uYiDFPD71ByOrURz2aVQ0JBTmpzun3kdkHbw5stBvNHBmlnA
         UxWw==
X-Gm-Message-State: AOJu0YycDn0x/1O8svP1tgPNd8lRC1D+SwQSjbjXNubWvLYjZ/G9F8dr
	A6ljO6dK/pwMcXWGkfdOeH5XemQI2YDhAxVjspZryiC25JiwOFvNSa4LPIf1f14+CFEnqDR9Oic
	F3XBKMVERBhOuj1TlORiEJ4z0Y5RIHiM/VY1OVCNg4u7deVbqVHbgzu8/AW5EUUphzm3J
X-Gm-Gg: ASbGncvtsEm2IyI6f4FysKC+dFuUDwO4BDoGTsij+5ay05t8vxO9WbWDTR43DgZPEmP
	7DDVeTzTWVoU9rdeAWWQGwVisHwP9B49IJqwmtYnER/KQ9HipOxW3Pq3e1qBT2rtFxPYQDzb5pN
	Z/QhdKETdlnaFKB9fDzF7tHo05U7ewelMRmHeYNltrxFsfgxDEtyUoRqH0sh32EAn7Upj5wAYEE
	BWQkGoaC4ETLzmpkkCREr7EGPMFJNyUnTHm0EjrxRP7Y6FkY9R7UNX/RzwYJMZ4Ixie4vJiwvp2
	hPwq2fa2DsYvB+kCrQzj1m9IMC/S1+RVYOArlkiQfzZhBO5lrrYMIgCnb+CfAMvriUduNmAX2Ht
	6enLKrzDcMC0kHVXzZuGU2A==
X-Received: by 2002:a05:620a:372c:b0:86b:12e2:28d1 with SMTP id af79cd13be357-88352d954aemr2148349885a.7.1760432014534;
        Tue, 14 Oct 2025 01:53:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm4ixM4YDDyNB4X3gy92GuzgILUxOgPYXhz9lsuSEFNcMwwXiOp3PYD1SDSeDU0RrlNXPctQ==
X-Received: by 2002:a05:620a:372c:b0:86b:12e2:28d1 with SMTP id af79cd13be357-88352d954aemr2148348085a.7.1760432014042;
        Tue, 14 Oct 2025 01:53:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12b4csm1136163866b.56.2025.10.14.01.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:53:33 -0700 (PDT)
Message-ID: <40a9643d-01b3-434d-9163-da35c2e469b4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:53:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
 <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
 <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee0f8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=BM6OdSh4NsqE7HirI3EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e-wn-pCP6QRyU05D1oHE8X5WNZZu2CST
X-Proofpoint-ORIG-GUID: e-wn-pCP6QRyU05D1oHE8X5WNZZu2CST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/W00F5XmVtuk
 +/99yc91DYX97CxqaLdbHXlxH4IQSfZd/ncEFfBAuUOjLMg5Qgg9GGRaS0R4VpyxmJhfybwxwTH
 /2inNFbkyMIzw258qYe2kxIBGFkR41CRepxvMlGiQLNttlr9MIibmhJXdp021jV+AApI68Z5mEp
 rvlD2Gji6hHyRW+icyrDTdP/Ne2ZQkbPlQc5xJq+YiLzaw9VIIR6TY6+1j8GhKcmaq8/Gp6VtoG
 uYULeRAAXxBdyOcxRBbaAljqgtmxB4Hwi6vAqITjPIzEBvsP3P8Or2o8rOAFGZ16qlCNjrgBYC+
 8UY4g0bOdyDp7v2JUcYUfmehi9arC64kLx0XfFzDnZzWVp3IJNy03cQ9APNPycb/qaxN57Jy7r9
 FBr8dW1O21/sht1yLMM0TGPd9BxeOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/14/25 8:24 AM, Ayushi Makhija wrote:
> On 10/6/2025 3:44 PM, Dmitry Baryshkov wrote:
>> On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
>>> Add device tree nodes for the DSI0 controller with their corresponding
>>> PHY found on Qualcomm QCS8300 SoC.
>>>
>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
>>>  1 file changed, 97 insertions(+), 1 deletion(-)
>>>
>>> +
>>> +				mdss_dsi_opp_table: opp-table {
>>> +					compatible = "operating-points-v2";
>>> +
>>> +					opp-358000000 {
>>> +						opp-hz = /bits/ 64 <358000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>>
>> Does it really support only a single freq?
>>
> 
> Hi Dmitry, yes it support only single opp frequency, I got this information from ipcat sw for monaco, similar
> we have used for LeMans.

I can attest to that, even though I'm a little surprised that's
the case

Konrad

