Return-Path: <linux-arm-msm+bounces-96615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK1ZAFgAsGm0eQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:28:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B624AC59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24368306B727
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419E6313E32;
	Tue, 10 Mar 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmUtgybu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MylbJE+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150DB387361
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141922; cv=none; b=A5foc8A5VGCk7OwzxpjMd2Zu4T67r222Xcxjr5mcYcY7VJu65WM3LqTHRXKVGAJgbDQ/22ktoILRjK417uD/UKqsUL60wW0bqoF6/lrKrR/8CCAodK8mHYIGM/nk/6HoY2u/LH1REQVgbhDuY4HdXYMbQ2GRlw3yW6XhCoPg7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141922; c=relaxed/simple;
	bh=Dl01MgLboozylrRZom7J3olARLsD93uFTe2UmdJjWMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dklz3KozPXTnnKWBDMQUGyLd/yDVFvlHaenrHVKXG3H9Umy9vvQJ8Q+Or18SoR068dMOAwGL2u80N2VvAQsvFJE9UFaSD8PdvXFHo95q1rqFNOVk8Hi1ipdLlIpj+P9AJzLRYjbEeLlUBpLXnLRnr2XmFKCeFa2oiyNkKOdCSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmUtgybu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MylbJE+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A95r062363224
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jJysiFqGQEKdV40WTqII4/0kEfuFtE86HCgf8cEUAE=; b=OmUtgybuZe+AcSTa
	LZcO56rshJN4RD54rbLVwQ/wqMDKPHcJsejAQRH6nhbbtxAW1NmSDYI86I/KCcJ8
	0VoOcIEgAWQZyU3ZTcxGjG5hh3dyOFM5X5t7UGrAhy9/xffvEQjKNglbbZ1F3lc7
	Sk6FAz4Pn6I2wlhQwDgF0tiz+Rs0Lrk2xso3NJbASbYGLqKLmM4ufyBSIlNZB6Md
	qpzzSccMZMHUsaTQFeep7a7miumsG8GU+vmVnS+tvsi4aIOe+r+ABkJJOsLDUMtv
	QW3D4ppVJRLzP0/TGtAKou8XxA3QZpFMM4fbfvcGYgci6cF1q/Sh1mhvd0Ddwcte
	CifcRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032bysj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:25:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50dfd542so866732585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141919; x=1773746719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jJysiFqGQEKdV40WTqII4/0kEfuFtE86HCgf8cEUAE=;
        b=MylbJE+q73nNrSkS7l8EzqkhEIK/YuYDU2eEGB49bEwek27OyJoBFkY4Xg5nRn9eZ+
         MpvY3Q4JNz15ffA2CQUzcQwo+KlainzMmjovR41LN7e8mbOs6DN3OranV/HzftrIqQUe
         ynI4L8dXNiV7BZ7gUPenvJENIj+IHCzS8GV2dLRAPtxtOwYM1uWTqNSE6UcOmxwWOCeN
         8/4JsibernqKZ3HjWSxVXxKkrLtnpe2gnSDtch3IBYA0hHKdGzp00l/z4koRaEi+rE5i
         vGJZCQRSdP/LSxZUR27T2SvYtKHzyrao0wao8t7VQe28TouGCCD5zifXAjY1uA0pji9g
         i/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141919; x=1773746719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jJysiFqGQEKdV40WTqII4/0kEfuFtE86HCgf8cEUAE=;
        b=TDP/bSstPCNStWbY7M9J5Nv7H5WjeFGYnpjccr35iOU/FrPpRVMqVVAtnBmGn+/LOj
         0JLjUg2z0R7w0YLG/vW53mh7ZncDznZgYSWpkXC09EFAy6WHD2wLbrysB758g74HUfHn
         dLy9LFzp6CIPXQ2kMNCuoUFvZt7nYtKX9mXXFXf4goLalx3iE8Tismkuc/LlVzPqx7Wh
         PkvS198psN0h7FufZC8Ke4WPxQ9+3vbaDvYSpnoYpTaElq+L8gI7QhgBe1NfN1cdEfJg
         1l/p3+Gp+I6GNeMQSRsCGs3D0WYJwsW3kLFzl5OgXQ6SE/2UyK5ZhLdYnhd0mKpGlk6r
         xDfg==
X-Gm-Message-State: AOJu0Yyllefod0+VeF5s/aUg39OBZFR9napiQ4r8odeNMvP4nb9QXzu9
	LSeOgyBfJhOQLn3qpLaP+3ZFmBRvy2PR1zDMixgXadaceKJHeRLpbQXRHhRFJvPZEpy36LESomD
	e9rorwLIla5KEq5RGtDRF+mTdpzam850Y/HpVLtNsNjvwRnMvfUAa1ZVAp0R/GrBbxZkO
