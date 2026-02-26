Return-Path: <linux-arm-msm+bounces-94235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEJiC6jzn2kyfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:18:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C481A1B98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F1203085428
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC2387599;
	Thu, 26 Feb 2026 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFCyxMli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDcYbaOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8229E0F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090231; cv=none; b=t0JbjUTXuGJc6zLroohhbPttK1KIrYv7pZ9KoIC+f0HMW0XeXOgf/P9B95Nw7x+EWNDQiGHkMl3cHplKWOlZFqhcpy+nbm9q6l+Z3ejsebD70gAHPpRYkZwd8HpT13ZjTbNFQKcjhEJe2hNYZSC0d8vCO0pIfh+JhXjIz/AC+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090231; c=relaxed/simple;
	bh=6flWQk1pbvip657GBRbmRqdpWp/h2m26/hw8m23Bneg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAKVdunWpz5K5UcCVWMmCnOdSG+IOn7W3HbAC5z4tK9SRJwsEem1sP6lDnWg2vYoDiJSrPKjVieeOBiCqDMlo8fT3yS23AqfbunITyflgIcCXtvkdHTMQO+QmYt42rhbzJDPZbWPDz5i4zfUe6iMOYqZyIYQoSWcfLh/hqjJFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFCyxMli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDcYbaOr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V8gH918974
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lKbvnaLQduB8gYlpWeE/F2TN
	m9PMqhpsjL1+FKOfaJI=; b=VFCyxMli2s6Z6qUSphgCxHbwh0jZfT4IPzJBqsi4
	uAJ44iecO4f3hOxqKtNXeg13jgkVWV4kTjS0RFlpBX4NI/3s0dtNne5rYqSlMakm
	Aoxudpc3FQXSOfV1NPu7cjRHEPycq6rv/KnNA1bo1fEQvdnOgULkJEMp+A0//q2U
	1czofjH71cIoHFNJ1lhb8Qhfda8Dp8Lo+aNZnf8WsrliNsNqTf6m5UFmj3OdOne9
	IAQM3DTxEnVbITDYvxBkFPLWyqjbW41ZfCrYgaVGXUVfqKgJ6dSUTMMkMo+3orRC
	KnJoNPc6H90M1A25SQFniXh7mBEMLEiiTQhTRzPoNTs3oQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4t9fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:17:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so449369185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 23:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772090228; x=1772695028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lKbvnaLQduB8gYlpWeE/F2TNm9PMqhpsjL1+FKOfaJI=;
        b=DDcYbaOrvkmW0uGU+KW5MSUgyWVA0esQ5S1VXwqUMM1Chvn7x/SEsLl71xGr9sao9k
         MCQvnS5wf2k2b8ufhtici3TapBxg8sBulxNBkS6qFGQWQmTqHRnKwWcbFw/5ZSAhvWza
         wCZTigCwJPrVoDvZKM/sT53amSX8N42/IG/SEpqCBJyxqIWkynyWrAECaFbANKuy4xP8
         GHc4VX50Y4aLyKW16dBv37SrqRD5kL9hsCe0tYFX9CK5DUCxgMMuXgReiF5CCz+gyTgE
         f3J0Gf2O5+z9hDQ9pS29P+wHrdMq2/ZGJRcYq01XkMxjFg7K5PZkeJNVqZ04WXYGdKG0
         mjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090228; x=1772695028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKbvnaLQduB8gYlpWeE/F2TNm9PMqhpsjL1+FKOfaJI=;
        b=ws1HwnNnbLc7RET9+BwkJ82uPPO0tm19PssZqyQlbJfBliT08JxYtFPSH1+TOuRJim
         wkpLWlGjwibZreFqsiT+ORpj7Yopz6EE44xYD9l01HC6n2gX5swIHWEKFhLfXzykVLop
         hDdeFHS5tsxT7StMM3a6IJqztWhHOv83I7Sq3IQLvAJ2MGkE04y+/1TK+P/AhVbYhmGu
         4HwXi+rZRk3mxGuVzk8lqJtXXxGVno5nMMMFknCp/6ngsHyl5SbDQ8l0nqZ2l9LUk8AL
         y9OX9xpkTtGNn6o2HHBtkEWFNCYZ0OxUo4oJoVT9cDwjEmp/LpMQDgHn3Bi9z5llZc3l
         K1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUjAzAnBY/10WBP3RH6tjoRLkIdDtss+6NVNP/GzsWmIv5FTiNf/1swsL7I3U9xJY1oq50DJHZx283ICTHd@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0/BLFyVcHKJJ7b1YCNVXwQXTc0onTlse/LQpn4oGekOdnCSW
	ejjMAbHscGfxcVfAYvRb1bkfJHkx/54SBPFuCfhN4Gh79RXrRiWgBGRrvCRNccIRr/+NBTS9HYj
	zkw+7lfqK4N4xtOoYvSr+5F9E4xJAsRHbZZLcVg6pIFQhZSotXiPaMKc0BKoyhAOSQ8T9
