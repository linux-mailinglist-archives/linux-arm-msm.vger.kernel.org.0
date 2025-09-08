Return-Path: <linux-arm-msm+bounces-72541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65921B488FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C523ACD47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A4E2ED14D;
	Mon,  8 Sep 2025 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBnME6tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D22ECD10
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324802; cv=none; b=FJxcecABD2o1s7JyxE1Tca5MWkvpzT1aFjogCDa74mQ0HpkYu69BkzrMEHxP0xJqPKqb9QjUV3qv+im9CR80ulrIfr7xmfHZ7mcfrWY+BW8pf4ZWVgA7+xHgL+Hw4yOFilj+yiLve60VwsX1UuS7gkWBIuRbZHxn6sRNjcWN2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324802; c=relaxed/simple;
	bh=pGHg4VNgHfwbIUZJAbdaa24YYr9Y8eheo6uGBDgLzXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuyUUlr3TiNc/olLdhaYi7dffMOzco+ts7iPISoAqxwTrvnekFQLDD3mPMtU9HK6kUz7TEd6MRNQmnL/Rh7xcmqi90r/mfKNyulfrZFQ6PgID4vvkyK1s/voaGovZMFH9Y0FlFn8yVOgewx2a/xUwgAVsym47M6dwXr1cSAm3Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBnME6tb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588905wE023845
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 09:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvPrAA/ICa4QmrY/uCAxXkwkNA9kjX32rCYICA7/VoQ=; b=ZBnME6tbpmgqJS24
	yts36ezMywJZSiJ05Bij+jRhb96QIhswlyExTt8qlTXs2mtCIXWZYn1M2YzjT7K1
	YW/9GqPXV6KD+VScR0SFdsF+FIvMvoMCquE2M70rIECWkOB8AyiESgLBRTqcy2V1
	826qZaLVyqJagMATL4e/0WV4S5AiqIj4QnrGZzIOFhnHvyxu8+YB4wk7NiTy8+g2
	E7MmU7QpC3+3vrqR0jcnc0M3oIdlHdAe66EevQy/qMuYba2hdvK0oxYySS0/PwUQ
	7Mej5KTrg0OqfyagH7+U5cuMGSGxW8tVThOPS2PnWyAW6jIPALGjDkA1Tq3RGjPF
	q2gTZQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0m4gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:46:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32bbe7c5b87so2660522a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324798; x=1757929598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvPrAA/ICa4QmrY/uCAxXkwkNA9kjX32rCYICA7/VoQ=;
        b=W/He/iP0WSLqboxOqrFJvQLPOamumyCZ57RmOpz4pkcT6oUmhF5Z1lD07n3wjSrapo
         9JYsEraA3aHeobOjoaRvdQ60OHdwnDIsV61TMyZm8MogWNJQUmaSFE8OXIR3ocBzyXGJ
         ihMAeNR/yACBhBVNXFdTvZuhJOsVQgl7WSA7yKxMNgeJoWVGg0+THrDg52I71Km1WA/k
         3JBrxCCJJm2z8nzShfapHxz47axW6nWK2/IlX7aPNcrP5n2/mD+I/2cVq3Q8rUhJNjsh
         V1SkvY6LJN5CnMPZZyWqV4ahwKRekAVHKH6oH0R84JrTGaxBS7dROFYe6aGSmjdcIgCi
         JdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/S9e1KdhYQavDlMMeP6GPDZpixG0zCPXfpe3LTX0pAEBsUh0kfXD0RrR/zDzZw9gA26k3MT77x4aqO+aH@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJ68h/MNtG1T2LYJ9TIoLDmFLJgbNjg363e0yTsaEFR8UDRta
	hUgpWCKVUbf0KQdRoIdEiaN2ieM/3M6yT4CSsy1cCdsNOJVY5Ydo0gylLTlXMP/b0D1RRSgSsSR
	nsy/2Wa7MO1bqNtJ/v52IFPD36ZIvGPs08QD2xCcG88uvQGCw2e/tu01hd6BCxd9lq1nH
