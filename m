Return-Path: <linux-arm-msm+bounces-69302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E6B274B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 03:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCFFE170DF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 01:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657A1145B3F;
	Fri, 15 Aug 2025 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+rptkb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EAE1448E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 01:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755221373; cv=none; b=gH84HkIXc4mG5gSk53O/Q2lXNvH32qS0q0cQIJmQIIRlgWkFuj7UnmpZbOIOChj80jOBkd/Ivf9JqMyb6Pe3zEZ94ory0bmzXecLohfEaqi59P0LGUq6hc5qhnnnUpQV/r2ywHUB0lT6x+aTeo1VwdsQQe5Sf3wewn5jM0Dofxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755221373; c=relaxed/simple;
	bh=cL4fF5cojIEZfoIUUyktMh691We62NCcFTpHQe1DfMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtcOlSC+X8yLrJyoikIhvGxW31onl0iOajMV78+Il7yfLhD4C//QKToG6dEFh58AYV06AJNn5XKVr+OtkU/R/v/ORJZYsEZ7BRyY/TyiGGhTFp4yX+2an/YQdlC7SE35HKU5SiTaqv5wAK8mOdKiEPy/XWN7AHoimUf1aeqWd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+rptkb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHugPr012161
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 01:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUqEIcGg41PDXWHz1z/iY0qtxmEUPZEPL2CuLNi8QnE=; b=C+rptkb0uGTes0QG
	nkqJySsyMhhThA/IhZCQ7aoDYwPH8KIvov7RFNVDU+VWDDuANrPyVxx7YHu7TYN9
	XL44aCtGkefVytiC0PE7QWywNcGZ29E24QEW+aTRuJU8VN2TZctkDutwa/R+Xp7F
	vKXUdYouhF6yhJd7ltlhgwhQW3yiJhWCc3HpIoGuzHgnosN8TyfNALwdzpB+rHy6
	ThZwAfRteRXRO/bTPmdqgMG/a+4TFU/MCxL6x056oGN6rVzJghMZtmf+fY304wsY
	ERJdYD0AmmBfEQH4064y1I+z2p6qdKC0DUfKTNzznu0MhBq1tO8+clKX1vAumBDU
	mfgtAw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxft07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 01:29:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2ebafe0aso1342832b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 18:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755221369; x=1755826169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUqEIcGg41PDXWHz1z/iY0qtxmEUPZEPL2CuLNi8QnE=;
        b=f+aId18TzgwOYbDFURtlSVnvOKv+OtSkcgN6gw6tjTG3dGIxvtosVX4rJ53njlXu4z
         LDQzrbW0pBhW8lrxy/Kow+Hsj2ZOtjS5gqFKcP7NipQurv3aHKy2reTwPaP1SXY+Z500
         W9tV4gkrzi+1bH41aHUI0sioGKgwJ+NY8F07KYARGsF44afss5OOSPK/28o3Ah4ZrXMh
         n2aIqr1IA1YR9ATTwaOST3733TPUxsEi2ftfjaQGnDedPse/N03/CRRcbmaSEAMfOdQW
         253O7PIMn6+V/+iHtbs0ejNX8o9tI52ec/85yVpGYXMKVfq85UzGCBN296Mpfb6+0+VJ
         CAKg==
X-Forwarded-Encrypted: i=1; AJvYcCV3GFl93gtVeKXUB2uk8AsmJ5uQP2+ak0aZfkD9YM3OSea5E/Zz1XnLlmycY0KSBVn8d+4eleC1RnLSUenN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VMr7oQUiNh6i4a6nkQngGkqTKlNW0gmYwkbTY7P0rI6qLhYb
	bL+yPT39LEhmotmeFmkdGAECKEANlkoNxU3/6f5nd55aXHy082hWloy3THKUmFKeBkR6mfFiRvS
	MlTy/E3+0yPw8RYWzInAaqR+AMqeT38fa0iDxUUyA+tIvK6OOGPUvGRvfFo4OYZU4KdFM
