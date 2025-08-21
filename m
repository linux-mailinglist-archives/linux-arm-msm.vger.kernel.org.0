Return-Path: <linux-arm-msm+bounces-70036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64798B2EB29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 04:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCDE23AC7EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 02:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9C9220685;
	Thu, 21 Aug 2025 02:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mx8Xv+UK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA321D3F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755742938; cv=none; b=H2UasxoQt9TgyaS1V49LbKzVHmbWNRUsuRDPEWrn5Skj7SgHpaz3CixnfShgnzWELjdxdtUPXrGuwfIsbPO7X096rPTSmvmtAwxOzV5SIMetfTXFTU/+qPTiI8Ypvb+vwgEjxnU8qaHgVWK9DJi875pelCjnwJ+Iye9FDtVJqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755742938; c=relaxed/simple;
	bh=M+Tt7lOyvwNBEVxje7vB5+qnUcdtvBNxt4rOINYoqf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaeushnIAbI9whjymwk4FGz0jFHH4TQCaS5mn8YpzvRFWE2Hr7hA1n2XR6HmVlgitebu24hPoLDFPRxxZV+m9ev1bFwqlXPIIiZ5GsqGWPOQxqxQaF+XOocEMBjzuNy4j+FgRrYrLWZxN1WdG1o84FUfRcWTl1aH468nvVxM/Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mx8Xv+UK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KMx9Ig024582
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=; b=mx8Xv+UKFekjgIea
	zpwoOjBGpC8vG24HybBj9dFPUt5QlmnxYQI1nLF8qREnKjpKlPZWWhwvbIQSm75g
	AcfvH8kA10kv7f/86IZhqHh0uayUClUfBvRuLXE/AJBKZPrNY2mJlOufKoHv0fVy
	c0OBFnzpDknd9ZbpLkJ98UFg9FM+oxyx+q7o3t19K0C754pSN2QwlwdVhOeGq05S
	wyA/ACFZPVgH4tfzv/wZNXwBN7MwYWzXTMeO+citUmkwfWKIixxOuoUwhJzeacWI
	NaBtSrWeTcKHyU4ig+xdplvCIu80jwleequB4k36qWtceMtk4klLI/tzwrWQemCl
	SJD2FQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52abpy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:22:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32326e2f184so1136644a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 19:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755742936; x=1756347736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhuQQAYtkFz1+EMzbo9h41xY8JijUtMlK2wIkAFemmg=;
        b=kMrkH5gUP40yfyNBBwtHc4Qw5qyisIyKaBBE6cLjPs5P5i/Xhu3mJ/Lvsqmstcyscs
         FSq8KEK7fJyyE6WbmxHiWXoU19txCyvf0e90U05750rHlkju6amjDhkp8zuu5ZWZ1pyp
         QB2o+qydPSQq0JLBfdKaG4XX4r6fKVzz5fO5OwJqoB1LPXfiO9y4lvNt8i8Dm4IS1QVi
         1tWAVHqq1wMeFhhjfPwEWngpvAAHSxU2N5iboyZxSdrYKNZnIfbmTU3VNEeXgIzINAr3
         5HYV1jRnfZ9847wwVNmPFRc6adrje4Fqysd2K+re7Lw4w3zXPLhSTolWrKxAZ+cvC/cD
         fKCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaNMqUHlGYcg+dZvgqScJpYyVeI5H5owUNc00aPSnq++IubDHwoY4z2JgyMaOxKbcraHHG91T1gChakT2O@vger.kernel.org
X-Gm-Message-State: AOJu0YwuYKIV3MD7+UL8ZOSYlSLBw1Up9PBeFlW4qfYt1/K0zT6VXUb7
	4Tf9SttAZQpi5Jr97A+SZ4DvEmzqw/P55Lh5BETq3GAf2+fBPQkJ4yKbRrIAri0QZ1T47/XkbP4
	abasXu5ezvdt7751ygHTp0EDYKleQ+marFpn0mxjB12czHPmAOJof5b38kjiwMYD108p4
