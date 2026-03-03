Return-Path: <linux-arm-msm+bounces-95190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOL5OvQnp2nSfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:27:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DFA1F54BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51B9930A0A5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 18:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B7C3CA484;
	Tue,  3 Mar 2026 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZCBakYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bN0OLIW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D477B3A6F14
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562049; cv=none; b=L4xnxKCEhser4XcMhGkddh8vcylP/tYiGvep/NoD+cBCa7QU+rakEI5T3ZE15LAnK8owTHljDY0AOAYeWlzYhkJP/sPVgc7wvKrzraLTz8NNrqjd+b0I0zjom0mW2e/dSwdjpaG5iB0IazEDbsFn+iwTB+5YjmlUHq6lW7Ej3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562049; c=relaxed/simple;
	bh=rhpJVHsNMSBq/uKWUJGwa5xV7NWpvwC0ce/Cos+r8I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuhRwhEub+5Jeq7smYEZX9wPkmmkSXlwUFLxFmjbC5P5msDXtaD+5HkEoUY+3oSF0jAWb0eoFWlAYFJUTOSSYXJrxfKIomfJJ04K+JvX0eIZEJ2SEdBy5bHU9c6YjHtFACzorwr3rJ5vImRyl6g0NvTuSf4fn2r/yZ1huiNxFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZCBakYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bN0OLIW1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0eU04030500
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 18:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lC7ky6mebZgpVjcxW/hjFp1ho4+jRsSmj2aDV+XPb24=; b=iZCBakYOEbZ6mvYI
	Bu5bl96LYCoz0BiaixVhxoSSVcR+TJAn+ZIHMRLBGZ7Df1A4uyX8yEWZDJJ1e+Qy
	/H8K03DnIPqp3yDOrUtovY/3VxKc6FjBzs5wsQgBhSnkAUDUYNFJoU2h44VV2pDg
	bQHX5WjYwK+iBDFAeOjMqrXmpkJ/+5c119rcwG4OcId6x7MGMeh62UqxaDAX3oSN
	UJ3mk5pLQ9Oyxxs6SSFkzneFvqDR6luXT7SWBmjuJvrL2qiyM6xaUogwzftUgc/j
	0Z9Iv7n7stTP5CMTBNuKFcYMU4rbpb+h+xMqcINW2HP5ZF+Bo0b2tfFh/RTr7Gsz
	DBaiHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu21r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:20:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49120e74so25399585ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772562046; x=1773166846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lC7ky6mebZgpVjcxW/hjFp1ho4+jRsSmj2aDV+XPb24=;
        b=bN0OLIW13CmnUXWDfNOHMyU1pttocJaVHjGpFVK9hchXUBZMdSbzA1CCftqN/QMY9R
         qLKHXdW8dtoYhSZuAggTMl9Q3vXKrfqDvU4ay8VCEIK+jU8IKpnEznR6WmazxrWoLnQM
         Hh/g3jKjnhk/hGzXEGoWlsFFRm0ows8QaA9ng5RbglAbYFFSX+QkRBbJjk9cLQVirYwH
         YnFU7ZvaSK1XKCgStTgxOJ503mEVQenETCaLdXlAdmlJ5gqKTCLy3ypLtUyIrbPx55Od
         uLhufmiPp22EKo6xMDTPHcDGxFGEjvmhWPUE+KX7g1WPqy2J9058U11Mefr34oZkwCNc
         UsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772562046; x=1773166846;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC7ky6mebZgpVjcxW/hjFp1ho4+jRsSmj2aDV+XPb24=;
        b=hAU1GJB4VdylpIZpO64vgzWN9JBSxrQIOoC3nL09Y3fY7O5CzNq3sJI/8xY4jSv1BW
         hbtU4saGWkXYkFZ1X+McIEcZYjcK8LcNvK8+blrFxn6/saBOzFJLuWdQfBu++YIFkDJk
         ESRhWn13z3oNHjB9SQ5nP+c0R9eZ5JHmvgQhqb7CjaSZ4g0fuRdfXCreY47sqqZNxgzx
         wJvqXfLytdSoVmNax2Xa8DZJhPrcd+vzMquPwvBGSk01Q7PEQTl3oAIihsWgQqpGMW4W
         585FDOQxwMLjiNTf1Q2TZ2TWOjX0C7ENHrZX5q6Vq+4CC6gbmNl9VVxT+pHclnO9oXlm
         oZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzAhGYRdYPHUMTXToj5ui0MeERnd1MobWCLorwryX0YjOpHyX8injigNZz9K9KnxNAR65NNQJ7GyBGGT3L@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXGA6yggJGaN7esiZYnqeX9b4gUk+izt73UkLJIk+NKy/u99Z
	/Cx6H4yzjOr7VAU6wK1/76sZXxMjPcC9AvDVl5/IbmDq0ApNV3BCeGx9TscOh95X2OKNJurA2cd
	ZrPUjiJKHPhgwjGfAQaSieeq9uqb8ZdBLhi6rCmDfi/sSbxAN5NXA5pfgRJ7Hpn3z+36A
X-Gm-Gg: ATEYQzzJS6rUMn8iNSvCI3EKRfgDQWzDPnwVuv5PvQ5a56w9VBO1rg468JEyEz2lJ+t
	Pp9Gp2y9HsJyG4C6Q/X6YKP8B9CsOkOMkmGgxS6+xRrcmVgGXZWi//t0vNHJX5PNhArcYbpcejT
	IzKBrCzP3IWr6vcZbWS0vN/2f/OoXY3zWwQlojZPz8nLmii4Oq6N8ieTm9e41WP2iwrZREZ4TaE
	sqyG0GPGUyDrxJKnPZA3YHK7g3i7ogvs4yd8hVStFIXk9BZNegleln8MvYD3gToyE4gdcI2QBEt
	o7zb6OvweFNsHGcuSXO7vtQwnknRLq0gL5P1v+7BsVDVa79F1FaYypuVJf/OYnt6Xsuv9J1GG0q
	HWvEU6PrymsstG9PMel3dPgOdFgTRF59JvV8DeEztk5E=
