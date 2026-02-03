Return-Path: <linux-arm-msm+bounces-91662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id woy/OC3WgWlDKgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:04:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39222D810E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 12:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A83730599DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 11:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D8432AABB;
	Tue,  3 Feb 2026 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/rKkRzD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtoBBKbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F17314A64
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116570; cv=none; b=RkguxtssiugEljBzHuHrr12KHQhk+0G69dcGUyas2jLOhYTUxJ7FEeOwR9DilM+KfquJk12RLxm/uqFsfL0dTL3wtMkWsIjbOGQNGw9gkzcaa/MEezjQHXa/niA1qNzN8R7GXQgb3DKnVpalmh2nyNaJuSCjVp6GKi9jjmFTSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116570; c=relaxed/simple;
	bh=QuTrw6czsjLsh9Zkh0KlENsiBDDDKSF2wAkGMNmNW0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InQxjmsnhFioAXO76JrKIWBjk9RAnvffH1runoaKxBcEDjbB6S8jiLHUy9NLqqVNZA4xXeMrlKTaK8x9f/Rl97aJiBSTtCtK8s28ZFHllnii7eK4cchDtegeP72T0wOVQ7jjlFGgD3Th/gaNm4PTFMadQuMKfWFKCGfbMVECNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/rKkRzD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtoBBKbS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136u2Z62884358
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 11:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ayZ+gXkydNBiItbai5ocWv4aGOtcGOZ63CbJZh99qY=; b=A/rKkRzDLjfhzVDe
	W1Aus5OBECyUzuPPppwN0GZ3+KBmbJtbZQY9ETUS8qIq7luWf6UCqvfs9pbkOd/y
	o6VSDR+eg4dhZlJ328zuwn7OZknSOxIwHLlr4jfLSWyQw5O8vTHaHXvck+GhwqqD
	irXMHXGun2qaKk388CP1vQGEUGOSuncnH0qN5ZQkFVpnasWf2QYAtGAuM/EhFdHb
	XIjoofKQfLF0GH/p82l854qayyeWGUJCVjgmtChGkDwWMA/WhPTvYmO+z93IxWjB
	O/eN8HworSSYwVXQchNQ+Gs2DTYbaBYXOTvcknZJtKJMtnEmKGCTEO/cOW2C5XvT
	GjfWEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3ku45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:02:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b48c08deso109452885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770116567; x=1770721367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ayZ+gXkydNBiItbai5ocWv4aGOtcGOZ63CbJZh99qY=;
        b=RtoBBKbSs/Fg7yNMFgWtYgzUwlujv8rkbD4mLGB83838mV86P3mgQebcsShb4FgjtH
         QTthWzw62v63eBabSLbN/6/IBsYJfdJUnI+Ro06+f+FWw5/Xfh5SbJPmV4cBK5se/TyB
         7oEfrdbrz5k4TEX6XuP5geF5c2jHHyzMnid0kuZdR3gnzTb2YBC7rIzozaTMJtutQ1LK
         6DnISPnPy10YK53ZqmESW2cxmYV+FhLqwhsq60zjoi3KW01aJIt9t/cofWKVn5SqKINl
         wLTlaba0qDCRx01auHxagikeEswxqgDVKM+YZ7dBK1ellH1dYITPPseQ8xgkFt1pHJeD
         wZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116567; x=1770721367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ayZ+gXkydNBiItbai5ocWv4aGOtcGOZ63CbJZh99qY=;
        b=UwR+YWPJfY5/zov8CVp8FeHPG/r/HjNGMJ6YBkAslEzD/029QsC6cfdSqZ5oJVaAKR
         OUaVuVj2XBzVCaR8C1pkXSbJe9YVYzXFbEUmhSh8ByZTVBZVGsNvp6YlTWoycgpSEOxm
         OkbPhZxYcM2jyzIAvtxBifP8DrohbWUK8fCPXMKhwB6cXiZYSj16HHbCQ4y8EglLm8gt
         6IJz75fZWmv7ebdaL9Fqei2X/3uyLYbmefVWWt9nm//UL5urwzMk+63yldegUr39KmZ9
         t2+Gvv9asZ/fRrKTa79sL0KJUP5fzuRl/fZD37Tf+tc7abmPgWC81sp9Bre5Pq41auju
         MKjA==
