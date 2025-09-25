Return-Path: <linux-arm-msm+bounces-75177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9CBA12AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 461D63BEF74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D6331B829;
	Thu, 25 Sep 2025 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmTLo1jG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3033F31B831
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828343; cv=none; b=iuc+uaziHywQbKfC7dPzHJmlqQsDrmppU60TTa6PnlijDXl10f/Li1d/Yb7habVsO+c/Y9FACmOh4sPqXWwu9/HXm/tAhTOCy8IqI58Z3VHbP+HCTeUobuhTGgN/fCB1CXRRTNo8vXdGz4m22/qIUOcvQ9VOWO70zuyqlB7rXXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828343; c=relaxed/simple;
	bh=XIG3eu2+rNsasnB8FNq+DrxQGKPAF7sUS4vH09SySNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfAHI/bsiS0YVpoS2bRX20fdyAQddPocx/34HTRVDVesFsqEFlhomu0nnNsguma8qSmjHGBFO8OYmwvI1JC/ofjaVv9tEBZOmacBKF4KimyPhLX1SnwQIKoXttnALZfCx/gAeXDNaUOmrSMoCSTC4O3e6twx0gyPfAX0qnmOTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmTLo1jG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPfru023378
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4/iLgC7UNveAdS/BcadCv9NN
	LD1orJ51Na0pAU9YTYg=; b=JmTLo1jGcJaqho+kI5fHIZYSehjWSHtVILxX4tu+
	2UFO7Egj0kaT0sl6oXot0b9IS+jsuwBtHwnqMxD08JyK9yWU396mJDUw/Mg411TU
	zmjeetN3OOedfc1K4No9aGlFTAQyO5HhfHVzliSlLJVfKrLXkQYEyXXMey4Cp/Au
	sDefmsCYbB9W6EFIGC/02P/7iUqR7UczxoJjNsw2BXSw1q6eaxOrX/bT0+3rayZI
	5Rs2zdxCMmPMtLpFKqFYmARaf5X0It2PFnsrXmZ4ZNb1l6M3fFxcYbE7vwIMCkWk
	I3koYMoOESI9UjmcCN72pkfzCnSJGCHFtpDD3dMwScQJDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qr4jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:25:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b633847b94so31629921cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828340; x=1759433140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/iLgC7UNveAdS/BcadCv9NNLD1orJ51Na0pAU9YTYg=;
        b=paiQfbwB7aCj4Lm9Js1VYT/sqnkC9kpTRRTlXoOG9rAqZ+AF+dOfsGqFgsUJ6u0ui3
         WbeDTrUkum5aTa63cB9gAaHNOqHq2M+2Yo9ta914tYdvapqJy6qG1Kl72xfem+K+geW5
         TMa6mN6lsL7cer3mWL20m8w3S2ROf2WW2URv1GV3nS3xwXuIR35e4ULm+5fT7c37Lb91
         cT9iiZ628SOr/wiDWqmgUl8FbErr8sWEwtYqwbqSFjROjiJaB08a8JmyJNA6YFgr/I8z
         uNXI4KtFiuhU94JAWOGHSEzL2VABvtn/iNOiv2pb4MRlxsoLjQDShvpS7pAz9eh7ijmT
         TRIg==
X-Forwarded-Encrypted: i=1; AJvYcCU8IIm9VWaYHJSe7Bf62u52pvJHFDFIVUJcS/8QSAQazMHVG3PJIEDK4uDZFnHgBWZqNSyW2/dX0bEf5KUG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx80msRLTl0mtee1zjY8SEaid1yMFMTx4XZGm+WAS8wS/BA44BG
	5bqUNfYI3Jn+gWl/CpLdECdmqxQp6ZqbTKoSgD0PsZ0XBNsx9qpbYeSHy7pB7sjjddEZ/K980EQ
	HdJcQBFRRgl8vrOxGnv5bJmZgp9HVsQaUgydYfgM5ocFRhNddBNlR5myur7l60557PU0m
