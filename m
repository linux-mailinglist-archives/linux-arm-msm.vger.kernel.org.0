Return-Path: <linux-arm-msm+bounces-83729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51888C91A76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 584FB35387B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8010430C36E;
	Fri, 28 Nov 2025 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZEbDkb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rid6ZssV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02EB30BBB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325802; cv=none; b=qDnb7mKR/8e+kIrj0FIeeFUnE4ujppC5lC1aisZItyaA/rCcm7JGFTAR2xnB0tEfOUyEBR3fyC5oUiPXfQi4tQMao9xPYDWLC9DomEVypG9WxSX+l8j1g55psiTh6iPxW5VU1MYsf2dtGvYf9Xe2P8JiXErgSCtjo1SBv+iSHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325802; c=relaxed/simple;
	bh=QfMmY4fq4h2LlmMXfo3q1cgha5XABUgcuWxRZ0moGEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEUIppW2Md07d/16LUPspkrGhjH1QkgKpOD2DdD9KNcZ/iA6EZGWL0TZrTL1fzBot7m/4cc43DeiIR9fewnpRQEQ/kuLNc43grVjtNjiFge3ZmyID8lBbp6K/zH/hhb9EwyVVEdMXqj/u9thtUaeHnHkR9qwEYTNXYUelImWAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZEbDkb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rid6ZssV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OZ3L3530961
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXYe6mkEGh2S9MaO3kzaYD413h5MGkk3YZfCvxtE4L4=; b=PZEbDkb+BqjLoTmE
	IbyuGH7VoaiCQvyTQmkFm2FKHTF90Di7/MYUopCAr4Tr/LYRuRClgR+kiafJ7O6+
	zIJwf9VF5vwC8zMMic8OLgG9XYbSqfuc9OVEXxFPj7XM3zvD0Dfsk6rM5PB0HZ/D
	F09gDc/9wIkJ5VVBgkuqS/DnJE/7YpQjOhHzMgJuKW1mZIJdvqLt8+MIE8HX2vjm
	2cFLeuoZx3xg73U62D9Y8mIX2o42NbybzMWlN0dDZN6EsfNB1nWGLtah+keJTAKO
	I7qLApzCDw3wlkk79f8qD6vORwb3q5QHThU0cr36hiKgrRIBNg4ud7RbnnQnwFLR
	bbxynQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2ru6h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:29:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso2958609a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764325799; x=1764930599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXYe6mkEGh2S9MaO3kzaYD413h5MGkk3YZfCvxtE4L4=;
        b=Rid6ZssVO4RaiJi5tBDE6b+CZNJZ1J2BzLRyzDMXYTiICahq/k/Lswl3bTTb4YINtQ
         5fe8RRK8FUHRlUBv3ID2afAqVSn5pqCvEM/aSCDYHTNuRzjS59LiyXBIzO5TmxK17xy8
         PjvXRiaq6pwIHNLJ9ps+gbpSgixsPrDTvX8B++2LOwkc5pgBY+TjPtYlLKIsjWlpjP8b
         BNqwa3rKXVU4X0FMftUx3jlenbU/AkL28XfxU32Hj0Zwe0tmeBvlAg7tU0x0v7vd87XW
         vb+TFSMuWjbuOPHjgLL3MKtBuAsCndRfR8ZFjUYX2znDkGtk85wj027QLVnzrazKy9Nf
         ucww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764325799; x=1764930599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXYe6mkEGh2S9MaO3kzaYD413h5MGkk3YZfCvxtE4L4=;
        b=SuBHMEdpJ6V3+g5AoCyx2nVjs8wq9Tdbb4ZI5DtbLlCKj51e0EcdO67VfMBChs7wos
         xJFjyUKbzRzgeakQDJ8ocv+7pr1BCidhT+lqxSxGcd49Tw9fXCkC0ABRtri+mhyDYZYr
         JqpbzJJe5nRKKpaxD9VwBH+9uWiHyfQm9xnPplp4FuqeNkcHWLeq5dC2bnAhP5ZBm6qL
         uY6sEYqeUt6PNAd07xBUN3qQZgIxtAvEjYU1Y9oZ9142fNglccXsL4TZIZouTtDyz6GU
         GRrEebKnyTmI39VNXeVcU8r4VUCXj7qH3hg1QxfuwRtgGFESnbXosb858brD1Yrm4E7x
         iE1A==
X-Forwarded-Encrypted: i=1; AJvYcCXG0sDxG9SLmVmZGJgUxcYQ0J12jpu8eWc1wM3eh8YqKiMgYVmGycUDYjWaCSsDnZF6xrWhmMJbihF2mJV8@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0Qf7tEiBKX/qri6ClWiSUZRSkNp3QTwbtVemgfCO0IMGKauA
	Gbg5oVEtByDYN6wA/ty7hoDmeD4jUl7RTBCluBjddTe/8p1ExFcUEQCNtI83wr0oJYNweVtlXyG
	foL7Mf3l0liYWnkMOUFjaFWJDjgUS9kMeKwRcLXwkyEMjlUOZA8KP/fctML63uBzi0WEE
X-Gm-Gg: ASbGnctk5Rh6lIQqjTvZZklyljnOIOvrJMsgIDfKs1h/giC5UBosYNRbOKD3bYPaU7b
	2uch1eyQPDZZvku3xQ51WA7GMymbvgAKPDC7lb2VxLiSffDRlkE7Ip7TZhixCW3Q4IM2YyEUDTa
	EHKwsE2fHc9m2KlOhBotAgT+NKxwfNNaPlRiYVEK/VCZrIn559vMJJo90sC3wllPq+/yPOMWlA3
	v5rN/GUcQRcMjMRsu4ipvMplJJFndm3q7ZxK8mfM3dKHDyAqlU7QNFXVywbCNgtpuy8l/bQmBdm
	QnSN/G4i7oq5KXhirAgS+F5vgXPi79rY/Kg3jYu5S20P3hfOBaJRVq3nnCt3Gw8XSsv8fOKnOcW
	pn9aOWnfwFtTkQhPPQDZwQAy/Drp+6qJHbImMAUZ/F/kv1ddDEVrqF8ML/9ZNOkFYUYGv57I=
