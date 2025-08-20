Return-Path: <linux-arm-msm+bounces-69957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4681B2DB5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 714B31C813F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1AF258ECE;
	Wed, 20 Aug 2025 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/khlice"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3621CC71
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755689828; cv=none; b=WY0PLPbCNoaB4GsbcSND3+30BGMU1mYbVwmMhOXDqO8OuvnZhBWUq9/2ozO4vwjh+RWk72guCj7c7dpqrY4dYaScB8OA/+jxSnQueH9CXCDHtydAOHCR7sGLl6Z9BmgVZjPdMOnuHy0kkmTnVj2+tAMwnreGV8RRjrawlf4qBFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755689828; c=relaxed/simple;
	bh=McQx1552YMg8zQBWoN19odePlUMnW+PahZRcsctyceg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsdD7fhPE41SzECLEYgMdRnvUrvePsgAywS6mGoIOCaLQ1uhjzkk+WzHq6SWVwtJZjlZVbiw5T2NixenE8NNhub7FoL/f1p5HPaZKnX+BOZkVPC/3c2VxbMnkYSbDgQDP69FpHbf2eSO20UPkKvtAWEdq64RP1dUbTHTtZ1v3Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/khlice; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9wKTB010677
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kG5EvtRUaQfCBV/YBpEi6527
	Mm9dhLGyA7HIWyFmk/A=; b=I/khliceukaDzXQ4a8TO8U8d64C7c9DcfnKPgEeI
	MMsXt7NdF862BBfRS+lSt2wt+/vskLgWr1umAzOsSxswVBPai8z0YCfJYyvnOCT9
	Ypygujq0WaGH8GRWYcmBe9HZeySZTPrQ/DjBhYRdAHf7alncQvu3s3OXFDmRIPhS
	0sfrPgtsH7V4ng8jaxFIqTUfdoY3lvQjdZjMHkvB5kNhUmnbov2elZvLSBaWY0sH
	dSudDwJQwoL99/4IT9IVXYTcisHes0jI2f7FtdbS7JZf0lPoqWCvl0X9bCVS5yP2
	OnxWbSZ8bXMKzmhFnEFdp8LsbChMmrv1TptxzocLl9jQAA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhjr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:37:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e96ceso13161436d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755689825; x=1756294625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG5EvtRUaQfCBV/YBpEi6527Mm9dhLGyA7HIWyFmk/A=;
        b=vRruKsZziaGWmrvgvCvaL2i0NQo5dYs5b2XELoO1fe3uJGN4FCZEZTv1+qa5yH1cRV
         v+eiqExZkOX5MLM6CdWJhB5Ta9qIBpZflw6gQ6bbIMW9IJJhL4mvcRQU8VD9opMj2VDS
         WRtLJpAAlIew+AoQs9M67izV11d+W6XdUdViVgWqH/sKTSLZ1RZMoN70oHtMpz8kl+Pz
         pfaKHjh82tp1rRA+AOsnzgVeY6VuPJ6fnZxq0AHNmvzadSe0EdMD/+DV1Z90lakCUrgl
         TFY7RR6RdngESA95W54MCctIRiglMvv2MR0ISZOX2zrPme4oMrTsDmZwA2bhTxoBiKyY
         dXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZgY7AmLU7W7ebI84Dge970HRo3P+nx+cNnOnjBzGAlqZgocpdTExFYN1ywB6zDJsoB4RLcddSSMLy+bcA@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxBEJ17n0EqObr1/qB1D9OjWQtyNxe3kxeGEvtJC/7YB8OI0+
	XVsNReY4EDx9rgprcR/oKMDJonLxKj7kHCa/GV3OLmcP8Kw0pEmObKlBUMIni12O3AUbDX06hRi
	Qw37+sLAIebS++b4NEGEgzv/j6M+gF35DLzm92ibN6u6JQYavKMmkljqY7AtnI/bkQdZL
X-Gm-Gg: ASbGncsOYf/yWhw6bGAj+0K6r9m2o7DNwjbT+mXDxNh2GH1HQEziuz9zmbrmfff16pO
	sKpRliqDJVidYAh0pzW6uWEjce5nVdO7uQ5BPTuuoJyCIxUyZtb+1PsyRzqW/wqpFraNQvo1ZmY
	X0GgYyIETFkiXFH8C+flBDwoJZC1/b9X2ozjtWQTdBDdyq7K3mN+ZTOmjetQJibtfkA73xAokMZ
	OWZN9ow31KOVkUzNtyxubPhSrx9/dnQZgLEDoI02hqIdWRxa9Xl+zjQi/O3xv6uh/nsduyfeeGx
	USeLf3y5Bc4GJaWMT6ghGnqnBgOMcdQq4AO9sNVM0RRPMOxN3tlrry9LWyZQ3vy2p/CXv98uc6A
	LvygVXckZVbmEOeZcSEdqAHhW/EGYg0XQ9rNm3vdLDKxTj7jpD8zy
