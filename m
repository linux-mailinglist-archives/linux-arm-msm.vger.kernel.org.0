Return-Path: <linux-arm-msm+bounces-46391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE04A20AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 14:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEA1D1624ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022781A304A;
	Tue, 28 Jan 2025 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ci7hjrtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1261C683
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738069427; cv=none; b=OB2n0xydszcWvr7Vwst5tvKZjTLUu6p3BcROpZrqKFnF1aPaqKbNpG9BIbUeZRnUUSqGjmU2Y0AXIUDYbzJmVLXzTCoL4eVs4WckeG1KdwYh0OywsWfCOZ2k/RtD/NvsFoVCLGftikJl5wJX3rS9ZKEb697YLhWgOod2zTL/eGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738069427; c=relaxed/simple;
	bh=cA1+dYNSIRoR/3QiC+V9qev2k8km+8t8DiBhTgjUZtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLRH1DSDItUxsrKecDvCJ1kVBXDC5AXhhl56DnnXxBuwN9qYFxGmi4hZ/fQVP2SmbeXbqcKFqPPOhosCOAIykfU6B6OKxt0MeDKr4n4C7jVzLs6N+//JaXHSJiSWoLx3ZEfV9RL761Cy9awfDgN6I8IsEmwlsXy4h0PR77rDVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ci7hjrtu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9lbqA018381
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzdUKbySnxWd951/O20ySCsyqCJzH/i5GjXAoiNmERA=; b=ci7hjrtuYXIU+LBy
	FYt0E3nnh4hAeqaPLVJoSvoVn4TtJnmLwTigby3oWStkmKmYZXBsQMmggpnofc5T
	v1yyfqbQQrN4FgnkuNY8P0Ps+ZDtvnvBap/PqeZImYzm5b5Sv7CYid8h+E8wVH7J
	obGw3O7n+E2Rof4/a2YOnpZb/MBejckgBwoJqjVrrNd9YsCLoAPypOkx9NWmII6J
	ZaM9vIP0+VvBLQ/d0cY2Oe92X3MlJ7U63/L3H1bzF6uPEKQsKU+C2lj9iybCNSeG
	mkyErxKkicZ7WEFf3i9n7a+g5HpU0MISK8hqIXnFM/otE836UvhVUzvYtEow3KRl
	cysbhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44evwugerr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 13:03:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b704c982eeso135068785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 05:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738069423; x=1738674223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzdUKbySnxWd951/O20ySCsyqCJzH/i5GjXAoiNmERA=;
        b=UmWk0ArqxEthl0abfjHXZYfVY7bdHVI9qSvJaEQ4ErDNo0Wxwg/5hOO+if5k+YYBgh
         /ADamZPI38MNhOOIm+xs6ONq3xdC/MwV4tVOifKCqBIfuwiyYh0NculvbYbUyJHIs/m/
         +sNc2zSbfhPHWrS7T0beRlr1mASuuxLGTeBvYTyqWByJrz9WNlrFpU6WBIEj87zzpXpf
         Sj63re88JyLTtcVg2WErd8EMit45nO4izmlP1v1wOtB+9wOVadlxHDpteR1Wl/mSAAme
         Uurz+AHyLQjTU3dVJEpHMCOsmYSdujVUMfZMk1deStQ2+YmeuLI0yS2NbdmQN9mHizzh
         P3cg==
X-Gm-Message-State: AOJu0YybzPfCUaznmqBT/OEif1UIG63Y2UqE32Wmf0vdv3NAsd2epX4n
	cJf7TgzXmRAG+mDqYgbOMWCszRvX0cstJmbwnVRB4b8MilNC2SygYzctfRKUiIZMBVHg7EH4t0b
	LGOn1xDrQ1XmT6pOdKyf8qE4jfRuMUMbmNVq/x21kq0d/ADyxoG2ItyS+Ie1ID4wp
X-Gm-Gg: ASbGnctH3zJy0HXNuzbTts/apT3RG0WUswyqyRGtp1XlAAE/7r16t6ON7lrIT3x1RvQ
	tdeQxad2ruUmqhOspYQSVInWedEOOuEjgDZLvM+9bIerVnznmRJVcSm2koHAj22c/1df5Zwowos
	x+X7RqjLbkRa0hy53e4Bly3BVFz0ELLDlMQQiVdhprpAtszlb2OIAnZLwVsu1XqSRq/Iy8QsOfw
	QU2a7tZY8H0vKGGDpkUqxwivSdJ2B03LS0KUQ5hbh9S8g7ePEgP9eCNxlTfkGJ4IffMlUGLpFYM
	hO81b6YpbYXN6BVpQJQJPEnTFkVoOe2qb/ELDGsZ7gBoV6hZTxW8QXm1ISI=
X-Received: by 2002:a05:620a:6284:b0:7b6:e6a4:9668 with SMTP id af79cd13be357-7be8b36c63dmr1702349785a.14.1738069423185;
        Tue, 28 Jan 2025 05:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv3l4gWWarMYY79Vvpxt0xJsS3TGtrxRQf3vlfAdEtde+7sNjjx1N+O8q8Bhc9W6WwwBW16A==
X-Received: by 2002:a05:620a:6284:b0:7b6:e6a4:9668 with SMTP id af79cd13be357-7be8b36c63dmr1702348385a.14.1738069422824;
        Tue, 28 Jan 2025 05:03:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbabdsm793202266b.136.2025.01.28.05.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:03:42 -0800 (PST)
Message-ID: <a98bf5de-632d-4c41-bff3-d1b4ea36c318@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 14:03:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] arm64: dts: qcom: sm8650: use ICC tag for IPA
 interconnect phandles
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
 <20250115-topic-sm8x50-upstream-dt-icc-update-v1-5-eaa8b10e2af7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-5-eaa8b10e2af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e1WOzC2HkiC2uqM5NxwpUSyp1vi0OpEg
X-Proofpoint-ORIG-GUID: e1WOzC2HkiC2uqM5NxwpUSyp1vi0OpEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=649
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280099

On 15.01.2025 2:43 PM, Neil Armstrong wrote:
> Use the proper QCOM_ICC_TAG_ define instead of passing 0 in the IPA
> interconnect paths phandle third argument

second argument to the phandle

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

