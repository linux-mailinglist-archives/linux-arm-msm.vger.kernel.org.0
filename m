Return-Path: <linux-arm-msm+bounces-73611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1FEB58287
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 18:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156332A1403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 16:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26CD258CED;
	Mon, 15 Sep 2025 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxQU6Bdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625AE1B0F23
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954924; cv=none; b=aTfX6lqhyzRF/idMJr6owJZzzcoRAMcfO+3WdmWi/kHLPlWQ84tFKl2EOTv8qwDfuhrhHCccafj+KBYfbDV8vntGZFfPRZD61UBEvzq2PdZ7uLN6G9wPpTTZBFQ8CQ2lRSH6nCSMqzc87RxNoQkWqFGJ/29/viUZkQpYLZN+mjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954924; c=relaxed/simple;
	bh=nwJS9qEspbxpq4mneOqDczMeT37Zd1vT1vWWj4f0Yq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk5EiTJJD2VBZZODJyY4qHnxken5RaKb5bHblglUuhL5QnorcZPnekQqy9MUOpCo2UQmvWYWSh/lhNJKomCopSR1hcYuqG1SW+1OHlEc0X+tjEMjggWqL2wMTY2/K03+lIDhDZmpMM4PHExtOvcvCFZoOR0HGkZdGFEkIiolJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxQU6Bdv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDck3n008257
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qtUff7GpnhMs59SKsoOJoYOq
	908txK1JBO9Lr8PYHXo=; b=oxQU6BdvwUMGx1j5+mNby8UAn33dYpCPFoKN635b
	BfxL7R8qHqaNv7mK+BjjmARUYpyrGtcNsK3jQ7qzOGRPM7Q+80LrGmnOIG6XPNsd
	z/vm8NYIVFHvOYDmQPaHfouDavEanDQXk7Jke2s1GE8Dw7jbNB0dj7CAxq5QLeWy
	iKCme+w5tJUV28LS13ifHne7uGnLzqSVHyLsMGPacquwAINQ+FkAw7eT9q+I9xE+
	9RxEHLAf7oxoai9dhRqM4kgw24ORMkhg9vohkGRmzSGaV719LCz0nOaJNBzU7HqR
	8vDZE/qEb6q2IJW/pXhvqYzmUDvYwBdzjvzyJn/NWWs/eQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpvnf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:48:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-76d3633c86dso72575116d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954921; x=1758559721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtUff7GpnhMs59SKsoOJoYOq908txK1JBO9Lr8PYHXo=;
        b=LuzOBuvFVMdestAY7gnzdgm6qfGm9025UJGXn9+hANGeELrwPA+G1bSg/KUlR+9SnB
         XYlJsA6osjUDuYBEFvcUNqSxXs9ZpFmciwmOMEAQFn0BAbz1v2L4lLWFZQCo3Td69xKi
         6eXCR2io7PPlvZnL9dZBuDDwjcknYJsqZwKxM5u9b8N/p9tni1UPZ2mwSwCH0nG7iC/K
         8rVGmt6Qp2lckWwqI+dMqUzo0aPVjyZfGb9BSN49babXl+CULtSYjLg8ZQdZmvLzfqW6
         B5f8YrhyFmovcG1zEnC/IhUB6nJX4IT9UycZkDAdhE2uYshR9a45qHSiQERBD4p/SjsC
         rDnA==
X-Forwarded-Encrypted: i=1; AJvYcCVXRtHcqpIxQXqcz68WLXG+KUB0PcMIzG9mMplow5rkoTNur9OKoSqN26P/jQwxJaO4dmpY9bUhSlRA4qFa@vger.kernel.org
X-Gm-Message-State: AOJu0YyEdV4hFlPvTeFKuPJuAOh59PT33hmkI3nQNH+RZeVyB4A0jNj5
	UQ/fXnf8O/PmtjFaTtqlTl/F82Wmf4I9gxnjuOZrQZmT7TmHlKchE9KBt+zHiWbDS3EFO2OMwCj
	sUNm0A8avM+exK9R7DXIbBvEqZpOKzNHxWKoXzmuiugVhxR6kNNTZA6joDRXHDeZJYndw
