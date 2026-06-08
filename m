Return-Path: <linux-arm-msm+bounces-111647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 56LQLxA1JmrOTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAC65269C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pe43rbFy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jmOkJNW6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111647-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111647-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0703300B9FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CE6347FFE;
	Mon,  8 Jun 2026 03:20:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D419005E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:20:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888846; cv=none; b=M65Wnkxh4kWnr0oc9LSQo5m3ADUnEYu1uZmGpJ2fGHXIkkNJO3SI6i943viRwaVd/8UzXkvu2gyS3Rs38LyFPX+uoPt7Jy3O02n/vu9MuOi+o+MrXxINTlhiUNoNIu7HW0XX9vQqWrUDzvqfQAM5Z/K7jgVJH8VmP4zyW1DI2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888846; c=relaxed/simple;
	bh=ztUXhn53v/uk9LOlSht4+aGtbJsZvwMmQELkzuMJ/TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vit8jCen3TFCIFp5ALm2mEv/T1PZkqPpYUVOXO5SqLAiH8MVvDPXLTZDv87LZEu/M0pFKhSP2Im9tKyQcTjMRkg92YOS/WaYtpzubKZ0SV2Vo4nG1fY2MSod4h0JtPO6N6rYcFmrbE8VTJUjzEJ7PmmsAHvGaGE5Krl6pL1UC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pe43rbFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmOkJNW6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GdRV2027762
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCsodGpVK+Q/AGm1cIGYLqNvxmLPLFEuu08T2JVyPh4=; b=pe43rbFyd8+N6XEj
	12tdTyFX9Zd2Csn5OwkZNQ+4TwTxRUyFuJXG44gq5EDRrydxJ5himChDpDlxG1y5
	Z7czlIW3wGQkGdcPJvRnN8EjnSFGRXTVsmoHCliXwZs22wHCDQjA8j7ZEc7vAUoi
	L1J+MKphtESVRG0xnOY6wLyRqHZAeWhW101bG85Dj9/eLack6t7v8Wx09Szg4vZR
	Da54vTjCa6RwkDl+i6x0R3d4Rbh3LckI1Ep+nkDIIKnBCe9S42JD74a24/ORsxZa
	sN70Xu557X4OwUCO04NiWJBxi/YVrTfCNkPm5QHOcjF4NAQ1/P5akni0LpvrDFx7
	zrnIrw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4wvsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:20:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963eeb6f2baso4112334241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888843; x=1781493643; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCsodGpVK+Q/AGm1cIGYLqNvxmLPLFEuu08T2JVyPh4=;
        b=jmOkJNW6WOtjhp70Q0y9aN/tDbdfgGAEPh7OfuifY6I6QWUcaur6APGD6a9ULg/6vs
         hfAcFLjKbSmM/9WHcd6umezYhb+x/iPEIByJ3KxL018NUnUvQXameOXUAkVxLCFcguNk
         L5Zhbzg3i+dGAHghdppivGgcN6MeuSIHAK/7kUXqslnssaSWMlLropWDMwK24/xF76kF
         nOor9AYv0skEACpRs3zoONavOtLr+SHSMLF+/Q8212vUu08l37bTXY1ih6TtrysvJbnb
         gnQnJsdtuqX7R+l4JqtRWQ2X/4r/g/Kpp0XgVl72nRfTvyMtIGbDdXqp9TEnWxHP4rFl
         +y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888843; x=1781493643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCsodGpVK+Q/AGm1cIGYLqNvxmLPLFEuu08T2JVyPh4=;
        b=Ia484lSW/wmJMVKkuhbZTEFEad3xVMpadcjxVhMX159z8mi6gB9Ngq0jqXz1AtmO3Q
         VIzagtmE4E/l3zAYAzBoTHYI7FPtk1h7kNfhbT4kLALklS2WhYCDkS6O8TP+U1Y77tZy
         0ypQzmjWNRmwusVk8yjs/JnHZfBno3TfX1NwFYYX3kWvPIjGvuosnk/vdOcislXxHhv4
         jrCMwhbLjZ84N9T/vG6KKgHNL2AQqR4On3aCfk1TKeSz0iFTrGzPwnfg+tT8W867p7z6
         fstmwXDYaQCd2JUcFhZST74MC4qEroPzL2xULrDAxxN+NII6zprw4QiuPnJgN7wr6uKW
         2Ofg==
