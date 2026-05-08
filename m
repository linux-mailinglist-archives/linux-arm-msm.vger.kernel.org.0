Return-Path: <linux-arm-msm+bounces-106733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO7qDDc4/mkroAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:23:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C234FB123
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA65C305116F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36EE41324B;
	Fri,  8 May 2026 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO13Qsu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7kF+8Zl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1113FB7DB
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268173; cv=none; b=Zs90WLLKF8x9Ko+MGdn9xqaUfZxG/YvutoaWiILXVOS8mLhkMBhV1nfEv2251dLnFp4v2jQQ60qoisA+cyYtzCzwBOlJxo3x9DTuNB+uXXN+4kYz1Ta89h9nRKHH7ORUlylOsV3PBRXP6fS43OSF6k+CzAhgUUe6VuA6I5bnE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268173; c=relaxed/simple;
	bh=xnH8Gge/OSDH95hTgvFQxhSRGe0qTmVrtUjsfQUo/ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt5gUV7advr1wdMp000zaO8rIDjb9jqQzwXth/RySLn0CCywWpq2dvivcokDFt3Wle10jBZY6DgapjWqed1AybJc/z1IRgvjaUn3bzB6maMUDyTRQs0kom66STgug5A4lwTWcHGcJn72dzbDTH0s8Ikkv6FwITIm/S9zszOFel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO13Qsu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7kF+8Zl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4wFX1116689
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j59ngRnCm2Ud2Vm1hNDdeD/x
	CP7XzZiNLK5pSqgAqsc=; b=HO13Qsu2RGlBvxtMB8fu5jPnRgMqbHQORWr64j/I
	2yp+wrB986ibtvjF4taggP4vkjOtf/EJJkpvbFjUEKj9g5JVGf4yTaCu+/Bw6tqx
	j5rSxJropxqzA8Bm98uVzgEeY/jLpaRk/7P1KnouniPd5bCIBylZxFT0gndSMvvg
	u0RIJPVf74CPIJ+Zo7rb49hO8A79H7vd7tyxI6ikcMp6ioQwZY8AFA1saVA8V/pd
	65CQ5kJCD/kwqY4QKfw/DE5hwdizW4JQiPh3pBP51yiHB17wV6Dcb9uZtl3fraZx
	pVn7MOpNkEBbxukk/8TXP+k+jITc99COVMiJaCphO3tGdA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pgnf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:22:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6312c7fe308so950106137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268170; x=1778872970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j59ngRnCm2Ud2Vm1hNDdeD/xCP7XzZiNLK5pSqgAqsc=;
        b=P7kF+8ZlhpbAdtXCcVA1rkqjGRxFEaHAQZLZePrP436K9e+1fBzFotUFDgx9X09Waz
         Tw1wEEll6W23MbCpJC22trLej/7qzheG4rH7rnfnTf+dEMwZZIFAPAm2dTWn44p8mY2J
         c1o7Xvx/gLdlHWlUBzwaz9DDDW01kZ75qfIGCIn4O4mrAzJ3hWCxflDNoWyNsKnVoVvH
         yZRtktITetaTiiV7K01SXXDhOr4heR2UL/RvXlyNm7zZMznHTKEaD1kz7jefMjgG/Gua
         Vq0y9+5mz96WwSGmP4j1ZRHaW7TqEGyza62ynlyxwQFEljj4gZSa5SHivT66DFh3WOB6
         GMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268170; x=1778872970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j59ngRnCm2Ud2Vm1hNDdeD/xCP7XzZiNLK5pSqgAqsc=;
        b=dtrUemcQtGavM6thfufqg4fByHJLkytxmtyBY9BfMD7NTesNNlmHGXNT+Bw3qG5OIe
         Msvy/22vD4135xzCBqoQirdO8UG0RtB0wXpRd+62GZzzjI2d+HMViqjKnXIuheJFCqMV
         RnmKlzuDPO7aKrQW8lkVpw6i9jQkx3HHqmsN8M/k4Owjt3xYR/vWB695Se3H8E3BLlUv
         s5oM4Zg6x3XJHJoMZ2Bp5Yno2LMuQdz+bpluynC1C5PpPXUkmCEKqp4T+CwPYejYRUJ8
         OsuqbyF1mdnK6/8nXMGad9OUweMSO4LmD4In6vIgt7nCUqv4EqVvoUpkZ65xpTww96Lj
         pcLg==
X-Forwarded-Encrypted: i=1; AFNElJ/0do7LGyHcOrX1T52mrZaGpTJL17pxpgtt4cQHuVSc3OQnys7SccRA8+jfNbJRqyXV9Veesm0kccpLv8fW@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPD5724K/fwFGqPNrBhHt57/MwSASrvi0CixgD3gUtwBfCFDb
	RQMh0WhMELnG8/cz8Jcy+uHZZJ+AhlVkDrjcGl3KcJp0W/iBU0MiiXq/c9D34ccSpanxCMbYbH7
	n6grvuTxYieXIpo6Id187pOLKQuPNRe++7dtQelWZnuZOEled2vJNyiVxhRfgZ9uqb6Sy
