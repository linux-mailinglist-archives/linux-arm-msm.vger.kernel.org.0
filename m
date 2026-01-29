Return-Path: <linux-arm-msm+bounces-91160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLVfLTNCe2n6CwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:19:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A3AF8C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A84CF3004D3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FE03816E4;
	Thu, 29 Jan 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez6vu1DW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVo++lRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747D37D107
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685552; cv=none; b=NZrcrb7u19Czast8YGdN6SpfAlU7rAvK0JjBrbHMiEusyjNxLcHx3udRskmScRMDx1P2BLxUQVlwVgbPccaDhUsLrDHTlKgkzPUrgaMDzArNELWiTnAjj98NW4Unu36TCrMooJK0n0RWRoKQavl7eTLte3bnxo2hyDWHbPDZnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685552; c=relaxed/simple;
	bh=XZUI+1dfgfMKqsltluvNOpJlTGT+hBConju38yjh73E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiIJbv37oKcrkZeCpiOi2XrQVZGVpn6qLGnzaPemb8+C/8pNApRKJk0rKXyqNK2Zcnz5UHFX1eDHoprRfkgKd/2VM4BtVtJBTGXsHndCZvMqGHTJCHDE2hjBB+NDITEGbOCEgUAiaMFG1sI6w2AO02RVRBp2BmN/Rrb7m5TWN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez6vu1DW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVo++lRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9vn892150367
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=; b=ez6vu1DWTOlYSQZO
	i+Y1RkPnD9byy3UtGcg79ftZtzjRkfIv+M2aNTlvgcj9Xxo5JZp7AAdfOv/zi7LP
	8phFX48FYKxh+lv0SuCz3+La9d0H1e4DL/+U+HY0p0cpOHYLAG277bh3qI6lkTHE
	kuZQNrUZqb7/V3nl6Lm5kn3N96nCu+VwhUoeiup5T/62KXYUpeZczHiCUPQMX7dz
	dx3gy4FXJ2V3l7F5YxXJhMA6oD5vogal7n0zR5MQ4/45E7NZJoSOyl9/Ra4Y1yFU
	07J6J9g7LBIsBBaNZXX1Ogz2o+aUUxIqD71P6hyV1NUg0yFIBOR5aHl8k2h5Rtit
	MnHjQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3b74q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6d6b0f193so18484985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769685550; x=1770290350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=;
        b=eVo++lRio76t/NMTuz/IFyDFKrkIVl0H4/JP51AcsqjWcFQUCLxHuK/0bcLrr8RXHQ
         YGLmvqVtWj3w2JW6dynnh0sCc7rpcT/DqraNw90ssnsf0LknTDxAO2OCGvZAVAQf9P0g
         CmhYlPZDYBT96Mh3/yBkhRPWWcG6wifRocPnq4TRsX3cFOaYbFV+DCrFX7rpFLEmSOEW
         RK7aux9rCB5/gyZ10LlAZfPRhRars9Z/cTDH9MSntpAVtjKk0/Kqif0wsss80NavjF9S
         vT+moTbPzgwUY865IScSQp5BqHBgznNMRCOYz1vvYqk4fzfU1QirTeYxbWF5lG1pxWry
         Akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685550; x=1770290350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=;
        b=l7uhxMOKiLwrP+5fIT17/0iAEap8zBlzbDBPYyIsxaTQotzofbVZZKiHLXCZ+prVMg
         CtYL0xeSQ154U6bi8PxUg0cedv2nvkk4MeL5oge7odYlm4cChogeXPAQZd3+wSAPbYBB
         ZnPg82x3WYpiDbd+p261B3cO8UOIuad0wG8DSCCOG/eU8f2gUCjNFHsHtHAqOuk2lO+w
         2NVkw/ELSO+ZDxpQBjoco0Cxr0ku3jREfaZq1mfphCKz+qhxVmjX1Y1wmtJ3+ZlPW6HO
         sPFyS8TEPnJN9ZSi7xyOCJm7iHyLO8YHwMg4TkkjoGfR80VG7rlrpL7a0onyWQH7ROZw
         IrYg==
X-Forwarded-Encrypted: i=1; AJvYcCXjK6FzjFFjIJGSRwgSKfVDXSx4laRM/qIzxNmJb5XvxYKtwVAo7O6iONSHkJvxZfjGnr8GLi6OKunqZeFh@vger.kernel.org
X-Gm-Message-State: AOJu0YxZc/+jTQoA7Scj2t+8JwFTlAZ+Pi4wUVgujklD1Jupm93oM3Q2
	k6HjX1V9P+13pLLshqNWCDdb5OkPvv5zP4IIDDiTsALc04dQbmmboyjfrVt2f8pZwZ8JTBosoTW
	l4XjdAhC1ynmHn6PPAJ4n6JvvRjLFkiaQD0zNCjlz5KhFNzCnPJ9h0yDGijIM5PeAGh3F