X-Forwarded-Encrypted: i=1; AJvYcCWT7KCHv5PxeAIc/CTukb822Fgz+qNE5aadfUkondCZNkRGYCl/oqd0li/+0NPqCePR1v1Q4CXq0keLHdFT@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhWmm7THgIpftw1zkFZgeKOWNy80wQnkNqcmmmojil/wKZLNp
	0XpTNI7mVz3MyNFiFXS5TQDSKJ/U+FLXSUAA9df76RbzU2nuCK55f+mc5zAMsdHKkMyZW1xFuKE
	ZMq00Q5qrt6+JPT0wJiqaR78zbza8QYbgXThjYvE8S2mSvTZ1jWWUlE/A3+RLCz1QDSap
X-Gm-Gg: AZuq6aLU4CsnFRuP2uCfB+HWmyRVagdHU7rPbcs6SvPZ1LHjprysc0LSim3dnCpqkJq
	RH2j7gDiPIQNZRbZDL9EaCbFGbOUgnK7F4EeakuU+E5d09VQuK6GUhSuFmsNvvVaO28ldftgvIK
	HxWar9iKLkJqJONXJ0EKGKXgMw7dU/yuy7SvcT+CpwMBNRokHwycTPoIInfvOiN73123bU0HBP4
	a81f+W77wWoRiBZYMGxN1MbWE/AFmHtNIL2/41Sq3SyyMG+uiTRVvZQgUn2Yr1fQpMJwx5amKlM
	h2VeVB8RX0RJ0tKzz/5BHJI2O3kpBLs4sMbTz2GYCalHIZSfYXWZwoIWfiHMHhlLpM0r8N1FWLb
	alTtTGtMOG6AN0MlgecyAR1aKH5fUGvrEEcIbOCifvp2kBR+nyGfknMHxodmtRH4vovs=
X-Received: by 2002:a05:620a:1371:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8ca1ea33f5emr208138685a.1.1770116567235;
        Tue, 03 Feb 2026 03:02:47 -0800 (PST)
X-Received: by 2002:a05:620a:1371:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8ca1ea33f5emr208134685a.1.1770116566590;
        Tue, 03 Feb 2026 03:02:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6besm1021396766b.60.2026.02.03.03.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:02:45 -0800 (PST)
Message-ID: <a13003ea-27be-43ea-b739-8d5d6ba69d0d@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 12:02:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: add Acer Swift SFA14-11 device
 tree
To: wwf <wwfu06@163.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, andersson@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-3-wwfu06@163.com>
 <033aebad-b148-4cb9-9259-8f6e65dfc39d@oss.qualcomm.com>
 <a1e3fe8.91f5.19c04eca0a8.Coremail.wwfu06@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a1e3fe8.91f5.19c04eca0a8.Coremail.wwfu06@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pRPUKSwA5xO1dZ4A2bmeYCk-6WP5W5Vj
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6981d5d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CREK5DSrAAAA:8 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8
 a=Rh-Ss-q99bdTC89tTRQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pRPUKSwA5xO1dZ4A2bmeYCk-6WP5W5Vj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4OCBTYWx0ZWRfX/X9GOTH3zTjE
 NzvMsV15vBqD0zYRZWFXBngetEfLHwY6rF+PPaskr/XRI34nEfFKbdNpQgcLNuKzvxeG46oEMzG
 4fVKaAFqVVK4xFTVF4dTXiVkP8H9QnE3AwB6VuZredkWWbmdN4YS+V8gWCxEU12OqB+tq6ONbOO
 Evhtsq7JvhZhy0ZndM7bFkdWA1DXpCl9kyfxyRwT1Q82KJ/GrTT8fQQOo04kA++aZnrDO0Mje/X
 9zY4pYhF65SVGB4xykthjdMHh8Pbwl6+AA4PGpWnEJTpD4JaxDmjJFaeiFtHaMKd/U28F5K4y9C
 s4l4IhQO/W0YDmRa0dkEG0SpRSBEB7XUdAcHOVJmug0JZU5tJfrfzNJgTI2QC8qnf83Gy6n/xTW
 AdJR1sJAZoMRLh5eV8dra7/nokSohkem4l72UQQljJtP0otrQdF6Q6kq7Nd0oxHsGnndu6i6vgQ
 O0SabuHYLkOERBhClxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91662-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,4f:email,0.0.0.28:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,0.0.0.10:email];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.47:email,0.0.0.43:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39222D810E
