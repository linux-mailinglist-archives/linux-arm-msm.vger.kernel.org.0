Return-Path: <linux-arm-msm+bounces-104063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKDgCWqe6GlNNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:09:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767444471D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE1343004D08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A24B3CBE84;
	Wed, 22 Apr 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehF1sogR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvUZyrQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9429374722
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852579; cv=none; b=lAmAh0fye4kAFn6S3Sr+rItBhOwNEY2GJXJFPnb+obRCfgXpucGnCUx3am+sSexJ+4Vsm9Ybf4Mv73OXfBhyZT+j51tSp5Su3P0mluPgCUuqNnGnN452zJHihFaRpHIiOVZ7QulOjbiGsPacW1Tju6UGn/uZm2gbP1vAvxqn2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852579; c=relaxed/simple;
	bh=aSHRNBc30UbrHywNUN2ejbFNA17rHTFw7ydibc9FC7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDrW2YMacNtd+7TJwoKs8Gv1qZ/P1dAl2REoldcCa/tOM/uzk+3hjK1W8fVr2vUE9OBOjThb3MJoLB8qieQ4JXn95yHUk7fkhfrSqF/FS7k+ayrMWpKxaIeKNqetoL4MUX/fjHY93gTTVVg4dToi2+tSb4ZdFgSlkpQwZvt4WfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehF1sogR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvUZyrQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4n06w2000978
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/w7YRWP9KM67Fs0cZqKRhWZnFRHSMbKTOmClIpjy28=; b=ehF1sogRoX9iSCPH
	ASjVtLJ9JnOWxepGlFL+4T793fLysehTcjRNv4xekjGZnoI0i/M+AGjuqiRx5WVp
	yuT4EE8BxLLgj2qg0QKvn6lGVNTNcm1kiKxkWwI4Q0NMTlFjg5tYrwiou5Xeyj6p
	qUinNMMM2BAfqztkl4oz3LGq3AFeP11DpUe4Q8////n7trD4WsoiBn8UKMbkBD6I
	jJwm1qF+Tpj4e6liBVI3JD5BVT1Lz4pO8j7rgrc0VzqetI+98WAlPx8KwRcObFMH
	HX2VTwCFaX3d+QCsrvCSc1L7tSRXXQ1XrfJTp13/AuCgyU1/mYlu1oE6CrnEnEBS
	Oh264w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfaydx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:09:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faec938fcso6923371cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776852576; x=1777457376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/w7YRWP9KM67Fs0cZqKRhWZnFRHSMbKTOmClIpjy28=;
        b=UvUZyrQO2fDt6rZTcPAEKIl0FmbZZzxDXq+WVJw6YI7iOlph30SIXpLiit22y3wKlv
         SnivxptQHPHjHxOu9xBAjT2RVoZ8OoY3RTg8Uo7LI64aB1Fi1Pt4j6/8kxvhTFGE948m
         xhJLWgH9vxTo8yXtwk94b7B74vt8/2yu92tMmwnFN9kz6pK+Uya52E3kRWb0Ltzc4d8X
         r792+MjTNx4RNOHhr2EqFSPN1pt+S/wi2AmahOb7+24swdJCV1LAzmreW3wH3Tb0bM96
         pC4NVSh5hrjEwNZywoXiRkNVeTO/Me9AgFSmfH21bMIL2e4l/1meCYUURLAUKvYaq/mK
         OSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852576; x=1777457376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/w7YRWP9KM67Fs0cZqKRhWZnFRHSMbKTOmClIpjy28=;
        b=M4ucbWn0HuzIrDl2bszthEZCMsf9L5C7wWfsNczEM81LRVYHibi5UcB5LPfhgGDwb5
         DAlP+ecIPurWMeRM6LMjEnAILYeFNqzGz61ZLFHoy0H48fxWwdczHdMl22yF94MsQjDb
         slc30fJBUyxdMYsrc9i0/iTjHhW7NvQ7As3Vl+dMS8Sf7Ni264CjoLgoNxNmBZtSDINJ
         A5qKe/m3+BbFhz0sPvrr/dmbBrN2AL8eFnLm6Hr2dBUEyuTtIwjnJXBnGb8ANlx/JA6b
         vZCCw6xNqHlCf3JtHe+XflmNejA2PKtha6cfLZk3kj82xpE6K0hEZD9HRWaGOc8XlzfE
         hFcA==
