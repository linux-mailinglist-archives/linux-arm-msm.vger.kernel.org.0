Return-Path: <linux-arm-msm+bounces-75470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6DBA80FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4E23C18CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC0223A9AD;
	Mon, 29 Sep 2025 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUR6oTCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526642367B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125981; cv=none; b=kk56vRzjAT2MWLIbFprboJj/ocNIRtSYbLtS9TVbeDZSEZCOtKrnxrAuA5Jh9u2dQdMcZRm5Bha6HceqfPUPkVpK9erAp3PKeY3vAU/T0wdWlOGBjRdxv2jPoIXxKXoyF+rero7qP3AAd+cWBpWiNfEvlubvi5werFM1bi+tOnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125981; c=relaxed/simple;
	bh=R1hOZFlZFY7ahQICoW9mfCD5k6/twe3bR2ww9vrXT3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4g9wtAtHMC1dN2jCkETy3iGTyOuzKM+ShpmVgedx0mLqykwLLvKf+TWsUexfYI3IJD2Yyb5JN4BNC0BVzruzftERNawmCK6R1wt6iqDuadoJ7Cd6Sv2Sfgj9liUSFcSFRl2jFHXv+wjWpcVHdfFYyHyt5eZrDJhEaGq+h0eswo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUR6oTCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SLt1Nv004418
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0XpjhlKCQT5F8kJy8PyiFfpDsgcYYWrp+FmjNI18ME=; b=RUR6oTCRZ6j8OWTe
	v9adyTFiwTSoxot/syatb/FF3ga2I64NuyGOo9SWYM+Ek8ACA1Z60RE3qz6BuEo2
	K4YFA9pW4r/NM++KHDMxns5/E8XekFWRw2b1vXSi1L81uB4doin5jaNELEegAXtF
	rpy0dK2sgL+Om4dVsKlVqdVtj6dftwlBFDvCXHFdsSNYAnlUI3BupaGHt9zdV9+V
	aQwQxe1iYq/z25oFzje2Uf8cDUGZPcAte0yn2JewRsFbQEzSEkAy5Dn42jF/EKV+
	nTCOziE30UDvXFbA5M5M2pEg7r3zUhaycNJlBEwjlmYBvLN0HDyhslw/ISp7yYbx
	uFngAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcma4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:06:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3306543e5abso4652521a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125977; x=1759730777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0XpjhlKCQT5F8kJy8PyiFfpDsgcYYWrp+FmjNI18ME=;
        b=MnXUu/0NOxP9nQ5v0hLBM2H8U00wV9X/Iaa5buuZoMi42i5y19jlzTLR/T8/FyjBwp
         3zMfZxJikLDOm07SIuqZB5NZw90irxyBzOVgsgkdbFB8F0JpAMu8OaBNV/roZuD/0HKw
         MOv5K7ehSL+4Sbl3q7Te3P7Av9Uhdz9KE84VrAzmd8ih6VScAldXcNLTNWfImiTDjGeh
         DYdZX/ADMgVWQXPYWXj16qgpS1fLu//bu/wnhLmW+ggU6bnMRi/HWqJ12i8cRZ/obJNa
         5+6Uw5uC19MDGS7Dxl134Cny28Z/RVJ4fHivozXYrHc8xoJ18+WFIA8R0TXHXhVlv+YZ
         jQbA==
X-Forwarded-Encrypted: i=1; AJvYcCWMQykM1mE7ZvJjUsuP+q7cwX1EnYRva7/7YpNawdZtTJ2l007aWT8m8u4hQEX/z3LSkCiHybO4RhzNiSDU@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJkTJbMwfvMvq8CuOq/tiiT+jMVv+4w8crr2I4ef6r2gG8M2U
	8T7bhudtSgVOjcEIkRhXGIh4LEONTexGZS+53nTOkpGup3zn09eV8/nUfot+2lPGCqta4eVvHLD
	EROQHON4/LkqiEqQ7bAN1dEiICzuMuhCTg9hMrQOx+KHIxB9x4M8HhdmTjnD4SEVAtWrj
