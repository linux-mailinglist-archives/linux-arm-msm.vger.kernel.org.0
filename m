Return-Path: <linux-arm-msm+bounces-51704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5DA67140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 11:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44A4189C163
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AB8207E0E;
	Tue, 18 Mar 2025 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrzOBCL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9319F424
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293701; cv=none; b=E4n7JbBUP9ogmEHoVc/eWMi3ytaYXNExbJusiPMEh4+tY69ls12usLH19+MM03f/FMF6XzYmkiq3EhfmlityDFOBNR7O+x3brMNKcAw6xj4j6twcN+hcNB+R4dWbNTFtti+Gk53tu8Tyfw3i6M8AVBqrUck2GBLLWNrzSPkBhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293701; c=relaxed/simple;
	bh=YFD+5zyoQYIS6DbLnJmF31CAEz7Hg2/K2iCvbLFbfcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5CZaEjQy3AJ2QlcxK0RcJ0nsfuJx/zGJi4WPFqlGeeGUoRaBM7DD8NznjeMzisMITB22Fdd6uEExvtYjnKsireLoTfKL9wMl2qVc4sokz23RJKqB/GknOwKy3tnM1Wqr2FTVzpppjE6HYp0HhIAsZxFWn1oH8QwQ27QXndwkvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrzOBCL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I19lYq023354
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=; b=CrzOBCL9BxGuCYdy
	PpGccRQNdJtgOuoSTI/Hxt7LPk/WA9gBrjFthfC2CSnlkedNUFOAIQeylhFYkELM
	qSU4ZieuRaJ0KBbwkUh9UWU7fGBLzaMciBFljU47noP9N8wlo1/Y48/AZb+UEsxa
	KH+nk9N6ls9ub7jHZ6vfeGP4lbFMfQ+lVXB+dhZLdMMfVoV2+nLclgns145fmsqD
	Vr6o+a2+X5RVhDsAshIHwQH9OO8si0E3pFSLpD5/zf7D+UtJ3cj83WdoxlrEdWpA
	nx/ZAdBVvKxM6qky/sSXxpijIGy0HjvKr+9aJX4k4bZqSDPW8Y/G/0h4PyUGJnJh
	4gW9jw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx1dek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:28:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e78a271d3so11104981cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 03:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293697; x=1742898497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=;
        b=ht2J5lEkH7Lvw/nC6uA0hRkUpLTFLpLgArkpN69yj4V+mb4ZggeZSqvHO1fbv2uxBa
         3E101+y4HBCIrLHsnaRfOha7zBT4WRTxnTsR+s0OhZWHnp+XUAbgREXL9r9t9OIXsSud
         mqpvnOIKplDfugJoNamPq9umkhDbsuVaLCqQ243SHHhzGe51iBuH/hBNuRvufVr7DvnA
         S3c2R8KapiMXKLWWS7qY7xTPOyuS0iyk5Odpt48CZACw7fGSiYs8w0EF4U4GNkLs+RXy
         svFvQS0hEWnc/LOWlVV6CepVcZKZqCyaSqOaJmmCV4lZsJ4JQeYi0kCXIaGV6OgweOZt
         QrrQ==
X-Gm-Message-State: AOJu0Yx3O+OG6qJWjA8wf7aQtfJWHJ8ERYk2p4UNJbJHvyb+iP6pyun9
	OFA8GUb2NZ8z3c+iLgYTZ6bfiJHhJTk899K3BSNuEYawA7kJ3sxupG1xBUq6Wz8EXP1v2Nf3wP0
	imtmI9fFmnNPtW1QTiq/DhZFyV2UrRJB/Dmx+ICKc4HYtRa6fShZVfVd0Ulg5jXcq
X-Gm-Gg: ASbGncvAF2yF9pkTURIO0uoGRyprQDRP24wlieod/dEE0vPaGwHcrNdeb0HwT9Hxu1h
	eArGcc6G4aNsGaRsd/612wRI8QghgzNgtdTorZav74vnv2EqtqLCyN3SsUYrj8FnjT3V8DY1yfJ
	8ps9Z0nwawS7ACq1Hvz41lKEABvOz6I3ino7lMuFMRdOXHRUPCZM41e4dJ3ZKgoKhwLmcj/k0FX
	T1Z9iASiD3pKmk0t09F+L5IrAJcXlTvgLbJoYrCvcPOv6PhhNghQE/3dbHPNMFV+I3Y2BHsSZ9f
	rBPh+FmfUz/w2sRJIIZrLe9CBI8qi6TFxU03omhlfAXSrA69Mv4OVkVKEYFTJl7oSZwX1A==
X-Received: by 2002:a05:6214:252a:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6eaeaa5893emr88168106d6.5.1742293697531;
        Tue, 18 Mar 2025 03:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbWrHKNAmWpMHc+BHfClrKrXHiIT6z2F6YxU0JPnsWruAuabzkJG8LsnO7K1C+4bw9HqrCrw==
X-Received: by 2002:a05:6214:252a:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6eaeaa5893emr88167666d6.5.1742293697087;
        Tue, 18 Mar 2025 03:28:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31485d046sm814425666b.83.2025.03.18.03.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:28:16 -0700 (PDT)
Message-ID: <f1848598-c8d7-4c17-8a40-3a6828c32dbe@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 11:28:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vE-_rSjG6UQv101iYFXZJjLZzXZlw2J7
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d94ac3 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=iEn_WmSgXS-yHfNkfEQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vE-_rSjG6UQv101iYFXZJjLZzXZlw2J7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180076

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks (or both). Document those optional clocks in the schema.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -30,6 +30,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    enum:

I believe this should either be items: if 0/1/2 is allowed, or
minItems should be dropped if 0/1 is allowed, but the former seems
to be the intention

Konrad

> +      - apb_pclk
> +      - atclk
> +
>    in-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      additionalProperties: false
> 

