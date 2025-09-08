Return-Path: <linux-arm-msm+bounces-72558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64256B48ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B623A3AFE11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6642F7AA8;
	Mon,  8 Sep 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Owp8rU9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863E22156C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329229; cv=none; b=MkHXrcCXzz9WcgrHXO1/afU9DWa5KT02YQp2G+eW0NGnyAbFQtbvQesFWQ1iCd3zrLKNQEgAA19SSHu9vI0Jbz0ttoqS6e25lzk7xmUIyCblDpI3DmbKg3QjA23PokbGzgz8ps6Cc88mqZhb7Ede4UycN9KMGG1I4C+p3ESGbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329229; c=relaxed/simple;
	bh=G/Ba14Phk+5myP3ahXki98RYdzJiFF5Mu8FGZGklI4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zmun8p8+eXSJJCinAoy4bxX7/iIiVp+teTpfqNgjnsrg4nYvbmhF73ml9QMMf8/X9Ve+S9FF4XWYCgUzwVQEO6X7Zl7X0leFvo6QVDa4tihbLHxsmCn8gkxQKq/XCs1xbOkPT2IkxTdI6+HvJIra3aHlMxV9Jauv8xIzzc6LQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Owp8rU9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889a9SY012487
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 11:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SYd+/4tBi4uRuiBSAgW74S/nrmFmbZ9KidZtEig3lzk=; b=Owp8rU9Fn8ikQEhI
	71aF6aQZEr8vQ0H/3EVViSDOwCFQYIVGwlEn9vyKBKE72WlMg6uRNkO66TtczNVq
	312EV6MBrCSyqCNXnbTp6HLH7jSnQlp6ahrQCYqqGWegrVDr/nFRL6two33iEhur
	h6pzoqvwD/FduGTWCkNKjrs/X0/79cQ5GsTw+Ns1FaTbd04ixEUPDkdHjmZ+yb1H
	jkz+3R2oWOJwPtjLbmBa3/9mnIJfVSpYpXOG94WpNoNRwCxspTxFv7sT/x+hZyvs
	2m0bYgGWEjPi18sqQIgTEHrUjp1PdOJVLpknu9V94k/xdZSuToIljZOayMlmcouX
	geVGMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8vcqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 11:00:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ca417fb41so50945275ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 04:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329216; x=1757934016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYd+/4tBi4uRuiBSAgW74S/nrmFmbZ9KidZtEig3lzk=;
        b=C0rMMdnFdrxIbGPLL3HF6WofaF0BbfT4uasl6RqWGvlf3L4ko73fzsWRQ+Ekm+h4Sw
         +QwajQd3Hb6S1cCwwm7/6LZNjiUKT88DoN6r6WIDdXu5Al/4CADI/aP1E72yU9UR0KpV
         SBOKVHSS+qhaxfL0OcU/1dDOHt5CIHCWcPU1l9YMBac7nebmus1QWL+YTcbpV9hvetdE
         CJDh1mBBuODOBEaBg/4h7UWWona/B8jQpTtz0aPyizrOHvr8sXdESUjRhGaS6yihBAXr
         9JWjqZQ+NhhUeAXchrnsJoQJKnftNhIHo0l7R+PnToiVosgwdDLFLeNWy1IokN4Ytp8o
         3Ifw==
X-Forwarded-Encrypted: i=1; AJvYcCVTZX3UgRp+6/Wnhzau++TUgmCpISU8sZCx0XXUubjk1kI+91cFQ4EZxtK0KYrH8FX70nZfcRtvqJNCBdNO@vger.kernel.org
X-Gm-Message-State: AOJu0YyibunTt2YxS8OhwcNc2Cv80nSgq05BzUHx7PFA36dn1EhE9Cat
	vP4esXWPfhbNOpd4MvxvJyQKEWNoqIBLs1OSmaNsDxMMXu05XlIw5BS3B0YYslSi+eH1qrCXxpj
	JC91q4yGXhz3QPEz5LgeWHsoh5pooWcDq9roRAlqdB81a2gSwY+aB9kF+6arx2oSSHc8T
