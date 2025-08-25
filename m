Return-Path: <linux-arm-msm+bounces-70537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D10B33460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 04:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776C31B22B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 02:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3179723AB9D;
	Mon, 25 Aug 2025 02:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAclPqQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB501991D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090749; cv=none; b=Qj/58QkYGIy/CUzuF3PvkfH3RKxki1GOtx0BmUe9B3uKMkgJyYJgCt29S+hKTnr/6IxLhANTeAzTWI1d6HCbt5PNavALJCmp2Y8qHNeByaU6fuhfpTif0FxHg52a8tbhQduYiJIJFfduhB6DzheHl76zgsYKnjwxy6N/dHA2hSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090749; c=relaxed/simple;
	bh=5TMb1g85npFy35XP/6ZEqzFaGrqT59x8sgiDs2SLlmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Km8+D3kLsPCaqLyvb6D1iiVpPNQy3Nxq7I6xdXfoT6KtcMJSY2Z3zlE82f5ZxAZlD3cch8gHT4QfY740jSrz3wkMKMU1r1xXHG+hnIF4msj7kEw+ttYusqnMOLCxc+RUwLsxwXTa7FV9RERQ+JKKT/6cNGy3Q0h6zzrSdH8cQic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAclPqQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OLwOf7010931
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pla/QjB44tiQOdRaYME4jtbNLH66yKqPkqc6mc3uXLw=; b=MAclPqQOoaCcJrB0
	MOKE/I3Wu2WONO49XLCWibfXhyT4kk7HWz4BDdUXwcZGmJd43vDuIDOhmKOgSMsf
	rTPWw0qJOXmMHpwd8DlFzLdNo0r5HWxU3dafDTZVQWovELV04R1qTw4zGmFCQFTF
	09j0AAB7jUXLCrpoZiXX0KI4Rene+i4EgyvRqmhH6Q7JpYmUw1UntETvexbx9tBn
	gHtYTzrb+Gm9mnUp7IC2WalxkNXkMo82Rezpsiikz0g/1IfMzWMUCxpD0jE1kpEN
	C612To1uFvuNQxkFV/3tbYbV4lgbRFeRgN6BX5E+FdfNikbbyEdUvHUA+B7Ex7l6
	bZLmhQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unkefm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:59:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-770562b1ed3so1598239b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 19:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090743; x=1756695543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pla/QjB44tiQOdRaYME4jtbNLH66yKqPkqc6mc3uXLw=;
        b=EvVbPqO7p+PqNepkmd/CSd5mSU1DIAm/Et+9SQM+QqEupJGr/eLWMO26ApXr9V8RKA
         MUSXpRPtkTARXYKQdWaYsZho2nHlfRmkNmGzhbZE9TKh7SEULWQUIbyIUSBGdjrKINZ7
         qg2dgYmppHNFiQbeOgjkMknaIJWOfOvqKGA1HmFLzCvlk9K1ewd06EA24Czzd8dH3RLa
         woSFfP2lzM0wa1doWet/guh9UkE5aSm5PtSncwr8rz8EQl1IPchf4zkrJjQ1hqlbPi8i
         /EzeImTEf2OwsFYVO/APCl0F82CK4lOrmJsUUcI761mTNRq2a/uQ5xLaIn7DI2KKwcVP
         +swA==
X-Forwarded-Encrypted: i=1; AJvYcCWVPoCcGAY/++zujzbd5uqc8pBUvR61FCgQxCeKCOybRWPAiQ5O3htm1aWBt/u0lb/R0DL3/t9NVl6jV5at@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2PWDQLJrZqoSUjbaDr7Zii+wZpxb82jtix/CuWWXnFpYazxn5
	FVySVw/jR+IHZ9aAVG+X8VCXaOOcwGEiMIyzbyO2/rkzDuVK9fgyfzd/7cNi0/l5SoFvTJWjGSF
	FtH6hwSkGDxwMsvtpAS2Zz6L70gpEhAyPv7Z+OrJ+UyWm8OI+wqne1ALjPUdUghlsit2y
X-Gm-Gg: ASbGnctZrovgM9H5PnnuNWVpzIy/MBUtjQUnK1dkY39A0CNZ8l/woYgsZ4wsG/DFKI7
	DMzKnrk7xJ0D73si8vVPhxKZxXKVUFqg753kb68dD/B5uM5/AgxDdBylozZ9Qatk6LorbfbzIEO
	KQVEFywgH5qAzkH7D3FhxB8udUZLV3zhI2m6g91MgA0Uw8Ded4pmZisCOzRVuBFcYsia+dK9aa7
	+uI01aY2tlpAMO28WE6sSI7z3/+ZdusFa2W9KU4vSX7t6ilqMPdvsTQqD7NgLifHeOM/CMrCbTu
	9+WvhlZgZuJHaNpZAhasHmakt9jGOqqsopBeMeHTeGzg/3TuDQV5wnvG3oECjBTH6Wo9eyS+Eq3
	BDUBoD7IyOKBl5q2n0Qw5TwI50ai0754=
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id d2e1a72fcca58-7702fa048d1mr14178778b3a.9.1756090743352;
        Sun, 24 Aug 2025 19:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCpI9lwwPj/ghs95Ybuszk8ZhygB0e+mYXnTFXl3eSB1K0RxyvY+gmOa2bAJx/E+5Zx4Bxtw==
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id d2e1a72fcca58-7702fa048d1mr14178751b3a.9.1756090742854;
        Sun, 24 Aug 2025 19:59:02 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7704000edeasm5911077b3a.45.2025.08.24.19.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 19:59:02 -0700 (PDT)