X-Gm-Gg: Acq92OEYcoS3eOS7RHDg6FPdJvw0PhOdh7kWQsbLhVy36yR7lJhE149RG7jWJtBIARc
	ADpqoslroKZW5P+SfiAsOu22ZQr0JhLHrzAp13DwQOMJKJGsuiJvOHvTDmGoauFE8jbjdjKrujL
	wxrt6kO545YQFUMJ0L/Mei4FtuOSOCehmvDD2LBoXlhwP8ZdSNXjFiMozCbEGKjSOviEZ1ihoB/
	e8FauMA55xopaDFjhjvehnllSS3zIA/XmC9SrAQye4yMSxqf8y0R3UUYWIqUj0bxQJgwNuyL7kG
	CJuUR0VjDrS17P4acgwTMGpzhJ9warO7GB+arS2ePTUYEr5aQXDQCwudeRteVUoIV9ATq+kzqLj
	UPxysCWtnFVZvNztv7f4EXnTcYY3rlJ74t+QeBvN+Rwg80Dt1dN0nto6zAYMda68pfprYFf5fC9
	3srEKe+CEvNv55C4b/PaGDTsBXMD9VquKEBsw=
X-Received: by 2002:a05:6102:80a2:b0:62f:357a:329d with SMTP id ada2fe7eead31-630f8e6b496mr8393861137.5.1778268169875;
        Fri, 08 May 2026 12:22:49 -0700 (PDT)
X-Received: by 2002:a05:6102:80a2:b0:62f:357a:329d with SMTP id ada2fe7eead31-630f8e6b496mr8393834137.5.1778268169345;
        Fri, 08 May 2026 12:22:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9565401sm738807e87.57.2026.05.08.12.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:22:46 -0700 (PDT)
Date: Fri, 8 May 2026 22:22:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-GUID: IjvtScyovLYMxUToQhnFdd5l9IdGTHFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfX9fiTQthxYaux
 50WH53j0b/hBhx9+lFV7s8A0sqJze8CMDO6Q/YyeH8FbkrfXsyaUheTeG7m89MK7wNdszHPahZY
 DzqktNFZ8Ostl+sZh2w5nCdxstssPDVFmfENXZVsaMjr7ZBMiMAzE3rKr18A1WkV5ZIWqYDWsXQ
 3+X9iXjosW7RrHCQAeH22+LdlcFdwC4rJTgJHprLHFpZ2yTgLZfVkI4/1LQoH6U4BYB31zQLZzy
 nko8pks6xUtZpLYSn+K/vOPHjNALyB86Wlumtt+JO3cI6QO3grTSUdkzrNpIbJzUe8kWWHHVIKX
 Hej6iNH51HqkwweJkgP7Lfj8IGI36XhfO3zBdJLgl9zJYEXokOdeZ+JlNRKXZ4tFQjT4eroiUYG
 A4myR/Ob9kL2VPWZTt+vwRNOZEAX76aKPuQuN2pkKyWWBNHGUxlOdj18akvK+kAj32hUQ2q+vKc
 yspZKPY7MIVzavA0gLQ==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe380a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2eyD6Qf5n_vS7hZkQ0MA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: IjvtScyovLYMxUToQhnFdd5l9IdGTHFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193
X-Rspamd-Queue-Id: C4C234FB123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106733-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
> The common schema defines minItems and maxItems for clocks, power-domains,
> and iommus. This suggests that the number of these resources can vary,
> while in reality they are fixed constraints per platform.

It really doesn't. It provides common definitions, while individual
platform schemas tighten those.

> 
> Remove these constraints from the common schema. Each platform specific
> schema already defines its own exact fixed constraints for these
> properties. Additionally, remove these from the required list and update
> all schemas that reference this common schema.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml         |  3 +++
>  .../bindings/media/qcom,msm8996-venus.yaml         |  3 +++
>  .../bindings/media/qcom,qcm2290-venus.yaml         |  3 +++
>  .../bindings/media/qcom,sc7180-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sc7280-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sdm660-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sdm845-venus-v2.yaml       |  3 +++
>  .../bindings/media/qcom,sdm845-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sm8250-venus.yaml          |  3 +++
>  .../bindings/media/qcom,sm8750-iris.yaml           |  3 +++
>  .../bindings/media/qcom,venus-common.yaml          | 23 ----------------------
>  11 files changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> index da140c2e3d3f..b1046a112e17 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -62,8 +62,11 @@ properties:
>      additionalProperties: false
>  
>  required:
> +  - clocks
> +  - clock-names
>    - compatible
>    - iommus
> +  - power-domains
>  
>  unevaluatedProperties: false
>  

[...]

> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 3153d91f9d18..060be67574c7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -18,35 +18,15 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    minItems: 3
> -    maxItems: 7
> -
> -  clock-names:
> -    minItems: 3
> -    maxItems: 7
> -
>    firmware-name:
>      maxItems: 1
>  
>    interrupts:
>      maxItems: 1
>  
> -  iommus:
> -    minItems: 1
> -    maxItems: 20
> -
>    memory-region:
>      maxItems: 1
>  
> -  power-domains:
> -    minItems: 1
> -    maxItems: 4
> -
> -  power-domain-names:
> -    minItems: 1
> -    maxItems: 4
> -
>    video-firmware:
>      type: object
>      additionalProperties: false
> @@ -64,10 +44,7 @@ properties:
>  
>  required:
>    - reg
> -  - clocks
> -  - clock-names
>    - interrupts
>    - memory-region
> -  - power-domains

Do we expect the platforms with Venus / Iris not having either clocks or
power domains.

>  
>  additionalProperties: true
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

