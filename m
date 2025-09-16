Return-Path: <linux-arm-msm+bounces-73704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B4B59570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6470E7A4267
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACED2F6567;
	Tue, 16 Sep 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eixz+GBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4CC307AC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758022929; cv=none; b=g5XiZ9egdBJukoUEL0Ev3bd5GSYq2PPD/65Z9Ub+q+r6+VK4y2Kc44ysHxOvaCWEM+ECX1ztTFb7iVAzWxSOC9VFN0Fpt0vHQzviYqZUk62P/pZJ0nV0Wp3QWyD/95nW/GsUGpRZF1IGS5J9UvyqSY/ZSbPeh5FCte8PqHeH55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758022929; c=relaxed/simple;
	bh=ItCejKcUBQOoT9M8KlOYQZ3ktYfk/sp33f2g/MgsGMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXIe2anyxFGvGtbUGwOF+tjK7MYhIJ4F/1h5cTqV9LhCwXG8eb/VB7c53gl+HwyNVd+uQ6duwaBmNnTiLk34+O8HktLrn69kn6A4GRCWN96Da6l2TEdd2O5WmF7WhWZwm3mpj3BcIihWrgAuW9AHlST0mwCQYwQOMH/BsyAa3ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eixz+GBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABOIf005605
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	28jT5eJY9ZKsO53A9rpLGgzTqembdzTWrpkXeaPHOvw=; b=eixz+GBt+PeG79J3
	oCb75uRzMSwaY/lLMulFmfqSANh2rFRGoTTjs1HveZCIoiu4jPoi6tzONPwYolos
	Xxo+RyCxgZzei1e1NPP01+LSQIzPUQclpvs5s0h4AazOjSxVL+F1gl4GxZ4DN8VV
	PXY+MYj7i8cWKZcMS6Bwh1/sigq/9//FWpoVV6xmMeoJCWAduU85pLSkEG19Qxw7
	TVpTsgxuqGTgs9haxIwTL4sZIfAvDyYIvvUfsidGPGFWn9+9Q0sLLGduoMwWsIQi
	ZHLNkV5VzNGBTOBvTnR+k0JMjAOSLtV1Jp5JwUsd9uhZIcYw56ijqp6gg/7eZdD/
	D8CjGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58msr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:42:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581a191bso8667345ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758022925; x=1758627725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=28jT5eJY9ZKsO53A9rpLGgzTqembdzTWrpkXeaPHOvw=;
        b=hLgg2VRc1/uTCrQWMkGAy/SSSvzthSkTC54HtXsjkHlQBulNJvIFIBOKBvcnDzeT1w
         WcHUnLV9rJ6Us6htrVZT8jLF6g4sdX1fw6jsGmj7dfkxmT68YyPrnDcY4/KK/GQdZAc0
         IqT1L/C2MIuhpA6+TqkVCDHq3crI8STz9/JPGCa6rqK/S1pEXzpw0KfSYm0LAuzM2liJ
         Zf7BQAA85XXaAZBkDwcXZ3poRfnfV1hGLsK4SSibuiMPUgsbyBdBWrl5FyxH9ryvI+kp
         hGIOvw5Hydki21nxdskwXt5cvkZEhDzEYQdHFGxT9t31mjuq4icbmY72MS8reIUWowdx
         9NFA==
X-Forwarded-Encrypted: i=1; AJvYcCVRa6TF/EEN3iiI0hk3YR2J+YabHcccHSrNn+yiD97ndv3gw+hBcPKOTWr42k+sqIwPC5FeEpYiH+k8ZbKH@vger.kernel.org
X-Gm-Message-State: AOJu0YwiXMEDSrVbp4809aHwJdu0Dcfu3MZolrsTVMu3PvUQZSsNhxmY
	60yEqyUP7YIMXRtWQC1GgDHeKVCeRLKsQTXjzJ5dkTxc7WJlcgHox1cTnsjZOhlstQ5HT3c+zLb
	T66kf33jOP3cP9jsIlJ5Q39muHMhTyWenwIMcDGQREMZ4Es/VpkCLqW8Xm5g92ydNA4+r
X-Gm-Gg: ASbGncsJQAyyFtzMV7W/TiWfimnflCb7azFnwl/qcoaLQTmOKuRTdoktv0OECip+KR2
	kTF4xk1yCrAybBGr0GQPemq+00bLczZP5PwVQodEg8XSN65a0Ouahb5ykAbon+5dwryc1N6rqqU
	hjP72FJYGP7nbmG4CxTRNAZlDv8dH4JaBLAKB2rZ/86mw2ijJyBUBOzDPheYa3+AHUzVkonuBl/
	cuSO4K7kkWVMcHX9KWknRccCPiepxXCdKhzAfcogEKVwFwNvHMtK0QBWHAnBRXSMcNffuaqrNKM
	lIAG/pPRRg5P9IUa48RHPNgyQdllOi3D6AujcqO+ScheW9qkTt1CmhwT/hS/ri7Z869Fam+asIc
	/U2X2ZlAgjuw0DioulhwhvZpZrBXrmd+SaoM=
