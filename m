Return-Path: <linux-arm-msm+bounces-36818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724F9B9E12
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 10:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E17FB21677
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 09:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1F2156F5E;
	Sat,  2 Nov 2024 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOrVB6+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F76136E21
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730538182; cv=none; b=rU0N8aGfB9Yhfg6a2awQ/REDNiDGJJeMX5lR/QiOsktWTDbSnOmT6MeUX6M44/2k17N6jZZ1m45f1BKAXb6MIYc2RdmqZN0G2LmmKlU17Cte8TEb8WF0w5UPTwUta8gqXz3SOw8IPnx+ifwIHnjVExjvbyVGq3Kwotd1gJt56wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730538182; c=relaxed/simple;
	bh=HzU1DeUPcUvBvjQi4CV2MnkDKLQA/sBx5H9IkMcRzLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDqJojzWkuDKN2558YeZMz0dacmNvmgc4s89MBn/yn8IzIJ8jAkh5du2D+0SVOg7G4vKPHnU99wMk4FKgUIx69+KCB5f3IpaNQqIkGLZ8MfYGj2AoVrilk0+JbCW/FAFRZ0TIQFfV/CM567G3qlUbDjOTfTxl59Rjnz6p778/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOrVB6+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A24XYTc020479
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Nov 2024 09:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IemT58dH8wYV0G/gipvzCwLzxZFpLkW+tH4BM+i0Npo=; b=kOrVB6+f6wTeYFNJ
	CBKxDbNWryYEUMZ8AVqdbh3RuCps6THKbZJyhWKY8A35cEB3O0aR4VuiE9Jc/cvi
	/uHwXD6AC7Dt3hPca67I+GPmVlCRLFDXEgXQW0dp7KuHML3VPyNvyJzZnzzIDD4f
	iDVwqvAF2cfzzhTCTUdiXomYjONMPqPCOAjLHV1mdZH9STOymAbSoOv0+P0KAHgq
	/FyVyyEudsGHImyeEyTjWBihZIcZsEGKM7jG3/HlCshYHrPuUDPmt1GuexemXeFO
	kVsVZ7LsMb9CkIIEfW0ECMJB/dXRTDOR3AYqpXoB5+ujYAQ2Y7RlFgDRy3VTUo1i
	08/Y4g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ygc1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 09:03:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe993f230so8264586d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 02:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730538179; x=1731142979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IemT58dH8wYV0G/gipvzCwLzxZFpLkW+tH4BM+i0Npo=;
        b=g5Rh/9QhyNS80qIARLtC/BBxzMIm+QOGWiHFIHuPGxOnMrjxmYrdMSRozDP8gn86Kc
         BkAUtUwPYkfJr7b3XQW6bCZNwauzxxqrenGdb1CDSQf/2/nIqtioSX2U+i2ilhKvFNAt
         Gpe1gMBcVO3IW2inwVfwBjc+VJ51IHg3JyWRfyPUapj+IdRJy9a5oKtvIXh2RHp4BdGn
         DN0ngHpQ14aK5uzwLF7r76Dz19CS6U44ZiCjSXSfOF1f2wl2s7+eXVIp1oXHyftkA16v
         U20rcJm9lW9zUeXNzRSCSLqBzO03hB1vE7Ranzq2gUeD49xj8ZgwqwPLHtIojkIRuF94
         CrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbEX3p3Aq7SxjK9yhzx4bo/3G3utqqnMWilcYsnhfB1a4ojlqdt9bRtbkPVBS2miv6EbdUeQC2ggpEYPKi@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3BymiwZQi0QzoO9Q9ezCOQ/9zdxzhy12tRMFZnWaOmzRK8Rv
	KsOruWR3rKtFHCxJ+FznYeaZy9Um2EjSYIaJO2txEJOrnN3/zVlgAQSUc13Fr0WtDmVikRzxh2v
	nyuDY3CA4v9NNFRMiWipIKyTeoYdN2e/BrPwmbZUqhMT1gsgJI7mm5SAGfHF4JSx9
X-Received: by 2002:a05:620a:1aa0:b0:7b1:4371:8cec with SMTP id af79cd13be357-7b193f0a11emr1699721085a.7.1730538178737;
        Sat, 02 Nov 2024 02:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBQjVeCl8DXjUgVPPr41pa+vh6gteOB9jie80zysVXdyLkPBey/WmVIOyJ8VIhOyTxQj6Qdg==
X-Received: by 2002:a05:620a:1aa0:b0:7b1:4371:8cec with SMTP id af79cd13be357-7b193f0a11emr1699718885a.7.1730538178266;
        Sat, 02 Nov 2024 02:02:58 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56643823sm288208166b.167.2024.11.02.02.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 02:02:57 -0700 (PDT)
Message-ID: <463f6a3d-c9a0-4525-8150-8491d6b60d24@oss.qualcomm.com>
Date: Sat, 2 Nov 2024 10:02:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sar2130p: add QAR2130P board
 file
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
 <20241102-sar2130p-dt-v4-3-60b7220fd0dd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241102-sar2130p-dt-v4-3-60b7220fd0dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: THy1hkHsc86rgeTuGX473Ksa1ZMjoT8A
X-Proofpoint-ORIG-GUID: THy1hkHsc86rgeTuGX473Ksa1ZMjoT8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=850
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411020080

On 2.11.2024 4:03 AM, Dmitry Baryshkov wrote:
> Add board DT file for the Qualcomm Snapdragon AR2 Gen1 Smart Viewer
> Development Kit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

