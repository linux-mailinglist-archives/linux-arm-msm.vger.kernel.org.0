Return-Path: <linux-arm-msm+bounces-86415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD8CDA5EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDC6130057EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE56F34A789;
	Tue, 23 Dec 2025 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZnfzgia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXhRSOXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F919CCFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518253; cv=none; b=q0Q8hRAzvGAaHjrUquaC2D9zRGkwgpsZaHomh5VtnKBYpM0p00zZC5hgjvKtXvefnefXIUoAi/ODy2nVCD7zhGUOCVXugw7PLNRQVs8/1t4hqyZsavI5YhikIuosAizu+vJACR0VaDp9Dp0D5yclMf472neT+ZXcAxD06Czu5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518253; c=relaxed/simple;
	bh=lpfwCWAZ7+wTD7QrVV1mgvT+unO5FNjQODfCh6BMuaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr/W5fvJ3e/Zsuy9aqEvQNjk39KV/abz9REQ/o7Y7BvEAY4kw066bb+4bjTEwLSO2Ri3OD7bJjMjAlaewEI9Wnkw8O2HE6f55dYzr7qP9dp3r+EbHh2cwJdzKDsIV1wHaPeqdogdcPwuRccH3f9lpZ6vYvVSijaluYjvvNXTLsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZnfzgia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXhRSOXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHwsuY1246312
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h6lriivzVPKYtHRQjomqIXlX
	ye2O+WWWhsb5/tws/RA=; b=pZnfzgiacWhx07YYjGaYRHsLrPekIHwb+fGIJsvD
	a3cgBxbOoVOx2+pUjn6PmBkHCY8JC73Cq41qiHM06JPlFMb0OHM2rvSdhQSDQhpd
	34RqYHuruRNb/Di+2YMQx9KvpDFuEG9MvXvwCUcanEBMz/czp7ckFdzLUvTUKFNc
	e3NWlnwgwPM+zt9GxaRdtYGtNZFWeJhHSEmvXpwJkOVCS2g3jLHo0jJmRSNo72RT
	QUGgVwKG+lxXq/xsIt3GVcT68v8PUrJb1ufpbXmnibLL3+le84YhKjY6SFvZ4X1y
	QA2HgvwNZ7uS3tq31cnupS+G3ENm0+xF2wX4qtJhKhjn8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cs77m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:30:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8096so130736396d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766518250; x=1767123050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h6lriivzVPKYtHRQjomqIXlXye2O+WWWhsb5/tws/RA=;
        b=YXhRSOXHYD2EGz1Rgf3JZtBymzV/sH5hHVEJk6/QQhpNcKqgpxyliWPSCCt08dEkid
         /mfYRPdalyKND2S8URMhtZpfBVf5Gv3SpSAcphSwczPX7X2PZquAW6vID+kCIYDycxBv
         KcNxJsaKn0fVevJB+3vdeDxUftPhDL23ivUVW8O0BhZZXE6wmvzDogz0v1to4UEyd4IE
         +vQEdQn/P/2KPDneC44sFm6xxkdLZGmP3h46OO/o5+zqnHd4HCxILcNDXlSYq66UdIbZ
         tqTds5/sSJL5awT90Yrwy+aVue9njoiqZz9S1PWUqSF7UOQlTpJcqGLPq8+mLefGHcWr
         FmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518250; x=1767123050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6lriivzVPKYtHRQjomqIXlXye2O+WWWhsb5/tws/RA=;
        b=qt5DtxCP8QZx/39bmIeqLHOq2teuuDJo3a0CcJRI0vrn1Xg/uQwXi1VvK6EazkaJ7F
         jERDcmuOeE3g7+trbhNdGjlegh4cCfwfHfHxdDUwZ19oQ0KHjWSH9PE7X9XxKPNus8DZ
         uLfEYHIsmFoKP+Tmkkc/CvgiPBKhGDjKcGkDtAyr006GgWPQJgLVbABJ1BKni6feXT0r
         9z9aprCM7DA/be056atyWRhGc+xsHOslBtP+7PWOM6Bc7xaM1AMHa2jkleOoiZ/BbCTm
         QMas2LB+eF6F20+hUjs2npJfbFfB93vS1860QP4miHO8YKeODHk4lBpvZleJY0ddVx0B
         iw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2rpdwAhy4wLi/yKB+AVuy3dkMKl6MQA7XAE8xPfK54n4Kpq4i/9RcjVLO2OZtLlOe5b5+siaepvwzeWjy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Er/CwCKIfxnqGAxIhRJD5UCeR31/I1YJsPW0BJwPlXTm9Bx/
	zXbUxudFce9dHe1F7JJ+79JlnFAZzlx6N3veDn/v+6568RlasvhKNJ32jQIVN8j+uPXg/OdN3KE
	fc31Mg2DBHL2VIZgND5JRAx3uS0PfUtY269DN15I1Nqw0ObgPdV4RyCHrvbFJhh7srljO
