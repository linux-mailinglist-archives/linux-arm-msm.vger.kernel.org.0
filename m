Return-Path: <linux-arm-msm+bounces-96364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGWAC2gvr2mWPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:36:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF2A240EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65D2A306C462
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E309F262FF8;
	Mon,  9 Mar 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijo7Qj+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJyGUBPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC382368972
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088464; cv=none; b=Q01bWAY+7KRWHAm2Ypld5rsnYTQAaHmxJj3PYPQI9wSVigjGbc+z5AopT4y6vrVj91jt8RteN85AVBCkHu8iOEKryfcAvG7/qDF8EP6yVJJ5dMAC1H3MAKx1kKmxYfDXga1lp+DXD5oPx4DX4+wie5xI9NB2MvVqAzlY+GfiUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088464; c=relaxed/simple;
	bh=Gfh40nFIc1xbRD/JUSB3S/Qzs9+tS8XAdm/Iqkz+S3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmJl8pwcWaept+SZjeW5tkNe4Fo9Aa21/Pct0iQFl6T4gp7BaXN5DPJ8NrHoVI28yH7sIajI4Tm/t4MGDVFex4XyrlhrcaaRflQL9hMASx1K8sGYH3xJxuJXW9jp0Xb2kLJEH+Do/MSzAnQjebyodl5tqKekB/ffl/WBKCIQ0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijo7Qj+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJyGUBPZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC5KK3280630
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e22jJVs5Vi/WQJ4HEx3MO2Y1
	yTgEvou+OrZknzwHnMY=; b=ijo7Qj+zl6EPKfc6W2JOOYJRYyp278aj5dEoiD+g
	wo68l/XRIIANJZPxqJ7TGE4aBCoyOnrEbfBWVNT+3R5BVsPamM2tOqAU43EUeAOd
	eXEugHxwmWxNiCbfOzIlexN+JybM7iFtGXgnVlGDMVQCerJd3Z0fr+yoTi2GZiXc
	ZQTHbFg0BWDXkX7n8bywY48HUInQAvkpm9+S59WgCVxxS8eRjpJvuYzkk5Q653NF
	r6LWPyVOYeBk4Gez2eDOvUaXdqFe9g9cV7NJYbHXdQEv1NznrukbiL2ipg0ylO4+
	EEpuELkAtXspTrlnJwxHAB6VEYZgX7mf3PKON+5ffBWuvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb51y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:34:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7d4cc049so2029448685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088460; x=1773693260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e22jJVs5Vi/WQJ4HEx3MO2Y1yTgEvou+OrZknzwHnMY=;
        b=WJyGUBPZxhk/HFM9OwjSkP3BgYjxZ8lA2WWrd2UZyEW3yf14Gz1uTaUHy08L2WBFGB
         ZNpzEjGdTEtSqjJCrK0IIfoM6oEIar0gHvCpg9I8qd4FT+KcSbRGuJVT+TcaiS0W9/oe
         ulRZIgo0vHjw7cm0hvRhfFPLAZCmlMI+Z4iu3w5f7N+EhPTE3gwyYpoH/6zZBAKEkk+f
         XBSLtQvQWNY0Qy0uN2wv7x+FpM9XEI4TWRZ8NM1Ipx4BT6H3ADw4Q6i5Bi18vih4iGBW
         Uw+GClujph3gOj4qvupiH0bnFWFKgP2fejjBI+NXjtJjzLQ8/jJi1We5ixSdtXtrrLi4
         agTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088460; x=1773693260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e22jJVs5Vi/WQJ4HEx3MO2Y1yTgEvou+OrZknzwHnMY=;
        b=PbowdTZzJB4FQC5wsMP157DVGBL4jo9iKWOWkwHJULMWtGEFfSm/cdYI3Qs+YuPz1g
         jLs2xEw9qXS5Dhti/iZU/DOLMJEfMLq6Zms3Gt1keGglJOVExXGEWoaZtgMRy94qWdih
         EhT0Vy21B3jbVraojTDgXVODArOH9uowhO+5kF8A1eQu9uy1mwRnmj4R5k+bEn/yHLzJ
         6F14kuNuEdQ9lMKEPKeIzNIqk/SaHIheIpndkkpERfi1u1jdTVDVpN6VcxmzodoIcapH
         iDi+ewLQEPv7ywHXz0TOSJiupegStMRMBUhMtAg0cP8W+ePv73foWHda2UevlhymFeOO
         RbtA==
