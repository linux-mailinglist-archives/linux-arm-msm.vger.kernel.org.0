Return-Path: <linux-arm-msm+bounces-46230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA3A1D4DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD6683A72CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338C01FE449;
	Mon, 27 Jan 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPkEyI3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C91FDE24
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975262; cv=none; b=VQjvN4SxdCtkjXqMYe6j5SZWf6DhEGKbvuPRWHNm+j0SiBqzEYOtkA0nPHUjMsZ6cIMqc361mqBWkt3ecJjbC7OK/2KunrT/lQhaYTFiY7jIsWps4IRYiB0oVSG8qlyzQuZcmG4At7gLUtMSRlJrkm+sTu4Iz9IsbraVwCEPwQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975262; c=relaxed/simple;
	bh=eoUjWMI2xXVc1bCu26t67OLjDxGsCRPjEglWJrKmVa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pw1dVz7gwRv1iO8AdCbugyjDK+4Whpwh6WI/S6MBDpQtm89pA99tDozBJz3wTwXWhHJKr4wh8QljP+b2dydxSqVaE/kkH9nLXs2VZNwStboop7MHWn7A5W+XFlBAekHZ7MojRogYptrFzpQcCfNdes+i2DN+rltpvQIfC25Pvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPkEyI3a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4krUt018789
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9HKj4wDiL7xDBm3wgQ+V7mP8yHsPldSV25Xyv02u98=; b=iPkEyI3aE2F0BFtG
	MfR8SklglgAlcvxJ0eYsMXFhHnPa1weS+jlRkzpJBOU4CKAibosWMlS1UrgmwzhM
	RSfax7RlAkGhVs+VJi1yT3ABIkNElI5cMXrg2MkeOf1ayKaE+P5Sz+GX72fEycWC
	myC1mcT0Gx6LeKlG0MiaA+ERl0kPegRpLAODz110nwMCEzJ67UmnUiCfji9Tw63C
	vNUM2sl9CpXRtTNXs+0nfdp2osdqbQB48QhPDOeM0u3PlLeiq3sXHDw7Bb9lEPcS
	a/dANSRyfRYvoeRedN7jyKKVg6F/Brmp1oCRad48s3LJzBEG/K6aL9D2SsAI6x+u
	utetXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3dr0pd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:54:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46e4842dbd0so14195321cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975258; x=1738580058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9HKj4wDiL7xDBm3wgQ+V7mP8yHsPldSV25Xyv02u98=;
        b=kK4PWGvVRnfZE49vxCYQ/pbE9gAxyS0t31wN3aeCS2Ihi9Q6QxhNSXLHXUW/WfC++k
         IKq9vkYllpFxWUd3BwQeQ8bf/xlvPN4JRxHyy7j2pZg5nH/aHcLdzNGCaPblIytC3eDb
         8apH+lP3/qgG8ggSSOyhy8fQ4BAXwE/iTvS4dwbFwimmH7q5Wpf24DejHizawnca6WsX
         eaujLtL/IzEi0Ehxeb9ikEZIPGdy7slqYeY75MsoAwlDQjLq+cQqMkQBqG2HeKKu1yY9
         hhKHmhmqxj5nj/LGp0ll2axYEBvAxk042cRTDvqBIIp60dlKz4CJgp8nC8zXWrJmLGUB
         OwiA==
X-Forwarded-Encrypted: i=1; AJvYcCWYA/FXADPAQGCus7vOhqZ1BMWj+eHuo4maOAQrCf3PgXx13UrvehryZJ/ZJ+9AEF/sLRsVtgFs2mPyIgRW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7F+e08nN4wjIp8r8n4obXi7OxFecbw3pT23rcvobe3enIi2Wv
	jovRKFRaFQdChWQvcsRCUtLSNXqpnDOsNmUdAX7856SEPfcXCCD8VrbNrZK276AavVsn5c35fJg
	mRRyXGChti/dPUxdeyA/7f1YuaqFrGCDzvInNzSsa36PZzMGNxmI3tTWviokx8PWJ
