Return-Path: <linux-arm-msm+bounces-84786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01305CB0678
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 16:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C655B3014F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2306F283FE5;
	Tue,  9 Dec 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRwKEgp+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an7m/txg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AD2FFDE1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765294276; cv=none; b=R99F73ry3b+vansqOXZECRdBD8bTUnqqii3iMekt+keoDOjVuak8byyPJosftChGspv+t1nXt5hFElOtgGp6jk027eUxnY0HLLOq4Zm6DkiB/oTrSWubGWQU4AzulsiMlo0Zkz7/pbDbga4wDOHgvmitb6l5BfSyZU63iDTWuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765294276; c=relaxed/simple;
	bh=KCb30gx7f4oKZDZUU0e+gs3C4HrrmkkGV6npmE6kIAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eo31teArqvBmtC3A93jCIatt7HMaWGNDaRd8h0heAjTRo8uqeomX1zk7/dAdYLPBuHiDMhdJEIi4cyT8vej4sMj8lS7uWR428WMhtpJMbrOIzF/zZ66loL5j+DwwNj4Puw9NBQiofIP2YQTkFzVlFr4sc2SBrUYAMXSw4AW4SfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRwKEgp+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an7m/txg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9FUuPi4117121
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 15:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thb0hjUV4NRW58vBjYa9I4NxttjPT7GRJDee8NVVxG4=; b=GRwKEgp+V0GKlm7O
	y7Ts4UQZFHj4YRxIVr35wnfy7nNEGyOphYc4Ac4W4/d/JR+O6AiceTJRwRH+sc9J
	JazRnhTYLwyg7wM29LKU6c03rSAfxXdb/7nNtKXp1dSO/zXw3TJIys0ONTODaCLd
	ZD6jtd6n9h8VQls4DQautq2yNiNYPcX43EH2PzOGU4NDUZT7VDoDdFgPt/osjIUQ
	swselhcdJ02SMtMiFIWztSsw5xERoqWGNxxLK1pTmhTbDTNqNuSxc4PGTPYlZfOO
	L7QbZi3ae8ALGrzLoY5q6VrUl3yPopuPZygxbksh7uDMvoBo0c+XqJe0a9dCsOSf
	Q1dkXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axherh26m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:31:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so6036260a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765294272; x=1765899072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thb0hjUV4NRW58vBjYa9I4NxttjPT7GRJDee8NVVxG4=;
        b=an7m/txgU+iDhXkm/FdryJdYrolyJf/4cNMEFPZbYGHTOG3ZLsT3I9V91VZUa1BoK+
         wt8hbmVEubhLXjxNZavlytA6a5vfcIPjjVkXJQE1QIJ3ZvzHZhUOg9nrt89vW7iVWoBE
         11aRkBjdBSQ/Ps2qRa6Ca8swf44s+l/uOvQjsbI+PfcyD1xKHFHYUFTKU5xfRZhY+WWl
         ety9noz+tSj7gMUq6wN2rIBMY0+exPyQ/P2dIC82wdTxB9oXVSzJHMuXh3yWZQA63nlM
         1ZjDR5hFtVs414Tt9uizvdWnyT6X1xKG1MQXLrQTxrXgM+44JYfM128EKuOyfuBFPZQI
         SBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294272; x=1765899072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thb0hjUV4NRW58vBjYa9I4NxttjPT7GRJDee8NVVxG4=;
        b=QLXvMZ2maXVhXVRw4v0A5eaYkSWdAR+MMjpzcMdarye7qT6X7KG76rZ64z0wP3lvDZ
         CWX/8lxCc8VfJH4sMv+q11MxOvdhWQOrnexTccf5+XeW64EEfBLFjNHLwHw/FuhlcRzq
         Ucuv+haNIEQ0bU/H4RUz4vuFU45CL+pLyNH7QfuSkY/QXyjWFfyd5zD34pljnZHCH1OH
         7rwhL/gxqq9DKRiMjHAT7Nl7vX1y+KRWvo93eKdFSwXUdTFjjDaB07W07ztXhJcD/sXr
         rAE/jhXio1M3LP8YvUTaRTt0yJ6V0JLvRw3pZE/prhBhTrpIJ2qO+SMooBg9FrWzq6Ct
         IR2g==
X-Forwarded-Encrypted: i=1; AJvYcCX97WWzO1P1E20Y2ftGTzVOmqlS4HcRhVeHdQB6BCZkd7EY7zyL5ZS6awdZ9CljzUFez1y+yZpiFYcO9iLe@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUXxrIAd1MMKnwo7G0d2Oenr2alYgVoObwoH0vxroJlaieQfK
	s0OF//sr4jAixVpvrWmAXgjWikjtuLEw5DCML7y8aywImKTE2P9bKAUzOI4HaBlXch/sb71yqMA
	KiI/EIP6CVFGcHF1RWSr7yfKm/lWtm9wn0+vQG1cP2hcRaZlk+S1W9oL70x57wNsoA8CQ