X-Gm-Gg: ATEYQzx9ownHddkBRq2FulYgFkWvS0AIBog4GC9bffZ9KLnFlj/SlHT8powDWpTDoLQ
	qpJr1MUIR/UKubA4GkWMo7inKvl9WDa6rbMeTqUg9PJBQS2XknWxtrOChLRRTlS0o51E+KvQdx7
	IfjkWcWLAWp+1EnnM3pNTEs6/bQ0XFfkydvUgS7vltNWkR7u08Eo6wnixP7c6Qr5+SMcllhHwuS
	auXIrQuzJfWbiaAHK5A2vvSSSSkINpRrNBfHd5XS9aoAocsILK+DKyn5vWKgKTmKwq9a1SfP8N9
	wVjp+TaPfN6ZG0ELXiVQSrPw9yUv+0ywmHHO9KI7K1U7Ixl+ARgaKzf23UxHYoqdz/qToebbcQc
	0RjPb3hEpFcoOTivkcdE5+eDADPO3EezaO4y4JkAaLVgbhFpAIziZtMtYNclZWM6eydw4rfq8SB
	3L9JlE3tQaYJPSkROuCFRL8bG3Vj73A1xYIeg=
X-Received: by 2002:a05:620a:4445:b0:8c7:768:3b0b with SMTP id af79cd13be357-8cb8ca82866mr2343524085a.65.1772090227546;
        Wed, 25 Feb 2026 23:17:07 -0800 (PST)
X-Received: by 2002:a05:620a:4445:b0:8c7:768:3b0b with SMTP id af79cd13be357-8cb8ca82866mr2343521985a.65.1772090227085;
        Wed, 25 Feb 2026 23:17:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e01175sm484303e87.51.2026.02.25.23.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:17:05 -0800 (PST)
Date: Thu, 26 Feb 2026 09:17:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: add initial support for qcom
 sa8255p-ride
Message-ID: <pcztlwz7nxbvkm6rsbpot677k47novl65waimyfnptcuhnklxq@v5ncarkpnedy>
References: <20260225-b4-scmi-upstream-v4-0-50cfba9e6a0f@oss.qualcomm.com>
 <20260225-b4-scmi-upstream-v4-2-50cfba9e6a0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-b4-scmi-upstream-v4-2-50cfba9e6a0f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DpUrsVsviCn5c8lCPIX71JGLXunP4Flx
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699ff374 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=y2Fza8mD_UYm39aNRakA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MyBTYWx0ZWRfXw16VYCdsz9DO
 3mAprcniZEeeMbdGQ3Eg52ITWGaEQJMRomHLfRBXH7W6jJk0anELjLpgsGsupdLoRw+1r7vS8FR
 SgusPDW/LbhtRGYc2ocTnvyf2768pZS1PkQI4Jv3/xufQZkiy0899BjwojwSnIsiHtuuifvy28W
 Tlb8sNoKiqGKmlTyPanreSFsAI1fB4UOmSd7XpW5pIt0RPaM5d3l4z/d1DzrLJfLrM9ie6iOUOb
 tw5Jv26Ojlofui2xU/XiWrk2cLQkkPkx9gdFvxdpRtxwjHjt6d/8EnqHiYJOb1HiMgnoJcRZTKs
 /0eXRFmTyWZbkfLEkeYeQCXBKXv9NjkSzhw8dmgHFeczFpbAR/c7OklyydSHENTrQqmnQ9KPnMD
 S/cy9Hn7gh7EMYKqsqSCVLlLlsdYl2jbCVNHrfipbQ3uz2vN66Y8ynK44pW92L0Kt13wwF0PYcA
 oRWnAq8fGR+AAwGPlhA==
X-Proofpoint-GUID: DpUrsVsviCn5c8lCPIX71JGLXunP4Flx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94235-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96C481A1B98
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 08:51:07PM -0800, Deepti Jaggi wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Introduce initial device tree support for sa8255p Qualcomm's automotive
> infotainment SoC and its the reference board: sa8255p-ride. The dt files
> describe the basics of the SoC - CPUs, CPU map, ipcc, QUP,  geni UART,
> interrupt controller, TLMM, reserved memory, SMMU, firmware scm, scmi,
> watchdog, SRAM, PSCI, ufs, pcie, pmu nodes and enable booting to shell
> with ramdisk.
> 
> The Qualcomm automotive sa8255p SoC utilizes firmware to configure
> platform resources such as clocks, interconnects, and TLMM. Device drivers
> request these resources through the SCMI power,reset and performance
> protocols. Assign each device driver a dedicated SCMI channel and Tx/Rx
> doorbells to support parallel resource requests and aggregation in the
> SCMI platform server. Operate the SCMI server stack in an SMP-enabled VM,
> using the Qualcomm SMC/HVC transport driver for communication.
> 
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests. Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at LinaroConnect 2024.[1]
> 
> Limit initial support to basic platform resources, serial console, ufs
> and pcie.
> Defer enabling USB, and Ethernet to subsequent updates.
> 
> [1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> 
> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |    1 +
>  arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
>  arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |  161 +
>  arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 4861 +++++++++++++++++++++++++++

SoC DTSI should go to a separate commit.

>  4 files changed, 5103 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..facfe99c2d97 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -172,6 +172,7 @@ qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanin
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
> new file mode 100644
> index 000000000000..394f75bb376d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/ {
> +	thermal-zones {
> +		pmm8654au_0_thermal: pm8255-0-thermal {

This file defines only thermal zones. Why are they defined here rather
than in the board file?

> +			polling-delay-passive = <100>;
> +

[..]

> +
> +	arch_timer: timer {

Unused label, please drop.

> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

