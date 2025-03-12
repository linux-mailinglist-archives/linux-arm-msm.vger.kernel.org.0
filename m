Return-Path: <linux-arm-msm+bounces-51176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4232A5E338
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8D6178FCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FE0241C8B;
	Wed, 12 Mar 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHSpzQGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5597A20ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802308; cv=none; b=gpHppWl2aiySG783tUVOQ+dYleNBuI9MpbZqmISq6J8e5OzI5cLq3ewEG6kTvoRN2bEZOdx8MCsEd8xIFoMunR/8dLtZdNZ+1kv2U7Sllm5Q4ZOrMslTiDrdB+S3a46Ug4x7iddGtMQy5zadFdGC5ucYSHiY1aOMh/7nJsB1ve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802308; c=relaxed/simple;
	bh=uvYktSUDIlgIfm1VyG/fJfFUevPD/r1/YdI4XOAcXWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=um55Z0QcXxS9J6o5vCCo9khfMsY6Ql1bnSqqwpaL1cM/l4p2gNznTSgVXH1wHV4qlKLcYsZ/y8cAz3i5pJ9HOppYef7TyvqWHK+JW2/zAWyWSCrDjgiwBUI2Kw2zSfNIu18yxz3aWYr+EGGTg63vDSUlSqNpqIxuVvRkVJhznjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHSpzQGT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CAWtVY027346
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcTeTYG1dmdjENwEPbzmb3bLZjrAYqSsiRBNKAV389s=; b=ZHSpzQGTqka+BmGZ
	vT2pl60wzbrgSxjVyOXc65gNtrirPJolQOO7cBxM4R8fPuLQDUj8t3B2gjVj//DW
	UWoOZTgcrNQzxlNmToRXkJ33wdCUM5lpc0wjKtqxyj/WLZQKfvCuMInHTXG2Bdf0
	o7IJcoZduY/l17xV0QHw7g3F4l6ObO09EsF5iRFODk13sc2eTSgj86Lok5xAM4fL
	xrx1BPVAXnlMkSWKnuLnbFc+f8GtyLc0pqfjqHbAHqr09l9j2yyxXScJAx+i3AVm
	8TO5UhLnosEGtWsiqtU0+WekGH1J9ut2dFeNfmplvHmI9nqYrwucX/+S1ZiU+Uuy
	pocRcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pu87r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:58:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476786e50d9so117781cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802305; x=1742407105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcTeTYG1dmdjENwEPbzmb3bLZjrAYqSsiRBNKAV389s=;
        b=mnZv2382dscdVuKYPNH4VChW/d8c+i7BVmfN5TounSC88mB5WDPNLbM0UP/cdgN8GD
         ZroUo/Bx8u6wFVxQF1UPG85WoiXWlm75dn2991+CT926ar/BAkIGLLp0D4RKWybEwLml
         iGrv3GoFeuHBZ5znaYdCdMFnBQNcwpJb3fxXbHon+fiEHs9XnDiGUKk4gRdCK9dPmZIc
         oTFatZ9Jyn/jQ5kbEaDY4xJzEJpmeoigNtQ73wDMU90QyFSPL2+S3B1af1ISdYRAiLyV
         ub/bonSinFR1EqGDTbOUbGlbVBKkz6ROvgKberH4siOyG0ZjI/IraX7D6w1hb61n+ie/
         7/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUyLv9tFe5zB5HrvnDhtYYWIy0LKvK+OKKQSwUSauzo+LZlL3sEXBbiBdl9Uxu2GNlLa5LZIAh8HAFhQlk+@vger.kernel.org
X-Gm-Message-State: AOJu0YzCdygQIGVCLlxD6UE4e7JCYLBc0wdzcRt4Zb3wZjDFx7FGxqA/
	v5AcSICYaI5X4Hi8spvZxROPT3qOcbJT//B7YWnnJNHCAWmgDYEieOXNM5Aen6Fea73DODGIGDY
	K2oAzDxyX5ih4pc9mIHur8/O8vV+luy2zWaJrkG2Ro0fMDEEKH052bdElxsL2bGTb
X-Gm-Gg: ASbGnctmSS/LMCmNaz+WWSgIUTbEtaeCyA+weFJ/GVLn8wpNUOPMGZMYkSDuLm8mtkP
	Kxit33RDL0eALrVNZE4pe6GuW5TrLJuMWAXAQgzh1t12ebRC751ck4TUBHRbPRGQelrRb6PXF3c
	KkwpSCPN/eNG9f3+yLMG8U2N6ZZSjjo3YJCaBWE4d5IX6ejeU12cGG9TH7751iBnfeH7AhoiqN3
	iBLXd/XeaAmliUWpceii7nVLhi9u30KoVt3gUVkwm27siD+xpPHRSP9kW0yE8X9BPSGRjd2ta42
	JStbDPFxe6xZ/3i8gupP6Vu/e6oupkwgSfpLWznM+VduJb/HQAChX+KBNNewK+hVc6vh1A==
X-Received: by 2002:a05:622a:188f:b0:471:ea1a:d9e with SMTP id d75a77b69052e-476996165cdmr49257161cf.12.1741802305132;
        Wed, 12 Mar 2025 10:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf+FgkDZ8oIXLKhFtYSMaoeFm9wkNACMQAgHhTtOGru/FQSONXO2zQ9boY9KqzBJU1UuHtiQ==
X-Received: by 2002:a05:622a:188f:b0:471:ea1a:d9e with SMTP id d75a77b69052e-476996165cdmr49257041cf.12.1741802304743;
        Wed, 12 Mar 2025 10:58:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac288ffe157sm656739966b.132.2025.03.12.10.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 10:58:24 -0700 (PDT)
Message-ID: <59de5023-acf4-4f2d-b011-62ca96c597ed@oss.qualcomm.com>
Date: Wed, 12 Mar 2025 18:58:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add reserved memory region
 for bootloader
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d1cb42 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9vFMFxKz7TJhonvdC4kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Hrp_F9Zcyz3KbnhkpnWqsvRUphtCASej
X-Proofpoint-ORIG-GUID: Hrp_F9Zcyz3KbnhkpnWqsvRUphtCASej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=620 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120124

On 3/12/25 10:49 AM, Manikanta Mylavarapu wrote:
> In IPQ5424, the bootloader collects the system RAM contents upon a crash
> for post-morterm analysis. If we don't reserve the memory region used by
> the bootloader, linux will consume it. Upon the next boot after a crash,
> the bootloader will be loaded in the same region, which could lead to the
> loss of some data. sometimes, we may miss out critical information.
> Therefore, let's reserve the region used by the bootloader.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

