Return-Path: <linux-arm-msm+bounces-78495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D833DC00027
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 364FC4F7E44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB4B303C9C;
	Thu, 23 Oct 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZVvmyj4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66225303A2B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209425; cv=none; b=By5zBbQnpQ6PlQIFimNcq2Y+en/aQ21Rm3y6F2Bj7lwGl3gRfUQgpfXt50XiYlxh3fpl263s5ctw704yxwAuMTWuiFKsou/1rCaomp5ruiood3mTK1mdErRYXmKFBi0JhdF1O0t1XQjALssIyY44P6VdYxJJdmJz5XQe3Y+ath8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209425; c=relaxed/simple;
	bh=OMKnxUqr9ND8NblLPWP0eOPZ9cYwdnsAwoYbevDZ5+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbrISarJFATtvD7+36bCXzruBnnuaP34SlQZ1RcEi608AyZBh4PRE6yhe4eDME/S45MklmFmfsFLFvpgZySnnmnx/fxVTXvjnRaRWJzQSClisEsBiY4QeiqdiRpxoQuwFzNH2V+nhW2mMgegxoPM35hnjlTXC1tDStOFVoW/uQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZVvmyj4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8GQV5018500
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OMKnxUqr9ND8NblLPWP0eOPZ9cYwdnsAwoYbevDZ5+4=; b=EZVvmyj4uFp0R2fV
	JeJ9KNrnXx/83rEAEnhbduhhXJ99Kz9VB4IwkB44smUXQJ61Ej3uHLYIhjIfg+Ka
	o20JMyUGs7c0tnD/nCdncT1JC0H+FFnLrKXrVoSrAMx3CDt9ZOaUX9HNlkKRy1iO
	BULRdNblK2EJ+nquSe8IbbkIivsTwtz+mWS+MP28n3A7Ep6uKFWOMSuwNLk5TAU7
	k6g1juL89YU+pgWjffzdYbirvq7TA6Lv2le6RLIPepwMfPHEdyiOSU80GcNxDfAQ
	wVL1P9MRhAmwWeSakT9qRIXYNQwbijIVCTFHgNyu9pRAkQzp5Kd0veskwt1eVe2o
	DTFQYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhnr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:50:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a272da5676so209324b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209417; x=1761814217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMKnxUqr9ND8NblLPWP0eOPZ9cYwdnsAwoYbevDZ5+4=;
        b=Lw5dTOsI87Y40ZPft8KJ69naICNea/JogEd/Kp4uu5LyKk6wbY0IrPKRRG36uWKcsT
         r+bEsh66Vsi6OwqEuKG0Rwdb+ZFfxL+7QbFw1Em2CHW8vnbe/Db58OjCuqIlr4JRHwas
         NvxrFRyjhX3fymG6tfqZQqr+TZr4P0ACT6eqA0ZbSa0FI91YUuPeYF33VA+He0b9R2gz
         hKDh1BMKVBnHkjmqUnEAnFHewjiGVL7dWJqYQEJHcUy5GzM1fSrUpvQ3J3HiRwZU2vaS
         7RUxW6Dt0UcHxH6K/oTV12at9aUZ3p3JoUfq2aClLsUMjOIxBjvI23v5WEKjbq78dHVU
         z6ug==
X-Forwarded-Encrypted: i=1; AJvYcCWeO/xoDWCtad4c5EbwryN6qdwTdIMno/sysAJcb9LwW54gnHXD/c+dGCtLSZXXVjfY1KXX+FtEmC/DDS+8@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSKatom90/7t+rHU4bAP8V/hyZZoseJpJpbUjlZBGm2yRnN2T
	XyyKtQRA/+qiBG0URC0nLO15w9RKwHNSrIIAQC4McK+nnu0Ey1NdsoDurnkHitUVcutmVSwdEt7
	fUvb/+TFy+szS/FXyM7+HCzjBEOU4cBEdAbizaqVs6lXMpMwYLqdgAA3c2KhCtzYGWPJ6
X-Gm-Gg: ASbGncufk7pAwNIWYKWTM8B98Ri/uXlnV5c3WLsNKwuvP+Yjb7VkU4lTFf07nWCGdrm
	4vg05QMfJyjTYHsKiXPHP3fpFQ5aEjAta1JEv152xMwE2QUlJ/D9Ga9ZwfDnQ/vXLpX8DwfPbyw
	hhqjG7Fbik3q+LEUjJvcLRyndzXVSVf5/2ktVGgnc4C05NtS3Mx6ZTAmHRDGeId/gAJLMozLTfh
	s9cEHglm0AkGhnKXS5NMrpoPyzJFw2sM/qLFf0e2wjJ1QijzblLO5tosFGtceXtsDL4Qnj4Oark
	BHCXhVTj8C877CAGhw6LzcK28xUW34TLQSEwFbup5a4qioiuIVv7fgXMekH2nfQifw1HN7k3WWc
	FRKhKLXkUg0hbweKDDaRnWe88VhwnRlwL+it92FC1BpwdqRvKxCmx4GR2hYJrTSLOgH/mpA==
