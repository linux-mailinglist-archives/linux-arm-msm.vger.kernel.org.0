Return-Path: <linux-arm-msm+bounces-60828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C2AAD3B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7CAA3A919D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CE521ADBA;
	Tue, 10 Jun 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvc5Ue1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51AE20C465
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566353; cv=none; b=KqFOuzg3vYf60BNESaAMQ+8qA71Pg33mZoSkCI5IY5dYhzZlSCZXs3CAjbuygEbdctNxcfGGpOMkOALvgRL+v4HCqy1waBtCVioD+01lC6keqSu4zgx1AsfHS13b7cGWck/QvFdq1GnymRVfslDv19zPf0mHkTCkeoHrrPeuocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566353; c=relaxed/simple;
	bh=JEhdZtu3qJRdspujX7loWXgzQgwNvA/+M6KwCyzZOt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Af4+IadaUjmk/JbUxKFXTJt8QWDqPcZOdJ+lJPyIhmpjdBg4K2SpcTkdlNi3/Z4vW68fP3DAZ+fShfEstgMjlBWTnVuWmgoU2HrX62BHTcmQ5q48+92hFO1JJj5aVBEqOH8hmvvg1vX6p1oAIG3k6JBlWUSFkG4lJ6v7txyGtb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tvc5Ue1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Em2T009416
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=Tvc5Ue1NTVvtqo8o
	yOpjgjwsKLep1BvG8wafzxNyght58u8GSohG6CRMXmhuL6zYsGegs7ft2BRQLHBU
	UAzcFNwkHxgCJGGe+KthukAfiuV8P15a/s1QHRKMirw0DtBGx6AJHONUhAcr2Fze
	awtmYShBqwXz8Ekn+iMnF0qhg7q3kP89FywP1GiBClsMTNm5Htw1aOQCnyFDh/oW
	Jzg/LIGAB49aCDdo4TcpT2dTJ2TPMufCIIxtWsyVGBScKTJmrhqHsW92e9/K0c79
	djQdNBuSJBtTjwQH7mbPSftwrWqO7mn4BsVMrgVSLlc9+7Gb91jI9kcR5V9XnDoN
	WlBQTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9su1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:39:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5ae436badso13549661cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566350; x=1750171150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=;
        b=W3UcDIh8PfhI1AWOc2gaxU/grjgXhrZDWzMSm/pLUb0k5jzYlkPlefZrIWDArPqCf5
         AErznW4GTO9c53MCRW3PwZKUJCmfbjxOhM8X9VH49HSWH+GLn3503XG9+SrFgYmeO6HP
         hR7ocXBcWxooxK6CxcV65Y+U91NoqMgL2o5ManLnIpCqgS+E5SDZM1msXjPn4Dzj20J9
         BmwnFuEygNlmwrVCIsTOiuR36u0D1d260Q88Ir0EDQttr4YK5s2u2KzSC6dJ8zP+9uCj
         szMXde22xO2jg8YLjuHkTNoenKi560PnHl2K+L1ALs0tc/OZXgO2hFGCIvnTNlse3d+e
         izHA==
X-Forwarded-Encrypted: i=1; AJvYcCWl5PJ4cXRTLETLDjDFgILDNVVnwBKHIvAiX7iFbvx83muOxGyOarittuILkF5MZIrZPnME7H8yfEtBbZgV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mW7TIXFwp+BLThDwogJRabTzqceXqyuhYirEwR/hsOdzVQUU
	ODFWrumWLQMOrEU+qPC627r6xdfh1mBBwRJbK6dBhSW2jfJ8vVrN00OJ+7FaZNY+svQKDisGH+b
	wVggBNduwtN9HLzl0D+xleT24p90MbGGHECjPRHGJa157rPJVgWPtXL7IVuETGeD7Kwc+
X-Gm-Gg: ASbGncvhIuVoAOdVCm3pjbEKqENRw+ijVwCofWetNRT5eOHbh8qtisn4o+e1s6OVAvE
	m2YGT+aEtC8mQRmIguQ613jiHAKb9V5nqWLtw+ajDHibIc17XOPW6rq3krfCa8zbapHxv33xSIB
	aRLle5KeKJOFgV55zeeGQiHCX/fXJVCEOWGGYj+Q0jbofmLMTeP93RjuY7AphNknL3e8dFGcfPp
	X1wrGpqpbDQOoESjHy5bpMc5xcP2V3Vrwh6Vd8n8Ft64yQ3/OAxd2X6gFOzxKDejNRU08By5hPr
	JgpeXxWRCrigjUtMqID+9T333YFA/UcOTH0aMFae6mI21wcjtj/1/d9HPMvuLKIMYUd4t97Gnes
	A
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a6690a28dfmr95786411cf.11.1749566349755;
        Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGouqX7qoKwblwHdCsP8sXYcazh4DdthTicdnTn7xgesyInCIp3oCS88Mi1046CwU/GY9svig==
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a6690a28dfmr95786261cf.11.1749566349310;
        Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55b68sm738346266b.59.2025.06.10.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:39:08 -0700 (PDT)
Message-ID: <1b26fd75-f316-4cbd-b60b-6b3496551314@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9TgNED2vs-3AFfAGQ50xJKDN4c3QM2F6
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6848438e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNJ8jBrhinZ9UXkNAM4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9TgNED2vs-3AFfAGQ50xJKDN4c3QM2F6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfXzm8VwqnHScJm
 RzsHZQ+uGN7CLAXIEE0E7m3bIpuivrt+MSREm/xAbFBwctNjIVI32pDWG/d6kAGBl0tmk1OPKIO
 vM/3nxRg2ELl0VUY0fBRsTNB+zNTsXM/ooYarxhhvnr9z1NSYnnWTaxnLO/j1GY8xxCcAxRL5Yr
 5X4VksJXed+T9w4Z0fJQ1JRxvVMSWMk86Z6q80xwp61akooJ1TSoqChQk10GOi4yx76L69nAgwv
 D0iPPVPYIklHFqOZ8CGrs43zdUbrlJ8Vh+ODekJTKzG58aDqZJknxP109wiOHNPa1FUfem+iW0V
 7KiYVlqVbVvT0Q7RqOKmp/74Rp7rSvKD8KnI2gkTPJllieELz6gVjwuqbH+ZicqEvvyEmUAc/fH
 1FHeJf1DRV/gYUIw7Bfy32W2XL7n4Jw+EzxUqsFjVuyjav52H/L6rEZSJ4OgSsJpM/OGXk19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=831 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100116

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};

Please sort the label references alpabetically

> +
>  &gpu {

Konrad