X-Gm-Gg: ASbGncsRN+iFGB7RtM9EGA3xfl1jqhNlRPHZXwbT+fu+K2uMohPT2G9m/WeK4jXKEZN
	H14SMVYIe5xO2ZtlrRDro4OKA7Seq2t6yCQMD1CxUeL/xpeVqmy2MkGJLQR5PMhsD1KVWB3fpXM
	DAuFIho4VWRXNVjvJ1ir89K0PevU9jMz9DPK4WsKQTcPsrc/kUjYQfO5JRs18PtlXu2YBU85SXQ
	pzBMnlpcQu80z1B3//A6CN3Ojj0oZ7qALvc7PDHfnnE82yxg6kDx7btoMI8XawrERQx46mTvisY
	5XA5DZjUJY3xKyzWHeVCixlHCpF63Lu18R5mGjp0my8oYSMIr99G61bprKGxiHZdI9J9OmXG4C3
	T3Ui0IiWJ08+MKeYRAoyFWq2xXxBK8+s=
X-Received: by 2002:a17:90b:3fc4:b0:32b:60b2:5fc6 with SMTP id 98e67ed59e1d1-32d43f9568bmr9615677a91.18.1757329215717;
        Mon, 08 Sep 2025 04:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7lI3U3SPCn+R/cTeBjZmrLv2/beqgvDHxI/eyb2oUf8c78PZXedihCbA+yCj1T6jDeNNjYw==
X-Received: by 2002:a17:90b:3fc4:b0:32b:60b2:5fc6 with SMTP id 98e67ed59e1d1-32d43f9568bmr9615630a91.18.1757329215136;
        Mon, 08 Sep 2025 04:00:15 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32d89f32ebfsm2430310a91.0.2025.09.08.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 04:00:14 -0700 (PDT)
Message-ID: <c30b4f6c-3871-48c6-8836-a087b5fa80ce@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 19:00:05 +0800
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
 <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
 <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68beb749 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gsM-oFm3a_Sh21p_ijEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9RCeR7z7Mjfk3QwHrHGTwdxCIriZvvfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1AOsEm7HYiNe
 gki6ckxIzJJ6azPCgDKmFs+bW0rN1sIpQ6W07hNkDk4N2pv58qltP8xThu3A/6gSGW4wpnzbrzD
 uXoW5R6g/Z41DvjFTkFPRkaogQor7D0Vv+/MW2XZCAv1J9ggU266W25MxtMQ38QpHN2ARZQNP9x
 GxrR3m3JK/zCcZpW/1uehAF9S7osHhKKA2fEt1IAPUj1PGs9OElPKSwGMe4jupPqVNJjIovXJfy
 yETBYo8hhxfmNODqZcwcJxNUKcFZ5sEvBmMwU9yu4CBwREneEJ3VSlKTRpQFekpz4MlzV8h+QnI
 wjozyY4DnQ+nmC757d4ltM2BJbIKIwy2gQA1ZgetQ6HrZ9o/i91WXx3zZuu245T0RatF3PWwTrQ
 YbyjXnfY
X-Proofpoint-ORIG-GUID: 9RCeR7z7Mjfk3QwHrHGTwdxCIriZvvfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 9/8/2025 6:04 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 05:46:30PM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>>>> Add compatible string for the DisplayPort controller found on the
>>>>>> Qualcomm QCS8300 SoC.
>>>>>>
>>>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>>>> that supports 4 MST streams.
>>>>>>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>>>     1 file changed, 22 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>>> @@ -18,6 +18,7 @@ properties:
>>>>>>       compatible:
>>>>>>         oneOf:
>>>>>>           - enum:
>>>>>> +          - qcom,qcs8300-dp
>>>>>
>>>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>>>> new one?
>>>>>
>>>> I think we can not use fallback to sa8775p, since we don't have DP1
>>>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>>>> really used). So in the hardware, i think it is different with SA8775P and
>>>> we need a new one.>>             - qcom,sa8775p-dp
>>>
>>> The DP controller is the same as the one present on SA8775P.
>>>
>> Yes, it is same.. I just want to confirm again—even if we only need DP0 for
>> QCS8300, we can also use sa8775p as fallback, right?
> 
> What makes you think that we can't? Let me repharse the question: which
> part of DP controller (single one) on QCS8300 is incompatible with the
> DP controller on SA8775P?
> 
Sure.. got this point.. will update next version.. for the single one , 
they are same...

Thanks.>>
>> static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>      { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported
>> = true },
>>      { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported
>> = true },
>>      { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported
>> = true },
>>      { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported
>> = true },
>>      {}
>> };
>> .mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.
>>
>> Previously, my understanding here was that we might need a new compatible
>> for QCS8300.
>>
>> Thanks~~>>>>              - qcom,sc7180-dp
>>>>>>               - qcom,sc7280-dp
>>>
>>
> 


