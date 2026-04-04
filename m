Return-Path: <linux-arm-msm+bounces-101813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOt5MqSA0WlAKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:20:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C984139C93A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC4AE300407B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BD133506C;
	Sat,  4 Apr 2026 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSdlrGgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVAXZTT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCFD34D4DE
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775337630; cv=none; b=gOlRdI+gV/lA/HYGIlx6653DHhc3XVq0NObR0YbDZyMTM185Qjgzvy6G2u6oQSwgXKOCeD6l4Q3VLYBeqWEqc8PD/5s2D9o5sY+Ii4Y61s5G7v+ofh/WC853bMqQaAFfs6+1Jm72NBXD40QxVKy7JSA1j4gVsWE7XvuJgr3ZbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775337630; c=relaxed/simple;
	bh=86IqzJbt9K+3T1/fzMabHzZ95KNZ4Pm/F46MfqdUCEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLSsGlLEMNj1mWkKKqk1f7RwQjCof/jMMpHBc0auOHB04usjWPalQDJ2axZYzcBK6JhSMdR8ww54e4M3JIPliz/Mp0HWcMgaLRP1qxi1Q2Mm9ujEBodTsNcflQbuPocVpZHgAdozgG0gqC7Lag3F6cAKr77/veDAoy4d9FpoSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSdlrGgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVAXZTT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6349MpXQ3291003
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kz1ZI1aQQuafNnFf8XqHqgFn
	i6hHm50s0P6SseUjs2w=; b=jSdlrGgWlvAIW+zfDgqAgN7zUkLQpLvSncbziBUs
	7MKlsFPebqCbigu/KX+pRiecaLoEfj736xi27R2yalOLtCTtV6UmFY/5mEQejOm5
	5Xj9bVD+PuwFI9GdsDh2+NFcceTSbtNIScQEc5SAstn3kg7MtcMsokyQrphimcHn
	SXm1f9jppBuFN1rbSzuT/1lTB0PA4IDkkmIV8jo/MVk75c0Jkr9zYKsZSIrVyX48
	E5lrANJpkkCrOkIaZ2Tg2kPaDpiK00iQIgVYu2i9XGECqgAnkReS/kw3uZYBPZ7L
	pseAl9fJDMUMURtliICXtANzPLLp9G6SMywlZdayn56RFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrhmr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:20:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89fd9daa423so72402046d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775337627; x=1775942427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz1ZI1aQQuafNnFf8XqHqgFni6hHm50s0P6SseUjs2w=;
        b=LVAXZTT5SnTkH/uDCLHikK4QFQ/hrhoxN5eR7+nPz58hkPr2cp+mKTuwhSIPSmQR74
         LSXzlYliG6xhDLjYWWrZAtIVSi8gDRcYxhQc8MRYQBWyPhspay2Pzd17JLIhwlM3BEKI
         0lVFUM1wfoIGdrlVP4JnSF3laWSAvqaYA7QUWr9uLYovmG9G9XdIT+Gvj10QXEpw4dv7
         TCc20hc2A9q/u+GhW+xvgOd6YoineqDQE2KqtrLgNBzQ8UIGLTlmDJFf2XM1XNN9Mh89
         js2O9QCd/Ir/U4EyOQD+z9ok/+EOefK37fkKhjkDDah4xuwHvU1WZD1FklHcUP6rPccy
         eZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775337627; x=1775942427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kz1ZI1aQQuafNnFf8XqHqgFni6hHm50s0P6SseUjs2w=;
        b=EM1aHFF8SVn5U9MiEtdqXZY+B9FUrKuhqRYrQK50zY5Uuo3Gx18vJ6h7nUnjR/iiFL
         p/YI9TOIDVMnFNkrj+EI7WwqvQ7SBC/thHrgdOOscjGsW3FjcM5NbjBHxxOS500TAFz0
         YvajzC8ZcSitF8TU16YrqaM3UjNTB6rHkkB6rLLq2vE6w4yjz8gRzXFNgA7iCGDlaTKT
         4EDSoUmyBYKiY+cEVqkNTUM7dZAMqBf5yMBdX4N1v89wmdFfWFsKaSrhWM1cRaehJQzl
         7fIum0GH4gCKIoGM5H1GJVhIC7LvNQKnzi3EXN0ZS3Fcgd2HzWgIxQuunCDIIjKWlvwL
         ZJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAmCytuLx6q68kgge05ULeoCn0E/q+u4PxGP74PtPlN0Fq2W+5fYxkbKADVp/txTmjySN4EIPw8dR14hOp@vger.kernel.org
