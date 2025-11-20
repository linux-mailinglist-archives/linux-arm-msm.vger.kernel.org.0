Return-Path: <linux-arm-msm+bounces-82628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF6C72963
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 983284E8778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E140A303CA8;
	Thu, 20 Nov 2025 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0cAgd9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N169ysYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF13019CE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763623340; cv=none; b=C3Gb72J3XYBmEura0QGCvpXg3QG1O6j7cfM2O5kB3d6Ljr3F53kOcAUZI2/FbEDXHmF5/3q5FmFylOhEtQs4kENvBsHSf0uJz+lVzbAZ+rXm3p+bIekgKzoM1HyU7DW/e2tqBZusCfqPbEANJ4NnpSASRHeeGed8ZBJnoaqKD+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763623340; c=relaxed/simple;
	bh=MePQURatPV5K2RbHXgFtFCH8RlBpKkgWwfISnI1Jsq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCF1ws2vbmiq8Jp6T1gzeutpd2BsBIm4yJ0YokyuuhOL8vbGKDIEZj5C99cVnIC40Ie8phTh5DAuxXk2Fcxj0J5TNlJpjxjBjX9sNAOZRfXIA0QoadLY9MW0eRN403KpAhlPj2BOq9SVPMsN/IruB+93awrjOLhg1hINwCcE8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0cAgd9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N169ysYO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pSAm3543764
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFPI9EtPDbkrhiaKE7kiDZ5lbU/Y/oZjMpbMRJBwXec=; b=Q0cAgd9xjKXxidbk
	vNRG9MuL50gdaPtWv9k6UAeRpyLnT3j4WAL9+UI+jAPN9DzxcWnoPVNKbInaNObh
	p5n3y1K6ngJsk0QXeL19up3rd65EBLD/76Ge0Y0NsxqZX9vdKpVbu41wkSQmKRZ7
	2XSoO3qp5/oq9NbJ6fxozW+BQfefQSQxkguXjBTtv57lbpsrxkIJl5NSJxHcsD4Y
	9v6DDb1GT6VpAEf+MWnkWREvHWU9t5CS/pFFnMFmiRbMsUUnz6eSDtQnmGXivXw6
	x/6oSMR+qDSJzsl/6HuaN5B+sC1jgiSfF7CzC7OWHwCh0990miz3+aqwenYa4mw5
	gmVgDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t2cck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:22:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2958a134514so9715525ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 23:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763623338; x=1764228138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFPI9EtPDbkrhiaKE7kiDZ5lbU/Y/oZjMpbMRJBwXec=;
        b=N169ysYOxOvYsId6wvZXpHn08aBevpI+6/FqtjpfNmYHiB04j8LG654Vs+cxSUZFgG
         NuLDyZ3sHWRoAwNNs7LsMakW2urVzMKVpQqD7/cJ0LwVxfoIiQWnzjsl264nRxhpoyfS
         Jq45Cq8O/5tFLY+OJ2skFk2KaDNN6jQgIAZo4w9yYDH6zbyCuTaSJa+HslfrGaNEuTmv
         CGL0H0k6XVbOwtZXdZBDrnwIQmgqtJ0sbURkD0sTltswhg+NzmyzI3nmsctjqO3eWSQD
         0poK1+MPdjJqmk7wLh8IBsJbICWx3wf0YIAWHDMYCscn1bOd8lftedi/0WDzHbOs+WIt
         xXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763623338; x=1764228138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFPI9EtPDbkrhiaKE7kiDZ5lbU/Y/oZjMpbMRJBwXec=;
        b=g0iGWmHaVnTT41lxUWsVhicBmZpOsOR0wGDYza6KBSY2CL8hWJQSfCz4rcw84lTWit
         /FF0umB3513EGbHgrelRaKqFoLnDHYSF61afT++EgMX8uMvUkLjUXTKNCFUwF8vge/as
         syxGeu5qIgVB+OeV5JnX4NOlBCoKoDasfJw/Gg7ZCBrImNSPlLQmkTJrLsRjpMDcBBSW
         lFmyyY+/waP1qQnpKpKupT5Yj2Wdc6udccDmC2gk3/8WWMPlXNW6qzhXtgjdD95PuN4A
         m8/B9HcTJoE6vWn2PUPkKYrqeHZ2NP703pDAnb1xi21HhKuut1dyxx+a10lxx45EemAk
         4b/Q==
X-Gm-Message-State: AOJu0YyinSfSMCku+O4w/v4sfbOlYMyPvcNR4eTbLyBA2UUgyl8ZmUB5
	dgm+CX1riI61KJ1WNJlDacnbtvGMdYlW+0coy786REYhrqu7ScencSJeSsL08226//EdrKe3G4J
	JUY4GnzMCucE6ACf/WllmcbkG2ohng2/jCinTW/XnALCpimFl7g4nnBVLjEkSP1mu2+3p
