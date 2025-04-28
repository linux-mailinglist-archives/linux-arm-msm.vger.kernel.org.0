Return-Path: <linux-arm-msm+bounces-55986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E2A9FC33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2257F464481
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6D9204C07;
	Mon, 28 Apr 2025 21:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKCocxwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317678F32
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875892; cv=none; b=LPiOqfFbZSboQfpsoAkaN63i1Rm5KN/IMoiNeNCz8J3GVCtHJDwQ4XVPjxkahl0hyLxvlUIGLYeVoaJuYnnr4Yw4+9C6M5UcdD+jHZOZGL+ZLHvEiqlNuseKYM/Ismc3t1psGO09w1HD5AlkBb1d0MpmVgI/dqhvCqVfA+8T2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875892; c=relaxed/simple;
	bh=1uQ1p9HChNwz5v+PF4C2YcBZe/F9h7GtadiTffhnSMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXSyJ4v7Pfsog6zy84CjBKviMyZj5dQ9AqbFgN6M/mTTKZI0209HKfuE5vXgumjDaHyyXLV8svojnVG+nHa6R3BmBKDZV6Vqswa0lNVUjUD3C3N8/AaSAy6LRw0mI40HuUKjZtJCC9nSsQqiWCgaYUXvGYwKgtJL8q1PKSzq8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKCocxwV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SABAEX005953
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koDjRjQqH2to/vO+qlVb+RlrUwtA9Ktaqvw64q5jU34=; b=WKCocxwVJdi83sdA
	NZE+FOJ/vswHygQx6VSJL5Xx1QIlHd7tfYTKDSlBo7jPIAQNu7lcu7ceqtjrGPY7
	hlUXDxUDGpw1SdievXxOqfI9TDdux+eB0JRRKZGPS7PfU+eZiTryj+WgDFM3Bit5
	k5e+ySLioBldbaOncUMQAjVRU3/S9PCm+63BmrRjVKog3q64kk4YvDo/Z/NL43+T
	YxsIRorF2FR7X1LoYUFvgkC5LPEZG2lAnbZoXv76rGJqDESzkeafaVslOSa/hh3C
	bhPVAhz+03r6+2mJ0Uz66M/DZWAHQLJMV1eXAxvtWDARMJcGneXO3X7dTMnobroa
	Er8syA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqjmde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:31:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae9ed8511so9929481cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 14:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875889; x=1746480689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koDjRjQqH2to/vO+qlVb+RlrUwtA9Ktaqvw64q5jU34=;
        b=KvB0e+MehFImPgHQBwvcFG+LrF/j/Sx9aHW1Qt8S3n2U+SBagmyGZ8zl5Ich0PJ16L
         OiMPuL4aP2eDjIfDkUvmFnmW1VACICWUFmgJY32ROEY8o0Ztm5kcxwGZOC27wQ/Prf8G
         uDlwFkIcrYzJ3RS+pcxwZ5QK2hOLKeceSQxadWcIlEktYWrOR/9LolwziKKGG/CzQJtL
         oh00DKYIkL56kKaPrTVDikw+2zvp+9IuuL8LfU9JHg2aE7F0zSuTMmxAhCeN5k/HjiNj
         yTuamSI1ASbr5+dgzgg4DgNP2p+KTisJFj8Y4P8V6z/F4wlIfAySxwmXXnQ0g8W4Saup
         1Dtg==
X-Forwarded-Encrypted: i=1; AJvYcCUqNmAp+6vvmeO0IM3pDfloMifRvvRYGWeCxSoOT2Z8IK0uCSSMmKT82VpRBZ6a5Ze95rdQaqRVmIRVK/je@vger.kernel.org
X-Gm-Message-State: AOJu0YxDOLI10xi/nMHxt1Ogf1Vm0iEnJjNttopLdl+uOgls29TLIg2+
	9GHxhoFrDK163vINiBD8T+cGOHWKBJLk0jp6tRJ5cAvGnh+gZqeg22JlzsQL9B1TSUShWQqmb2b
	EdRtXQELHFTBuRzuZkJciCNb5fJJE1kdnhwRkV539C4mSmlyGSd/zo0JXN0Bz7rlP
X-Gm-Gg: ASbGnctjxtC0zV/m4z+Po12QWklQXWoUdBe6Iz/mdXzXv67IL7XVSdy6pIbxSRsvMPu
	gzyUm3x+ZGHiX6yls8jiOw9EH0A+j0s2kyoJDyCi1/MpF2oBakKJo+CiSfSxdTBWZbxLr/4/Y1v
	aJGziipj6tpPO2auj6jMxWBWkVOtRMx9QwycEcQWL0sJuebmPW1xbOabowUvFNE+PQHr38WW1pQ
	MVNxjDyEEGc1rV8YlQWjygtK2J3lXRdVCg8a4AnQkG6tvjwa5B2h5DLfM9unqzEJl2K9zvBxk5Q
	HZJcCCIkNn3IlqgmMVgDbrWQNmUnKEHReHAWj9R1O9HVAhvUdeVwlHRNYLBdtJCGuQ==
X-Received: by 2002:a05:622a:24a:b0:47a:e5b6:50dc with SMTP id d75a77b69052e-488682ffe52mr4176121cf.10.1745875888946;
        Mon, 28 Apr 2025 14:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENWhwgKml8ygNyxQTKheJZ8sJhCkDikYrPeQpN26DX8AIlzvKeWw7xfymuBifBcbXQUgqFqQ==
X-Received: by 2002:a05:622a:24a:b0:47a:e5b6:50dc with SMTP id d75a77b69052e-488682ffe52mr4175951cf.10.1745875888589;
        Mon, 28 Apr 2025 14:31:28 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f841fsm682105066b.72.2025.04.28.14.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:31:28 -0700 (PDT)
Message-ID: <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
 <abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MyBTYWx0ZWRfX40VXQk3Bs4rm 7A1n+TZS7AYL15K/zecOU4sGigDpEJTop+PmTpwb/HR/cvt2IPzszpgaBZ4Wj+G0Vip37BlvQZb GKXbdf+Sfqyk3kQN8AEnZMnEibRUjOEsUbxyjHR+1bKW1a//LvuTK3PGveJ/lZqFDKHB/v9xS5d
 GnmOBVfJulNApQSMOD83EYDWNhVKTr91W1gI3cmg1ckCnt0oABQ0iZck0zSgX2u1p5Q0h1aYzZH Dems5qFW0/swMxJ4NH+QXMCtxNBaaJomlC9RamJL08LU/aHy5Aju+9Wz6vCzRZUmckPkYD4MxWw wzhD9PcitZQemQZlsTDUXZYTdbqY0hDOEPqc9lxyxXq4LfPUkmhSpUnGBSH/o7lpLKfrWX8lm22
 rickzRMxSZ/A7oyW/WPpPsp1QfCd2RmH6nk50jmnmmCHKbCkhpLIp+TuvpXD75CFOOwpj6vi
X-Proofpoint-GUID: InJGPhIuvqvZwBt66s6GxsMt19Xm1m-9
X-Proofpoint-ORIG-GUID: InJGPhIuvqvZwBt66s6GxsMt19Xm1m-9
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680ff3b1 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=PLh6gWFcBclqXqoiQUIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=767
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280173

On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

[...]

> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +

The computer tells me there's also a 156 MHz rate @ SVS_D1

Maybe Abhinav could chime in whether we should add it or not

[...]

> +				mdss_dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +

Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
with the decimals

Konrad