X-Forwarded-Encrypted: i=1; AFNElJ/J2eScG2S5qHGCTFb9/ivKPE6Jpy8UZWlJDKAes0Z6Zb0GNADMCM/U5FIcA/SHjWyAdCnDhkIWsTSRzreI@vger.kernel.org
X-Gm-Message-State: AOJu0YyYzpQTC2sfTR0tCTQjr88QiA1ZoFh4t8GIHaS4qfvKBSmqWH1G
	nee4/5CBF6vs5ooG869lLsOX6T4qhkVS68qLeKuYpsHc+LFB9PmUrMIzg+dLOzdx1N/64wzjEv3
	sXh5o2Uzw9qMmnfVGjB3BePpStrIovpATZ1tC0i061MKRiPoy6AxMXUWDc5JaazABF+Ym
X-Gm-Gg: Acq92OGgRO+CAF2ty3+CJ3e9TprzyL6JiOEJ68sD2/YFO0cgadbmx+NgzMpvOnULN5s
	1F4ljSySs129nwwUmHdTuQxEeZTBkBkkV/vrr5ntuJfcAMtWDJFaVp/P4cz9A8MuUpj72gwNekq
	Aejb+Rqa5t5GGwBdn7rOB15ML0te6NPN0JdDW7+HCzhU5JWdAndzKkzV2MsxJooKwoeWut8G75m
	6h7rDC/e9x9zv8tHGZmgcSNjhBX++vrPExZ4uBzBlmRDs1XTpL2gl68KikOxXEOg/wHSO+NVw6F
	r+S9QEqo5qQi7p3DyfH4cCgxap5lw3GTeKUp8cNb1k/RaS10zdJotUHhUdFmZTT1lmhja0Eug6J
	sibGi5Ui+nqBDuhEsHrmqr9dPAvfrw3nsQ+xTZ6wlF9/mt2eUsFeLD6FeBopXE7yXj52JjPjGXe
	7q7CHlsxbuZGyiNhEvAyOzGaEYDce8+RUfei10iYjHtfQ0Jw==
X-Received: by 2002:a05:6102:6b0a:b0:631:3bbb:f25f with SMTP id ada2fe7eead31-6ff084a696bmr6641113137.15.1780888842611;
        Sun, 07 Jun 2026 20:20:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:631:3bbb:f25f with SMTP id ada2fe7eead31-6ff084a696bmr6641091137.15.1780888842157;
        Sun, 07 Jun 2026 20:20:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed925sm42566711fa.39.2026.06.07.20.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:20:39 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:20:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 2/2] thermal: qcom: add PM8901 PMIC temperature-alarm
 driver
Message-ID: <urdmcdwvy5dxywkqesc5tibakjfpq7nddw7pl4n5sozo67mrl3@hpks6ocnjj5b>
References: <cover.1780148149.git.github.com@herrie.org>
 <1b3f3853d374d9f65e3043de27f390f7ed97a0e5.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b3f3853d374d9f65e3043de27f390f7ed97a0e5.1780148149.git.github.com@herrie.org>
