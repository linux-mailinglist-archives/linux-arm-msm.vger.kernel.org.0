Return-Path: <linux-arm-msm+bounces-65493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C7B08F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 715351884E3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF27E2F7CF3;
	Thu, 17 Jul 2025 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa4q5Wy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F0D1CAA92
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762360; cv=none; b=R6kP1+3zycKA/i39hkdEGGwmX35VisZItNnN5bsIaVnLGYmdJtz6cq1sTcxYU3Svkgf13rH4xJyn3dSf1+c8tnEXDUr3tf2FvZLwjPAeieGCwpf+V6/6iqZc+j2dXTme5H3gnWHJuTZrXD6JsANf/tRqAdhzxYvkk+P09SVtxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762360; c=relaxed/simple;
	bh=rxGb3b6rCytVM4Jnnuf3rJk6tteWeN3eGG1kBvQvorY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poqOZiVjbmpRwvym8lKh0NzfU+Xbzr/CKMmWDrwaIuvNyMtvEm13cNi+l91cHQAbS1cKDdVGqHdSZkbzcoak6kOAxbe5lVIK8wxtDFjhAfUg9W+vqN3LvIqNGHfD1tOq1YT8bhUprsbby4tfxw2vSGfs61VL0PTQ3WxSWVShgFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa4q5Wy+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCtQAD032390
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Tbo3hxwNdSzKN2ImQHTT4RdnkySw0TT6Zap49m8D/s=; b=oa4q5Wy+T8sLAGIf
	FgF5dPkHpCTu7jQjBrxEwjNvCiTI38WvdqHlfP1NY/WmOpb5W0eZvN1UrbDr2swb
	HufGsGHUPJs4Be0mnCF/F6VAh9iLgkJzpX/LIhBZQnHfoVh6JRY2c6YvSuZ1ncj+
	bbe+ocvufrvQQGdVmTqn3U63sr+ZZm1yTs5h8BNekTP4KfspFNEpuB9v4yH2LreC
	v4e87fBGq/cB689ydf2wVM1PdXaFLlMnfyTQjmDS4seZFrfCbiyBtzTrnzE+8Kyn
	rCheOdqOx1BJNeqUJz191rXnhwBv0vudkyAQirEbq+aUDhyZ4zve9wM+g4KAchjv
	t1723A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug388460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:25:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab716c33cdso4410271cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762357; x=1753367157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tbo3hxwNdSzKN2ImQHTT4RdnkySw0TT6Zap49m8D/s=;
        b=u18e0veZmwQpUkprLHwwmj1nbJGBlqUpEhvi/2XtW+gTWrVOzwRlTwiZvRT87kCt/i
         HUCDhVChenf6Ex4YcVwz5IclF2zB9iHsVLUXFrbS3SpzYt64KvJUt6WMCUFXz3bDZTlL
         WtZyszEzjmS2o1mFc19jMHXLcWFP9vMN9C2cbEWT9VZfIA2WOEITMin4x5WglrrM1kny
         eAKJLEnvn6vFPkHwWdFGfJXBUVVymw6cbOJAvuNb2h+s5GoWFCqIWe38vMO4EVfbnKw9
         Sy/UUsey5XpVa3fbSuRoZSqN2s3swixC184nApBWqMviYHylcqhjgpB/1jd8T6biXqnN
         nccg==
X-Gm-Message-State: AOJu0YyFnBjkJ5KI/r1iP1TL34WDw0HBOYPzjYH1H+ywM4vkTGQ/fcv4
	aoouJLm81vWKEm64gMEncyTqp4pvkf9Q/ua3xujv+10f6RxXyYrjTee8TSyzUo1URofakZUQuZD
	6S7GZukYKvKbyhUeYAU9EoIwLgTsj0gQULucTUW8iHmXDY0vfsuL/F8tpAtR7XUP/r1w7