X-Received: by 2002:a17:90b:394d:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-34733f22796mr26448522a91.24.1764325799183;
        Fri, 28 Nov 2025 02:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFnfkDhmgbQ0LMgayTlYteKh7N8FsF3Rt/LG7x/fvdcW32kWh6oGAoVP9/VCmIhe3SG1L3ow==
X-Received: by 2002:a17:90b:394d:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-34733f22796mr26448490a91.24.1764325798699;
        Fri, 28 Nov 2025 02:29:58 -0800 (PST)
Received: from ?IPV6:2401:4900:1c27:6704:8849:8c0d:18ec:2263? ([2401:4900:1c27:6704:8849:8c0d:18ec:2263])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347600de37dsm4371267a91.14.2025.11.28.02.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 02:29:58 -0800 (PST)
Message-ID: <a6a172bc-9f76-4e12-8925-35319baabb62@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 15:59:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
 <1207b70e-dcf1-47cf-be26-ff2928932e3e@oss.qualcomm.com>
 <89601075-a312-478e-925d-3cc0b1e9471a@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <89601075-a312-478e-925d-3cc0b1e9471a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX55cjyVHVuRd4
 c+oifycxsVQaOYsmAEvW2MkZKaUfOH2lPvpS/bA3upAFVgkpr/1hD8CAhi6fHrLrM3XwHEpeBoK
 5RSEBl9UgaWsIPqEIZCCOV5RAIQV0ix9oA9XauxZKh52SM+RIRAwwcv+gcypZIhcgyb7KKDvUGA
 cAGZnpE/lqfVkcfYY4e6Dl+cltrSXfKAlZCIUqLokUJe1LJKMTewNifkZvC0/pGmtYGECcuZGXR
 JV1EVH+60BNo8Ec5Y12D2ydhcq8CL6Hw6hwHNlU0AMCN0xsRamsSo2NxL1Y2OuiIorNeOXtFhuq
 Xr8ZD2c8+omeheEs6+Tt7iZjH2/MWBpIDSDBlDZuSjIAkHdWjaBZOR9tKTlpWuDlHvMkM9TTM+x
 gz+kTpSqrEC6MMd0cn36y8z7x+uimw==
X-Proofpoint-ORIG-GUID: enu0oxLjZAzoA88Nfnckjy1y_48ZmBzI
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=692979a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8vLtEHPTFFeNd2o-lkcA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: enu0oxLjZAzoA88Nfnckjy1y_48ZmBzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280076

On 11/25/2025 1:28 PM, Krzysztof Kozlowski wrote:
> On 24/11/2025 22:39, Akhil P Oommen wrote:
>> On 11/22/2025 4:32 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,adreno-612.0
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: GPU Core clock
>>>> +
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: core
>>>> +
>>>> +      required:
>>>> +        - clocks
>>>> +        - clock-names
>>>> +
>>>>      else:
>>>
>>> I am pretty sure you break not only intention/logic behindi this else,
>>> but actually cause real warnings to appear.
>>>
>>> The else was intentional, right? So the pattern further will not match
>>> some of devices defined in if:. Now else is for different part, so only
>>> 612 out of these devices is excluded.
>>>
>>> There is a reason we do not want ever else:if: in bindings. If it
>>> appeared, sure, maybe there is some benefit of it, but it means you need
>>> to be more careful now.
>>
>> Aah! I missed that this comes under an 'allOf'. Not an expert in this
> 
> The allOf does not matter here. If these were separate if:then: then it
> would be the same.
> 
>> syntax, does moving this entire block under an 'else' make sense? Or is
> 
> No, never nest blocks.
> 
>> there a saner alternative?
> 
> Not sure, I don't remember the code. Original code was not easy to read,
> with your changes it will not be easier. So the only alternative I see
> is to make it simple and obvious.

Could you please confirm if the below change would be okay?

@@ -384,6 +384,31 @@ allOf:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,adreno-610.0
              - qcom,adreno-619.1
              - qcom,adreno-07000200
    then:
      properties:
        clocks:
          minItems: 6
          maxItems: 6

        clock-names:
          items:
            - const: core
              description: GPU Core clock
            - const: iface
              description: GPU Interface clock
            - const: mem_iface
              description: GPU Memory Interface clock
            - const: alt_mem_iface
              description: GPU Alternative Memory Interface clock
            - const: gmu
              description: CX GMU clock
            - const: xo
              description: GPUCC clocksource clock

        reg-names:
          minItems: 1
          items:
             - const: kgsl_3d0_reg_memory
             - const: cx_dbgc

+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-610.0
+              - qcom,adreno-612.0
+              - qcom,adreno-619.1
+              - qcom,adreno-07000200
+    then:
      required:
        - clocks
        - clock-names

    else:
      if:
        properties:
          compatible:
            contains:
              oneOf:
                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
                - pattern: '^qcom,adreno-[0-9a-f]{8}$'

      then: # Starting with A6xx, the clocks are usually defined in the
        properties:
          clocks: false
          clock-names: false

          reg-names:
            minItems: 1
            items:
              - const: kgsl_3d0_reg_memory
              - const: cx_mem
              - const: cx_dbgc

-Akhil

> 
> 
> Best regards,
> Krzysztof


