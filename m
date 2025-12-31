Return-Path: <linux-arm-msm+bounces-87112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D881CEBF6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54EE4302C4D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 12:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D530432AAD8;
	Wed, 31 Dec 2025 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e85aK0XT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qis+Kvhn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12232AAC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184175; cv=none; b=tbdCj4dQpZvrZ1UBHrhPPb5YhD5aWR/keVf3dIIpgdk2b5p3bBSmQ1ewrQwhpoYRZNejBLqN4sf1QFLBdNRH4MhqpB8kgsR82qOvn+TqSht4XC1hpJYize0RGFRUzZmdxXCfLcCimCqjYZsgHOrsrM74IFEZT9igMcYo91//PQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184175; c=relaxed/simple;
	bh=bkkABUwp/F6fICqUxbIiVM61m3GHA2kaRAtvcOEMVzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tO5XfM1uyTjsG/wZvbp5dxtHU7ew3FXnQ3Owv49CXmQ4cbxlure5z2OhymBkEcN5Ak01U1C2XsRIQWvepGkiYT1OJbPR6AOrr4lRIywqC7R+STJzQhOG3aUZWMsWwTBw7wvsj55QwROFCErvP5xl3AV6ct7nQrzGPxGP4ZpaRn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e85aK0XT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qis+Kvhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV6E2qY3539777
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=; b=e85aK0XT7X6B556g
	rSxyb4cR/aBwAXUbyRNOcVz2c+e9H99AQXq5xS9XRXEfpes7PKwtVHRQRte8T/12
	ymrAgYI30cJoBKrp+D0r9b8EtAP4mzPTd7YuyxkHnT8khKUy68xOuR0/CcOuka46
	D8pOTkH1rx0J70wek8q7vjW6l0hD6S0uiF6lCS75DebTMSVwBLNBGKSOP30zqvCL
	L5i9IbPWnOVEZSAEoMjRtC3BLq23yT+j8XnfTzkndecFzf97ygjQePjL7+07txuY
	TXTXWBTZ4g/t4qdKEr/lexZrQKrGG3F3YRtEbQwCC81lbnJXm4s1seEKW8xOMvzb
	rVj3zA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ykhft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 12:29:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so62206651cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184171; x=1767788971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=;
        b=Qis+KvhnEers8YznYVjUS5vL+3wYSv0w3QzacyOwSlj7SWPnIC7m1LUBnYk23M4ILL
         Z0JlFxL8CmJvab8zBO3S+6sVkX3+H3a1nQeX/zwWTQKKpOPAvc/gB2vwEguSGIoifkCN
         Q4doau+1pL0K3LsMrkkqPiHtMy55t645MZJERzqxapAq9AnXV2yIdWJ3FReY842mmlJV
         tY/oZlzaT/WKmH643IMXm/e5K6j2wSpquVJJQAOZwUk8I/giCXY/JS1SpLb9o+nVb9ss
         Jelm7W2RlCEqECxP94/4iqnkZ5tefK/+6PDNwiNrtCuGUjQEIqCjG9sp7gacDixGVOp8
         sMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184171; x=1767788971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=;
        b=c9qEyTD2/RkbZTinXznYuJVTgy20P2CQlUEeplZ3tT7aL6yJVM0ICEokrQynrhMZZK
         VNTDIeTBply4Fd1paaf24PUZTorQmva35hMI4ACMtGShLUhbu2ibnX62opXTK8R3yiEB
         ME32pqY6ObNWNXCK1fEj2eZogxtXycgF8R0rOtBswpRFOPV6srSywL343/UgT8gJUyOl
         cy2U7Kml+9nMmbsurk85N58hVWM7I1o1y3HVZ0kxSBmolfkUvjOqfEvELPP4m34DkQzm
         s5gztZScgrgwSQGeRQ4yEmAGEcwPTIVtYSk7wvvFnOeMxUx7LF7xZL8tcp6xIhuJzmDe
         z9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVZNmg8fqAt+VbkPWcMsnhjNIpvvujXf+c+hiLudeVx4JQLBiHVUhnLs1yrj+CNoOz6Pt4zWLtennow0Jse@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ParCrT65o/blM3VFj2mkBm8hd5L+k5owLEzjSbPVH3mUkhmQ
	V51aW4XcTykgupPlTiCYA6GRoEQmM2s8Uwjat3ZiPQ5U06zPzqBYJLmHLIznnHT/wjvHrPEOF2t
	SQkeET9q+UiaeKnAFw9KdEXXvSvSwiL5NoMZN/RxDIYWvh2phAcEiOydgNjlIdZX/0cj6
X-Gm-Gg: AY/fxX4WVy15MaBSMl3uK7UrwRMbe0KVE2OU+PG/ju3dexwH9lMc7Bbx/FYmEND6kSq
	VXZSKfC4BnB3B0xv0LLMEZkBG/Ncqs4QZ+0qdLsQa193LW1k/YtvSUKVZO42TDC6esh9rkakXSC
	Ycyln4yaHv12+pHrSzo4j962U1pwZgbMQXFTuCPF9p9EOO/UYhauxt5HTGSVvGVJ35rq5yaLVWY
	d0Ybp9Cu9W82GfabiU2662HYUqqEx4V+xID3jEyU7C5y7BHzG1aBOcLJF9wogH+aw1BFJqY8A1W
	d4PER4XkrNmp04vlpS6pQnVzDT5CJ43r928QL6KHmtAvmADuByDw0tUygHQDntLx/BnVw0rhKG1
	xNFO7UwbYW0Mi7uQ2xOidudVco09gxhkwgvsePSGPCPm0qd82Qv+mEjag4LITRPp6GA==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr410542651cf.2.1767184171281;
        Wed, 31 Dec 2025 04:29:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhDVqUtx8723JBX42anoDu6k15qa+jqxNz2Sh0hjnvTQAr+BDlp8CHnTosrIcyTDnpDaKPvQ==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr410542181cf.2.1767184170897;
        Wed, 31 Dec 2025 04:29:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm3877057366b.56.2025.12.31.04.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:29:30 -0800 (PST)
Message-ID: <f30d26e1-068d-4af7-adc3-9cd03617ecd1@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:29:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6955172c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bmOu7kEL96IPmD5EUUcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8vcT_x3mKBTOF6_Cnhu760JdCUJVhZSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfX3JITiFdGxIV8
 0OYZs6KGUXG20YKCEByI1PlOpwPI5+6X8Yxr9aoGqy/KWfIPjBg4VwzHM+jfWLAH7ZlW8FdD28i
 nmMhtd0/aEGjeDZw34YLlxKGlBtWbaAiGc7ac0ZxBCStFsGXM5/VzNzWsygC0zBCD2r3Cxq0Zok
 fduNDFbC1KUSCStIW8864O2jd9zKu5vn8lNE6Q2XpQ0yKF4Sf47PZ9uqd65hvsTGdIhpqREE9rG
 dIuXIFD1vuYvBD4+ppwLDQVEXnIt9ozGFHq0NF9/JHDDS69zsDp7m/Z2YoaHaTv4BsLebuDlzr0
 M2eke66mcqTZf0FDZCZi5ycRVMxDGbEK5Jr2KGD4LCQyB0tiYfHLin1z62pj4ZYFGXasyxg3mEI
 Ttgy9rje/h2uYFI//7skaJINsW3E+li0jArrSwbS0emHvVazh0bitaUcayg5iwrmdE104GF8ruu
 bPl/xbc6IrLXznaOjsg==
X-Proofpoint-GUID: 8vcT_x3mKBTOF6_Cnhu760JdCUJVhZSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310109

On 12/31/25 9:45 AM, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