X-Gm-Gg: ASbGncvEOV1Kf5qED/5kN7RQkFI8pCEmGVkMghMEiUVKXwOmHBfLkhHm4sgG7vxF1ek
	gERaRYSePlSvmR6ebPPz2tOkaZ5ZGwGZSk7N9jcful2jXmYXRV8Lbk9bu9B6TOliVwltS02PrRf
	6P8RMzblGpNgS8HAOWy5Hxf8fjf2KSxTf+YtaoSP2Ukdg4Vg5Ey61hLEEGPAdrZhwftmKympcvF
	1H3VKH/YJeTzESsWvS+WIhBockzVJvQCtwUz7qTaNfYcGL343iDHgU95TK856is3AvoX2WfsTuN
	tGGQa6oivX5wJa+DSrcjhWZ8Yx33TT3rIp2P/Y4md3JrOWzbUVx8It7RQMKPw0LCtQU6TPRKxFP
	s23t8lQfcnAPBKrsjP5+lTO5C6L3fIyo00AABU6VwvQH1yORvBhT8
X-Received: by 2002:a05:6214:2a4e:b0:77d:3048:3b49 with SMTP id 6a1803df08f44-77d304847a4mr68275316d6.49.1757954920883;
        Mon, 15 Sep 2025 09:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH4oGx3bjTjrUfiUqVTWgspf5spSr1LkxnKsfsL8JVKYAo4+vRpO9aEEz/N7l6s7tfRKv4AQ==
X-Received: by 2002:a05:6214:2a4e:b0:77d:3048:3b49 with SMTP id 6a1803df08f44-77d304847a4mr68274746d6.49.1757954920255;
        Mon, 15 Sep 2025 09:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63c92sm3761483e87.92.2025.09.15.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:48:39 -0700 (PDT)
Date: Mon, 15 Sep 2025 19:48:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Add missing MDSS reset
Message-ID: <7slssvb2ksmmttzuptxgitc6tljswydd3watiwnjbila7aumex@525iupy4eecs>
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
 <20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org>
X-Proofpoint-GUID: mb5_AiBGNEjfo9qNQDXOuOVNWNtPL-DI
X-Proofpoint-ORIG-GUID: mb5_AiBGNEjfo9qNQDXOuOVNWNtPL-DI
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c8436a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=DXmGxE4PG6Zmd65NNY8A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX668D/l7r5U6E
 lGhxe97p+F3AIyqHsywnKeKzw/vr6XvJ/rjzft4+nc+0hyrcumixW8TCV8fpnBtkj2ZRL+dHDLC
 Y+OWUjxCbZwNDZGpnQGwofkWuWMT0S0A6qkeQSrtS3F0IfaUY6EFyooeTXedh6KWAOpWEpwG4tj
 QRo1plWsJyTLgumC5KSvz+W9a0Px9RO7jYcUFHPlXLjKFbi9WTEsCt7DfNnckkenYXXy9PmPchN
 fuUN5Oyu3Ec0g+3A1/QF4Ss1Ty9QH6LUeVeXYiM62LwvgLalGGrDTxkhZWO/U+owzq30uN31zd1
 2WkznK+frw/0LZC4qhU43p5o9nFWzr0ZkAmhriZm2+AmQwPRhLwheOX97KVafhFGexxnRc8G5l5
 CoWKyLEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Mon, Sep 15, 2025 at 03:28:30PM +0200, Stephan Gerhold wrote:
> On most MSM8916 devices (aside from the DragonBoard 410c), the bootloader
> already initializes the display to show the boot splash screen. In this
> situation, MDSS is already configured and left running when starting Linux.
> To avoid side effects from the bootloader configuration, the MDSS reset can
> be specified in the device tree to start again with a clean hardware state.
> 
> The reset for MDSS is currently missing in msm8916.dtsi, which causes
> errors when the MDSS driver tries to re-initialize the registers:
> 
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  dsi_err_worker: status=6
>  ...
> 
> It turns out that we have always indirectly worked around this by building
> the MDSS driver as a module. Before v6.17, the power domain was temporarily
> turned off until the module was loaded, long enough to clear the register
> contents. In v6.17, power domains are not turned off during boot until
> sync_state() happens, so this is no longer working. Even before v6.17 this
> resulted in broken behavior, but notably only when the MDSS driver was
> built-in instead of a module.
> 
> Cc: stable@vger.kernel.org
> Fixes: 305410ffd1b2 ("arm64: dts: msm8916: Add display support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

