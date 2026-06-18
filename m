Return-Path: <linux-arm-msm+bounces-113720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pfnPBc3HM2rFGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:26:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78F69F4BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ap1htXgQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V831hWDW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B346B315A2B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB4E3EDAC9;
	Thu, 18 Jun 2026 10:22:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CDB3ED5A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778119; cv=none; b=Xsoa789p8McPM/ZsPEjULBo53QZcmj3XAR4eI7O9PcNntkyMfXlVhGxyPL/BHMcAW1yctn//wOAge89ziGPDPuVqzEPUodI/TpoOHqn0+rIUUhr5gYZ+CE51LyIU9QHreEQZUXEVtBqd1k4IkhZwwXZ8j7U1S5yqlzpk2qfJ14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778119; c=relaxed/simple;
	bh=9a5003MjZGw/1MmHACvoJ7ldPOZzbWMfDVJ1FnfmyPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fidZfnKKbqptG8baflVSZLUAKjCWWIHEihc+KrfoKUppHyUJQG55izIMVItadickTQz8WA/VijSjEd7b7jJdSClMqnOiNjaUt2B9ptnIBge00zcIUzaI1UxtgD+ox0ad4ngWb1JEJE60Cxlf9wPJAoIQldrolivy8Mw+VLfCOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ap1htXgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V831hWDW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Drhf2246910
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yguuY96oSyrx72CHQn/bAXUqMvwHJj3BB8K1pDGSEVU=; b=Ap1htXgQBZSykc1o
	CPuO4BCOfka68GanqAzqZy1M4/zgSSo+6TeZH3LdjSCcrxoxGYYmwwB3ZSwYj+uj
	QZoEIMWJPu/lN6+Rtai/zV424VraOAIKzGbwLATpm0YN8/kLooCeMW8cR6PkzSTB
	h3BIC8/GH707ASO0tDYgpC3uDyOdfjZMhIp0EbqG5Ni9FogquCFIIDpih5KsqI83
	eJe/b3oP3TNSa3YguQewsaBSVz0WFy0Z8D+9x17iRkENq8mTXM3/tHGjEo5e8ZPF
	0kTNZ40WtBNP2o0h9rmwr/T6Z2hPxGRJdg/mGbOHH/VHSKhHQ4WgKrhxLXXcjETU
	abeRSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c898897816fso368332a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781778110; x=1782382910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yguuY96oSyrx72CHQn/bAXUqMvwHJj3BB8K1pDGSEVU=;
        b=V831hWDWb04MmiVTdVvhXZTYuFexVbuCZaYvdOeE4rUubIuFa2Mx41R//v6sA5Ft4i
         tAIu0Lxc+P3I9J2q/PBkeoim4H9AcFn1GjzgWEWeOQuVMVIoGNvyo1OSlguxwc8YdFUW
         X0IllLCD+vQrHSGT/yDFUkUwoorKV8Q5FbClIborOw/VXagH6vygtH90jcGrwsJ9gjyD
         A3wsleD85y+Zgzk+A05JPG/Gm4KHjP5+7GdIqipGWCvpF0HW95tMMM8NnoSjiRmxQKVS
         tyDx7MW9l8FHxMd/p7I/E+1gdaZ+W/+kokv+K4m5+Tv09Pqx9MFKWHhtHjFRzHXkyAbo
         VAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778110; x=1782382910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yguuY96oSyrx72CHQn/bAXUqMvwHJj3BB8K1pDGSEVU=;
        b=avoXd53htFTDg4azoPvZaGWThQeMvWyPByqLi/arZjbFSEomnPzFyrhtJ1WxmIKBpP
         qrs+HfZ4olxa1WCD1SGEH74Jxz1YyvL3gPTVeqhwBh49e6lZvH+EWVo4JRhMAjNIitU8
         6f/fDqB9pxzCJnubD9vlGiB3FJ22TwR0cD5fI9zvXnprdcxKoxgaQbHv1C8h10qpaSpo
         q3y47U3kORVNuHzOcYc3jUOXWKdYPm0+0Ul4AbgORXgUbp5J2RfNc/pH241AWM7NRi2S
         Ja0FJL616gchfEcTa+q5eQf7ST/BnCXGG1sq+eo95o9KQVmxBJh0FOzAiIrev8vXUihB
         +y9A==
X-Gm-Message-State: AOJu0YzV3l2XwaqU0bCN6vwAym+Be1FHYbNDIgOMymLJtsEYBtW1NtaQ
	/YCQjwar8E4TDKFijSmXZQybjdghaDDq2qYCZR2jx7rT7FeeuuCleTo+y4GN1eeGGJgWm7eqog6
	UUmp7YwnBPJihJGldfVwyj9///mkaOKRgcLK3/XmCIJSODpyugPYXCXXt4Wn4o9pdN8SC
