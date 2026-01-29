Return-Path: <linux-arm-msm+bounces-91162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBlXLuJEe2l+DAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:30:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D8AFA28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F9953063740
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90C83803C3;
	Thu, 29 Jan 2026 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyX+7pFv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvTXAja/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB738737A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686104; cv=none; b=tKZF3k0G6sR6BPemZwPtMhXnBRIU6F54G4JuIJCdFsioPg8r5244HetREB9XmgiSz6g9C5xS/6GlNAz++IkfVev9WyphAvHLqHcgj9Azmxdb9iGySW/csnKsFvhS5OJt9zakkne5J64Ty00diFadapv52KJAaQZpjFU6hKzaFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686104; c=relaxed/simple;
	bh=p2axHXkBLcb/YxRj2QZU2q+JRuLkBNp+GmrjT0DWn04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acW7bJjGy62gck2vGDrjc1yrZmzb2uSGzANHMcch0XvxVPZiMPflOq41I43IDdMhUQq63/0npiXxUXkLNuf/FjNeUKpR78cJqJ7+/R8E2Mo0wm03gI4FoRSZkyMomlwfCQK/1xGHP8zOrK50kNOVL637XRL0aMVSuyXnIGm6LgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyX+7pFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvTXAja/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9qVp22150627
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itAneaJJLEuJh0bM1d3ExjX/oEb9v6fnFKl3auDIGbw=; b=oyX+7pFveMY1swCg
	hF/HsGHcnzWK3j0JCEtgkTJYYW0wL6MVcm1ii09O5YfqjrbUyf54cZOFk3FTYl1+
	+NrSICzMSzF1YowilAnRJuDSFg9Bq3cx7InPUXjbfC/e0Z/mpjgLiTXH4oM2zxDv
	VnDPTwsxrPbSMyA10HzNNxIoUAgJ38E0yScp/OPouzlmA2ovPUj9a11TJrRWNG3J
	aKrnfAE1KNUujLJXoFD/GdLP2+304SHeso/3q1xLsznW6L/AHZaX5HzLnWoi5mZY
	/TvYmc/VQ/CCODA0KPdGFr1LdPuovV6dg2MS9o54NGRNtumUUqcq7TAum/K886tJ
	aCvV8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3b7yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:28:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946c23cf90so2987076d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769686100; x=1770290900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itAneaJJLEuJh0bM1d3ExjX/oEb9v6fnFKl3auDIGbw=;
        b=HvTXAja/XcnzN5u52oaVFixJc5VdimtSMDi6t6HgW3sqYQBlGUYpXS5pK+524KZUUw
         o5Rf2qcyQUI1T7wJElnqLfoU/rKccsfAUFI50rnv3xqABeq6VLXTsDvyZxcfJeSBxiXB
         yMAkMBtCJxbiTG9i6MXaqYS6Zp54XhFG+VraBWuwMpOIqO/cnkZHow4HLa2kaiIFeIqI
         Xb2YoT2CtzPZXMIfTXgpHqTg4b0WX80QjilqfMPxMrk/SMBQR2/53Lr0J7BzwJ5CIm2V
         wnN+e8jRoresfA0guxW7vVhUsSbNB4iIXbfo5fqj1XHllaKI0y7Y8x4ZBZb8Gjm8oZqA
         LYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686100; x=1770290900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itAneaJJLEuJh0bM1d3ExjX/oEb9v6fnFKl3auDIGbw=;
        b=NywGu41ITfQWpX/4IgkOxfY8fZLL4m72P8fAT9nemvL9iuIzKpMusey5S5lyxIHMeI
         cKfzEZxKywdeOSOHzb7LuBveZq6kxSGYlQXN5y+P6yVjDdafYj5Of/aoPPynEdpyF+PD
         ZOqIoAoym+FxOeKkPrBbz7mK5otCta7deCmPQxlpAG1iY2xnle9DzBRbU+km8ora/iYb
         8C0H6N06FNT02WCiEew9asXH1fZTHG3LBncnZ4D/65d/dLdgslMMItHWSYfl+mJg49+3
         n5bX9GtPcWvcMmt1W8CpWdCxjitbN3fdRk+Vwj/4WX9/SUUZaCsJQS81vhpfnBo+1+Cr
         uXbw==
X-Gm-Message-State: AOJu0YxFXvj7kKR6Cs2oNZQJ6CT/RlRFDN86VBcGo1OyqYOn340Bc73W
	OPA2rRtO9JAZen9Llbq+HOXFl8KwdckDVfPlrz0almN3+nLDQTKhAvf0esNjsTRLBySvAkXvvB1
	Ukea1tkp2TEHDUbTFzxQbPCEBUqTuUQ13S7xmat1MRVrXEqlK2lcG1oLORzYHbYw6Ho+47Gj4gn
	n2
