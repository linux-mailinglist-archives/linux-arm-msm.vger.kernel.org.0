Return-Path: <linux-arm-msm+bounces-49314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E742A44114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9EC1887B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C39269AEA;
	Tue, 25 Feb 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xw0Hvceg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33426AAB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490740; cv=none; b=nZz2TKrp2R9wdQ0w9bhsEmg8JQYzxM/MGyrT3/7UUlv9GL/VHzsvY8oBibVu25h9vhYBWxSi56BsiK/suszoq6ODb9uwPvUcmCnQ1jaCVrN6dgKGrcK7L8jVPQqNQ25PT51WMv4j+GE7KxjorIB7GhyArX7DtLqFKqJh3nwBZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490740; c=relaxed/simple;
	bh=v0bj/zqw+24ErI/9iNiFwIBMrJ6F00qOqAwC3m6PJmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkkQE/Go2/QeADTkiJJoIhQemnhCGuw9Bqwy08E8OcWXIYlWgTzjypKDeNheeDk8AKmJRGepDlOtb8H0+v2BGCKgUDqWc1qiAXspHcaPB3n3p0h8pyGqYsJUITjlX0fbt/r7bjvMfAonECYiGtPQ9VZuVAGJSl0RShrK6OMrrlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xw0Hvceg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCaxm1012384
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	woumc9GjD8qeeQzGa6RZ11jkdHts493OKWZQDEqYj3c=; b=Xw0Hvceg5hBS9mkI
	eGRpBipCHpFRWz179D8DzpEGhAi6LUzQwsAxurvqMxR2r9Hv1lCpoe5uMY99Q5KM
	nWp1FZdkjxGYQ70829sTBB3VXn2LNGzzbI84U21I9P0rOE32FCBWfmGRtezdmlTv
	yixKlxybdY6emzQtjuiw8WwMbRT/G0nqQ0PWaBkTjGAGviROsK43N18QOFC15VOq
	5NOIX1Q+TS+1oDi3CL6+uUKMiCet5bZHAN/ugn8TSiolUC+vOulrFooEOex9wiGO
	8Iq2VKs8dDe6em1z8ynxN5GlNPPhl1E0tI6z3WRDMNfj2oCY8XYY4aTi9QxzVJPD
	3S4nAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451e1984s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:38:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471f842ebcaso13916291cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 05:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490736; x=1741095536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woumc9GjD8qeeQzGa6RZ11jkdHts493OKWZQDEqYj3c=;
        b=Z3bYmkxn5RZIwCSVmDN/YgAajln7UG/f3lcleLubKhdervPTfFoMA063P6PkCYB8Bm
         DFCEqEbguMUdILmSOeDjTMEhq1Rr163CE2U/yW/Eh+8yNbH4r2d67xsENxyRLUkUoIQ5
         D7dQgIrth3udLf6UGDE23sWRw8SDrsSotjCeql7SZzK7cw4UvyM6nPVqpOLb4X0vrp1B
         AlciuBe9tontQc4FofPzUG0Rccix5bpDavbWdZxuYl9O7UjRsFgAfOH+N6KtcSN63R7t
         LQagFNw3/QYJ4QAtk3gnvBsZsvzpSrzAQv1FRkjRg3KUI1NgtNLiMgAGFmiKmCe+BPZ/
         uZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVuVhffr1Svyb0fLPayEOyR/xQWC05MpJfivEnJHeCwjRBOSpuqEjbnKHX7jMRoAMyPyJrrEokNMqustyw9@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUhEZvIo1ZBKYHnp4aeGapQIiTd0y3ALCSW3qkxx3vmfwmEEl
	Ppa/Wk2Olt1IsXTtPJaZ+2h93aFryvWlobXYbynPYUIupggOE57c1efqhgFv1ZwJ971D1vnfxhr
	dmqFgalAr0eJsjK9Gmd9jsENk1zyOrnHr6fa7lhUOqMhOHkugkvklO/fpGXeAjIao
X-Gm-Gg: ASbGncvgrXgmFh7Zd+0T/T0FLV2UR8G/9FzmbDJqBsveVOcnfnduw1qVBEm6KRuIKXZ
	DQfRyCiQ+HUkXaNGFY67kTc2kpBD+HzKlgIUDqujcayyjruTCU7QqGQGinQKBWrVEpKeOQ0iXB/
	tWt2kblftFL6x8otsVNKasIl9zLcJz4KwppHLbEzfG89zdL2opH+wJwQZNJmDjzW8E8jyD+rHeS
	1OvczfTJAbZIp4sz/bOKG9ZMBOmTDJouFrFVGNgdtdBaTwlrItOJ8vJgoY6Q8nP7HjpRnxqHu6M
	Ywill2hi+OTT4z3Oob0isX4vtr9Mh9ybIVSkaDJfGTFbiFw12QTRwxqxWRre9tAKRBluKg==
X-Received: by 2002:a05:622a:5595:b0:472:1d00:1fce with SMTP id d75a77b69052e-472228abedamr101174411cf.3.1740490736231;
        Tue, 25 Feb 2025 05:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjOXuBD+5u6McaA71MsHpTumzGjAxp/BpGHbEliPe5AFBeQouuQ+C3kOjYUnIrWHRb3ZXhjQ==
X-Received: by 2002:a05:622a:5595:b0:472:1d00:1fce with SMTP id d75a77b69052e-472228abedamr101174241cf.3.1740490735850;
        Tue, 25 Feb 2025 05:38:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d6b153sm143635766b.73.2025.02.25.05.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:38:55 -0800 (PST)
Message-ID: <3956606b-71de-4c71-afb0-c4918888db19@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:38:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: make SMMU
 non-DMA-coherent
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250215-yoga-dma-coherent-v1-1-2419ee184a81@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250215-yoga-dma-coherent-v1-1-2419ee184a81@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lQ8gFq4Vkdr_onJL_TahHfgcbI7Ny75x
X-Proofpoint-ORIG-GUID: lQ8gFq4Vkdr_onJL_TahHfgcbI7Ny75x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=762 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250094

On 15.02.2025 3:43 AM, Dmitry Baryshkov wrote:
> The commit 6b31a9744b87 ("arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on
> apps_smmu") enabled dma-coherent property for the IOMMU device. This
> works for some devices, like Qualcomm RB3 platform, but at the same time
> it breaks booting on Lenovo Yoga C630 (most likely because of some TZ
> differences). Disable DMA coherency for IOMMU on Lenove Yoga C630.
> 
> Fixes: 6b31a9744b87 ("arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Let's revert the offending commit instead, this must have been some
sort of fw development fluke..

Konrad

