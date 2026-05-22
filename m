Return-Path: <linux-arm-msm+bounces-109311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bv3HhROEGoJWAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:37:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D58C95B4383
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD5F0302E784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAD93815D3;
	Fri, 22 May 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwrcXFDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSxn7Ypc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD337FF57
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452693; cv=none; b=U9ZT94P7+adKnZjotxnp+VPX1Rda+ViNFdPAQFuo/0z2pfE5UOC/MXMIY1tVXuMyLdyQ78CX7J0OldiLqZyEOPEZMiemHFAjXWsDHBklnmZLN4g1nDfObrUHEwQP1MOp8LuIJdd7tuQS9WIi9DvbGrXwZG519mjRbyfQtpKqEpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452693; c=relaxed/simple;
	bh=3yg9pAXmNWpk1/sWJAZJgW4Bq/i5kc2HEUpAaOv3rfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAQVNttpVqaHhixhzPQcD3IBb20K6UbXuEI+LztNCLRgtOd0N1dQbjRHO/9iHWHgNHPaF804cUY+yD8zrxY3fKgblzilvRvWD1iBcTkzMlDZhnxZWj2puFJfrJzI7rArc9QcQJwoy0NwdjC4dd9y9lDedUUo10oimbNfKi4ZlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwrcXFDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSxn7Ypc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8i0Y63532248
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td83Aavjt+y4+Fubt3kuLIXT1BRRXdtEK4u9R2BjUAY=; b=FwrcXFDPASzAt7HU
	KCwfo56sW0SJeo6kDa4NaSWt+N2vhpi7KGivMT/i6Qubt+dC3VPDDgQ1sBMVjbn0
	8B8VO/pK4EwDX0VzKzWs24phvcl0HSe9rc1ys8Ebnvbo6/Xb7qQZPFAcBismYbK0
	FHIkuGI0koaFfLDF5B8/wrSevSc6a25kKtH/OZfqm2lkDLM2JHLIAHk567A+F2B8
	nbWm861L23NkZ6BLIUkV9aKCCRZ+8KazYbwPW9Z4gP/khkyfs5xkqNnnOQxPWdzh
	J/qlySKcmdwWrzx/pfujAXQ795kPGmnc+oaIetljCIWuPWQZmBD4+yDDgctpF80B
	znlz+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw09d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:24:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb0b93e90so20851761cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779452691; x=1780057491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=td83Aavjt+y4+Fubt3kuLIXT1BRRXdtEK4u9R2BjUAY=;
        b=GSxn7Ypc+aR2b3Il15FBUWyR/s8By13x2PK3IPS2cMSH+Pkolx1GpbeLhC64pXteF/
         1AUNLYK4g5xYdq8Rtp7olzESLIKw3kZLOHYt5/1dh4wvHJRUe24lDWLxtucWXbz+VM97
         C3Go2ZksujdNQg5v8YNwAA+f20Wvphhd8uAUPmyls7J4zrPa/w+oL5J8a8YA6y/KX9Jb
         j0/w9mX//C9inyfrLh/A01wlEiJsEouepn5Dwu/bjZt/wzygnIi2ZRjsIaUHO6CU0q3c
         DwxcP5Og3b5X/atrgiUVcsoef4v4GZpmkBc0fJ/bWFh2+SuFbrzL90XjglSky1DufI0T
         X1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452691; x=1780057491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td83Aavjt+y4+Fubt3kuLIXT1BRRXdtEK4u9R2BjUAY=;
        b=VUw2NzLNzYMH8WDuQQ9uOy2vGyoZVgFLrq4HrDAJlC7jdyLxFam8V7828cN1VndFgJ
         nJ4gsTGtlOrFnpMC8z0MEHeyINEm4zvmK+Ug0nyQ3Iw80SsF6GoJuuaIdwDAsNRWa/GZ
         zI7uEwpiP5oWOlfI3OxhPR73pOHaS0pX7cyTKKFdysgvQwesChkalwUswHgbYfm3JLTq
         Nh+jmxaunziCBvPcAnfgzxiTaaNt17zSRu93dZSalodENk44ArZqkRhQA41OD4nsAj5Z
         EBqw7bxSNtDCyGYM7xPWOjEHdmfIgQqFb2dMsiowOsLMrPt5kklHOQ4G8D1GDydVih0E
         XC2A==
X-Gm-Message-State: AOJu0YzEdlJ8Um1fDR3Tb1q1qflYk+NCc8sRGbFc6MN/O//Tq4RtT3GS
	PY9pb5fdyHgHwVIVB5wsQEcOeSayxKbOc0fonelCTcmAI+LD4xQbKbDAbo54Ywdf4VQRFL+n/a+
	VGN8Gqezy8y0uVPEiRjpPKJjoZy3A/khTI0Dj/7QrO0oQ4KM83JpGOhdD1pvihffAnl7K
