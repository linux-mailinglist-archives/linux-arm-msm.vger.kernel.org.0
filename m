Return-Path: <linux-arm-msm+bounces-84626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E9CAC18E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 06:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2675330255A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 05:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFEA20E023;
	Mon,  8 Dec 2025 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2ZjtBBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBQJgszd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3DC18C008
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 05:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172926; cv=none; b=VhSmpJs0iUj6/dFqq4Bm8TYnbxGBlH8lbApvcaZx+zpzq+7DcK/brWTjzHF1wjx1/WTKsti16akBYGhUp2VtwQyJ7unUICGZcCnLL7bIrjIuy/ZtAUTZ5ItMak6pOJ8gfzlsFh4EowNlSzOidifccXqltIyv2zCWTuDJRRyW9YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172926; c=relaxed/simple;
	bh=P2VoLVsoP+lFbU8Fwk2vLaVKWkB4aVqFanWP2t3uBbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5Vep3+bBfNbvJHqgBG7x6V5/Rh3GB5U9qwA4Q+KQwE/eeeSZwvuv25uWKcKmG8fOTalK58mCwiI3tR6GFTP9eTsP4BLKpxopq6dIU+Bzs8yDqZ8F7/FG0YYUFVNujPb7m+owr0DBa/n69F9pxTN35M4Vj1SQYONJHBk1HeHC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2ZjtBBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBQJgszd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8434M0109925
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 05:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tyEN6oFgw16Xz4lJHse4pR1jY91ekbIZ4shjSNASNI=; b=S2ZjtBBC3fFo25Yv
	WoeN9jydZjrmHDeSsL2SQ9KYnhV7vavOZDbr2MXGG/GRMGUfbe4xnsbsj8YsBevm
	0mj0YZ7PeQxZuI4Pw79g/F69bBvK8ajZ9p/+TBhW24R/Yr284uaMvWfyGpR6JSDZ
	N5NN6ihcjRq+yq5q50PGtMQbKJoCCQJcp8dr4DcLK7+uLRFBrxGEM4iMmkfRSJBv
	c6pIXwy6if49MAnAFW8zUG0wV7PS7ut5wtlZqynNIeAfMxp0kZtD6hduiztaoTt7
	sVWkTZpXB/actpitNp6nB367Q6acfU70sOwRpp/MQPnimnI4otYjY+CnhHlFe7UQ
	EfHtrA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awqabg6p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 05:48:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299d221b749so76335845ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 21:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172923; x=1765777723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tyEN6oFgw16Xz4lJHse4pR1jY91ekbIZ4shjSNASNI=;
        b=kBQJgszdCdiRFsD5mklOEHhNHf0QftPRouR0u+Tw9omHSzb6nh+62APzBcq38YRANg
         r1KzMR/T//LWa1j7SURYeMOwz5c4rKlyB/G5Iuuv3QHH1euhUnyQMuwq7S+eh4p3VIFg
         KZyx+yvTPEupvaWLdBlRqf2b4FuO4bU9PtqYj+JXks6A9rdg6psCdxjxItgTTiXdvhxU
         AMukxsX+MRaqMbrzoiDJ2tjeNY+04aR2nHg6wmlghy3ptm5wnfSp8Me9UF5DeaQI71S7
         8CZSqJK//8W58s42WWBKTyZv8K5W+fqvZMmnp0rvybgBndmdGoA4RG+QVIFeuPOneAvi
         TaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172923; x=1765777723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tyEN6oFgw16Xz4lJHse4pR1jY91ekbIZ4shjSNASNI=;
        b=ic76XXIrDxB3N8FGv/ZEaSG3u/0im7E0dsYvP1j18vXslRh4LiRv/OF284rs59Vcs3
         iWHk3oCOzOzILv5h38hrShOcw8V171jotWKcxskl4rI03QCJRXQhxJMudkNMZI3OWHnO
         NRJeiag/ua4H9wk9+SCTszMdrrMoObGifrHSBFaZEpNv0UZtb9xWpjzCszihbHHIVplA
         JKhSCYc6JF1Wr1wHcSOUshycDgOqXyJIRKT3PpulRphIE80aop43PRwAur2WCcLio03H
         DqjuukC5zLfaBavLYrRgtVr80uWgEdNZ/w1+R26JAkfJw++eyZ4ocVLZmA9ApTcftRg0
         JzWA==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZXGlPqf9qT45P9rHdL8cHHRnyft6C4FFAun26UK9rrjBFSYZnKpYS1gNnsxJxcWhGTclXxxJj+P9fiV7@vger.kernel.org
X-Gm-Message-State: AOJu0YyKotWDbplyTKn7SeeCdttom8Ck2rJlv1yQMlx8G0hpFFJdA7Bh
	CkYcICXGVb2nLqBaBDgvSNOHLxnYK/gm5QJhYFPAJm8HMM4zYxsgC7H+oKHhllhYY3mqKjMwKN8
	hAsrWou9+bHqDTBx2dAHV9/zVjUrlZWU9SY+kt1vQfOpLyn6N9yTZatepn0+S/llWKvM7Wa+Il5
	bSQtI=
