Return-Path: <linux-arm-msm+bounces-85339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5250CC377A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2768D300D3C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D44357733;
	Tue, 16 Dec 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3WaOQ1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6x1Jx9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0FA357A59
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887265; cv=none; b=a0dhdxsShfojJK9bKA2rnSkDAGI5hNtBo8qv7xqHHI1jDmFF4xi7PeBsNJoLNzlweqY0aV25mherD8i0+sQ191aPSVlyyJwlAeWqgGbkjSySyUxgxisG4LwAVFIgZfs4B1x2Q+yP7E2QlcbyyworYgmmTCUQfVMu+T/gb39uokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887265; c=relaxed/simple;
	bh=yJKFLN7YW6OmeRE6BOlO9IK3te1IOjZ71MvoO4qgMgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YI0mLBWxVKCwmF4xxs4zYvpz3S7/rpjWMznL/BDpCZGneNHAxoAbmOJCU3ZqGAAjlNrE8HtwJleOBCMTKxO8jXEX1czrB+xscnx6gZWDMRR6rxa0Ae7FKjDf/+7UMrP+NKsTpRB3n+Bqh62OkKz+nQTpSdcOlcRNwMmv91ncQ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3WaOQ1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6x1Jx9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGAM8IC3829449
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16/wIy2pdlULZ8ONM9EfUI4Zmyro5D9Bgds/oD362R4=; b=o3WaOQ1zfc4R4Qvl
	BP7m9vK3HQjtpkTJmBgNH6MLkJbkbZzBUoFAS3MXHgKrNwT3EjH6sb6djnHHH7hB
	qwuQTY3vaabpr5DA9uMrZFxHtIqnjbe5uyn2PMRQEVl1DGi2Z6Ml8lNUGHVglUHx
	d/84O/bNCwtN3C20lDERjXQiy8OMawQ/BwFZ5fnkEXaGhZZDsDWAjN790z655ela
	8Y55H4ysuj+YxmBIShQLL3VIstoykGPgKUNQZCs3o8FqLGcxvSgEd3q3PUWaO75w
	EEPIAMJFfV24cNKVu+vrXDoIf1h7u5+Q5Ty0V7wVvrWHil1Dp7j2d39gmVJ86NAs
	+2prjg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35m2reja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:14:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88653c1bab5so17386256d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887262; x=1766492062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16/wIy2pdlULZ8ONM9EfUI4Zmyro5D9Bgds/oD362R4=;
        b=U6x1Jx9VbSV7md+jl7GGG7S0WF7vJMBKUtLqLXzOp2GZ5XpbOXyWLlyTbDGGGk2HWG
         ojokEImAp09diUbdGDLZvz7Miy0qxWZRgBgwYWsZKKFEHyw5NqsOIWKucKgykt5x0KSE
         BZIIxTxCqFXhrNn/j8eWJDY9skrhnB0WjmvEDdlUnPluONuIPdPodO78sqvKFRcctmgP
         1/OIzTQz/7+6nDoS/ahngp7iw9jjGMI4kfr2Ise/tnmJKAbSeO2Dd2w+5bVEgupOnAC/
         TsSlFwz8XJLYB8JDExyyKdwBI9KPbpQZwmmW6geoWa2zrpoNjGXHuxZiLWiBX8XfgIti
         fjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887262; x=1766492062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16/wIy2pdlULZ8ONM9EfUI4Zmyro5D9Bgds/oD362R4=;
        b=T9rw0FvLAXbKyCxstI9a+GOUl6yUv4GI9P58C4qEDnNXwTdrF8PqGU7sF7tNVxR/Il
         dySJoTbdL+RNxcI0BHsz5ezcIfeO1DHvkVijRcT4KwKQlDAyQdNhJWXcj4X1yxbWXWHl
         bu6H379n7ivLBchFH2FNYFIa/jOOkXwMS5kNWxHqeqXSI/++zJHaLW/X+ihbumcBGpg+
         heOwFGQNMh2Dd/mpB7ETBEZq1+HhcnkVst9dU+l+W4T7/ATHA61F50qSFTGwHoeRiZBQ
         X5XN9MsfG74jS0UMRIY9Mydi8fZwzJrSdosmazmm2KFMQqtJwZ6JDbeYM3krdqTas4ak
         7hsA==