X-Gm-Message-State: AOJu0YzlI/eWx/SRIqn9BRK6uK/YTCNtmbaNXuLXJtutPlCR8amYSC3Q
	skleKilsKx1CNwVAxSAohxvD+L+QFUyiB2ulTmBJJpGCw89fb4BCXy8C9w6bXzG+CKlvXazViJ5
	pcr6MTqNvsX1gSsdPKqpndEGilp8rFjI6OF96ngLWPWCpzsvFL74+FnEdIncRk5Kz/gZw
X-Gm-Gg: AeBDiesPYOcWvLXcqT1VqlkmFhgeBx0WTTlz4nWK7h9yXwwzEiWylLswEee4kFL600I
	b+rYnJbsLtW5aNjB57Q7KfWLggtfoTeeKA2h680HYy/SYGmGMPNN4ikgtcldqlBjBIKgQj8fJKG
	AhvCBLQ5NkuQbNw3YdgutinKsrQMk/IOJtDcXZ8edlMQlvVjY8U2avTFPtr7hMy1OmXtck+ZW0O
	pSwbTbIumVkL+ZwI7ySzxPhGwBNKJBWMRJ78LwGho1g2oUV8wPu5RpJY+wpxx6HHswCYTlYOR67
	0GfMQfZpq00kl+/rq50g5a/5WpRcxjjKhNgQkLDe4ohG0mZVwzOfIPcOUb6PIpUhLXixfRV24yI
	hHbCalBdlAKHfdDUtCA8B93wXFgSQsFPm8W4KrcD39nhleZlBY/Z165GuRC4CeX0r7aYcw++E2A
	u4JdDRYDyPpWslEP+K59tNgLDMj6s0zP1Szdw=
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr114348831cf.55.1775337626484;
        Sat, 04 Apr 2026 14:20:26 -0700 (PDT)
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr114348451cf.55.1775337625921;
        Sat, 04 Apr 2026 14:20:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccc83sm2305767e87.65.2026.04.04.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:20:24 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:20:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d1809b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=zpOVymEVAAAA:8
 a=8n8SyL_cAAAA:8 a=h77gEMGJAAAA:8 a=nSs3JoQKVfnq5iHCGj0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=LCD48ZUe64JR9pieE8wa:22 a=-K6Y0kWoOJXvxDHPO-NO:22
 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: _wzi7HaTWHxg0yRbbVCUgUKwNAVeEtvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwNCBTYWx0ZWRfX5vzQ+lEsnApQ
 5mBTSX+vak6BhFsMUx3uek1g8ENTZ4G4s8/c2T9IHnl5xaoBl52HNMJjHGeQZda4Zq3zjODGsYy
 34ulmet+kmZP8SuzFozIMBcRS6saH9BliLf0sYA/962gmvtUGfTQ4JKWWPlv4Lh5Y1q1QdwdNiv
 ECZ2Qg0tmI3bq78SCC2718ZSUsWJABgxp11NIQDEzBm1dFf6pZVbGEqzjexmEta3hQ4pDKCcMLj
 fCChAJSaliFWCfdIib6FvPWgNaP33vMh0ir8ty9lrzuExwBmrA9bbA4jJTbJP9HcV/UZwXxxbDZ
 vi+w6mKDNFGzmkfrEePaJMWiGbRJHITGNPaOr+5p232/eTQxuUPxZzSczpzkOaZoenxSYhQwcZm
 IZPyw239JSsiRccJ3q+uKDNPLMZ8AuJpXknDhZMEZhLk5GAVvcp4uEn0ZVVwC9QXEeuGVRunLZt
 klJGKwippoqIV5LPTYQ==
