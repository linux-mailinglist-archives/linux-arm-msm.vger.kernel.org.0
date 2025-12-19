Return-Path: <linux-arm-msm+bounces-85875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98815CCFD11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 511FE30B814A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B40C2BE7C3;
	Fri, 19 Dec 2025 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/dWc7AM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acmPWXxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5C21773D
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147229; cv=none; b=fVYQ5aTakBXBMIwwkvm9C3u7kFsvcWl3zphoJcBj7B/wCYi8zunU+wAWaCdvlZtcANZS81tbxBmSqbu2zEJJglNbyz6A/RS3H97BVRRS82ZTrcnxNBlFX6faXLEUTgOICwnbZkMLVi7QOHxil5tu2F1gGanhRYbm+QETaTz5LRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147229; c=relaxed/simple;
	bh=mbYtV069Qf0IePOdNgiXXhWku4t2SpxAHenJNe3NZhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrU7eyuLhWzKzl51ol4Reg9L9aRdp9+kcI3lkyxLgSyPRUdcjatkXgGEg1Hdo92hgf5Fkpe1xfNPsiiPEq5+adIQ+o0V4xozZ/BhBRumWIT8zpVDXeMM4TckfAFPHZqs3f1xYdOckp7oEr3d3Cux4c46BP8xZxac05u2ZGy1Nbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/dWc7AM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acmPWXxk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBQ9VX4102126
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=; b=V/dWc7AMDuDQOsgk
	Cgn1dTRIp1scY6lFqoodNCNeiEInwt481OXNeX2cGhipy06vKrAnvowHI465dJeS
	mCMl4eQErE5JXSw/02Tfd19BcESgqQeOqT914dMd9BwdiZJI+Q8wi8jVFeU7owLk
	NMjCYWPo4XriOaRlmCoUhK9Lvrb7yQNGsh96TB8/CdFpQZHR1duIR9ah980tlHGo
	1lXRku3vIecnuttHGaXwfx3saWm8nrREhO24pZT/lPS1PSoqFiAO1I7lvA2Nlymj
	jjaOkxSvf1TfSWsFl4SdLEJp63SSPYY0XjI5ZnOpPajVh5eyHjKvTNemZ9mRF/kr
	L2Gjug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2m62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:27:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f357ab5757so5560091cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766147226; x=1766752026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=;
        b=acmPWXxkQ+s2TY4nbsB5rxbOGDJOD56JKnF9fh+7eAlLuLzBAj6KNglZsdZZ8u1AcS
         9vO40eH+wtJg7Vv5LeJfJh9gKDB0+Ttxc+0oU2Fy6YuJfVlHesRu37v17z0dKZfCyqn2
         QlxpF+O9dJYIyhSlE7hpiNpbmeoeks/LV2UIHSNIqKZpsxxC1lZzTMP90EiG68rKZS17
         X2CNhH+e92oxw+m3AoapejPBe4EampbySnDG0CxO4T0jwjJult6I+VboIRVYYu8QzqXX
         5umA9EIhqejutlXW+LcUxCzYO43zWhPSFK96vainZaZcnBG4vB7EGRc864S++xb+uBOL
         agyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766147226; x=1766752026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGNe475MceD9LRRkeQrgMu5K0BExCqyAtY9JJaxoK3g=;
        b=dAsYC6XirhUWknDF3SpizLIHZ4csPFraRNm3trvHspJRVrbs5B7H1nDBIgLbnnTiUG
         B8Ho8xLyRXyqXi/QZ7hb/gjk28iuKtEwXZfy8HweU/OPN+FxFAl/YsXL212LFGRZVQUs
         i+4NUVLbQSjWjFxN7ei5x9mbmm1ymilOlXbHMQFt0iveRpEST122wkrlNDbOXGoVn/0s
         ogk9tIj8SLtdt8v5BgTGX4xQg3GCyjFIoEWasx2EzATsh0YkEbPIp3ud6ur7zqoBpp2k
         wxqSL/nZdSElKXqVCm/pAD8cT8D+py4wmn/FMDlBzCgZaUqIpBxwxweqai0GyVNklwrc
         zG1Q==