X-Received: by 2002:a17:903:1c3:b0:263:cd95:9c8a with SMTP id d9443c01a7336-263cd95a9f0mr71971085ad.3.1758022924712;
        Tue, 16 Sep 2025 04:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWylWAJjgYMxeXH1aDjbmaNpm3PYB57mwZg670WRfZJndDsocIiuW1GfqYWyIhKbdR9hVdLA==
X-Received: by 2002:a17:903:1c3:b0:263:cd95:9c8a with SMTP id d9443c01a7336-263cd95a9f0mr71970535ad.3.1758022924093;
        Tue, 16 Sep 2025 04:42:04 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b0bbab01sm35190095ad.116.2025.09.16.04.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:42:03 -0700 (PDT)
Message-ID: <7acd7bef-a70c-486d-a052-4a544d751d16@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 19:41:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
 <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
 <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nEiq3cIT6UcEY5nT2_GuZ7rQrNOx4RGk
X-Proofpoint-ORIG-GUID: nEiq3cIT6UcEY5nT2_GuZ7rQrNOx4RGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX4hlGtUS8P0qt
 as+hXadSt6NoggKRHYCGpK4E79lt3C3B0qKkn8q/mE4VRwKUY8yEfCfHHsvhrtS7jHlWT4h52C1
 tGh0n0RV8PAnv5YpepLkhHe7KiozplikjQb+CgK3R0Y8w6VPR0MdhSFyBdCeUFTtpTJWcEow8/b
 BLgBVzO37CBtIT6nt/6vIIdwO/1giejER3boKA8bYcCVHdyC87SHS9dJho+plvKHE/4LtTTpAvO
 7fmRzpnYbWheWRvayYVnu3isqgoQrsZZvOTPGxw2iUpV9M+IKMbIr7UfR7tHfvjA6Vy7/p1lMiM
 OBTw+Z2yZdR2PoX3GVoINMrBWpkdN+9UcQc+jDgYUiUu+t4dIyjd95Vg6uCslRYOg9WRq5TZma4
 Zso2Mavh
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c94d0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=07YUQ-M1LMe7Y8jrGJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031


On 9/16/2025 7:37 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 07:34:52PM +0800, Xiangxu Yin wrote:
>> On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
>>> On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
>>>>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
>>>>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
>>>>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
>>>>> for consistency with existing bindings and to ensure correct matching and
>>>>> future clarity.
>>>>>
>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>> ---
>>>>> This series splits the SM6150 dp-controller definition from the
>>>>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
>>>>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
>>>>>
>>>>> The devicetree modification for DisplayPort on SM6150 will be provided
>>>>> in a future patch.
>>>>> ---
>>>>> Changes in v2:
>>>>> - Update commit message and binding with fallback configuration. [Dmitry]
>>>>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
>>>>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
>>>>> ---
>>>>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
>>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> @@ -46,6 +46,7 @@ properties:
>>>>>        - items:
>>>>>            - enum:
>>>>>                - qcom,sar2130p-dp
>>>>> +              - qcom,sm6150-dp
>>>> In the review to the previos iteration I think I was a bit explicit:
>>>> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
>>>> agree to it. Now you didn't implemet that. Why?
>>> Sorry, I misunderstood your previous comment.
>>> I thought the recommendation was only about the commit message, not the
>>> binding structure.
>>>
>>> Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
>>> fallback to "qcom,sm8350-dp"?
>>>     - items:
>>>         - enum:
>>>             - qcom,sar2130p-dp
>>>             - qcom,sm6150-dp
>>>             - qcom,sm7150-dp
>>>             - qcom,sm8150-dp
>>>             - qcom,sm8250-dp
>>>             - qcom,sm8450-dp
>>>             - qcom,sm8550-dp
>>>         - const: qcom,sm8350-dp
>>>
>>> Do you mean modifying it as below?
>>>     - items:
>>>         - enum:
>>>             - qcom,sar2130p-dp
>>>             - qcom,sm6150-dp
>>>             - qcom,sm7150-dp
>>>             - qcom,sm8250-dp
>>>             - qcom,sm8450-dp
>>>             - qcom,sm8550-dp
>>>         - const: qcom,sm8150-dp
>>>         - const: qcom,sm8350-dp
>>>
>> Or this?
>>
>>     - items:
>>         - enum:
>>             - qcom,sm6150-dp
>>         - const: qcom,sm8150-dp
>>         - const: qcom,sm8350-dp
>
> Yes


Thanks for clarifying, and sorry for the confusion earlier. 

I will update the binding to use this format in the next patch.


>>
>>>>>                - qcom,sm7150-dp
>>>>>                - qcom,sm8150-dp
>>>>>                - qcom,sm8250-dp
>>>>>
>>>>> ---
>>>>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>>>>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
>>>>>
>>>>> Best regards,
>>>>> -- 
>>>>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>

