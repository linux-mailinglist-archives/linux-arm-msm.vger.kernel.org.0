Return-Path: <linux-arm-msm+bounces-113167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0dNXI77sL2qKJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A54686113
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:14:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YC9mLsns;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V6Z+OMh7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB5BA307BA16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6309F3E7145;
	Mon, 15 Jun 2026 12:09:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013ED3E5A3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525384; cv=none; b=X9hJHh2jJs4Z4lTAhG3Wxv0wyAIvJUR2ocH+gyFtmNzZ++H0DuMESNE83vmq289DaFMh3esaEctKXFVCyik9FDDtLDMbi9R/ye+2qEZEj7tsYwdOAZzlBj3hCkXrvaNdyj3h2lY7oT83V6NRY9PI0fZp+/CMItQ1HjFGgQsYFys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525384; c=relaxed/simple;
	bh=XtO4iL05RYNP4mvns6ypWCaRum1PPnfMKppbq+fRd14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWDQLzxHysbxsZc7maKRddc/OH6aBxLW18rHd1FrE1DsWStH356sHgunFTWBQydZjVZdH/PefgqEBLxNLBaAMMKz2zUTfezc1w4RxSrqkwe5pnkvu+sZR++WWBz08ZWrUaCFFHTRnsyaQWvrmA6s3G4j1Cim2znCSpDxSBTvMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YC9mLsns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Z+OMh7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FBoVTx464209
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=; b=YC9mLsnsBWNLnUza
	35EprpEWuy4EUuPlGtPkw2oBFoFTHspuHoZZGLy+poR1XlrffUCaYeFhv2D786qt
	JgdMWOwo468rj5TzwhTugvM9yKS+3YDCasvScg852S2ZnDRoWSqwGIB4eqaFWODO
	XDdyu+aTtiH831iXuaIyCxqvqqbGCWdLolI2FydcVPag53wvAizQq7WW2PuRxtmo
	gHWeNmkzmjl3v1d+zdnrhY7OVQuBEgL39gsyAHamPqa1M2FBcigBsJENm1OWDdjq
	wFf//cIKuiCyylcFpa/CoWNwaZnvY/bT5N6mkuJ/aeQ4QELgQyKtsBxRs/47SMmd
	CKe9zA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhg27n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:09:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8d37bc61dc2so9856806d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525381; x=1782130181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=;
        b=V6Z+OMh7/NyoXjM1PVtEKa6yg5DPvkI7C8RcgVxnO+0Myn5YE1QCUEkObbQtvnW7D/
         CQnip+0hmnJzrTDt/kyUi7i5rKm+3p3mSPrO+163zxWV8RhdH7/1vc/JXKaVSUHNqyYb
         o0ehtmrVDBuJipeNg5opJmperr7tQtD3++0bxKQOcnkD0KDSkCZUIF24KvsIiyHALQTj
         A/JIt4KNH0i/WrUUZb53Ddpm9/KJuU1CZS/poRiphNdmog0UfKzWw9E8kZnlhXIUFN5q
         JwYLXQ1Z2EtfqtItlcz5kV5yPMYNFny4B28XiERm8Ihp2v0CJFihcCqKVcakWnpoVkbB
         8efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525381; x=1782130181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=;
        b=K0aaRbQkTezprSukkTA1lvOYwSAyqH5a7f64nJa0CYqBuTP8rQKbPQHILsrXJqeKU/
         aFCqXR5NN+mZs0OuJ31cRQwASSAejPDBAMEsWM+jPJQqYHzzHAfIrBiVs7X14UM+wY5G
         Jd1Y/CJMmWTxaNY2xuRnoJ8Vpt31GbBrAQ02LLk/NIJiHkMGP8L1xiD3RMM7vReJ6SP1
         fU2VJ5vrE6WpGQSPW8Z7tSIwvMpOIH3a9tXsJzUsusM78cEjbuLF7xDWL9CT9KlCpWqx
         g61GuuwYQ/09TRjA5I2kubdjUTlG+Kla1AJUjKEyASafNtoiw1Y24ZEsGx841eOMI0hR
         W02A==
X-Forwarded-Encrypted: i=1; AFNElJ9x58QcBofRm+tL/NbCK7y3Ye1jPbiOtEBeooQpsDwIQoVpYpdgjUAyKf+E4fDsPpWLnuGq2le8RDCgaqTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60SjmBYl6m5Zfnta/OY3NrWWlBLbD9UDBteGPrpMV4/sTUPfA
	HmM44O06T3WS7ZtOx9kcfl7siRTBAGYSOL0WsOwyePRZtiK0/5P8UXCJQpVyz1rOTIOERV+lhyI
	iCoG4jIWe6J/SaaxmE4cKBIcKT9vXxx8xaoomVrcWIUjBW1JXK7lKayuv2HNBAhT96LYp
