Return-Path: <linux-arm-msm+bounces-49542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB49A4682F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 18:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29A2A18859FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 17:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229CF2253F2;
	Wed, 26 Feb 2025 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdNZnwvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9762253E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591413; cv=none; b=fV1KhanXjkuYibsLJ9Pacx8L8S4tPjgXphPcz3GSkfCv6TdDjWogumGpeZLKpHyeNghNbjKLbSE2Zbkb/j2eQhaOAyqzhzgfkQyT0S6ajY3MLDcifoCn/+bfNFSuQaaVDkrzHXGp4XiQe30XQhuHH2PTRdTpcRlIC+iwxRQwBJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591413; c=relaxed/simple;
	bh=iKrBE8YXHqxKwWS/VKbfRuC81Q3gfZ2jZsZgbYf9j74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cJvDgNzNZxXMfM2g854qXmttkE3/QHJflBReoN2pSlPpwtJ7znY36y8cVUheA1ekqDUOhOhgP03Y8XwutupApF1k1nhaQjVKrQdh5dWL+Qj/dQkoKrb4ravTO9wWiuJgui5VdiCosQsqNIBu9hUchTFpyt/ZKxtV9+7ohbL6Zmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdNZnwvP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9xRFx000780
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vAlFBNXTCAS0/SdDMb8XLAtCY8C+/iNcJ4PHLsBUW8=; b=EdNZnwvPSfBlNAU9
	X/suYF0Y0yVI3EdAJ1LYooz/HBwQqOdH/fKrXYgUfVchCpTsuQLtAoJIsG5XyFjI
	3rEwKn3RLeNpAB2z/bOArYiBuHouVUVzLGsSB8s7trKaYORfb8/SV2E8PwGqwh/K
	gFvay+fmLqKtQkqu0QADMlE60Hogfe3U5jlP0yPLjUkS2fmMyBM1s0+Xq5Aa12EL
	kJlpHSsBCDSqYH/R/1nW6ANEQwd4y1/OgnRwM5kZtmZ+sGY4lderl8Q2n1k9ohwZ
	a/Xrw5B79dkhz9qJuzbqrYpJVXEQpcX1hRZEli2s0l07BEol6rhx9gUrf8KmLiGv
	iJ7yHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9aswx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 17:36:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e65bc4f2d8so149216d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 09:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591409; x=1741196209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vAlFBNXTCAS0/SdDMb8XLAtCY8C+/iNcJ4PHLsBUW8=;
        b=Fs6GIl8TlS4IAWopjTHSpoRiXDUd8jlXmFQNvHBm19PwA+3Pb2SNUJG3fIUxctKamL
         F9LQ+BwU3CHA9yTzaIxnZery7wa0KthHr4S4bpBswlmB9FRnZyCgkE635F6y37NitWkw
         dl4gCFcjYMMB/Pc7FPjNaFfsuR2k0Ow7XkG3Ipz04WsA5IjiCforkVM33XPBMlR7VH+9
         sPoMvp+cv4qZd70e4VhvM5q8RcGNjdIi0To+A6uwcDIuPXpmE9iLBemKcX/zHnIjj8aW
         Tu6PJL7gLhhs9muJibnDgg/rWJmIbEun6EGpc0aT1syUT2WZ7yeOgTlaSn7S1ibXKvKM
         SSGA==
X-Forwarded-Encrypted: i=1; AJvYcCV4HDH76qJD9vN8vsEz83hf2cMjlyNx56pQiv+x+/slRymQNtFzqb26k4qT/a9R6D4uyzZqgrjpvn9TKf12@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbiu/frduETcAHNZFzIqDOL6xCaTS/UM6ejQ4EPRPrQOaf7EEc
	8w54232vMHIxqzEo/P0npMNAiAMu4jkKi9L7k6P0cuGLb7QnOzQ2hsCgEZwgYytJk0dVEHc5A40
	lXJimHyE2dh1K9Ir3uwKkoe3rZSqgbGJIhuKc/uAbXF/gD7JX9NhCSy2U0D5jFxRZwWyvrMQS
X-Gm-Gg: ASbGnct31+5od8DFdCCKIgw7s6EXXQi1JyqSB9tGvnVYSCztwWCSY5B8YZrm4zTwpBZ
	U92+PhatNKLxRuoPv9fCBi4HgeD6uHutPLbbgchiLcMJX7M9f06QaBB2tQXnOAeVMhB7t64Ye2m
	d7N8CmuRKIkU83jxuw+ywNdeGFtOi9ZLQ5AoUCtEeIRFWAbrgu3DACE2mRtVY7jJipG97Fk9ANk
	8yuWk/wkGYv10yH9qOJiMuRJ9RLL7WWafvYABkIzSGtAfdfdQ62B8RdYCu/OT4sqNNhIXS60Fin
	pswv2NEclWrylJzR5d5KL2H1bsUq0Ri04Sf6wio4NFbGtbACsImUA6XigNQF94KCfXLT9w==
X-Received: by 2002:a05:6214:20ea:b0:6e6:6081:34ed with SMTP id 6a1803df08f44-6e6ae9d5df9mr99922726d6.9.1740591409140;
        Wed, 26 Feb 2025 09:36:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE9yjKiCO0PPVVHKLN1SK6jQTYG+qFIB3DXGCQMIW92FMkg1aRScPbwLzZ0IUF/Fm78vPClg==
X-Received: by 2002:a05:6214:20ea:b0:6e6:6081:34ed with SMTP id 6a1803df08f44-6e6ae9d5df9mr99922576d6.9.1740591408738;
        Wed, 26 Feb 2025 09:36:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2046462sm362913166b.130.2025.02.26.09.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:36:48 -0800 (PST)
Message-ID: <abe67db8-5dc8-4af8-af2c-c6bd72204a70@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,sm6115-pas: Use
 recommended MBN firmware format in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EJq-M4Ybrhtf1qvl-BTNvXvOK2GowqO1
X-Proofpoint-ORIG-GUID: EJq-M4Ybrhtf1qvl-BTNvXvOK2GowqO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=854 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260138

On 26.02.2025 3:51 PM, Krzysztof Kozlowski wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  No functional changes, just correct the DTS
> example so people will not rely on unaccepted files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

