Return-Path: <linux-arm-msm+bounces-90879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM6LKGMheWm7vgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 21:34:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0729A60B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 21:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9282A3004CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EF527E06C;
	Tue, 27 Jan 2026 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UudBGvq9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwThI1hw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58E279794
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546079; cv=none; b=Fd7JGKvq6kdaKIwFZp8GiV6wNfTwxa5Tn5wu75zJCtLmyszb2VxyYACBPcekdS4sfaa6Fy6RrvreCSBZpvegsuPgbZ7JnGmCDa8P4SojfinHk84MKrsWNHVP14Ov9b5mQsQRSGDGczeUyu5dgRp3kWnms6TO4QCwPkb2Fiw0SR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546079; c=relaxed/simple;
	bh=6+ryrk2sOHsrrR6dzdlUojweXI/Wmse5brKS8Yn6kj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtHcvZz77d9KxO1qv9Src/GeD8MZN8TBS9n80VmYSvVwnPy9z37Axi33CCxmzA4PQzAV8QS7M7N2hkQZU1MQCiib4I8KSI6mc+FjV6VzDEekgq2R/szoBEb95gAjms24EJfusANuvWEgvdoDVSPzt1VstFKmXMNFUBP0LpIYMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UudBGvq9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwThI1hw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhRMb2476599
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UBW4/O8y41IiXvNQNSJZRU7z
	a95y2QvJwR9+W+NL1uI=; b=UudBGvq9T2geyT8U02x2HD1Gcdh00M+1zBsi61ls
	eKOX9gKovpBvfhS6lNo4fV8evD0MiLGnz7Du0UGR95M991t9EgnOchJGGYUaIQpv
	4oAEdjr0DoPXsNpDyq5aQy4zE9UOKsFwGyl5k2dBX8Xl55eIV+2YMySYhesfXcpi
	EzwKKQOyEPa1afK5O5GalwZPYiSI9TEOg0O3i6d/+RMq3pNTxE7D91zsW0AOW1ks
	UgwmnkS75cdj9ZD7cJDAb7XAnk2g8zpdB1OWpEmBC5tOepwGheRwL4DVfoEs2Cyk
	/WYfvZmEd5+7fHzf591btouapnqMFt4fG1XrreSEDw8azg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y0jc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:34:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94838cc73bdso6205939241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769546076; x=1770150876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBW4/O8y41IiXvNQNSJZRU7za95y2QvJwR9+W+NL1uI=;
        b=ZwThI1hwkLsWSOnN0LV7RUtNH1/vtQZTxf+9+5dGxMtglRyiRkkia43VQxK3z/sApJ
         U5TG3vmoIoPnRy0gkm0wiv0YfMkpk6Dw9bIizbjF4RaG7U97CWYwK9x9G0RGMUl9JViU
         klzyDqsGF5qpXelOpLuy7ndv5V1uimkVQRXPn9W36xd5P+oLEGODi6XmVC/cJO1TCQHN
         Mcg7fI7sfFvczfW+1VWXp909VDSm8TxflmSG10J6y+WwnfDYEgVcDrC+XXyGic9pfhTZ
         UJHkKosa+yACpZHwKu/gxkSMbsGLNueBnWDwEvrjwdFp17LizEBN2p5M4541ZJJKNy1/
         L0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769546076; x=1770150876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBW4/O8y41IiXvNQNSJZRU7za95y2QvJwR9+W+NL1uI=;
        b=VKmJpaoOQ5mzRYib8zTbuwpzwBbh0BGjTDY57AYoXn4xO4tpccldFygQpONTnHy/NH
         Q86fCCSYWGoOf6aXtieFYTKMyNWKprjyCBzrrdsjADBCPUt6e3cHU3DfibhpCQgx4Ftt
         H6+zX9WHud4X88THArvVPxyRQ0mfETXiTZsktrKVj9xsQsUgQhTWgPQR+I8pyFPpUs9P
         OxTslj/mC8hV5WMvfXpha8RwikcYdoUatOWVo6cjBcvF5DCk2BpWnYJr9n4FSh1FqpXQ
         ACVaPVGX4mZWdec6bVVQeRjmxB6coNJTYIuTp2+mINF8aBEkLE/5LVoU6SZZBNidkc83
         cs8g==
X-Forwarded-Encrypted: i=1; AJvYcCWn+ZZlxH40vZjGmhB6dUCV58bW/iCz0YuG9vHhgn+Cq8Duozz7My3vsUHz3svM65azJ5WuG8TEeWpZKHsI@vger.kernel.org
X-Gm-Message-State: AOJu0YyJl2xAO7kZftfZVAmch17pjxe93/EY3S49MzoMROrWi693uoY6
	UOffGp8ASKxY1ILEW/lRqAedhlIVAqRTNh46Y1jyOAcdlx3oYIFVLo5JJwJTMvPPJ1zw8wDlzSX
	uUBJejWbbMwdc8i+eifBlvr3W25K1wXFKxazYYhuK1CMoNYqIwMJJ5xfvEw4nC9uu35NL
