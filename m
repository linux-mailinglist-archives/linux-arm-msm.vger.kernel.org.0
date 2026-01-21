Return-Path: <linux-arm-msm+bounces-90020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFe4LuHUcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:30:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9281057897
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5267D60F0A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0657E3AE711;
	Wed, 21 Jan 2026 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBZ4KHir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kq3Cb6hw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F873C0088
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001025; cv=none; b=SK1m99HAldzAJtcRN1D+hvyFRcoqltoUg7wiBAi2bNv8lmh/Ranx3hLF1hVsbrtEvQtm2IDgWb0Q+9Ig02NGSmC3Y2FE3xheMw4QahDpiJ07rKEFYPAl+q9U3VBFHNCf8ag9jQoKsxwf9nyfH0rY/LC9ST2BhBe4CkLT2E/E2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001025; c=relaxed/simple;
	bh=AExPUgA+kfyEloWztCVuPwhHBoSNay2yRm2EIzVGO58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poWq62FoF/ki/ctDtQ1WXKLyRHOebDTnF1aYRQHKU0Pnpi0Rm9eefi+b3k6viggBmQzztse3odQRB/2HlWTBzQHrJ6wLntlsFwdoAojjC375SZZ+lSE/wNtEjsle1f7doXy53jKCp8Mf9W2gHlpQhsejHuT8YV7NKpATQ/O7Sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBZ4KHir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kq3Cb6hw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8YYal2065689
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jv6pNjbuzDS4zyQJwNw488Y6x5pVD2hTGd30mcVqJQ=; b=XBZ4KHirwYeL98EL
	hXEgK5NqNNUWtMtb7iAKIZmoNmLqlR1MgC+7ECBwHdWFT54a8KQ7jyynjyAfApoY
	XTSb+dPc1BTPKcDatkUjiFKto4rrKCMhClv9hxEsO1A0TVEKaORSRugj/LSJvp2Z
	4n5vr4J/3ilfvVKcB+gXt2flEl/n+LtSTqTPCYS230s79XUN0I3gSZGPmKnZnHJh
	zBeDnPsuu6ldKqOmEwU14lZoekouLoYBmalHBDTkOKTphoRjqK2zWPiZ/jqVqX2l
	KFONfX6P5PdMOJXRUlbfm3y2IEWSvRhLP5Tq4qTpSccZh3B96KJ2HwFHso1zbX4u
	1tRpXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btudp13bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:10:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so5826948a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 05:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769001022; x=1769605822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jv6pNjbuzDS4zyQJwNw488Y6x5pVD2hTGd30mcVqJQ=;
        b=Kq3Cb6hwx6O+7kUSxKNAzJPP1w8DYQFhFXYUztHd63w1mDiXupnR6w7ApaMHvdYQVZ
         9TmRKsXfEwL9v7m/WbQFBQdZDgpqlT9l9MF/N9ein8XF5TYtI1v/PRQc1qKlFqL37u3J
         o7pVUO6gyFh6VNEbiqaq/TdPsd7qeBMGuaIdQlHpqVPWv9iyRt18PKrl2ZPt2Acjedhs
         wL0gmUP1RDhoc0fp322ltanRWK62yAniwe2N2TUZ6Vhb6Aywkdui3mxjnoQnfgh0XlpG
         uUvnGL62mCGSDv+IIxKMRtynVuhNWox/d7A7eV4MhyOEknqfDjzTtCmixbbTeAoJJCKS
         Su8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001022; x=1769605822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jv6pNjbuzDS4zyQJwNw488Y6x5pVD2hTGd30mcVqJQ=;
        b=hKPNOyIjjyL35Vc2338Y62hpUPjdqwJ0wbUeOpFKhJbG8OEnoc2ok9K/EajWaPbaOu
         zdGhVBcXte/Ul4SRscBiivzS+bfnX+CBYVZ74qh1C0100h+zn95W706LOpeWfot8vjU3
         ogoTPDNbcQJJQnxR8ds0E6gRVIB5XPKRBIVQKLwELQXRda8BIfpLu4PW0mgn0Z/TigEJ
         MehYGZYprD7hfPpDGGjE5alLtcUX/soK0iJpAn+TuLHoFz3X8PnNcQvbzXCocsjhWE12
         kFoX2d/mx/ncxvhYT5EeBbNxQaGozKad/cURe50+sgmZuyjNgXv3yPLOJxsrTtvMKdaB
         XusQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGW3zvmMD73FXPj2OKTggarkrgQRt1st1mNIMtRsFhLov8FeO1f6AnNRsb4bUKU7c6x3/Nam7ExoGshH6f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywib6K6fQ+BNzU4Ba0z3llYWq6mh7Jsqp9hCN8mNEONeUNGwPl+
	6NWsAZO5E4/SnB0DPouP0OKP6CNxDNvNuhXP1XDqx9R0uXZ19OnWfeOUEVRBWs3Jmmcdf0mu8xy
	wbc7zvzLC3H60B9yDnOS20bVhLxo0TIWkpw1R07CPeidqCcdmVAxGcrz6jNqtXJynMXuazfZ70d
	nn