X-Gm-Gg: AY/fxX7MT9W+uG3Grnva16FqnMwsirepS8BDNXzBeH9RFDjHNqCNLKHdpN0hbcKxJi2
	y2CCXPkMtbLLVA+e1qBLSChWNTB4odbFyPobYG7FM7kQBum+7h3Lt7CoPxL+fq7rVKMI1rpQkP/
	qcdBRiY+tjWK1VIjRMtn8u5Q2pV8da2yw5aFeGFxHFRDI8WokP/oimU/nvRe55fgimJ50KiuJ6D
	J1QdulypRBMT7zEq6ALbhz++Jk9k0hoXBil0FtRGgRqsMpUN+VDDoJGxTGp8vGZZ1Nu+yyldHJC
	XGZfb7ElX++gNiTYy6e6anqrcgPcU4dkj0ksKtKhLcaqeAGeIRq5amfFCNwU9EsWlzDH9DkhO+w
	j8t8pFzC+2Z0oqra3+tv0Ak6fRueSQAi5IxNCngKr7q+z9IF+Cj+jWpU5tVaEYJR3ps5BLcnn3m
	kmfO2BPouEwWH31xj00D97bQU=
X-Received: by 2002:a05:622a:588e:b0:4ec:f6ae:d5d9 with SMTP id d75a77b69052e-4f4abd9768bmr224557411cf.39.1766518250409;
        Tue, 23 Dec 2025 11:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiQFhmg+1LgcdFhv8vPUyL27Emq3BsdV/vBymwMw0Fb3q3aNJMLIasImN8RglxRiPoWEF65Q==
X-Received: by 2002:a05:622a:588e:b0:4ec:f6ae:d5d9 with SMTP id d75a77b69052e-4f4abd9768bmr224556911cf.39.1766518249895;
        Tue, 23 Dec 2025 11:30:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1862846asm4272768e87.102.2025.12.23.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:30:49 -0800 (PST)
Date: Tue, 23 Dec 2025 21:30:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 3/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
Message-ID: <fu7rhvpo7t2fjx4l7nvzd2cec7loyjeqyvwgochghyyax4nqof@6bat54r3qgov>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-GUID: g7f2F_SHM1YxBK8FeHdQSsz0rHdMlqaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MyBTYWx0ZWRfXzNgoa0uRqFf+
 gryOXLJPIJK5A0W79buRA2uT/RlVUbQ85QBbtzE9EIJP6vyI68hhLMroJJeh/XoTmG3zN5RRSzK
 0d/n6PB/y8+jSonSM/j2kCz7sWebFLhUEgq3GCyeseyXOcK+nP+KQHa1m54iwLYliNyd22HWC+r
 ez8vh9KWo/dV7Q6ZhNQsR6kKoLGGgpNafXYsa69z1JoEOVsjmJX5CvAdlxyfvTG9NaSvVh7S92N
 voBr7KOp/NuDTeEsXiQTyKevyO5kh/WYfzw4hB44KFRVp98fQf6CCcFpFmbSPsFWPoMap48zzQS
 OYQSavwwVrKR9uvF3IPy4v7fQ3ooTbDUUauR2eHI2SbWH8bbqdcumM03CZC6RKJ26Zt3K9ttMh5
 zs2JAoIhAQxBpVHECz5zxp39fhBLWeFYkZrh9n4HwqPJZwjad36ysJ4l2eULEEEO/57SZue4184
 O93h68u4MRQoVZB6YOA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694aedeb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CyQ3y-Klav5xImQqluMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: g7f2F_SHM1YxBK8FeHdQSsz0rHdMlqaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230163

