Return-Path: <linux-arm-msm+bounces-87932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36BCFF540
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C585636C1EB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 17:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0424534402B;
	Wed,  7 Jan 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEqxtVM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N58qm9DT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3CF309DC5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802733; cv=none; b=i7z6XVi37LyOC3VyWFLQrWxmGCmGBwGaruE4qEXa100BBSfPjKCi06+tdL4764FNLBINLwIXJp1uS1dAMhk/0dIG4rhZRSJUS9OcOfrZCg6ZKAHG5XhIevY+86e3XezLo3Ux+5V24tZkEVIFHumz1GK60i/DQIfiMG2LcgcIytA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802733; c=relaxed/simple;
	bh=1pDR5v6cY7VSTmp4cJaRlX88gPqHH4JLmaZ7icbCC0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/cDKt3y3DEPlFg8gAdLvL8ANsZadGowa1vaO4IUpfAwznpC4504hmuUnZ6QorehxSDipoUHt1N7OV/eBwlsZTXhz4QHcVp/fqD8qtvkt+bPXiAFmd3aLKGIuc7QFq84GSVKZUe0FEm+2aKsnKZBhSj+jBkC6ftc/X1nRHXsRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEqxtVM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N58qm9DT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079CNN42454307
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 16:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HwZBs/pI4tqrM+YdLcnJrTnM
	DuBq2S6J78a0HWSkjHk=; b=pEqxtVM7ihUy+zNFC6MGh7WxN7cbgbo08zA/hynY
	4qHlzmqRIEP0uOC/QZOS03kyXGH5cV6Jg1Zs7DorHDtEsn0pmksseXi9TztcuRcz
	HFPBO+TTEU1Gnn6x5m4n2gwHD97Qb0AYcPFYKpv/prYihzGuaHkWbGECD3AwA8YM
	hiuQ/x2DQg9FmXWIk3V+jB8rYHeA3S2OhQBI5+7mslQFkWvaG2HKPwWA4rmbB1Yz
	Ra7FvnhBpgzwyhxD2jxvUV4l8utAzuJszDeEqpfnZabgaz+OIHGPgEWeXvBGAeMf
	e1rQPyb225OO+q0LrD2i9CW+DPXQ2nljlVewAoQl6AikJg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbh9ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 16:18:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dbcf848bc9so2022536137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802725; x=1768407525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
        b=N58qm9DTElmWlFTUW29T77LCuMGqK0gS1noMO3ChRybzH39bdIahIAIa0QihFVNUQA
         6j1eVU6zd1O1ZpVbHXTss8ar8vEgQ2g68AHTyufxcMUoHusuuFM8tCjafkU6eRj7o+Ky
         z0wOLcPCEqVYEt82kdZ4BmBeRfwH7reZ9M53Fe8xvCceXZ3/T9GK76e8IFYTj5F1bvrd
         9U93DQHC5UO1Uj25wV1+6Q6jTDLqbrXp0BwLs7DaTmXGvpBH0WZNMEA765xF/UBzQ4Qt
         RaHfxkhw4dfZf/rsSzSvWL75m/SzqPlnPHNS/TgBcwMhmjrkwSpRRp5khyi+1Zd4jXMj
         8Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802725; x=1768407525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
        b=Bu9a3NpTHItV97Cedtw9w0pJLcmPv+MqgwEDnzkX8WD0HyjKTPxne5P6QmEFW8vguN
         aH1+s2dNNAZ1w2dpQl+sXlz8FmAsCWui3WrjxIw6nfy+ULNMg0uKgp0dLG1pUP9Vp5Gs
         9MRGCsIWvOy7d7wfSPfgB6IKTHp498qzBKqGwQAvyHUBs+SqvKxm6+bJ7W8ZLxxi6NUN
         BN/RDEpe0h7E36eba7IdRle7a2RAhzKLcgFg3PM+zCWkQkiE8fYVhLtJZJZbeY+GVwOv
         qXuQuPXZfbHZ8epxouXLDCf5+WVQ1kyc8aJLF5yQ5OkqDkHaWlWvRjp/3YVArZfXsEu9
         HXIw==