X-Forwarded-Encrypted: i=1; AFNElJ88MSHLHBkJiIHVMMRB0++4ZaqZQsvR4fE2q87R9jtTkDu4NUL9hf2lEL6db/lqfuMQuv/v6Kr7B87txmOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyJyUARzXuBrMVeiM+J7sPyoVPFbvTmTFCIS4F+iWVYdamYtVv5
	UnpGIuSHwOQ6ZxtjkQXZH0qptzxTT2YN/bOX5DHFf682BgoEhC2bIMqsmIw8NQjvOJRinafMRgo
	sACR9cK5C6cr5ylJuCL9deQEqlwWpxEMLqsknBRS1p6wsuKc2NaZLxW4PH6S0uH2cX086
X-Gm-Gg: AeBDiesPJZIbqYcBJy7oS+EjmIrDyNhwmh0pVCvhCSqNdJWLizk+g6bk4uEXRprXJPK
	eyTvid24XurnhKj4nKP6v+iH9aPGIGT4vqRw2OuIz/qmeGnPWXenwyroKfd4Yg54GmXm3a+4pah
	rbz+WOw1WsVZ9wK3v7LBU1lavgxmx/2oaboUoE0Jvc07VU77RI900W0GQI6TVAUs5A2OBIhWv7T
	ZWA1wuZm+yJJw5GtFU0Dzo7z++B6BFjTNAs/cWCNBD20vZLskXrP/J0+hCimGf30OBOKEvlgw14
	taZHLQJVKa14MiGxlgUzH4L/x6JZxnWPyaUl5hAJOuCPqecmqZGsPVxP55eZxcwB4O6xogGPleM
	yl3TDJRm0yTETNGgL/axE8JgensoJXY1TWe3Q+hX4F189j4FLoQOnzOgIh3BVuEZXvX0mHI6KOG
	fzMutwIck40C+FpA==
X-Received: by 2002:a05:620a:29c3:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e78f059175mr1855210785a.1.1776852576152;
        Wed, 22 Apr 2026 03:09:36 -0700 (PDT)
X-Received: by 2002:a05:620a:29c3:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e78f059175mr1855208085a.1.1776852575722;
        Wed, 22 Apr 2026 03:09:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe8a0sm3182799a12.5.2026.04.22.03.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:09:34 -0700 (PDT)
Message-ID: <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nLYY7wxyTWhNznzvKVcEbTcvkudomM9j
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e89e61 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bmElyp3J9_oKZ3-6flcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5NiBTYWx0ZWRfX1TKyCoKkUoDy
 SmLKtNR9yyaew3d66bb7rs0lpsi2PHYuQataC5Yo2niGDJmbhr77r7rhQKsm5aqVZw8iC3gcyQI
 yUL6KXwF/nNeLSPDanYWgMVbs5MYemWu9nQ86QSnrwkX61Yc5U4mC2cdwPD7cNmqW5RpN9VGo1L
 utG8ettXUhXPwqEiXuzC0RAxbTv2Lf1DOqL9EyC6TbS2xACkPRXiDe1Dnapzucmyfhe6otEgQgN
 oKsmRBsQvG/sWDAYq3IUXq5kIjDwniTszq9lEP++OSB0vK9Eltdw+x5W3wTekPoS71xIBiVLX/W
 xfXyjNajxaW5q1UwFcxSsWsfjKv0NhuLzfNssHn7eI3LMKsqKs0MwoJAUB8JUI5u1b67zMKhS6q
 t01aWBPnEO8qvjRlCv3cLYufZH/vWDefxrpyRffDO7RiTzHgXMVqRMV4ZB53G0l+HFHnj+4h9rg
 ZElE0f0kqpiEwEU0eaQ==
X-Proofpoint-GUID: nLYY7wxyTWhNznzvKVcEbTcvkudomM9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88e3000:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,a600000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104063-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2767444471D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 11:41 AM, Abel Vesa wrote:
> On 26-03-31 15:37:08, Konrad Dybcio wrote:
>> On 3/31/26 12:37 PM, Abel Vesa wrote:
>>> Describe the ADSP remoteproc node along with its dependencies, including
>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
>>>
>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +		usb_hsphy: phy@88e3000 {
>>> +			compatible = "qcom,eliza-snps-eusb2-phy",
>>> +				     "qcom,sm8550-snps-eusb2-phy";
>>> +			reg = <0x0 0x088e3000 0x0 0x154>;
>>> +			#phy-cells = <0>;
>>> +
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
>>
>> This is TCSR_USB2_CLKREF_EN
> 
> Good point. Will fix.
> 
>>
>>
>>> +		usb: usb@a600000 {
>>> +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
>>
>> Does the device suspend and resume successfully?
> 
> Well, tested with pm_test devices and it does suspend and resume
> successfully, but there is this:
> 
> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> 
> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> all platforms that have them.

Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
some DWC quirk in the list, although it seems pretty long already. Perhaps
Wesley would know more.

Konrad

