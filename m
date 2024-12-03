Return-Path: <linux-arm-msm+bounces-40130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9D9E28D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349401696C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494261F9F7A;
	Tue,  3 Dec 2024 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b/fhQLGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA921EF0B0;
	Tue,  3 Dec 2024 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245908; cv=none; b=Hdox/8bkdIcNxZ+1gKEgNU6l5dIYCdIG53kLhWg5uNyIWHhFOYjRQyd29iRAp6UGPPIpsvmTBUTHWGEOCkiIphdgE+RSdKqki6wXFdG8WeVqwnyMORpED6rYhGbtoEonNGnEj447FAhNMMyd4PHvlaQXQ0rUawJZf98ZD4Lo02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245908; c=relaxed/simple;
	bh=5lrKttYFw+KCj56orVeagpqZK0gBhMOsbxmUBTTP7UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BvpW70hRwux4dAnirCd2jqzIak+qhSKBKzjiVgpXDFV2ntEiGf4KRXPcAYsegBl6wFU13Zn/Agc/EbSDyfoUdpHU3qW/f2ssonzqz1h967HcxISp7wO+hfoWL2YlKFeowQqql9/hsg4HxSz78vmpHvIFUlFiz1IZc7JGoKc3Ugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b/fhQLGT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3E5sN5020088;
	Tue, 3 Dec 2024 17:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5jateLu5MhWoYSiVb1Km75M9/UGvzjgnLgx0irUmoA=; b=b/fhQLGT2vyH9xiT
	2CwVKbkYYv6Y0FSKtta5IU9PW2IxwGwdVLZuJaJ+teDK6zkmJjzeGZLrn2IC3Lh3
	mMjCN5rm//7F9kudGijVlMXW/re8yLDoyZpsPYccVW6bWYpcmLe+4Dkbf6FFX5aQ
	JcFuUlgraDoqYAZbDEk6Ku4NJv3iyCupst/iiVyLlGpYnhrn9TGdniOFQCTIiHbM
	FtBmyYNQkimwpqSHpguV9qIV7oN1GsfUFY38QF3WwAUor1xz4bR+wucSQBhM3m3b
	r+y0EmkLZFT2tRLq3mgr/W3ZIiyh/g5fJGn6dVI0+DInvoAKeWj/D9J7EC2AvZCC
	jYVu6A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3ex8gpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 17:11:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3HBfet023736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 17:11:41 GMT
Received: from [10.216.52.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 09:11:36 -0800
Message-ID: <289e7959-8eae-4598-899c-16c67e66d4e9@quicinc.com>
Date: Tue, 3 Dec 2024 22:41:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p: Add support for clock
 controllers
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
 <20241025-sa8775p-mm-v4-resend-patches-v6-2-329a2cac09ae@quicinc.com>
 <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
 <9e0f200b-53dd-4dbf-8b0d-1a2f576d3e3f@oss.qualcomm.com>
 <97c6ef74-7ce8-4e67-85f9-d5452678f45f@quicinc.com>
 <gpikswuggsfnfu5ay3se46ah6rdehaeu5ylaa5aidmqtcejoo2@um7inmnjrcvq>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <gpikswuggsfnfu5ay3se46ah6rdehaeu5ylaa5aidmqtcejoo2@um7inmnjrcvq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aqY4RaDbBV-cpQnsLrY4ijAgKk-dkQIm
X-Proofpoint-GUID: aqY4RaDbBV-cpQnsLrY4ijAgKk-dkQIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=816 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030144



On 12/3/2024 9:02 PM, Bjorn Andersson wrote:
> On Tue, Dec 03, 2024 at 10:04:13AM +0530, Taniya Das wrote:
>>
>>
>> On 10/26/2024 12:12 AM, Konrad Dybcio wrote:
>>> On 25.10.2024 8:42 PM, Konrad Dybcio wrote:
>>>> On 25.10.2024 10:52 AM, Taniya Das wrote:
>>>>> Add support for video, camera, display0 and display1 clock controllers
>>>>> on SA8775P. The dispcc1 will be enabled based on board requirements.
>>>
>>> Actually, why would that be? CCF should park it gracefully with
>>> unused cleanup
>>>
>>
>> Yes, CCF should take care to cleanup. But I am of an opinion that as we are
>> aware that this platform do not require the dispcc1 so we could avoid the
>> clock driver initialization and help in boot KPI.
>>
> 
> Does that imply that we're guaranteed that the bootloader will never
> configure any clocks in dispcc1 that needs to be gracefully parked from
> the OS? Is this guaranteed to be the case for all QCS9100 boards?
> 

Yes, bootloader will never use DISPCC1.

> IMHO we should default to correctness, and then make product-specific
> boot time optimizations from that starting point.
> 

As I was sure it will not be used on this board, so I left it disabled.

> Regards,
> Bjorn
> 
>>> Konrad
>>>
>>>>>
>>>>> Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>>> ---
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Konrad
>>
>> -- 
>> Thanks & Regards,
>> Taniya Das.

-- 
Thanks & Regards,
Taniya Das.

