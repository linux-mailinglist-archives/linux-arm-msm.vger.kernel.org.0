Return-Path: <linux-arm-msm+bounces-52656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F285A733E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61587175580
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF7B29D05;
	Thu, 27 Mar 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NH26j7Th"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684B21767D
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084408; cv=none; b=tBo9cfif7Q8ncFDyV8ArStNfrCMl6prT1SmxMsI9DA5Ew7Ytx2gh+7zJ8Qs37AblyHhCa6vtQlT0Nhu33JP8hv1W5G9f0o5XjiI5Wu6vV6RYN7RnDeDQ+QYtWTDku2LYBWMAWupsHmVcVseR9Bp5m2DwABYjxi9P+gcsyprvH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084408; c=relaxed/simple;
	bh=SEZO9qBx5pmsR70QUhs9LOaTH6O8WpbkUZdAtq7YYMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tl1sAQ2P1QRi4BY8iqn4Fmt3QTZp4L70AixpyhPdpu8AXXySJeX2mN0kcCNTpoceZMYR+E7WZLDUOmZHRhc+GhXlTXr3Ozz8Iqxw2us9ekn2lC8xDgXL51KHm1ms+56Ddrvu8rJQchK4Vi0ll6SerDkipRFw4QPzxprDdLYw6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH26j7Th; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jE99011612
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ljIDS8nBjc2VG8d0ZzZqDDV7
	zEKCh4Md768L4ui2t70=; b=NH26j7ThGzFqPxp06QogCGK3u3Fdi6kN8lm4QxEO
	DkBqU3thpimrfMEUr8z5CNs54LqtQgRUBoh6f9zpqpYjNNtNd0d15SQaNnFQcQP7
	zf6i2NrndfqU33/+J8YLC9TNMnMkzuJCuDoVKa3Klek+4LXPS2Yp0zkneXQ8l/c9
	gmQD84HDeTLQs+Mb8yTWsuK6P39mvKxM33fT/5xIoti88xL4qmcn30P9HhJEQu+Q
	xfx1NOg3aLgN3AP21nz/RZZO0KAjOo/EN2xdN2aoPsLSTkSScnh0uePIN1lFQe9m
	oLGKhcqCAccDp/VSqoEjnsXewm8bUCYUUUw5qBCHJ8NfxA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj555w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:06:45 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f9cbcfbb7aso1513452b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084404; x=1743689204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljIDS8nBjc2VG8d0ZzZqDDV7zEKCh4Md768L4ui2t70=;
        b=HCDzXu+C1+bDLs/tuTYDGxbK9sHuT4etp2q6MrXYavYm/VCfpL1cxiMP+hypSgQ5MJ
         G3mQTYMyY0sCgtQclgOA6AawKExrBlBtSk4ARggrFyFC73obt53TJgd2CK3K2xNcoMsR
         W9ggX0TRHidgsA+yT2Yjohtzg3ZtJiXCETgr/ZkLQ6E6Ak2gLsCtecrKL+oJhq1p5Xgv
         mhfuMPN5q9vRza5YxdNrb+SUHdELsHspOlOCbXK6YAUtLcRtibwK/qz8ebm+aSm4kW+d
         EiaJ2SYtpjDty8NjMfRAc7FuW2fB1e1qjyvb9k1rcPSBROFzmbMig5xjPoKc9cJwJTx0
         Ztgg==
X-Forwarded-Encrypted: i=1; AJvYcCU60SvzIvKZBlL+lqNj67AnAgUhoOxxxRI8MUgZV1/7n0xWfBzsg7GjZatwh+KQO7BGvLmVevhnmANVRruO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Z+jnNEWAjTmkQEFkhj2IYGnKRR8COqLjwbshjsI7qrWjHlQ+
	djoXyR1JLsaiKjsQuGImo+B8bq7nkmb9qcZ48voqACUGAmKc+qOv3QhMVA4CP/MSvx2rLUij7il
	Oglusj0GTFuMTyrkJCK5I2j2L+yu+lc9ykVpLISzoWYHbSeNn02kwuiPo0P5wxa1UpwvrD4ns
X-Gm-Gg: ASbGncsDoQZWGoQSEtSQrorow1Q9xqdB2wikbz1MhinW1bicqFhiApTNi3ozeScey5A
	FecpHNYJAdBUc4Y9KS6B46J4YIPr7mS1J1ydJiPEId6g3PmEN9UrDZmgW9c8iFN4I5OiMUAH+RS
	8/N5V3jBwLRDZvKmnnPJ6cLi/REVlSmASFRE4hwLJ6nRdSvZsrqLaVmpv0bXM68T18h+WLOeW/Y
	tTTS73JgH5ERAr61bGT3BP2++eu+196ejRTPnkScqRMt9UqkE7Mry1h/uZ9OdD72d6/EnHKmLqk
	Pgq1Q1F1EudFALtw4NKNd52OGYf7++H8cS7ZS+QBmb7SR7QejQ7S7Et6pNEOjuj0OaDtdX286ZR
	V+aY=
X-Received: by 2002:a05:6808:1894:b0:3f9:6df8:1d37 with SMTP id 5614622812f47-3ff0331ae29mr332838b6e.10.1743084404117;
        Thu, 27 Mar 2025 07:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzv3shkUjdIzmBbQcYnd9sMhyUVqFh0YY+uJOnkJ41kguWyH8HnLjBcqHJ31+I4eWoL8bF3g==
X-Received: by 2002:a05:6820:418d:b0:5fe:9b5a:531 with SMTP id 006d021491bc7-60282f734a0mr160480eaf.0.1743084046857;
        Thu, 27 Mar 2025 07:00:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbc99sm2078251e87.125.2025.03.27.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:00:44 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:00:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Fix up UFS clocks
Message-ID: <753oerdfl5m4rvtpqqvjkd5nhk7gv246nmywtnh73nehh5nhal@s4je6izjuawd>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-12-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-12-b763d958545f@oss.qualcomm.com>
X-Proofpoint-GUID: C6AA8wKOxE9t0jg6a9GGiYEGTRaeAVjP
X-Proofpoint-ORIG-GUID: C6AA8wKOxE9t0jg6a9GGiYEGTRaeAVjP
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e55b75 cx=c_pps a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=y2As-JX5KrBiNkWRAOIA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=785
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 02:47:14AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clocks are out of order with the bindings' expectations.
> 
> Reorder them to resolve the errors.
> 
> Fixes: a6a9d10e7969 ("arm64: dts: qcom: qcs615: add UFS node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

