Return-Path: <linux-arm-msm+bounces-70397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5DB316C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D8C1C87613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176A32E424F;
	Fri, 22 Aug 2025 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiPmadLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093B17B402
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863800; cv=none; b=gddNORF9lqXoyTd7mOKYsbleawgL0ufRZCkLehqFsWdoc3gkuElitrPpQctbybSZEWYwUibxRdWY5S7SN2dLOXfZf2zgOlbrU6dFJxvD8FraG+LYZTiojgS9swsST18s98ALZrCtoucoRmBSsbWWCulDIMajauT/qcIf8B2lxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863800; c=relaxed/simple;
	bh=l5e7J0T/OUqNKqSTaG94Vz4CDys5nKZK1+9uZnepPZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI2kj1vZYRwyCLqkkORG1Y6Wj09GzEfHYCkt2ABY7d3sYgn6+2/rNQkQrM1UtT8jdqIMqhuxcf1qc/L+eazLeFc8crb1yTUj6YjGeQQ2xOlTHJEru5i+C7ocOU/Atg/A0GskSM0ax+5jScq79PBz4k8JURKeO6iIut4iV4CfkA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiPmadLQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UKxa005637
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbW62LEHu74Aw44VkkkoyZ3F
	tXR0sTC79991GoTUD90=; b=jiPmadLQIJvc2xlQHTF5aiEolhpn10h8HyS+rBgU
	zUYR7SGg/NH7UfhCp9GRXY45p6hCsYwbQ7GXvx8LV1Ha3f1hT7qN0RDQHp0FdkKr
	w3aIPUNuNXAHSe3USwf+VZKKGAUUuoLl191LhswqpKqRVGQQWt1I90ciRtw7jWKM
	ZSbM9MdOF1p2UKc5shhQuXNeY5M7bjIEpOaKmAohMK+r45RglMmJwGsTrejSZb/R
	JHtD6JiCF39wDn0paKtWY1gYzd9CPpIHokrNT+5lEVS21RCwo+LskzPzwgITBPNN
	OMF3k30TKQ2SaePYK4hlwBtyomm2FIb8MAvW6Bqk+Fr/Ug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ds09s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:56:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70baffc03dbso41366316d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755863797; x=1756468597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbW62LEHu74Aw44VkkkoyZ3FtXR0sTC79991GoTUD90=;
        b=GxhqcJGENQJQ7xv6ntHJZ4aWsAZxeu04uyzj0obuhMM56F69sF55H5ZfQOXptuHWeY
         g7kTXqzUgRUOQt4vVbD0ArRrVXC8Ok5awSg6rs7ergxzim/9R4gF1c9M6K+KwMpZpKO/
         oMHkAbiFHu+oea+7stZhksB8PZ83qVFJylTEPz5pAo/zUmNJHaEVzG2hT3m3SrVMNXvo
         z4bOa4yu7N8DyvqCPi1x+RF2EnjQSavusXOcG/XKpEuw6986yHBUhuBnMoD2p4vRht4M
         lW9xMLxh2h+2X3z6X03mjt49h5u+tG5Nt3gxiJEZtaxaBw3Cf/gDUgsBlPxPbSLoJfWq
         d66w==
X-Forwarded-Encrypted: i=1; AJvYcCXD1gArIBnFnv1geJ4//NLbytsNCK3pxTQSk/rY3PwUyXGaQmPitepRYeqF/HW1YEGpm8aIK72fcgJdplyJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/Rgr7xvaTiOfPngkQuRszI/VcbePK9eivbgMcubyKrmNMVbd
	ZR9NvyBAk8rZV6t5RbrItdFimCSxVRxVNxuM6ApcJpG8sFTYkA5Pm4kP+QcC2CD9rCwe9293MUb
	91ND/nLQgezXipjVZuKwEuvx12l95XjoNv7VtoH2WLIvqYPkUtMc3nH1gNCMoNm9AeZyq624ENu
	53
