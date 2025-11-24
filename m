Return-Path: <linux-arm-msm+bounces-83134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A683C82A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 23:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471933AE020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 22:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D75335066;
	Mon, 24 Nov 2025 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX8JCe81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ay9kDwvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC812330B36
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764022240; cv=none; b=nMbCU/i1VstYX5Mj9WbbfuzYv4yH+pJw9tlPN8Bi0QK3aDUhBAO2VynMC2qJFdLDtM89F5zhu3qYAfBddwyKK5uWsJTbNgZc7MtLe8w+H+sbrvLFSyS8/VZBo0FU/gIJaQRNLaedjtVTrbuK5KlN916hOrdeYmu3ywQKqXGt760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764022240; c=relaxed/simple;
	bh=5asoTe/RpVZq0z10toOW9rTiNGWjHr1jmYmj/9QBvhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jP24RyUG3RLIAmdDaxldajyaShH9kwK4IkT+S2HVQwvyYJV3P14Xrhkt8GSekY1Qy02V+gHmHNRSCaU26vEsDlO1xabzfKqhhVHe9PwKDC0/+dtt6El5VdoCfJieXS8yqn+OfXpBCe/t9cf1Jbw5NIi6VtZBFSBu7KMrelwzfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IX8JCe81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay9kDwvW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOJt2l1998281
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=; b=IX8JCe81aZ4Z96ad
	LQ93m1F98NWgE2XRNocVygHnvwMc6pPv1IGhmTGeXZXEiwBpVbABwFB/Md3+rF+C
	nRBdK8UnvdLQZh4XU0JcNnIkdhgYRqGY+nOLkFZZ2jTaoZ4+VfSx1OHoOXmQdRIB
	dJxsXD8fTn/RD/AVsDThTFaAfNF5NHxrmgA4YxRvVI3dcQ3rWXtlknGEU/UvrvJ5
	QE1lal5uNXo6TAa5uiQ5fmvMAL6Wei8+tiu8oU9jruplalbakG36bFa8Ln5e2gpW
	vh44BBkQF+s7PHnLtZ+qjnC1z3iomsRiCkOJpZXWLya7JB2A/l67ZJ0p3HeayXWP
	xvqMuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6q8uda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:10:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29557f43d56so60241745ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764022237; x=1764627037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=;
        b=ay9kDwvWXUpGzc0IUMnYlL15YkCOuFI7kuGJHzO4doHkn+n04RoX7UMnuLRNITKITk
         XKa2fLjCKpczcTJQjwdDdfVPQWaRkMpNCJGBb/LETsFrKRp+JenvLfif/P1WAS9kJVJ6
         MDQ4MKFRXtp8LvR5HryCJSpluCbBYobJyDuVaCVFep1LkiPDDKGK+YMw3w1Y/7OqTRy+
         4erXsAxPX6tfTYv2rQf/1+/u27oJ4SWTs+qCp7D4EmEctv0voAGTLwa5kOzq8dlfA+vl
         elS6XP9ZVWuaoRwIr0z+IHtbmU9aZq4jt0hORLyRleVHPw6fYoMI1/PNyP/6+iWq9/I0
         Yseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764022237; x=1764627037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=;
        b=JYCkH9/H0ihzYWnIPoiHDdRzDAtRAVdo4+MVsMIbtudGgbYnfWmyJcdEcjjrRaFIU3
         kQgLnGQzM4jlH03XQ7Mvzqz1TNYzHX6CVOqpla+0sHlm+hE6ymS5v/AE1KAXdTekY0xn
         e7a84EFEgDywMRFIEtBoEjjZxbjWablYtm80RbyZY8hRfXjvRwfxncLmo7/mXchANyqg
         Ccudq4Puu8GCxKw1s/0CP9h/q8XGfJIDIX81lUpee0tNLt3sh1iNe6n3gm45IqgZTJFG
         d9zbBjC4qI8YjKALrcdlFGpEMaN0MOzv6dkiYNMaF2ao5q8qJtsLXSp4rcrPQ75iTluv
         DBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr41CVGV16uZpcjogLFj4afRtnCrlNIQFCVOf9R8ftQLu6LWMOX3eEuoRrUhsvhzoN9Lo81ia4JSNr9sTy@vger.kernel.org