X-Gm-Gg: ASbGnctkcFALi8HIOIoRS2bBEijJdqIs0dY4Xlht3iRoNZaOwkKcKx5SMtcwE8+ED/6
	8Ad2mAKCqIMHqGn1D3tN1HZB5NHU8FhvQXWqft2HmdURpST16TBLcGR6uvMlKuPJiuarwL/WWj7
	3nduZtYeYxEW19TpW+ol4CwM7bjdg5oWZHwv2hGh9EyVz+4g6Ed0kbnXxpMZUUZ8G2+5248ue5L
	iy2hoP2FZvRW9tashTj1VqnArKKF2XazPoXlWD4AjBooYn05RzKrCbD2g8g80ucII/Qn8LgK2Pc
	TOr68s8F4nln1bYCcRQedNGKQHm7aocUZKiWdrd86vELC79rTOPpp6WBMDcsWA6m39K8z2p25Gc
	u9cvnnI9NGAYcpF8TV14q
X-Received: by 2002:a05:622a:1b1f:b0:4ab:609f:d7d2 with SMTP id d75a77b69052e-4ab90c8cf06mr44175351cf.12.1752762357152;
        Thu, 17 Jul 2025 07:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNh5ls9nEoL9tUKQMnzpM+c6tj7YbKF0V/yi9uBQ+BeXiIHOFS1dk2lquey36qCD3DemVptQ==
X-Received: by 2002:a05:622a:1b1f:b0:4ab:609f:d7d2 with SMTP id d75a77b69052e-4ab90c8cf06mr44175121cf.12.1752762356562;
        Thu, 17 Jul 2025 07:25:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee4607sm1390774066b.57.2025.07.17.07.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:25:56 -0700 (PDT)
Message-ID: <ad40af48-7c43-4341-a4c3-73ddac129c05@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8250: stop using SoC-specific
 genpd indices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
 <20250717-fix-rpmhpd-abi-v1-3-4c82e25e3280@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-3-4c82e25e3280@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNyBTYWx0ZWRfX9eOZt9OQSsPR
 eYcP7sRSxzKM4uyLVdeusE7FZ5ySi3DxwdTi6FgP+mgsJowNxTfQd0szc+ulGb/3kuU/+dTGmJT
 x+MH/9HebOgAb4HQOUEhGP3nxjykB4O6zl/ec9MYfhin9NnMgzNEW6S0vbeAYEDqvi7wzvu8l/C
 SpT9rxpVmiqNZhnjCKBaX6fSXrvtbdnHsWx2PNNTLHj+JWuLuJfkCCKqJr1K6yx3mhGioudBH63
 WTznS6tb08ov2AO/ZXkHAzCelk97KOTIp8q1ecgvfvrc+Dc25dybAwj5RJfDsluSP2qfc5cQAsy
 gdAWRwbdWs4UadUh9kcIBhquf3VrWz619adqz9TRNG8dnkxyZteQl3C+gk+BcMh5KsICvPXeRQj
 yMQoQdPIKT3G2SQckAOr5BsSSYJg8v1VEg769DHdLNnmMj3f1bC3sESMj3ZHzrANC3n+79yF
X-Proofpoint-GUID: PdJceZDa9aey7QrP19FBQKrRqzosj-iK
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687907f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Cj4UM151Hv94rJL_BKEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: PdJceZDa9aey7QrP19FBQKrRqzosj-iK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=821 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170127

On 7/17/25 2:48 PM, Dmitry Baryshkov wrote:
> The SM8250 has switched to RPMHPD_* indices for RPMh power domains,
> however commit 86a9264b6c56 ("arm64: dts: qcom: sm8250: Add
> interconnects and power-domains to QUPs") brought some more old-style
> indices. Convert all of them to use common RPMh PD indices.
> 
> Fixes: 86a9264b6c56 ("arm64: dts: qcom: sm8250: Add interconnects and power-domains to QUPs")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

