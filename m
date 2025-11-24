Return-Path: <linux-arm-msm+bounces-83042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B5482C7FEDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A142341F8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83B12749C7;
	Mon, 24 Nov 2025 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kwo72kz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIYuQF5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94E2517AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980516; cv=none; b=AMw4Xg7gGS45PvBF3McMI6kPk1AqY/PlKqB78miQCO4Krh7TYQLIOItRyg98aAda+IFgVZXhXuq7YvzqWABmGDFz3g5w2J31tNvvkPsMKlF6CbC7GQNg6iZ6W/049z2ey8XoK1LKuIUTLr/2GET0JppXVvueFdYv/bTYawtKiv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980516; c=relaxed/simple;
	bh=at92ZbCGmI3vEj27GSTaPHM5IlHoNF9eXny3vduPEx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmvpf3dc2jndhVjKZ/D+4jPuIO1B81e37wKepq7/4BoBbv8WxngmeUxHQHT0aZBlPAxM9qHapTApUNcW9s7pClBtCgN9deVOy+4UOeMFbA3zxyuYcVfVjw3dziumczCE/TUfOIYGoVnJyxwHyFvZ9F+lkB8kzie5Wb3TCcR6NdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kwo72kz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIYuQF5B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO7xXZF2328437
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRFeD8t+m+x2iC15q1pzZmoSqtUFKv7ocqYR/UNGr7w=; b=Kwo72kz9q/Rq9/Ql
	i7Ri+eHlmO+d29WoORWWqFdNcyrfq/CMxV6f1rsU0k4uVCOrgLe6LuAyQwo5b8lb
	4EZZGQD5HhVz1bQnXacZf9OdB+z1YzRzOxY+tMwZQ0h1tY+Fa+v/HuzQ9gP3+c65
	WAFYp95yJ+gCMRNsbwXkj4aPNmTasgiQ61T8Y0jTZMns9AQmoNBG5nTxRCwNyeUZ
	ytfd07uOnfBS7iz9SCeI8lqetcr++PrCtpx4fDlUAmS9/8sud9OLIo1oyi0Q2pTp
	0lHBP2vTfYSsFze9LY0USxC6hCaI9mgYRsSzyWRHJb8p545g+rxiADqnWnyvDbPU
	jFs12A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdvmch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:35:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso21177831cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763980513; x=1764585313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRFeD8t+m+x2iC15q1pzZmoSqtUFKv7ocqYR/UNGr7w=;
        b=eIYuQF5BvVsYJANsSpavIql6wXOLiL1HkBY5pNOsw86EVQi2TCmJAi7p0E1fo5thhu
         3u8QFGA7cs1Tqt3nwXPwKsX8P3H2PFIN2+o/6ge6QMFvM+aFeEzLu71l4d1gaTytUWuZ
         Pcjy79KhChvX7dEbTEqol7NaAm5fPuAtfO/G5P7kv+wOdaV1hJ3c5uZgxAqkO8sznIo0
         gocqtuVYsl1XhMV+Oaq+P3ghWdM1O3qust6M6RfE/mPilnjIjgNRV9+ZhVfW9e2HyNUX
         cfIpS46GBwRcco5YJPvl8ZbG+p/wSfWuRliizpGfRrdK1ZKnXbniQHqGaCu2a5izmcgd
         RK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980513; x=1764585313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRFeD8t+m+x2iC15q1pzZmoSqtUFKv7ocqYR/UNGr7w=;
        b=cgFaFxV735bKLAq3pFObm0wGxZA2C2+7+PlDK+QU7y8+y+eU2KUCKbRXfd4uA4iuUo
         qjTUFZVoSleQZpOAMvoN34v6w1c/Rcs8LJRpJUhO+gIw05kHLoXy1zJM93vsbcdpm1zZ
         a22XqXghM8X7lt4tTmS40QHKyWe+ti/h2VGZ0+Vcr5vGpiw5q7msRFD0bZ0/I27tBkO5
         Ph8al2tAMGLz91eWPQquf+gKPdgCWXpnN3x8br7RbAM3fS1bcA6FkYFzjCe/mLrZLXri
         l+9UH3dwC9dueR84UdpM1qf7PaJooUibIltx1PcMTu9EaoO0C2iNvq3TVLzT2EN9MsPG
         Mq0w==
