Return-Path: <linux-arm-msm+bounces-82859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3513C7A13A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D77983429B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD5F2EA143;
	Fri, 21 Nov 2025 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M152LUcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nm8zZlyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6152D3EE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734209; cv=none; b=mN9raB6bsc9OjOcqllaGwkdKMSPQEF5WybOFOaIG96gADDiyAmwaoVmKKhvWHGWhw8kOEgus0vuBtiejdhCl5X4h5kD+xHli9bTDWpaUmIh6Z/0WBPi5oCHo7bOPf26TDDKJuChgvN8VpFepfeo2sea2ueIQmbInS9+MCUmqIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734209; c=relaxed/simple;
	bh=6WN4ZIJl0lRELuwbSIqU7ln4I62i3h4XdJ/9dMuU6oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=le1xUk0T0zacTwmClMX+WZMBz8LaaQ3Zw+iG/p5GC3klDS8Tu9eGGlHwobw4uWkVwTyNlLcQJMOqTasFq8EgQgdBGPcMUc0uhtprPdPvDwfGZEFhm/5D92+SSA1JWw0Ti2dxMnRhOOnjqj8h+VjMEgmgMMd//I1+NzBfGqdsGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M152LUcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nm8zZlyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8YuTW3139652
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN28f3FLg5vS5u7Mdk87weqjFDrtVo88/sfbbw07kTA=; b=M152LUcNRFm/E8nu
	dBFqJd7gL0fnf9gx/J5lel5+IX6e8BMOJb6O2T5/GQJdvV25selQykkUcX9MeWjh
	vTyODMdCDa8uXHmmtzyloCJJ5NKQecsFl57eIOVTWPaTTqy9Tz0VtSrUm2jo6qRW
	ltJPTT49Z1Xu1hoMoVjtnm4usXy4T+mysQNc7VWWjbvnWl4DYqYLiuN7kXhp/bWS
	06cXKGYz3SJhwj1Jc02NUXg6ERC2qsS3x8cp8ljqb9N/8AWuYkKK3OZyPCb/zhoo
	0EC/5suqU46OoBsNQjDSoN6zzqyWJzYGRe/K6bJR4ftURwXzCamAGmFfGpDtgN5D
	6S9aLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmpph4a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:10:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f587dc2eso50966595ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763734206; x=1764339006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QN28f3FLg5vS5u7Mdk87weqjFDrtVo88/sfbbw07kTA=;
        b=Nm8zZlyJLc27TMZa6S0actbVxPQOnHUrsiLzCOlc7UJ00jo5ionGJOqOUE7UyP7XWM
         Aiydsd51GIYLeYtraR95UEUup4TCmoNhhcVU45LfCyZ9hcYiP/Cwa6h+NIT84TF6K6p1
         N8BrbzflpHlIqbM/Cqhb70fdPott0SB1QLYfUEqChFti+8lCuV9t1aw7Ct+mx6ls0/P5
         6YsXifTXvpmWtdFAzR6ShU983BLLy8g4vsJTfT804C9GSol4hbXAnxzj+BmKKn+Zbqii
         ujFL8y4qX4bg4jLaUOQzmfDBk/6EnxkeMsOWA5u+mJRcnDHyNvvBvHRwhvZGrsmY1hPB
         mbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734206; x=1764339006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN28f3FLg5vS5u7Mdk87weqjFDrtVo88/sfbbw07kTA=;
        b=ZPZeTUb+N6s8B6lHDtC+r2uODXxlN8DZsnh2ONJqtMI3lNUXGJcMzgKlT6CXPJHFOc
         Ju7wUmCm0RC2JMbRIn2v4T/MaD5JegHo1B1V3tYNcRa/5kzwTlmzi3wTX6fkaW3Omlgt
         4KXOIukNVskrEBM7ApGKSnlAgHtwhkis4RHAdMEKzW/ggvSy6ySibmzj9aCV0mk2T4Zq
         4Quj2cx7GCKVsz0ge8T4W5bb2yrB1wqUSSoIsLXa3ExcDBAKyJNmlY/uzVIPqvaSVPU5
         Yk2MJrc6AyLA+ZMQDQj6A5rlDSUY1xqNV8OhjkNWCVI8VdcSdM6+Yo5yzMEAvILb3J6H
         cN9A==
