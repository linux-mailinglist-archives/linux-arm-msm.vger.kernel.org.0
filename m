Return-Path: <linux-arm-msm+bounces-41794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06069EF21B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5E328D1D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC6D23A57E;
	Thu, 12 Dec 2024 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ALE/zs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A223F9E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021371; cv=none; b=WPl64da88kMpY1zYkOQLnJj5OLlVIkQEL4GxMlMsc6Amh/JEQuBbjdZG6OUWEitIm7tgLVHuoVn0rkGm6tWyl6xo/venaFufFRIMNXmL9hkrR0CPKD3UgiQ5/5AMOMst9xXvzTGL11iKUQQz0K6YAadZafR1G0wTfRdJlra1hnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021371; c=relaxed/simple;
	bh=j0SxUnuDVYO2JZYCLop+naPFe4NlfD3BdegfyxmRTfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXlnc0n0b2c22H8x23Zik0CCb/W4OSRDrR3ZKiXah9aNbTUPTSkemVII1PJK/boKWlnyCot1m586fEWeuAkdjCHBaR6MYcqqmMDjmPS7Urz6hBJcznbtn5C1nVx0ylo4+hKXF/5qPTW6BAhyEeN/DC0F5bPJTh3y6qlgW11TIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ALE/zs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCBM0eC028137
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1YtoqDvIa9oxEwR79Z1UxYpdC9VmaaKCVP5CSY5CeXQ=; b=i/ALE/zsKE6LxvHh
	SiGpY1A+2QBQsbkKzGAKRDEIwOy6qINRrSN7FY1FtcE78WOGVory08FoSqB+jWJz
	qCCn90T5Efc2kIyQ3F6G37n1O03+KXIIDBWRiw962rlV9TthLvVT10wxu+undzkI
	UTmsTm090cr1NABGTqHrEV0AKYNQQ9fy7dC94X2Fs3LTvpj+NlCeSQKpXlQfxOUe
	yZKqpnZHQzbvamlteXRH6AldLAbwSWKLhfz6WgXCFlFdaNWOZASJeqhSrridr/IN
	zDJZeDwzcYMk7MfRvEHXKgRN6QgI2DQL4L8/dyXI+qotiwyz/D3ORzavhwMMHemV
	u9Y/mg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fxw4rwcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:36:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467975f1b53so2098981cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021366; x=1734626166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YtoqDvIa9oxEwR79Z1UxYpdC9VmaaKCVP5CSY5CeXQ=;
        b=Q/uhhquyB2O2SLsapoeMfj1TCdGA3puwkhkfHEWIoZbvnSUSZgmGgqyv0YyP+vrzW+
         499EV6RdH/BuIwTsYBryQ16KRTldtiMNtf5yawvRw1UwZRtMh094HdsVQl2M4terwcit
         k+BOPnmUFUb4lJOm6XyrUxaE28aSf0mm7RbFYdYeIcrGwobOfXtQ5ZoXy1E/o6gZNiF3
         3I+ZOwdNONnbd+gu2C+ZpKVvps0Z82lMqnXI1YgXJQ3szml1+aSHVOJxGhOULOZ5KPx2
         4YU6luLIevd1aknVA2aDZggrx/82llWFz5DvE7hfr8AAPaSJiQ6sbMYDwXbs6RQhd6po
         bR1A==
X-Forwarded-Encrypted: i=1; AJvYcCVkqtni2sNAJ00vhrDXiqhI5PYNBMWfUlE0WoUfv5VlTj7RyVROjsFRBdmf+PO4z8D2ZOADmkWhI6ZIHObQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWqVDZwmpEdde590NgXZKqAEY5jjop70bJbwxsZUoFkzQX51R
	5pphtXHlpxpqGZvAsDfbF6eIdIQCEbSuHBBK7hiFtNVH7RD8alXByRBFVypjAyQKJ3NzncLrylp
	+baV8BqZUE/19fia4aCApNXKGHoEmF45fh3hqa8WvBjlXigGnCOtbqeicDRLzGGBo
X-Gm-Gg: ASbGncvkiU26IYLTt3u8lqzyidFhKytGwWQEgzmfTP3SJ6jkCOFE2v+bUSEQTDfVVgE
	OBDCz+4uACLAMblbqLm0OLPbZNuI/aVwwhPDKFlc1GIguRxofQAFPC1Ik9HEf5e03Zz0Tfcayc2
	gJC5mHTCkshHoVRGZuI5/82H+3hqCzIyH1tMXjn808TSsqC5EqHcftwmNgFT/2okCz0bdabiQhr
	slWBvvrfHXjztU5EEWaC5qypHoQ6KK8Iw7uW53oyIo+UVDbub/xsnQWiXPwHLoKeZLxZF/HyDrg
	N8ckVcxSgBcieluglrsaaGJr37VGO66tbwjwzg==
X-Received: by 2002:a05:622a:110a:b0:466:92d8:737f with SMTP id d75a77b69052e-467a15ce4camr6862961cf.8.1734021366622;
        Thu, 12 Dec 2024 08:36:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVd/vSE0n8cUZsCd5G+SQzCt7rdg82WYVr5UWrw6lLsq9BZLsKpztwlR6KttQvjAc1CxsH3Q==
X-Received: by 2002:a05:622a:110a:b0:466:92d8:737f with SMTP id d75a77b69052e-467a15ce4camr6862751cf.8.1734021366287;
        Thu, 12 Dec 2024 08:36:06 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68bae18cfsm577641266b.115.2024.12.12.08.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:36:05 -0800 (PST)
Message-ID: <d48f3064-be74-468e-8b7f-203eed33d238@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:36:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] ASoC: dt-bindings: qcom: Add SM6115 LPASS
 rxmacro and vamacro codecs
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-2-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-2-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gk2_Csv6dXbkez7DhM29V2ndsuH1xzzQ
X-Proofpoint-GUID: gk2_Csv6dXbkez7DhM29V2ndsuH1xzzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=955
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120119

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> Document compatibles for Qualcomm SM6115 SoC macro digital codecs
> (RX and VA).
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

[...]

> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sc7280-lpass-va-macro
> +          - qcom,sm6115-lpass-va-macro
>            - qcom,sm8250-lpass-va-macro
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
> @@ -83,6 +84,22 @@ allOf:
>            items:
>              - const: mclk
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-lpass-va-macro

We all like pasta!

Konrad