X-Gm-Gg: AZuq6aKPbSm4JFgj732Ul5jxDHFFgCaHGHw9DK5r7KUTyCOnIV2E7bs+bv+X3LAcYPN
	OOGjzQqvff3BqAuNrUlGN4nFIw48Y+pGJRp8PUsgEzXqsBfH9lFXXmJ4ggLLjk5gFFitDrX1/Z+
	JHWu4SqSxJ34AzABWaVzVlUDbIqPewMASAN2ZLkYSnYraMoQryH7wrMW7jmG3dOZx2mYhItyehH
	QULlszOf17Opf1YNFZEX6ULjjjz04SYSbzMqmRfFoYye4bQu9p1RBTUS8xyf5zl4ZYM69vR+R/g
	AMzPP/s3L6pCmgbB9SnQ22P97cV3o3MmvXUm5IlpPtUJj3gvNo05AAAq+jzJaBQa5POyUr2g0oU
	S0BPXbj57j8xkEajmmn0LL5pSoKluGm9oA2Zu3G/X7sKF5FN0Ska8mdlkKvjCrxYUnq8UnLWVv0
	ZXN1UUsL5CFFb7/8WfdIvBeoU=
X-Received: by 2002:a05:6102:3054:b0:5f5:7721:569c with SMTP id ada2fe7eead31-5f7235eeda4mr1075932137.4.1769546075560;
        Tue, 27 Jan 2026 12:34:35 -0800 (PST)
X-Received: by 2002:a05:6102:3054:b0:5f5:7721:569c with SMTP id ada2fe7eead31-5f7235eeda4mr1075919137.4.1769546074969;
        Tue, 27 Jan 2026 12:34:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2c09sm140097e87.65.2026.01.27.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:34:34 -0800 (PST)
Date: Tue, 27 Jan 2026 22:34:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Message-ID: <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3VlloGRKlWlBHjQQu2ZF_4g9RA_cAMNS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NyBTYWx0ZWRfX0BBkzp+NCw4h
 1/DFMIjiR/1gfcLNpqK6g7BJrX3yQMAaxDSJ4jGPLBxcHefo+Sfwr80eL1NoAV+DCJ1YbNiiA1W
 PL7GGnOxqnHEpCXxHi9HC+viZrALUDuSKMsZQ32XAlopq0ppwTXsQztrYro+ZkP9WklftWlt1gS
 85OBpWV9ytZYGLEcuumaDLjQkuYKjpWjC/OcCBI3e44brVWgMXRtB1UBlzF3ohfcDegEUIX9zyM
 rrYbIsmek9dbGy/IbwdjKfI2MoPlcc2nk+UwkagdE6JbSTiva/zGXE2K8AR6rEvXnh8bcX3UN7h
 GYpQfno9h6B8PeXz93d8deNRm52ORYqyF5Xdsp9RcCJ6PUXj7Z/7CRoh0Wi4c6hxs+letQNZJuL
 yZ/UDcIt+Z/W0UTabJSAm0Al4xy3cBGY+5ArpBVOycbIgoB9OrrWSGmjpM5c55Pf3+uJzNQqSvK
 ZXnFcR9P7Sv2v47TtOA==
X-Proofpoint-GUID: 3VlloGRKlWlBHjQQu2ZF_4g9RA_cAMNS
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=6979215c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lIQNSvCfeu_oATqTbLoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270167
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC0729A60B
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:56:32AM +0530, Jagadeesh Kona wrote:
> X1P42100 video clock controller has most clocks same as SM8650,
> but it also has few additional clocks and resets. Add device
> tree bindings for the video clock controller on Qualcomm
> X1P42100 platform by defining these additional clocks and resets
> on top of SM8650.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml         |  2 ++
>  include/dt-bindings/clock/qcom,x1p42100-videocc.h   | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -30,6 +30,7 @@ properties:
>        - qcom,sm8650-videocc
>        - qcom,sm8750-videocc
>        - qcom,x1e80100-videocc
> +      - qcom,x1p42100-videocc
>  
>    clocks:
>      items:
> @@ -67,6 +68,7 @@ allOf:
>                - qcom,sm8450-videocc
>                - qcom,sm8550-videocc
>                - qcom,sm8750-videocc
> +              - qcom,x1p42100-videocc
>      then:
>        required:
>          - required-opps
> diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
> +
> +#include "qcom,sm8650-videocc.h"
> +
> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */

And then someone introduces new clocks or resets into SM8650 bindings
and this gets busted. Please extend the existing header.

> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_MVS0_BSE_CLK					17
> +#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
> +#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
> +
> +/* VIDEO_CC resets */
> +#define VIDEO_CC_MVS0_BSE_BCR					8
> +
> +#endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

