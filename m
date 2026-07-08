Return-Path: <linux-arm-msm+bounces-117591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44sgBbEzTmrzGwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:25:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA3724F24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:25:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hED6AmTA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EVKO7Jp0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117591-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117591-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C436E3045007
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DC6313E36;
	Wed,  8 Jul 2026 11:20:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32242668B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:20:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509652; cv=none; b=lxJMuemNfXD+P801hfZ/TU9d/eJ9/zN4Fc9Y8vkheHoSw+F1bdgQIe/DvWLIFWxHn6Yir8CIbnuE7lVRTYW8URUPeVFMrJfOlTpy+4eHTmqUyEKCm/KSzT8kVFRXsyCzcpEKq9aNbvhbZJAtmfaILMtWtW3Tg0tQoNQZQUzttFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509652; c=relaxed/simple;
	bh=bsYDXS5C4GvXU/TFcevKzxUY+JHh/61XacQEpUMHrNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJ8dXCH+j9rpWc2j3iyf18I4ZYifrJbDdoMHxslITpup25ocy6HksbZ9mFx4a0sSKEQQnkOXJdRAmEeCZO0rLuYLfWW00erGcKRKURLP5SJmUREhEUmQpcSJivuJ8Dfu9yEfx0dARf0XPVHMCwvJnNMa0ewqHnfLyxJH62pPfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hED6AmTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVKO7Jp0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889G1r2007794
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZnM6JCGZsCJGyPLZ6/fOZkvDAYanmbDOiM+03tfMxw=; b=hED6AmTANVr0FKWo
	KSZDL+qWXzGquH7l+5c9yzMc3WUDX2qUpTehv3iySLFxT1FD3R7MgiF/UG084htx
	a0TLOsBniydy0E/1mfqC2lGJwPD3+5coXGgj849Q0OK5v521oGfO9szK3f29cA3W
	5TF83+ocaWqbxJJVg6lJMnEi1jaPYauGXb1yHo8HiIxq1KT3aA7bp1pjLChAfY1F
	aes4NzXvEq0Vb0Md/325rwo8pH23lUgOnInLlX/yHXTgsVj5FQrPqRuf7LfBTc/u
	gmT4Wzert4VYZo5YSdwbydeiSb/xCFOd01teMzenVZ97rN5XHGs5tjiv8qwiyv5r
	QFlMqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u135cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:20:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1293752a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509650; x=1784114450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZnM6JCGZsCJGyPLZ6/fOZkvDAYanmbDOiM+03tfMxw=;
        b=EVKO7Jp0FIda1fDrGWKuZcGiugpUoVvK78nslZZk2Y+f2VsUIix0rIi/1jBugF0Ylg
         IwyNlUh4hV3EhbaaiGzAnXQgrnMvwjvxhpooLNqaawtPLEh5vvYHcBD1JIcHqSJntFFk
         ja6ewO/9ETKr9Jsf0zij8tsW07ULE63sUp8nXJBakA3izz8nJz7imSKBo6xeh/4GP6eP
         25sIe3D7NKT26VmPyNhsryrAlfL+hNVfPr9cmsZOnxTFMhbQWkEB8J1YNfXp8l2O8r55
         cEDOrQAO8701HCDHjDyUj3n0x1G/trREVaE1NfKlLJZa6iM9nAsF8jd6eHvUoe1PN1iE
         p1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509650; x=1784114450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZnM6JCGZsCJGyPLZ6/fOZkvDAYanmbDOiM+03tfMxw=;
        b=avhFgJ7Yl+EmNYux6s9RK0LFt/TDfymfHO+nOlCeR+3+ecI9xwC/+7y7DJnb/E3RhS
         wzlUv40TDuUUkY5tSWm93fJM24XPq6URwrAEyrJmO/WOQKBW+7598GMKX0PYn/ln8qLb
         vZEWTwXQDYN+281LwbIdtooDLxwfEn8AxwfjH5oq+/qKW+Bpk26YtcOAM/XA/so8HZgb
         MIatapFDcEAuez9TmAQIAeYDhvOm35GQr+ZOtICAMJLvDFqxWKLq9zbWv6yjyIQ2tcFF
         LkKM1TV6d2T+5oA/iS6194Daq0YvdEydP4591zyG1sSr/cuTGs/6vyAuy9oDteh/H0Ti
         Syvw==
X-Gm-Message-State: AOJu0YxULCn/cv7XSNz+eUd2/4vQMvqGzJIdntd8YvFbz23gmR/7el8Z
	BIRc37plDjm5gi0pP5nUovrrwupiPlfACXevvZLN3lIuGEHRNUMBBoBSsWQk9cVwkQJdD16pD31
	CEssuzzgGxLQKmqdLA0VgoEk/AESN0Ts3SuKyzbfWUG/3knp1r6YSRcYdM6f/WrjyZorxIWXhR+
	Ua
