Return-Path: <linux-arm-msm+bounces-91613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDL8BRejgWmJIAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 08:26:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B498ED5B09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 08:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E57363054D24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 07:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDA3392809;
	Tue,  3 Feb 2026 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KorpegDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwO+6RH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECEF372B49
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770103569; cv=none; b=GPl7SH0pOiWMrOQ2en0bROhmYqHpl44dPpS3kfDxsiJ8x5cilaX0kV5XdOY/of+xUSi8Yg4dUXXD09JN+BhoQ0lIDf+ryXut0fkNqbpj8bBkDLRHJiomBxvStjVvKrkkUCD4L9PeMHW5ln0vr3wb83kYhytw5DBUea5WZz4s7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770103569; c=relaxed/simple;
	bh=YzEmTFngw7OF2If5k27CNptE53Ap1GPmgqB9IVTZhRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OibLYLJameCR9LSXehs3OsJb45CC0qyCrI24bMyGJ6HpQ6fqZle84CbnbgxFa0KtmtA8YVY/XCVMzJHPDI10So3NjKcjdPUpQWRa82Bh0zjixEgzPKuuZszYQxv7liz7I8RVECfQM+nrVvutAih0iwIx4qym05KaALQMN5kU8sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KorpegDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwO+6RH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61365Sew2107257
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 07:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEQqK5ezuD/ArnWMW8/UzUIqt5NsM2OkUyHRLBk6WqU=; b=KorpegDqn4PRubhK
	T5+beh5tYqABjyrVTvRR+7IO7CwUpir2D5HTuTd5/8nEBz6brf597RzYmb6TVEn3
	dFQECR0KohCR+fSmtNcSiUWRvA2vswAKOluQdg7+0l16Xwd4lsfHWX2O3MK1saKM
	e2fuYfqsCq1joU5zGfWVZvRxXJFDEfQEiTvDyphUlA5kKX0QsP/jYws/3IkgDebQ
	meOIH0VinnG/iugncLg4qTNWFADpk84fgrIvH2asBAhsuDn8vBqbol8Ei4MwKm4+
	cTuedEiOkW720wEUrKFeU9tKBNytMPH3oxCfYS7fDRTUSLSMEVRJ19M+UUNwZi0G
	RAtZ6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5ebh0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 07:26:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a75a4fe597so12417795ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 23:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770103567; x=1770708367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEQqK5ezuD/ArnWMW8/UzUIqt5NsM2OkUyHRLBk6WqU=;
        b=VwO+6RH56+9f10m6wi2g+N36+yfZE5UeUGG5sSYij6sHetUJxewE7gO0DPq8dl8JXb
         XsQJvIQGOV9rkaV9Cn7ma/Tivs9Ey/rgwICwBWuBdUMtAO/FjbUj7TjbudOZvFAb4gKR
         jYi/WEXep6QJ14xwzo6+fLachatRy37jNT0j7735ZdsICas3zZQKmfzJmfEia2+RN4C2
         fy/MLzOcT66mlw/Ek4CLMp6tQXX78BTOtLYwD7chZocqY8JM4YHlNRkW4xHvZyYuvgiV
         F8kubdRttV1tFjYkMRXELYm8loINCqglvDKLoiBqZkb6L04gWmEjEXmd0hGitnKh+6ue
         FhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770103567; x=1770708367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEQqK5ezuD/ArnWMW8/UzUIqt5NsM2OkUyHRLBk6WqU=;
        b=SF5DAc6f+BpdE+Zx0jM00Qs8g5euamJ2m2ogr2toLgt3c1MpslSn0jB+m0FnqLBbBP
         VWgCFyPE6+hm/5+g1biFMR4TkyXyar4xNwIMLrHrcyjxqCu0BhPHCh/slWCTqLzIkEO/
         JhRBZRh9aT3wMXKaZOHoRZuUj6rFoZ6Nwan4UmDrLIFxbEMH8ElMuBthBVlQibCp+Hz6
         Zb5YaQ8kzAJBR0/SzYRuDrKxlgBuGhkSVXJ17rP+NuweAx3LI1Pa6qP0r8dcbz9+YeVV
         a/jXyMB1hp+IlxAkSfBFyxY4UrtdZudpW5viN3IaC2ogu9c6dpqwrA/3EssktEx0ZVJA
         AvLA==
X-Forwarded-Encrypted: i=1; AJvYcCUiLJ61YLy+AJrLNExFrxp2/XruylGIjVlLBAGdSM9rAsiFxqHiQEOi49xAy2yZoESK1SkFAkRi9mWvUFoD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiv8/y6IwmpPxpj79ovk6wQfbTtyrx4liZWdArOK+5fnQnMUt+
	6AD7bcQeYp3sdPTDcDOu/ciDR1MY7eDsnvLZ5509JfKVPKHw9uoOVLcCFOiwbtzlocOLvNgZ5oJ
	l5zdhW8Wj7zrQb6ANd9Xa+Tn4/P86A1GbGp3hRoJw+a3z9HnfpX1fBcmJNzKeZndsB4Ja
