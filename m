Return-Path: <linux-arm-msm+bounces-98394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI1nB0F+ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:28:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB382B9DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3517A3011C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9F6379960;
	Wed, 18 Mar 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEbGASpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuFDn3OK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373D35F181
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829691; cv=none; b=rO0aIxFH4BaRh5x9RVVi/v8wPvTNeaDbJHCNOuB4oxm3EByAO73NKPTN7dVdxQLEfAJYLqMU0AwfDDawAhHcG+R2i5dPhBDph6IkpgDbO67y5Ach2ZP2zj015lFNztbrPLMvZd7tLw1xAjlT4gvo40dIv1QRRKxWnXGPAAgKoSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829691; c=relaxed/simple;
	bh=g1lFkxgNM2As/FFnMkqSpkhOeaGI8P/etL2kdgY+BoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKvhVy5RxRKKpeklNFqpvCB+G4oDoXwR0RNukv1HpN3KIXhmPXQBsz468a40vdJbgGrFuMPFyF6KcJ/FwW8exu/9dNljlnB9xCCHwUvrpL3Bd7PTGjl7CTW8o424P2+Sbpf72HcEbNMtSfRrKvMIlBmG7Ez8GBhuJvZTXso/gpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEbGASpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuFDn3OK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9BQQ52294016
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqFDE1/8OVok3M3UrRjh5fs8K+GKsgIiSCPlIEJkwOM=; b=NEbGASpkuBWvgiOh
	FlsLbn6FDLGrijNN1ThoOOf9V4wAXxddqtII8Pp7Tt+O43CpwmNR4kV8kt7HTyAA
	eAyuVF6FdksU5orRtCuTAKLvAHpuf4MN3T3aqJlpD3jmhxpDv8AEUP8hY8R/EStn
	fk1TMENAP1qzdWZmmuvv7Rv2kE9bMltdypWd1IeeURr6DOL5OJjw8D4pCl28Lc7w
	c6zZK0AA41jCHO5SwuGCYueZlivgWXk7Xpn9Ij0QjGCSBsDOyurSVOhylc/ncc5T
	VcWXhi+EkS3eehGc+ONl+HqYZPnzsViLw1FZanSvqYhzLnaPahFytSmfUCA6YyaZ
	LyehVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83uwqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:28:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7a2c535eso366665385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829689; x=1774434489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqFDE1/8OVok3M3UrRjh5fs8K+GKsgIiSCPlIEJkwOM=;
        b=KuFDn3OKj2Zp+0PZEv5+swJdIJ5NqpgVjwLOmy8ya1+C0bMcyNQ6LUE8kyrDdzatrn
         sjISJasOyI3Na8vas1skA6QrwRZLGnCbRrOsnKeLVYMzhmvoyhdbt/zIgkYGwEAoyVNw
         qgNoih22IGUzVcgPIihevBqYR+LYNlPAhUwvkg+ZfDCq68M5+RLdKgALvKepwNwS9mbw
         0w/sYzbNm5m5LUrbd1BXr7KGj13W359pqmIowr2QpjLHqG0qnZSbHDxij9oULLEpMsfK
         f/fbnlzFZaayAVfWxFA2KfqlVFk5LY4P7NZgj09CANFF8qWUFsP0CtnMag2jhWgr87ae
         Hgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829689; x=1774434489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqFDE1/8OVok3M3UrRjh5fs8K+GKsgIiSCPlIEJkwOM=;
        b=eZYpIN+0sAf2auWXA6e1kxwxe7LIZHfjCZufDQ8Cp4PrKLga68o6a58kZ/r4Mi9Xy7
         PhvzkHf+K3uQNT4a4xPAvfvWvirauj0Y9Xcx6oePA3D8JBSre6C9SPXxs6cyN+JM1lHq
         IkEoE3ioU/pAFmJrw8KY4VzVlplZNEqC2cg9mnNhe0iFDEb7tpzOu2Hhs33Blrcg20ne
         Yf1jvzXvsJgs+Fi5PKRIKZj+LzIGBu77VbdJfdrX8zmlo1Q+ELgUTvCBPPASRZCnuJNO
         an0e6zwATuFOTvz+GMCGCpuZp8IgllhiKew88rhTb5IbXReACsztdHsdZjaDvNV+/FbN
         CutA==