X-Gm-Message-State: AOJu0YxqAvnw3EjU/DQ9Y+ePmeUbWOlIHHR07DgN2+JCOSI1UFWmmuYm
	xX/iDYL3Sj8Dzs1U+aQCgDrU42N+Yw55U/obGdbPj8Y6c998O303eNUEwX3Nt0+lw8UnUVZkStK
	6BOVZtrxEOIbdbg6fOHcHRjMmtklxNyhvY72oAxU8sGpfdra1+Um4FveOjV7KKemWOqjw
X-Gm-Gg: ASbGnct+TTTpFAln0AxtbJPxKaYy1wg8O3WbrUOJrDwot+USRgg0QHvVF0PMcJAYDnt
	Xs2Uibm8AQyA5rVV5tyAktPNhybngTv35yXUQY75wzo21gbCfkcQN/c1EaNztpJ+ahpf3P2cE51
	mgKzN1nt+PQ2QIwHq8iyYkUH1dnSNlHKG6e7YCECsuQHn+RC5uvmA2JjXZNqBxY4X2F1z0vyeUH
	utm+0d9cA0RAwr08ekVRroF1J5E0DKCVFyq4F0ZhHpCNZ0C71GDwj9au6CO/ymiucumQOw1Pcf4
	doOw7QNxV96spnAOKN9Yi7hHtPGWIICSMidGFgDV3vc2GsTh/ASgzYy7vxm1Jj2NlgMnbcoOEzc
	9vlxodzDyHx1ADGrmV1/vDHphqo0mwnEprZFjsWuRWGilQk2jGP5wB73aSFjdxFPnRA0=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr115453331cf.2.1763980513622;
        Mon, 24 Nov 2025 02:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGuDK7vWd39/xHwYTW86tNKmCUXJcUWqvNNTswV3jiprJ6NlaIWNWvKECsDQvJD5yVjRIVuQ==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr115453091cf.2.1763980513270;
        Mon, 24 Nov 2025 02:35:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453645977dsm11813254a12.30.2025.11.24.02.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:35:12 -0800 (PST)
Message-ID: <2ebc0c92-a0cc-4b10-8d8b-cb019ec0b292@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 11:35:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs8300-ride: add additional SerDes
 PHY regulator
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <20251124-sgmiieth_serdes_regulator-v1-5-73ae8f9cbe2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-5-73ae8f9cbe2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=692434e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mAYSrJZFqx11qOWNMfMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: GPbGqI7cQJJxJk3kZPXufnQaskglenX-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MyBTYWx0ZWRfX6DVmAjIMJeo2
 H3sb85AyoANuS4zlhmUBPVlBmDlLLcH94C3kuO75c0T5C5Pvhuve5WL5bVzLOg/zHYJfiCY5pgW
 RHXTipvnqT0gcKtwWNLJHFrfX7PFzN3cAqWL9JzuQavwmiCO2r4zmjHjdM5y35dm7cpjvSW4vzV
 wJ9plajIMNP0b8A5unOaOFkQPtbPncAbErmXUlrLjsfGZFbSqg3uouYm+3aKCstyi37X9aS95k8
 rJpJ+q2DxoFfHwN1FhQ53DT2/h3ypTupm+bSIST29V5mjfqTHzK34Bu/PDeQ65GQUajsnoBWCRm
 8NJydygbhRi4HFqMr8/aSZW6O/uQgQywKK0l74PzOAKUTXKM8bRpW9PaCSAUHThVWKKYBV7YevV
 gfyV7XSDs7vmvQIPRTcgq8bcMK50mQ==
X-Proofpoint-GUID: GPbGqI7cQJJxJk3kZPXufnQaskglenX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240093

On 11/24/25 10:25 AM, Mohd Ayaan Anwar wrote:
> Add the additional 0.9V regulator for the Qualcomm SerDes PHY.
> 
> Fixes: 787cb3b4c434 ("arm64: dts: qcom: qcs8300-ride: enable ethernet0")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