X-Forwarded-Encrypted: i=1; AJvYcCVgtkPk9lXPa2T5t6KBYknqu7Kq7a2eJUu6eH1QFIq6FkiLVe36hnf9kGMzSNoNvzpAZQ3vS7uETt1mNTX+@vger.kernel.org
X-Gm-Message-State: AOJu0YygT2NCClxGkxHpYqIdsEfY5AELGFiUtl2csmg4Y/YTdfoiHoB8
	wBi5MIyJsXnPqroOHB12QOSRvFis/uB7crEoc6/OJyWzEIF5H4ZaWIpMiwlVivHUg/BGcinhJJy
	efTJmG2ebDNJOD+Luq/orysfgZ//4PmFfPShNWo/ASfcO6Yzhtp3ymr42TpjRczgCel/L
X-Gm-Gg: ATEYQzx0XnQ32A86jZFupB0OH8EzV7DgNsE31wS+8QDP+LYKFzo89PEM2TT0/aOEAbV
	OumYFphd2gHrudvrcM7inXBfstUCZBiwhAN12pINhbrLgVrHgeNp3BgApaE8m8aQRN0RUadgm3l
	7fomYRFAhJ27hkJdZwh4EdqNR6PL60iy7Av8cKbXoVPH9vw0dOuY/oB++8fT0iMUuNZdT2m1yK5
	l/HZgw6yL2HVpE6cE/+/Enlt0MYVfMeX4sxJMug0OhIVTA12Ns5x44BnvyoZNnoGXP+1xopWZyg
	MuymK2BODd4cokBs9UFaqHukb8WTe4XFUESa/Zb698G73FujnQwWtAwBrU5pAD6vaY3921V9B3M
	5JjtJOj5ElygSswlq1MgoZA5I3OHHT/L27wXcD6mEp1Sn42S4MQvj2tkT1MCy0kcvledHHn2m3s
	L2ypjz7daOlql98IX5TwgOqsqasVNF1BU0oyk=
X-Received: by 2002:a05:620a:2995:b0:8cd:83d2:cad7 with SMTP id af79cd13be357-8cd83d2ce1amr722140985a.33.1773088460037;
        Mon, 09 Mar 2026 13:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:8cd:83d2:cad7 with SMTP id af79cd13be357-8cd83d2ce1amr722137985a.33.1773088459504;
        Mon, 09 Mar 2026 13:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cd7fsm2327867e87.19.2026.03.09.13.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:34:17 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:34:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
Message-ID: <pu56z7dorbujx57yzfclcncrj4zwgtv3gshntnlpxcpbunxsiz@2rckwcyjgetg>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfXy6Zo58g+1UCt
 G+uFudGGM1rOcO8JermWkzQcy/vg7ukLIiw45vwg4mckfrWNkxo+Tb0m4fE39naPmWbI1icWeT5
 6/SKxSIuX4vcmb8Xqppm+1+3ycqhwbL2tUXmxS7pkRzSEyKrHakJ5pO1mnf6fFQ3kPqkJcCp4be
 aRN+DYM67+eMxBl/8btQAz25Df7onOvSQKiFeHOrKwMgsOMvD8JFdfbJ7CCC7PJPtwHeogd7XfS
 PuobIFK0cjkN5zaUCF3D/vZhmiD/X0KaBs5fXqXtx1bprsuNdE2NVUaX5LoZsTGKGtC4nW+1wLH
 tIk1xVMYjJD36Wva8wNYPAthK0DDJAtv81y2ex9SCqofUiVVlqHkBjruOADaRaa/gQnR9DmNo+b
 eLQUMoR2FASjx/8l//4NPW5Vpbyy1ji406mp+FNS8KPbZPktXyj2+bXgIK1ulZwxLp78LbXf/a3
 9d5N6Acg2PpZaX7J0dw==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af2ecd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7y0UcImRt_ijhTAU5DAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6pvvyvLWTycYGts4LQS_kvr9enNmtWkQ
X-Proofpoint-GUID: 6pvvyvLWTycYGts4LQS_kvr9enNmtWkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090182
X-Rspamd-Queue-Id: BCF2A240EC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 08:40:44PM +0000, Alexander Koskovich wrote:
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
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts | 1328 +++++++++++++++++++++++
>  2 files changed, 1329 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..cca71c3884f6 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-asus-obiwan.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts b/arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts
> new file mode 100644
> index 000000000000..e414e36e859a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts
> @@ -0,0 +1,1328 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/usb/pd.h>
> +
> +#include "sm8250.dtsi"
> +#include "pm8150.dtsi" /* PM8250 */
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +
> +/delete-node/ &reserved_memory;