X-Rspamd-Action: no action

On 1/28/26 3:05 PM, wwf wrote:
> 
> 
> 
> 
> 
> 
> 
> At 2026-01-28 20:25:22, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 1/21/26 12:27 PM, weifu wu wrote:
>>> Add initial device tree for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.
>>>
>>> Generated based on x1e78100-lenovo-thinkpad-t14s.dts.
>>>
>>> Adjusted node ordering according to review feedback.
>>>
>>> Passed format checks and successfully built without errors.
>>>
>>> Signed-off-by: weifu wu <wwfu06@163.com>
>>> ---
>>
>> [...]
>>
>>> +#include "hamoa.dtsi"
>>> +#include "hamoa-pmics.dtsi"
>>> +
>>> +/ {
>>> +	model = "Acer Swift 14 Go Pro AI (SFA14-11)";
>>> +	compatible = "acer,swift-sfa14-11", "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
>>
>> The lenovo part needs to go
> R：
> I have reviewed the DTS files for two other Acer models in the same series submitted by other contributors, and they all directly utilize certain drivers for the T14s.
>  Due to the lack of official support from Acer, removing the "lenovo,thinkpad-t14s" node will likely cause some hardware components to malfunction.

This is plainly untrue. The T14s is not special in any regard, and there
doesn't exist any sort of ""T14s drivers"" for the X1 SoC.

If you came up with this reasoning, grep for the T14s compatible string
in the kernel and convince yourself that's not the case.

If an LLM suggested this, it's hallucinating, very badly.

>>
>> [...]
>>
>>
>>> +	/* two muxes together support CTIA and OMTP switching */
>>> +	us_euro_mux_ctrl: mux-controller {
>>> +		compatible = "gpio-mux";
>>> +		pinctrl-0 = <&us_euro_hs_sel>;
>>> +		pinctrl-names = "default";
>>> +		mux-supply = <&vreg_l16b_2p5>;
>>> +		#mux-control-cells = <0>;
>>> +		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
>>> +	};
>>
>> Are you sure this is present on the Acer as well?
> R：Untested!

Why would you include it then?

[...]

>>> +	/* ELAN06F1 or SYNA06F2 */
>>
>> These look directly copypasted from the Lenovo DT, so I have concerns
>> about their validity
>>
> R:It is mostly the Lenovo DT with only very minor modifications.

Again, that's not the way to go

[...]

>> [...]
>>
>>> +&i2c5 {
>>> +	clock-frequency = <400000>;
>>> +
>>> +	status = "okay";
>>> +
>>> +	eusb5_repeater: redriver@43 {
>>> +		compatible = "nxp,ptn3222";
>>> +		reg = <0x43>;
>>> +		#phy-cells = <0>;
>>> +
>>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>>> +
>>> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
>>> +
>>> +		pinctrl-0 = <&eusb5_reset_n>;
>>> +		pinctrl-names = "default";
>>> +	};
>>> +
>>> +	eusb3_repeater: redriver@47 {
>>> +		compatible = "nxp,ptn3222";
>>> +		reg = <0x47>;
>>> +		#phy-cells = <0>;
>>> +
>>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>>> +
>>> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>>> +
>>> +		pinctrl-0 = <&eusb3_reset_n>;
>>> +		pinctrl-names = "default";
>>> +	};
>>> +
>>> +	eusb6_repeater: redriver@4f {
>>> +		compatible = "nxp,ptn3222";
>>> +		reg = <0x4f>;
>>> +		#phy-cells = <0>;
>>> +
>>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>>> +
>>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>>> +
>>> +		pinctrl-0 = <&eusb6_reset_n>;
>>> +		pinctrl-names = "default";
>>> +	};
>>
>> This laptop seems to have 2 USB-A ports and no fingerprint/SDCard reader,
>> are you sure all of these are present onboard?
>>
> R：
> This laptop features 2 USB-A ports, 1 USB-C port and a fingerprint reader, with no SD card reader.

Then unless there's something else dangling off the USB bus, not all of
these redrivers are physically present.

>>> +};
>>> +
>>> +&i2c6 {
>>> +	clock-frequency = <400000>;
>>> +
>>> +	status = "okay";
>>> +
>>> +	embedded-controller@28 {
>>> +		compatible = "lenovo,thinkpad-t14s-ec";
>>
>> I highly doubt this is the case
>>
> R：
> It has at least been tested on the physical device. Due to my lack of professional expertise, making excessive modifications rashly would be more likely to cause hardware damage. To be clear, when booting the sfa14-11 with the T14s DTB under Linux, the power consumption and heat generation are both more severe compared to WOA. However, based on what I’ve learned from the Ubuntu community, this is likely an issue with the Qualcomm power management driver itself.

I understand your position, however due to you admitting you're just
copypasting things and hoping they work, we can not accept this submission
in its current state, as there are parts of it that are clearly incorrect

>> [...]
>>
>>> +&i2c8 {
>>> +	clock-frequency = <400000>;
>>> +
>>> +	status = "okay";
>>> +
>>> +	/* ILIT2911 or GTCH1563 */
>>> +	touchscreen@10 {
>>> +		compatible = "hid-over-i2c";
>>> +		reg = <0x10>;
>>> +
>>> +		hid-descr-addr = <0x1>;
>>> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +		vdd-supply = <&vreg_misc_3p3>;
>>> +		vddl-supply = <&vreg_l15b_1p8>;
>>> +
>>> +		pinctrl-0 = <&ts0_default>;
>>> +		pinctrl-names = "default";
>>> +	};
>>> +
>>> +	/* TODO: second-sourced touchscreen @ 0x41 */
>>
>> This again looks directly copypasted
>>
> R: 
> Indeed!
>> [...]
>>
>>> +&usb_1_ss2_qmpphy {
>>> +	vdda-phy-supply = <&vreg_l2j_1p2>;
>>> +	vdda-pll-supply = <&vreg_l2d_0p9>;
>>> +
>>> +	/delete-property/ mode-switch;
>>> +	/delete-property/ orientation-switch;
>>> +
>>> +	status = "okay";
>>> +
>>> +	ports {
>>> +		port@0 {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +
>>> +			/delete-node/ endpoint;
>>> +
>>> +			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
>>> +				reg = <0>;
>>> +
>>> +				data-lanes = <3 2 1 0>;
>>> +				remote-endpoint = <&hdmi_bridge_dp_in>;
>>
>> I don't see a HDMI port on this laptop
>>
> R: This laptop does have an HDMI port.

I don't think that's the case, see this image from Acer. Unless the
SKU that they sell in Europe is different, with the same model number..

https://static2-ecemea.acer.com/media/catalog/product/_/a/_acer-swift-14-ai-sf14-11-with-fp-with-bl-on-wp-copilot-gray_11_nx.kzxep.002.png?quality=80&bg-color=255,255,255&fit=bounds&height=500&width=500&canvas=500:500&format=jpeg


>> Moreover, I'm highly concerned about the regulator settings, which
>> differ between boards and may lead to permanent hardware damage if
>> misconfigured. If you took the values from the T14s DT as-is, you
>> may be doing yourself a bad favor..
>>
> R: Thank you for your careful review. I believe that currently, with the exception of a few specific laptop models (e.g., the ThinkPad T14s), all other laptops utilizing the X1 Elite/Plus SoC experience more or less issues when running Linux on ARM—and the SFA14-11 is no exception. That said, I hope to raise its visibility and improve it through my efforts.

Your reply doesn't at all address my serious concern stated above.

Konrad

