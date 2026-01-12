Return-Path: <linux-arm-msm+bounces-88635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE9D158AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 23:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89CD13029C25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 22:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D51280A21;
	Mon, 12 Jan 2026 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbI83lS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JW3EjrY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1B12749CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256133; cv=none; b=limbSssVl6j91Ghzyy2+9dPuO81eMlXPmqGyT/VtG9y4DcPIumJTJF5uzzkNJMtyBYo4tqx6dvvF4biIPVjVoT3OQOi7VOduYsEFTZyE8hPU7p1DmUgu8OkoxQDhsrDz6L3xa07MQ+sWCTsC+kDozl9Up5L+6ZONcM0bzcQph2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256133; c=relaxed/simple;
	bh=dFUBb4Bm5zvwO2hzE5lf6QQqrPXNl6qymeK7PEmVev0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSKKrE0iERBJFMZbG8Akoa/RvzLvVcH4y6il5TgoRhcMZ2eIIo2QPZz7CTYh0Tei+NbRq6wfIz0JDjGzI97brLdjiG9ZdjDd6LQuuyruSWe3eSOETP4IpXtRH3a6jAYsvfqPm4cvFTPQ0lOxlnNLPL45+4dgPbAiV5B91qIc6Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbI83lS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JW3EjrY7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CIaCSa1358202
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTEjLDFec8WnTGsEtWIyapIr+kF46TTSBI6jZIc0xF8=; b=BbI83lS+j7PnOhxK
	TGCemVyIMurSPrqG56EHTKd0t0qrhGGRKP/rduNnyWEiBDIOYXlbXXDiPjhBK79W
	C4ZNp204i8DiKYfaEsAla66SvOwASHu+FWt1nyHypntDvbGq6TCTy1U2x9UVfVGB
	Ntp0ztjOAPpshT+Rqt5EieQg3JoYrNG6qbzfPpDrzD8d02cX4VHJXJ736t/lxIVG
	fYVMuk+kTLQiEw2AaG0ZsX2M9NxLSXy1sfkBfKKVY4BBshRAE+5ndbPFBMZ1U3pk
	QUslmY28XFFXkHM7Ef1W3E7kZHCejQsZ0bI7DEtmYVkCePgFDL5jnicWNpoeNPtz
	APc0lw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cngkmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:15:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so1817681885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 14:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768256130; x=1768860930; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zTEjLDFec8WnTGsEtWIyapIr+kF46TTSBI6jZIc0xF8=;
        b=JW3EjrY7SmgsCpwfNMnhMftj9s0nrSoEHqO1xn0Py+AMpOnFgubwoI9RBnWHqsWghE
         1YHNLGdG/xs9RODTuSSffVkCctLujJbfdChqrh1gNt8xf4nAGhQokJxyDy1E8Zb/Up4K
         aWov5lSBy5+7EW6bBZhRRpesplKmlM8Mt3b9xOUjpeQ1DZ7PAY9v6UgwEGNM6hzS1wdb
         jvRhILEPWFbp11TjwJpIIV+MFifSW7cOOo4VqZXt3SyxdI51cUPN7KZqioBXqCfNGW0H
         O8xHNIbfTc9FgXRY83hqCVY+D3EzkzAeddLB+j7cfIrwAbX6GgtXbjk/3/wgWp5UV5dC
         /Ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768256130; x=1768860930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTEjLDFec8WnTGsEtWIyapIr+kF46TTSBI6jZIc0xF8=;
        b=FF5JiS0z3Ohj7aZw5/rwPC6rzjpero9Dhncamryei9ZFFxO3yT2lW33Nx0LwLu4X7D
         N1HYNZf6NY6GfHBC3w1WbX6p5YN0+YA+YkB03GQ3vhXnOMtWM83DtM1T5hYMIoUwKc54
         l+y0evxBBE6zMm3Oh0nEg2lcNRbZ+iWJ2Ue0ntxdD1iZQ62/lxaDZwxF0tRcKYK3NG+r
         XQhBt5EbPsDwKcY0igE9RTosHm8ZDGpcaquU16IB30pKIX8Kj01QDalfxcXu17sCCYQV
         tKxRxd+wmbbtaqb8U1E72v1gy4vTEJFYws87gdRiaPBstFSAxTPlU1J0tG1xKiH1XISO
         tPEg==