X-Gm-Message-State: AOJu0YyP5jXLJHLGUtMFyd0U9Zrfk8sj+bAOLV8ATCDtUeikzgBmz7o3
	ZUmGmpUBAKm3Pq4gu8FQPeUpaRqmo+mpzqHRn08opLcroSy3Z/aLE2IvmEfRoEmUZtwUEc6YupG
	chxBAptA/1jcad8r7wRMOd0nL4jM/2yggSN2djhNmFYrVOqVXf8hkTFB6ZZvZ5m4q59ZHCLwDqn
	wZ
X-Gm-Gg: ATEYQzx/jxpKBtFZNr6/tG/iYwrzdYD4mJTVw/ZI9zA/3ierD+XahC34hQP5GjPjdKT
	6UkNvySsK64wsQS2MUIhAZW+otU0T5iKDJEtNqpCOCGHMwC64jtmmUR5g4eugdycJ7iec7bVel8
	OdHWJD4Ar+TeXcucbK1BIZGeq7+MRozoI+fXhzI71Rokw5fYWLtNINWdLBB7AdeuHbz+BlHjCFW
	IIX+VlDeul43uF8qvDq5laIg5grb5HFvx18/TbWGjDswpaHjN7XxLoPoQLdAYKGYO9p75nfEsVf
	wdtDfIPMXq2WIi7Dxzl9+jHYzFrL3VucYAXMTtwuDw0StzYWuS7NTiE25I540mOa0qT5GUB89pn
	+kMv8rYwc0/EGuv5teWWpxwWCAyFDCKoeI3LS0032iTTHS6KiOPTRizmRv+tUH22rVuyVT29njb
	mTwmk=
X-Received: by 2002:a05:620a:404a:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cfad357f8fmr281966785a.5.1773829688555;
        Wed, 18 Mar 2026 03:28:08 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cfad357f8fmr281964185a.5.1773829688001;
        Wed, 18 Mar 2026 03:28:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b12ada68sm1602499a12.28.2026.03.18.03.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:28:07 -0700 (PDT)
Message-ID: <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:28:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
 <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CkIQ5HHM-eXOkqBIxJebeRo0p9UeUbQd
X-Proofpoint-GUID: CkIQ5HHM-eXOkqBIxJebeRo0p9UeUbQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OCBTYWx0ZWRfX9LfYi/9AnzMm
 yAE3PMIK20z2bnocGby8kxaerYobnkQPkj9aXXL42DvTCWhcGqP1e8gGlWNRgxowjUkyCbIO034
 RRnoCAOBH51iLorZ0V1BlAT7qg7bAkBRfdib2T58Uqu6CC3Km1bl3i40d+gxprBbsjRugspCyE6
 7UuULymuyd4rbDtPrzTRhol8Qd4K6cikHNlNv5TC77GPHi1ZjtDYdMIs6MR28hZLiXT2ZYRAGA2
 /noBi+jveK9tyWd0H2qPmFOX/n0kzSrU8noGFlvLq91f3YA4z0J8papQnnCNFjZmG/fe7X51Ic9
 p4c+mLbwSbRbCOtdEGdX3HRP/R69xULUvze3mx0UvBSphaRb7C1lyOi+LOtKZ2Nh1D7GQxKb1Lw
 3ob44IcY6L1PDoWOKkISbZPTZjcdlxzS6lUh3Ax309QKVoc2dWSPN+93sSmtkMGsMdRI2jQyxW0
 nNCmvh6NQ0bYe6PaYoQ==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba7e39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OwnEAehHgkl8Ls2ekt0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98394-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,0.0.0.28:email,pm.me:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEB382B9DF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 3:43 AM, Alexander Koskovich wrote:
> Supported functionality as of this initial submission:
> * Armor Case & Dock Hall Sensors
> * Camera flash/torch LED
> * Display (Tianma TA066VVHM03)
> * DisplayPort Alt Mode
> * Macro Camera (OV8856)
> * GPU (Adreno 650)
> * NFC (NXP PN553)
> * Power Button, Volume Keys
> * Regulators
> * Remoteprocs (ADSP, CDSP, SLPI)
> * UFS
> * USB
> * Video Codec (Venus)
> * Wi-Fi / Bluetooth (QCA6390)
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +	/*
> +	 * There are also ER & EVB boards, but those have meaningful hardware
> +	 * differences that make them not compatible with this devicetree.
> +	 */
> +	qcom,board-id = <31 0>, /* ER2 */
> +			<40 0>, /* PR */
> +			<41 0>, /* PR2 */
> +			<50 0>; /* MP */

I would guesstimate MP is Mass Production and everything before that is
engineering samples.. perhaps that doesn't hurt - maybe some curious Asus 
engineer swings by one day!

[...]


> +&i2c1 {
> +	status = "okay";

Please ensure 'status' is the last property, preceded by a \n

> +	clock-frequency = <400000>;
> +
> +	nfc@28 {
> +		compatible = "nxp,pn553",
> +			     "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <111 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 111 ...>


> +
> +		enable-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		firmware-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&nfc_en_default>,
> +			    <&nfc_clk_req_default>,
> +			    <&nfc_firmware_default>,
> +			    <&nfc_irq_default>;

You can bunch them up into:

nfc_default_state: xyz-abc-state {
	nfc-en-pins {
		pins = "....
		...
	};

	nfc-clk-req-pins {
		pins = "...
	};
};


> +	/*
> +	 * When low the USB 2 data lanes are routed to the bottom USB port.
> +	 * When high they are routed to the pogo port on the side of the device.
> +	 */
> +	usb2_mux_en: usb2-mux-en-default-state {
> +		pins = "gpio9";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		output-low;
> +	};


[...]

> +		source-pdos = <PDO_FIXED(5000, 900,
> +					 PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)>;
> +
> +		sink-pdos = <PDO_FIXED(5000, 3000,
> +				       PDO_FIXED_DUAL_ROLE |
> +				       PDO_FIXED_USB_COMM |
> +				       PDO_FIXED_DATA_SWAP)
> +			     PDO_FIXED(9000, 3000, 0)
> +			     PDO_FIXED(12000, 2250, 0)>;

Both ports have the same PDOs - will this kaboom if you plug in two chargers?

[...]

> +	wlan_en_default: wlan-default-state {
> +		pins = "gpio20";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-pull-up;
> +	};
> +
> +	bt_en_default: bt-default-state {
> +		pins = "gpio21";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-pull-up;
> +	};

you can drop output-low from both - the PMU driver will set it via the
GPIO APIs

[...]

> +&usb_2 {
> +	pinctrl-0 = <&rt1715_mux_en>, <&usb2_mux_en>;
> +	pinctrl-names = "default";
> +
> +	/*
> +	 * Disable USB3 clock requirement as the bottom port only supports USB2.
> +	 * The USB3 lanes are routed through the pogo connector on this board for
> +	 * use with accessories, so will need to revisit this when we start to add
> +	 * support for those.
> +	 */
> +	qcom,select-utmi-as-pipe-clk;

So, is that right?

                                  ┌───────┐                    
                                  │ POGO  │                    
                                  └──┬──┬─┘                    
                   superspeed        │  │                      
       ┌─────────────────────────────┘  │                      
       │                                │                      
┌──────┼─┐      highspeed               │                      
│ DWC3_2 ┼─────────────────────┐   ┌────┴──┐                   
└────────┘                     └───┤  MUX  ┼───────PM8150_GPIO9
                 ┌─────────┐       └──┬────┘                   
                 │ GPIO170 │          │                        
                 └─────────┘          │                        
                      │               │                        
┌────────┐ RXTX   ┌───┴──┐        ┌───┴──┐                     
│ UART   ┼────────│ MUX  ┼────────┤USB-C2│                     
└────────┘        └──┬───┘        └──────┘                     
                     │                                         
                     ▼                                         
                    GND                                        

Konrad

