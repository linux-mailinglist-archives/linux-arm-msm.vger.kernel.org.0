Return-Path: <linux-arm-msm+bounces-103255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N+sHvlX32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:18:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC046402778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A02D630DB714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538B757C9F;
	Wed, 15 Apr 2026 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJHux/B+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wqqk0ISu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E415831E859
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244565; cv=none; b=FdIwZfWjFinIzLedmCFt9v5I5UC1yWfKVvCfwI3LTjBA03pTV3hZkPqpFmnry8ufWojp+8JPo8+m71ehryH/l2d6qurmmi/dc85VT3IYgdYhHTpsAWa3/WJtyKleNPICgysANgNnnj402p0UMtlMoYLvdv+r9w6U3q29SPTUO/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244565; c=relaxed/simple;
	bh=QNkwwdGTplaN2ppgL9tu0dkoxibRzxPJ7lAH0JdJOuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/SgQZJIZvQ7fv7o6pPBtPp/lOrlIRKtHwqeiGALNsDskAhOxV4tTWPGdIFbexWyE5WkDjMfem8Q3mw8InBhSyA8tNBXcxxbvlLkSTn+FwAPAQCva1MWzPov3uoTnevfUghlYE9He7mDBYSDeDoaXth+1RGOrkNbzEolUy7D2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJHux/B+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wqqk0ISu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F921nZ731110
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcJQkkRgQVV+PCbtYh9f5UrhsxuCpugR62QKiJTInmo=; b=fJHux/B+MSZxUAtW
	8XOr52d4EdbHyx9korRZQW743x+WL7K7jR1eaQLSl4fJYjzLuOfSfJ9vWxRKmR+r
	UIDyr/f0bpXRwhX1mvQKsqlUqKx/58Ntc8RZC7YBmHBoaHpcfYyMewm6UNGvoT3+
	AYoTAaD16fI1gUXqCPWW+qtDHko+Ddt9/ST9aBEn9J7P4bQKJCjjnBNtJwVL5nE5
	ciEhTFBY2JoJuyEUAZ/gQFonQXL5Ivmup2wQ7e2mNvnGXAv3oRmpJ7REdFucZtJT
	Vn5KAvJcIfNE38Ek/u9JML3KCOzPrWoeckhncb97onKf7ldW9wdoII8aHJln2H+N
	F+BfXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruub26q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:16:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8e141739794so71337185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244562; x=1776849362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcJQkkRgQVV+PCbtYh9f5UrhsxuCpugR62QKiJTInmo=;
        b=Wqqk0ISuES9nK86LxcOAAl7P0Jv9+I56VUxtI3/eqDk3NK3pfIxLPKb5z5+FCPcWQk
         rKykZ/8mulA3aIBpD4poy+M5vn1a706rSKtaMqO6CilPWdotwU3N4TJqzuPnu2chMwZy
         70DSuAz7EK2vNykGpZYOlXV+29EmHzOCT0LcCR5ZHP7+K0KoyF6lrUMYnWRLfW5JgRKo
         Hwx0hwiMBvxfvFVcrEoANf6fAm1sD4XEXS/pcd1aZeWW0ieKsRpCMNxdOFgGhSyP5f4G
         v9yDOhS/LC6bbYAhqMTX2UxICszwDEOCGM5G3wAxK6uugbnHtl2PH+ySH1Brj/gESHkL
         MHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244562; x=1776849362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcJQkkRgQVV+PCbtYh9f5UrhsxuCpugR62QKiJTInmo=;
        b=VGm0/08mK6ZxsJUzgmsP4H/fC1SqOC+Kp6BRpG2iwltMeaAr/bk5wt36On2ySWfN5/
         kzsMzD8tmwP2JPJndFSlA8fTgwp53plZTiBxzzsjA7e50ffFBfhu/cSduDdXC1aw9rs9
         B1nVd0bsouVT0hmBWvyIiFcsPFLGE+OspvYEkUOt4XYeYesTAL/kRcuTdxJZh8HYVQI3
         Q/SqLyoBag8oDPbqbb5wpCY9TZjr3JCM9D7jlawzTtCNfP4SvBJ3ECwBph3foeL4TvwK
         peJdZDG1QqHXQl/8/EseOeDgUBTUjaSOGFS5PtPiEumhe9KuIo9Bcz/be1m7mNoP/W+d
         w0oQ==
X-Forwarded-Encrypted: i=1; AFNElJ89WP9ubG4ldSgRdosnfqlO30CwSKrRMP1hhQyjKKm6tLVbDcG91U4yico+XlacGlUE8Q043IKtiaqYVhxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7cWbsy4jiifavRKLuTCA05zEo+og8bUYdUhl5MkNYo8MIreUs
	5ByEgJR5w1B17MsbzgJ5+Ts5w5mw8uCbcx+sxc8tYqcn1cQDJKqy5Qs3ZeihYiqwnKo7hlNummA
	7kFGixJ1R5Qb+48oONz6FknQsXXuCcnh4VYCxzqeJyJCluujCBv4Idemm0E2pBEw4n22h