X-Gm-Gg: AfdE7ck6n4nN13kCxoMDo8ifcuZd6DxsCfKfBjO/ybf33fJh1yRm7mKL8yRLKcuCb/R
	vPU0csMXmU+0nDsQdNr5l42PElz3bndSIp9CEPCz4tilEdP1OByFqvPkljUBBLmuBbTC+zyDX8g
	TOtqgQTrzYUahymXtghcvhec3S4dUZ4mSxX14r+E37GT/dVOYjFNrt6olxxo4UbjcQhRiZh+99Q
	GLGeRuMF8wb7TTEFK+JMbhGb3xdaMZ8LftPMREPGGKhz3KYlsv5lfHSl14Mpu4na9T50Essrpz+
	COFGpKDsUDHJ3KL+ayzwE7SYz55cR0NSZP0YtvHH/3iKlVt6l/x0uj+icHieX12rnHPBTyS3duJ
	jQ7bY9v893DErvFXYbns3ZJdBv0w72rivkroKZg==
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr2227662a91.5.1783509649771;
        Wed, 08 Jul 2026 04:20:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr2227626a91.5.1783509649274;
        Wed, 08 Jul 2026 04:20:49 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b7acsm2552717a91.4.2026.07.08.04.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:20:48 -0700 (PDT)
Message-ID: <aed53b10-31e4-4fd7-9dd7-7f305f69a8f9@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:50:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-2-ravi.hothi@oss.qualcomm.com>
 <399abb64-be63-4944-a8a6-3290cdb167ea@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <399abb64-be63-4944-a8a6-3290cdb167ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bC5uvWaombB877xV_Hr8OrtsbFlbC5Fm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX0jj3hRko97H+
 CENnP4A6nSUV9ZpmU4GCw6RS5HMv2FA5YGqnHOOlCdDUyjrB/5WOW2F51BxwItnQMqD12AFn4wM
 oDZjrWCS8NgTaA+Z9+AMp7/iO1zLcVU=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e3292 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HZW75wkqsflI3e3NRAcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bC5uvWaombB877xV_Hr8OrtsbFlbC5Fm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX/Fdw8h2uQQCQ
 a7gs1Ld2k3Zfs4Po3UiUHUdO4BpejVld8bIgC2C4Oghf1CY0hoi/Li4tB8YHg3Lqos+RnmBLQOx
 P1N72RcZmAqzuGpSI1eLndjqZXSmiBRgKnCcfkohLFkDXkoiGjZEywk6Za5amklkNHdFJlbL9nh
 ZHNli6CqFCktbckGW70AbY/bLfTfLDqlsnY7Ff+lXSjsnH31UII8kUR9K+WVnPlAOH8tODdICTU
 zMvVlFCboFxViw9813/Ml2fqFlj+54quXK0ZicpNr/4JHdv0Uk9P0RZnb5dB4bVtKqCyaETVz/i
 /yzeXTACzcmivAyE562KjnNGuh3EkozDr0/94AQsmWyiFWnzOiC2QyjyqdBoVkZ2pwj/I6Bf7VE
 stCztpX9AXSeL3fn6edpQbe/PYiTv5fwqb/bEO+SAei67lYEYQ5Q54/9176KqUrwMDI4HufGXHF
 MOHxt2y6yPZ20n1NY2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117591-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63DA3724F24



On 7/7/2026 2:12 PM, Konrad Dybcio wrote:
> On 7/3/26 10:34 AM, Ravi Hothi wrote:
>> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
>> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
>> defined inside the LPASS LPI pin controller node. The hardware is similar
>> to the SM8750 platform.
>>
>> The WSA macro, VA macro and SoundWire controller are kept disabled so
>> board DTS files can selectively enable and configure them.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/eliza.dtsi | 193 ++++++++++++++++++++++++++++
>>   1 file changed, 193 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 8dbfd0504598..142f43a1e6a3 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -19,6 +19,7 @@
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -2072,6 +2073,198 @@ lpass_lpicx_noc: interconnect@7420000 {
>>   			#interconnect-cells = <2>;
>>   		};
>>   
>> +		lpass_wsamacro: codec@6b00000 {
>> +			compatible = "qcom,eliza-lpass-wsa-macro",
>> +				     "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0x0 0x06b00000 0x0 0x1000>;
> 
> Nodes with a unit address must be ordered by it - the diff hunk
> above shows you that this one is out-of-order

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> Konrad


