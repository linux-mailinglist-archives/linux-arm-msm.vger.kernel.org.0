Return-Path: <linux-arm-msm+bounces-99227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGAHMWYxwWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:26:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F42F1E57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B99930B4D99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282F339D6E7;
	Mon, 23 Mar 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcUhNLib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiyBDgqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977F398919
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268283; cv=none; b=bZ6Ui3CSRubcJA594wAzhU+xI5PcuHQM95cMJoYaN7Ftmtv5yG1YdAs59yURgOVVJaTDGBnSFRSJM+3UDOcuUxJCNdh7JD6eZqkhw9SRNtOxGwvJLZPDV0AZx3bqgVSvHdV3BOIW029Lx6R56M64bNBtAhkixuIfPgd2CnuY6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268283; c=relaxed/simple;
	bh=+NIP/QEBfbHgGlgR+4OsAbfezPvxpfUc5R2/1QflK/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NloSssHoDQW31l48WOIuJ/5wuGZRdAjBAxFz5ZmJxPw3aOexUWAqc6mc7gW5lIGUNMAqLCO4PsHnzY5+RSrcXPfWTMKHQjcy8JRQF5/fW2ZdIrD/+91RNB5n7nKmgFDVHtkvh2mU43HpN6J7e7eXZ7C1+sfazTpsXU5LcMKKRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcUhNLib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiyBDgqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9kIfL2977532
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQxWWwGHP3smhnCWo5d2Wy5SBQHeT3nOxa6W8LchT0Q=; b=mcUhNLibLfvjaoxl
	jU/IGGiDRwre5ILwv0MZ3/HlIYXKrrVoID/KgoK9De9sG//Tg3jBfKxix4c7gKFd
	oSG4/izB9JfiloIcPMvgkIrKb5D77PkHhcwB03k4b9cIPUvdaPNlyFtYBguzs7uo
	N7Rxrvms2aUsE84tmw7v21GvZRd9IPequNsNgMymXcUp5JZc7W6SDiS0hQV3ijsy
	6h0gq43KsFSOc5I44of60/pzbkKD6PyIs+pZ6fOjxtl02hdIYi8Q/L6zdKzKm9Et
	zmVFjSTWsnPyS6nvMBxb8cDdX6vxd+Jd+U0gGVKs6drfDsbhgg/0QkuCxM0ysRh7
	5g/86g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvnbbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:17:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b32feb719so27084571cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268276; x=1774873076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQxWWwGHP3smhnCWo5d2Wy5SBQHeT3nOxa6W8LchT0Q=;
        b=OiyBDgqMOHYUkvTb6kW0mwLr/Z7Tf4yUuRapITok7uI1s/IFX9hdyVCJTzJZvm7eqQ
         r6hcDWA9+92DXf+AgWBrx9pumtnFDsSWXKOkU8ceJHhItyyoMc+Oou3rZ0ou4w25XiQ2
         8n26xl2t9tjlxNFsykVarrH+qtNYMwqOVPNKQzxmmW9OiiP/q2LUx22L8WFNYSoeKjK4
         +0G2MArsQEjdlZvrHmxfh9h9sVG7jNBLmU6fL3FG6jti4qBLHFzr4hBB+jisjdkwf3an
         H4Fk7Wamx0STn0DwFW2VykGEC1sAEyy9Ld2v1QGbh2z8GchJfCO8ZeH7XlYB1qPR3i2V
         2Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268276; x=1774873076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQxWWwGHP3smhnCWo5d2Wy5SBQHeT3nOxa6W8LchT0Q=;
        b=Y2uYt/TRwivPYpG2yXRTcQd01OOG4RYHfCq7HwCI2xifLBaPvSqV/AO1ybddx+lYkw
         V+YY6b8D7RIpMnkQwsQE/c5iu+Hp6x0Pq7+1dZy8XVOKxdp5oUqCcq6jBC5EpeeruxTy
         7S6yyNr1uv7GZetzQI3g4iLV+5O7Op4ZB7whtu/tpwPF6Iiccmqsk8EHNoI5u3ulSduE
         ts4/CRub4ENFIbZrCywzXEFf8RRxQdq2H6itLE0BFtdL2SaNqkwKoa4XWACgRSh4PXEj
         PjE9Lft29hHjnDEziwgiivYM+8Zi2TgeQih6Bb9nhczYBG57atHdCLnyeaRmz2UPguwB
         6p2A==
X-Forwarded-Encrypted: i=1; AJvYcCX2d9RPjTelHeSiyPlbfduprnTNTQJ97IL1gR0kLIt4ehADpNukVkR7G40rC1O2om+IixFpYNyF2MTNdffP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/FCE84rA+Z92hEv99qm8EqRBzLG94abl8aWOAQblbV8KVJB5
	DCrCC65XMM4dgdmHzi1aYNeAT+MudO/cV0TxyEfJKlKuzIMyZ7idtBv0m3JUdchTPKuvttVqqDb
	zdCBzn96gcfRHO72UYZ69yNwKZC2X3i9CfGKoNMhMnjnUt15M5zN0Ms3pVaeSARX+9U2rYAcmCy
	Ps
