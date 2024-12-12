Return-Path: <linux-arm-msm+bounces-41835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D69EFBC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F048A28DAAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192591891A8;
	Thu, 12 Dec 2024 18:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2zac27S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3EB166F1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029629; cv=none; b=TsgsCs354JTZo7N3359ILgjxNy0x5wCT4BJ49hrk06vsjsnEF5MjVtc6RYYyluq244Ao/EO0LY7h1OB4KYNQp52jZG5Hla6y/f93Lmyqab3p8AUJpWpwjgknnFV67XChL2NbmjItiWo8bF+yz9hzT537uxNJIG3j6D5vW4CFAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029629; c=relaxed/simple;
	bh=K/eXURgpahEEJaH04jCtGcp1FBNf2Xs9PKt1sSMYnGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJUV97ExDqLd0kRacoMneElS/nk0aRDEE6TSuOwnlLGJOdJNSGgS8JQizW8QTSYWun59aqCD3GTJy6k6VFAxmjBSe2nakCLZ5IJnCErNnzU+jNveIqexO4Y/UlL2DO/ZOc5vdr/1P/RtxDcEDcJKpcddDJFkXq7I/Sc9WD3d35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2zac27S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGlD9K029905
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EWVPBLtEC03LtV/VCcxWaAVnYY20CRfi5mVxiTmo78=; b=B2zac27SxEA5ocM9
	Ny8EFdnfWHp2KSKZzpbHqUgA3Ij6gqBLUsoW9qnDCuEAWLTCEw0ujyDoVnxAmzaP
	bxR2y6ezwTZ0+TxQYIesaIcC2QQiZpaC4ANxpXrEdLCwgraw6SZt6VNs3RvtKR3g
	GXnIN9G1kdBFTFVb3kDEFDjSMZGNNNeX7MvPEkHZ4GQw4Vvb3WeN8T8tzfA2tK4+
	yZ5OJPxim19aX0GJtymP8hRykgwTVkpuK+qqMxa+6HhoSSNisRUUo+QGjv4s93r5
	06s8ukjfPtCVBSGg3hbwqmEGyz0FZTBgCUQLngIQfNNH4606345zWH21rebLXDVk
	PMTz5g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuy4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:53:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88fe63f21so2441336d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029625; x=1734634425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EWVPBLtEC03LtV/VCcxWaAVnYY20CRfi5mVxiTmo78=;
        b=poPcux0z7ZTmQX140sRwvtLNIWBBa41KqqX42r0SaXG8tKvBImiz+WCI10JLP8eN0n
         eIs0LkV7bifWJpKeh2ENmd0KiXjiof7gTA68lqWBTgopkwLtXXw9didntpyfFub/moYG
         VEKa2XhalhP6ULBjuV6su30FbFJq6+8nI6jiJn4CaqMYBDs0iWU+TEqDC2Htuko5Ihkn
         QWmreRE6n7+uIiQfmxk4k1byOGqI0t8Bu4eSPzFBKEamhkXcqzTJroB5doGxHwxKogND
         h70w4YpFkkR14VRm+Ym9le/jmSNBBzUsOBBqT7sLBO+ZsbAAtMdflxBgHFBhYDCbTcIv
         3M6Q==
X-Gm-Message-State: AOJu0YxhkYFHlks94wCmjUmmw0ttKRIEzeM1tiNA+uESfeuGSwSCpE82
	xW7Lk9wXaZz/YQJK3kPBUCdyPeAluvWazKy1g6cMvnxjlTni31R5/0kWt67uTGO0cLZCIODQGoY
	Bc/GgPhRMWX8p/M7ErrYe3vOyTZD/ATfrKpRMaNJX5BWt2rCb7zSeG4ldZd/BzK3a
X-Gm-Gg: ASbGnctKsUr884PVROgNb9CXeL1F8mh/sYUDyBqeq3qG77qft2jlpGXluS+78As5jH7
	/Tcv492N978TQvK87mJWORoUmosx7lNmdOEHlQljoOlUVsH4cgV/gK77PuY8M3Mn1aC/06U7O3u
	Yxyr+BYYUa9O6BfIa+0v14Wg2y7eweATHxFZOptQ4qXmDPsyNDtK+sL+yYf6Wgly/eG1MfWjRiW
	xci9BG/q8XJAjjbnAPd8iymHOcU8uznJ19rNgLE955yBtAxQ8Vm/h9y7mxQNFU935sfwTrMms+B
	Hp8mDlEcFkA0pVfusu1eCE8skwj+utTzF7bwiA==
X-Received: by 2002:a05:620a:1998:b0:7b6:6b55:887a with SMTP id af79cd13be357-7b6f89310fbmr62947685a.6.1734029625149;
        Thu, 12 Dec 2024 10:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcpI2kOmFSxCzRaWBA84uAP+qdfL00B8JP8QQaJsyPDddJIHWLhLeyOAluLqtNov6oUk5ODA==
X-Received: by 2002:a05:620a:1998:b0:7b6:6b55:887a with SMTP id af79cd13be357-7b6f89310fbmr62946685a.6.1734029624822;
        Thu, 12 Dec 2024 10:53:44 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6b1552b05sm259372466b.164.2024.12.12.10.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:53:44 -0800 (PST)
Message-ID: <496b7d4d-447d-418b-b6a9-a47b4a4968f1@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:53:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 11/19] arm64: dts: qcom: sm8650: Fix CDSP memory
 length
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
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-11-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-11-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RobSc4BflqKL-qxGYs5AWhA-O_Mzwg1b
X-Proofpoint-GUID: RobSc4BflqKL-qxGYs5AWhA-O_Mzwg1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
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
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