X-Gm-Gg: ASbGncvUW1rOSDNMiUsrNJykOnrKwpjR44hqUyOLtQEoVQ4z0gnUKQa0BABLV0Ba+8v
	Lj6jEPq92B/mWLanDoEOltGh71MSpuJxf3ps9BkEAe8JU/ihSpYAnEQH59zuvRPuHa5zBLR2HW3
	nw3PbKPCZs4POXWBWU5GdSqnmAVTfRad+MPYmWOnO+jsvT1vSpcYuo0gS25oNkWRYFjaM0/tTR8
	KcEICqBMQIsNJWNLL85OMoZ+kuF+YHGGhiCuNsg9jneFu+dBgFIiCUaZ3MSxRG8hXtDxXG3BWvO
	ozkO4qE+vpYt7CdUm1Wiezjrfs34UTvmUr9qSA10lrR6C+ZBojZN9ORAordC3pSydUP1Y7EDnfP
	zo5LakEICgt9SSGI0MVP7vJOKR27KKHfkB2pKZNOyN632lTtYhcVH6AxeNITxAbBGP9SLkQgEox
	xrP9lv
X-Received: by 2002:a17:903:b0e:b0:299:dea1:e795 with SMTP id d9443c01a7336-29df5deb1e1mr49290935ad.44.1765172922594;
        Sun, 07 Dec 2025 21:48:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvpM8y8WsbAjIWAo29vlyowfOsf/6+lie2maWDWdJheAZoF7Arfz9a0tz13FHi/eBSLuKomw==
X-Received: by 2002:a17:903:b0e:b0:299:dea1:e795 with SMTP id d9443c01a7336-29df5deb1e1mr49290745ad.44.1765172922097;
        Sun, 07 Dec 2025 21:48:42 -0800 (PST)
Received: from [10.133.33.182] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c96bsm111202115ad.8.2025.12.07.21.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:48:41 -0800 (PST)
Message-ID: <0922ee2f-e744-487d-adf2-04b6ced0a71e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 13:48:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
 <20251204-knp-dts-v2-3-596d8398c6d3@oss.qualcomm.com>
 <mi52ztn46bjbvcebq7fddntedjvbtvuhjnuin4mq3h45mxihdv@r6opshdsmlbs>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <mi52ztn46bjbvcebq7fddntedjvbtvuhjnuin4mq3h45mxihdv@r6opshdsmlbs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3qZ9oHnX58MK8G6cLSY0N57sFH9bCBzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NyBTYWx0ZWRfX4Ys2zOyZ2Kz+
 dO1XNryyMSphIKxwU9yNuYBrqybqcqll26fGf3h7zK0AVQIVE8mfySwLaDMcZRDd/Pfk6KzLeNw
 Ti1KKF+3TWOgt3oZm94NeXVe04HYpWYL+8VpLjeqswR+OEyGRa3OTQ5xiohWtdEAiZAmJ/QWQAz
 26jQjkhDiVy9ZgQPT636Wwmqy32J8DmTYWt4TeAWEzHjR6MgZWathpeLFyw54QwY+SZNtXOErWz
 pMQpR6mXBIpIGRBzfkGtIll/xvYMfEamdrXXgMcIKEXZ5Ql5CGAp2DZSssx3B3ZUNschg2QYB3b
 2uzgaEyWZvmFFPW+idpdJcJXofSYcnTaQbu8MPmgNa+sKNBFvq9z6zN04xOebhANsuTjmD2pE12
 j/7tb9rjgH3DmbNIm2pTseIzXaq/0w==
X-Proofpoint-GUID: 3qZ9oHnX58MK8G6cLSY0N57sFH9bCBzx
X-Authority-Analysis: v=2.4 cv=f7lFxeyM c=1 sm=1 tr=0 ts=693666bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mxvvBYq0fgLw_0ZU4r4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080047



On 12/6/2025 10:40 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 04, 2025 at 10:31:21PM -0800, Jingyi Wang wrote:
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
>> - QuP with UART
>> - SMMU
>> - RPMhPD
>> - UFS with Inline Crypto Engine
>> - LLCC
>> - Watchdog
>> - SD Card
>> - PCIe
>>
>> Written with help from Raviteja Laggyshetty (added interconnect nodes),
>> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
>> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
>> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
>>
>> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>>  1 file changed, 1606 insertions(+)
> 
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		pdp_mem: pdp_region@81300000 {
> 
> No underscores in node names
> 
>> +			reg = <0x0 0x81300000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		aop_cmd_db_mem: aop-cmd-db@81c60000 {
>> +			compatible = "qcom,cmd-db";
>> +			reg = <0x0 0x81c60000 0x0 0x20000>;
>> +			no-map;
>> +		};
>> +
>> +		smem_mem: smem@81d00000 {
>> +			compatible = "qcom,smem";
>> +			reg = <0x0 0x81d00000 0x0 0x200000>;
>> +			hwlocks = <&tcsr_mutex 3>;
>> +			no-map;
>> +		};
>> +
>> +		pdp_ns_shared_mem: pdp_ns_shared_region@81f00000 {
> 
> And here
> 

Will fix

Thanks,
Jingyi

>> +			reg = <0x0 0x81f00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
> 


