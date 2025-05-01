Return-Path: <linux-arm-msm+bounces-56423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B988AA65C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 23:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D59F7B7727
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 21:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D07212B2B;
	Thu,  1 May 2025 21:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6vyi+7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402BC2192F5
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135932; cv=none; b=Qkd5f/U4Wc5daay31EXbsxyF6kied9IJKedJEza0Q7ufLJ65+uTQl9XtoZERzuGIgMVQWbQkAm0YikyONZayAyC577gL9jv9zRd6jq1ET3LRYXFlX4LtXDE6UF7ByZOvCX1c4HfiEphqEcAKuVKS/GOfGZ1t05hL+KtHuliEJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135932; c=relaxed/simple;
	bh=Vl91YjoG9bqUjwa4D3IQmMOeHqOlYv+Ub5TMWghr/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H19UcO44xdhCYWeZ5k/kt+IbO1WkPOHge/6Jmev2WzDMs0yE1eVT2sFC8qsoauHjhXZzpwvqZ/O73nY1oIKC1+5bX+UJ0JPl+4Un5dTVU3DOZ3ZzLDZ2fOZrgcj8hN3h4RubXMNA9l0CMi83EvvxxPaHCljydLDheD1vSQT/5TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6vyi+7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D24vj013876
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 May 2025 21:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZWvEe+y9fZ95LVZsDUiRwMr7
	gR6HVKRq8+OepTYfaZw=; b=K6vyi+7mToNIxjqq+Ofgd06E3o9S/X8ARJPRxMz6
	Unhkwgq3QdDdgB7/LoNv13RljEQ2wjstmw4D4y3PKkA7L+u6j2+3OBdSH0eklOdb
	trR54Z6tA+VB0OfEqSFs+thq2Yi/aStvjKUNbNSdbEJbaPV7bChyArEVh30sUFDx
	vr5NUHdJoS+pOtJbUDH9x/GWeF3PzTsOrp6tjU/Yh1ZR2BugoAqMJLO4qzW8WNR/
	spOs4ksP/c4jHEHpbSp+QCDAwjcKIS+x4n2rqgzYGJBU5vL6fM4nWtgbDF8cJUtk
	41i2MzIdzp/q9BCiI+Fv+N7hsX7bay5REUyT6LwjaAr+vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1xjfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 21:45:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9255d5e8cso258656485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 14:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135927; x=1746740727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWvEe+y9fZ95LVZsDUiRwMr7gR6HVKRq8+OepTYfaZw=;
        b=G7hD1yLyzFt4Bs+CAI/9cFsbgC0jTxru/U2gzL2D5r8YyGLeZaxvzcVFW7fdue08c4
         A//pEg7xTqiKpKCkCq+Irpb4WzeduxdKTNonTvnIakawpMtwssE+Lt4nr+XpOVhzBiHT
         Om/S7/jdhAKiKOwCQkA3yZMa9bb/yduoQiqNzWDa45R7Ay2IoM1jLzWU47bW03fjxMoO
         FZXf8El7H14nsHE9hvHw0Orl1stQRLYlTaF2EP8fmQ3AOI3a331J+lnv86ktOhMUBEVo
         xfHif8ZBkQ1Hg07osWLUxPA8DPKizWi73UPuQ8/4Z+BBlGHgBUuh+0wxluuOk7j9p7G+
         3A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4uESPFsAwyQLwwAyfvlQrJM9ob6YR8QXBr/p87iJgb6VmzlMqr5G1KukVTSMsj9iA4FaDMViLv70FZXGu@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqOEg3ZICmNufYuMn9mp45NAQCl5AL3ojnuFiP5WGl/L54/Lu
	USnNVhV415S85Zw0QtNDcIXexC1HhCXTzw1sHceILSNK4716QCUUwVNbjx3fU6a++WOyAn41seM
	CGBPkWxAW50/bpNZAWyFYVFUILH7FOG09/uyts2uKt24YMHya9ajO7sZg+pIjwDmq
X-Gm-Gg: ASbGncutGLziXMSYgD4liPQauTzQs+OBiBi39fA6ngP8B52TPhxi1ZXeVdwbsGIW7nq
	DnuEItYb8sbvYpWzkWFwTwBvuU5J4v/wOV8XgtuHF/78EznSOjyAyzbS1z8t3qKwUpqZtrZgmYw
	nhwnpPkQYKdmadPr1xwshFZaaDMPfrWRM3JSOkHO4ws2rRlYhVm760/5NvBzVVrlsg7/XzlLvI4
	LZoyZLhfhpKz6joFQBAKE3LGos+4y1sHRfUzHTPMLeZloaqxBwcV2rMRxFZiqU1HEHltwJqpzYi
	6XrSJs3d0uBhO9ulz8CTykQ6FEZKG1RhG+BeTZTgE/vGJ1CkQnQ0arhLv+QLYhO8xqEFEBsIH50
	=
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cad5b8e24dmr91836185a.37.1746135927302;
        Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2T3LiQpLagEU33hPpPGBOSneQuetQ2NiGG7X9LR4oyqvviiI/t4vmBzHx93FvWEjq2NtFA==
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cad5b8e24dmr91832185a.37.1746135926940;
        Thu, 01 May 2025 14:45:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202930c92esm1997371fa.54.2025.05.01.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:45:25 -0700 (PDT)
Date: Fri, 2 May 2025 00:45:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/11] dt-bindings: display: msm: sm8350-mdss: Describe
 the CPU-CFG icc path
Message-ID: <spvg6kmgzkmkknttwrzjonn3pshj3vvoqn2ffv7euucnkysbtc@vmiqfocytvar>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6813eb78 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EuULMs42TwgxzVLzQZQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NCBTYWx0ZWRfX2zfSI76Nw0K3 mPvgdEqMhAnzT4CrAWKRZcsblG9mNAIHp2LT1NQGk/Eh7OYrw+UREp8z9pLdxA9BZ4OpJ5hATXM TuNpc83+PoJO055thOAx8yEB12ahSREEpntsuPe6XIs+rZgLJlLwbIf09DyCxJWQjIL17kK8ihF
 kuHfTHZSW9LCv+KKgUGAg/p+TAjgwxo18kAusdxJfAp8RS48Exu226MIBbFAF3kuTXCVKwe7IoR iF9Lm/VauIgQ2GOM2/m95ZCRdfWOPOp9nG/yvQnTPrUIgm+il9N8dAIBnyCLH/vDEdFH5rVSHSi 3iAXcTxOnddT4NXnQgISDU/9NRLDl7pgjyExb/gsyx/Vfcx8or17jfMBIO8bQDMj2AdA0ll3oY+
 kvPX5sP3ilj3ZJ05dTZ3cPFdfLEuS/s8dCzXmHE4FHFLMtAnSZlQ2Mhg73eY1zlAO4CZGtlS
X-Proofpoint-GUID: LYxrJlQ_3sGXbCHkiLl3cJqBp1OWPWMf
X-Proofpoint-ORIG-GUID: LYxrJlQ_3sGXbCHkiLl3cJqBp1OWPWMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=620
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010164

On Thu, Mar 06, 2025 at 07:11:14PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's a separate path that allows register access from CPUSS.
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

