Return-Path: <linux-arm-msm+bounces-108184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EH4GL79Cmop/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:53:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1656C029
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC0AD3007AC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D303F5BE9;
	Mon, 18 May 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNRcAChD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzgxW/i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33043330D22
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104672; cv=none; b=uRchVkCSXDMrh5N4nMajJtNaRvrAgTh1rP5YVg3aqZUwnncxk+CJt9I+frmQ08Smbl92UyGHNoIk8KWtu8omB3xuhUFBIJio/WQSVMTxxRdceJsuRuiijOcYdLreSu4hUVSNNU4D1pJt5gkm6uD2bhvp7y4PQBXBOc2aF9h+x7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104672; c=relaxed/simple;
	bh=AgIcKUKxDlCgW6U/kszhR4FW2rEpaaGgBGwYrc4s2os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ty4uC0zlAapv7dFyoMn4fs1XnGQDVJXpph2MOSm+nxLke2l8vmf41UnnyM3q+YfIdX22seTgeVK8gGMYEDirGGt+jcMzojQ2HQZeVZKkeKI5G4ai/BYbAaApJNiH5byKmM9E6vERJNEhMlKiUi0roWHfhjlU7Xt0/v4gbSktHSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNRcAChD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzgxW/i4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I9rfYE3595145
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crnJptzUEns7NytfTpu/gd6vjFfjq64UULyy/cb5MAc=; b=hNRcAChD7hg/HwgQ
	k7/8BmqwwEWZrWpDuvAYRultwSlx0F6PkPMO5fsQGtTUQG26Azi/KcM+nS6jAc7a
	onPpiSqDph+bB92du+ZcBmRjhi4VdcwJRutglyCRniRuwlxq7QW/F4dPe68ngpOs
	3warPGI9Ir+TfFXNVjo1fyixNLEwv4PbolvWUotxpMHOFoq072D1XDrrNpNwWnQM
	N8HOvC9yc8HS3Tyrq0LxTBhT+t1cr6vfmN8JLVX3Z5FdZlgM+3TeTJMn92MAtchb
	zMlfK2Gnuak+jKOpqkKbkmtre2BJ6r/Q184DJ/PoOuSTtZVw65ZzVcbb9JhdyjJA
	QtoUTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qea2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:44:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so7948301cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104669; x=1779709469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crnJptzUEns7NytfTpu/gd6vjFfjq64UULyy/cb5MAc=;
        b=NzgxW/i4OCYKhlRzYU6W5R048IbBMl74nthOQ/C3KFA/wlnd+nV5nPOiB5/GVhLFC+
         tV1xTZKgoUEMtjW8WXd3jvt2tIpJjnqvSWzl8FoLWDMASqiIL1Qn8X6KSFJkKuZm+rPp
         57v3zcSmZkj3hhlEjZ5VIKhsfr3NvRaRI9zaHnTGz7JyzOW1mflzA9BlEjhPgsWNw+VM
         B+YPeho5tXNNHTHuojTuuWJjD7+HnRnVxPYIG0TUj5HM2I8gq7NZggzsjpeImbL7o7bZ
         duZBI6k2984/uBtNIbBLi2zDOUaRc8snUBXMwXPlsz6viGxnfNf4TKqEuagtiengmzln
         upFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104669; x=1779709469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crnJptzUEns7NytfTpu/gd6vjFfjq64UULyy/cb5MAc=;
        b=bLartiJ3RC2FVAJ7aScuDMb/DUX671toWXnuzxH0PhODSxxcvm3cQRD1OoSpCknMw8
         SvXPb+URWcjHZy45YCxrpsMAWzajoff1HqpqclkK00nRNqd7hWUMVt9f6f8BxxFD8v/C
         a3+qIN7baKJ0r0hCtoe8ulgT5nvduKdeVqUhgoHX4Ft/FBZK++vefOqBJqSNzEG30N4m
         0GunktDH7bESCk2syq4bHtz7x6L4Dv3fMgIMek2V3xJ4cB4TVWyunsy2AA9JHuc8TKFE
         el7AzdkAhlrgjFClezK68aeAY6UxbsiB/vwGSQnIp2BejlInvLSk/Dq48X0+myXAhun5
         47vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XK8YdYuHcin3Tbrg/RikBLOi6mgQlylH7XQ/LUXyYvfN4SjNktHJM1MW8Xys5vSsFnSXvakPQ67W2SY84@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOi9WdbwTPpOIb9WwiTzaYnAP1x2lPmbry8iDtDu0M77qz7Ib
	A1GDoTIaWg71FwMf069CxUMQ6s5IIKaYOLDD8s9B66iVXzQBEH+X7uwSf/PLx8BmQ0Kf0flAXcX
	Y2Y1QSdJCOI4Hkg2eT58+JNVo2P/UaZAOQt/AB80qGqUsS8Y3KtnFHWyJFh1/RiXGcix7