X-Gm-Message-State: AOJu0YwRQe9bcKTEnILJI+75yVfw2CJgSwgAI/UyJPVltYu4dTFNaSBU
	RdSQww7u41by393YhD04dnFpQnYcug9tC4T5GqR0LJrkXRooY40bcYgGTFhDL1wmJ8Q8eYXfH40
	Grt/2cpLHLlGyvlRhyP3dK0JB6vd0kDAYH68hQIAmGX2dkq21URmoypnUSDOoxPDHtyHC
X-Gm-Gg: AY/fxX7uWm4v6s8kJd+1mEqfCX8XmwGtytuGibexaWsHLADwwuyzpTHbhXLX7HgRuGV
	b/Ir1I1mcqUjCVxhUd2ceSxuJYyvcNmWjslzizvIvlffpi2NA/MlDJsCT9I2MDE8pL3cmjNRdkM
	unnTyzPjebQV+FIPF8/xaRVOD40o4mOKiv7AGR/9xbOlBSDW6DIXJr/eSVFNWDBO2jDKvLfEJ/n
	D3E20rCdfEhKZ6cxgb+UXxNI1iCJSNDE5q9pyMLU2GVQtIwFfq3AHMhz07UZJ9qu5mfnBafFzQ6
	RnmB4TTFIPGH2jXmdK6IH4F/bk0wDaVlyKZOGWgFQR7TKx3xoZcdzj+eyQ0OkaBWnab/ziNFQib
	L9/8j9sHQBgjPHzgfqehGYKvtx5zd2ix/mH+lDs3J+h9XWzCXNUkiuowvTg6M8QC4Hw==
X-Received: by 2002:ac8:7f49:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f1d06724b0mr152370251cf.8.1765887262268;
        Tue, 16 Dec 2025 04:14:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC2vmxl0OpZsjtN0+6EBlqKqjmbjan6XEWRnP+Dkk2hDl2mEvaNtMJ5HTZ0L2t6SWpujDP7g==
X-Received: by 2002:ac8:7f49:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f1d06724b0mr152370041cf.8.1765887261921;
        Tue, 16 Dec 2025 04:14:21 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64981fa5514sm16025465a12.0.2025.12.16.04.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:14:21 -0800 (PST)
Message-ID: <f1dc4911-fb20-4289-942f-ac6d133e9591@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:14:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: power: qcom-rpmpd: drop compatibility
 defines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com>
 <20251211-rework-rpmhpd-rpmpd-v2-3-a5ec4028129f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-rework-rpmhpd-rpmpd-v2-3-a5ec4028129f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LpGfC3dc c=1 sm=1 tr=0 ts=69414d1e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lR2tOKNDw1Un2gOXHDgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: XJhh058gpiOqJJR6TJq7YWQsrfYkzdQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX5VKjrwGLPz0f
 xRPE/0HeIBWuu/A4O4bvN2WV5tX71qXVCxRs/4sj8QQprR7A2SQiLlvoPRv7i6GPC6zSeU3w9yg
 ZlMiR53BjyetTjRW93QDSgOBFKzK87O5GjN+GabXs6ylDctmZ7hI0k46cBJseXWn7GUlG2M4Pfx
 8UkJUt2hG9m82F2weg80qnZ8aoJf+6a5kQSVuFoM2PZDW48YvQHl2koza3tPT+idXRk0ic2xnEA
 LoE0Wtr7H+6gJixfVnUrMzWI1RDAta6Z688VwjafQQz8/P32AQC5t2MJGHhY6GEgvG87E6+2d9h
 nx6WOOca3rE5/C1xRFKRxsl2limCNZJQ2pbj0XCTeKUdVz2gvnETJlYZgK0CY1TpSSR7cyhYpFZ
 Xk3Pe93gsBfUPDSaiY6Mam5Hae0rTw==
X-Proofpoint-ORIG-GUID: XJhh058gpiOqJJR6TJq7YWQsrfYkzdQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160103

On 12/11/25 2:52 AM, Dmitry Baryshkov wrote:
> Now as all relevant platforms were converted to RPMPD_ defines, drop
> compatibility defines from the qcom-rpmpd bindings.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

