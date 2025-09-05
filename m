Return-Path: <linux-arm-msm+bounces-72185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F18B44DF7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131121C2428E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 06:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37E42BE7B5;
	Fri,  5 Sep 2025 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzVtrVzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325A2BDC28
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757053882; cv=none; b=OS42vUVfFFWeECBWZnOTSpRoZpqRBT8JEt+GPLeyYqEh/bObFZ8rAjwc2ukMWr04BrIORXea05jCf7bPnwQDBLQQmG1f7agdGr52dKgENFDsGTxu/OwvLfdih/lPRMFZu4lP0NKYl2k+DN1A+rlFUh7yyv6Gfy3syH3AHCGkSUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757053882; c=relaxed/simple;
	bh=c+qCkBwUcNTbqtKHddqUYexmmRMT9xAUaD45trrVIqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOKZX7r7zkXBW/3PQgVe+v2xm8fneaR1VWyC216bgUP3hRMAmTgMlHp0cm7s27QvfVFPvUX767JNQoWrWDd70Pj2pai4H6pR1ob5qdvpTzVbHcoMUCfMK+4fGMOh1JudP07gZhCfpx1OANa4eObxdxsm3kBLRdpSu8y7mrj5+Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzVtrVzJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HqtD1032336
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 06:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihUchhbr+BPTutSAMH3QPkZ1k4UUvBlJqLlucFmaUzQ=; b=AzVtrVzJcsW7ElbT
	DqPGbcveokIzhJepOdZCV4f3wFdinbwoKmCv3EtfGrbzcUsHDYAwD6hH5EhbODVj
	dWbTjF2IYUA4f1Uf3lo8K27VoTIPcncYjP9qpUBFWz3PSner+u064gTqQro4RWS9
	33g65acPdZRHB2MdJu9Lx2EEx49d5FFgH3O6xGaywnCRxli/foUdEAhDYMyQlmqA
	EafcfT9dOt2z58QRMGjT80f3VK8piYI6eq7K/69Q0O/z/9F65azI20lArTEOswzy
	TSpCHGOOZDjBQ8WOCz41jVRFRmj4+XFAVHYeN6Vi0knWoDKIAEZSbQbr62bBjU5f
	z3q+lg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpj89t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:31:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4e9b55baceso1345035a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 23:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757053878; x=1757658678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihUchhbr+BPTutSAMH3QPkZ1k4UUvBlJqLlucFmaUzQ=;
        b=jKDtNliWDWXy8r7h6LfTtImdjcNtDmlhCPIQX4LssI3xkekb9SfpmnSSUVcSdY6ooM
         qcXTKswsUTMJqgb0Pt9LxhWX1cUJ4Z0dYk3f5dC6pHXGTRLenoCbqsRwhafy9GBwqHfC
         LcupYNt+hwXL61bblRhO3A46Zc8n6lYVqqby/CyIvH+rollAGbRosUFJNnJsQ2RK5sY+
         sC8GTPjFIKCoHigxLh6t0tQ5qaO42fhNb2OvLHwhwujabxlX8tRpputDn9Nop/l8wRuR
         wmsocRJn/gZWMvMfePQN8uus4H2+RTSBevwSC9PwKOCzHEGyl9sZLVSpRZBtAjviWbbk
         HT9Q==
X-Gm-Message-State: AOJu0Yx8fEW510U0bvGom7ICWDDej5SnOed8jNg5sOpk2PbWOQIVuz4p
	cUl9gotqfAZ6t5iF4rJg1/7/6JZ/gGg8fNnQZxEfOY+JGRBH6otsumtD6WaCKYBIKl6TfkwBU77
	7Nb9N5AqhjqzjsmtxgGuxrcn2RkOhAzsCMsFocb5fE9AVzHyQGgqv8XLsCFFSRfQsYdTV
X-Gm-Gg: ASbGnctsyMeSUtG2sdoTIQeHZFdO7ytXJ9qDARUkWMeIlFzMQm+cUXCAE1DPP/po+Ox
	86qlXrNuC2wrCnhhoGfcGgzOoQVFEDfvFV59+E/SC4EyjlVm91VtyP8JHRA2X+148is2mawueeK
	/cXL+hZ0nVdcUmdaqt5QouWkXfiQmgDeXvS/RsMC1zI4xve9XsBr1x8KosW46ncUtg2RcW2bvNC
	Q5csK1C7QUpOxxKuaYvKzcWt9mtX4xEEALEiEhltPqaWFMyv2TxnR/R1lfJ0zZhVi4mc8d3X/DG
	kR/YY4KJwE/IwwdvjQX/STdCmUjhXYJGV8ZmDPkJ0pQ/f9/PFT+ImCiAswZSiS6XkW9TkKq8OC8
	0sFLZfmjk9AhlmyrK9KlfHSdqz27yVRx1
X-Received: by 2002:a05:6a20:1611:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-24e7f5ad1c8mr3634915637.12.1757053878336;
        Thu, 04 Sep 2025 23:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnzYt3qIjxJ2UxKLfHlG3uR/JqPIbskDDWIrtlfTXdYVFfX5BCyUCF90DYXyEmWrm4+f7kkg==
X-Received: by 2002:a05:6a20:1611:b0:240:1e4a:64cc with SMTP id adf61e73a8af0-24e7f5ad1c8mr3634875637.12.1757053877874;
        Thu, 04 Sep 2025 23:31:17 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f80181dacsm12244112a12.40.2025.09.04.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:31:17 -0700 (PDT)
Message-ID: <d7e5cc9c-4918-496f-82de-05924c61d06e@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:31:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
 <20250904-hamoa_initial-v9-3-d73213fa7542@oss.qualcomm.com>
 <cf873dbd-1f97-4796-b973-a0d6ed569f37@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <cf873dbd-1f97-4796-b973-a0d6ed569f37@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J3ramHa0fRHeVq6xSsBGQ1yXOks10qpK
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba83b7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=K1182fJEmGhiR4m-f2wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=M91JV_wKSCcA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: J3ramHa0fRHeVq6xSsBGQ1yXOks10qpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1s2ZRscb7FiP
 vH+OJADulmTtPOo7G6lWiTiutU/GxpDAQNJoer9jAuG/rQzkxk9iV3dwakWom56n0AcqihTc2rd
 bbFVjtnKzc6h604ZQNYQMMqZjBezVT0BGh8B96C/FLszuJsMdXHPpjV5he6lMhtasPMvK4uWC46
 dFvZPwgKCBFPJ+T3eg/DRuvlD/Fb8nOgtEDWVE3clSTbZQoLhkEoVfQlsTGDMLLcV6fF209LWl7
 CyHWH79UZjJfAK28VRKzF+yRSSJqkQ+CuMcFa9NEVauEpLDu6I0zgKu7Dkgbd4h+S9xOaOVmU9E
 zVgbS8xy6f2oHRoyv5YF605httrE5HBx9ycW3utrMFA13oYbJrctfAP6gjxfWAlznYaRM2dpe70
 JHzOAS3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 2025-09-04 23:15, Krzysztof Kozlowski wrote:
> On 04/09/2025 09:48, Yijie Yang wrote:
>> +		#sound-dai-cells = <1>;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0: 115200n8";
> 
> Huh, why bothering with testing prior to sending to mailing list if
> community can work for free...

Sorry I missed this — I’ll fix it.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