X-Gm-Gg: ASbGncsbYkC2qIv9EcIDPI4iZqBkfpuy5+ur3R2y1u6gdeI76/2M8BlfQwLYM9xdhm2
	yFVrR7FSo+b0Rzm7UDZyvhyXrN3TQ2MtuHq24BAIqR0SS2eBIy7UKWsaojNywMomK/MZffwV+rU
	K2F+cDRC1j6KNTBv4H10JKBB8B43Kx8hlzejqewOu2eaSAO6/6UOgmZ7+wCcI8QCJKpPlQHVZNl
	aZ3YJaaNlK97cIchtIeq/gsLVqWfIuJamNsJcm3TXXLtxfcbJdCmVrpbWznXnVb0B9ILrDHi6Cd
	c6OXGoZrrJi9cl3p8wbrRpyHmryWOkZ1Hj0CohHLc6DALtJCb2V8oauX2u5hUR0/tehwbnnkr0f
	XnXq+mFK7PXqrzHN7yC/OlRa4rI8=
X-Received: by 2002:a05:6a00:c92:b0:76b:f06f:3bca with SMTP id d2e1a72fcca58-76e447c149cmr255796b3a.11.1755221369329;
        Thu, 14 Aug 2025 18:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE85cmPNcrwW6bUVVpYJSBjvWFffHOJCxDIni8KFhZzvKGJ6oG/cndR/h7QxbdZXamxFvZSdA==
X-Received: by 2002:a05:6a00:c92:b0:76b:f06f:3bca with SMTP id d2e1a72fcca58-76e447c149cmr255754b3a.11.1755221368603;
        Thu, 14 Aug 2025 18:29:28 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4526d1ffsm9468b3a.16.2025.08.14.18.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 18:29:28 -0700 (PDT)
Message-ID: <603fe072-b2f8-4cc2-8a0f-7f51d6672b12@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:29:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
 <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
 <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
 <63ecde5c-8234-4630-97e8-5806b9ff3eea@kernel.org>
 <a56b3e85-0d42-4945-8b6b-dcff20c7b104@oss.qualcomm.com>
 <bca211d0-8d53-4f49-9cdb-67af7ba69421@linaro.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <bca211d0-8d53-4f49-9cdb-67af7ba69421@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX6IliALoNbH0G
 wV24OSbL9KXXs9E/5C/U17NsV/igxj742KT+qgrazAz99mCvcLCG4rOgQ9GN/SsAO3KMiyCUAn2
 6EkbEtXs4xJuu2G7cMAl208yAmwvp6suNSP8YZ01bI3HFn1gNfozg0d3w1vIUPZcGFqdMcIEQi5
 QFCl802uYMIi4F6G2seJzFnz2gZqQtlkHDiVkFvKXA+zC8bqo0NQ/NFJY4qGryhLypcu5o+Ryv8
 7UnsogpcMmgZHVSRGKFGX+RAogpmaM16xuCGX9bo7J2apVeNhuDwMS58na9yCvcrDhUqNrHTJvg
 00SVKfhFZDUGLchac+B/CUA0yZ4DI0BwuvDX3+J5BykyLg+mmcMUnYr+ErdpUNKVBwLn/o5gek2
 IuH3aKkE
X-Proofpoint-GUID: wOfaKArql7wi0wtur2y6ggKCub0b-uXY
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689e8d7a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ocaDlfLBIpot7SGG8IQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: wOfaKArql7wi0wtur2y6ggKCub0b-uXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 2025-08-14 19:15, Krzysztof Kozlowski wrote:
> On 14/08/2025 11:28, Yijie Yang wrote:
>>>>
>>>> Audio support is still under debugging due to unresolved issues, and
>>>> it's unclear when it will be ready. Would it be acceptable to proceed
>>>> without it for now?
>>> Audio was sent to the lists, so this is confusing. What was the point of
>>> that posting? It clearly said:
>>>
>>> "Basic test is good in Hamoa-IOT-EVK board."
>>
>> Additional issues with audio were discovered during further testing, and
>> the current audio series on the list is not suitable to be merged into
>> this series at this time.
> There was no such indication from the author in that thread.

The author of the audio has been clarifying the technical details in his 
thread, and I’ll ask him to mark that series as unsuitable for merging.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