It's a nice approach, but typically boards just delete reserved memory
nodes one by one. There might be other reservables...

> +
> +/ {
> +	model = "ASUS ROG Phone 3";
> +	compatible = "asus,obiwan", "qcom,sm8250";
> +	chassis-type = "handset";
> +	qcom,board-id = <40 0>;
> +	qcom,msm-id = <QCOM_ID_SM8250 0x20001>;
> +
> +	aliases {
> +		serial0 = &uart12;
> +		serial1 = &uart6;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4360000>;
> +		charge-full-design-microamp-hours = <5800000>;
> +		charge-term-current-microamp = <200000>;
> +		constant-charge-current-max-microamp = <2750000>;
> +		constant-charge-voltage-max-microvolt = <4360000>;
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_default>, <&hall_sensors_default>;
> +		pinctrl-names = "default";
> +
> +		event-hall-sensor-case {
> +			label = "Hall Effect Sensor (Armor Case)";
> +			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_MACHINE_COVER>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		event-hall-sensor-dock {
> +			label = "Hall Effect Sensor (Dock)";
> +			gpios = <&tlmm 121 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_DOCK>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	qca6390-pmu {
> +		compatible = "qcom,qca6390-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>, <&wlan_en_default>;
> +
> +		vddaon-supply = <&vreg_s6a>;
> +		vddpmu-supply = <&vreg_s6a>;
> +		vddrfa0p95-supply = <&vreg_s6a>;
> +		vddrfa1p3-supply = <&vreg_s8c>;
> +		vddrfa1p9-supply = <&vreg_s5a>;
> +		vddpcie1p3-supply = <&vreg_s8c>;
> +		vddpcie1p9-supply = <&vreg_s5a>;
> +		vddio-supply = <&vreg_s4a>;
> +
> +		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p7: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p7";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hyp_mem: memory@80000000 {
> +			reg = <0x0 0x80000000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_aop_mem: memory@80700000 {
> +			reg = <0x0 0x80700000 0x0 0x160000>;
> +			no-map;
> +		};
> +
> +		cmd_db: memory@80860000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x80860000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: memory@80900000 {
> +			reg = <0x0 0x80900000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		removed_mem: memory@80b00000 {
> +			reg = <0x0 0x80b00000 0x0 0xb200000>;
> +			no-map;
> +		};
> +
> +		camera_mem: memory@8bf00000 {
> +			reg = <0x0 0x8bf00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@8c400000 {
> +			reg = <0x0 0x8c400000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@8c500000 {
> +			reg = <0x0 0x8c500000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@8c510000 {
> +			reg = <0x0 0x8c510000 0x0 0xa000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@8c51a000 {
> +			reg = <0x0 0x8c51a000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		npu_mem: memory@8c600000 {
> +			reg = <0x0 0x8c600000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		video_mem: memory@8cb00000 {
> +			reg = <0x0 0x8cb00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		cvp_mem: memory@8d000000 {
> +			reg = <0x0 0x8d000000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@8d500000 {
> +			reg = <0x0 0x8d500000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@8e900000 {
> +			reg = <0x0 0x8e900000 0x0 0x1500000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8fe00000 {
> +			reg = <0x0 0x8fe00000 0x0 0x1d00000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@92300000 {
> +			reg = <0x0 0x92300000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_secure_heap: memory@92400000 {
> +			reg = <0x0 0x92400000 0x0 0x4600000>;
> +			no-map;
> +		};
> +
> +		ramoops: ramoops@96a00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0x96a00000 0x0 0x400000>;
> +			console-size = <0x200000>;
> +			pmsg-size = <0x200000>;
> +			ecc-size = <16>;
> +		};
> +
> +		asus_debug_mem: memory@97000000 {
> +			reg = <0x0 0x97000000 0x0 0x400000>;
> +			no-map;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_cam_dvdd_1p2: cam-dvdd-1p2-regulator {

I understand your wish to group the regulator devices, however then
please rename the nodes to have a similar name (e.g. regulator-foo-bar).
Also please place them correspondingly ('qcm6390' < 'regulator' <
'reserved').

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam_dvdd_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-enable-ramp-delay = <233>;
> +		gpio = <&pm8150l_gpios 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +


> +
> +&cpu7_opp_table {
> +	cpu7_opp21: opp-3091200000 {
> +		opp-hz = /bits/ 64 <3091200000>;
> +		opp-peak-kBps = <8368000 51609600>;
> +	};

I'm a bit concerned about this one, I haven't seen it in the downtream
SM8250 DT.

> +};
> +
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;

&gpu_zap_shader {
};

> +		firmware-name = "qcom/sm8250/asus/obiwan/a650_zap.mbn";
> +	};
> +};
> +
> +
> +&i2c15 {
> +	status = "okay";
> +
> +	typec@4e {
> +		compatible = "richtek,rt1715";
> +		reg = <0x4e>;
> +		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
> +		vbus-supply = <&vreg_rt1715_vbus>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rt1715_irq_default>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			self-powered;
> +			op-sink-microwatt = <10000000>;
> +
> +			source-pdos = <PDO_FIXED(5000, 500,
> +						 PDO_FIXED_DUAL_ROLE |
> +						 PDO_FIXED_USB_COMM |
> +						 PDO_FIXED_DATA_SWAP)>;
> +
> +			sink-pdos = <PDO_FIXED(5000, 3000,
> +					       PDO_FIXED_DUAL_ROLE |
> +					       PDO_FIXED_USB_COMM |
> +					       PDO_FIXED_DATA_SWAP)
> +				     PDO_FIXED(9000, 2000, 0)>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					rt1715_con_hs: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs_out>;
> +					};

Just HS, no USB 3.0 support?

> +				};
> +			};
> +		};
> +	};
> +
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_1_qmpphy_dp_in>;

Please move endpoint connection to sm8250.dtsi.

> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "tianma,ta066vvhm03";
> +		reg = <0>;
> +
> +		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +		vci-supply = <&vreg_l10a>;
> +		vdd-supply = <&vreg_l3c>;
> +		vddio-supply = <&vreg_l14a>;
> +
> +		pinctrl-0 = <&disp_en_active>, <&disp_reset_n_active>, <&mdp_vsync>;
> +		pinctrl-1 = <&disp_en_suspend>, <&disp_reset_n_suspend>, <&mdp_vsync>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +
> +		qcom,calibration-variant = "ASUS_ROG_Phone_3";

Just to check, was it submitted upstream?

> +	};
> +};
> +
> +
> +
> +&usb_1_dwc3 {
> +	dr_mode = "otg";

This is default and can be dropped

> +	usb-role-switch;

Please move to sm8250.dtsi.

> +};
> +
> +&usb_1_dwc3_hs_out {
> +	remote-endpoint = <&pm8150b_hs>;
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l5a>;
> +	vdda18-supply = <&vreg_l12a>;
> +	vdda33-supply = <&vreg_l2a>;
> +
> +	qcom,hs-disconnect-bp = <973>;
> +	qcom,hs-amplitude-bp = <1110>;
> +	qcom,pre-emphasis-amplitude-bp = <10000>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	mode-switch;
> +	orientation-switch;

Please move to sm8250.dtsi.

> +
> +	vdda-phy-supply = <&vreg_l9a>;
> +	vdda-pll-supply = <&vreg_l18a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;

sm8250.dtsi.

> +};
> +
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pm8150b_ss>;
> +};
> +
> +&usb_2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rt1715_mux_en>;
> +
> +	/* Disable USB3 clock requirement as this port only supports USB2 */
> +	qcom,select-utmi-as-pipe-clk;

OKay, this answers my earlier question.

> +
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "otg";

Default, can be dropped.

> +	maximum-speed = "high-speed";
> +	phys = <&usb_2_hsphy>;
> +	phy-names = "usb2-phy";
> +	usb-role-switch;

usb-role-switch can go to sm8250.dtsi.

> +
> +	port {
> +		usb_2_dwc3_hs_out: endpoint {
> +			remote-endpoint = <&rt1715_con_hs>;
> +		};
> +	};
> +};
> +
> +&usb_2_hsphy {
> +	vdda-pll-supply = <&vreg_l5a>;
> +	vdda18-supply = <&vreg_l12a>;
> +	vdda33-supply = <&vreg_l2a>;
> +
> +	qcom,hs-disconnect-bp = <1332>;
> +	qcom,hs-amplitude-bp = <2000>;
> +	qcom,pre-emphasis-amplitude-bp = <20000>;
> +
> +	status = "okay";
> +};
> +
> +&venus {
> +	firmware-name = "qcom/sm8250/asus/obiwan/venus.mbn";
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

