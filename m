Return-Path: <linux-arm-msm+bounces-43154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7469FB064
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147E5163994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD4E1AF4EA;
	Mon, 23 Dec 2024 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSd1qDvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A41AF0B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734965641; cv=none; b=k3acsGpv2dwuYRgVmAYYcQkTZY42XOEU210sgAsAiMSqu/1EoFEFs14GPTrGpJjVkHUdQK8ZWabyUwDRf5GpxKR/RkwTPpc2xf4irrQ6qpKQqsDz7rg40Xpa3g7zNzPw5dPISeqjz8DTmTFB6dgLqCHKitfnWPU5/ZGWGF/rx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734965641; c=relaxed/simple;
	bh=xf8XZkKz9WcW/XsxNkHMPIe0BkeE0atiLw8egHhCS60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtHkMSIWo7LjA7TEAx3IucP/NWGT4JMzqrsGL4hguJFkUG1eAMAq397eE+LrTtZWM8GbI/XppxuaxZZbmbCzG7v0ZwBDs6UDezuTVpi7Lj+FMK7YTzwXRsIV3mG3dFBSK6BSiwyt+FW4ZF1ywML4s+/xqQNrsPVvH49i2QNArrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSd1qDvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9P2QP014128
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ghtmWKaZ1U0P311B2DIkY7UWMWyv3IgV388/E65aHw=; b=jSd1qDvCPg9OmwlR
	w8YwDBuTDcslSravko4wcTOls3KbGkkO8yfBLb1PM71EXvje3jKDb5YsdYfMtshL
	8QuWgu4ryxxikuxGZlgMqF5Qtyv9Ibda7s1swX9S+hX2Q1DghmY+9/jsdD/poJ+W
	ug9x9VQM5+VpsHpavUHDMB5bLlLvgvX37X/Lu/9cp0jw08unzJDfKkRFLgoPuLF1
	nJHd641KZn3UkHEMXrxriRXCGwzY19qurZNb0xXDtz2wje9lXh0JvLmZWlpoyme0
	oQjYt6rBnObUB7+6EYz7TMzAMpUXpHZCcJ46zrKXGzab8El2Jp0Iqc9QgjHtmFaU
	yKus/A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nn8vsbn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:53:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d881a3e466so6748306d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734965638; x=1735570438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ghtmWKaZ1U0P311B2DIkY7UWMWyv3IgV388/E65aHw=;
        b=nD3Xauj4SvW36wXoZOrfaiH1AR6p7+BMxyFItQaWeo0VsX8TQKf9OnbLY7s5y0yYYd
         FOxFCzQsweYunWs4wqvgUr9hjnABmUrNS3xVN6BHxsCSCT9d7FmV1j/mng5bRUEN5jxa
         JJNUqVHVrVfmVMW29JJ/doxeMn9ykwr5f18mAIyFn/xBOP+3POGOSv9IcKeuh5duV0z9
         Tx43vkatr8BXBjUSy/ar8PUmOo7gAJatDm4NruQtVsGmMt4V9l/PtYKYwKBRn1jBu8E5
         VmaoTzPiZ7avDWBU62vZYhzaRB6SjxdScc5LkUaTScbRrR1HnuEoPkv3k1vq9NqJOw7f
         pNdw==
X-Gm-Message-State: AOJu0Ywe/HMQnMI/2HAuGGyYbKMlUS1c/0AQ/7QAPCno9+Yx1YEc8EDx
	L8T5es20HeJvHiaonB8IuIhwT4DjB6GbsjgBw1ab2+lqz9DbNzCi6y84yJjxiQTR7OnPKjgIJ/C
	FOv8pMkQUGftWQwA/bwDcjyO+m7M4iYo1SDC6X+UhKo/2zbWfDO4z7Mv0EUKEkdEc
X-Gm-Gg: ASbGncuc+geZJ8GhpQUs0WgEav3tSh/cZ2Wcgb+Ig7a3PcMo7ToLVnd9NTbDVUK/3Q+
	NFFXPWs+9IRYrD2nCondaQxxpWPOdjq8hDflwe29P+2lAfGuC3aLN8TRcZjFKDU211oiGatAjvB
	HYnBFa9QW38qEoQ8KeEcbONJdNMWoABe8dIV8rYXhwWeTYt6PjC1hFVoxsXCIwu0jfxZLB6gbK3
	jkiU1Yxn0jxZEpULlh3nVZ8yckR+42IcXt2oTefb+4Z0EROSaGGjLcE20F90qbpms2e4HV0dvDB
	2oBmECYDzGyg1Fs8KT4jUEQ13I+KoNc6RLg=
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id d75a77b69052e-46a4a8cdd7bmr81247641cf.4.1734965637852;
        Mon, 23 Dec 2024 06:53:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0ijPdXH8OJJzJaaNa9GXKoX6mI+05srwOUkZxvg03q2jV0DPYvPA21HOuhd3j1qywYncbGA==
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id d75a77b69052e-46a4a8cdd7bmr81247361cf.4.1734965637498;
        Mon, 23 Dec 2024 06:53:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbbasm5192315a12.71.2024.12.23.06.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:53:57 -0800 (PST)
Message-ID: <43785ae9-ee3f-4107-9f8b-08b882e5dec4@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:53:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-7-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-7-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4FOhb7hKIL_JSvzplfyOrRe2vmzj8jYM
X-Proofpoint-ORIG-GUID: 4FOhb7hKIL_JSvzplfyOrRe2vmzj8jYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=767 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230134

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