X-Gm-Gg: ASbGncuvhXvscS1zIGR0BsDtQ5V/RzXp1aVdVYZQ5WDTfUnUZZ5V0oUASgEUnRs7Fjj
	sQHGITTogfFRLi4Me+GoEEBzLRVST84D/NkkcI97nRPcN43APedR4oa1ZRk+h2DKPDqv4+kP2+S
	c0HnBUxW6qW1jmqaRBgBrNDLQXGTnt4jk7oqmqluFPppyDKHaOfBaZLlV67D9/BywQam3F3qQGN
	ku7q4DDeEjw/cHsSmMyYNry0DqlAWivrTO7anlUbrm47BTLVEclPzrX7Q+lTq+uTli88vmIkING
	4fWs78WoW5qZ8EupK5Skuj2mHdeSig110cDkXwSmFX6iZcU4ijB5t/YyjGoJjhR3xf0ohxybJbz
	RScHVxkMCspktk5WLFDsUGhAUznlVRfup84w8piZh/+fidyqqK1Sx
X-Received: by 2002:a05:6214:407:b0:70b:c8ae:1849 with SMTP id 6a1803df08f44-70d983dc528mr23598686d6.27.1755863797154;
        Fri, 22 Aug 2025 04:56:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf9iDidXcu270WCLKEtYSzRVAzAXu+4qdGyYfnvgVEY1n02/TXreYV3lHvsEsLT/a/hYKhQA==
X-Received: by 2002:a05:6214:407:b0:70b:c8ae:1849 with SMTP id 6a1803df08f44-70d983dc528mr23595746d6.27.1755863791394;
        Fri, 22 Aug 2025 04:56:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a64d34asm34230181fa.73.2025.08.22.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:56:29 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Quill Qi <le.qi@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <jj3mvad27kdpfxo4p2c3jfpjq2icao6mltpx4uu3sretqgkfap@vpqgfwzl3sjs>
References: <20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com>
 <20250821-hamoa_initial-v6-3-72e4e01a55d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-hamoa_initial-v6-3-72e4e01a55d0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/GFfh24Jnalq
 wl3Vuc2eEwiqAK3iOQRS6RedoSrzCWMExIXgznBC01zk1uP1UKgjDGqQsErNng+IP62OorMFlkl
 gwKZIvsI+sZAJMkj5rl0c7KT/8mzI/88rSrI4/PoF6sGM/4sels7GtqdrZsuXMrEVWC2+9WlBuV
 bVILK5Sx/q1oMGg47PAjnLBnSHUMYTV1oCYJ/QXRgz+a4MqKFsq8NtwvWoA3tPoQ/aeT6j0tBNm
 Aar+poBpEyYeDFar6v2CQJth4hx/DvyYfMeUobqGpy7/IeK86Mesb5tfpo5JGJgE03w87VOSGeP
 IXcWvyrNK9vNLRzHYOhrZmprdoQw9a59xY1qfqbLOTl4QOh9L6xU2AesnxVpQhrInvn4FSv/d++
 aNWOFlTiKR/8TTxEbepuZqF9birxXA==
X-Proofpoint-ORIG-GUID: evwWmg-dZwrMORuy4VxtxlW_WxHxrsk9
X-Proofpoint-GUID: evwWmg-dZwrMORuy4VxtxlW_WxHxrsk9
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a85af6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pXZBga7SBimYmxK1G2sA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 04:20:24PM +0800, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> This change enables the following peripherals on the carrier board:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - Graphic
> - Audio

No WiFi?

> 
> Co-developed-by: Quill Qi <le.qi@oss.qualcomm.com> # Audio
> Signed-off-by: Quill Qi <le.qi@oss.qualcomm.com>
> Co-developed-by: Jie Zhang <quic_jiezh@quicinc.com> # Graphic
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Co-developed-by: Shuai Zhang <quic_shuaz@quicinc.com> # Bluetooth
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> Co-developed-by: Yongxing Mou <quic_yongmou@quicinc.com> # USB DisplayPorts
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>  2 files changed, 1248 insertions(+)
> 

> +
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;

Why? If it supplies the panel, then the panel should be able to control
its power supplies.

> +		regulator-boot-on;
> +	};
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};
> +			cpu {

MIssing empty line between nodes.

> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +

-- 
With best wishes
Dmitry

