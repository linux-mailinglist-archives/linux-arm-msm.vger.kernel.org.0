Return-Path: <linux-arm-msm+bounces-116627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ublrHRc8S2oQOAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0431170C92B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TRz/lNow";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HkxdST0b;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116627-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116627-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36FBA30022E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501033B14C6;
	Mon,  6 Jul 2026 05:24:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A30358372
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 05:24:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315477; cv=none; b=h2TQIJBxKQMVRbfhef/54omVD8Z27zofNzgSeVq05oHxcYNzcaEBbaRIKD6RT//cvQ7son1Vi8iRyIwG/mqYDz3riBFeuwPiI0063ySifN5I9l1bK7VkHVmt5xl8fd2RbMf1fzQjDrFnRYQLsixUC1c7H3aflwdEwHPXNUkakTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315477; c=relaxed/simple;
	bh=54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrUTJaX38MwWEQBv7ZpclZF1d9yYOkl9Rpi2UAXfwFTM+gPP0okhlxVrqhfX096g4XYYoKrVxoc2+0Fgr+sSMV6+8og6IJbQQnXh1XC5jbvR+hhpHJE1tq+DHNkK9EkZo3jskvLaH/7ITOtW9WNlr+YV0ApkfOYKS52tNkrh/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRz/lNow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkxdST0b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666420ud3595055
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 05:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=; b=TRz/lNowIFIWAeE1
	bM5uwmqz7wuLhj6jDrnsb7DBqu1R+X5NMnuz9fvdlzsvk5pxBPbTtJtKKMbpBc6y
	X51ZeB2PfPtptpbgEBqdZrwtJvDQPOI04QGacg4LmrbFJtUJKNW6pUHBEX0vp6NR
	+4S/t+h05GwLFTXjgTxB5SPOWHGZhUwbRQzCH933h0E8D/hL7hq22GjIU4vOMKPz
	FJW5DcGIvDIillMbItlGjdGaMas0xpX3h3SPmhlSX3L4pC94liit2D8MmkMVnt9t
	yfSwNiQGJx6JOkI8M7Lop/YD6OAX6tCR7qU89zxSq589PS49QQDW8XBiOU1hd9oP
	cAhUGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgvs5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:24:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84622d6102dso3463864b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315474; x=1783920274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=;
        b=HkxdST0bLei04e1YrMcOXhFJC7kxGJG6rH3xuiJDNQdYwTFwJiU1nMX54JDGzfrHCX
         HbwWgrGBW/H/GIRgZk0VyJ3jxJvOTpiyacwBLq+mXKCU8RGgQTuDr05z6a+lijebqJVy
         J7Lq60qrKAaZaiiWhgnYVQc2eCoDEA//AUo1HS6IZtD4kwkM26YdPbl+AzVISVf/hveh
         VIhcBixui2abTvQs1YUoa0WZu5Nnn9i41D9LQ2NQPbGtfJZNpJNfSHYfD+kUUTIy6yDG
         V6Ki6SAXcXFwvwVDwMJOOweOe4zCaCVeno1zVd0UEI2dmxnxeMJJODGq1C6XFkYz1E/S
         krTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315474; x=1783920274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=;
        b=YmZBz6SJ7LRBzVOFLZFaFIXOxnxKCB2OS0yeKkBBXsgPLM3rc6PpPWFB+4TSk8E2AV
         /TSDO8diiOXyFzKA74PCGgabHc/c4fPLXICCUD0nfiJ1G10oQ1eOmr4jDttDlNA2Eyng
         lOjy9qqO89mWbMsjT409qlw7cRBaUbIDu6InsTxt683hRcP1ZrCaaXPxqQZgQ1mqbVmH
         wtqH3bI7UUL4Z8cTYlMQr0WNgPPyD53sgLy4w2/1cAJv1zcvCm8ZNLXzVQKbxy9NPDNH
         oW/jx59m0yNB47OBxiRxumvvEB+tCJ26wLkXv4iPxsoHxCuNOmGr6Q/i0Dno74cguN4L
         EL5g==
X-Gm-Message-State: AOJu0YwJ61WxbP2j01mi/12ejLZQ1z96sHlX3d9c5yIm/UDV53hjM1YD
	eC5IQcDY/6z2I62PE2lZ15bHBSkiqKJ0iw40oFm9EQHoIHSdHnU94ZW7Wrt4LWGeGqpAyhAgIsX
	vfcETGxDSBahBjNyfc2+l02zEiQ4rucmQycwz0Mq0mhEzYzTC9OcqDt3VvjuNx2QVXvxa
