Return-Path: <linux-arm-msm+bounces-91278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uINRBJGNfGkBNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:53:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A76B99AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB41D30479DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B992E7635;
	Fri, 30 Jan 2026 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnTqaFBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzwlspI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3B333453
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770286; cv=none; b=QQmu5IKbxLsm9buqEZN05TWnIxometZpwCv7rGXm9k5FbebM/hPpojXMtQIgwzP9IJav0kV3mBpS/xVHMXCF+K1qsuo+30J+fG5XxLHRMvLKfWjogmpjYBLylW4T6CEMQm5ZMRTOO7ow0kmtectaAdz8VIXJGtkSpbOZEPT/yWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770286; c=relaxed/simple;
	bh=Dn8lnhh99jM1jX6iZigNjJVFuOJ3S4TqfEgGccenSdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUqfJ5FVBQP5wRwjy3e58yGWNofOXyh8zc1g7HEUoiQ70wKMf/A39HoWIU6HF15T15VdFnRySTzCDA+957ingRAe2e1qCQU4Smo+foSqnlv2JB5OETmkv4nv2ZG/IrurTk3ThCls8WCCjL7el9Qde2g98rsI0SFy7UmSPAt1r3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BnTqaFBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzwlspI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4cBeM1826609
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Od3xu4xG1farH7/dI35XpMG679abBgT0utwXvRqauto=; b=BnTqaFBuGiA65fmy
	LVh/2YqdeuC8XgrshB39uiB9PVXftYYGNXCKd4uzkOWJcdUGYrWFcDPsOBlQGZ5Q
	NJ7tZMRN/VGTonuqBt0PR6gAz/R3ypH2NyVzOIJyro5hv6eAo5Glr+3YMPSb+C4p
	yc5OKpi4IPk7El1w1y6J8gw17Xu18eHsInx2usorhdOqFqBVbRJ6b+K15+MjIlnX
	ZFa6T3SQXIh0F5jUozq6cKcphB1eWCP+tUH95+OFIA77zNDjNee035+vNKSiTWGt
	3kiyi2oPD+HRCsFcoW5l23pJlXgc8XZDndCs18ZL/gUE7HQuJmLp6sNFQYlu06vc
	ksfNUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsms2bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:51:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946ebb51a0so6602216d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770283; x=1770375083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Od3xu4xG1farH7/dI35XpMG679abBgT0utwXvRqauto=;
        b=HzwlspI17cfZBOUuPkG54BgJbyjoPZQwItQmqzuk2JEuEB/UulMMV6IYAtHqZgAdkB
         Wtx8JXy8ptJQZeawfl05iyIwVSLuWjhK7B6E628eWNGqFHBl32OZnuDwbXbrZ9KUIsoY
         p1HLHrE+JnQLN03JjzNI3abHjzVNdIJPbbQlGg+kI0UczOmz0sQIkstoj1qH1K3BTagW
         RONS3eXSqly6Yc4qnVBefnHrR0k5FRMJAiyJk8cuKwEr3Ttlngaft4sZtiNk6IF3BxPb
         IZS2bpdRXJvG1hwTUWMLenU//vFiYxWhe+ULmvFGa2xjDsUdOHQHrZgvLi1wuSPDku6X
         WsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770283; x=1770375083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od3xu4xG1farH7/dI35XpMG679abBgT0utwXvRqauto=;
        b=eJj+d7EAVEcR1ICY93B7vuzItIqSQHkzvgmlp7VhcP6SMVFWJLUmUnUI8GbNsuGX1D
         RKDS0IJq4KzcUaPO2dAgqV8oTtCfjEGJLJa1tqzFVKwrIMT00eQhRQa7CXpgbY+7/eco
         Cb65udaF8wscuM1Y8s5JN6KhQKlYOTQPigXrxSVTOrGAJeSK83Aqv9ih0+HegzoEDCfk
         Ymyhu75EF4I8N9sioCwTQ/XdlKogQDxyDdU0JnPzPgIFsW06ujrmVirg9TckmMGNJz5Y
         0DGQDKzA1zoSYJvHSgezsJ9DUlnZpohJChQprnJ/oA0GOxT7ax4dZOKL0fcNRmoOvnza
         +pAg==
X-Gm-Message-State: AOJu0Yx2cMsXO7aiSucdaZ4+N+2uTnzxfhbTxibLvww2oXs4nvwL5F30
	zXR5s6YS+dDsFv+X8NGxDHFLloWKey+A/NzyTuUTdAwNOz6gSU4DfSgHbAhSpzzHRrFy5eWMouZ
	jYXm5RFBLa6VTZVm9ubM5eaPZpnnFbcFr2lG1tPLJt2kE1VMbry1AyjnztTYu/VjiRYD5
