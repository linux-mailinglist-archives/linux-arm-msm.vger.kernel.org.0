Return-Path: <linux-arm-msm+bounces-64888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D1B04B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 01:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCFCE1AA0AD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 23:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180A12882B7;
	Mon, 14 Jul 2025 23:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jURD0LZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0A289817
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534162; cv=none; b=MuUtrZ0G25EpHbfH+55OJBlwgoOt4XKQZhMrv69ifKZtcUa2czp/VKWn4MnIIujIOrGRpceRt8J9ficpaLuMMg5atHgeoPpJE1RkvP1iT35/3oPXL6ArMEBLKXvu7+EIN+4orIcXUXsyi3s5UfSWTniLXqwblSkE9pg4NR7suTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534162; c=relaxed/simple;
	bh=E34GzRFYdfrySXlFcB0d8ojEarEs4qpWI5cY2qlxFag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5o0pw12uyK1Ir5iX5poT4N/r5bPdPR4D5sfgErSBY0YP43mt08okZAzl7qlyuaTTCnMm5njy2RMXg602evKOYrMvNdHmte2q9OMKZRIWk9WW37l7tCb3op02OoMFpJAN2nUyULiCQ9Ec44auFU6ogB/ptsSFuWe66SwdtGLmUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jURD0LZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EHAuAZ006286
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G8XaE9jpkoyoM7NQruVh04oW
	JMDICv2TJP6E53Rgkkc=; b=jURD0LZmOZmkPi8PD/Vr0Z/omyQW06nyZbZ7xAuT
	bcMOLxBKkUg0rHbr1fw0jUjJ55ASZqUFf/rTLSxWXO46krDM5H6jJhkWA+/Bf+9Q
	z/5NJH7vYXrbHY9oLZQ7QnSbOMBvjfhK3yFkuOy4NPn6TZY+UhoO4CxjMMQFvhBK
	Jj4UP3CRs5yXoyepZwqaMLtOoq6c9hlvv4yMmPZYNr4ehEM20VX11awC6EB0hJV+
	i/mcBTMK9SkHi0K4NfNL1aEv3DVoNjWQkLeZP0O7CfySnlp93nW8BrFRspd7Nb+J
	a5OI52kKZV+GPVluNkxB6HJoaqRAZ6ZuEL0KvDlNXIYDvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37x7py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:02:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so751636485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 16:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752534141; x=1753138941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8XaE9jpkoyoM7NQruVh04oWJMDICv2TJP6E53Rgkkc=;
        b=wuUH5q4eGp424ThJAhGnFbRTJyIc2MInLbGI+1CdOWGr7gjK+CB0qDUL9ZUsyp7OFq
         8fQDGVxWWfBN8yt7c6aHlDdApKG/0OaGHv7u/ST+k/eTAp+wcqkk9V7brAq8/xOZcirB
         JvSmJbKGIj316xn4gwqVNTTdrpbA7CI0oFHY5+kJWJDhzCFN1tyjIZPEMEFJI1yWovpr
         v+vgN/7goIqwwXbRVYjcnEndI9nTzfV6Z/EHDamdMjBNoi7Yz5TKTQR4CM84WGNe6Bnz
         Eix2eqviT0w0kaFJ39M5qJBzVzcz4UAUCeCrnYpcKcYunQ7MAUR5NaxSjKtGF5DYy/a/
         2cMA==
X-Forwarded-Encrypted: i=1; AJvYcCVjsULJ/Q2I11KsLSRVZAqFlcP694wQRhokQ+z/EuJh2Otpvdr3jTmXm/VjZIkNoE9c3OfEFgBEWSc8+Ddw@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5G6EWwhOkp9sOcgpZD2nMcr+LlS50e8Hywmc7zq6Z5tpt5qg
	oosifRTeUgTx6RLd8ZU/gQAiEMwfRfWna/LtFpHwKEFaJYHdqDzMnVii4Rnoy8OPAeRTy40PvKD
	AdhRiEsIZIqRBN3STuXZ5/dVnqjPLHX7FTaM4P3aM2++0TA+DDrbTv+kkFDjeB35wFsLv