X-Gm-Gg: AfdE7cm2S+VyP5axta4y05eGSQ5IgZuPiDXSzFkW21XOe9kssXx/wud6PAz+i1JXCoj
	DCuq6eiqWzSTTEfeXufKnY99Cw1HPtz/ZddhcSFLBQIRW75+QQG4elv9/46EtRhaw0CrWQFUjGg
	sDxyYfNLI10c3ieEJwG58wZCzD2zam/26qeDXca50BVibxDozOqOvjiHSSmH/uRo39bAL21dYRR
	u8J147U21nf9oPiCRcf7r54pXH0PdckusBAJALR1J06pZv6TwV8PriGhK8TV5XYN5lezzeV6Wsg
	SsmhU0GI4+LlADqmKdoys/JTA0u7ObaF8Lh67SudZ4o0DvInoHSnzCmKA7sYSHSVTrILM0nbwLu
	Wv6ePuKKRY/hMwpqC2peeVju+qqWmU2M3Gs7CyYUe5rc=
X-Received: by 2002:a05:6a00:13aa:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-847f6d5a46fmr7785397b3a.2.1783315474545;
        Sun, 05 Jul 2026 22:24:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:13aa:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-847f6d5a46fmr7785383b3a.2.1783315474083;
        Sun, 05 Jul 2026 22:24:34 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm3083865b3a.38.2026.07.05.22.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:24:33 -0700 (PDT)
Message-ID: <797bba33-17fa-4fbc-a4b1-55735b3b5d57@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:54:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <926681E76F71D6A7+5482f550-9a97-4a01-95dd-6d4083bcf5aa@radxa.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <926681E76F71D6A7+5482f550-9a97-4a01-95dd-6d4083bcf5aa@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b3c13 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=znafaEsSs40IBW6ZQ9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TSFHoKGIqkz5M-VML_fW7GxFYfIbFzS-
X-Proofpoint-GUID: TSFHoKGIqkz5M-VML_fW7GxFYfIbFzS-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MSBTYWx0ZWRfX5sorfRRbVewf
 84rxuBxyACV5P70AMge2FIfqtWWI1W55EzdZu2hCc8b7bFfPO2Hs/NC0yN45pFeCngqIBgwj7Fg
 MxIH51to0KKu8nzhJUGfecXvrzXzWqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MSBTYWx0ZWRfX4Mg73eZTMmGP
 PbcdPX++2XjXw1i7zDILx8RilDiNSh+1ZiJCQQAZHW+AHpbyaB7P8Rkn1Lq2NzjAK8HKAzd5RnX
 d/tu8UrvFEH4IgfTHqx2jbRsRLo3BGA5n+PovIi2DoBmwy61p96T/a8ShAk+hHuVrXlncpESBb5
 5pdEdPQvFi9xXJ1Gbt/0UxTiW4EFDrjYBBVHso9cOVEo7IllQAlHACiwXYqqCkr1ScTf33bgDaZ
 5ZGIIq7gcU/OzrXcwDFTBrpunglgvKbZM3M7JEQCX+FkieqwUlGTyGO1StnjWM+jwfR9jRrkVU7
 Kobudj5JAP5tdU8DFcXfVikfsWTbtbu6gsyW8jxIuFgP0hH/gV+kO2gge5TJJA9bMC4G23PaD5f
 040EQ6C52V7fQ+1cE+6ZQjtHLJuAy180fynFh/HfMrwXN4v/QbBcE0d0EARKgovEPc+MadE5HNH
 +hPzXCgkrHi8/J2dsUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116627-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0431170C92B



On 7/4/2026 9:37 AM, Xilin Wu wrote:
> On 7/3/2026 8:38 PM, Krishna Chaitanya Chundru wrote:
>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>
>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>
>> Override the base iommu-map with the expanded set covering all the
>> switch's downstream ports (0x1400-0x1408 SID range).
>>
>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>> from the PCIe controller.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 141
>> ++++++++++++++++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> index ba41dbc34b81..c2afb8372ab7 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> @@ -12,6 +12,26 @@ chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>>   +    vreg_0p9: regulator-0v9 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VREG_0P9";
>> +
>> +        regulator-min-microvolt = <900000>;
>> +        regulator-max-microvolt = <900000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vreg_1p8: regulator-1v8 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VREG_1P8";
>> +
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>>       vreg_pcie_m_3p3: regulator-3p3 {
>>           compatible = "regulator-fixed";
>>   @@ -102,6 +122,104 @@ pcieport0_ep: endpoint {
>>       };
>>   };
>>   +&pcie1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pcie1_default_state>;
>> +
>> +    iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
>> +            <0x100 &apps_smmu 0x1401 0x1>,
>> +            <0x208 &apps_smmu 0x1402 0x1>,
>> +            <0x210 &apps_smmu 0x1403 0x1>,
>> +            <0x218 &apps_smmu 0x1404 0x1>,
>> +            <0x300 &apps_smmu 0x1405 0x1>,
>> +            <0x400 &apps_smmu 0x1406 0x1>,
>> +            <0x500 &apps_smmu 0x1407 0x1>,
>> +            <0x501 &apps_smmu 0x1408 0x1>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&pcie1_phy {
>> +    vdda-phy-supply = <&vreg_l1k>;
>> +    vdda-pll-supply = <&vreg_l3k>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&pcie1port0 {
>> +    wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
>> +
>
> Just wondering, is there any side effect if PERST# is described here as well? 
one of the driver will fail as both are different drivers both are requesting
same GPIO.

- Krishna Chaitanya.
>
>