X-Received: by 2002:a05:6214:c28:b0:70b:af39:8596 with SMTP id 6a1803df08f44-70d76fae59cmr27614636d6.28.1755689824728;
        Wed, 20 Aug 2025 04:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF8uDY/KF39ETwmmHdeKUKsc98VcWiJ/Iu9zjHm6WFS5DWcH3CpZlDmrVqK45d2lN37i/9GQ==
X-Received: by 2002:a05:6214:c28:b0:70b:af39:8596 with SMTP id 6a1803df08f44-70d76fae59cmr27613786d6.28.1755689823518;
        Wed, 20 Aug 2025 04:37:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41e3cfsm27543291fa.6.2025.08.20.04.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:37:02 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:37:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <tlilctwavwqw6oy46l5fote2pa6f4hdy2im6meo56cjaawba3a@a42bwbbfnsuw>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxkN/9q6D+muM
 WClKNAzSdpDsVJd6smOmSo5RxI/gx272m+OfA/TVxj8Kf/nLXuKsmaENM60yRhjykTLNxi2LLhF
 Fj0SuZ7itMMWs8Zilc+3UfnH35t/QB0nOhXfbwMj7Lt+2O3BhpAHfKvwJPGVLZ3H7UkRT5udqgD
 qU2k9xu61n07ogxGlQSDPkC7pPYCoDGL8mokRk3bds//Cn7S/sgpI40rmfOuJW7V/Cunwksuo+W
 6JWwNZRDNMxFryi7t4vAX+Lka+9qhgDbxwNfOM+qayRNAlRhsxT0rgFBzwpc0012jSLEsA33TFt
 k9DHNfDJ4So6h+Sy0rWW46HTFy4YbmSfzXsZM5nXVFS3JjgGsZZLwBP9TcJnWOWHLPzG2DZv+//
 FvqHYvzfmvw19gHfofsZHTFpBs+aCg==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5b362 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=7souUVsdAZ2KeZQVA08A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 4S0nH8W4RI1TGbWI0_bBtcqOHGLBGNwf
X-Proofpoint-ORIG-GUID: 4S0nH8W4RI1TGbWI0_bBtcqOHGLBGNwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> on QCS615 Platform. This PHY supports both USB3 and DP functionality
> over USB-C, with PHY mode switching capability. It does not support
> combo mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description:
> +  The QMP PHY controller supports physical layer functionality for both
> +  USB3 and DisplayPort over USB-C. While it enables mode switching
> +  between USB3 and DisplayPort, but does not support combo mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs615-qmp-usb3-dp-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2

Missing GCC_USB2_SEC_PHY_AUX_CLK and GCC_USB2_SEC_PHY_PIPE_CLK

> +
> +  clock-names:
> +    items:
> +      - const: cfg_ahb
> +      - const: ref
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: phy_phy
> +      - const: dp_phy
> +
> +  vdda-phy-supply: true
> +
> +  vdda-pll-supply: true
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See include/dt-bindings/phy/phy-qcom-qmp.h
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      See include/dt-bindings/phy/phy-qcom-qmp.h
> +
> +  qcom,tcsr-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to TCSR hardware block
> +          - description: offset of the VLS CLAMP register
> +      - items:
> +          - description: phandle to TCSR hardware block
> +          - description: offset of the DP PHY mode register
> +    description: Clamp and PHY mode register present in the TCSR
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - qcom,tcsr-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +    phy@88e8000 {
> +      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
> +      reg = <0x88e8000 0x2000>;
> +
> +      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
> +               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
> +      clock-names = "cfg_ahb",
> +                    "ref";
> +
> +      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
> +               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> +      reset-names = "phy_phy",
> +                    "dp_phy";
> +
> +      vdda-phy-supply = <&vreg_l11a>;
> +      vdda-pll-supply = <&vreg_l5a>;
> +
> +      #clock-cells = <1>;
> +      #phy-cells = <1>;
> +
> +      qcom,tcsr-reg = <&tcsr 0xbff0>,
> +                      <&tcsr 0xb24c>;
> +    };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