On Tue, Dec 23, 2025 at 06:02:22PM +0530, Gaurav Kohli wrote:
> The cooling subnode of a remoteproc represents a client of the Thermal
> Mitigation Device QMI service running on it. Each subnode of the cooling
> node represents a single control exposed by the service.
> 
> Add maintainer name also and update this binding for cdsp substem.
> 
> Co-developed-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
>  .../bindings/thermal/qcom,qmi-cooling.yaml    | 99 +++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 63a82e7a8bf8..bbc82253f76b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -77,6 +77,12 @@ properties:
>        and devices related to the ADSP.
>      unevaluatedProperties: false
>  
> +  cooling:
> +    $ref: /schemas/thermal/qcom,qmi-cooling.yaml#
> +    description:
> +      Cooling subnode which represents the cooling devices exposed by the Modem.
> +    unevaluatedProperties: false
> +
>  required:
>    - clocks
>    - clock-names
> diff --git a/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml b/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
> new file mode 100644
> index 000000000000..90b46712d241
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 (c), Linaro Limited
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/qcom,qmi-cooling.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMI based thermal mitigation (TMD) cooling devices.
> +
> +maintainers:
> +  - Caleb Connolly <caleb.connolly@linaro.org>

This wasn't updated.

> +  - Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm QMI-based TMD cooling devices are used to mitigate thermal conditions
> +  across multiple remote subsystems. These devices operate based on junction temperature
> +  sensors (TSENS) associated with thermal zones for each subsystem.
> +
> +  Each subnode corresponds to a control interface for a single instance of the TMD
> +  service running on a remote subsystem.
> +
> +definitions:
> +  tmd:
> +    type: object
> +    description: |
> +      A single Thermal Mitigation Device exposed by a remote subsystem.
> +    properties:
> +      label:
> +        maxItems: 1
> +      "#cooling-cells":
> +        $ref: /schemas/thermal/thermal-cooling-devices.yaml#/properties/#cooling-cells
> +      phandle: true
> +
> +    required:
> +      - label
> +      - "#cooling-cells"
> +
> +    additionalProperties: false
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qmi-cooling-modem
> +      - qcom,qmi-cooling-cdsp
> +
> +  vdd:
> +    $ref: "#/definitions/tmd"
> +    description:
> +      Modem processor temperature TMD
> +    properties:
> +      label:
> +        const: modem

Why it being called vdd?

Why do you define modem-specific node here, while the CDSP-specific is
defined under the if block?

> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,qmi-cooling-cdsp
> +    then:
> +      properties:
> +        cdsp_sw:
> +          $ref: "#/definitions/tmd"
> +          description:
> +            CDSP software TMD
> +          properties:
> +            label:
> +              const: cdsp_sw

Why do we need a label in addition to the node name?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    remoteproc-cdsp {
> +        cooling {
> +            compatible = "qcom,qmi-cooling-cdsp";
> +
> +            cdsp_sw0: cdsp_sw {

Is it allowed for device node names to have underscores?

> +              label = "cdsp_sw";
> +              #cooling-cells = <2>;
> +            };
> +        };
> +    };
> +
> +    remoteproc-cdsp1 {
> +        cooling {
> +            compatible = "qcom,qmi-cooling-cdsp1";
> +
> +            cdsp_sw1: cdsp_sw {
> +              label = "cdsp_sw";
> +              #cooling-cells = <2>;
> +            };
> +        };
> +    };

What's the point of having the second CDSP block? Could you demonstrate
modem instead?

> +...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