X-Gm-Message-State: AOJu0YyUu/YNFPQlhq6iVEBvqXeb6cgJyBIfRZoycPX5TbXJHlJTXuBB
	y7AyZYskDbVV1WCVxVHV4Oqn2vZpUgY+l9f0Anih34IDoPchW5iZq0tjgnyq4oiH/SYNaJ/yA3D
	E3dRiqBHmAxTIiWX9qXbehoRGTSgPtd7TwHQHx/i0NdZBJkqah9wnNTZZzx5w87tmA7MP
X-Gm-Gg: AY/fxX7WBQDkhZjM5YgkAqvadni6AqZkVYepK46PxR1Bq1HFG2gWIPEYwEBpRvEiF90
	mj6bHzyY45YIrKZRId+j8f+rKxC9uRLDkJCIjN2d6FNeYtV6TvXj2P33D7lIVO24Wd+OcsE+lFv
	EvJMv5PsJPmZLAxfw64YRgSXlrGKUlU+WZ/AmcfGTt3iH2e52l5vNqHOHcA0o3TFTAItZWtVdRx
	NhjEVBf+XrtnWY2JLvMJtS8aNL5JKB84FIhLLx4R8w8uVqk9LsA8BwMHuKiLjJ4cgDqwTPXbCJ6
	eWN1yaHkmpGUC1iUJK47kkUrXxFYz+TnmaypXbA0EMRvPELLzT+sDo8+fgC4E+ibsHbuvg2rYA8
	UoX1LI33wz5oThHYAP9YnXaMXdqpjEgnvWXaNRczMlvrnAKY9VaVk2HV/uALynYPIOQ==
X-Received: by 2002:a05:622a:14:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4f4abd1239emr28283001cf.5.1766147226270;
        Fri, 19 Dec 2025 04:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe0pL5QT1iJeLiyw10m6uKLpNAYA3Za+0/xVT/0m30q7rSc36HgbWNxqPaKAuqcQOb3mrYxw==
X-Received: by 2002:a05:622a:14:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4f4abd1239emr28282611cf.5.1766147225829;
        Fri, 19 Dec 2025 04:27:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0b38sm218914066b.32.2025.12.19.04.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:27:05 -0800 (PST)
Message-ID: <21ed5d8a-803f-449f-bcd9-597d89118456@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:27:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
 <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
 <13141782-ba6e-4753-9613-2b128e008d56@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13141782-ba6e-4753-9613-2b128e008d56@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMyBTYWx0ZWRfX0oo6pmHMlABO
 omxXJKpDl8CZNG+waSkqrjXhKBPSJcX/OHJ6Pp5qQweRSeWQrJsoPWMGQBwvzhB8nHTmowSDqtp
 Wj+bYj+MlKDrtDQaSv1SDK4Som8Z77JgzrzLMPRcPAyOE+amn4VMqJIT8/wGheSMRCUUchVJ8Wk
 XFlYhmV9KUNjHKwEoQQxNhnCHglfuGThWLxvoDU54U9rNbz0hoe1HDRYuClzit+B8BrgE6gXrrj
 onOSOrUTVtkTjhf/lc5J7yRRr4qSKCfGXicrAR4wldgZPXtNIPFvouv9DTHznQ+7w4qfrPd945l
 Gg+glzOIzaR4/CKfD4pIU2XM/ZWUBdnYNgsMPwO+IMm6/E7KA/9rJnOSkgUkC23UPcr94pt5358
 bG6CI+xjo+ZNjFv0Xzmm9ivMl7uhwA+UGE7vJAwMDQ7GF2g8lwkql7nKNDGzc0r+um27bJPPCBe
 YYtNz8EhU8FNdQfNCrg==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=6945449b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vO6QtDcs3dl2JE3F87wA:9 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: x1e9TJrUDzY2Hw5kpP02l9h8wGm6Eons
X-Proofpoint-GUID: x1e9TJrUDzY2Hw5kpP02l9h8wGm6Eons
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190103

On 12/19/25 1:11 PM, Suzuki K Poulose wrote:
> On 19/12/2025 09:08, Jie Gan wrote:
>>
>>
>> On 11/3/2025 3:06 PM, Jie Gan wrote:
>>> The CTCU device for monaco shares the same configurations as SA8775p. Add
>>> a fallback to enable the CTCU for monaco to utilize the compitable of the
>>> SA8775p.
>>>
>>
>> Gentle reminder.
> 
> I was under the assumption that this was going via msm tree ? Sorry, I
> misunderstood. I can pull this in for v6.20

Please take it through your tree

Konrad

