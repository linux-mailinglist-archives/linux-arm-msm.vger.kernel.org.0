Return-Path: <linux-arm-msm+bounces-86931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C4CE9174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33B8C3001C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF122BE65C;
	Tue, 30 Dec 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6ivizDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBdclQlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6E7212FB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767084889; cv=none; b=P3mxz5xgJsqX9gWzQz3kB9ErqGp75Hq2/bdsSTNIUmPvhabv05x/kOq/CU7CFI1eTfc6XHaJqUvrzcdNxkQtTmnixWmj+ZFB7AArtyEvHneR8SDuqL2lB7IOrGGWp2gCZ/zcJCjdXZTl0l9u4QoU1yMdYEeERI59Ue6LeuDVGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767084889; c=relaxed/simple;
	bh=Bl+DeJiCrf2CBeBAS1CiWo6LSlOAlbki/uPTNEgYuys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgAz4363Y4OZ/XPQka+WkFc188+b4vpNCGirLjfO7d3qcHdidH11wsz53Kz+TFErleGKQKUME3pYoZGS07X6X8wtGnERPyyq0InrqnEISz0SGYP9UZ9kmH5lYtXFEF/hFBifGo5fJORdGEGZ7gOBK2bdFC3bbYKs6JKyu6ylmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6ivizDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBdclQlh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0kdC12674102
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+jm0hl3gTRtA+Ks1l6eXl5RaxvmTc+Ph+60AjfOltA=; b=B6ivizDxWyB4pPF0
	/+vHOJ4xm93zzLc5Y2HdHroZIBUQP6pDOtUCXMMCIG0n21O19XZipOaw+WB6bmoB
	nWz8bmGzWWif20uP1BS9GhDnW+FtKA6ScLwj733380bErI3t07iZvrwGxVzaECNF
	RiQD9vP8rTrH+vGX+etV4QVBNj2yYu7b4zLcgSZiviZlPJShBJOBpU8ePfFsxDkX
	M+V6Ar5V7+rgiePVOVeu8Eb4Wty5W+Hnp0LYzw5tUj9cQI5MJmuViZrsiW2jCgYN
	2fReF1Rki2zwCZhEDfj4QRpFhyc+t8KCJPliVjJnYPXBb/OSEgsBKQTwj9LTXzRb
	ygu9jA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcrycp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:54:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a13cd9a784so100970145ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 00:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767084886; x=1767689686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+jm0hl3gTRtA+Ks1l6eXl5RaxvmTc+Ph+60AjfOltA=;
        b=bBdclQlhAXQTXU27aJn8pMRlUvM1wAiGN7sTGZFTLhQFHqQWsNDVYsgAzEY8lETcH1
         WnBa3alSqWpE8DY7WrGK+hSfDBSKTH8xGPfXOnLQA2ZCK4iRBduTpJ8MISbMaXlxhGJh
         OdKI2/UVTeTCdW0A4CD9vZsHNvUh8ub1XHkIg/yESRpymsEgMwabSVu/EKBedqJv0ZWE
         GJ/6gVN8UIGIVpvBJOUWnZh6bN4SK8gPr5urj5q/YQemu4CDq+yunTn4QTHWtFK4Fad/
         +8ZRI1y1LC+xURBe4NFSvA9YcfbdPXMvXI8JaKP0bxsAA3cwXeeVQvW0oKcMUFFolFOq
         hlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767084886; x=1767689686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+jm0hl3gTRtA+Ks1l6eXl5RaxvmTc+Ph+60AjfOltA=;
        b=bzRYVsj1ofB1gE2N0aQ/A0H4bQ1zIwMLwX8Dasc0980c0xHMak3XC8xPDQR3VqdIBT
         Ow0XKOCrYynlhQZQcHwSKsolHNJ7yjCzsF+wt3Fmme9E8qpL8dp9eFWYKsXA0iCCBluA
         dzNY3Q2xtAo0bbP0cLodt+EI0Z/3pfPDARhfayW+NOwcTm0q6+IM8zVZgH0/8SLyhdrP
         cHDyH8+Rc0BSpCVHyW7ImlFzNgivcgjYIo5YvP2fZE2sogJTLjFqh0/3L64PWu84l9gr
         AkkPschDmVH8wKdywf3mSHT+g7Anb1UmQKdg8qYiUJhp3ZakJKVAunwtIKj5m2CuDz/P
         ZcgQ==
X-Gm-Message-State: AOJu0YyBYsGl+BhbK1Zu6Ne/uxCmzBe9tPuet6Xq9yksvcrFqh04UKA1
	UNpbVwJgT4zAZDieJSFedjNrw3n9LQQgcPxptoo4yX304+OLi7GsDGkk4rysKN/YLCtpUa8rDE7
	VnW1YpoVenYIh7F0yJEIccKFFSQUeSnBP1jBzPJ2I4Lpm/Ocj5RMRujQDhoKvlHfgfsCf