X-Received: by 2002:a05:6a20:d80a:b0:2b0:ff55:f838 with SMTP id adf61e73a8af0-3393189436bmr6910787637.3.1761209417378;
        Thu, 23 Oct 2025 01:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMne+EgLkcUdrIkI1VqQAldalOI3LplCWH+quMwYft+tzjn4ldU/yUSpq3PbB/3w7ARbB6QA==
X-Received: by 2002:a05:6a20:d80a:b0:2b0:ff55:f838 with SMTP id adf61e73a8af0-3393189436bmr6910774637.3.1761209416844;
        Thu, 23 Oct 2025 01:50:16 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a5fe26sm1800703b3a.2.2025.10.23.01.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:50:16 -0700 (PDT)
Message-ID: <d048a875-aaa7-4db2-9ef0-daab94bc123d@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:50:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
 <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
 <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
 <1a787fe1-20ba-42b7-a94e-cd1bf465f16f@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <1a787fe1-20ba-42b7-a94e-cd1bf465f16f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX/vAK7ePl6vhi
 JFScKO0BIioWpm6mfjQq1ChBLuYB+ozAKBG0Oh6/YKdazHjWY5WAyxQ4nU/i7GrctsP91jJlkTg
 CG0rf+kgRqHHXngs1bONior92Wwhs3cHNFSZ2sUR5oohFylF05bkED5QLsefzImiFiORcapXJhD
 5Em7opBoLZEuPUaH3yO/D6yFrHszW3vjsbQgiU473igzowqwkPXDV3/CDUOqQFE0QysoETLUsVv
 rh4sS1PqUAwISx7j9gfGrkNaqhEV1RokzcGvTzPldWa21Lhl4Vg3urdYaLeXtnBpFlUYWLK0rmm
 OtAsscn4Y9wEnmEjzPTIDs7aNya6u84yVyIXyT+ntpKwejU7zNzVYhIOd5JdYapSVsyXcpN3xBQ
 Z/kYtiKexgX5vYnDRNdAe4w/rR57Eg==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9ec4f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Yf0QdHFY1VziTJGLG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Qcz6VwI80CimYewjB4471P57tuTxVFGh
X-Proofpoint-ORIG-GUID: Qcz6VwI80CimYewjB4471P57tuTxVFGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168


On 10/23/2025 1:10 PM, Dmitry Baryshkov wrote:
> On 23/10/2025 07:50, Xiangxu Yin wrote:
>>
>> On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
>>> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>>>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>
>>>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>>>> compatible with SM8350. Add the SM6150-specific compatible string and
>>>> update the binding example accordingly.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>   .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> @@ -51,6 +51,16 @@ patternProperties:
>>>>         compatible:
>>>>           const: qcom,sm6150-dpu
>>>>   +  "^displayport-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,sm6150-dp
>>>> +          - const: qcom,sm8150-dp
>>>> +          - const: qcom,sm8350-dp
>>>> +
>>>>     "^dsi@[0-9a-f]+$":
>>>>       type: object
>>>>       additionalProperties: true
>>>> @@ -132,13 +142,14 @@ examples:
>>>>                   port@0 {
>>>>                     reg = <0>;
>>>>                     dpu_intf0_out: endpoint {
>>>> +                    remote-endpoint = <&mdss_dp0_in>;
>>> Why?
>>
>>
>> Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
>> It seems the two-space indentation under port@X and opp-x is the actual issue.
>>
>> However, that part was not introduced in this patch.
>> I will split a separate patch to fix the indentation there.
>
> Note, you have two different chunks here. The first one is useless as it adds a graph arc to a node that is not a part of the example. 
>

You’re right, I verified with CHECK_DTBS and it passes without it,
so I’ll drop it in the next version.


>>
>>
>>>>                     };
>>>>                   };
>>>>                     port@1 {
>>>>                     reg = <1>;
>>>>                     dpu_intf1_out: endpoint {
>>>> -                      remote-endpoint = <&mdss_dsi0_in>;
>>>> +                    remote-endpoint = <&mdss_dsi0_in>;
>>> Why?
>>
>>
>> Ack.
>
> Use YAML coding style (two-space indentation). For DTS examples in the schema, preferred is four-space indentation. 
>

Ok, will add a new subpatch to fix DTS example indentation.