X-Gm-Message-State: AOJu0YyRV1WoL7EYg5iXkd76oeCpwBh73XWsqACRB1kCk4uNghx9q4d4
	BSiAKYjG+A8rFOLs4nuhFN4NaiRuFBYn34FS7wMe2IBOWk7AjMfNTE4JF9ldA7+pcblajZTnnQi
	Cdao6FpC2P0Vkn6ZWnFAYnedoHHKNgTdo5ZcrK7RhumQrO+5MJQJo0wSJYbEcEozZ8pWx
X-Gm-Gg: ASbGnctuBzqKHfiFyigBH/Q6S9T/kH7SrFbxY32bNLGYENtwNgY2F+XZ/LDEyDE3RkL
	ubcnV2KE8IKkLDw/70vSLAsgh82ExHZq0N4DmTkG40fl7rdypMS2w5p7fnOyrARYxhxbWFl7lbf
	hhB8Vac8tWmZBB+Ux986/WWYhJGBz/5hm+FWc1Sj5tX6Oh+WmckL+2d7MSFZq6RQsEpyyU4EeAY
	xPupP6ZWgWxFlzKLMIoy4dM1FzD4ViMlyorpAJ7E57ZNxyKYQMWrCg5ddEuplrLSK7WO0y7hSwj
	tYbKpG/R88i/bhLuYfYoJbxKMUDaHnsrVljSTWe8zYWzEFU9rVCY8bQNL2A6pd4EOa29gvZBwHI
	e7pVXe4x86RnRwr1XA5y88q1CiCCFvtLXcS0=
X-Received: by 2002:a17:903:1aa5:b0:298:4ee3:c21a with SMTP id d9443c01a7336-29baae40a33mr4509325ad.2.1764022236563;
        Mon, 24 Nov 2025 14:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCFlcdURGFYX9T7gTdXnUcf8Uq2t38PcEn5iAANu+rMB94bLXIscK2ROxQ/LO/fYuI22iQTw==
X-Received: by 2002:a17:903:1aa5:b0:298:4ee3:c21a with SMTP id d9443c01a7336-29baae40a33mr4508935ad.2.1764022236070;
        Mon, 24 Nov 2025 14:10:36 -0800 (PST)
Received: from [192.168.1.14] ([106.222.231.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1387e3sm142941995ad.24.2025.11.24.14.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 14:10:35 -0800 (PST)
Message-ID: <efa2f4e7-97b7-465d-81e5-98d86975548f@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 03:40:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B8xOMw5ZHk5VRDlo25STRoDCjcNnCYtX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE5MiBTYWx0ZWRfX8eJoOIXHS3Sw
 y3kDP/rFLXUvw/Vl5NCo5a/J0FnB997irBarHI7aR5MpkL7S8Opn2NzAbRghxv1SJBjR0Ym2Ow7
 nA3FyDfb8YbXi538hI2YHEQXBo57J8aNe8U6EUXsjg05VJxr2Y4IfXrUn+biYOK6GFNwunziF47
 UyIJTXFYEDMhXxiKTEXSpDyaqyOWfy8bKMDBFcv5xvhqATV6i62MPeSPwhvyclL5ezCQTNxbhsN
 0pzZk9hdkMSRsdUsDfaf9zv3dFABE+HkKPARZRC3tMJBEiD/LCg1CJ1h5jIv5ScFfOBQPxdrwUi
 yo9gOyNCOmqHlVE//fvV4Jt6ZqS1M00RSXfydRdyMzEi5pW7fOBZxxEAR1fu1BTFnz7wIgM9ShP
 dycF7tIsLuw+tgNeVUaRcJowpahJJQ==
X-Proofpoint-GUID: B8xOMw5ZHk5VRDlo25STRoDCjcNnCYtX
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=6924d7dd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=QME20dCx57Gc1q/4dZKLgg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6yKHOGsdPNW3Y-1pzmYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_08,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240192

On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>> Some GPUs like A612 doesn't use a named register range resource. This
>> is because the reg-name property is discouraged when there is just a
>> single resource.
>>
>> To address this, retrieve the 'gmu' register range by its index. It is
>> always guaranteed to be at index 0.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 5903cd891b49..9662201cd2e9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>  	return 0;
>>  }
>>  
>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>> -		const char *name, resource_size_t *start)
>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
> 
> Can we drop this and just use devm_platform_get_and_ioremap_resource()?

That's better. Nice.

-Akhil.

> 
> Konrad


