Return-Path: <linux-arm-msm+bounces-70600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07FB33B88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EE267A56A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 09:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF652D0C8F;
	Mon, 25 Aug 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQTan+/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5832C0F7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115300; cv=none; b=SS+kMRX6vSh+CL+PQNYzuagRCAROP3NV4wC7+StyrI6gBTqOdpkDcVUUtnFrGYPX3Kr3ETPUgb/X6wTjrXcdydTDlQIDK1TpC/AbSnEKm7TXLVmP1Z3TsQj4CA9VLX94izd0PXjl9NSSvoWvsyXFGSy8wM1btMfOWt+ABwcyhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115300; c=relaxed/simple;
	bh=RGPjNT7eYla33Kxu+DaatsNooHQFM4EPX41laHhicrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Rr0h7S6DLbvpAauphtMrMf8lu4LlyjuiwP9nsjFxVEMcJos176f2G8Hrq9EqiitY/mDJT/rajsmhmQ74Xxk0gcnt6JLIxJ39UGJ3sB5JEAyCXrSDvlga2sv93SNzsjh68QjFlBsORZJFCYpLzWE01u2HunRAFp0OLg4S+5MzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQTan+/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8rm8Y023616
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TsxGny5bZmfquQo3c1L1zs/H
	NsPbZHYPUMZ3nblGGiM=; b=mQTan+/fHsOrHGVNQefyE5T5MCZ9H17uK+l5Qq98
	kau9N2gHiyDWr85nuN7oNhlxCAB19HeYYI1LhPOcxfuhdJ9aJmFrRxMUfv9ST7jm
	bltkZ+i7BjHg/hgYmgiD6lJ7Gq3XSeEcHFq0H0vW/JS8Isl8vJtSnp/x3MN8GcFc
	ZggqMXpLOwbD1XMs7GIYpl+EAXApXT5pYydv8273vu0dS5CqzKfIR0/ZNL4Qkuaf
	AW6lyb3oE5duJWWEoTe2QTJ2OZwowiThAbKKPWaTYqOEUxpw7L6ilrd59oV+HhZZ
	LHPy/jGqBqGEUjHMepibYQN9VxfIklQDyTISRnHCbB/LRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cjnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:48:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2d09814efso12259461cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115296; x=1756720096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsxGny5bZmfquQo3c1L1zs/HNsPbZHYPUMZ3nblGGiM=;
        b=cnvR+XYOm+iZju7icQA5Bpztxfk+KpkR+dRvMheogWxi4pHlyRrnCx+PQzRLo98aZN
         W7MZTw6lUVnEVcJaixr3HAzWn6iXfAL3Ddc4v3huScOomI4x/eMwJVIsRwl2VvD82tZn
         fAqmw63ghChUQmAeUNDj+wAA21aumUUcuFH1+QxruryWb7KXWPLZVVQLsRGxCyf1LZ10
         00lIDZ0cZsPZ7buwAQ7ug/7l3koxgB91EjvnCd51LCYgZD9q7Yo05SZyBqsID6Bh5JgH
         9fW2mLaQfvCUhsF7Sa2vnpXsZ0HGXjROesFBbsT8s5snT07n+ZF51AsCMOrls9Q2nMsO
         0yKw==
X-Forwarded-Encrypted: i=1; AJvYcCVMOFRTrXwwyFbtQKTo9/u2n1VOJ2nGPvbhEmA+eDTonEWXsRugBUQXJkcpMlabjFuwF/lC45tDVAqN2NYy@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIVIqOYEdfc7Mo+s+qwLrtj5iUNdwn7DKpbWO8GIZSlnymrGP
	Ei2fRdpHux7UffRRk3yVzA69AF7HuAPAF6532ZbTj/C7XV0jF0VUUFnAHBFqPgbp2q7Ahmpkzuq
	xJmrmljMKmupFNLWRJhguoUT0Q3uZJwUPVgIWaPC3ioUndGbLM/j3sc1aPyFZ+2n/UPeT