X-Proofpoint-ORIG-GUID: 8bXRaicEH1r2NgateVYoxLiiiO9nEzAl
X-Proofpoint-GUID: 8bXRaicEH1r2NgateVYoxLiiiO9nEzAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNyBTYWx0ZWRfX09ZWo8BEvas/
 CGr2ezSQV27SbIpK+CAELGvwgWboa4Bw/1nncgxqjv/ZQ3jUIzUDlzy9PATEA5ssQpJoIi7aNvb
 cY8T7mFyTbC4IOkuRpnPW6O5VsKgg3B0BVja3wUfTd/PFtj+pHbQK0geFITJRx70iscEHnW3JsO
 JzWby11Lzdh7G79xJdlde/SaojOmWTtwAUzlbAm5rx4lM3LjrkUBKphaXeSTQmBQg2uT6NJrOib
 C3ISSclzoSWfYdBiQC8XtURKTa2c1NHhugT6Z9xRG17P7tpGzFysprFe2NbMrNFDNNo3aTgRXCu
 tMOmoRU6Zqp7XZBEvjt2KVEEGXfVcmTPJ2mxiaTmcV18oYbIYUb9RgBmJs5bpLNunl5DaikdfPI
 IsVasimxWARzBTWxYBz+jQ3nj4CEIpZ2qH6P8JnLR2aOXSyXoucU+lz4yZjpqg4mccbF0z1cmai
 gc5FRDt19CwRPLRXU2Q==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a26350b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=cTwmTnRGAAAA:8
 a=-ckwBdrMyBtTmgzsWd4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111647-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:amitk@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:lukasz.luba@arm.com,m:rafael@kernel.org,m:robh@kernel.org,m:thara.gopinath@gmail.com,m:rui.zhang@intel.com,m:conor@kernel.org,m:krzk@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,arm.com,gmail.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,herrie.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37AAC65269C

