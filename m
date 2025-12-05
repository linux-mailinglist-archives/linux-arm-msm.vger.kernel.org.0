Return-Path: <linux-arm-msm+bounces-84495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CAFCA7E47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255EB30F8F3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 14:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48402877E3;
	Fri,  5 Dec 2025 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnDbn4l6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g70Iikyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059E302149
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943561; cv=none; b=EIrsi8jP2rAm+Bg5oikc3cXpgivz96W8mwH9760LOrlRUmAZsLBUtIDclUxqmhhOIrSIYSkhPjPe9urHvIYPnV/qaSnEL1mIjLoxHGYZc+Bu6+O8himXIud/yfT3Xole8Rlu25En+dF2Y6T+yCT+IIKqVViMx/5eV1qPyT3pdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943561; c=relaxed/simple;
	bh=qgjgRy1MhqI+zYIPTlJkJsa0iUy01gpNRjojIHE4hcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dD2WiePMCLuIFrEfDdYOSGPLiMbiu9bMi7468cAUxHODw7rB0xrFDttNbabkMfPidRGhaStH4+lYZ/3SMudtEsP4J1z0Nn1MAuh2VhfTpqOG6vsox8r7JVjPNUtTKVGiyukGsEm23x1lt0sTkEhXrQo3AjD/eU1zPaZRdFZAies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnDbn4l6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g70Iikyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5DlPOB473756
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 14:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiiUujtI15jg4TX5b4dyidcjhl4DklXzl6YsqkAAS+Q=; b=AnDbn4l6vqmAd2Cc
	NW/SXEIFH/WlPU/MIxhF8zAxjgSwn7p1rbhnJxS7nNzY17EnTAtv8/rgxXrNb4Wy
	fNc3LdPzX3zWwSE7uCFhGYGCCglHv2JcxT6f5+7OcA58q+SOgEnRZuV8Fxyn8LhT
	NkLX+QlNnnTQc6vEyfiF4Sw5zohZLESVDxWrZuNRxJUm9EdX4Ws0f4r52A9qrJP/
	VJ2kweuD2aplTWPyc9yECNbSLlImQzYzJf+g4VJ/ZxFN6JkGXhFKSX03zilo6MUf
	7yQA3m8EJzj18sFFri2TRqqnpuVDnezTyYZaELuzmd3aDX+pkM1z3crKyMH5Rny0
	8iXAuQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ka01gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 14:05:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9208e1976so4115983b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 06:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764943556; x=1765548356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oiiUujtI15jg4TX5b4dyidcjhl4DklXzl6YsqkAAS+Q=;
        b=g70IikybboJi5CI5LTffrHX1ojfUdvMPcgcfk56+TDkviUfKddchLRtQsA0vPcX+G2
         gRx/d9ULePfgJXOfyFmV4zAmjGk1xYz1VaPb8VDCXtDYW4WtAT8i2zU+bNLyyIT6dqW7
         4Iumyai4xfWl3dsb4ZkqZpJlFrqyKVPumpQ7wnKlBHafOI4LQANrXxjslAczSnvOQ9yZ
         Ka4Fmqp0TxZZulN9CehRsY4EutzjJDHaAzztPfvjMe7enNY+nWDGSdov+2pNTZNGnX/j
         iry7xEnOs2EQpdzEd1/FrH4if9LhPszNCt4tY6pOyKlrloAQLb9LxcBAXTdEYSsf1ISy
         EQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764943556; x=1765548356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiiUujtI15jg4TX5b4dyidcjhl4DklXzl6YsqkAAS+Q=;
        b=pnHksIl1ZNnfirAWCsU0OqZsAXqEmhNIWJs6fkMvKjjeTus6VPJXBgFHawIy3lgme9
         Lv5vnXqn3faDLWe/2fNNqddZTfzHNga+en+KzQm4tU0eMJZPiXCNL9pEYtkUef3yJZjn
         9SQ3TRpzM4Ig25o8kGtVaRs3hqoLxT1qm3h29pulVjEXGvsC1m77jMsF8OsCQi9W+cHY
         zmQJ/73PTf3S+Sa4lVsfQ0FRpRovqzfrRQ3/hFnFuOm9szhKJFIdozM2YRpcaYKZ8joD
         ZovhijdoGdufrjcVjuHh6LLpoQtFQ0GuPg2m2f40dEKUwRztdYJzTGrKY8H22+ukhXWa
         aNgg==
X-Forwarded-Encrypted: i=1; AJvYcCXXYebyV8oP9h/+1EgUkBF1HSCny98vhEOpJkswCPujgdXFjN70RgkJ2GG/E30hR2qp6H0+Ypn93sztd9DB@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFFux1uwIMpEDmG13nfEkgdq7JJaDCKnUCnT+HA/dTaRUWQYh
	wTNj9CiMieuBBqjY3q/rwuQDjRmJao3+gVW6173YdG8q5y31v07EmtaE745tc/73huNtVzvkki1
	T8HOsPQWxnHsSKBeWGsSkiRkxWXvDgL8Ahm1ALgHfZUc1+3V9VDhkPqAd83CJwg/xnkKg