X-Gm-Gg: ASbGncvRriK//lPNxDaiCG5qUkRgYiebW4tHefoE9SSnKeJnq2AbJL/+KEUcOkQ/25r
	eVOEUTV8oO/6ZZ5Yvhmo9o3JqM32MhcSIEOVKNicyIjXxrp77sJVsk+KNV/TkQ7v6HZ5LzRsihn
	/CCBZnuzKVxPCn6FggYnPVQBIzX7ff+ULaTn8Da5lFosH51xYwnAKcv9IVO/i6KBD4ysh6ZCcEx
	HTAkbRlIS/t9CwCvNWXKwXWcdSXYIzCQjWMRfAz1N9hAYTi6Y9lAkbb9Lrik0WsPap1G+FFELep
	FiH3Mq8uRQta3oleQ3ZcaNzCdf5jYade3S4fLGEZQ5I3sdPTO5gf/Dxenl8hUGHYlzTikXxkMoT
	5kErM+Zr9MvyAes0dptab3CQVUZLE0JjtLXnoCvYuQVwHtJmIeRQJ
X-Received: by 2002:a05:622a:446:b0:4d8:466a:3dd9 with SMTP id d75a77b69052e-4da4782a225mr57421011cf.6.1758828339792;
        Thu, 25 Sep 2025 12:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETMBfLsb47LeBEoG596JqNJaC6E5+MTXtq2C/BqG/sF4RGipK1HtONFv5qSJkUlX2Srw+9GQ==
X-Received: by 2002:a05:622a:446:b0:4d8:466a:3dd9 with SMTP id d75a77b69052e-4da4782a225mr57420501cf.6.1758828339170;
        Thu, 25 Sep 2025 12:25:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665641asm1020042e87.72.2025.09.25.12.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:25:38 -0700 (PDT)
Date: Thu, 25 Sep 2025 22:25:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cMXFPMtC-g2GU0TUoNnaFNVGYKdeVPjP
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d59735 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=wXtiP2_cyDRN-whGmjUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3rMKTP4J7ldP
 a5iNsxSx4RMBzCe1S2SGcCbOC42a483ZiHyQmhRvan0PM+WsEp/GaECijal009uaYW2bdxzxPeW
 RKchq1sdQjwJAlslS2XDvA9LQ3BwxY8jPrYmf5kThaqj/EUOQxADccQt0LaEanmNUKt3rL0Hrmo
 lPD4YNiAHLTcQT+To3G8JQlsoiQwvMfQ2bDnXhHp+tw7vuMz/uXFQYVwuWbvXZQO9KD4JCmUnRW
 zbc9eGb90udpwqxsd+f3SQKNrMxOPMNPK/9NMYTuDRioo+L2y953GQL72EHdMFkr1v9eVvG4eIU
 A4AFqLwsscv4SNf2Pq3upnszd4vEIYHSsJcTyx0KBelCGw/MPT0Yntho+jdAhQK/xPMjRq1mZUY
 ggJUECNww8LRZazMmJRGDe2OqK0RWg==
X-Proofpoint-GUID: cMXFPMtC-g2GU0TUoNnaFNVGYKdeVPjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> There are variants of this hardware, where only a single VPP pipe would
> be functional (VPP0), and APV may not be present. In such case, the
> hardware can be enabled without those 2 related power doamins, and
> corresponding clocks. This explains the min entries for power domains
> and clocks.
> Iommus include all the different stream-ids which can be possibly
> generated by vpu4 video hardware in both secure and non secure
> execution mode.
> 
> This patch depends on following patches
> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>  1 file changed, 236 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> @@ -0,0 +1,236 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm kaanapali iris video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> +
> +description:
> +  The iris video processing unit is a video encode and decode accelerator
> +  present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 5
> +    maxItems: 7

You are sending bindings for a single device on a single platform. How
comes that it has min != max?

> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: vpp0
> +      - const: vpp1
> +      - const: apv
> +      - const: mxc
> +      - const: mmcx
> +
> +  clocks:
> +    minItems: 8
> +    maxItems: 10

And here.

> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: iface1
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: vcodec_bse
> +      - const: vcodec_vpp0
> +      - const: vcodec_vpp1
> +      - const: vcodec_apv
> +

-- 
With best wishes
Dmitry