X-Gm-Gg: AZuq6aLm4NM7aHJMlL1bozyQoxHG0NcNkIo6FaEXPDwo0vSznINvbS36taD4B9dmoyM
	mPFU8IN335tt7LewIFFv8NL9IIpsywffJFeXvgYLT8Z4e8NuFItD3ytoL2Aid8MVHx0rcP74sML
	tl2oBnAAuthH6BmeRsyL9SMSQi/O0y6wiXQlXLi3bKrGdtlQwAWCQB4C5MmIbs+RjC3YA3fdj5m
	ksLNMgsQNw2GxDCWkEEYLe8QzJ3AY2/Ls1il3XKSbs+pOqwHVKYSsIC52xv2kblv6tW7mhGy4fq
	puxoiS4zVWw90fwQTLygAiCnQhSZoLQ6OdCy/17y9nbJyKGo1yzQ6S604eR3HFFQ0bvXhu+BM6J
	+p6vNaivahH8YjWOWK9kLNhc6/Z/3C0I2AQVD3w==
X-Received: by 2002:a17:903:1987:b0:2a7:b447:338d with SMTP id d9443c01a7336-2a8d9948ee0mr94952765ad.8.1770103566605;
        Mon, 02 Feb 2026 23:26:06 -0800 (PST)
X-Received: by 2002:a17:903:1987:b0:2a7:b447:338d with SMTP id d9443c01a7336-2a8d9948ee0mr94952515ad.8.1770103566160;
        Mon, 02 Feb 2026 23:26:06 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eef68sm174553935ad.16.2026.02.02.23.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 23:26:05 -0800 (PST)
Message-ID: <eb4bb75c-7594-4890-82e8-97a06ee67d42@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 12:56:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260202194234.3701434-1-umang.chheda@oss.qualcomm.com>
 <20260202194234.3701434-2-umang.chheda@oss.qualcomm.com>
 <f5lobc5k3iyjndtosof37su7fccmbhtg5ufexd3vmeebyl5onl@vvaomdgeaoxa>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <f5lobc5k3iyjndtosof37su7fccmbhtg5ufexd3vmeebyl5onl@vvaomdgeaoxa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1OCBTYWx0ZWRfXwyaakLp7ZpbN
 +xgZrPuiNo1N9Be4/Si4piHklY/Wwiqjjhb0EArNMYjfHpdLrWN3Na7OnSrkeF+fkSfyAV9GK9B
 k7dL/Pvaql/Vk6i5iefu9ettONFEUFmEBRXXSva/GUCLngho4kJoWJdYYMNwdfKLP98PBT2vSwX
 jV0tbGN4wl85tB4ZNlUrUV86r+ostySrvxoTuKeHdCppkVsZZ9Y6K5aII94+qeaNOT5bA59Cw/c
 aYNkw2IiGaSXTw34CXmTg+NtfYKX8krzGJZg0tNm/U6c10bRdu0ZYkK73ottSsTbfFX9PxOxjhU
 DWeBEu84YA1oJlq5RvMRUAh731iWFk5dlcvtOBijBHmGvmQ91cDko4GvpQ8kaUSwKECn1DUNlpQ
 tpyOH0K2UA0EKhiByKvM1zylcRlstAsXLfnvqOJrqfBvoFSrqXd59B5DnfqqHuXFw++rTcaDXzA
 lDkAVOqf88lKLN/sKQw==
X-Proofpoint-GUID: m48UO4T9vdhq4t03WMSFMUbWePM9C8wy
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6981a30f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uqgqG2pLL8I79JWUUZYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: m48UO4T9vdhq4t03WMSFMUbWePM9C8wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B498ED5B09
X-Rspamd-Action: no action

Hi Dmitry,

On 2/3/2026 1:49 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 03, 2026 at 01:12:34AM +0530, Umang Chheda wrote:
>> The Mezzanine is an hardware expansion add-on board designed
>> to be stacked on top of Lemans EVK.
>>
>> It has following peripherals :
>>
>> - 4x Type A USB ports in host mode.
>> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>>    - 2nd DSP connects M.2 B-key connector for connecting cellular modems.
>>    - 3rd DSP with support for Dual Ethernet ports.
>> - eMMC.
>> - Additional 2.5GbE Ethernet PHY connected to native EMAC with support for
>>   MAC Address configuration via NVMEM.
>> - EEPROM.
>> - LVDS Display.
>> - 2*mini DP.
>>
>> Add support for following peripherals :
>> - TC9563 PCIe Switch.
>> - Additional 2.5GbE Ethernet Port.
>> - EEPROM.
>>
>> Written with inputs from :
>>     Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>  .../boot/dts/qcom/lemans-evk-mezzanine.dtso   | 301 ++++++++++++++++++
>>  2 files changed, 305 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index f80b5d9cf1e8..79449004adfd 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -43,6 +43,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
>>  lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>>
>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>> +
>> +lemans-evk-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-mezzanine.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-mezzanine.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
>> new file mode 100644
>> index 000000000000..674afe485a1b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso
>> @@ -0,0 +1,301 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&{/} {
>> +	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine";
>> +
>> +	vreg_sys_pwr: regulator-vreg-sys-pwr {
> Please sort the nodes.

Ack

>
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VREG_SYS_PWR";
>> +
>> +		regulator-min-microvolt = <24000000>;
>> +		regulator-max-microvolt = <24000000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_4p2: regulator-vreg-4p2 {


Thanks,
Umang