X-Gm-Gg: ASbGnctsz8San5nKe5vfNqKlvdnu78vhEKMIJkSYlYOAfosnzz4MdR9BO9LmWfDwWKc
	twgKJJE6DXfXIxxsGQheqiGdNMy9Iq8jGyAB3TNIVdMF5YWXK/pmCT43eEujVUsbepwCiqkhJsR
	1+n3vHohaQcLRcgGdF0SxnFj/W4t07INSpDF+gwlp8vUg6q+IdqSQu4Zz3HW3MOzVf7al7V6G3W
	vcew0r6FTFv0jMMpH0ZdGnVNu9pf0tIpmXhOxR9aDkh4DCRDO70rkP+R7iGegrKxilAiFdPlDG6
	GWUfdq2ogzu52KY0WwhwAG1j/xPbiu4lJEPU2axr+rqQwsULliJUAG0tTNgFufoFAXDfGUeGZco
	E5jEfpoAfKQCir4JwM+e8jpYTmBszH5Sn/Q==
X-Received: by 2002:a05:6a20:3d0f:b0:366:14af:9bbe with SMTP id adf61e73a8af0-36614af9c79mr270688637.72.1764943556395;
        Fri, 05 Dec 2025 06:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAgA9orODpp4Rjh7ULin/QPXV8ZFFMmR+nawulDJMB+XXWkFsNYSBrBeiA5YYZFPjA+0UAQQ==
X-Received: by 2002:a05:6a20:3d0f:b0:366:14af:9bbe with SMTP id adf61e73a8af0-36614af9c79mr270635637.72.1764943555822;
        Fri, 05 Dec 2025 06:05:55 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a2746f95sm5001184a12.30.2025.12.05.06.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 06:05:55 -0800 (PST)
Message-ID: <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:35:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
 <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QSj0R1MLn1oObpLExomkq_0XDOaFSeVT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwMSBTYWx0ZWRfXzt03BkcRagaP
 7Qj4VpTMOFmmFKOUf0Gzlz+PmXdmbc04GIKbh+nO5/hZ7Yk3tFRHfjfEE8AvyGCO2/AKAcnlD4o
 w632zRZ005fUabwtnWQfYVzFuQueEdfdTKLGyigTUZf3LCYD8lLRKird3YqUMoIVCOc6NsgY++o
 OQnlthd8We5oEO82rMzqgzsq4Hbpz0Mp3KCkHoTAVb5CN0icJWWCUcXRXvDviBgtxEu04hbWuqf
 MHVyqIE3hTP9YWBHjvlCA6AaXxJKSBHS9Rn9sidTcnmvXiV7W7ey0xBMY8Cvfz8dby2Yxkb+18D
 lqsuJpSSPNE8+bAJp1LocTAae1fLkRJK8b98BiPyd9vRoAmz7Y/PyznPj1RnrRRwU+DZAw/tvlI
 bJpwh0EwJFGwSxz2H6+OCl+6Aa4NXQ==
X-Authority-Analysis: v=2.4 cv=HOjO14tv c=1 sm=1 tr=0 ts=6932e6c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OEjwK6i1zzq-GUtPt80A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QSj0R1MLn1oObpLExomkq_0XDOaFSeVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050101

On 12/5/2025 7:22 PM, Konrad Dybcio wrote:
> On 12/5/25 2:41 PM, Akhil P Oommen wrote:
>> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>
>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>
>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>> +				compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +				opp-845000000 {
>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>> +				};
>>>>>>
>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>> or mobile parts specifically?
>>>>>
>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>> here.
>>>>
>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>> except the 290Mhz corner. We can remove that one.
>>>>
>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>> speedbins from the mobile variant until that is supported.
>>>
>>> Writing this reply took probably only slightly less time than fixing
>>> the issue.. I really see no point in kicking the can down the road
>>
>> We don't know the speedbin fuse register and the values applicable for
>> this IoT chipset. Currently, there is only a single variant and no SKUs
>> for this chipset. We can add them when those decisions are taken by the
>> relevant folks from Product team.
> 
> If there's only a single variant right now, could you simply read back
> the value and report it where necessary to make sure the internal teams
> are aware?
> 
> There's surely *some* value fused into the cell..

We don't know which register to read at the moment. It could be the hard
fuse register or some soft fuse register at an arbitrary location.

It is better to leave it as it is for now. Who knows, maybe there won't
any SKUs at all.

-Akhil

> 
> Konrad