X-Gm-Gg: ASbGncuQW2YA2xxz4/wsJ6CMdPqc6PiDwu9hWcwJVXgsF3LuJsx6gopvk7GTNpKNVxN
	uHfP5GhoKBJrVrB5QvLonD1Pq+UUdn2Xb/OsFI8fdkc7QGq/L3VJzMT7Zg1AajXzG4037zWp3HY
	JLlOVI1SonaVg+x9Gq7iXxUD761T1sNdys3f5Bq9nWfBkVBPY9nq45fb/To76zgQiONd/7DImSP
	yMGLdHvQptew/Yh0OVlaGSep45B/b0VK5qC03N44Wvjus6rarTiyZZnM3qYa8GUHB8WCqkMYlV3
	5NygjMNrb0rlFLG8D0BLolhiNiw3o0Woscc8o7qSHQsINkdy4C+6ziF0wmcMKssoLtyGDkpujrX
	url1v3JENrH7mRPTOW1Gc9UUKrmaiTJfg
X-Received: by 2002:a17:90b:53c4:b0:324:e642:b5ca with SMTP id 98e67ed59e1d1-324ed13a72dmr1379003a91.29.1755742935703;
        Wed, 20 Aug 2025 19:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJRz4sysTqGhrRLL4dSQy2QlK07feYrDXxAVKB+n79aOM7MsuZWRLWFY/xgGqdwpBUmHYgnw==
X-Received: by 2002:a17:90b:53c4:b0:324:e642:b5ca with SMTP id 98e67ed59e1d1-324ed13a72dmr1378979a91.29.1755742935196;
        Wed, 20 Aug 2025 19:22:15 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f23d745csm356703a91.4.2025.08.20.19.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 19:22:14 -0700 (PDT)
Message-ID: <f467aade-e604-448d-b23e-9b169c30ff2e@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 10:22:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
 <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <80a60564-3174-4edd-a57c-706431f2ad91@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5XON_Ns7wiUJ-dq_iETbtFMS_pVtvlUI
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a682d8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uddfqdTxQVX4ueY0IN0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5XON_Ns7wiUJ-dq_iETbtFMS_pVtvlUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX38R5kLmtsfU9
 0Z0xxTD/hwEzg2mpWDruAV6S9sfDLA+cIXcaskTVzhxnUaT+pnp83k4kKPj3c3HdS35l3r3MQW6
 637T+6o9chCuuItTaQPnRJQJDKXa+77kTQ4Pb4dxNYMXij0IM5yajGzDrOUb8DuYiuQTf3/PZcz
 cqjBJ/qKnQt6n5M21lghRm73599ZMU2b2Ivj7vJJMhWzXad0EEavWvN42OLJhY4BgIzxEJ7Xvsa
 0d4wGdjsBfwyu7XhojvITIjVDp7tSuzbCfMImQXxi0fzZUUkzytvxgH82XuQs1N5W8ls1r8bWf7
 3GCXX59R1k44zS9kY2KqKuyQxSxIH0Ao+QsD5kuNjLt7kidUfXr2dT90Wp/rfhWSXPyjU4HfowZ
 ss8NeLNrP6NSJO0qlq/foJmWekG51A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 2025-08-20 00:20, Andrew Lunn wrote:
>>   static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
>>   {
>>   	struct device *dev = &ethqos->pdev->dev;
>> -	int phase_shift;
>> +	int phase_shift = 0;
>>   	int loopback;
>>   
>>   	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
>> -	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>> -	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>> -		phase_shift = 0;
>> -	else
>> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
>>   		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> 
> Does this one setting control both RX and TX delays? The hardware
> cannot support 2ns delay on TX, but 0ns on RX? Or 2ns on RX but 0ns on
> TX?
> 

This setting is only for Tx delay. Rx delays are taken care separately 
with DLL delays.

> 	Andrew

-- 
Best Regards,
Yijie