X-Gm-Gg: ASbGncs/bXodcUW94ZInTY0wytc8+5NXTutGE0hQKcfg3NghHj9HYKdaPZB2XSkzU5K
	ZzN+FMeHBhBN7f9r6wtegfiCWS7/iYh5Udq+kgMFiQSvO43qRwtSe83Gh7FZOWm59baIwfUOdx0
	oP0Z4eoj+UVdr73c6TvY4j2c6OSut8BC3QEJ2MnHcTOdPQQCpzwrjgY3xuVrEx254vgXmOqOVvo
	LyolgFgay1g2staQHaFprh8r8bxrPIaLkG98JRKdTKDkfMalbociYzuzeOdGcJWU7ZCXX65XYHh
	aXxI+YpSZSJHfyjq+baUQSl2f9c0DXvSU/vChSkfde22SBiylswNDSMU80qAkwPqbB9Va4q3Je4
	2n0JC7G2cy5n+Ywc2EmamYdUV6GETkUVJLPTx4LqMaj5wog==
X-Received: by 2002:a05:7022:4289:b0:11b:fe75:d03 with SMTP id a92af1059eb24-11e0315ee80mr8364237c88.8.1765294272450;
        Tue, 09 Dec 2025 07:31:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9WxP/KWShg/hGEgDY14g8/pXhFx/huFNzQ7Xe9WB9pU56V2oDPS7bXrRuHGDh4G3Pps7B4Q==
X-Received: by 2002:a05:7022:4289:b0:11b:fe75:d03 with SMTP id a92af1059eb24-11e0315ee80mr8364208c88.8.1765294271684;
        Tue, 09 Dec 2025 07:31:11 -0800 (PST)
Received: from [192.168.1.3] ([122.177.247.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552defsm72868773c88.2.2025.12.09.07.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 07:31:11 -0800 (PST)
Message-ID: <e41753b8-c4d4-4c4c-87d2-4475cc17f1f1@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 21:01:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com>
 <6awlcjah2ajwzxzdvoch5e3vn2ztvxyjdbikffhp6efti3f4wt@swhugoqsmf6z>
 <34aabb90-c81c-43eb-ba95-024f97d91afb@oss.qualcomm.com>
 <j62ntbrmol7qjqcuey3har3d74gqt573ew67w7nrnnhv3pzrnj@hptvrfbeaobs>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <j62ntbrmol7qjqcuey3har3d74gqt573ew67w7nrnnhv3pzrnj@hptvrfbeaobs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExNiBTYWx0ZWRfX0kH4TMwjZkL3
 qbihVYJK/jFFjQwAzjjBK8sbFsmSVhqChyAp7nQQXvsuGfwCKWuI1Ge33nnwbitSpbxsJTynBC0
 w3BB2JKNd9GVhscKT2jVQQ7RDeUlHLO8Jom/u/gDkWjuh5rIoeoOEZF6Qh7h9ZHmwUaSTFNVehz
 FZKWP3Rxml6W9Ki2dOtGjd2/Gy0npxzKvgNDslMenv6HfGTIR7vZRbuBYdI7tQKpimNu4+5cukb
 h/epnrh0oVpdOTLsz1jHRLC8Eh9My04vi5YHIBuXYspaEfKfYzJ5wBm5GpRrSai89W4M2kuNybQ
 JAJtLxX4avfKoWPW6VNIJLwZqkZgADGCsW7NtMcap5IUIaR7XtpojG6Aim8NOqsCOEgk+nQx/ys
 3EQFpV/Dvc7TjBeJt2oqmypIdmEPKw==
X-Proofpoint-ORIG-GUID: QKAr4uS1HS5fvsEv1p1EZ369FdEg9pu5
X-Proofpoint-GUID: QKAr4uS1HS5fvsEv1p1EZ369FdEg9pu5
X-Authority-Analysis: v=2.4 cv=P7M3RyAu c=1 sm=1 tr=0 ts=693840c1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=E0qm/x4VGr2IK/H1a0Uz4A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=zC5czPtbmswiYTL7XGkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090116



On 12/9/2025 8:49 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 09, 2025 at 01:31:10PM +0530, Krishna Kurapati wrote:
>>
>>
>> On 12/9/2025 1:22 PM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 09, 2025 at 09:47:01AM +0530, Krishna Kurapati wrote:
>>>> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
>>>> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
>>>> regulator, controlled from PMIC GPIOs.
>>>>
>>>> Add the necessary regulators and GPIO configuration to power these.
>>>
>>> Should this also include corresponding USB-A connector devices? See
>>> qcs6490-radxa-dragon-q6a.dts for the example of how to describe them.
>>>
>>
>> Hi Dmitry,
>>
>>   I see same discussion that came up when we were trying to upstream TypeA
>> connectors of SA8295:
>> 	
>> https://lore.kernel.org/all/CAA8EJppf+j6H8vPOrer1Oj6SuM=qHKXoBahtCaCr7an-cbpyOQ@mail.gmail.com/
>>
>> There is no entity (either phy or dwc3) as of today that can read the vbus
>> from connector-A node and use it. So keeping these regulators always on for
>> now.
> 
> There are two distinct questions:
> - one is how you describe the board and onboard devices / connectors
> - another one is how to make sure VBus is enabled.
> 
> I'd suggest having full description (with connectors, graph links
> between USB host and connector and vbus-supply properties) and then
> having the comment before regulator-always-on describing why it's on.
> 

Thanks for the review Dmitry. So, IIUC, the suggestion is to add the 
connector nodes for Type-A ports, add the vbus in the connector and mark 
the vbus regulator nodes as always ON.

W.r.t the graph nodes, we can't link the connector to any available node 
today. Can we leave the remote endpoints empty and unlinked to anything.

Regards,
Krishna,