X-Gm-Gg: AfdE7cnrsZkEx7HJxMM05YZTBHa8oMG1vhOQ+Yt6Kylnv4FshZiTde+z4r+7StPDQTn
	3j2V6dXh4yzb+HybHAVuHv9hjHR+/JpcYXKwyjM3ogFuzCgBw8hKcCOUKdT1TStlg4Xrpz1Fc9J
	6UkA/AI/ETa00a7h+k1oomr/yjJNvx1KkUe7uP9iRr88b7G6EH96sjf+H11GjRWRSWnYskM1R4i
	NzJ+Hth6l/QIu1Ww8BRc/sMmazRA2yW1k9j5ff761qyVrJFcOL4MrExG7M+o/m5tNZ0kTm9BYeY
	uil7rj4cSwdWjIkh89FRnpu0h6UnHN0eg/hYoWQnXaB3Te9CuBaVLF6M5X7upjDjTKfJTl6gwjv
	Q98JrJ9lz9Zm8E1AemYe8sNccW3QcWZYI1iUwavq9
X-Received: by 2002:a05:6a00:b41:b0:845:42b9:60a9 with SMTP id d2e1a72fcca58-84542b96779mr1977666b3a.38.1781778110592;
        Thu, 18 Jun 2026 03:21:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:b41:b0:845:42b9:60a9 with SMTP id d2e1a72fcca58-84542b96779mr1977632b3a.38.1781778110132;
        Thu, 18 Jun 2026 03:21:50 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b055095sm22715971b3a.57.2026.06.18.03.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:21:49 -0700 (PDT)
Message-ID: <5941078e-2376-46a4-b9e2-9686de1ca991@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:51:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
 <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _PoeMkX-Qj_BCUw3hINxWPKk4-R_moeT
X-Proofpoint-GUID: _PoeMkX-Qj_BCUw3hINxWPKk4-R_moeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfXzUOLmG5LpSWw
 m468SZAkZDWmim2p19DB5sooiNRh82PZx4YTyvlF6e41bidHuzCph+RQUTG/gZ0aw5QYzvv+9G4
 LkED0MSQ2XiljQeH8oB/fsV6wz6Ogpc8YNbBKme6gu1vfRC26cHviHzSTUvN6AT6ulaNnsXhK0z
 9MF5U2CqTpBHxhlYbpnvsiWd510DPQ4ma5w/KC+FVWsoIf/WSjV19ec/nPUnMq9SkWLokPuhjY1
 JMw7lkGAKeCU2q2dIPUncXdDWvrrSExuVZ4KUGhg3a0oOxdLEYsivC98tMotcpj119eTXniRu7t
 F4XDSq8l+SAt0Sqtcjr2jneZbL2DEV/PTuu4TpwQaZ7Am6PEPqIK3ige3/YovxYl+YBXUNqx6Xx
 sTox/TTTRQeGKQdyNIHxQrhD/CgwbuOLmCm8nY2/Vl4fLN32oxNctoBsXKyFiWmFe0YYDz3zJCW
 0S7kBsTw3V8tmNOKsJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX5SlkoAUsKfV8
 lbLJYikNWVSlPKUtFABJ2OykqgA3FA6Pn0Q4gkXQb+nTjVRgaXR8uqQzt02b/Dafp5+xj2ScOkI
 G2Ho36iorny7Uqi5yksxhZ2/LdIeYuI=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33c6bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-7KxEBqrqmoxkvx5lt4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113720-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D78F69F4BD

Hi Konrad,

On 6/15/2026 9:26 PM, Konrad Dybcio wrote:
> On 4/30/26 10:58 AM, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
>> pmm8654au_3) on the Lemans platform.
>>
>> Each ADC node exposes the following ADC channels:
>> - DIE_TEMP: PMIC die temperature channel
>> - VPH_PWR: Battery/supply voltage channel
>>
>> Also add the io-channels and io-channel-names properties under
>> the temp-alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
>>  1 file changed, 93 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
>> index 341119fc8244..6caec3e4df4b 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
>> @@ -5,6 +5,7 @@
>>  
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/spmi/spmi.h>
>> +#include "qcom-adc5-gen3.h"
>>  
>>  / {
>>  	thermal-zones {
>> @@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
>>  			reg = <0xa00>;
>>  			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>>  			#thermal-sensor-cells = <0>;
>> +			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
>> +			io-channel-names = "thermal";
>>  		};
>>  
>>  		pmm8654au_0_pon: pon@1200 {
>> @@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
>>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>>  		};
>>  
>> +		pmm8654au_0_adc: adc@8000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x8000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#io-channel-cells = <1>;
>> +
>> +			channel@3 {
>> +				reg = <ADC5_GEN3_DIE_TEMP(0)>;
>> +				label = "pmm8654au_0_die_temp";
> 
> Are these labels namespaced, i.e. can the label be just "pm8654au_die_temp"
> or "die_temp"?

From what I see, there's no functional issue with updating the label to either
of the names you suggested. We made it this way at first as we thought it would
be useful to have the exact PMIC instance name in the label of each channel.

Do you want any changes in the labels? If yes, which convention do you prefer?

Thanks,
Jishnu

> 
> Konrad