X-Gm-Gg: ASbGnculMMHDwYR2CCMmmeHePi//XUfvQtRct6mSf7gPeni9tG2jgM6Pl79AOJ4Gce+
	ObQf2jfQ+mrv7S68/EwOZo9XXxgpHvtUHnk4DnPAFQVqG+CAOKOuqqXlZXAjJj917UkM/DrudqG
	axfYn8Zw8dWV336ilYPUIlwun3ZW5c8MQVBz6hdRXzAVHEeGxt2hsup5UnIFG1J6F9XdIublrDp
	r8yddnQvwgNkxqlmV31njgfmt2K36PSFbmfhHGTLu8dbNsNbJzqxCGktZarhVAGeuW0eJga1ToS
	0FxR371xYHao/d91pZUakujxARQmlIkKpr2H5///pgx4Lij89s6DDtsY/+FZ/Zz1nWiQY7R8ncL
	12uEUHnwGLqh6oyksHT47QnDqIE+aUbc5/w5W7yRzgLIyak4dMPwX
X-Received: by 2002:a05:620a:2596:b0:7e3:2b48:7a7c with SMTP id af79cd13be357-7e32b487bd8mr670146985a.52.1752534140718;
        Mon, 14 Jul 2025 16:02:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ziKVVI+W7Cfl6FloUK6LI/quaVkueJIXuqq0hcOx+aVeCIPgw/S2bBDlnuQBJfSyxua3Yg==
X-Received: by 2002:a05:620a:2596:b0:7e3:2b48:7a7c with SMTP id af79cd13be357-7e32b487bd8mr670138985a.52.1752534139909;
        Mon, 14 Jul 2025 16:02:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b63403sm2094597e87.164.2025.07.14.16.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:02:17 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:02:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, amit.kucheria@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <zk5cmielm4urfm22yszmjmwvi4mqvdsfthlonq6mij7rkijcsp@7evb3ejxuaj7>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-2-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708180530.1384330-2-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2MiBTYWx0ZWRfX4oBfex03KHv9
 uSq3JlHQhNHtj2Fm73b/V0Zev/gb0c/BYGuUvlMLgnxIuE9h/RtHcGa9pj/8+qohCZv4ii6VGzG
 7tiEE8PTdLqf8BuIHPHK55wwrvOYibxdP/G50V31Y6n+Udx0kpwvItetT25pr8f2RGC8omKxp+E
 YYA02gr38tModpmHt6gDZEfo2Va9yAjUDAbAzkmHwiqotzRi+DJ/Pagomzar44ioscr7hx1ubq7
 NPX9vtm6Q4OialKCf22MuBiVjXj/T0hZRMJTvlj+dnO7XCNz+erVe8Ix4SFcQJfYV3Zs1bLD5mT
 QqFIzdoB+P2i10/LOwot9K+zmvvPNdaihvwLZjYrUiuv0s2ZRuF4k1MO1b7lXryDjsxFt0xvBrG
 Cqn+WQGippLRhjSPjjaK1uIEx9Vf/BwrXG4e6n+U9FAT/ztreAetzPyav+nfgVvOid2OiRD3
X-Proofpoint-GUID: ONIRjuN9E3TgV5IHdoKv6EiL8VJBX5F_
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68758c85 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=mvPirLwls0hmURuAnzUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ONIRjuN9E3TgV5IHdoKv6EiL8VJBX5F_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140162

On Tue, Jul 08, 2025 at 08:05:24PM +0200, Jorge Ramirez-Ortiz wrote:
> Add a schema for the venus video encoder/decoder on the qcm2290.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> new file mode 100644
> index 000000000000..0371f8dd91a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description:
> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-venus
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: throttle
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 5

The hardware can't have between 1 and 5 IOMMUs. Please describe what we
have.

> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +
> +unevaluatedProperties: false
> +

-- 
With best wishes
Dmitry

