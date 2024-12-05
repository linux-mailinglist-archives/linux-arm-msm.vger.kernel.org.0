Return-Path: <linux-arm-msm+bounces-40605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878F9E5D38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD2E1882486
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3854B22576B;
	Thu,  5 Dec 2024 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Um77fAcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C98224AFB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420048; cv=none; b=oEMV1vqWOkFB9dVke/9s8PcSy2ksS7A83CC5mEwS2idIC/AuW9bgwNmSWPDogNiIWCmDZultcL4EvnveN3KBLNWh4NdCwLc57nCJTt9+fjbzT9g6YyF9NUV/CS+sslx1XRhUUsKMh0od4MYtVxx9+X4+mnI0AKcJQhfQ7C9vbSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420048; c=relaxed/simple;
	bh=ErR45etpBQW67008uzXSO64KJgR8F5qcJ8yKDrdpiaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emz9hPkSSJZCqdZlW5NRIl61MSuuVT/4eLpJMvULvBgpXEaIy37bHtXKqPHRgN7K+RLkz8YG/isNrteWRNohE8E0fLnyZxnPfeS3nr196m4mQYBps5jtub2FdDybuJP/fALD8VlYlwKXTqItGP04nadLT1pRgJWNniRwpCRnmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Um77fAcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HVfVw005888
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWfzeHzPMS1IcCqXdujMcNqA3F3fqajcpXaAmp3fkEw=; b=Um77fAcRknJg94Ck
	2Tc88LHnj+oqrdZNmnF5QVcW+jhO8AFOjMFbIoAvWVCVJ8GKO7gyEme6sA5rOa+2
	vw0kv/DWEqOeD9+PEoRwZt4GgQMSvO3/RwiHIIDkfpMZzYTYRJf3XcAcS7q1U8To
	e/1lgYjLt+knPXvpUoc82IAebCUJ2S16yGaxGGro1KchFJkMwNfFIADePjN3LSc5
	r5CkZnUTux5rJtZz4BiFTl5chgC9EznIx4BZN3+4wVHENSZkfyqCOKkrbmkFkNGi
	MLZJv+yzO/rZZUxwXbtUmwUB1627A7KN+9e/TX3RnmU3gkJS2zVHIWPaY1tghXwl
	egOJcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmgy2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:34:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b66ef699afso3332785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420045; x=1734024845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWfzeHzPMS1IcCqXdujMcNqA3F3fqajcpXaAmp3fkEw=;
        b=m+BOyhEYZDLhCgLjFs8EQLeGWlDIsvOVjtpWPcVyLJusVSmlitxZLZL9lhAYCWF5qB
         /Tfvv/6vDSI9Qc6c0dAl8uUHi+xE3+pjss13CwUmNpPYzpi5mNZ80QnauoNWn66QMcQ8
         Gtof2Imm0f+q17AZNBn+BhSiWMM8sDChgMJyvF3vX4FmqOAs32f8BXezSUEqESahJ700
         WDkIZ8VTh20Rujw0xW3Fqla+YQb28LfltITCUKOuVdB9cByS9K71iWnsKTsi2C13U7gk
         y7g9ioKZjbCEwyZ6q6vY6VG0Wg0Ss7sbeKNrOxkSYRq9HL00pzg2vGHXl9e9Fk3k2Nge
         n4Gg==
X-Gm-Message-State: AOJu0Yz2UQGF37p/Fn2PS0s/PWUbSzPWzwUReZSTPpeMbDhKzJ+ylYmQ
	kVHHm81cEF26IrE0Ah9ilRGtfFt8nEtXkBPYxLQLvwx/zmbU7wvDZoFnigk7k16iWw+XqzdWbVp
	uyZKg4bhnyAxFG7M/69eSZCzXIF/nfb0JnL938VlF26n1jZzrSZTFryQa/oeeVmBf
X-Gm-Gg: ASbGncuDOr5DziJsDf+JJsZvs2v783CfBSklNcfC1QL77HCarVGsocLgRNUUvozRFS1
	RbHakZ5sfBxIU3pyWdupJ9YC849jaWW897V6HXaCw9PjSUjsMIa0pGYRn1hjVOMTKflmZOXqgEr
	+zEsxyA1aY6Pt44KSEBGYFqLVf3t4elP/luFopluoy8wHxzXy82myENAAdkAbOYWOFTzkpG4dyK
	KT3d9tD3euiSulpe3ca41AAYB23hMsHvDozoz+7K3VELWpIqhC1j4mUevyDWQbXlWNr6AW2T1aW
	l4/mTEWL/yTEvkhriv+A8qZiKpJE6W0=
X-Received: by 2002:a05:620a:2a0a:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7b6bca1437cmr4669385a.0.1733420045071;
        Thu, 05 Dec 2024 09:34:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn+YSIkAxvBPUmW+ektuB1ONEtrSu4RodZeTIDoAMUuqgS1Sk4wf/LaoZLm1fMkVJYAIn85A==
X-Received: by 2002:a05:620a:2a0a:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7b6bca1437cmr4668385a.0.1733420044721;
        Thu, 05 Dec 2024 09:34:04 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62602cf52sm118774066b.115.2024.12.05.09.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:34:04 -0800 (PST)
Message-ID: <4e6ec861-ef4f-4384-aab9-107c710987af@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:34:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8750: Add Modem / MPSS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
 <20241122-b4-sm8750-cdsp-v1-2-9a69a889d1b7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122-b4-sm8750-cdsp-v1-2-9a69a889d1b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n87EI90HfY0wpBuuY5XUIqiU9N1ySBqB
X-Proofpoint-GUID: n87EI90HfY0wpBuuY5XUIqiU9N1ySBqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=790 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128

On 22.11.2024 4:26 PM, Krzysztof Kozlowski wrote:
> Add nodes for the MPSS and its SMP2P.  These are compatible with earlier
> SM8650 with difference in lack of fifth memory region for Qlink Logging.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +
> +		remoteproc_mpss: remoteproc@4080000 {
> +			compatible = "qcom,sm8750-mpss-pas";
> +			reg = <0x0 0x04080000 0x0 0x4040>;

This also seems to be 0x100000-long

Konrad

