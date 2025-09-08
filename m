Return-Path: <linux-arm-msm+bounces-72535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9456B4879C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB641B20B49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EA32EC0B4;
	Mon,  8 Sep 2025 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6usiIBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6602EBB84
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321678; cv=none; b=BmnOTf5w5+2y0IXUiIIa4i0pnZZEce80SomF/c4FZzW5vyVSwJCiB2WpbT1Bd0CFYhx8ezR+gJuFo3ddoFlnq8OKGZnZLe4JfDRBeb/Fru7nwkU/yV28yhmfWJHictkxoDK4P6rM4eIzB8yW2GjujZo73VzmwlONWfAA5HSM1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321678; c=relaxed/simple;
	bh=U/BzMoUvt1p+lrlzfnWM130TYZNT0we5cA8Qr/q5vl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D/eK0zbN43L+yif6B6LSdvOd0jYvmOwZrS/25YsMO8Mn/GVLubGbJF+EJsCHaz6F07JZATTlt+IGcryl/sI1Jut4JIY+jvqkXMUsargiMDvfNKgjnwpy3KTpR0+4iErtPDHSI9WVeJyZcnw6lRVCqFO90UKN2Ik3s6SrulhhTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6usiIBP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NtQo4005035
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hWa8Xzz78GSzXajFVYXPHM0TIhQ9mpklAO6KpkgFcw=; b=T6usiIBP7TwK4R4g
	Fz8v3EI1VV9Y0b7oLQum5vOwmpTctf0cuc4whkRkoQLhy64q1Skfvt3cKBwvRS+p
	RWy521tjysolVY7C+mYSMlAi7VMthHV72Y0XpWdupUJx1Gzbj5xAuCQrxTxrD3to
	baQGyk3dxUBSyWs3lBcgCgjUVND1INNrOIjNXzcOuiJbIkGv8QlRAI1VVTbEnVUo
	rX3t45heLjPRx9hMQgPFCQsAXbKXuIS3nj9TRFWs5U5q+wTG/ogMhAZPoMART6IA
	XZJNfRRW93ZaD8MvzMogGdIskkwO/vPYhIAM09L2BYfhVVLsvKl/0D9phHAvMV0+
	CynHmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0kwe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:54:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b6023952f6so6620141cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321675; x=1757926475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hWa8Xzz78GSzXajFVYXPHM0TIhQ9mpklAO6KpkgFcw=;
        b=NCpfizZsXvXYfegj1hgyeFIOyfHNHMUafghLogC01lMdz0PS1gRZR1cXKOKXw8WykA
         9qQw5H4Og6SkheoCvJNRG5yCYgH0s62Jo4/xjXx1+Ybq8uvwN7Ef4dCPxnuW/UiVQvwk
         Epf6CCIswmFtzvYO4ytkB9V3fji9zSPKcvRwiEDZ8Wb2dqH2zXdrT/XBHjLRCC6Pquxh
         i+X7ekO+NqoS9S8a6TEYt6W2R96i+WI6Ce6nP6cdU5DIo2gnWqYyF3J9LCuDHv4BC05a
         +oJSklircp3Ce4BtpPO06+kqtFUkFeaFsBi0WMitdAk2kPv2MRcB5fdNm3wIzp/J8CbY
         oEFw==
X-Forwarded-Encrypted: i=1; AJvYcCV0R7PGFywfX1Xt8Hrla/x8J1AKR3Ew0RNBLx3i1X5bnkU9z5DGVGv0K+2Di1byRACBydm/CUR4XtIOi7zl@vger.kernel.org
X-Gm-Message-State: AOJu0YxjS3PDu3RABxVLk9zKiOOwG9U4evrDxo5J8GEuT+ODAyithvrY
	YRl1x36AfaQ0Ks9vzMQ8wCWckruhE7XIqu5+7Pz+C0eA57Ak0OLWZtROqb9s/Dt5FWlWONnsNGe
	b0CYfAdHwRgaVhxsmIuo/V7iBb4aChCalrhrRAJuSPWjnALLli6gZUEIKslzPuOPXfW+Ss/kV0G
	7B
X-Gm-Gg: ASbGncvqLhrVQScI3v1FiFw2cs3P3t9P/SZHpXz09o7n7rQI5T1hQmcVQ1G0cezx4F5
	eylDDh8nCwPv8hQOA1pzOAMopTklqf5xK+uXeZQ5+p2uThLsAxo1m3uROzNUS95stwjcheFa8CX
	ojVnp9KHtdJEmEN407rbatvyu4kZjqX37TxO4zHLyXw36ZjiyV5I1/OnNwHmZQ/K9XKBkWhyT3y
	LCqNaMgtXROYiOz/rYUDecQXyMaW6Y+FQqeHYS1e4/wd1CTZ8Jm/2+CiCSXPIC6B2xwmTaKMF3O
	js2rmpxzxtRL20RybcQbGw9TTocI0pJblT0QQrYJZLR1xsMA0bfJPamGmh9O81P2dMVVkydmuvV
	BKb4k/JG7A1EYeX8t6aJL2Q==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id d75a77b69052e-4b5f856938fmr48023131cf.12.1757321675085;
        Mon, 08 Sep 2025 01:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5LFVgwRRvjtMNlYZC6Trbu+B1dQjaVDsf1H2EzED22a4qBEYHJG2Wl2zUnnaD9f3yOvJ0A==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id d75a77b69052e-4b5f856938fmr48022971cf.12.1757321674518;
        Mon, 08 Sep 2025 01:54:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041770913fsm2018216666b.107.2025.09.08.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:54:34 -0700 (PDT)
Message-ID: <0b3a6bd7-74a8-4a43-b1de-775efcf3d6c8@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 10:54:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Drop redundant status from
 PMK8550 RTC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250908085331.56478-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908085331.56478-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FziGgOj-un3j9J2EWMl5kQmVnaiO9yfh
X-Proofpoint-GUID: FziGgOj-un3j9J2EWMl5kQmVnaiO9yfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX45rBA7fQm8Qv
 LyoZTvM58NAyHWfGiBmLJIqpg7YdIn7Q/cVJVa30Tvbf08fsNRCooHnY0W8Y7RQR0FC3WnbR93e
 FO9cqxMto6unbrJTkMXVmyxDaRh3qAIuEejzxduGrIsEYw8VspJwHDvttwTCK2sM8ekhOvi48ML
 YepyK4NHSogceqgr19IuuocCXc5Xol6YJR1qGQpwFaS3Ub2JZO656LrXzX01T89ytipaeURvzRT
 YUlM3aOph3rwwyOTx58B65Oae7T8SWRnG7yZLHgimjqQaSlVqahwy91c3mbu3X9fgKzNd/idrLC
 +IIxS+0VNHCtmIBSHHQFYPamJDOjql+cN/9R51oPs1ylHS63VQpXzVVg/KJrsJzJH8FDxgoyKZZ
 ZvWQ12yS
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be99cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=v-xH-oZzectvFPV3Ef4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/8/25 10:53 AM, Krzysztof Kozlowski wrote:
> The PMK8550 RTC is always enabled in its DTSI file since
> commit a791fc19965e ("arm64: dts: qcom: pmk8550: always enable RTC PMIC
> device"), so drop redundant status=okay in SM8650 boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