X-Proofpoint-GUID: _wzi7HaTWHxg0yRbbVCUgUKwNAVeEtvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040204
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101813-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.2:email,thundercomm.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C984139C93A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:50:58AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> 
> This change implements the main board, the vision mezzanine
> will be supported in a follow up patch.
> 
> The main board has the following features:
> - Qualcomm Dragonwing QCS8550 SoC
> - Adreno GPU 740
> - Spectra ISP
> - Adreno VPU 8550
> - Adreno DPU 1295
> - 1 x 1GbE Ethernet (USB Ethernet)
> - WIFI 7 + Bluetooth 5.4
> - 1 x USB 2.0 Micro B (Debug)
> - 1 x USB 3.0 Type C (ADB, DP out)
> - 2 x USB 3.0 Type A
> - 1 x HDMI 1.4 Type A
> - 1 x DP 1.4 Type C
> - 2 x WSA8845 Speaker amplifiers
> - 2 x Speaker connectors
> - 1 x On Board PDM MIC
> - Accelerometer + Gyro Sensor
> - 96Boards compatible low-speed and high-speed connectors [1]
> - 7 x LED indicators (4 user, 2 radio, 1 power)
> - Buttons for power, volume up/down, force USB boot
> - 3 x Dip switches
> 
> On-Board PMICs:
> - PMK8550 2.1
> - PM8550 2.0
> - PM8550VS 2.0 x4
> - PM8550VE 2.0
> - PM8550B 2.0
> - PMR735D 2.0
> - PM8010 1.1 x2
> 
> Product Page: [2]
> 
> [1] https://www.96boards.org/specifications/
> [2] https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |    1 +
>  arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 1610 ++++++++++++++++++++++++++
>  2 files changed, 1611 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4ba8e73064194926096b98b9556a3207e8f24d72..f8c65771f76629d7fafee15ac8d7bb62cd24a20f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -184,6 +184,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..280fbd3a09997e3e2613498e25ac188680484cc4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
> @@ -0,0 +1,1610 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Axon Enterprise, Inc.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "qcs8550.dtsi"
> +#include "pm8010.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 5
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +#include "pmr735d_a.dtsi"
> +#include "pmr735d_b.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS8550 RB5Gen2";
> +	compatible = "qcom,qcs8550-rb5gen2", "qcom,qcs8550", "qcom,sm8550";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		clk40m: can-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <40000000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
> +	/* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
> +	/* Workaround is to use bit-banged I2C */
> +	i2c_hub_3_gpio: i2c {
> +		compatible = "i2c-gpio";
> +
> +		sda-gpios = <&tlmm 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "green:status-3";
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pm8550_gpios 2 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-1 {
> +			label = "blue:bt-power";
> +			function = LED_FUNCTION_BLUETOOTH;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pm8550b_gpios 7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "bluetooth-power";
> +			default-state = "off";
> +		};
> +
> +		led-2 {
> +			label = "yellow:wlan";
> +			function = LED_FUNCTION_WLAN;
> +			color = <LED_COLOR_ID_YELLOW>;
> +			gpios = <&pm8550b_gpios 9 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "phy0tx";
> +			default-state = "off";
> +		};
> +	};
> +
> +	lt9611_1v2: lt9611-regulator-1v2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		vin-supply = <&vreg_l14b_3p2>;
> +	};
> +
> +	lt9611_3v3: lt9611-regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vreg_l14b_3p2>;
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&redriver_usb_con_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu_in: endpoint {
> +						remote-endpoint = <&redriver_usb_con_sbu>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	pcie_upd_1p05: regulator-pcie-upd-1p05 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_UPD_1P05";
> +		gpio = <&tlmm 179 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vdd_ntn_0p9>;
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		enable-active-high;
> +		regulator-enable-ramp-delay = <5000>;
> +		pinctrl-0 = <&upd_1p05_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	pcie_upd_3p3: regulator-pcie-upd-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_UPD_3P3";
> +		gpio = <&tlmm 13 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&pcie_upd_1p05>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-enable-ramp-delay = <10000>;
> +		pinctrl-0 = <&upd_3p3_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	upd_reset: regulator-upd-reset {
> +		compatible = "regulator-fixed";
> +		regulator-name = "UPD_RESET";

Reset usually isn't a regulator.

> +		gpio = <&tlmm 182 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&pcie_upd_3p3>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-enable-ramp-delay = <10000>;
> +		regulator-boot-on;
> +		regulator-always-on;

Especially since it's not controlled.

> +		pinctrl-0 = <&upd_ponrst>;
> +		pinctrl-names = "default";
> +	};
> +
> +	usbhub_reset: regulator-usbhub-reset {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USBHUB_RESET";

Same here.

> +		gpio = <&tlmm 41 GPIO_ACTIVE_LOW>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		startup-delay-us = <1500>;
> +		off-on-delay-us = <1500>;
> +		pinctrl-0 = <&usbhub_rst>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_0P9";
> +		vin-supply = <&vdd_ntn_1p8>;
> +		regulator-min-microvolt = <899400>;
> +		regulator-max-microvolt = <899400>;
> +		regulator-enable-ramp-delay = <4300>;
> +	};
> +
> +	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_1P8";
> +		gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn0_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <10000>;
> +	};
> +
> +	vdd_ntn1_0p9: regulator-vdd-ntn1-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN1_0P9";
> +		vin-supply = <&vdd_ntn1_1p8>;
> +		regulator-min-microvolt = <899400>;
> +		regulator-max-microvolt = <899400>;
> +		regulator-enable-ramp-delay = <4300>;
> +	};
> +
> +	vdd_ntn1_1p8: regulator-vdd-ntn1-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN1_1P8";
> +		gpio = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn1_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <10000>;
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "QCS8550-RB5Gen2";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&left_spkr>, <&right_spkr>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;