X-Gm-Gg: Acq92OFTzKh9E0Y6lZs99rPLQriz9PCdMlNQ7QpALr4hnxMp4x0/SVRdMl1h1sCe8zG
	fvB5Q3V3Ii3tZgRbK3Tpm4Uc3RipvZmYjDgF96bZyf6CALbKWZdL91IgTeO7tgjVKyiCEjIS8Vx
	O5rs4u7IFWUMO9xpHIqNpnqC28xAnC/IsmI5fob679r1r6cwZgeXOQNILEAYKQsZz7akUfRxgbL
	DYynEUNTLvPktYNVwsQwDcZeeEhYQTJGn+8JuLoqcLMpi69kUEuK8z9HzC4CNvY41dC/b/TT2wt
	nA/NMKsv0w2OdBKmgSfJMHAzUvelCtWViYwlwmBceJdzKxzfLbdWsWdJjnIWJBU8CQQvJ9mokqB
	nXQiY1C/MfNvWAhQF3cqtkkmgqGuhSslVImzkqTYUc1PIltrQiDkD3WzE+Jx0ieaQ865XvYDxMC
	4kKJk=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr136431051cf.8.1779104669376;
        Mon, 18 May 2026 04:44:29 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr136430741cf.8.1779104668920;
        Mon, 18 May 2026 04:44:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm549218366b.43.2026.05.18.04.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:44:28 -0700 (PDT)
Message-ID: <eb04cc0c-f62d-44d1-a78b-ec4fea7891c6@oss.qualcomm.com>
Date: Mon, 18 May 2026 13:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518110435.16262-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518110435.16262-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nIRcSw_7lpErQC0ABBz7utLRKwWfx2Mn
X-Proofpoint-GUID: nIRcSw_7lpErQC0ABBz7utLRKwWfx2Mn
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0afb9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=8Y9wC8B1MoRLc4_sRv8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMyBTYWx0ZWRfXzgMRUNi9Du6I
 IMOzF4v/8Ym4rc7UayiG/WLMFYihScJCAYppWswwKDg49KiV++Fp+VMqJNm38e55mBpNL1P5NaO
 c+4TDAX+X+m52QJrw3TlzApTwx+lfWlt7VHSk33vlx3RX5S7LHPIwCVXJAaVHgkbbGyqn810V/k
 tLNAUpqIh+VKLzYOmizFxKQ+CZWGZYYbf/q4fnSBPkKxq9WjjBr+0JX2lU6lq3g5+ig/PjqfCGB
 WQE3q3oi7HYXInZp/83bhlIXbJF+9SykNW11N1gHFSwvheT8gPXaz3gmTDGyHCy5+m6bhrplUga
 Fpi8Lj35I3k3zlhcq3Y8kQPVCtRToutNs2ePYFcQTqsgThBBC7jGq4/eJaJ4v8XqmW/fkww9c7U
 ekvhjE1Aj5GTu7I2oY0It7sJUjMDj9K6Ru6o7+4IKJQrLLykrrgkanOADBSayoiJdLOuMkoektw
 OX8OCI7HckveWvc6lfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180113
X-Rspamd-Queue-Id: 63E1656C029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108184-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/18/26 1:04 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe,
> support along with regulators.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Hello, this looks good overall, I have a couple comments below

[...]

> +	vcc_3v3: regulator-vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vcc_5v0>;
> +
> +		gpio = <&tlmm 113 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc_3v3_en>;

nit: Please put 

property-n
property-names

in this order, consistently

[...]

> +&usb_2 {
> +	dr_mode = "host";
> +	status = "okay";

Let's also keep a \n before the 'status' property, file-wide

> +};
> +
> +&eud {
> +	status = "disabled";
> +};

It's already disabled in kodiak.dtsi, you can drop this override

> +
> +&usb_2_hsphy {

Please sort the top-level &label references alphabetically

[...]

> +&ice {
> +	status = "disabled";

It should be working fine, any reason?

[...]

> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <900000>;
> +
> +	status = "okay";
> +
> +	/delete-property/ qcom,ice;

similarly here

[...]

> +&pcie0 {
> +	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";

Is there anything interesting connected to these buses?

Konrad

