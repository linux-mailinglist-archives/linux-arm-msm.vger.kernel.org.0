Return-Path: <linux-arm-msm+bounces-42827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1A9F83A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E971678E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B411A9B23;
	Thu, 19 Dec 2024 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CipT6zSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6D1A7044
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634723; cv=none; b=h5mwNkMZrrOhuP/sKPSLei6l19xUlzneqRRfXpn1679unVkVK0AXOAS57HMl1Ir3sMIgNWR8WoGx44ewxPSgt8Q2uXo2h0RRQcufcvMTsGFoLdlrgb/nhA19THnnltkkSAiVuLnx9EFB1r0sSb76akncGkXBGmHW462GmPdJMGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634723; c=relaxed/simple;
	bh=axLo119heLWBFxUBcctlRiBbYg4ax5uAH6d+A3wUUck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1Rt6/fzHgE0wJj7wC+88rYvnwMapy7O+qFBwG2FvRjmINgq1a4zUS/6+KnjJDIryxjxdTZselVCtWqXOjCTbAIUduT2ffFNzk9BpvmGn5ezP0ebCloX8cMy2fb9Uc1qiaDw1kpUEMMTWzKOmduguSlqG8tgi5UAqcf+TMRSPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CipT6zSe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGIa51005252
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRJcBe0xIsl1ZdSMYuFgDKPdn3YkUJjMbpcCSrMDWyA=; b=CipT6zSeE2ztyUXk
	N/+Q+mRHSlbCTqZCrnslcWLy6EMdRQxbgt4X2sTR2JMSTPKcVhUzmGJgY7mihzOg
	/xNxqgxr8ceatP9d2PTdBdkWt0zBI52htLDGDQ9bOB0NXRb7fIj/lfFkvvk3quaA
	7NJMNduH1vqr7YqFrgo+r1y/cqnCG/DlbqEq8um8g4Z0tN5o7M7fI431vT0mrQ3i
	/ik+Tu9MjaCLmO08kOLaDvA821NdxirNfbhup6ShB/6xNNKOE4iWPYpfT4ZFKnyf
	jUFnrJptUxaxmDXhJA2Tb/NJTWOjOFEvaAJPEjx/92LBt6wUdhfiG7kMx3jYUbfK
	trcg+A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpw60d75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6dd0d0e0604so1940996d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 10:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634720; x=1735239520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRJcBe0xIsl1ZdSMYuFgDKPdn3YkUJjMbpcCSrMDWyA=;
        b=wX8+mABTvHsSnWF5nYdkyXh2ZUXjVEN8Fu29+F1tmUdSJRfi/To4vk2/obN7DK0QO4
         YtoafUbN4I8Ye2k0P+R0Vojj8eJSAGwmmrXcs1vrtVeGx/vY2oBfTUN13XR8PDA4Dzy3
         NoQdPaKR+VbITX2c4PAuVnyzlc0eIqW64juuwfnZydME/7kowKTq/yHS7y8KWgb3L08p
         1n77BoStVySINlJwSJ0INwG7YY/7JpKJKuaEmPKSPmXocDO7wPSeNYodKnngL1TskdPZ
         bGod4/60YlcV7u1AiAWQLgU3a75YSbDBdhwjMvzW6+uxcFtphokLrLV4r51KgPMPZYL3
         ng6w==
X-Forwarded-Encrypted: i=1; AJvYcCWZrgbi+KN4QcGXDks36Aw+QsvI786jM2kPB5jgLG3gjCVzoYfcmNbYVmkxVCbpVwr6SzeiBZO+aKSSMHq7@vger.kernel.org
X-Gm-Message-State: AOJu0YzfO256l+OCEn34DkNChrteJ4TtbTy5+zNfmdBwGKG4DvCZsed2
	hhUsrHFzEDk9O+sHSMOkjHc4ooHDVlKRuCXgUpDWFrFg9XhV3vSVoS3WodjgSHp6W+KffCo/M3E
	8A2DvXmwKkj0G+RGI1AjAv8PWCgAmE2/huylLuc9zV585Z4pDc/aaFv9jcqGowEv6
X-Gm-Gg: ASbGnct/cHuVl98rPMnHOshDUuKMQ32sBbuDb3yiMGUkTYFqrWvr2XnTJyzG3DNZmAj
	dnI/1IrVnh7MlMcnh50cVqwpEmD6pBR+LdYWY+9WF1OCqnxeLYrLbGGn4XUJ1rlZK9QnEGkJjJr
	gqrpn04gzKhlECpbXnExdgLlrCRhDFPOJSGPwwqE/jG/ZGfbqeH1BA9088USVzO5uy3QiTQpf1q
	2Uhqk4VoGgajbq1veAF4nRc+wJrGIg05iYjFwiSXu28DIokbP+Zl2Yue3vk9cqsc156/gYwiBW0
	mQNi0fSjMejOIYs+m6LiezOU4cd9kubo1jQ=
X-Received: by 2002:a05:6214:5f06:b0:6d8:adb8:eb92 with SMTP id 6a1803df08f44-6dd23307518mr184756d6.1.1734634720148;
        Thu, 19 Dec 2024 10:58:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF0bfXtB/SET13HIUhyCCHUDpUyYn35muJnRdXNK+Wqw/rveCyZHBP0Mj6iB9Ojx/5IaTZsA==
X-Received: by 2002:a05:6214:5f06:b0:6d8:adb8:eb92 with SMTP id 6a1803df08f44-6dd23307518mr184536d6.1.1734634719692;
        Thu, 19 Dec 2024 10:58:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0661b3sm94320666b.180.2024.12.19.10.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:58:39 -0800 (PST)
Message-ID: <15653310-5f73-477c-9ebb-8872dda64310@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 19:58:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: correct gpio-ranges for QCS615
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-5-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-5-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LDLlAcuiNhGxZLJWSd_UVb9Jrub4KhGS
X-Proofpoint-GUID: LDLlAcuiNhGxZLJWSd_UVb9Jrub4KhGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=810
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190150

On 19.12.2024 8:59 AM, Lijuan Gao wrote:
> Correct the gpio-ranges for the QCS615 TLMM pin controller to include
> GPIOs 0-122 and the UFS_RESET pin for primary UFS memory reset.
> 
> Fixes: 8e266654a2fe ("arm64: dts: qcom: add QCS615 platform")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