swctrl?

> +
> +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;

swctrl?

> +
> +		vdd-supply = <&vreg_s5g_0p85>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddaon-supply = <&vreg_s2g_0p852>;
> +		vdddig-supply = <&vreg_s4e_0p95>;
> +		vddrfa1p2-supply = <&vreg_s4g_1p25>;
> +		vddrfa1p8-supply = <&vreg_s6g_1p86>;

[...]

> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcs8550/a740_zap.mbn";
> +};
> +
> +&i2c_hub_2 {
> +	clock-frequency = <100000>;
> +
> +	status = "okay";
> +
> +	typec-mux@1c {
> +		compatible = "onnn,nb7vpq904m";
> +		reg = <0x1c>;
> +
> +		vcc-supply = <&vreg_l15b_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_usb_con_ss: endpoint {
> +					remote-endpoint = <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_phy_con_ss: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +					data-lanes = <0 1 2 3>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				redriver_usb_con_sbu: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c_hub_3_gpio {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 40 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c_hub_4 {
> +	status = "okay";
> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";
> +};
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

These two should be a part of sm8550.dtsi

> +	firmware-name = "qcom/qcs8550/ipa_fws.mbn";
> +
> +	status = "okay";
> +};
> +
> +&iris {
> +	status = "okay";
> +};
> +
> +&lpass_vamacro {
> +	pinctrl-0 = <&dmic01_default>;
> +	pinctrl-names = "default";
> +
> +	qcom,dmic-sample-rate = <4800000>;
> +
> +	vdd-micb-supply = <&vreg_l15b_1p8>;
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> +		    <0x100 &apps_smmu 0x1401 0x1>,
> +		    <0x208 &apps_smmu 0x1402 0x1>,
> +		    <0x210 &apps_smmu 0x1403 0x1>,
> +		    <0x218 &apps_smmu 0x1404 0x1>,
> +		    <0x300 &apps_smmu 0x1407 0x1>,
> +		    <0x400 &apps_smmu 0x1408 0x1>,
> +		    <0x500 &apps_smmu 0x140c 0x1>,
> +		    <0x501 &apps_smmu 0x140e 0x1>;
> +
> +	/delete-property/ msi-map;

Why?

> +
> +	status = "okay";
> +};
> +
[...]
> +
> +&pcie1 {
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	iommu-map = <0x0 &apps_smmu 0x1480 0x1>,
> +		    <0x100 &apps_smmu 0x1481 0x1>,
> +		    <0x208 &apps_smmu 0x1482 0x1>,
> +		    <0x210 &apps_smmu 0x1483 0x1>,
> +		    <0x218 &apps_smmu 0x1484 0x1>,
> +		    <0x300 &apps_smmu 0x1487 0x1>,
> +		    <0x400 &apps_smmu 0x1488 0x1>,
> +		    <0x500 &apps_smmu 0x148c 0x1>,
> +		    <0x501 &apps_smmu 0x148e 0x1>;
> +
> +	/delete-property/ msi-map;

Why?

> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l3c_0p9>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +	vdda-qref-supply = <&vreg_l1e_0p88>;
> +
> +	status = "okay";
> +};
> +

[...]

> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs8550/adsp.mdt",
> +		       "qcom/qcs8550/adsp_dtb.mdt";

MBN, please align vertically on the quote mark. The same for CDSP and
modem.


> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs8550/cdsp.mdt",
> +		       "qcom/qcs8550/cdsp_dtb.mdt";
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/qcs8550/modem.mdt",
> +		       "qcom/qcs8550/modem_dtb.mdt";
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