X-Gm-Gg: Acq92OHCFSAdierpZOw/r5k5N2DNw29ECfHKkL4bUDCeWGXEk7hn82d6XP1w/G+qcXO
	2WMX0PSouTqn49Xe4PQbUN7TkJGj1FdlAnEkWEgEMHdPKpXzFXJIwmd0H44IXrSu7dPkFoRqGC5
	n/VlRVfmjZpPDFqSV9Gmun5xCxnbZT6rsHg6G4FyK8B+rl+rXTrJS4dT1Et1+KFY6YlnQgzB6M8
	rVHqwGCR6IDEJXPSixo2cVQlqs+2rPHarZ33ScYvipd7XTBUi6X4aL4MoVSGv9iXk3MFLzosP7v
	XTDNQ33NpqQ6w6/03mro2LQp1DPhUXwNA5K2XWakneysEWZQvAAy6FQu1mIkYiAZO71vuBiEmvq
	H/e39Y4oGlDWkl02Ay+Pqku5rqo2Xz2Pa6qtApUPbwVshbQ==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1284101785a.3.1781525381226;
        Mon, 15 Jun 2026 05:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1284095285a.3.1781525380675;
        Mon, 15 Jun 2026 05:09:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm3452000a12.23.2026.06.15.05.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:09:39 -0700 (PDT)
Message-ID: <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfXxcbe6ajE9kEp
 GneO3ZG9BLPXtw8nW8RrDsMHks6NJu3T+YwZKC6ttXX23kh2Cfuw5y3eoVHXDWm7VLft4RoWxuC
 O4CGTXmHKvzJ2v36lpOdJu4eEJHEmO4=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a2feb85 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=VS-BQLoWTPCgKDwiL6sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 4vKcpHNoDmfAsl25ud6EuRr2CxqYqSBg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfXyBQK0tx/FY4e
 gchGhJJIMaElvPmyn7fEMSfcOnLV85NXYqV8/uiCrpfK/pX4yGJDsmtgv8w8StxPlbl1GxAoHAy
 LXQkaCLUhwqjGMX5jQsfe/KvTackeLHBNWlFLx7/ln7Rq9LGIVEb+TR9mnWuUOU+QPcYSGS75yg
 tm2l7oCkEjs8adC/oqH9qlkAVJAIFQN5OrCzfcvHGjns4WlMdzeIAwm+urCciRrk1S2zi/wCm1Y
 slEXMdOfZfVMGiWsVTO7qyLvOhflRifiYqnI4yEPxMxYpG4VA9fZrh0lBO9eLA4gWoKHoyQjC+q
 reEuC9cPYyT6sbBqfbiDmSng3dN0EFhRZZRSNnkjdOWag8fyCK3GYyUxL00p8ppIrLJ9dNBzSF4
 XSbIkgAq4uH3vMRuUFU1fszY6fYcmLkLmNWuAdzUv2FfA6nbx88s5tHnqBVBge/8qw7kWKhWY+F
 eBOahwwU5L8Gcv7mTdw==
X-Proofpoint-ORIG-GUID: 4vKcpHNoDmfAsl25ud6EuRr2CxqYqSBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23A54686113

On 6/12/26 3:46 PM, Luca Weiss wrote:
> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>> pinctrl subnodes should be sorted by the pins property. Do this once for
>> kodiak.dtsi so that future additions can be added at the right places.
>>
>> No functional change intended, verified with dtx_diff.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615..62daef726d32 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> 
> <snip>
> 
>> +			qup_uart12_cts: qup-uart12-cts-state {
>> +				pins = "gpio48";
>> +				function = "qup14";
>> +			};
>> +
>> +			qup_uart12_rts: qup-uart12-rts-state {
>> +				pins = "gpio49";
>> +				function = "qup14";
>> +			};
>> +
>> +			qup_uart12_tx: qup-uart12-tx-state {
>> +				pins = "gpio50";
>> +				function = "qup14";
>> +			};
>>
>> I understand and support the intention to keep this change non-functional,
>> but this pad "gpio50" is for qup16 also, right?
> 
> According to my QCM6490 data sheet, GPIO_50 has these functions:
> * UART for qup14 (OK)
> * SPI for qup14 (OK)
> * SPI for qup16 (no pinctrl)

"no pinctrl" meaning "not defined in the upstream dt as of today"?


> 
>>
>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>> for qup16 function, I find all of these are missing on the original list.
> 
> GPIO_54:
> * UART qup15 (OK)
> * SPI qup15 (OK)
> * SPI qup14 (no pinctrl)
> 
> GPIO_55:
> * UART qup15 (OK)
> * SPI qup15 (OK)
> * SPI qup14 (no pinctrl)
> 
> GPIO_62:
> * UART qup17 (OK)
> * SPI qup17 (OK)
> * SPI qup16 (no pinctrl)
> 
> GPIO_63:
> * UART qup16 (?)
> * SPI qup16 (lane 3) (?)
> * SPI qup16 (lane 5) (?)
> 
> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
> then SPI qup16 ??

GPIO63:

QUP1_SE6 SPI_CS2
QUP1_SE7 UART_RX/SPI_CS0

Konrad


