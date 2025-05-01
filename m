Return-Path: <linux-arm-msm+bounces-56369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B9AA5D27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 12:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 634E3463FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 10:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6018E21CC41;
	Thu,  1 May 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTtSNLeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B11D8DE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094764; cv=none; b=ODAiuqnsg6Bb7ieqlJ5tBp138UE3RlVidaU2r996cCLbKudw1+7rTGROdFB5+/BawxGgcslFAUgUU7EceC2IVIwbT6AJwPzFuGK5TtPZKOClcwpTd0Ls7IEFuIh2edde8tmsAS9SbCEpefSiSj0Bb2vKJ+UjBY28qRnJnypuGts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094764; c=relaxed/simple;
	bh=qcDUFQxHUyNZknUCKfm3IojNc+trsUyfhy/vChwE97g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csd4iJTaNRyNL8HlDheiavYe5YLN8EKT6cLPtwMfODR1ZJUY6HPAoSr7f3YVYM3if9pB8040laLMhl6SWXFpO94J+lNYccnih+WxIreRW52c2dNH8yr+V6QQAsOFFQty3FQOQRdvidWeKNUO/7sQrCh4T9X5ZfU7+D32JvMAKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTtSNLeq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5419AqBd001490
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 May 2025 10:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZ1XuECjDv+ed95P9xYwiZkwgD//IqgLjrzUycy5GAI=; b=KTtSNLeqef+7whTn
	2+3csjoE9lhUngLbSlY5MOsyzEf7/gPM0TIK3i2dSIM2WH8QW+DniuAPcMhoab0Z
	VwTuxXVxEHwDr+wn+prio/LhZoDJc05vezciKpIQ2+F3dXrJQgbCZjOZH/mdhCRW
	otqSwKhvum5BbcGI3rWbDSs/8j4J46yBdIok2OQJ43cpRt/RNdu8Rq1vmCB65+hU
	GL4mE0uqMHNeD2vuiRIsjbp1Hgelj1tjg4dLN9qCEq4qcDYN4AYyWjWukswzymlK
	O4cYEOgAj2WpDyKWV9hf3aT813eplkwgS+Ril6EPo3CB/j8sc8ACog5HmJiYsTnr
	69B/EQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9vx2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 10:19:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2c8929757so2183666d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094759; x=1746699559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZ1XuECjDv+ed95P9xYwiZkwgD//IqgLjrzUycy5GAI=;
        b=jyTh5ptVOuMUlnXJCTIsWoGem3g/Cq5T0IKya9EYXBawN1fHalPZdkYGdvmC+H0dg5
         G8jnlbsRnsxvKGx5RGT+l6nbwcCFATmozZsAUBQ7yLKAJtpMz9nYaJT1qEV2MsVgtgRS
         +urdn7Fx6+lfzNcubQYpGIWKqi02fG+YfGiHdNHh/AhX0TWWHJIGhrYA32vo88QKVuE3
         u1xDwKQ18p3Z1bT3d/AwLZ3ScH2iufbFHGgi52Js6FRvrvOzp73bKy+Qtp3cdnaVviH8
         fR+lx78GmK+//ke0vWI2D9VujabAifqwi4HXcjdwjo/DrkMh8XNO2/UhRxbllMfm8Lcf
         K6Bg==
X-Gm-Message-State: AOJu0YzVob/6GS3ny6ordDcu5Xu1L+xz2wkNKuDQY5wLJ0VhH3xfJbuZ
	lsLJPEa9fisGONatv0fSFBPrKm65KiTKXUn/U5Tzb63BKGrdxyvl6csQyPuzkU7U4SBe7kF5mc9
	CGIhNoFplK9iobj3wacvmrldRYhtfV9JWOoFGtjQJYWMEtMXXjr28R78P1BoZ4YxS
X-Gm-Gg: ASbGncs31Yr/ixwTAnCHHuoutcRYnj8mpQc0dLWWQk32Tbil6zAXFWrh2zPLBwBaJnu
	NwcqMP5CBgO4w34xuMYTgFfafbYWcR8t76qwq+EDF4RSlXZeY8K9VVeDwoGgrEBgyVmjTKSdvNP
	GHrJYV9CNWatiUyUnDF+qx/pA8ux+op0YwVFejPBpLd6pxwdsMUeJWLcuN6K0w3SAoVjAlgBV2m
	eQBVX+AlwLs1chzSi2ahXIksPQIvsTodosjDmLNkDl6b6F9DtELfG6e5fcfVnkr6CnySCyEM83C
	QNAoO14sE040opgeT5Hl0QycGVULt8S67YMVyZ8cHJ0UCXUxZIJeSrAMAr0sZO3+zHc=
X-Received: by 2002:ad4:4eef:0:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f4ff62b7a2mr29343306d6.9.1746094759405;
        Thu, 01 May 2025 03:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnWkkppAR1J5LwLt/+BiVd+PZ/zdfpyrTEdEjDFy+FAitwdWPxbK35SmvLa0AFubP84Ny+MA==
X-Received: by 2002:ad4:4eef:0:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f4ff62b7a2mr29343166d6.9.1746094759120;
        Thu, 01 May 2025 03:19:19 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da516a92sm19952366b.103.2025.05.01.03.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:19:17 -0700 (PDT)
Message-ID: <cd8c674e-2036-4fae-bff1-cbd3537b7bce@oss.qualcomm.com>
Date: Thu, 1 May 2025 12:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5018: Add SPI nand support
To: george.moussalem@outlook.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250501-ipq5018-spi-qpic-snand-v1-0-31e01fbb606f@outlook.com>
 <20250501-ipq5018-spi-qpic-snand-v1-2-31e01fbb606f@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-ipq5018-spi-qpic-snand-v1-2-31e01fbb606f@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Ajnotyu7AKNSVe_Z9Tlp4HCAwTwKIv9
X-Proofpoint-ORIG-GUID: 1Ajnotyu7AKNSVe_Z9Tlp4HCAwTwKIv9
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68134aa8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=w5towEkYDENzPYN5PyUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA3OCBTYWx0ZWRfX8zmQ7g2gmsE6 YM+lO++2ygkq2pT9JU9ehV79THDPoWAZn/qK9dmc0FqziBGJfqD+trC1tSPmdHWZPGUmlZ2UYHA 70ZLt58aOz+vuVH1fXVSyVdVKGwvqrsPq9Y8HsdZvVwg0RJrPBHsJX9rkxzVRrCjauiwJ/PMhlO
 kXXqr66m6llDY3BeEAKzYWPj3ZMgTQuf8Ymr8VL7MHcrcXfVQ2/tBULcikSYNhwyU/NtxrXr++M eLzOCjlp2YBdKC+HYIYS7HlrQR4id1Ww/4HSu9t99p7WY7VuFFGnRbiDQTe4JbKKmYbCCUaaLDw PYjtdeLz3pYsSVCdx1vhlpaOeHMP7ydomR4L6Ut50jstAkMiFS1J/5/3R+MsiU4CbukUbYdOvkR
 0Y6aFZBLQQ/kSgebJEYzqWzgeQ31nBW08HbBnO9FdJ4EUYP7VQyMuvQXMXqd94rgBdvmPNZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=718 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010078

On 5/1/25 11:20 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add QPIC SPI NAND support for IPQ5018 SoC.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