On Sat, May 30, 2026 at 04:00:40PM +0200, Herman van Hazendonk wrote:
> Add a thermal-of sensor driver for the temperature-alarm block inside
> the Qualcomm PM8901 PMIC. PM8901 is a secondary PMIC paired with
> PM8058 on the MSM8x60 family (MSM8260/MSM8660/APQ8060). It exposes
> an over-temperature alarm at SSBI offset 0x23/0x24 with three
> escalating stages (105/125/145 C); the driver decodes the stage +
> threshold pair into a millicelsius reading and registers two PMIC-
> internal interrupts (TEMP_ALARM at block 6 bit 4, TEMP_HI_ALARM at
> block 6 bit 5).
> 
> Used by board thermal-zones for the orderly_poweroff path on the HP
> TouchPad.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/thermal/qcom/Kconfig          |  12 +
>  drivers/thermal/qcom/Makefile         |   1 +
>  drivers/thermal/qcom/qcom-pm8901-tm.c | 341 ++++++++++++++++++++++++++
>  3 files changed, 354 insertions(+)
>  create mode 100644 drivers/thermal/qcom/qcom-pm8901-tm.c
> 
> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
> index a6bb01082ec6..af099032f1e6 100644
> --- a/drivers/thermal/qcom/Kconfig
> +++ b/drivers/thermal/qcom/Kconfig
> @@ -32,6 +32,18 @@ config QCOM_SPMI_TEMP_ALARM
>  	  real time die temperature if an ADC is present or an estimate of the
>  	  temperature based upon the over temperature stage value.
>  
> +config QCOM_PM8901_TEMP_ALARM
> +	tristate "Qualcomm PM8901 PMIC Temperature Alarm"
> +	depends on MFD_PM8XXX || COMPILE_TEST
> +	depends on THERMAL_OF
> +	help
> +	  This enables the thermal driver for the PM8901 PMIC over-temperature
> +	  alarm block. PM8901 exposes a stage-based alarm (no raw ADC) with
> +	  four selectable thresholds and three escalating stages. The driver
> +	  registers a thermal-of sensor so a board device tree can declare
> +	  trip points and a critical-trip action (orderly_poweroff). Used on
> +	  HP TouchPad (APQ8060) where PM8901 supplies the secondary PMIC die.
> +
>  config QCOM_LMH
>  	tristate "Qualcomm Limits Management Hardware"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
> index 0fa2512042e7..90dc05151e33 100644
> --- a/drivers/thermal/qcom/Makefile
> +++ b/drivers/thermal/qcom/Makefile
> @@ -5,4 +5,5 @@ qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
>  				   tsens-8960.o
>  obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
>  obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
> +obj-$(CONFIG_QCOM_PM8901_TEMP_ALARM)	+= qcom-pm8901-tm.o
>  obj-$(CONFIG_QCOM_LMH)		+= lmh.o
> diff --git a/drivers/thermal/qcom/qcom-pm8901-tm.c b/drivers/thermal/qcom/qcom-pm8901-tm.c
> new file mode 100644
> index 000000000000..d174d6897921
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-pm8901-tm.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Qualcomm PM8901 PMIC Thermal-Alarm Driver
> + *
> + * Mainline port of the legacy 2.6.35-palm drivers/thermal/pmic8901-tm.c.
> + * PM8901 exposes a stage-based over-temperature alarm (no raw ADC) with
> + * four selectable thresholds and three escalating stages. This driver
> + * mirrors the legacy programming exactly (threshold-set 0, software
> + * override enabled, PWM gating at 8 Hz) and registers a thermal-of
> + * sensor so a board DT can declare trip points and a critical action.
> + *
> + * Copyright (c) 2010-2011, Code Aurora Forum.
> + * Copyright (c) 2026, HP TouchPad mainline port.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/thermal.h>
> +
> +/* SSBI registers (offsets from the per-instance reg base) */
> +#define PM8901_TM_REG_CTRL		0x00	/* CTRL/STATUS  (base + 0) */
> +#define PM8901_TM_REG_PWM		0x01	/* PWM gating  (base + 1) */
> +
> +/* CTRL register fields */
> +#define CTRL_ST3_SD			BIT(7)
> +#define CTRL_ST2_SD			BIT(6)
> +#define CTRL_STATUS_MASK		GENMASK(5, 4)
> +#define CTRL_THRESH_MASK		GENMASK(3, 2)
> +#define CTRL_OVRD_ST3			BIT(1)
> +#define CTRL_OVRD_ST2			BIT(0)
> +#define CTRL_OVRD_MASK			GENMASK(1, 0)
> +
> +/* PWM register fields */
> +#define PWM_EN				BIT(7)
> +#define PWM_PER_PRE_MASK		GENMASK(5, 3)
> +#define PWM_PER_DIV_MASK		GENMASK(2, 0)
> +
> +/* Temperature math (from legacy pmic8901-tm.c) */
> +#define PM8901_TEMP_STAGE_STEP		20000	/* 20 deg C between stages */
> +#define PM8901_TEMP_STAGE_HYSTERESIS	2000	/*  2 deg C transition guard */
> +#define PM8901_TEMP_THRESH_MIN		105000	/* threshold 0 base = 105 C */
> +#define PM8901_TEMP_THRESH_STEP		5000	/*  5 deg C per threshold step */
> +
> +/*
> + * PM8901 has no real die ADC; when stage == 0 ("below threshold") we
> + * report a plausible idle estimate matching the legacy DEFAULT_NO_ADC_TEMP.
> + */
> +#define PM8901_TEMP_NO_ALARM		37000
> +
> +struct pm8901_tm_chip {
> +	struct device			*dev;
> +	struct regmap			*map;
> +	struct thermal_zone_device	*tz_dev;
> +	struct mutex			lock;
> +	unsigned int			base;	/* SSBI offset, from DT reg */
> +	unsigned int			stage;
> +	unsigned int			thresh;
> +	int				temp;
> +	bool				initialised;
> +};
> +
> +static int pm8901_tm_read_ctrl(struct pm8901_tm_chip *chip, u8 *val)
> +{
> +	unsigned int v;
> +	int ret;
> +
> +	ret = regmap_read(chip->map, chip->base + PM8901_TM_REG_CTRL, &v);
> +	if (!ret)
> +		*val = v;
> +	return ret;
> +}
> +
> +static int pm8901_tm_write_ctrl(struct pm8901_tm_chip *chip, u8 val)
> +{
> +	return regmap_write(chip->map, chip->base + PM8901_TM_REG_CTRL, val);
> +}
> +
> +static int pm8901_tm_write_pwm(struct pm8901_tm_chip *chip, u8 val)
> +{
> +	return regmap_write(chip->map, chip->base + PM8901_TM_REG_PWM, val);
> +}

I'm personally not a fan of one-line wrappers (all three), but it's up
to you and the maintainers...

