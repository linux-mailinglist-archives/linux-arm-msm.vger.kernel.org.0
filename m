Return-Path: <linux-arm-msm+bounces-41831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D09EFBA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 255DD1890671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06801D88A6;
	Thu, 12 Dec 2024 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImYB5tk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2F1D6DDA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029543; cv=none; b=WKtdPu9M5q+zBPLXWfpBv95NfOV+PTPmIXPUOkg7HhlnrE9ZlrKRvgcjnO3UCxgegcYuIY9QU/BaaOYMe0hpJzTj28BdV8DQU8Do5HFVmH8WQP1gEUaN1qAtWtdCGKmYAtga1Il9DfFqlaF/YNZByFm79y6NngV3xFlOzPPQfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029543; c=relaxed/simple;
	bh=X7CqOhvCVQxAW3TPflUNlS90D5V7WElxwjK0lBThANE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzOoRK1Hh1T59ZSo4YxSjOsW1tv1ncIIZTJhiOY0+mCU2Sf2enYAiqVCxm+29w8WufsJjiLL+SYz43780N2oep9upN2r9ZgD4sbknICXBiSwd6K0FGbkfii7smocQoHGwo2WFxSmu2OK4pfzBdB+lzh5GwVLOR8cKASS8L39Rhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImYB5tk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGjmHH029836
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbEKu8regyq0HdAdOVRdX1l0++CUeLiSYM31GOw+h8g=; b=ImYB5tk7Bj6TihYK
	6fB5TmdhG3/aVMHTrKHH9rRYM73cgQOPhB6Q8MjIyQ2CN31OEvMrz4gaPX70fiwY
	60BP3w4FkTYsuWG9OCHSwvO2agm8BwtUld9WEE5Xed2cZ1oyFXhV6r+B/nEPSKL6
	ohsqsxLDe5GJK0JPSqOvE/N9Pp2JkGsQYu3jAuNd+R43kxfAtDbY1MyuHtnxr2FP
	D2shxkoMchg86J7CP4ehR3/qqJf7j7SI6hQetZlZD+IZZQjsEWnkeXgKOK67PsUd
	EKZw5UXkmrLiIVv+fLXEMtK3MGAQf/I6ho5emhVsCl4QCUzBnrn1PvudaaTIq9js
	t24z8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4cbp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:52:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e8153104so2110266d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029540; x=1734634340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbEKu8regyq0HdAdOVRdX1l0++CUeLiSYM31GOw+h8g=;
        b=J/n6yHWQ3d17TziAAIWLiFwyfHjUMJiT3x8OGdtKwYHU5CBf8FmUnSt9wCY5BY49NP
         wrCC7GCdA+U4yyYEhtIw4cB834yUKWOwYWjzdW0BgZsAFTZwgTC+0NZyNXKpgHInRWCi
         rer0NqC9rLJmvHgRKIucbxqNgYda6cVVJUhrOdYd1ndikG350jm4wmF9FgKJCNIE4dMr
         obe0O3nfjIZmXGrHBV2jBjkgKDf64f/ysIxtRKeGxfL7vh5BMYjmPUsqZqpZzHeUsmg0
         GqKItG5hPXRl6reFVk5eaZthKPHtB0des59dVKmqk/sVXdQW22u7WqMTvsTIBFmu8aGO
         w7ew==
X-Gm-Message-State: AOJu0YzRKvTPqtWmuFGpudiyg/+5Rvc3dFJYnNG7r+aPbY/kzwHxkUs/
	IIK/TX0yge2cHmKQ23oFgRbHijfrxqG5IN08ZHODT1+UYHD+kypLheEw68A6fhEUbLLdv8TFMdv
	bUpTOb3ySW5xyCPLNMGqfOIkcFfb3EcznqNR2yNJMNK2CHMYU9M8ZmyVFH+e+8KQn
X-Gm-Gg: ASbGncu0QrnxE2NZoD36Nz7wSuanIREXkWcYStDGWqmqE4jiS8sCSS45x+NpdCpnJqY
	uFpM2qeOpesBznx2BjfuRAi+iY5gLzhOISuT8c/iJgJnqWOK6Evqf/TnwdgGFj5oxuq0tuLHsYA
	a9sJIfV8mLpaSFgtA7MfAV1fB76QzIb2HyraK5w07tbwsNb2CmsnAgZGCNfXsLNBHOu/Uh6WfzF
	gZ6ZZHkRcC8cjK6J9ziMu2pPrCeGfqwgHxfJdG8hdmxfn9JCEpHXyy7XpmNEGas7XwqBOgckBbB
	JOJNnZYhdEV5YKu2b53ctWRLEJuJP7wiqA96wQ==
X-Received: by 2002:a05:620a:1929:b0:7b6:ea67:72e0 with SMTP id af79cd13be357-7b6f88d9debmr73901285a.4.1734029540155;
        Thu, 12 Dec 2024 10:52:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsPs6DP1+cK7oGJeogjTsBnI30Jp6S92XSRdBy8n0cMgWjsVx/7UX4GSepqptWmHhCzjGG8Q==
X-Received: by 2002:a05:620a:1929:b0:7b6:ea67:72e0 with SMTP id af79cd13be357-7b6f88d9debmr73900285a.4.1734029539727;
        Thu, 12 Dec 2024 10:52:19 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa678f0ff87sm708277566b.131.2024.12.12.10.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:52:19 -0800 (PST)
Message-ID: <5571c654-f242-481d-b1c6-233fd7197c0c@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:52:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] arm64: dts: qcom: sm8550: Fix CDSP memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-8-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-8-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PFYvIX_1dhIh4nY09ppWnjM609uhEgVU
X-Proofpoint-GUID: PFYvIX_1dhIh4nY09ppWnjM609uhEgVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=891
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in CDSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
> copied from older DTS, but it does not look accurate at all.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