X-Gm-Gg: AeBDievHFNTkkKX58AqNnWpTyGPd1wgfHnQNWkZoR+v8JrWN8pNmWAChaRX+Oplxw/7
	Y5WSST40jT0TO4tPax9ZcjkwBJTRxBQ4ZUBcOCAcXcRAREM8OxDuNX9igX+xzKlhs1uxrPQEM+K
	hjLSMQLdmRiF4HiTksv4O1ClGhFpM6twRBOaPsZNZQbplzympHLnOt8qZT9Ss6vEdZknGlY9WYL
	veXECLLDYpibInCdEU5FzHyz3mzJdMtAUkiCHWInoB2CsP55y2IbQbmHWR+cGtRwtf+XZxG5RmM
	W1RSCgZUzGjrJRCXPhUQWTuRMLicDhmtlevBUiUk485Czro31MLPsclC5lfD/4Vcx6gTQfRZNpb
	eg0lJyFe4ON3lme/7+ySYyW/7rN/6jW3ivNtJZVnALEMQWW5JYZMwe9XzDzHCRMqe5sf/aoIyyT
	5+G9s1UYHkJ49iXA==
X-Received: by 2002:a05:6214:27ce:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ae6a92307dmr16676526d6.5.1776244562032;
        Wed, 15 Apr 2026 02:16:02 -0700 (PDT)
X-Received: by 2002:a05:6214:27ce:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ae6a92307dmr16676316d6.5.1776244561523;
        Wed, 15 Apr 2026 02:16:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341bdf6sm35888366b.1.2026.04.15.02.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:16:00 -0700 (PDT)
Message-ID: <4311c618-f084-44c5-86e2-7f97661d887b@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:15:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
To: Richard Acayan <mailingradian@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
 <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
 <aaXKyIJQA9SFqt41@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaXKyIJQA9SFqt41@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RnAvoN2t7kapdg15wy78OsA2JAH-dLdw
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df5753 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=x7XoQ9lxPK0ULKPy1m0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NCBTYWx0ZWRfX5nWlBAEVJClX
 wlfelX6hV+qZWX+jLL9+DWWt586Otx/WvaDvn9YeYFtCNY76mgpOBlYjnY878/a4ThY1niJB/Bv
 EbqsK1GAqkWqAjIcmNtxs+HS3n+Lm03sYyNJSZsKlfmgi48o8L4thW1nFBRrGpxABTcpfyHwJqm
 jIyO+gLKA+IeOyfuAH+6HZ0kmvE03kKfx4JHruT85T6G6C9+tjfbN1+XLgyjRPHgBJX01IAUAw6
 4pyXq7lufCUIgb1nkHHOW6gRwEp59u61dNSGR41xltH4a5I8PN70/DDuBTLCbNQ+nsesDH0673d
 t/fcH0vJTpdf/O+tgGcLMxqllufkX538ZLVj4FJvoTiWWrmYmMkK5u9ALiDpnUES7YcCZV9Tn2C
 g2pA1IpdQ0vvjASqkxjHSUbiU9lEkVW252wQgT8dktjtbbsM0VuYfZFK+8R7yH5+Z5w2sUJEag3
 t2WHsbdd9MFWzKYvlBg==
X-Proofpoint-GUID: RnAvoN2t7kapdg15wy78OsA2JAH-dLdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103255-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.13.72:email,0.0.0.85:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC046402778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/3/26 3:25 AM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 10:59:20AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 3:18 AM, Richard Acayan wrote:
>>> The thermal monitor is used to monitor arbitrary ADC-based thermal
>>> sensors. It is suitable for use in thermal zones. Add support for it in
>>> PM660.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pm660.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
>>> index 156b2ddff0dc..7cedf6980b34 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
>>> @@ -197,6 +197,16 @@ channel@85 {
>>>  			};
>>>  		};
>>>  
>>> +		pm660_adc_tm: adc-tm@3400 {
>>> +			compatible = "qcom,spmi-adc-tm-hc";
>>> +			reg = <0x3400>;
>>> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
>>> +			#thermal-sensor-cells = <1>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			status = "disabled";
>>
>> Can we enable it by default?
> 
> This is for the ADC thermal monitor, and not the ADC itself. I don't see
> the need to allocate channels just so this can be enabled by default,
> since the thermal monitor's purpose is mostly to send interrupts when
> the ADC values go above or below a certain threshold.

Sorry, this fell through the cracks

I see your argument, but at the same time, there are channels that are
always present (e.g. VPH_PWR) and any way to reduce the boilerplate is
welcome

Konrad