X-Gm-Gg: ASbGncs1gD1D7EHhc6vlqn0QHH29HdfL90Q1OhQfB3jBCrhbfXzMnmTGygfsGQgZ4mD
	BPToKqu+2uM11Q6Ea1JNRKXfISEjUTqnox9IPv/GHLZgxdvjgMqTXnAesKQZKVlnZAiPoY3n0Dw
	7dnaI8a4W4MEHXEfn7o3sdShuNTJMTzqDQLVCQnybGrr6+on5N/GF4SoF/xwvj0ajYdbRDA1/jZ
	QzjuTjnhh/u3pQSUlPujbmyY5hiBuMYHmkcaS+ZAcPj3YlZmYfERIA/7xiWT8ZC/2dOw5ZbXF8f
	Y2kuwIjh3RZkvkJe8Ojzip/2TuLjByISqdeldrSaF2pLcF/A9PEsizMO/RvBCs0bUAfvunHGssS
	YLajHeYDJOoE64H4nnQ4YZEccDxD4qHvXVOHLfW6DNlde6XjeVgLX
X-Received: by 2002:a05:622a:199d:b0:4b0:7ad6:ea9c with SMTP id d75a77b69052e-4b2aaa6e769mr105923851cf.31.1756115295738;
        Mon, 25 Aug 2025 02:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA24ublCRv50GDQgudcMmYvfl+amokeNBspHjLCVwUTk/6j0Vcg5F5U8Vdo/x+kxEbdB1w/Q==
X-Received: by 2002:a05:622a:199d:b0:4b0:7ad6:ea9c with SMTP id d75a77b69052e-4b2aaa6e769mr105923731cf.31.1756115295226;
        Mon, 25 Aug 2025 02:48:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f49af0439sm95112e87.109.2025.08.25.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:14 -0700 (PDT)
Date: Mon, 25 Aug 2025 12:48:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@yandex.ru>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Message-ID: <lkoealhzrqb6obk7qqchu3pomwo6bklczqtycnrylo3p7rhgug@h7wd4cofmwxi>
References: <20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru>
 <20250824-sdm660-lpass-lpi-v1-3-003d5cc28234@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824-sdm660-lpass-lpi-v1-3-003d5cc28234@yandex.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8imNjQeYVO9v
 /fCReWyLd10v5GYt4STJrBP6RINFLFRq9y2ZjMh1ZM4Qp+915z375BsHBowx4uRh6ZeWk+Jjt6g
 E3tzOHKIGxOy5Rn/3X679BPmJgGo3DxFE0BWRXibhzJxNtp8Wv3/utZvK/L316nkHMLPqveyvFI
 2D5iKsPPynXHmUH/lrMH+XOmdAHkt1Lr+CES6SU0EC/0gFloE161uNWrypiwzIQTNkik6YxG9Yq
 wkaTopsAiccQHJYR6ye/2qLbOSKdpGVkH9OO3EmMkqB829qQW2EYF+gXzjPegzPdNSUVSCiSJf7
 slASheB0VAC6o3L0/tYP+alA1rOGVd+0ai2JG7zCLU6r/xTPqb3bWzs8M0VpegQ3s+TK9ioo4FQ
 yY84fMza
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac3160 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=pGLkceISAAAA:8 a=vaJtXVxTAAAA:8
 a=JhL1wmR7AAN73KXSh2AA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: fNmXqL6CQTM0a6u6fUIrUsjLd5OUqr3R
X-Proofpoint-ORIG-GUID: fNmXqL6CQTM0a6u6fUIrUsjLd5OUqr3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Sun, Aug 24, 2025 at 11:42:25PM +0300, Nickolay Goppen wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> Also, this driver uses it's own quirky pin_offset function like downstream
> driver does [1].
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
> 
> Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/pinctrl/qcom/Kconfig                    |  10 ++
>  drivers/pinctrl/qcom/Makefile                   |   1 +
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 196 ++++++++++++++++++++++++
>  3 files changed, 207 insertions(+)
> 
> +
> +	0x0000A000,
> +	0x0000A010,
> +	0x0000B000,
> +	0x0000B010,

Please lowercase the hex. LGTM otherwise.

> +};
> +

-- 
With best wishes
Dmitry