> +
> +/*
> + * Decode the (stage, threshold) pair into a single millicelsius value.
> + * Logic matches the legacy pmic8901-tm.c hysteresis selection:
> + *  - on a rising stage transition, use the lower bound of the new stage
> + *    plus +HYSTERESIS so we don't bounce
> + *  - on a falling stage transition, use the upper bound of the new stage
> + *    minus -HYSTERESIS
> + *  - on the first read after probe (initialised == false), pick a
> + *    representative point: midpoint of the stage range, or
> + *    PM8901_TEMP_NO_ALARM when stage == 0.
> + */
> +static int pm8901_tm_update_temp_locked(struct pm8901_tm_chip *chip)
> +{
> +	unsigned int new_stage;
> +	u8 reg;
> +	int ret;
> +
> +	ret = pm8901_tm_read_ctrl(chip, &reg);
> +	if (ret)
> +		return ret;
> +
> +	new_stage = FIELD_GET(CTRL_STATUS_MASK, reg);
> +	chip->thresh = FIELD_GET(CTRL_THRESH_MASK, reg);
> +
> +	if (!chip->initialised) {
> +		if (new_stage)
> +			chip->temp = PM8901_TEMP_THRESH_MIN +
> +				     chip->thresh * PM8901_TEMP_THRESH_STEP +
> +				     (new_stage - 1) * PM8901_TEMP_STAGE_STEP;
> +		else
> +			chip->temp = PM8901_TEMP_NO_ALARM;
> +		chip->initialised = true;
> +	} else if (new_stage > chip->stage) {
> +		chip->temp = PM8901_TEMP_THRESH_MIN +
> +			     chip->thresh * PM8901_TEMP_THRESH_STEP +
> +			     (new_stage - 1) * PM8901_TEMP_STAGE_STEP +
> +			     PM8901_TEMP_STAGE_HYSTERESIS;
> +	} else if (new_stage < chip->stage) {
> +		chip->temp = PM8901_TEMP_THRESH_MIN +
> +			     chip->thresh * PM8901_TEMP_THRESH_STEP +
> +			     new_stage * PM8901_TEMP_STAGE_STEP -
> +			     PM8901_TEMP_STAGE_HYSTERESIS;
> +	}
> +
> +	chip->stage = new_stage;
> +	return 0;
> +}
> +
> +static int pm8901_tm_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct pm8901_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret;
> +
> +	if (!temp)
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +	ret = pm8901_tm_update_temp_locked(chip);
> +	if (!ret)
> +		*temp = chip->temp;
> +	mutex_unlock(&chip->lock);
> +
> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops pm8901_tm_zone_ops = {
> +	.get_temp = pm8901_tm_get_temp,

You don't have to implement it, but please add a comment. Are those
hardcoded?

> +};
> +
> +/*
> + * Program PM8901 to the legacy default: threshold-set 0 (105 / 125 / 145 C),

Any other options?

> + * software override enabled (kernel handles shutdown, PMIC does not auto-cut),
> + * PWM at 8 Hz (legacy "cut down on unnecessary interrupts" rate).
> + */
> +static int pm8901_tm_init_hw(struct pm8901_tm_chip *chip)
> +{
> +	int ret;
> +	u8 reg;
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = pm8901_tm_read_ctrl(chip, &reg);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * Enable software override so PMIC does NOT auto-shut-down on stage 3.
> +	 * Critical-trip orderly_poweroff is delivered by the kernel thermal
> +	 * core via the DT thermal-zone trip with type = "critical".
> +	 */
> +	reg = (reg & ~(CTRL_OVRD_MASK | CTRL_STATUS_MASK | CTRL_THRESH_MASK)) |
> +	      CTRL_OVRD_ST3 | CTRL_OVRD_ST2;
> +	ret = pm8901_tm_write_ctrl(chip, reg);
> +	if (ret)
> +		goto out;
> +
> +	chip->thresh = 0;
> +
> +	/* PWM @ 8 Hz: PWM_EN | PRE=3 | DIV=3 — verbatim from legacy. */
> +	reg = PWM_EN | FIELD_PREP(PWM_PER_PRE_MASK, 3) |
> +	      FIELD_PREP(PWM_PER_DIV_MASK, 3);
> +	ret = pm8901_tm_write_pwm(chip, reg);
> +	if (ret)
> +		goto out;
> +
> +	/* Prime the cached temperature from current hardware state. */
> +	chip->initialised = false;
> +	ret = pm8901_tm_update_temp_locked(chip);
> +
> +out:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static int pm8901_tm_probe(struct platform_device *pdev)
> +{
> +	struct pm8901_tm_chip *chip;
> +	int ret, irq_alarm, irq_hi_alarm;
> +	u32 res;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +	mutex_init(&chip->lock);
> +
> +	chip->map = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!chip->map)
> +		return dev_err_probe(&pdev->dev, -ENXIO,
> +				     "no regmap on PM8901 parent\n");
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "reg", &res);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "missing reg property\n");
> +	chip->base = res;
> +
> +	irq_alarm = platform_get_irq_byname(pdev, "alarm");
> +	if (irq_alarm < 0)
> +		return irq_alarm;
> +	irq_hi_alarm = platform_get_irq_byname(pdev, "hi-alarm");
> +	if (irq_hi_alarm < 0)
> +		return irq_hi_alarm;
> +
> +	ret = pm8901_tm_init_hw(chip);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "hw init failed\n");
> +
> +	chip->tz_dev = devm_thermal_of_zone_register(&pdev->dev, 0, chip,
> +						     &pm8901_tm_zone_ops);
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
> +				     "thermal zone register failed\n");
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
> +					pm8901_tm_isr, IRQF_ONESHOT,
> +					"pm8901-tm-alarm", chip);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "alarm IRQ request failed\n");
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq_hi_alarm, NULL,
> +					pm8901_tm_isr, IRQF_ONESHOT,
> +					"pm8901-tm-hi-alarm", chip);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "hi-alarm IRQ request failed\n");
> +
> +	platform_set_drvdata(pdev, chip);
> +	thermal_zone_device_update(chip->tz_dev, THERMAL_EVENT_UNSPECIFIED);
> +
> +	dev_info(&pdev->dev,

dev_dbg() or drop it completely.

> +		 "PM8901 thermal alarm: base=0x%x stage=%u thresh=%u temp=%d\n",
> +		 chip->base, chip->stage, chip->thresh, chip->temp);
> +
> +	return 0;
> +}
> +
> +static void pm8901_tm_remove(struct platform_device *pdev)
> +{
> +	struct pm8901_tm_chip *chip = platform_get_drvdata(pdev);
> +	u8 reg;
> +
> +	/*
> +	 * Disable software override on the way out so the PMIC reverts to
> +	 * its hardware auto-cut behaviour if the kernel is no longer the
> +	 * shutdown agent. Best-effort: ignore errors.
> +	 */
> +	mutex_lock(&chip->lock);
> +	if (!pm8901_tm_read_ctrl(chip, &reg)) {
> +		reg &= ~CTRL_OVRD_MASK;
> +		pm8901_tm_write_ctrl(chip, reg);
> +	}
> +	mutex_unlock(&chip->lock);
> +}
> +
> +static const struct of_device_id pm8901_tm_match_table[] = {
> +	{ .compatible = "qcom,pm8901-temp-alarm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pm8901_tm_match_table);
> +
> +static struct platform_driver pm8901_tm_driver = {
> +	.driver = {
> +		.name		= "pm8901-temp-alarm",
> +		.of_match_table	= pm8901_tm_match_table,
> +	},
> +	.probe	= pm8901_tm_probe,
> +	.remove	= pm8901_tm_remove,
> +};
> +module_platform_driver(pm8901_tm_driver);
> +
> +MODULE_ALIAS("platform:pm8901-temp-alarm");

No need for platform aliases (neither here nor in any other driver which
has MODULE_DEVICE_TABLE(of).

> +MODULE_DESCRIPTION("Qualcomm PM8901 PMIC Thermal Alarm driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

