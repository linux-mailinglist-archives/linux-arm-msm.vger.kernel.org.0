Return-Path: <linux-arm-msm+bounces-67182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63AB16462
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1651883E33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA0F2E06E6;
	Wed, 30 Jul 2025 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWdheP60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986952DEA86
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753891820; cv=none; b=nrCUCkR67tUevkhoOrViWIl2YuwLqSHfT13AJDsuK5MV5DC839VrIIjq9EouFbzErj5Np4vy0ArOM4IoGJ8evruSHmJx3djd7IOR4uWMxqJ14wKorjzJYxup6YsLkIL+CflriAmNBFBl5DnE1YHIREvGKxvhO9KavQ5cQfR0BpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753891820; c=relaxed/simple;
	bh=AQ6vuDxhEytlekZaYlH8XfS4ZO3JTfZECFeATrSwhLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nc+JQrTnpJ10Rwyo3yrfiBUyWO/xU5PYE+RPomkf7862yjcIDvZr5RKU7sLl8Zdd06OcaZoiLbQbBfGAuOAjxH5Rz6WvuF345selsY21o6HOrI5YW7ThezC7znDPd8+QMqCsEG5ewYe/FZFSmAg2/ox8fSxD4bNObMfERLBFMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWdheP60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb82v017589
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIHRX0L2loDM3GRbyCm/tSaU7Q+F+UpeXTABbm/Giv8=; b=hWdheP60guVymOht
	8iShteoXLTmdJa8ln29N8pPLihRsAJphbTJ/nwWoFJxWtYt0RAK89NkDMRuIZn2m
	mIXG37LYpBEMFRxsqYsqVinHJVGDWHIekGqXlaLggE5jjpz9OsrrBSZWswTE03dq
	FSnkrnpWMWnDEZ0E2JdA21D3nTJlS8/p6stJUkbhh4Q/zjFbA6JaQuvf7eAdN5rB
	NaBsl1ZhQUanyg97QEO0DF4Qwz8qdjzvA6NMxKDfg1VqWxSACIVn+eSVOYX2n7M6
	LkgAhN/qil3GZycj1qLJ5z6UXVKPjucjwljpBDRRrJRiRcYSCVHKrIRzArKGh/ep
	UCQJ5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda4bnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:10:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23ff7d61fb7so9400315ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 09:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753891816; x=1754496616;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIHRX0L2loDM3GRbyCm/tSaU7Q+F+UpeXTABbm/Giv8=;
        b=Kpt14TbjIwsd06B8HnLQb71FxWE3by/bMr2ZmxfXYLHs+X+t1mb4rjzcRW0cEIJ7HS
         xZSon9tQVlszYf3C4+sAFwcEq7ZPn2kpxPCH7Fono4l/XdgBXraNHuqOMSTHITfjk7Zu
         8pvX6T6vjtwKsxsg6MdirRW6VXZYpTX9WmhHtJJ0kXUWEtYs8fgZlIxWmAcbocYD4NAd
         Sxtq1Rd8f4PnjJaGvPag3v+6nsS6bqL8Qc8tJBXGlGeIA5SBuEtXArMAifd9x4t+cGFz
         ogarDKydp+kb99CO6YJr/kM5wxPD+U9UOJ/pVMnAMb18KDLkb5js6cRc/K04xcWgcxm6
         ndtA==
X-Forwarded-Encrypted: i=1; AJvYcCVB3qNtgReujrJ/4kJgkXdclFplLl9vB4efEy/nVx5+RtVo0LyQKhznmqeI1gQ8iRnh0b4o8Epn8WMdOMyk@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ1TM02n7GPTucE/2W+UScX92UWsWGR3lBhIlp7q6odkV/uZy4
	PIFuqomPsFE96UURIeVPGCyWKNtXgfbiKMfehdGrl3FKAoQOHs4g4eCd4VwCjlrM+RB/Tn3+Itr
	m54ky/aAokwncFIFsEDZigfGt3NadNANB9Aim+1x9ppVFU5DBjxejEgLYV1wlawrIGQ5A8xCpc3
	dR