X-Gm-Gg: AZuq6aL4Xf6XdxSflNsbAamwe8JpGVz9wIo0/Rarc4zQZohSwMlKR1+OenSzZpcHErc
	3gIm//BGe1zGcALYELhf1WwfbKx1NopitbRzN5c/KoY7JGL+s/gQ9CWPFEqRpRstoXM/ZfN3bHZ
	O51MSHqIuM98vuuLyq9tC4muD+MDVsVrX3UK3eFJauv44kB8vjPbTKMhT/ZBkv2pPhZl9NTGWbv
	DXuiDd3sjfaoeZGuDQe3Rk5W0JhZQZQW+Wq5j+YH9JtQAARSm/FfEixyWKFYy4S97qACUZjbS8c
	6dFTj4Qe3iKS0/oWIFyWEjrv7crA3wq3B1prEe7kR9E6y56synNkoNwUKtaoPirgFB9j94i/UXL
	us6/imB1h+1jRS6CzawWumICLWZcOC6ypZDq4siCmTXqCj3hmZ5Jf7anz63xWCW16Obg=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr266165785a.1.1769770283185;
        Fri, 30 Jan 2026 02:51:23 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr266163285a.1.1769770282674;
        Fri, 30 Jan 2026 02:51:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf18498fsm418789966b.41.2026.01.30.02.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:51:22 -0800 (PST)
Message-ID: <27c91542-820e-49bd-870a-d492be21958a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:51:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
 <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX8nlLi0Jbbj9Y
 MrR9FPZMdLD0wJ/EdXhX6IRvuJKhcj4eJ+0hCHep1FMlFvyVZeJL8laHtJKt/gkq6fF182Noyu8
 HYvgXM09dyqFZKiTxiMvnpFboFWRF/VS/VqQSgcobdsCB2Ig5AyHO6aevhP09qfGyu38L5Vl1nY
 G0FUkqBTEDnDGHMYZTTkdNUxY5CXREyvAqGgEjCO10XRm8ZTKQtbGow46a1dhBK/IKkP3WKFsWG
 76K4UgI511S3j1bh0WXOJorxyhUmLadOtLt5FZpugyM69S0c1FJcjXxxL5jdQv1mxfj9PlkGFWS
 xuwUZVO5dPqgrMHWRSQDijg7KQ5RSDUWg/CzE8QCbSAzmIFz5XSCUTNrmub8of5D+skcvCI4gEu
 5fzYYYVuthjMq7VWZyEt/4xwM4rgJwxFa4BpAuHgkQrv5CvOvkcv+KYuSHSC73L1ET5cungln0P
 TWgajHe/FlYSOd5u4JA==
X-Proofpoint-GUID: MQRg3yMiNEqJkPDtqXUNGkjU4wUj2J0I
X-Proofpoint-ORIG-GUID: MQRg3yMiNEqJkPDtqXUNGkjU4wUj2J0I
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697c8d2c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OyFC6F_nvQZ7iwIFy2UA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91278-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69A76B99AD
X-Rspamd-Action: no action

On 1/29/26 6:28 PM, Umang Chheda wrote:
> The Mezzanine is an hardware expansion add-on board designed
> to be stacked on top of Lemans EVK.
> 
> It has following peripherals :
> 
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>    - 2nd DSP connects M.2 B-key connector for connecting cellular modems.
>    - 3rd DSP with support for Dual Ethernet ports.
> - eMMC.
> - Additional 2.5GbE Ethernet PHY connected to native EMAC with support for
>   MAC Address configuration via NVMEM.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.
> 
> Add support for following peripherals :
> - TC9563 PCIe Switch.
> - Additional 2.5GbE Ethernet Port.
> - EEPROM.
> 
> Written with inputs from :
>     Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../boot/dts/qcom/lemans-evk-mezzanine.dtso   | 301 ++++++++++++++++++
>  2 files changed, 305 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..79449004adfd 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -43,6 +43,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
>  lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> 
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> +
> +lemans-evk-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
> new file mode 100644
> index 000000000000..a0dc6daec754
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine";
> +
> +	vreg_sys_pwr: regulator-vreg-sys-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_SYS_PWR";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

nit: usually we put these at the end

[...]

> +&tlmm {
> +	ethernet1_default: ethernet1-default-state {
> +		ethernet1_mdc: ethernet1-mdc-pins {

You can drop the labels for these inner entries, as you never
reference them

Konrad