X-Forwarded-Encrypted: i=1; AJvYcCX66ZKjO+s/1ZJJ0hlOZ8RYHs/e64vHs8t82eBnIsIeauEQM+KUFRwiif3Wi8DdvpbZjfbFKF2jCGAvXQgh@vger.kernel.org
X-Gm-Message-State: AOJu0YzpcPE6qDRjMkpexUueE0bAsJgxHtzdNBADjJOsJD6EApKUNrZ/
	fECeb7d4kyi0TEfGE3PhHP3VIVz9KBGdEJDOEaNad0M2zeDlhHv2G/7SpKgF7FiJn+L7oP1z4OZ
	BxLBp8yKO5cnlpYXQg5lIczsFSf0K4IQF10AwvL6RYgb0cabzNoyIgH5RaSOROgbSrndC
X-Gm-Gg: AY/fxX4pHIZm17hayruFjA6s1TjdzP4to1h611v9Gic/jEEtnxXN3M5ZFIr6Iz9Oh2y
	sh8J5M5T7W4iUmZTh1p16nnB9SQDYMcVC0UEbF39urKzjHbnmOGzxXx0NgZ1CPvrIIbzA7CKV6Y
	YIgIhnzONhrUM8ppfpcADddqefYRhTZbexNqRg6i0x1fmepc024CLdZIMZamScz5w/h48e006dt
	332R0iLaqTRwACmb3wP6RFHSO7pveokE+LWBkaWOMOQTf3L0HNd+Vbu7mgHPaXXFeWXlNZVh1Y9
	7QRKmvRFkXP00PDo12TR/tC1J7wndVDln/Zte0DUrAur5zqIKnnQ5ztcwCTnVGSNR62TJkA8vHf
	LmIudMs/bVYlT8iqgYODLC09TtM3xonK+KErZWbowiZvoDztxC98OKCcuvo23Z0c3uiQ/kK9qpP
	BYaxeBXb2lrphNfnZWPxRLC+4=
X-Received: by 2002:a05:620a:4385:b0:8c5:2032:3766 with SMTP id af79cd13be357-8c520323a46mr167440885a.35.1768256129766;
        Mon, 12 Jan 2026 14:15:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEltePUoFwRmiTYPIwJ28sy0z2ZcfjKl/8aARMEpYA7EJ2zFc21wvz/9YexYqf/X4XyaZQLAQ==
X-Received: by 2002:a05:620a:4385:b0:8c5:2032:3766 with SMTP id af79cd13be357-8c520323a46mr167435985a.35.1768256129201;
        Mon, 12 Jan 2026 14:15:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3830c2a2dc8sm27328361fa.27.2026.01.12.14.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:15:27 -0800 (PST)
Date: Tue, 13 Jan 2026 00:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
Message-ID: <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
X-Proofpoint-GUID: 4vSe6X9H4SJzG7SBNLOVBAsFZFuQoOln
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69657282 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8 a=a0QMBuUGJFd1xiM1Y0MA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-ORIG-GUID: 4vSe6X9H4SJzG7SBNLOVBAsFZFuQoOln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE4NCBTYWx0ZWRfX7wBGoaHdjYlG
 NA8wDydTJIQXy1GJz6WjisvxnqKJmYdj8xFtklIeWHN9qgEber2OhMyPFP3Qo0ux7VWmLqlkKed
 IJ2zqvhisU6P6uVXQkQ4T2X7/z7Hwku8oyCKcakMA1ggZg1Ir1ce/2UoXwU0YsLlOqu0f3WgsXA
 57h1HbVgio91JkRrYECHh1vmm+2Ajn55hGBbac8/x9tZ00K7F39sLElS49ykUakIGruCsQ+x4cy
 zIvBszavpZPfxECFcSFWfC4sQm73jTNk2U88xwZONUItLQnnPe/BNhAGQpOJ76wiu8b0nVa3XFO
 cVRu9WIPt0PhoX0YZdccdGiz25TfHIE3XL9A8F/xSAZkVBkcnxTXVb+gZ8t179EvNSHkkYsdu1X
 AA22fhPms4066dcHWM91MsvY/JyzxK6FXTuWUS7e6dGqF3fjsAlxXHmfopa2lgRZE7kEQHmqf6Y
 +DorCBGqmOGr4INAZmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120184

On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
> the only difference is willow have NFC.
> Make a common base from ginkgo devicetree for both device.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296 +-------------------
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
>  4 files changed, 318 insertions(+), 294 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index 163ecdc7fd6c..70be19357d11 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -1,304 +1,12 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
> + * Copyright (c) 2026, Barnabas Czeman

Hmm?

> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> new file mode 100644
> index 000000000000..9e3aeb5a9e74
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Barnabas Czeman
> + */
> +/dts-v1/;
> +
> +#include "sm6125-xiaomi-ginkgo-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi Redmi Note 8T";
> +	compatible = "xiaomi,willow", "qcom,sm6125";
> +
> +};

Please consider adding the comment regarding NFC.

> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