X-Gm-Gg: ASbGncsIhArAwfMtegZvI/HER2pwwEJubvv1BlPPIIT7dp84PUdK3JsY7WUdDd8ETSj
	Is9KLwF45MP/RsSZSjkPJiIjbpOSXcufdX/8esdL4ZOzs19KAjfft38yPzMvi/FgRwBsg5bw4Gf
	5YMlNwutU4uGsJZ5hoQvZcHSGQLvOS0rScIulKP+w9zpWl1kM15Ict3dO0/3G2QwMNLh8ZFqR9f
	Ux5VDa2sTPqen3ILCDhV0gE01FJVrnL2hKTXRglUO0smFe1L5Hd3DFgrhqCpSLx3rtr+oJr1Bdo
	+/Gie8wR3s7OFvfUjBTkScrx7+bKJ/DPHND6l7qHb9D27573HD3c6CC7sZdP3hy8
X-Received: by 2002:a17:903:2f87:b0:240:b630:e600 with SMTP id d9443c01a7336-240b630e7admr27941675ad.11.1753891815796;
        Wed, 30 Jul 2025 09:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESpaWOxmNYWoJxFhgXCazhVQZS2S0Iu1Mkn/tVp0EPP8Wf9SOkPH5bbEOsVSgOrIyQZIT8Lg==
X-Received: by 2002:a17:903:2f87:b0:240:b630:e600 with SMTP id d9443c01a7336-240b630e7admr27941245ad.11.1753891815298;
        Wed, 30 Jul 2025 09:10:15 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401a335b37sm77767365ad.124.2025.07.30.09.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 09:10:14 -0700 (PDT)
Message-ID: <d11496a2-5a43-4b6b-9a8a-d8e05a89587a@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 21:40:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com>
 <20250702-qcs615-mm-cpu-dt-v4-v5-2-df24896cbb26@quicinc.com>
 <ff6eee04-d191-4dfb-82e5-7e3a6c896025@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ff6eee04-d191-4dfb-82e5-7e3a6c896025@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZgYDHb2Yk4mX7jjP-qVbTdi87Rd-qit0
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a43e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HRpvt/FSzHA3SJMKks594A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=J94FwCPnZ0hQmDvvoVYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZgYDHb2Yk4mX7jjP-qVbTdi87Rd-qit0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDExNyBTYWx0ZWRfX5th0p6uOdSHz
 RpCWmme6qzPweBYSTi42JouNnheVEKOS3D8h/UHzRKR0e1F7lkAohjfekLadfpFtATIQbQyBopN
 L3Hmf3ITr4TItMehd5yTn64C8cY4wiHKrqjnlqBtJsnTGbRTY/rjbSRU7pbYtZugE+Z+L/FcTBE
 kYkgDTPwwI6UlYx/bHMusPV1wAkOmvN9TrYEM9+b1sAHiVRWm6QJiF69a3f8gke9Zglydcxiw90
 hQHeuEVKhytGJyOaFbGkm3FC6NsREmCG4vOjWPdjd7y/xPLj/lnei1ZwO1O9TXr+XgoqqGPkyYa
 zMaokKWwpQkJiOmfXb2FhxsJ8mtdI53KyoI7PAgd8XwmFAeEIPgCSKShIec8P3kJL++ny+r4/X9
 ISGs4JoRgxmUYbe2tRIeeaOf2GgMpMhi0keLJippSxISJmRg/N3PvavQO24Ck0lLl3c2UbdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=989 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300117

On 7/30/2025 7:07 PM, Konrad Dybcio wrote:
> On 7/2/25 11:13 AM, Taniya Das wrote:
>> Add support for video, camera, display and gpu clock controller nodes
>> for QCS615 platform.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Bjorn mentioned offline that these controllers should
> probably have power-domains attached to them (perhaps bar
> GPU_CC, that's under discussion..)

QCS615 has an rgmu which doesn't manage gpucc. So this is a different
case from the other discussion. Are we talking about scaling mx and cx
rail while setting clk rate? Downstream clk driver does that on behalf
of the clients. I suppose you are not talking about that here.

-Akhil.

> 
> Konrad
> 