X-Gm-Gg: ATEYQzx12o8pnmfMTyA8RaYu0qx4a38JJfJZ7kgRwzTdIOJ2KEUr4N9hmVIuL12deOX
	ILlGkNPav/JBwKO6irwLPMsO9v2F/5N4OP0BKHUelUjSxLmmhnjwJEJ/5K9I5dn1z5NF46ByqWn
	p/W10zUoI5cz4EJBHybjY1xC4sfkkIgxWoqvhX6856Phfyi+UPNNhr6HDE3EeG4lONAXJ8mMV0i
	fric/BsCBmm5xU3U54cMPeLuuJhMvdR9BZZA5MRDFATEjNuxnB9+AznP1ofqgJ+bg9FWCv3oG+g
	VXI86lndQu3vbco/Vvtf2JZYVCTmY+28Gc2VyytSAqGpOZkV5Hr0/iSczrgb0mxS8DZfhF4g99D
	mmm+DPAPubFF6/Zu7gaHsofZVtBD9Q5Ze4Pe2qvkGdPDDuQZMFSpJCSR7oWIz9+G1xVIb8b3Arn
	YMH8g=
X-Received: by 2002:a05:620a:1903:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cd6d42cb58mr1372147685a.5.1773141919531;
        Tue, 10 Mar 2026 04:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1903:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cd6d42cb58mr1372145085a.5.1773141919105;
        Tue, 10 Mar 2026 04:25:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a660csm4062073a12.33.2026.03.10.04.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:25:18 -0700 (PDT)
Message-ID: <4df4b8f2-ecc9-447b-8a69-237c2a5841a0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:25:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
To: Alexander Koskovich <AKoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXwSPRRv6DSW9w
 QSAxrljXaaUetkOWprCsnHgh4n6mqGDrg5nD/0xMOdT+bIgn+hgqWO96wQFVSs5wxHQkQzxNoHq
 sTCzZvX2TwcQlnBgIJ6Om5ZVQC6B7FedCLZjAV//OXml+RtcGNYVbP7eKfI4bTo9SZE2tMeUu/K
 /MkBgx5abQ59QD10hfKj0rv26ikqivPrQJpDbf7ggPk12vwhhYnA3FIjtICZL9o+4KnSS9DIZv8
 Mx00Sz7Wm4oGHdsJFXgZbU+bY/FiTheqNxkmIR4RmLwxQcbRAQMEoEvcHj+iosrT3wFC3llsjnG
 ODPFRzRcNC9jT1DKtGdkup3pmABEBdHhQByibNvPRKRxgJ3P4SzU5b33lRdYcHNnwOURNlf+vAT
 Tzb6mtQgvuvoBplyRb8qL8nuLdPsEyT7UDxJIUat380SjlLyWwy+fCDRCRXA/EA2AyqDOsikpMT
 uuDBsiIi2qNI/omcctw==
X-Proofpoint-ORIG-GUID: liwfg9ds1jt27wlKp3jkQ1RPZ4P0x0-C
X-Proofpoint-GUID: liwfg9ds1jt27wlKp3jkQ1RPZ4P0x0-C
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afffa0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=b3Udb0O0c6O_2HRizlEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: A09B624AC59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96615-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 9:40 PM, Alexander Koskovich wrote:
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

> +&cci1_i2c0 {
> +	camera@36 {
> +		compatible = "ovti,ov8856";
> +		reg = <0x36>;
> +
> +		rotation = <90>;
> +		orientation = <1>;
> +
> +		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_ov8856_default>;

property-n
property-names

in this order, file-wide, please

[...]

> +&cpu7_opp_table {
> +	cpu7_opp21: opp-3091200000 {
> +		opp-hz = /bits/ 64 <3091200000>;
> +		opp-peak-kBps = <8368000 51609600>;
> +	};
> +};

This, as we've established on some other thread, is fine to put in
8250.dtsi

[...]

> +				port@0 {
> +					reg = <0>;
> +					rt1715_con_hs: endpoint {

\n above, please, to separate the subnode from properties

[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8008_default>;

ditto

[...]

> +			port@0 {
> +				reg = <0>;
> +				pm8150b_hs: endpoint {

ditto

[...]

> +&uart12 {
> +	/*
> +	 * Debug UART routed through a mux with an enable line on
> +	 * GPIO 170. The active state is unknown, so data may not
> +	 * pass through.

Hm? Is that software-triggered, or is there some sort of a debug connector?

Konrad