X-Gm-Message-State: AOJu0Yy2OgpNzginKsPXQMj0nDxID07yRcs5WsnJl1IwXb8mo547LO38
	DlCwH2KFsZ79cMohU3XN/kEuv9OfJ25uS4MGXNkPETP1wAjTAtYp4pP7DPTsdzvwj24Q2BRCMSv
	hrTYKF/Sbc8m8HRinXLQ2XWoWN0q+glBoxNPDYQEgCTHqITa7c/5AW4ZgR+bPeCWPAYg3
X-Gm-Gg: ASbGncvuSQ6c9mnwsnVa9KBSenu8qJCNyRd4Jz9BtIembgpiifH2aeDhSad1q4YUsuL
	IJT4q4BfAyfkYwJ0gZO6pknC2rpmPMCraxJeJ5YJ4ssQIqN5V2xM4goB4wQukD8w2xe8ZVpWttY
	fmIlpvw+9BfzuhQkCEZAnqIXK+JYZoXCdak3wyqv9KOohzU/ZSDT3jeAHgV6q7M/bkv47iHyWW5
	uNsMkUMSeuVqU5qygW+AF/WSVv5yRE07UW3H361L6D9RyxscDJwjVEArNn1JDwUtoNyHaC11K5b
	NSZChxzep9jyRYM1W8waXyOLwir9hrTRObl6NPECXQdXHB5G42s8+uMCCc0N7Jagz+CRPbzXELk
	hysCUPki44Aq7DnScN9rL1hcn4a9NQ0YxDA==
X-Received: by 2002:a17:903:f8b:b0:295:6d30:e26f with SMTP id d9443c01a7336-29b6becfe11mr30968405ad.22.1763734206587;
        Fri, 21 Nov 2025 06:10:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhMkNwTjEuXCFQAkklm1We2RzQjI9waYIa2+4BnDOkaT2nfUYxYNCNHYeSYsK7tWprGQYgCg==
X-Received: by 2002:a17:903:f8b:b0:295:6d30:e26f with SMTP id d9443c01a7336-29b6becfe11mr30968025ad.22.1763734206057;
        Fri, 21 Nov 2025 06:10:06 -0800 (PST)
Received: from [192.168.1.7] ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2a155fsm57992545ad.88.2025.11.21.06.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:10:05 -0800 (PST)
Message-ID: <83e24ca2-44bf-4f8a-a6ed-32f37e0a0a2d@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 19:40:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add sm8750 compatible
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-pakala_qfprom-v1-1-9d16485e540b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251121-pakala_qfprom-v1-1-9d16485e540b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WESSUA5WQbnUPP8GFe5e4cGDFULlgXm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwMyBTYWx0ZWRfX42SBpWEsIwWF
 0jGgwaf+CMq1DkuQlQKwa+KfQbiDXCuY/wSQ/STDALrcxfso7OHqth/ZyF3lxzmLORY54+Ctrsk
 +6kpD7iiqA1qt847+tP3/p4uc9W/WtybThy4/gcEAHXAn7nP+EdbkzIVX4QLVoKmzPRxsnJe/o+
 mS4TqRldn3vacaD0ARWOaeQHMajm0URF7qoycrhWGYQagJoKSSAqZxMl5TvZrdJVP4uUQhQTG5c
 NU//r56/ZAmzbYmHw99JGStXxksV/LKe0GrCvFAGu760s+IshLHxfLrPjsXil0Cg6eDYtLM2suK
 s7hRrCrTeeZ7Oq/fke3JeQbZG5zcUCrAOBkDJwUSg18kxy8NeJmv7/qis90dnWzNZD34hN/SAhi
 547vbJLHrdxBVYa7Mx969tr2q0KGTQ==
X-Proofpoint-GUID: WESSUA5WQbnUPP8GFe5e4cGDFULlgXm1
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=692072bf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=1VMsAEDrMo3f5NIhEus0lw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7woQoRguKzc_0ZjhR9gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210103

On 11/21/2025 6:36 PM, Komal Bajaj wrote:
> Document compatible string for the QFPROM on SM8750 platform.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 7d1612acca48..839513d4b499 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -55,6 +55,7 @@ properties:
>            - qcom,sm8450-qfprom
>            - qcom,sm8550-qfprom
>            - qcom,sm8650-qfprom
> +          - qcom,sm8750-qfprom
>            - qcom,x1e80100-qfprom
>        - const: qcom,qfprom
>  
> 
> ---
> base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> change-id: 20251121-pakala_qfprom-bdb2e49baa20
> 
> Best regards,