X-Gm-Gg: ASbGncs9Fj/aNYSiiIoJ5cvtPqxJUNBfnSyShGN8glv+6fipc+NT1j8xUKCPHYse+7C
	O3RWV3jMAc7hAP9GW/hIxK+EJEm82LU+yvFKE06TPUolIvoQuX0WC3dqhXjkMcj6+Kwvct2SdTQ
	K+C0MEE8UintsHa3CNXbF5J6YzspRiUDdrOS5q81mv7II0aYPd1ylpgVj2bk9Mdhwizq84UXLuX
	PL0U3rn1TcOBY9mLhJUCQxY0YDjjB1/4jIKzBhyGnT8jcs73uo7V8aZSXtKalMfmkmGnSnUoGEF
	Cw41BXB8Pk48kuohe13tv6I4wwhNWlpwUHkIn7hp6vmuoeAWDhjJmOe4kaLwWZYElJPOJX2Lx/S
	trkOqUz44cSOh1mTOy5+4ASubpSnnOGI=
X-Received: by 2002:a17:90b:3e83:b0:32b:dfd4:95c9 with SMTP id 98e67ed59e1d1-32d43f65178mr10004399a91.23.1757324798517;
        Mon, 08 Sep 2025 02:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvfRyf4bycr5BBpSLmxS0G+wazAJl52xcP6+Epg8zF89ELjO/ko4stTzfzCABTT6v+46wN1Q==
X-Received: by 2002:a17:90b:3e83:b0:32b:dfd4:95c9 with SMTP id 98e67ed59e1d1-32d43f65178mr10004361a91.23.1757324798009;
        Mon, 08 Sep 2025 02:46:38 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb7d391casm11944947a12.7.2025.09.08.02.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 02:46:37 -0700 (PDT)
Message-ID: <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:46:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pWMfHoxxwKhe5aILaKXj0lwN7kRW8nSQ
X-Proofpoint-GUID: pWMfHoxxwKhe5aILaKXj0lwN7kRW8nSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX90JBwerV0m9f
 Q9zf9YVVjf5VEozMBlkrQJZnBmz8sC3z4ioGYizT+XEHoHSjV7Gj8KEbFKo4Bti2pf+w6nODGpN
 FkJZfyqGwu0vDVBFbhBskVw0ZOqoWfCX4KFVHlLwXnC73MeR5RvVm8LHMo9rg1P0ezvGWfRivD0
 Qe4Tj9F16nVDUjKhmq/A13KGLCr63mnMj+ZAXehfl4j12W2sA43A7PCa5VKYTWYwv6/bJSv3lG1
 JQBXqdJjFEVbUfjEh0WYFWdMAI245tXxedre9nD6cxy/3L+9GegfefOOiGMcCVtsWD/qhMeUTRM
 l4RwnAdoPHR9DTA4wMX6GGt2Ad2m7I670NxlJrfGHK1tvZPqAMimyuaNJ11Ui2EPpO4qAvkuADQ
 hTWKGmTa
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bea5ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dWyAYXQ4UQf5hrxkvz4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024



On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> that supports 4 MST streams.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>
>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>> new one?
>>>
>> I think we can not use fallback to sa8775p, since we don't have DP1
>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>> really used). So in the hardware, i think it is different with SA8775P and
>> we need a new one.>>             - qcom,sa8775p-dp
> 
> The DP controller is the same as the one present on SA8775P.
> 
Yes, it is same.. I just want to confirm again—even if we only need DP0 
for QCS8300, we can also use sa8775p as fallback, right?

static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
     { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, 
.wide_bus_supported = true },
     { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, 
.wide_bus_supported = true },
     { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, 
.wide_bus_supported = true },
     { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, 
.wide_bus_supported = true },
     {}
};
.mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.

Previously, my understanding here was that we might need a new 
compatible for QCS8300.

Thanks~~>>>>              - qcom,sc7180-dp
>>>>              - qcom,sc7280-dp
> 


