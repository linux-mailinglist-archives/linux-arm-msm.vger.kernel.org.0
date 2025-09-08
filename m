Return-Path: <linux-arm-msm+bounces-72477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4CB484E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA6616EA2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E835B1A262A;
	Mon,  8 Sep 2025 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0BQAb9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579A23184A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315796; cv=none; b=VgvoB7UhSBtwPS3CZJPYgkzXZ9kF2SRQx1jq7odW/NlN0uL08wpRGL4qb73NoyCr45CGn0En2h/4giOLjP/nN8RRm2hnktZhsC4utNB1vIJTAr44jjggKWqbdcOQGlNLLgpmgbUiR0cXWucWYsUfxBG3gKa95kJWKzqT/551NAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315796; c=relaxed/simple;
	bh=0jZlyef1yvCqYyJvmMqZtF1i7wr8h7b7GqLpH86XQvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8V/vVQ9almawSdETpCeKtS20ZcpDpKLXY7cNQqW/A3YWGLQFRB3G3gKbT/6G3mPivV0JpfFItdyvkSGZBVSgpIyUXOrNy9e7Wo84NTo0azQb+bJfqkZ+h6WOIUqbfjQ+aLBbDpDLsMN3W+9aixQG9z7s5X6VZoQF4j93Bapa+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0BQAb9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886gFIe005880
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 07:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaKwF3uTvV0qt8pO//IeFHi+qzIUMNGv1KFMfckt8OE=; b=E0BQAb9mPmuozXUc
	MZp6LbIFfcTrzbktlYQW0oNLK8BLL8KI2MvRVU0YCJtbe129HTqEYXKukEnXFeYY
	Z9AvQym7Y7G+HdSCWYqX8ybqUHztR6Af3q7nhZCrJUhkuhMyX5m8vxsGYm05QYgG
	tpuRvSvqEMo3lnOvY2DZ9r/5/uvIVoUYJmkzhor1rPdaNZL2yMTBdnmARetqLoD3
	RzbUOsVqDItmNWvoFwpRD4b4AnnGC70+r/EvSo999YHbXox4o6yvSD08BXGGL3qH
	OQ9peWMvvQ+aZkFq51+x95T5W26XMF1k6kn2R93slZIAroLRoTwUa6IjSVo/L847
	1JjhVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r39b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 07:16:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f92a6936so8490341cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 00:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757315793; x=1757920593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaKwF3uTvV0qt8pO//IeFHi+qzIUMNGv1KFMfckt8OE=;
        b=v+bCDV1zAoluBsYjNOnb/Rd9YWOOMZzGR3taDs86ifqeUMNCEBnwMM7TNnTBXAUv/c
         F0vPvlLUE5UQU5sFsPQQzWtGVBVE83jeKzgT1YTnofBQTASIpV/ZmsrXBCVT8Xxhkx5H
         3S6ffsm8lO2MI0GPZNvCjs/VgddlESFryIW/nuPTknwXHWFROYH48V+Q1N6INRD0K240
         eQZCMkgREeQMjNkWcfZrF+XPUcQ935iJGSNVvCt11u3uGDHz4a9/6gX8MSmNMmGpoQjP
         pxxF6VMyIGJ3QYgCINcxwnWSXmMIZELNnskAGDewil9eb/kAmH9jHxQAx/ujpghQTUdC
         AcqA==
X-Gm-Message-State: AOJu0YxXKnjBla/fPH40UdbUacYI6z1gB6NPPlbLG+ooNwsjL+gLNsOL
	g7U5w999De9hCVw9jBaSWC94u+z0f9Ed1JzG8uYvdgi1gK9VjexoNXQojifyx7sC7g3hIFLkffu
	+Hbd1p08UywO63UROlmmzNWtBTRIkpUpysOiaFRr9zjQL+k0Eim9nFFWHElyNTEh+pYkq
X-Gm-Gg: ASbGnct8DOiSNIJrgzA8yNSX0gqPL5wHI4O4H7BDFhw96jmAZEig7YIV9kDIVikjObv
	RqCuz6TH1myn7fUIGM9XkmBoYFzp5k/tqR3O35ZWnQGofUhjUyRTq2W76YSWoKR96olcEiUfoTG
	2dcv8sI95IXy0LWl837JcYcgOdvcIh6i/rh9UyE/b/49SC8Xg3yY6Lgr3K0jv2JAx3AnuRVxP/d
	1YA3Ht707yMpPCvxPAZ9UjgMX6wLB6qfrakduZ3JrWOnn3nkzX4tyuVnSN4bvZ3M1JmOiVRV9sZ
	5+v/I77HSj60kucIvjQjidYkr4leC0DngvOI3yQPhR+Bb8X60ucSIshX9sNxRhlJqhKyGJT0Xhp
	p5Dx1mjTF1KqcoqpBWOaH5w==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr52719111cf.4.1757315793086;
        Mon, 08 Sep 2025 00:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGleczMa2Q7omIjZHxAPAoUdrSH+RT9RzFZmldfPTQGN+mYVhUoCTb0CBLPp6B4wg1HrxnQCw==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr52718941cf.4.1757315792535;
        Mon, 08 Sep 2025 00:16:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm2323810866b.88.2025.09.08.00.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:16:31 -0700 (PDT)
Message-ID: <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:16:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aiA7mUzzhzbnQU77XNJv4TZMZvZ4MFob
X-Proofpoint-GUID: aiA7mUzzhzbnQU77XNJv4TZMZvZ4MFob
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be82d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=kc4OFxI6wrfgCCI0QPcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX89znairicU5G
 LvBwhNmyoXzNEDOlFWoeed3RWXzdULBJ6qRww1jIuuuRVxoAklX9045qlyypMTL3KW8HIvBPODG
 OA3CzBESla6d8PF+8ZLeAV079fyAZzQKL5jRb3Z9vs4v2QI6Znzv6RKaRiWZqV01L7Gn4ilkYo3
 l+k/7fSzGqmICfNuo4iUsBkD1K4CSCtYO1d8ygumRwsU4JA1VLv4wqpehxTP7jxIwQ8ns8PLyRk
 NZ5MxIiIbLlnzAZM5i51nHgRCizKLlDaabHdhmDt64wNC+90JrN/lAsRoshjvYrXGL6WqWzCAsT
 RKzwOS9I6KrOb1bD9NauYNzX2LKfmVPU9pvhbyx6rsQ8sFbTNCsaIeNTD0sMZ7m/laMw39HPXae
 quxlS8cA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/6/25 10:41 AM, Jens Glathe wrote:
> On 21.08.25 15:53, Neil Armstrong wrote:
>> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
>> connected to the third QMP Combo PHY 4 lanes.
>>
> [...]
>>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> [...]
>> +&mdss_dp2 {
>> +    status = "okay";
>> +};
>> +
>> +&mdss_dp2_out {
>> +    data-lanes = <0 1 2 3>;
>> +};
>> +
> 
> Hi Neil,
> 
> shouldn't mdss_dp2_out also have the link-frequencies property?
> 
> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> 
> Or is it something the bridge already negotiates?

No, it seems like our driver falls back to HBR2 (54xx) ever since the
driver has been made aware of this property:

commit 381518a1677c49742a85f51e8f0e89f4b9b7d297
Author: Kuogee Hsieh <quic_khsieh@quicinc.com>
Date:   Tue Dec 27 09:45:02 2022 -0800

    drm/msm/dp: Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint

Dmitry, is there any reason not to allow HBR3 by default? Is our dp
controller/driver not smart enough not to advertise rates it can't
support, during negotiation?

Konrad