X-Gm-Gg: AZuq6aK7KPBsKnBWM5aAJsL9QCnFmO5zBHhy5a3gDGn/JMSjs0DfMe6iiT+vni4Up9O
	QZXzC6lDvGM3c2w7pYlECxZSLivh9diODAeoOUYHrwGlLJEb7KLMitGHPS/iUte2f2MQsgIENS0
	qwGrTLUtV9G3xQMgvk0eApx6jAfvyhcGWjHMCW0xwX7ZlPnDTMGmUS4PssR96H+8ZVec0WlIfqf
	7IMYDqwufChZPEhHbJZVZo7TN8/3fooYK0wA6hhw3ZoMKJtcd5deZFM1pF8YD/LlWKO4nLJOJ2A
	Frk1AYc879x/fv4WXYy6Tnd4kjr6+5mGzsatJuucpKUpjWaB/4s/2VC0gjSGWi9vDN9hXw7Pe/c
	TxAQlYtbOuDzp3CDpZRY3D5cvMrnI9t0nr6qs1HalTb9BXDxGSjwiVQ3t/d3U2NxyZdU=
X-Received: by 2002:a0c:e012:0:b0:894:ae65:5ba5 with SMTP id 6a1803df08f44-894d7799679mr54392776d6.2.1769686100615;
        Thu, 29 Jan 2026 03:28:20 -0800 (PST)
X-Received: by 2002:a0c:e012:0:b0:894:ae65:5ba5 with SMTP id 6a1803df08f44-894d7799679mr54392556d6.2.1769686100196;
        Thu, 29 Jan 2026 03:28:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e53sm2696913a12.21.2026.01.29.03.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:28:18 -0800 (PST)
Message-ID: <fa3735c3-ac4a-4f98-bca5-a1b75dad0939@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:28:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: Flatten usb controller
 nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
 <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
 <2324aa41-6b2a-41ca-9f97-7a5b5e0f575f@oss.qualcomm.com>
 <f9f7514a-8841-43b8-b01e-aef4aceb8d3a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f9f7514a-8841-43b8-b01e-aef4aceb8d3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b4455 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mjPXWT5hYa9pg3g40W4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: OCr2eC7IXqlUAp5e03mU-4LBZvKfGvzq
X-Proofpoint-GUID: OCr2eC7IXqlUAp5e03mU-4LBZvKfGvzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NyBTYWx0ZWRfX5Mtqt6bPshmW
 I2XZ1BeMFWplaAnhOYQsYzJAJCzRXhpZ+sPS6tZh/gvtlkakkjiVlT/sZVTqlqDmG6SPTLJp5fy
 enAzy9/QjSvtaKTbZ345W33dwmwcNSXjTn9Vd8lkXKH041T1XQomVI0XldOPbHe8tMhM3OpnQc1
 nK1J75LIIJbMMhza1JMtKRYKGLu2TlzTDobw6FnYBJl11dt11nIpMZ7tBMeUEDhT73J9u+xS/Bi
 UzVG64BSnzYxWG69oDZ/ANVmBAjGUy/Z50TFJCazhDuHY26Bl/h3Ccr9wE95E7AXxzEc6gbgMik
 Vj0zuwJL8AykTDNqg+zZDZPxILaWyD4LcQ9IswA1T+LiYZ759Ikgqt1P1gxpLGF1Zs5JpmyQl9p
 ozkxnX7nhxEr9VhLdWk1UNAU93sycl6fo4LRieOjVsQ7yIKcvLECZ4FiVf17dTgOXKjbld+c7uU
 UqSwpnLm51wX4Cr/zGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,a8f8800:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91162-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C3D8AFA28
X-Rspamd-Action: no action

On 1/28/26 5:09 PM, Krishna Kurapati wrote:
> 
> 
> On 1/28/2026 4:01 PM, Konrad Dybcio wrote:
>> On 1/28/26 7:27 AM, Krishna Kurapati wrote:
>>> Flatten usb controller nodes and update to using latest bindings
>>> and flattened driver approach.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>
>> Have you checked whether this brings about the same crash-on-suspend
>> issue as it does on Hamoa?
>>
>> https://lore.kernel.org/linux-arm-msm/71c15a78-7a50-4913-b677-e5308fcabfad@packett.cool/
>>
> 
> Hi Konrad,
> 
>  Yes, I did check system suspend use case after flattening and there is no crash seen.
> 
>  The only issue I observed (both before and after flattening) is that waking up from bus suspend, there is an enumeration failure on second port in host mode, and an xHCI CMD_RUN timeout occurs. The issue is gone if we keep controller GDSC flags as RET_ON (not the right solution though). But this issue has nothing to do with flattening. I will sync up with clocks team and try to fix that host mode issue.

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..7e7f4eae8a98 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4559,7 +4559,7 @@ usb_2: usb@a8f8800 {
                                 <&gcc GCC_AGGRE_USB2_SEC_AXI_CLK>,
                                 <&gcc GCC_USB20_SEC_SLEEP_CLK>,
                                 <&gcc GCC_USB20_SEC_MOCK_UTMI_CLK>,
-                                <&gcc GCC_USB2_PRIM_CLKREF_CLK>;
+                                <&gcc GCC_USB3_SEC_CLKREF_CLK>;


?

Konrad