X-Gm-Gg: ASbGncvEkGEiqJicjCup984YXmjsYTmBkodKW7Cxab6vf2S0Y17gI3lf9vvIRQGW0ei
	E8wpbXGwOm5oQhkIesYLSYFlwTus5jm6q8f/ZrlFqaK0ERCU4vji1CLyFxRIX+WSzoJ0O5Jq9wo
	PosAICyc6HWaLsGANbN9h4fD+2CYpqHzJKl7PA/sJl9od7VoAbIfxhMN+U5gPB/MNFrPYfQKvk4
	SCL9BODsfj3+VAW/pzyq8M6AMKH4HJ7VD7RxpD2pLP4F1Vsw3l8yXC0wun2da/ARytn6Q3e4G2c
	Ouik+wBjXB/Wh5NAu1U+rrKTiqLUq0HrPXh1U34syOKVIuKDLuxkEhnBvj8B9st1HQLeJPhFbFh
	tXFLmjbd6yfAPDLoBV5NEt7N0yLntTTYd5/8=
X-Received: by 2002:a17:90a:dfc6:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-336b3c40429mr8314088a91.7.1759125976475;
        Sun, 28 Sep 2025 23:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQVPf+oBaonVnZ99jEvDhUwui7DGxCtnmjbrzMR45Ek6O6rY2D4syi0FnP3OVmzqjbKW12UA==
X-Received: by 2002:a17:90a:dfc6:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-336b3c40429mr8314045a91.7.1759125976021;
        Sun, 28 Sep 2025 23:06:16 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-334326758f3sm6481957a91.2.2025.09.28.23.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:06:15 -0700 (PDT)
Message-ID: <d374036c-1263-42f4-b9ae-13b21427b01d@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
 <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68da21d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VpiTcBU3MjFUXm55aNAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eI_8-MDck7T22LHcqissTZ9azYWaZjuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX4cEZDaBSVtEQ
 ydU4R7rvzMB6bKtxY5H+iipt/8WK5EWmEEWNOz6RP6rQJ2Sp24nmWGG66IeGWyDy8UyfOs7406Y
 G7NhXUrTdEd1Z8SrFpvFk4Gnpw1QmcsXv8Hf6g6KpXUFO71T8BHMH9VyEkMuGNUMo8WO+AvTDI3
 k78sdYTptdcsG5a9y0eA0PVhos71rvvsaxzsJSVfe4nt2Jv9ykd+LJH7QGdVzPPfvYk8I5w4Pbi
 21V+H7hW3GN4vXrOby/LjnAEq+l4TJ1kpk1LWmtSVRMBdJeoFQFYB569yUsxjQ/A8nSOK5SLSJA
 mVp1jAQ4kS/5BGZwV02kdiBfMimSgNnegKUWDdG6sS4GXxxVKX9G7woLMl0wRZMHLWFnIlirAre
 vpnI/aNwUncTDeXPPph35DA5FbIdNQ==
X-Proofpoint-GUID: eI_8-MDck7T22LHcqissTZ9azYWaZjuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004



On 9/25/2025 10:19 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
>> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
>> compatible with SM8750, which can fallback to SM8550 except for one more
>> interrupt ("shutdown-ack").
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 2dd479cf4821..be9e2a0bc060 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -28,7 +28,9 @@ properties:
>>            - qcom,x1e80100-adsp-pas
>>            - qcom,x1e80100-cdsp-pas
>>        - items:
>> -          - const: qcom,sm8750-adsp-pas
>> +          - enum:
>> +              - qcom,kaanapali-adsp-pas
>> +              - qcom,sm8750-adsp-pas
>>            - const: qcom,sm8550-adsp-pas
>>        - items:
>>            - const: qcom,sm8750-cdsp-pas
>> @@ -95,6 +97,7 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,kaanapali-adsp-pas
> 
> This one and the next entry are redundant. Do you see why?
> 

This one describe the interrupt:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,kaanapali-adsp-pas
              - qcom,sm8750-adsp-pas
    then:
      properties:
        interrupts:
          maxItems: 6
        interrupt-names:
          maxItems: 6
        memory-region:
          maxItems: 2


>>                - qcom,sm8750-adsp-pas
>>      then:
>>        properties:
>> @@ -185,6 +188,7 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,kaanapali-adsp-pas

This one describe the power domain

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,kaanapali-adsp-pas
              - qcom,sm8550-adsp-pas
              - qcom,sm8650-adsp-pas
              - qcom,sm8750-adsp-pas
              - qcom,x1e80100-adsp-pas
    then:
      properties:
        power-domains:
          items:
            - description: LCX power domain
            - description: LMX power domain
        power-domain-names:
          items:
            - const: lcx
            - const: lmx


>>                - qcom,sm8550-adsp-pas
>>                - qcom,sm8650-adsp-pas
>>                - qcom,sm8750-adsp-pas
>>
>> -- 
>> 2.25.1
>>
> 

Thanks,
Jingyi

