Return-Path: <linux-arm-msm+bounces-63506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90870AF6FA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86EB2188C35F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 10:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6352E2E173B;
	Thu,  3 Jul 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvFnyOSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13111B95B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537076; cv=none; b=bSALCUDxBo9zofChz8U8lpXxRUla6oRpW/llsU4Ua3wQhhJKEiP/LG6+rBNWq/dnPEbC7bPke9x3kxCoGZcjQ1TEbL04oCarWqjdWuCt7Qwn4e9zD+B23bL4AwudeN2Z6WB1p/lY4dx1fGpvqzbQ1wGCUsj30xkZPgLTJeJB69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537076; c=relaxed/simple;
	bh=cyTu142mWOH15jjQQR8zgkNVkfWZan1wub5jXvzfRWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tphm2+QAI/Vt4hbTdcgkRbCULYlH86x7rlLt4Y3oCW6DDBNk8h3uhIAK/08+MpcUzkCyk0XkAZUCWW/hICeMu3QiHhWd+T6Sdbhn+/H/PVm6bW/rPQ5IYuSvU1qE+CaSy1OrwbO2sBH8eX78udF43bgcr8r45mCz44gBasMkLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvFnyOSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638oIGm032109
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 10:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUtfiWChnTptD8GgF9Q1eg1hm3mYO2U2DifbMke4nQM=; b=gvFnyOSBx5Zh75xU
	SLvcJThJvf6mWMXWPebbqcXw/LQKVtbzvTkao9o7jI2W3/eLsTxYdQOcYqabZbGQ
	p+DRhgT1UPNJE3UiSUnW7SK+d6r+JHQ0Gnp50MYM119vTpQxOENAKRFxTIrI2uGV
	Sx4otX5eeXvOsL5MJRxRr3N5bIdAgZ7pm12TeQjBbfboIvVwY33ocojvZkqnQ1gg
	2kKZ9DcUj5Jvs4MWbh422O5U/tNiYfZC6fyzMDqc8yMjbaVDWOoB9IJycbJuIuz1
	0anRYOh8dnf59cVcVUSQ9VK8ia2EoF5WYaXcUQ9DzSBgVpIa6fy69ZFLyZv9lsNF
	TNHwFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kg7ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 10:04:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facbe71504so26025206d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 03:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537072; x=1752141872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUtfiWChnTptD8GgF9Q1eg1hm3mYO2U2DifbMke4nQM=;
        b=KPJU8DY2fLN11FYDzH53v+MBW5nECEljU2Rs3jH0ENAMgzFt5QBeGqyDRN7Ay5JKNv
         qmH+cWAD3gO3gevB4f42JoQx53tVki9e8TogqJIpnv/x3DdIsud9O5E8OFXrMqnzL8cj
         FecwwyMTNspD3bbXWNyg/l1pbI7coKC35B7v848XQW9uIkg1dZmpe3+QRHDxVCk+jHBH
         QVVFv4eJ1VJf+RX5KlzCrwcpbe+y2cAufArhQrG7zb6F491ZN0CspKY8vZgX6MmgaHfy
         zrX4NxnX/TPii93fUtOhNo0Xs8WCqgO/V5FlPSJovMiY5ep+/2UvVi/3wQWR+rNSXCar
         iieA==
X-Forwarded-Encrypted: i=1; AJvYcCV3DaY0DCda7C9lEDEwkkELHN+mg0W/KZE+LgCOkIW6nnm6Pr3VvqW0gZ6S703Pa6HkrsuvQ9c2e5cbe7mP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7X3KQcHlAUM4pMS31mOeNer01zUtYoUOJG0P+03Ly/jR/X89Q
	SlS9F3+pSMXq0UMK1BYI4aYT1+vJzsrFQO3rIbU6nPGuPd94PvLPHidfd15kkY692XVFTY9vFA1
	Y3whgywwNXUrIJZ89VA39bizmr0dxpCQO7GB/HDMbFQtPqsGZyuaTOPpDJ15MSwwdAGHq
