Return-Path: <linux-arm-msm+bounces-67502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA7B18DDB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 11:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E65153B7AE0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBC81FCFEF;
	Sat,  2 Aug 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOMTQSLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD81E5B69
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754128592; cv=none; b=kaOsmIWXPA3zK9m+ezRk+Hv89cHXUrCl2RSfgzaqmSniE7x+LYtlSorqlbEJqMz7Am6hfKTr8xVTdufx+3AMb2Qbq/QkpJf5UZkhgcUcTO2/DwItfXHm37F+9eFvgx00KEuGaa8J92JzNaqOU0ZHxQrppcFJ9GZz2uPdpKLCVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754128592; c=relaxed/simple;
	bh=dbfKLcbC8BEtdi4oWfWEgX+I8SPqVMEqxYDY0MC41HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCVsi4j6NOQMJ8ZdekunkjrBcjgB84qYuJRavg8MgJ52eOY+zULcmPUMS5kpvlPwC+0gb4dSNpROiFuu7hdt9KZtf2xORWBdSBq3V4A2OvFxQLjlbYCcjW2o4IvG8/auUHUbenMpCJJKDgyt+DQNdKXHJIsbIVEGhCT363Agrtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOMTQSLa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5728sPPH031709
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Aug 2025 09:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tgapHTEIyirK94bcuh79Jkb2
	NHYVIyca+jtZheFWZ+c=; b=eOMTQSLaaM+CPoqDc2v/btTMTF1q7UxFxQ959aCg
	IqSx3thWCL0zZ6fNRr9MUFDd1ykMheaBZd0IkF+rgaMjUPeWsYb0OxQtqPX33UBY
	tshAm3VwA8ldYiXAkkfB0ydBgxnpciOwqiLGSsN/wdDWkSHcEcKY39zjUE1BxJTf
	MBuftNk2bjbjyw9LKC6R3YbxUF/mVOP6K5tqY8SfReM24BTNx7cesNrFDjjYBDQd
	qD8EPrhwCpV29BZO6Qp394fdKPI/6EmG6oU009mRqptUAoEvyKlnFnrxLsle+kvo
	/H9HzMdErvwxNxudQi7/D95NKVPml/8r4OfZJUHfOQ0LCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqgfnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 09:56:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70707168c59so14657566d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 02:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754128588; x=1754733388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgapHTEIyirK94bcuh79Jkb2NHYVIyca+jtZheFWZ+c=;
        b=xSBY7arJusZ1kxRHaCz0nsv1MHWgzqo7OK9TgODVdzZ8SlpbV7FMnbPwsOJ1tbPbMY
         N+4OIWV8rNFPkT0ob1bwC2GBY453xvfXsCnrvZyfjr+pWsOJva/6keOhm8TaHI60K5Iy
         w+ohwFfAEB4k6CJhR1KdK8p0eU4EMJDubAsLhXLZNSOQjMk/2J/lRLlFmHMI5nFO2yBn
         gJ2aC+e3iHOqpCcHkJPsWjVOe0W99tvQ+J8CJ2c/KrKvlrOcBx/9uevmr3mkY0hSk0WG
         RMBeKbNDFz366sleHEt18oTCiKAc3ZNBBadj+qfK0RtzAgbR6d635IDfj7hAGyddd6uU
         A4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX/cmDy2q98aCc4o5+GFnDUwfk2E1uYsJcO8H62sLoaO/1oMDtd5m4um1bj8Kp4ZFWzWXmgnnHX1DiQiV1m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfzh0Koqm1hp8MoRcJYLtmQBysq/RqRg744xiTx94szQth95lj
	b3Iydq/68aACBzDYMPguOULzQRrmEyHE12SiWIY/SHJvHKCoy13mfTF0DoFB46peEepndOMm3NT
	RyaFODPRsRLAjmyYxciuZ6t0E3jx1FI+oRYfYzQJlZLIyQiVMfBKDI5DGgNlfkwazoPx2
X-Gm-Gg: ASbGncuH2P7mntZYQjJtiO+0StZiiswp/PI4gmkhSIA4j8rIBm4iceOGvupFiAJby97
	RL2FI/6TX1K6+3SOdLoQNhYh90SN6Y/FFodUKVRKjY/h52cKjO+naFPAFYjE5QIUX0r/RjX+6zy
	7r7M+p1pEiX70H1zUFqlcTf6/gsuj0L1brixgTrL5XlZNH63TTWBExdQ6n9UE70tqHoLKX6tmaR
	IEQQVY0/VytnGlHiPBZfs7pO5I5t1BLgJghKg9NcexG87mg/oK45rHnw5wa7gbJe1mzS39Sf1Qj
	KH0h0Z6Vn+4cWv9Gdx6j65vq9JAHG0v2tXx1qgGgMd2LM9Ep1Z0xRkvscLhGqoE7IYAEJ1Ewzus
	p5l+SAqAIvCCSa4oCpPjGaEIqRE1xdYlH+4Qbsjb96jogIkkFreQ2
X-Received: by 2002:a05:6214:124c:b0:707:452e:1e9b with SMTP id 6a1803df08f44-709363276c0mr30228566d6.44.1754128588147;
        Sat, 02 Aug 2025 02:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWmPmGi7bSzZLL/ufth6B1UYrxlQ6n2myVT51dGj1PWD8ll7fyJ3i928JLrowb7W4FELQxbw==
X-Received: by 2002:a05:6214:124c:b0:707:452e:1e9b with SMTP id 6a1803df08f44-709363276c0mr30228296d6.44.1754128587672;
        Sat, 02 Aug 2025 02:56:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fb356sm9193871fa.61.2025.08.02.02.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 02:56:25 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:56:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
X-Proofpoint-GUID: MgirTksKiRBgtvIHcR1q4vbYkM6e17UB
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=688de0cd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=BQMJ-ZqQIgEHPhERFsAA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4MiBTYWx0ZWRfX0qdtbvwzYjdr
 spOoQ+eiGR1i4b08SIM5uygoOdD3ugX2J1dWpbNqagoab3lO1Gz5diMwXnqjFiSS99u7/xPfBFq
 bFFY9JiXorA03+V5p8jQ1694IgCTuBentOHHV6cZFQsEZL25gYv3iQKd2OfmnBOkA/7bBgjWO07
 kupDVSRwoCQ5qUxh5MEPFNFdIvAL7XfZUQLf/URs5lHhMjM1GFEWXggJHC1o3NSxLnoIVSCm2Fh
 nHvgTHiUHo5EnH4A2jZf3t6MnlGBSTavzW6GOHETYPd9z8CgE9qpByVO+CU0yCIIVmvpyOCm5E2
 xM43Drc2iG7inmt6EIcf7C6HjnArGF9Fd2mBD1up2ayAaW99mHBZjU0hw5WLiYFJ61qqxGzKf5P
 gUObm0hW/qHfnkXqcavelazjisLWat9h4m141dw75r/oUzhW/0xSa0EKM0peWmXHy8HVd8r5
X-Proofpoint-ORIG-GUID: MgirTksKiRBgtvIHcR1q4vbYkM6e17UB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020082

On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
>  1 file changed, 284 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> @@ -0,0 +1,284 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
> +
> +maintainers:
> +  - Yongxing Mou <quic_yongmou@quicinc.com>
> +
> +description:
> +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DP interfaces and EDP etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs8300-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    maxItems: 3
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dpu
> +          - const: qcom,sa8775p-dpu

Use contains: instead of listing both of them

> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dp
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-edp-phy
> +          - const: qcom,sa8775p-edp-phy

Use contains: instead of listing both of them

> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +

-- 
With best wishes
Dmitry

