Return-Path: <linux-arm-msm+bounces-91554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFxDHqH7gGn9DQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:31:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3FD08A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C99BC30233F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 19:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935E5303CB6;
	Mon,  2 Feb 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/ED1CE/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6Z7FRVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396A2BE620
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060702; cv=none; b=QxapY0qtCO7XiGtLs86B+v4o20lzrvXicMNkE7NYQui01y0srYXT8ycV2oX+Xu0sOWBhuL78CiGGyw11eAjhRgG9DPI/FdzVZd5ufDbfjhSVE+beuiiDxH+4qk2CSwDI2FVsr5bd3BUZDdrplqE9UNRbF9KcyET/YUqsWLW8EcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060702; c=relaxed/simple;
	bh=7r4d6Mm7nvCmNGWTjOXdBrBBWk8SVRQ9s/P1BK4o+38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz8/mdogpGmxIBmBD0V6fIL7UKOqrMFb6fXTl4py/YTPh2RTl8Jh+RIiEAK1Tml9ssHKQDVvUvxXWOAOBt2zDAj5zkB8ivVrLVBWiFgkExBDm3PRSUWMyJHCt8Zjz5jeHFOz+n+tds8Tx0AeTN40vj4Etws+oM5T9gZm5M161fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/ED1CE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6Z7FRVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612BAFUq3082673
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 19:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwQBnRgQkroEpM7/62DEY/3njQ0jGiL2b5zGAGO9dgA=; b=a/ED1CE/tO1UikJg
	8Q7/AKz67ggTHZjhvibewxkE/7iGt77UcI+detWM/PK2HkVMFplT6FAxyHRqolRv
	8zEZ8JrraKzKwIUZ8rlED1/JI1S75zou7vKT5vjVuU4Z0OVt0WCMK8BecsQrjw7k
	Nq7We478nnfp0spfVEYcvw2M69kxCcRA1tteYoWfB1Y4QZ7mO7dW5vMaPlgrqo03
	DGoH8yzY6CN7sr44woYOdUMjvEnXxLmEO8mIyvLxfXtTkA0Aqe8h0HySmRbCl1hd
	9YvC6qc636U3C1U5tG0VhcGnMZej/OeGgnc6/+ebSwctAa/u8XKkPFlHKOw3NjDg
	9v0Ktw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2ttn1jxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 19:31:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82320abbea2so388103b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060700; x=1770665500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwQBnRgQkroEpM7/62DEY/3njQ0jGiL2b5zGAGO9dgA=;
        b=e6Z7FRVmjbT3oIN6qHcFLC9FqRLsjfTrF9clSnJNu0MPSjy/S23Ju4GgAeOWNAVdMC
         27xxxw1NxnUsv/zqZGj/CNgrsdfFlR1xQwhwo2YOTaeuHWCZAWnYQTxHTTFRznWARe03
         kWIINkNKgq1qS9x6W1QWMX+sfh68MLm4pZF2razbNpk9+J7w9gAv/E46aUc7yTXJGQ4s
         e9Su3KGJCrTJsuiW5CzivMOjNv2P86W3fDyxK+mhfSCdRp72mfmXIj5080HD13HwwQTl
         18RiScI7oyG7Loi5fzueiHu7/IlR9RYggC2o3BeEvwleKc2IfVZzk6Arii8ir5u2msIr
         HERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060700; x=1770665500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwQBnRgQkroEpM7/62DEY/3njQ0jGiL2b5zGAGO9dgA=;
        b=UmEDVcQiY/iaCtjoVfm5kTPjNlyUbpIlkqwTejRhfJfTvVP5rjcxxeG4WOaRByWdn/
         kdOKlX94fzJ19APN+SY2M0Wpj0lKS907XUOMqnbyV5zBm1THF49/p3larF8thUp+uS2P
         71fEi/qfm4gfCHBhpUiyd+m82aAx6PFmqwNWkqUM048peArM7Ytd/oDg5pJT6zMM0h9p
         znGnGVgFzJ0lw45LpImxBQvkC63jLDbGcvGwUyUVme83Lb9tfWAR9Yf4rndyamCpHYOi
         uLpeDKrXWMRHKIVbCILWf7NVxXIbxCjAhXJR1Q7Xb4YiKPeuJkCGsgPGA2Zbf1QbHnqg
         X2mA==
X-Gm-Message-State: AOJu0YybUEz79CKxdxmtI1iQaVM7JiYXzEwQWnx/pjUU/INzMaObtHN6
	iowOfnTfumljiBpEbQPmrxhFBjePCF4ryB4OYZGsndS6ju8OJnPYBQZ8Q97qivbM4BoLP7UTyYe
	OTG3nIj4POF/34Y+iv5JDd4Ca1FvS+o9Ian3UXimtyc7cIMlPbu5NxstOhrB+fa/luMkk
