Return-Path: <linux-arm-msm+bounces-62469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC1AE847B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6734F5A4DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A96225B697;
	Wed, 25 Jun 2025 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmEJCt+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80192155C82
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857636; cv=none; b=HJ5iI/QUR1A0xO1I9De7kG0/4MOhBVS0KUdJM2VRqPndC5RfHJvyb1cXVUWnR4HmTruq5pcONGmVUp0tNF8daGYd0iRiGlHgL43Y9sIILL/pEd9eHISs4rMpL/Uuq5+ihzBdEkuq6WC02gTddD4CnC3bydb4mOySqMcs1FiuuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857636; c=relaxed/simple;
	bh=J32uwR5PG6Pj/fkgodkU8NToknBPtoDkFd1PmBMP74o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyUBPl84tBGl3l6bQDRCbx4/5JYdzNN7ZqZmkCUu/nTrK/MedzrUF6TvzCdE0YC4WNFCGiqoiNDbhOyeY+KgK0vV3qgq7f4F0F03bOx8nsLSfPn93nZ0iY7tGsZitSx371H2FRvFl09G3DwbbVgdFQzsEHF6w+aCVZ49fyhoENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmEJCt+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCa9dO016718
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Wc6gS//yAoCzSiP++Qy1pCvIWUQ0H5tM6n71zaADIw=; b=WmEJCt+KShHamXWM
	DwQtRpdWj0ommS/ZUnTqMILSd46G8aIrPS2dHbUNg8QsD6ENqdrgsppZUkf1aqWv
	/7tukxP4ubFmNP0/A1lgRMc/0m4HrWcMbQlwVrvomLcsaFw42o198fZP/biNGa2D
	XFGsDnCLYsKEgBCn8DQ8CdnNciMy1R+AD/fCOtOQHAFPj+A8kJO32k+2vnP/YydC
	H/s7Uymw7CFZtlbvmaLzFt8JiZCl3aPu9iufhwPQh3nw2F0y0pWkRShNJ+I3tsWI
	JHP73zuL+ytXK9cJHa3k6RWj8+cQ0CuWYtvJsbnHWQLt+Keq6gHljgBeiayDY8lt
	GycS6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpfxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 13:20:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5ae436badso14364911cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 06:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857622; x=1751462422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wc6gS//yAoCzSiP++Qy1pCvIWUQ0H5tM6n71zaADIw=;
        b=xPTHpI5177ghvnlqUP4u+de2AtKo0TqZu+WTqRtVBdo5dX+/w6sQJXRRf1lj29eXYO
         OPURaBVue4L1RDdACJQgCw/XbIgGtZswTsOE5EgNAE5ScduVMdP2zMI+GTxrx8l60j7T
         0+EeudyuFtssaXv5cuq1R8XCV72k47kpIMBDWaa9kZttG6whVZcso6WHNocfa2lUlBYy
         BaBTrW/G1laXylwzOtusQ7UtyXzPP+RlfRrfkr5v2+ffs5PofwAeruDRIHfq8CnNy3Kx
         VixGfiSUJ5ltS5jpysjozHNPK6CF1sUeVeORJ1Q5F+U8RnxStmTw7GESkR+3Ks2KuWqI
         LlIg==
X-Forwarded-Encrypted: i=1; AJvYcCXC/AC7Cc6qqJglQUfi6kNURb/xiFYM6IIBqW4rxKegW+BL1jW1AQJO8VDXFFNyotwxTyfWXOVHO76Sv3QL@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzhh0P6JGLBYk5vibR2nbYS+UP8xHh0aPaEoxkMWpvzPddUG+
	L7c+F3YMo+1us+kjE1L9fLtZPrkyk6YNiHb2fNn4R7NbgOz3rEIhc/i+RVt1e4uBLJyDxNTbdj4
	CcrNzGYzrVE7d+L0/kkhSlsJ4CnU8K2ytq5Ae1WyR7gQGG3i61+Zc4qeJdQgPenv9xF9t
X-Gm-Gg: ASbGncvxRoi2y6EoY0sSxIQWhnQeiBKsrfUQtTlEucPDGRhX1GTFN8x1VZiPGQ4Kmph
	7ZRIDvs01ikY/FMeR/WahdIvLfQUSodu8FTWOdZC0DXseVW2cmIbCjdI/DekR9IXuEfo49ROc5b
	BcEcOKeDGQuNvoCBzfQRSRugLD3IGJQjrDOPlkVlCIUoHTG4Q6ojcMjWyxNLvlZD90WNfQoDJnY
	eyQAlssZlcy3uGRh6W5Js7zlLo9ObyQTCgZ7tpDlECsuQuaRUho25+ac3kORZ6Y8/F0rTSBXMQ1
	WQKDYhm0us/8fOEiF2oHPVFLeT95V7+lO2QTXPogl+kCE8Bi/TCMv3fsAp3pdhu7VwhONIXOqZ3
	0GPQ=
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr149809985a.12.1750857622591;
        Wed, 25 Jun 2025 06:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhWy2dsS1LyGigZ4Dt8bnXgAs0PhlY9HNqrotGcZ/DU5sSn6FMsWkf7WES+YXghkiMky5/Bg==
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr149807385a.12.1750857622105;
        Wed, 25 Jun 2025 06:20:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a06ed21bsm373251666b.29.2025.06.25.06.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:20:21 -0700 (PDT)
Message-ID: <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:20:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8wXqHmlxzIlReCH1vS1MVnqDdKGx4adh
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685bf7a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=1Wqoc7Fd06vDnn7CWGcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 8wXqHmlxzIlReCH1vS1MVnqDdKGx4adh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5OCBTYWx0ZWRfX6uoni1PXXeAq
 O9o5HvLmux1ZWVnSom+aYaO9/6rqfNH8kHtnrrJAFYfA+2j+FsGaKEiZzW9NpsrD7g9wV6XyFQ4
 5FndHlml177x+7xdhEYQDT3DRDHLF3aWW6vDmccGvbq+ADw3yra3LmjUvIw3Np4k2YvN8BLSS97
 N/1JuUgnTxDc+7Ri5fCRri0YsOgRPogy7PH88brfJVPIyWGr0UOSeJVJeuy2JJPVGZBi6j55QkR
 g8ebofd62HDTtBPYPFYeAzbiLkjfHBsVPvMCNrgrB+y3Nb8tMiCJXtsOR67exnKFkBPS8AMd6YE
 RzBk241dy4A7WI79HYynBjOQ+i8K2pW3h6VWukHOUWqd3AKXrzAyvPvzwCJ1q6xyEY+3NYZqD3Q
 MHCnc245BzVigItFOUkhKihbd501ZSV1PsAzLBxgi3w4aF3JDQsLgQh28PaCyekVfFp0INue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250098

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmxr2230_thermal: pmxr2230-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmxr2230_temp_alarm>;
> +
> +			trips {
> +				pmxr2230_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmxr2230_crit: pmxr2230-crit {

This name is "meh", please change to tripN

> +					temperature = <115000>;

Unless there's some actual electrical/physical SKU differences,
downstream lists 145C as critical for a PMIC carrying the same
name

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