X-Gm-Gg: Acq92OEc8M4Tu6/PEdcH31WXEpCm9iUI0SyFyFj63hksUeuyrJ+4dwNEgJM4w+MUIPD
	GH/xzXZ+DGbKxm3tR+f1Fx4qVofEDHdxTSC6GAPYqx0LF/i6/wha6t3b0u6Bie1yW5TIjGDiokB
	92u6Hg83Y1VCUB28kMdsfxCnCBYMIpfhILXIO+USp0UllgV/deq8+ydcs+hi2bbzdvF5R3sBHH6
	Viwc/fWLZhICoLcQoFSdMA+9Dnk8ACSxBLZID/nly9k2h+9KbD8AvFQBv6AIuvoVHcwG0sE/BEt
	qrVzFcPgWPJ1OuVIyJDZ3YOdoRTvokCBOsCjAWILmlUgAM2g1zjQW4zJC2/wOQZ5zQVlhs7V1ol
	3VA4TSVh/qW0Hwqh4Pbm193u8X4PyAzqy/kB6AHXfJBzg4Q==
X-Received: by 2002:a05:622a:8588:b0:50d:a92e:fead with SMTP id d75a77b69052e-516d436cb6cmr26199721cf.3.1779452690607;
        Fri, 22 May 2026 05:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:8588:b0:50d:a92e:fead with SMTP id d75a77b69052e-516d436cb6cmr26199521cf.3.1779452690128;
        Fri, 22 May 2026 05:24:50 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm612961a12.12.2026.05.22.05.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:24:49 -0700 (PDT)
Message-ID: <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:24:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a104b13 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=w2YRJOle7L1X8GQccsAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rB-1kqg9JDg24WlgCGTMVQ_Y8c12VXJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMyBTYWx0ZWRfX0eOwXqoJSQpw
 F9NMq9NSS+AsfiwsIWhJV8GU3GIwwlejK/g2XTv1RCg6t7jeQ008/0UsRgyeVwj0hkmqJeggkmR
 ogxvmSQ1p1ANA7JO1J+1behFhrGXOfSuHGMyv1d6B7ttEUKwFBf5ZP/XOZ/mdVWqPxvuTP22MIt
 NPBgmRvjJ2ZmtWQSu5/15t1+/edlB/Uucs8fn5qaLMSx8xbbpiIcLiL+VqpDlylNHGXt5MGvTSt
 LkPxvg29NQtAxjpo1Bk8MdFXMsgKvTsiCTk/ZYWVYmbWGRLTVOYkhphdA8OSd1DGVGNXJpRdbBe
 aqrQdaUudGWi5igfDjKAnJtYMGjsFuH7wJJYdIfoRcOUsqnzOtpf8KZ+GHOF9ixI8JIomcLWAkw
 qnBEU4eUFwcVWrh0Q7ZE41v5WuIrFTkFwIkQOSbJ/4h1i+A8+J2G6g2a396rlYkF1BTGwGNszbE
 xZljymfLz7axOfZUYFA==
X-Proofpoint-GUID: rB-1kqg9JDg24WlgCGTMVQ_Y8c12VXJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109311-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.1.72.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D58C95B4383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
> Add DT entries to enable the PCIe controllers found in ipq5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

>  &tlmm {
> +	pcie0_default_state: pcie0-default-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-down;
> +		output-low;
> +	};
> +
> +	pcie1_default_state: pcie1-default-state {
> +		pins = "gpio29";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-down;
> +		output-low;

You shouldn't need output-low in either of these definitions (+ sorting
by GPIO idx would be extra neat)

[...]

>  	clocks {
> +		pcie30_phy0_pipe_clk: pcie30_phy0_pipe_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		pcie30_phy1_pipe_clk: pcie30_phy1_pipe_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};

Why do these exist? Just pass the QMPPHY reference straight to GCC

[...]

> +		pcie0_phy: phy@84000 {
> +			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> +			reg = <0x0 0x00084000 0x0 0x1000>;
> +
> +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
> +				 <&gcc GCC_PCIE0_AHB_CLK>,
> +				 <&gcc GCC_PCIE0_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;

Is this clock supposed to be fixed at that rate, regardless of the link
speed? And is the default rate incorrect?

> +
> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie0_pipe_clk_src";

Having a gcc_ prefix here smells fishy.. 

[...]

> +			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE1_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_AUX_CLK>;
> +
> +			clock-names = "axi_m",

stray \n above, also in resets

[...]

> +			pcie1_rp: pcie@0 {

pcie1_port0 for consistency with other DTs, please

Same comments for the other port

Konrad