X-Gm-Gg: AY/fxX6D2ldWyAGd9AsHRUh8Qffx7+y1w2HEhmVOTb/P+WjVjRk4yxzCKl+QurC17WS
	ManL1SMFyCaYYgNqhyFx8Cmi2uB2lE9/suhH17rxXFynWFy1M+FjgWLmtnObHpijhaOzg6yozYb
	xFr9Uq6bwQcToCUXcPipBbXMS0Ab91hEhfdcK3HTDljNHeqW/Bv12jDcFIJmzET4M8wTsTw4S5W
	u4TqayiBQV4qSao7GDbBE+sPQaAae2po+o1SN5EdAZ8xzoTM6BE0k50gfo/tePtx4xHP4RfufZ+
	mMV1OKvV2ltRbWBfFqETcMeZ5dEh6xhVRHD9/CRD8+RP139C2ZeKhU8+n3j22uORGpNLfpIaYRl
	ahjTPR40TK4IJa+FE5eynK5RanIncwqnksP0xjKKxg4mi4tP5f6w=
X-Received: by 2002:a05:6a21:33a0:b0:366:1a2c:6f91 with SMTP id adf61e73a8af0-376a76f8349mr32847447637.4.1767084886132;
        Tue, 30 Dec 2025 00:54:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwKOGrZevxYUTYMiPED4sj5f4L1oVz4R90Qo6k6fwfLK/YR2I/UvYs/oQV3Hcy+bokhTyxzQ==
X-Received: by 2002:a05:6a21:33a0:b0:366:1a2c:6f91 with SMTP id adf61e73a8af0-376a76f8349mr32847421637.4.1767084885643;
        Tue, 30 Dec 2025 00:54:45 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c627f3fsm28310735a12.31.2025.12.30.00.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 00:54:45 -0800 (PST)
Message-ID: <6031d99b-6130-49e0-873e-b44d0614e2e5@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:24:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/4] scsi: ufs: qcom: dt-bindings: Add UFSHC compatible
 for Hamoa
To: Krzysztof Kozlowski <krzk@kernel.org>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-3-pradeep.pragallapati@oss.qualcomm.com>
 <9d3c21ad-c265-4e22-b804-ef8c39b7e787@kernel.org>
 <26bed077-8450-40ec-97f3-50b7771e4c9b@kernel.org>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <26bed077-8450-40ec-97f3-50b7771e4c9b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wc8mOMCmDtnacFjcHLRH-dcjo8pBvpeG
X-Proofpoint-ORIG-GUID: Wc8mOMCmDtnacFjcHLRH-dcjo8pBvpeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3OSBTYWx0ZWRfX22/OycQYRQxw
 gm2nbpKmMUqvUYJULG1DWvSEEZxAoWM+kHCjq/xQafzhoeQYZy8/iasgCg4YPY0nZc2+Gj5jnlv
 fGsHkb8Z44apV/uOZJzCykW02QyLnXsyIeB14W5AIaQ9Iw70W1GRonc6CGsn3fYOyVFbjtymxBw
 QSflo1MPn2gl2SlChJXcmXx29eJaOjheYhPqVIkFXCHmFutOonWIYH7b5I4vzHH+cU0lYY2sKCS
 AVQomfnycvbEH3GSoJ+4iakwlwvy/FrPICHaUlyKMOznHujO49GUyHDvhvSJG1olzNuIRDg9hXo
 qVcLGgYKX4KydpT/B2ty8nT0wcEyuTBCsqZ0ojYYZsYw1FgTuH6mmkDs4KVCEociYTOu/2kh9pj
 4wryhNCOwbo628OlhHYB9QTxCCztBu8Fwdi7WZLdJiv8CQuHyevmNZQUjJpr6JvP0IauMebTJ57
 OfCWF7M9ztnwaCedj7A==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69539357 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uKld1MUROoZiouImdn4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300079


On 12/29/2025 5:50 PM, Krzysztof Kozlowski wrote:
> On 29/12/2025 08:13, Krzysztof Kozlowski wrote:
>> On 29/12/2025 07:06, Pradeep P V K wrote:
>>> Document the UFSHC compatible for Qualcomm Hamoa SoC. Use fallback
>>> to indicate the compatibility of UFSHC on Hamoa with that on the
>>> SM8550.
>> Same problem.
i will update in my next patchset.
>>
>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml          | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
>>> index d94ef4e6b85a..3b5a95db7831 100644
>>> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
>>> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
>> That's older devices binding. Why would Hamoa fit here?
Hamoa is leverage from SM8550 which is a non-mcq target. Hence it would 
fit here.
>
> ... and why even bothering with testing this? Every internal guide tells
> you this yet you sent it untested.
sorry for the inconvenience, actually i made the proper changes but 
missed to amend while posting the changes.
>
> Best regards,
> Krzysztof