Message-ID: <65dfd4c2-37bb-4d99-8753-ce17e17097d2@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 10:58:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
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
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
 <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
 <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
 <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c7WJoZMGYeBGdMetc9Xl4fW9QCLrNUwZ
X-Proofpoint-ORIG-GUID: c7WJoZMGYeBGdMetc9Xl4fW9QCLrNUwZ
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68abd178 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2PmUQm8wz_2Da7m3RkIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX4msVfAuI9fzb
 VO3hKkshV4K9t2cta2vlVFw3HMdU8UuvJmq8e0qq9wpprsC5wnNLAWoNdQOH0+TAbH6LHc/daby
 37RroAeeK6/mWYs6l5lsLNBRDKTVng+Pu6agjSLMvnBB4Uxp3VZ8+FZQ9ljs3qehgQnyck/RJWY
 qHHgm949uat/kmmSDwRMqpOzGsh0NGsQ7MB0/yRYH83393vYLaCcvxILwPaCDXj6eswot5R/oxd
 h4IxqxmHaL5sdUBa8VNwTrVwftMnJbZcPmzOCww9jrAGDLYAoE1W8xfGxLaoLAmwkRwQIF0XY5O
 G4Zb9NXh/7QLlvjTQsBfLQwtH7z3SR8eKKQa6C08YENAPEYheBWiQtifMFg2uBQ7zhAWjOxLBx6
 vi8ZvNED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031



On 2025/8/22 18:34, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 11:06:58AM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/8/21 18:28, Dmitry Baryshkov wrote:
>>> On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> with same base offset as SM8650. It requires new compatible string
>>>> because QCS8300 controller supports 4 MST streams. And 4 MST streams
>>>> support will be enabled as part of MST feature support. Currently, using
>>>> SM8650 data structure to enable SST on QCS8300 in the driver.
>>>
>>> Bindings describe the hardware. There is no point in discussing the
>>> driver here.
>>>
>> Thanks for point it.. "The Qualcomm QCS8300 platform comes with one
>> DisplayPort controller that supports 4 MST streams", do you think this
>> description will more appropriate?, only discusses the DP controller, not
>> referencing the driver or SM8650..
> 
> Yes
> 
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>>              - qcom,sa8775p-dp
>>>>              - qcom,sc7180-dp
>>>>              - qcom,sc7280-dp
>>>> @@ -179,6 +180,7 @@ allOf:
>>>>              compatible:
>>>>                contains:
>>>>                  enum:
>>>> +                - qcom,qcs8300-dp
>>>>                    - qcom,sa8775p-dp
>>>>                    - qcom,x1e80100-dp
>>>>          then:
>>>> @@ -217,8 +219,9 @@ allOf:
>>>>              compatible:
>>>>                contains:
>>>>                  enum:
>>>> -                # some of SA8775P DP controllers support 4 streams MST,
>>>> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>>>>                    # others just 2 streams MST
>>>
>>> QCS8300 has only one DP. As such, it doesn't belong to this clause.
>>>
>> Emm,thanks, i got this point. So here need add another clause only work for
>> QCS8300(one DP controller with 4 streams), and i put codes before
>> "# Default to 2 streams MST", is this the correct place?
>>
>> -          # Default to 2 streams MST
>> -          properties:
>> -            clocks:
>> -              minItems: 6
>> -              maxItems: 6
>> +          if:
>> +            properties:
>> +              compatible:
>> +                contains:
>> +                  enum:
>> +                    # QCS8300 only have one DP controllers support 4
> 
> typo, controller.
> 
Got it.
>> streams
>> +                    # MST, no second DP controller.
>> +                    -qcom,qcs8300-dp
> 
> Missing whitespace, drop the "second DP controller" phrase.
> 
Thanks for review and point it , will update next patch.
>> +          then:
>> +            properties:
>> +              clocks:
>> +                minItems: 8
>> +                maxItems: 8
>> +          else:
>> +            # Default to 2 streams MST
>> +            properties:
>> +              clocks:
>> +                minItems: 6
>> +                maxItems: 6
>>>> +                - qcom,qcs8300-dp
>>>>                    - qcom,sa8775p-dp
>>>>          then:
>>>>            properties:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


