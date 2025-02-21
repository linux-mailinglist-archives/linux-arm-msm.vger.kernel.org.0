Return-Path: <linux-arm-msm+bounces-48997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CBEA40227
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 22:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99718426990
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 21:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C74255E4B;
	Fri, 21 Feb 2025 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbEmgMW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89309254AE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173937; cv=none; b=p9IyBcK2e837hdqxw7YjUO8SUwHaiOeHSYV+4/608/tEq3NdgQ+sMegc34a2FWQjAFCp/NIvT/Be0rD5u8F6Waepg3PpmtMfL4zafTOwav7CZBXyHKJC6QqubH/wPvRsuaflI277KXYDNtZYDIbCfnWFzV4bkzpBf/JNyYAsj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173937; c=relaxed/simple;
	bh=M/hcGQyoFwPFqirz/txizQCfEWA8XcQU5hY54LZQlVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFD054nYIhSj6I6e7AYzNCQmxDe6T24/wMZLhxisfsXqBUi6psy+V8OOiDIBiqv1mslXnAmy+S7ynV7G1ijynXL8D9LwyXbGIx7Z0gzimCqwlQfoY8hOYRxaLNmgWQTLzubtmk7RpwCLrFcvoTXbUSbRWRB3eX1eqLsqSNaLO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbEmgMW9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDSHlD016293
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v++WnZUnpWOgAMA0wIfH/ID14IE5ovXRwz5f3ehfMvY=; b=bbEmgMW9lWB1Auz4
	IW2ePG2bp2qwT0Qgu600EJZh6QJkxg79+JwMmpMOgO1LK51s+SbQU5AHQyOtaoTY
	HQhGZYFIMRnSwLq4VdnC4P8//EZUqQuoJZew7AuWua50dPQeaEgsadlWPsyXWUx8
	EpHrWFIdMhNK8q/cALvV+60uSyxa5SM4eMn0kX/CffzK6NMNDUsRQhbqU3PKLSa/
	KkCilc11vfou2cNtLMq6eiT8A3yOd6q3AaMwqih1sPcY1KjCnse/iN9eAai7ZQRF
	oCLkjbesL1+saD02pvWQ48e7C421I7rl5MN9QOyJSL1cKP8vPDnLDkhogIZvd9Er
	j06FUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xku6tmky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:38:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471ed6f95d2so3682151cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 13:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173933; x=1740778733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v++WnZUnpWOgAMA0wIfH/ID14IE5ovXRwz5f3ehfMvY=;
        b=ugz1aHOwFts67P0hBZt2HsnTAzObv+KCXicU6QiWnm3/p9EJxeIyIE5BUroiM5KjWu
         5s0qY0TiQTLZ0hAMzyILPFEpaIneHd/j3obvkSyMEV77Tm456xfSci62IryO87AxGR1K
         TNFzLwLTfzriAAVKThP1x+h1PVZaac7KWodhSGJzaLigTzy6BoUdu+l1NVCO6NLduW8m
         kcVsLFWDHF6YDDLDfzft0YjTwo598gVRTQSqmoxAtyCQyJTe0cN+lbFJjNibCsXaGF44
         r7l17bFqqBOOjF/fE9ArlztejkEEouYy7HPGG4y5CXiq9K3EM/s+LCqslVQurdlGkJca
         iLBA==
X-Gm-Message-State: AOJu0YxtNLfUdoeH4RYDUQ87gV8PiEpB3xnke/aKkEUYzILuLDpWC7Wm
	3K5d2xRDyj8eox6xqM5d564LlviaEehw5H53hT24EvkNzwIQvtPiIAxBWL2J9t1WQUmYrEPxVN5
	tnd90wk1WBUMZ0bbCaHhubCbumKh9BeEmt6TulfMD6aO2IVrBx0pHMfnm5qWGHMFy
X-Gm-Gg: ASbGncuWqIVsXbppQ9+IbxdNHcrd1g7sWYMYQ3nePYWVJfFJ7JiW+XYDZ0wTRnhSyiU
	TekCwBd5+K1bdF6N+/OAqdxSWzegBJtUZy+xhJdOM0GX0+4rZzn1FlQppDVINu0gBe0FaLKg7WY
	xoM2ZJIzxh569dVnsDatDXKCxkFYTGEAIQmmSJ1Y2O7SHQdmcWwZ3fkWGYQ0F8c1Su6Ev7MhxRj
	1U768VtwGOjvf5MgOmaT38LlLNYq+FyEl8C3Kam7+EVqC5w/iGTSKQJzv0gyL04k5o5rDrCGP0A
	SCGOG4OytllepF7v7jxnLlL90KDZkWRuj99/8fVg8v0LmrwlTbO3f9gz0FOAiwpxQHkolA==
X-Received: by 2002:a05:622a:104:b0:472:1861:fe13 with SMTP id d75a77b69052e-472228d5becmr24240431cf.5.1740173933589;
        Fri, 21 Feb 2025 13:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7LFnmHnBy/t33605DNQYqWNsZ6WQxWF/c1cepGHBy1JILe4jOOnXsKOEhp8HSt80yjo7/oQ==
X-Received: by 2002:a05:622a:104:b0:472:1861:fe13 with SMTP id d75a77b69052e-472228d5becmr24240261cf.5.1740173933171;
        Fri, 21 Feb 2025 13:38:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98ed07afsm1067043066b.102.2025.02.21.13.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 13:38:52 -0800 (PST)
Message-ID: <dbd99d6e-e8c4-4b03-98fe-8faddecbf11c@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 22:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8750-qrd: Enable ADSP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
 <20250220-sm8750-audio-v2-4-fbe243c4afc3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-sm8750-audio-v2-4-fbe243c4afc3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ePtwLxvh3q-ObzbSZxIUJiWppuTeejEz
X-Proofpoint-GUID: ePtwLxvh3q-ObzbSZxIUJiWppuTeejEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=569 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210147

On 20.02.2025 9:49 AM, Krzysztof Kozlowski wrote:
> Enable ADSP on QRD8750 board.
> 
> Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