X-Gm-Gg: ASbGnctXglRnG7luqaNV/j9fx9eHOuxG6Z/mNXEdbCdJG6tMjxycZa/d913s3nwEre5
	B8DfpaJbMgo0pO7JnL5CYONWUvFu4CcREcSoSEwG/wtCOfENAYht1Y7fcwR5UzlYISM1I4kWslk
	Rx4aAksefUXD0tUgrv9yqQFH+L+gpM2mGo6HkXMZItg2t2xtclO6nL238ZkPX7qz5sMD8/XXfVq
	oCk4DEJ8WZZ6RwzLLYsDCeg5249nfgjSznSlXwMRhaBuZYbKsJqFvi5uszVE1FeqDhUjFTejZk+
	lc+Zc8CoVHVFOpgQMwcpt6nUWsqGZstS6H8lWcuB9p+qz1na0hckAvJpsUM=
X-Received: by 2002:a05:620a:4252:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7be6320aecbmr2022596885a.7.1737975258618;
        Mon, 27 Jan 2025 02:54:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLegkOXqfbmbDmOnvnddwfCzVxW7OtwuWsxf6by4w3Z0CSPVtQurx3VlxhCgCSewn5FxVG2Q==
X-Received: by 2002:a05:620a:4252:b0:7b6:d252:b4e8 with SMTP id af79cd13be357-7be6320aecbmr2022595585a.7.1737975258230;
        Mon, 27 Jan 2025 02:54:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e64dc9sm552735366b.45.2025.01.27.02.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:54:17 -0800 (PST)
Message-ID: <817ae72c-babc-4d87-b935-010b1651d301@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_manafm@quicinc.com
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
 <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com>
 <scfoxmstfqgvqmxovb7h5gulh6bjhgexs6yxe2n75izc7sawby@djphyr2ilei3>
 <97f5f5b1-b4f9-4d0d-88fb-4c7a0f1c26ac@quicinc.com>
 <CAA8EJppOHw5u_dMW=uXgyp3NSJmv9fwNvEL63NCqOpXUKPz5vA@mail.gmail.com>
 <608afa23-ca4e-48dd-b929-4466560a7e61@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <608afa23-ca4e-48dd-b929-4466560a7e61@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aEEKgqNS8GOgYEKwYP2EewQ1SlTkCpIB
X-Proofpoint-GUID: aEEKgqNS8GOgYEKwYP2EewQ1SlTkCpIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270087

On 20.01.2025 11:57 AM, Taniya Das wrote:
> 
> 
> On 1/20/2025 4:06 PM, Dmitry Baryshkov wrote:
>> On Mon, 20 Jan 2025 at 12:34, Taniya Das <quic_tdas@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 1/20/2025 2:16 PM, Dmitry Baryshkov wrote:
>>>>>> This doesn't follow the bindings, does it?
>>>>> I will add and re-use the closest target compatible.
>>>>>
>>>>>>> +          reg = <0 0x18323000 0 0x1400>,
>>>>>>> +                <0 0x18325800 0 0x1400>;
>>>>>>> +          reg-names = "freq-domain0", "freq-domain1";
>>>>>>> +
>>>>>>> +          clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>>>>>>> +          clock-names = "xo", "alternate";
>>>>>> Are the DCVSH interrupts?
>>>>>>
>>>>> This target does not have DCVSH interrupts directly connected to the
>>>>> CPUFREQ-HW.
>>>> So, does it require a separate LMH driver, like the one used for sdm845?
>>>
>>> I will check how it is handled on QCS615 as it is closer to SC7180 and I
>>> didn't see any LMH handling there as well.
>>
>> At least sm6150-thermal.dtsi declares two LMH blocks.
> 
> QCS615 also has 2 LMH blocks, but the handling of interrupts will be done from the LMH driver, integration with CPUFREQ-HW driver is still under evaluation.

Currently platforms from the 8150 era, using drivers/thermal/qcom/lmh.c
expose the LMH device as an irqchip and pass the per-instance IRQ it
provides to cpufreq, instead of the latter directly consuming a GIC irq

Konrad