X-Gm-Gg: ATEYQzyJ/uT6dZ8rcdPAcEgTVfqPLpBEDxoVB2v7VzEZQCjVoeYMsS3Bh/KjOLDGn/J
	lyRjvfw/nEJmj3EeXRhGTupNoCbJvKttbzWTkoVv37h55CoIjGQWQvvO8otN31Slds1r1mEH693
	zyhRVoWyaQQjJAwd8phgC8GntAALNb2hYjuwUTkvAFsPTRxiQ2DgvTpm5Nw6ffDHJ4d/rQ4uK+C
	ttBz3PGNtY49DXmX0is4IUXBCCoJhU5BIKDfw5fcS1Attz8g9gTr5XkazdkdQ7esb80c+x2yree
	R15iiof+DUFycwdIyuPurqDao6zvZ+486RuG0riu51D4gsBsnfIUUKQUQ6iJNNTqMfwhhZzdQkx
	lXKyvtHjJqUDu/R5PClgNWHLXDd/96u1STwKVvgeNFe8IK/+5iTzVTf2WXAtt1jfx3FaxfzxEZe
	Gg8dY=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr135242331cf.9.1774268275740;
        Mon, 23 Mar 2026 05:17:55 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr135241951cf.9.1774268275248;
        Mon, 23 Mar 2026 05:17:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43ae8sm489737566b.6.2026.03.23.05.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:17:54 -0700 (PDT)
Message-ID: <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:17:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
To: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322160317.424797-4-mstoretv@cern.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NSBTYWx0ZWRfX3rMxCt5d74bX
 mc5iclUufORyC4jG7KywmGaCoW1brSN4hlvARgbunkNx9CtRdMOjSaEFQV8TTONnlujo8PWggHA
 Vh6BlqNMnTmkq5HfIC1HMsdnloxW2NH2P4C1w5HPZwFFaZj1Bh8Gt8zV4/b7Po+xGfUw1U1PGCd
 mshr7YKO06UbYGTTLzHFxjCzp59FMbiXCgCmUcIFwp5h3lD3TI+tRSfJN3/fR0BsKB4mAFucI1s
 lOl7+KTeUjOMHL4CIJXHH2w3Z0vFnoxjhNJ9ZomfSBVAe67xDnwSvsivxbUxqP+RbWq74NXzvju
 cpkR0CGVkENev3mLgflcywCIMOPxOsFyNTA7R63iy+u4AfaTJW9zgSRSI9+u8ITzbpvyLzaeVtM
 vaN9xktRcZ1L5IwUepwMpTL5DNODouD7e9iroUWuQd1P3b4lgMEfZq4lxoTXy8N9HiMfzkpqrLy
 a76lYE0T4rpffWsHvpQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c12f75 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=jXqzSn9no9U_C95JTX0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DO7xlJZo6F5cbN6B57b4nIcvuOMaTU2H
X-Proofpoint-GUID: DO7xlJZo6F5cbN6B57b4nIcvuOMaTU2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99227-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5d:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B2F42F1E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
> 
> These use a common dtsi derived from nodes that were able to work on Linux
> from the initial Galaxy Book4 Edge DTS by Marcus:
> 
> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
> 
> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
> Valentin Manea, which shares device similarities:

[...]

> +	model = "Samsung Galaxy Book4 Edge";
> +	compatible = "samsung,galaxy-book4-edge", "qcom,x1e80100";
> +	chassis-type = "laptop";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9385-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

in this order, file-wide, please

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;

You provide 3 orientation-gpios but there's only two ports

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-CRD";

This should reflect the actual machine

> +		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3",
> +				"VA DMIC1", "MIC BIAS3",
> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",

See:

b49e37de8e70 ("arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies")


> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u, please reorder

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "hid-over-i2c";
> +		reg = <0x5d>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		/* Lower power supply is not enoug to work. */
> +		// vddl-supply = <&vreg_l15b_1p8>;

How should we interpret that?

[...]

> +/* usb1 covers left side typec ports */
> +
> +/* back(towards the display) typec port */

You already have these comments near the type-c connector definitions
at the top of the file

[...]

> +/* DP-HDMI bridge connected here? */
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	qcom,combo-initial-mode = "dp";

This was used in some previous version of the QMPPHY-DP-only patchset,
see e.g. x1p42100-lenovo-thinkbook-16.dts and align with that to get
it working again

[...]

> +&panel {
> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";

I think it'd make sense to move the compatible from 'common' to the
16in DTS then too

> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;

this matches the common definition

> +	power-supply = <&vreg_edp_3p3>;

ditto

> +	no-hpd;

really??

Konrad