X-Gm-Gg: AZuq6aIPPG0p8NHZeislQHFU+yEw6oGHdhDGhxsLwX3nlnVGsTZn7unr3TQMhPnJWTL
	x5D6vpdPZfyQeXZ4WpeBIQ6pPcEm/FZZ4Xen03V0b9ByJV2GP2/a4ASpiZx408W95DyP9WMaAds
	VaICN9cJTb2bASyjV2bpAhY7QKO96V7Xw9yM93W8rC2eguePj0WwSb0XgDGR01Oy5Nzjxjsq9Wv
	8O4ZvS7IeocEB3glhN01uXrc1yQhC6IXDH6uoRudggBsswEMrsxTrWU3gAdVnBiFt0UtQt3+5iX
	xX+gsBgNBxiV7LNII1Zfdx9STsdnrbRhAy7LyTNUziOqdIFbMVIdHqMqQwgdcnJA43L8p4rEqBq
	czAnGposZuFKKraePIzQAxY4SDUTUZqR4UshMNUxZIVo=
X-Received: by 2002:a17:90b:1c8f:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35272ef882fmr14420932a91.1.1769001021482;
        Wed, 21 Jan 2026 05:10:21 -0800 (PST)
X-Received: by 2002:a17:90b:1c8f:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-35272ef882fmr14420896a91.1.1769001020941;
        Wed, 21 Jan 2026 05:10:20 -0800 (PST)
Received: from [10.204.101.164] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273102119sm14990030a91.10.2026.01.21.05.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 05:10:20 -0800 (PST)
Message-ID: <96c23434-cd3a-4fca-a3ae-45be6ff850c5@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:40:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        YijieYang <yijie.yang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
 <20260113102822.590677-3-yijie.yang@oss.qualcomm.com>
 <nfhjbfqflsrye7hqbtgwr5hwkwdtq5z4tbvnta7lk7p7jtvhl4@zbttn6coc7br>
 <7050d5e6-ddcc-4ccf-99b6-0888318c5d7f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <7050d5e6-ddcc-4ccf-99b6-0888318c5d7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J4gHA_GKvhIJByYXhFkRv1Q7IcJASRbq
X-Authority-Analysis: v=2.4 cv=DJyCIiNb c=1 sm=1 tr=0 ts=6970d03e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NRcXyhW6an_44wZncaoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMSBTYWx0ZWRfX5aHRFZrthABb
 eVI/vv6VlxaOxITgVWucDUTji68GT/jMp1U2rZlDTELV/tZjZm7nuTH5q7NE77KiPz7OTaj7kLe
 88XV3TzB3qtjrCVwAKZymod3H41aZvsZBfhfNPoDzrYw9VYFC5EN5jM1RmnjdmLbjHprkzgeYnh
 89B2VfcS2+4C+xtZ8gEex/oezGTzDM2rup+EVi6liECiqWuVZgl3H9wew+9YP1X3BfVTc5wpSW+
 /UZHmBb2mo8tywuHc7yLQfsWzKUuNVD3snR1ONXewPeMdyky+fb/trDQ84UGtR0hc5gT9NkgvFu
 Jk5gApcZhLIH1RNfxZRNSp7mANZUUhcTB/l/8+2X9sWi07yTXbrAagUkGsl8LThnDu0kwEpmLBU
 e0zLqdUNykk1I+otndj17LAIz54en8g66Y86tqyYAHHUzaOd0DaypGIN7bSEZ9y9yLfReHy8Hph
 YwHUKFXD3TDh94ekBaQ==
X-Proofpoint-GUID: J4gHA_GKvhIJByYXhFkRv1Q7IcJASRbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210111
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90020-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9281057897
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 1/13/2026 4:59 PM, Konrad Dybcio wrote:
> On 1/13/26 11:47 AM, Dmitry Baryshkov wrote:
>> On Tue, Jan 13, 2026 at 06:28:15PM +0800, YijieYang wrote:
>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>
>>> The PURWA-IOT-SOM is a compact computing module that integrates a System
>>> on Chip (SoC) — specifically the x1p42100 — along with essential
>>> components optimized for IoT applications. It is designed to be mounted on
>>> carrier boards, enabling the development of complete embedded systems.
>>>
>>> Make the following peripherals on the SOM enabled:
>>> - Regulators on the SOM
>>> - Reserved memory regions
>>> - PCIe3, PCIe4, PCIe5, PCIe6a
>>> - USB0 through USB6 and their PHYs
>>> - ADSP, CDSP
>>> - Graphic
>>>
>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>> ---
>>>   .../qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 11 +++++------
>>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>>   copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>> similarity index 99%
>>> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>> index b8e3e04a6fbd..fb90beb1096f 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>>> @@ -3,11 +3,14 @@
>>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>    */
>>>   
>>> -#include "hamoa.dtsi"
>>> +#include "purwa.dtsi"
>>>   #include "hamoa-pmics.dtsi"
>>>   #include <dt-bindings/gpio/gpio.h>
>>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>   
>>> +/delete-node/ &pmc8380_6;
>>> +/delete-node/ &pmc8380_6_thermal;
>>> +
>>>   / {
>>>   	reserved-memory {
>>>   		linux,cma {
>>> @@ -378,16 +381,12 @@ vreg_l3j_0p8: ldo3 {
>>>   	};
>>>   };
>>>   
>>> -&iris {
>>> -	status = "okay";
>>> -};
>>
>> Why?
> 
> Purwa has a slightly different Iris hw version (8.1.2 on Hamoa, 8.1.11 on Purwa)
> which I would assume is slighly weaker, plus there's probably a freqtbl change
> 
> Let's take this as-is and enable it later
> 
> +Vikash, Dikshita this seems like a really low-hanging fruit, could you take
> a look at Purwa support in Iris?

video should leverage most from hamoa, infact Wangao have validated iris 
on purwa very recently.

+Wangao to list the changes he made to bring it up

> 
> Konrad