X-Gm-Gg: ASbGncsDPtMOJ5L4QGzg1epaPvpxBoUgVCeXArsnQ8GypqxlE/lCdfWYBzoJL3q3LMu
	GR1FQ2pNTWVh+vRgfZGEwqMOJ0i6MGTVWQnmYkF1EtnhvwDhZyP0BrnaFtV/kkWkcKZIDiGjfjm
	PvQRPtJgznOa3vBygkpFuQrrAsHL0p0pnXTmh1khk3b8UXmNCzwvY05ufntGZmfPFqK1Jro3aAp
	J24pYPYAKFyuDwjLIBeQ3vGHVtS/gA1efv/SyzFeV5GturUy2D0z5NuCqYBG6U8dgUskhNoqgv2
	Ehp0MDWfv1ZtvAQH86XUwHS55eU5pXvV9Bl7bxMSss+HHrAjzYQN0sc7/y75mbXLy6hRJD1V6DD
	PV5DNRx5pItUdrcnA8NbEYa03KaqlWLY3i+I9QqTHNO58GpWdStGTM4gGvF1rhvhmYeKcNQWG2R
	1xci+B
X-Received: by 2002:a17:903:2d2:b0:298:321b:2694 with SMTP id d9443c01a7336-29b5b06fe37mr27761685ad.19.1763623337786;
        Wed, 19 Nov 2025 23:22:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaWAuPOH49M8euhZGNrSl9KobWJS9Fk3KBYPR1ck5Aw9u2caKmor6JUMiwOooSngJG7l4y6Q==
X-Received: by 2002:a17:903:2d2:b0:298:321b:2694 with SMTP id d9443c01a7336-29b5b06fe37mr27761435ad.19.1763623337342;
        Wed, 19 Nov 2025 23:22:17 -0800 (PST)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b00e1fasm16496995ad.0.2025.11.19.23.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 23:22:16 -0800 (PST)
Message-ID: <9713492d-dcf6-48e1-91e8-b4a3cec1b33e@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 15:22:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Komal Bajaj <quic_kbajaj@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
 <9085099f-8f6a-48c4-8502-8c94a88d8370@quicinc.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <9085099f-8f6a-48c4-8502-8c94a88d8370@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691ec1aa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9lPpxnAA7Anivib4X8QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hiNu1BefoU91HcMnmjLf7Jglel9tgESe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MSBTYWx0ZWRfXx1dgzcdBfzu/
 SheQJIPHfbzQFMUWY2d4CJ35wMHRcFf4MzqiM/J1aj15Cb88H912k7vBcCQTryhgIyWYDfceh//
 he7wmysNl6eM2G/TYyPfM8319BfIWYIlz9VKQ6fhzUZytuK6WGfdvYBnPESiGihsB03PydujUjh
 EA0bPjgOHdVYoeYZsWFCQ3GgPUM+WXCc50qrBm3zo8OhJZVzRpdVjQiUvmln/LPlmJRC4vih/R1
 6Lffu6WjAaGfPaHVvdhaMERW38JYmcEmcsJW0hPe/AVCTJjmBfFbDRjeIVg6pp8mMLT+9QHs7I1
 nyfjeRYLmTRjKb2xbTowS1+OEqY2ACliz3OGKsS5l/Ba+KzVqwacA5BuP22Kkhi2gsqhkaW1y5k
 U8ke2gOkL7yROqQBCvOC7fi3l98vug==
X-Proofpoint-ORIG-GUID: hiNu1BefoU91HcMnmjLf7Jglel9tgESe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200041



On 11/20/2025 2:53 PM, Komal Bajaj wrote:
> 
> On 9/25/2025 5:47 AM, Jingyi Wang wrote:
>> Kaanapali is Snapdragon SoC from Qualcomm.
>>
>> Features added in this patch:
>> - CPUs with PSCI idle states and cpufreq
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect with CPU BWMONs
>> - QuP with uart
>> - SMMU
>> - RPMHPD
>> - UFS with Inline Crypto Engine
>> - LLCC
>> - Watchdog
>>
>> Written with help from Raviteja Laggyshetty(added interconnect nodes),
>> Taniya Das(added Clock Controllers and cpufreq), Jishnu Prakash
>> (added rpmhpd), Nitin Rawat(added ufs) and Gaurav Kashyap(added ICE).
>>
>> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1320 +++++++++++++++++++++++++++++++
>>   1 file changed, 1320 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> new file mode 100644
>> index 000000000000..b385b4642883
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -0,0 +1,1320 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>> +#include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>> +#include <dt-bindings/firmware/qcom,scm.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>> +#include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/power/qcom-rpmpd.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> 
> Missed to include "kaanapali-ipcc.h"
> 

"kaanapali-ipcc.h" is added in the IPCC v3: 
https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/
so this file will be included in the next version for dts

Thanks,
Jingyi

> ---
> Thanks
> Komal
> 