X-Received: by 2002:a17:902:cf11:b0:2ae:567f:fd7e with SMTP id d9443c01a7336-2ae5680013bmr64718655ad.4.1772562045568;
        Tue, 03 Mar 2026 10:20:45 -0800 (PST)
X-Received: by 2002:a17:902:cf11:b0:2ae:567f:fd7e with SMTP id d9443c01a7336-2ae5680013bmr64718395ad.4.1772562045070;
        Tue, 03 Mar 2026 10:20:45 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5276097asm83093585ad.34.2026.03.03.10.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:20:44 -0800 (PST)
Message-ID: <0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 23:50:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/3] arm64: dts: qcom: glymur: Add USB related
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
 <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a7267e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5paVSw64R4kEUMRm3sSMUA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4XyrqKlbJ5bOH_rkkigA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: WF9-o0nRevmhZ8fuwcAI2Matl-gIRktf
X-Proofpoint-ORIG-GUID: WF9-o0nRevmhZ8fuwcAI2Matl-gIRktf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0OCBTYWx0ZWRfXzoIQFgm4btZd
 N8iTj03H8uhwxLlOOj68jl7BIVqwaeH7A/GYJ/lmPY9T9ZXY2MjNiErnZoLc/AZnEJwLvUgQTe3
 AB8G2GJW/AlxnCyAJFy/ytfNUx6uYFWLronqa4F1Ja72rIqRNuRXu2uz+aB6FyXxuTC5nmyNMsl
 I8DGzELomAat3llYlmDUSLKPsignA5SbZqY0OyOkwMz75hiVyYBXl0fm9SrEBeNgTpB1EGN2y5s
 kxAUihgruQ4LqUVhKVHs5TTvgU7XNSsOuEJ1X7FHLwLj2ZjfEaOH//pVVqyO4pJUNe/DZBRoHEz
 bjGrEZ0tHh4viQJzdnCTfzs5SKSaquW9+cED99gjyWm2kb6GUkeXD80tD7sDSqPiGSWdXE0ycjv
 qtQm+5U7woNcPGPuPdZPtCy/+wsf8GFwpZYVzF5tJKVkGkNiMMkQSTvGLfhOqnbGAsdvKvzlOAq
 PdpDArFgbATkZiGe0aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030148
X-Rspamd-Queue-Id: 66DFA1F54BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95190-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,a2f8800:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

<< Snip >>

> +
> +		usb_hs: usb@a2f8800 {
> +			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a200000 0x0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB20_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB20_SLEEP_CLK>,
> +				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "noc_aggr_north",
> +				      "noc_aggr_south";
> +
> +			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB20_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
> +					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "hs_phy_irq";
> +
> +			resets = <&gcc GCC_USB20_PRIM_BCR>;
> +
> +			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;

Please ensure that the rail (CX rail?) is scaled. Otherwise, it will
impact other subsystems using the same rail (eg: GPU).

Similar discussion here for SM8750 but not sure if there is a plan to
fix :
https://lore.kernel.org/lkml/e70cfecc-b2c7-4f09-8d87-6a7e0160769b@oss.qualcomm.com/

-Akhil.

> +
> +			iommus = <&apps_smmu 0x0ce0 0x0>;
> +
> +			interconnects = <&aggre3_noc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "usb-ddr",
> +					     "apps-usb";
> +
> +			phys = <&usb_hs_phy>;
> +			phy-names = "usb2-phy";
> +
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,usb3_lpm_capable;
> +			snps,has-lpm-erratum;
> +			tx-fifo-resize;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +
> +			dr_mode = "host";
> +
> +			maximum-speed = "high-speed";
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp: usb@a400000 {
> +			compatible = "qcom,glymur-dwc3-mp", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a400000 0x0 0xfc100>;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "noc_aggr_north",
> +				      "noc_aggr_south";
> +
> +			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 11 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 78 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 77 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event_1",
> +					  "pwr_event_2",
> +					  "hs_phy_1",
> +					  "hs_phy_2",
> +					  "dp_hs_phy_1",
> +					  "dm_hs_phy_1",
> +					  "dp_hs_phy_2",
> +					  "dm_hs_phy_2",
> +					  "ss_phy_1",
> +					  "ss_phy_2";
> +
> +			resets = <&gcc GCC_USB30_MP_BCR>;
> +			power-domains = <&gcc GCC_USB30_MP_GDSC>;
> +
> +			iommus = <&apps_smmu 0xda0 0x0>;
> +
> +			phys = <&usb_mp_hsphy0>,
> +			       <&usb_mp_qmpphy0>,
> +			       <&usb_mp_hsphy1>,
> +			       <&usb_mp_qmpphy1>;
> +			phy-names = "usb2-0",
> +				    "usb3-0",
> +				    "usb2-1",
> +				    "usb3-1";
> +
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,usb3_lpm_capable;
> +			snps,has-lpm-erratum;
> +			tx-fifo-resize;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +
> +			dr_mode = "host";
> +
> +			status = "disabled";
> +		};
> +
> +
>  		dispcc: clock-controller@af00000 {
>  			compatible = "qcom,glymur-dispcc";
>  			reg = <0x0 0x0af00000 0x0 0x20000>;
> 