X-Gm-Gg: AZuq6aK8B6Wm2gZdkLRrt5LfZPZtT+G3GZnELdzczYgZteDaQSYbT5AbXsHsOOKrPq3
	R+u+Y9mCI/ne4nuABCxzJET4hOU1O643uHOfyvlPuiqv4rfmyz/XyltRJqoEYfHjfjsSoVo3eav
	lZiJrG1DsimE73Ljwk4TE2ALJc8JkXRTc1xLC3r5srGKBbEUVFP7Tgke/PsvzducAz48JYIXDp+
	16bNjA+qC0kgN5Uecvk4huj/qkkXNMet+oMpRUmJKrkn0tQSUtgk67sxDrytckg3tEF39Id4aaP
	F8RMewbxMvYLhh3q9d8JVqEWdbZ3i757cBa2RKL+4C4u9I7fyebI622oj2uOV0DBK5HBJavztSL
	5phWIJ8v8BCD5hbr1Ee/q26zMtTk+74rc9K6W2du0aaPxyC0hPsxOOcdTJUjZ+h98Ft+f87wU
X-Received: by 2002:a05:6a00:3e01:b0:81f:475a:d242 with SMTP id d2e1a72fcca58-823aa6ee46bmr8560232b3a.4.1770060699666;
        Mon, 02 Feb 2026 11:31:39 -0800 (PST)
X-Received: by 2002:a05:6a00:3e01:b0:81f:475a:d242 with SMTP id d2e1a72fcca58-823aa6ee46bmr8560220b3a.4.1770060699178;
        Mon, 02 Feb 2026 11:31:39 -0800 (PST)
Received: from ?IPV6:2406:b400:b5:274e:4cd7:f9d9:9aac:dc5e? ([2406:b400:b5:274e:4cd7:f9d9:9aac:dc5e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1f188sm19012324b3a.13.2026.02.02.11.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:31:38 -0800 (PST)
Message-ID: <b851075c-0ec5-46f6-9da0-a9f814d04005@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 01:01:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: lemans-evk: Add Mezzanine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260129172850.1175728-1-umang.chheda@oss.qualcomm.com>
 <20260129172850.1175728-2-umang.chheda@oss.qualcomm.com>
 <27c91542-820e-49bd-870a-d492be21958a@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <27c91542-820e-49bd-870a-d492be21958a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ANnNY0ku c=1 sm=1 tr=0 ts=6980fb9c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uqgqG2pLL8I79JWUUZYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MyBTYWx0ZWRfX/N29wfCG8H0P
 Mxy5vud/2vJBToUJ48wAz6lyF8+6C55RaZPSkfL1/Avmh9T214Ns4/I/Oi/mgkIA1c3W6RWX+/B
 9qPwy6of8WsBPlKLxjqL8P/kRg043ujKWCHT2Y32J3Nhr4JiRWQ8BAup06vYWsQ2nmpIkwVZVeZ
 +FeQDrbHYDG+mPGIroWO2tQzlnLuctW2ap+OynhjFmunOQZ3e95q20ZhGFstX4BMe+6F6BvuV0C
 Bz7NcBdF/XTugHX4V/aMGl9TwvV3gM73vaQHGINo82AvimTa2tHLmp0BW8xw1ZEKy345OFpsMOd
 v8IaD2nKRhMh+kfYZWLd2+35teFkGojyVCIHoyc1NcgW+ErEbJf4RDqMoz+tswkuPz0/d++aL/9
 Q3Wm6AA+0loBoDEJ6DXNQyL7PyiXkrELq+l8DJPozoEVVOH7nryYfOPiRXhlRDED0GZi2zoySIR
 NJWkSLkjSKT4PGhTNYw==
X-Proofpoint-GUID: ysP-5Kql7ZCBBtdnyX-4pNZIu1x6HE9B
X-Proofpoint-ORIG-GUID: ysP-5Kql7ZCBBtdnyX-4pNZIu1x6HE9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91554-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8D3FD08A0
X-Rspamd-Action: no action

Hello Konrad,

On 1/30/2026 4:21 PM, Konrad Dybcio wrote:
> On 1/29/26 6:28 PM, Umang Chheda wrote:
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
>> index 000000000000..a0dc6daec754
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
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VREG_SYS_PWR";
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
> nit: usually we put these at the end
Ack
>
> [...]
>
>> +&tlmm {
>> +	ethernet1_default: ethernet1-default-state {
>> +		ethernet1_mdc: ethernet1-mdc-pins {
> You can drop the labels for these inner entries, as you never
> reference them

Ack

>
> Konrad

Thanks,
Umang