X-Forwarded-Encrypted: i=1; AJvYcCVOHmdZ0v32bC7YchPHBKPyQpEBTSIxRIPBU1BKCRYi9JpvEgZ6V+v4hQLimTq4UYw/ndP9iTKGFP9yleTi@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/YFp94lOHWsYvcmhHmkyYhB7QUZid/jKV1qN8MuZ3kc5wFp6
	pxwe7+7Ohh+1kN3M3eLt/q435LmVIuqEcStECPOu89ITE+BVhoV0kVlQ+LXSpamHNCyNgL+f6I3
	N/yxQNk81ozew0Jd9PMLUbXceumCJwrqkig8v26vdqot5dCB9wegAdQ0sDC7n+H/41A8x
X-Gm-Gg: AY/fxX6OHoy8eHxbJunIrmRZjmroe8slemQwlChKzF1+/5uLH6zMGMgCBHS613CIQg2
	sL7EobWHlF/M+nO9JSaAEHfvCKlG4Iez3a74lMZQNEFb4s/jdY4hqoLDsEQ39EoqIFWZ8S3mJuC
	JtoaFODgM02maQR5b4vflmtJSH4+rNJbIVCJ0XpwcjyzvKhgNkZp7E6454z9MHw79Om37hivw2K
	Gbi6UJiDwLhdA7Brx3K1LHQCAuHVTuqvyjZUw9HWzqDsgiyHkEXXe+mtz9qaW5YFgiizTBcJOAW
	Fij1nWmnSfK4yCiv2/vkM6vLn4vsewhtHOmM6fFtfAYceIbruzxJ7r7VYdJ172kbZdgB+MhS92V
	ugF1isIGCaS4twslfaNNRfbmWg5aV8DPUchsgfpaRm6mdeLX51DJTf9GFCHV7YTDLdpEz0Jh8d5
	KrBc5XJjyaviTVyoSkX/kJbEs=
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5ecb694854bmr888630137.24.1767802724717;
        Wed, 07 Jan 2026 08:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHB5ZRn1QY/K6daz0KlPYsnYXAnz+5ET9h4x0F463Jjq+1VY5FCZCLE1JA9Bad2LVDmCS3+A==
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5ecb694854bmr888602137.24.1767802723486;
        Wed, 07 Jan 2026 08:18:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9c39sm12016941fa.23.2026.01.07.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:18:42 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
Message-ID: <lsvn2xjz6zxefs772tg26jg2cvfohbjcetrlxfn7mtq6ag5aig@ep6ofq4mrfrh>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX7DGrK2hOyKgx
 Fn+KAvmUm/oSRFSRg50QHX1ueKPKww3mrNqTRMW2PtKg6H8BDymMonANc8ABE32e9WM9L6jQpLb
 iR8pjHVdktfQe1XjsL/LHiA++oOX5BNE7UFldDB62SzG7SGpwIkFbrzVOQhyf2M2JNfIh6HPQjw
 ULZfmXdtIcgy6zOnnbMn85agPvcdVFNaDOjxcZqrRmqqjyKPf9nKyYHLhe3oelDpJofi+yjYzwD
 Pv+/MLUVKRK+gU+fHV12gzh2xW2NsdRbpmc17QnG+TjWSykhnt66UeoJeBdF8ycyKtdF5jtCKGh
 z0V+CxFq0ntnIp+I6pQ73doZJrZj4xvA1UyU5DaYz3HiqRFMK5hEJB76/D5fSnkjv2Y7TcikLQh
 12yBYQ1QyseD5UamtD9pQG3hWqInsmBS8JSImzXdR90fQH+rMAi5LGOSS7C0eXUyNaU8EUWDZ4W
 ecQmeTF7OCjnBtuh46A==
X-Proofpoint-GUID: bYhKrZRcq3AfHwKo8y9jFaJWlRvvwrsW
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695e8766 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: bYhKrZRcq3AfHwKo8y9jFaJWlRvvwrsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127

On Wed, Jan 07, 2026 at 03:13:14PM +0530, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 482 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++
>  4 files changed, 568 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