X-Gm-Gg: AZuq6aKbzG69H7HV20XitENLu8RH9fq0S5bDGwA7kjMQr6gRRMHpC4QFCjkuutWgN/+
	VXoP7qIH9YOQTaUrT408fh2DoWxm6SFcpDGwgtoHgoQI+sDsPdqLx++pbz8cvPtfqDc8LXuh//8
	YkpBLIJb6zhids6PnyqIQX+eVf52oaDhz5HhzSbHL/2l7fF7B7f0dG04nvHoi0l+SsyOb9my5FY
	QzHSE65hwaAmfpP/NBCoZR/CdNMnipueR4KoUlYIVxXoYlPPh1vkY4cJmKQ35glB8k6O6LLIHGS
	mvXpb5r9ufnfJX/X0RqJK28T7FJmppXvrLoYi3zTa+pzVMVa4/PNHp75BZ1Dwob2gLyZlN0obEc
	3gUKIGvgX5oYtPVAQfPYOlgDNoaRpRMNxG3OBihsPPXQRqOLKGziVyF3kiwzaYWRcZZE=
X-Received: by 2002:a05:620a:191e:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c71ad22c32mr324006985a.6.1769685550011;
        Thu, 29 Jan 2026 03:19:10 -0800 (PST)
X-Received: by 2002:a05:620a:191e:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c71ad22c32mr324004985a.6.1769685549534;
        Thu, 29 Jan 2026 03:19:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm2677629a12.34.2026.01.29.03.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:19:08 -0800 (PST)
Message-ID: <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:19:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b422f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=8gWlQ0A84ExjddM39AAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Fn7LSL4V-sA8XlK9BlmJwFih9EarkgBq
X-Proofpoint-GUID: Fn7LSL4V-sA8XlK9BlmJwFih9EarkgBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NiBTYWx0ZWRfX91dIiedHo21s
 kUnDKmMm0LmNHsKJqrkqU1MSzKTVjQBF8XdF8YXsmLiau7c39uTO5Ebg9pH+iELRYLdue99BNW+
 x6Tb/9RgxYeTedlcrKePO+oSXa9M02KD7a290bIqkuR+OI9t8Q6HduLva28PjKQcVHLrqlv+X5v
 46nr2MNiC9uKxt7MwLjEeFJpSU8khQKEHs3lC5thL0IgnjF64c5zs7B76pCm0IN8o+szQ940AqJ
 TGpJLsT+CvzL3lhMSY42/f7HRoN2GZISREvHt8SJwBPmrqy8WecHtH7hUfChCzfsea2wQ4WpQ9s
 B9CzG1pxpnFCSXbq+hz7lOwqKFphxibfMnsARNISF3E+wFk/2sAAkAc+n0uM97t1oWOwnUfrj4X
 PcHmvZHAPZG+cFOXawnZ4Og/DOMBpoqzxTtp8NHoDGX4zC2UoNOp/kGnUgQQ82yHqPXNfR8iZxT
 TNCS9kydkmLUwBp/vSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91160-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B9A3AF8C7
X-Rspamd-Action: no action

On 1/29/26 9:32 AM, Luca Weiss wrote:
> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>  			};
>>>  		};
>>>  
>>> +		lpass_tlmm: pinctrl@33c0000 {
>>> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
>>> +			reg = <0x0 0x033c0000 0x0 0x20000>,
>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
>>> +
>>> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "core",
>>> +				      "audio";
>>> +
>>> +			i2s1_active: i2s1-active-state {
>>> +				clk-pins {
>>> +					pins = "gpio6";
>>> +					function = "i2s1_clk";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> This looks suspicious for the clock pin.
>>
>>> +				};
>>> +
>>> +				ws-pins {
>>> +					pins = "gpio7";
>>> +					function = "i2s1_ws";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> The same
>>
>>> +				};
>>> +
>>> +				data-pins {
>>> +					pins = "gpio8", "gpio9";
>>> +					function = "i2s1_data";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> And here.
> 
> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
> active config for these pins have "output-high;" set.
> 
> And fwiw this pinctrl works fine at runtime for driving the speaker.

I tried to find an answer.

A doc for this SoC says that i2s clock pins should be at output-low
(2 mA) when muxed to the i2s_xxx function, with no information about
bias settings (perhaps bias-disable), and in sleep they should be the
same (minus the drive strength note, but 2mA is the lowest setting)

I am further confused because the output-enable bit in the cfg
register specifically says "when in GPIO mode"

Konrad