X-Gm-Gg: ASbGncvYUY72vBp6evYL9XCSNtris8Lq6rXsvTSezdG0UZ2f0pgTlEQy303I9jJGpvE
	VIHYnVPSKzAytK89OJSF3YzOQQXOWn32F/EJtRuphNceZzGZl+oC2mTzIjQzCol1a4dCHBHIPrs
	r5gTcwG2aG+I6ief7swOjZljv2JVleRK3o5IKBVX135N+B1JggrFlQJYezw0RRk6CqmaY/4iCin
	kuDaXPtLRj0L3xwZfTEqzgGPuerbA/dqr7zlGvxgqP6S2+rYgRz7H7NYZ6h+vX2Eu8PrUR0tBxO
	x70LtWtZf6dpKPH1g6WMtavKTGwbnbzo9/T5I4vx8E594cSkNYG0kN0O0ZyHgAmhK34M6mEh31z
	9E51rST72
X-Received: by 2002:a05:620a:170a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d5d3f81630mr79845585a.12.1751537072317;
        Thu, 03 Jul 2025 03:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2LJCfxQ4Vlc6G/INeD4FSxm9U7KnRLIwjqUdsVZx1frVxI2yUcjNbNlDmF6QyLAOxpw/4TA==
X-Received: by 2002:a05:620a:170a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d5d3f81630mr79843585a.12.1751537071886;
        Thu, 03 Jul 2025 03:04:31 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e2a743d53sm4520080a12.28.2025.07.03.03.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:04:31 -0700 (PDT)
Message-ID: <a453bd90-b7c7-42eb-b769-b4c87b6dac12@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 12:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top Level
 Mode Multiplexer
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
 <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686655b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K2Eths-FuMJ0g_30MjIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4MiBTYWx0ZWRfX0roLB8EUQU4+
 1fPwCTtwtgrEn8+pNWkPnEyM2tBDxezRV+CmZ0bIYdhXhQ1l264+RIIrXg+q4F6C2IquuV4j8V9
 0WnE3YxJtqDxzBP93kIoUXZpgTzj49YAMDqAjkwGa7p0KmNgqGpilWofJtPTGz94DNeg79ddOri
 NPxH9KkgGOwF4dMAhl/0mvVmbs1bl8Xnsqg+3j2CRKjDaBLm8ALP6H9MYdd8o2s704bbuLr+SkQ
 IswDLSs3KjKVZ2RZft5+eyz4jgRtTIwq6N+l1wLiS3KqPa1ylNZRRABYTWq2vqalvCgKJ3IPnCw
 3QKvtrM7HS5VOpMxCxHVzyjkLfukgZxK1AAasTET29WK0PoZBmdhVNuSXAlmZS1xwILHemA1Kff
 /VVtprQefBtHEdHkSTqWLIzUHYjLTjvP+N02tM6xL0uCIQZOI91L6Denp4dhQ1w541oVLvBm
X-Proofpoint-ORIG-GUID: wjOALMgg2uavUO0R3Ot7-_buf0dXgF1T
X-Proofpoint-GUID: wjOALMgg2uavUO0R3Ot7-_buf0dXgF1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030082



On 03-Jul-25 09:44, Luca Weiss wrote:
> On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
>> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
>>> Document the Top Level Mode Multiplexer on the Milos Platform.
>>
>> What is Milos platform? Does it have some sort of model number how we
>> usually expect? Wasn't this SM7325 or similar?
>>
>> The problem with such new naming that it awfully sounds like family
>> names, so just expand the name and explain it.
> 
> Please go argue with Bjorn/Konrad about this, wasn't my idea.
> 
> https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com/

Milos is the "real-est" name of this silicon. All the associated
S[AM]|QC[MS]s are just variations of it, with different fusing.

You'll stumble upon it across e.g. firmware build strings, as
well as in any documentation pieces.

There are various internal reasons for the switch, but the most
obvious external-facing one is not to have the user buy a devkit
and wonder whether they should use QCS9100 or QCS9075 DTB, and
why there's zero drivers code for these magic numbers (they
include SA8775P). We can simply point them to "codename" and
all C code will refer to it as well.

As for external reviewers not knowing what the platform name
refers to, this is nothing new - AMD submits colorful fish names
and it's broadly accepted practice

Konrad

