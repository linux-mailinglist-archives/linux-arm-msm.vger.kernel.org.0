Return-Path: <linux-arm-msm+bounces-113912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fqgsMvedOGpeegcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 04:29:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D56AC153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 04:29:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jcVjcJGa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HnUYUM5V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425D6300E166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 02:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA9031353C;
	Mon, 22 Jun 2026 02:29:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D4312803
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:29:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095349; cv=none; b=c0EDX/OWZjkfTRhw4WocdlHX5MZW4ANbiNLYCzLiHKep38jmB9pbi2B1YACrillPYLsO29caAq7S6WUOCL8pALnxD5gq/tQHyLdV6wpFr2HHTKFc/8AJ4tjCO/Qz+v//Hu6rW7x74UdZy9edUQBkFyna5gQvgihCjk56buY3fuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095349; c=relaxed/simple;
	bh=Imnb8guT45fj+jnS+EFxeQAAPmLzZRhca0s8hOhxRRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3axyn+2WWdbyIkcOiVKZ8m8UxmXtRGYhDNbSqPEuJNufSIrtqYX4WealhZvGogHqiaDLRR6VhCo61dqd4XIfNokcVAByViw2fsKbmn8CrGMnOLj7wzVmMmWp6SGXdWaOLs1wlsN/GuO2OHYckKmuK21juB11Zb8R/LFOLcA724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcVjcJGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnUYUM5V; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LHqmGb2497304
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdCcN1CC/CVMzb2L+hRp7Ek9alBi4Jrp3KJK3rGj+sA=; b=jcVjcJGa12etEl5u
	pxQU19/zni0jREDkjsnWhG1u9VFEf6Ndr+cC1Lj4Ek61QohYZORtoboTWBoxHgEO
	4ZGsKEuja/BgP6eL8LOgSGAY4WUesjWiappR3gtihQ0PzJ55a1NBlZABfkYt4FBk
	2MJEyYNEYa8FH5zk8Oj4lnH+JMp1Tx82MyHY/LSsCkq61pxWofhgF04Kt0TKHw1r
	xgeSpFUwC/Cx1Cp3LaJEzj9yrSqRlF9GVbz8WuWecRihWlDF+uWPegWi4Pao96+H
	SJ034RkUS3vma/ENQZMiA+IHgInWcd3Dt6UwDGK2d/BnfSA+LxWdNGVsfq5YoQji
	LKnRHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjecngd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:29:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso6773699a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 19:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782095346; x=1782700146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdCcN1CC/CVMzb2L+hRp7Ek9alBi4Jrp3KJK3rGj+sA=;
        b=HnUYUM5V4gbYwCX1WAONHW+sbw2D3wrCjeJs4FoDKkuWyan2TTR8zMR5V04NlicyHk
         hQzv6gR2K9Zpe5LYOA8dIWQ5xLgg68cx5BP/yPSL7HSFg7REDS4NHgYtbZrkuxATDw8J
         O/c5hpxflrIBlUeTsOT3eUujL7iAgw7u4TgKqLxXY45N7oQS4GBrlwZRyovcIbRIDsaV
         4aYPHA/s6H9uOa0HtZ64cTSrygyrCKDIqd5g3gijJurNdeIwRmCtEq+ZgMfdzrTp+Nc9
         phxxluJEwFsP9ZHmjQEI7Qw7VgIa0cuTyxBLoXhWTml6lHIbdNTZLaJyXbCaLdZCD4uJ
         vZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782095346; x=1782700146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdCcN1CC/CVMzb2L+hRp7Ek9alBi4Jrp3KJK3rGj+sA=;
        b=ACM/IziWViVr9yCYdfGefrtXb6H5a+g1usivFjTT0tVM48kG3gzo4NKEw+ux58mBt8
         AaypHOzsB86RLkj4Wlmf9aIXC/wlxouj/UCqzybdEFW5oDgnrAww/X3G1EDKClSDENq9
         9uqn20aLArl5LXjS1fh/EabUiO4YenrBtpsGKdRdJ6c6G3dnY1waR5FkULskjnSLppNl
         ESR2RjGr5925LmfZJn6MQlPZi9M9QT5C+EF+waCu/rpbaKir0Vq1z5BTx1RRJa72AdoR
         rbMlV7Ue/F1f1w9CiVZzSswDK0saliTPtFqiig+1fQPyYDxece8DXkrBwbnDyNJ/KepC
         5RGQ==
X-Gm-Message-State: AOJu0Ywlu93lQHE/VW1TKcr9ZIV2vzvQ3WCydLDKXJTveetIFDDsH6Cp
	8bwHvESlSPsBr5yOVPFAEgrtS7D8NwWEn/YI7wxoWIj3HlV/8SOwthzSV6FXjnZUsgZ8kiIR+zy
	uU5zDCQdDvxFmYqGhqMbC9JuUnx5DvS5GITrOELRgf6xvzmzNcbunUAQVADKGR7wRpUmKrM39O2
	1/
X-Gm-Gg: AfdE7ckukk1Km+hRmj6iiqEcdbs1dDqRJxxYx3dEBnQxr/ItX3AjN7uedYhss2KW9Lo
	OpWve8iuSlQ0IzaaFPdwSXh+05tnki7eSoWRzKob5q0YW8Wc4d2f0qqtT60buOUpcbeNau8vVIE
	ks9sJAn3s1r596OkA9RqPUCTuQgsxM0tKN6r85Et9cfDX1e1EvtLFIQjGm1BxSA3Oe+rV8msGBj
	3kXdlOuVx7VGcv4W/hugSQC8MMR1OvmKyf2PwfGWvwAVfWZwW2VbwQo4EnL7FJUIesqmcGt7eOp
	OBGkrL8NjE3rbtuK1gjnJ/1YFfT8w0qt28sCt7EW3K02RfXfDYyqIaREflDaNJ0fk7Tjjr/X1Aj
	Tbpu5Zac6B82KJc9nqMLWPwn8ARFvrqJ5338=
X-Received: by 2002:a17:903:1c1:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c718fcc7a6mr138566095ad.36.1782095346342;
        Sun, 21 Jun 2026 19:29:06 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c718fcc7a6mr138565775ad.36.1782095345891;
        Sun, 21 Jun 2026 19:29:05 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d3505sm60225495ad.19.2026.06.21.19.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 19:29:05 -0700 (PDT)
Message-ID: <20fa15e1-316b-44fa-b59d-99cb7fe78bb0@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:28:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI
 PMIC haptics
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
 <20260617-wakeful-gorilla-of-feminism-75287c@quoll>
 <c7191868-d141-4095-b703-230237721f28@oss.qualcomm.com>
 <44778bec-68c5-426d-bc05-b4013630b3ee@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <44778bec-68c5-426d-bc05-b4013630b3ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VZeZ1se9makjNWpHp4PGsc6RPsddpIpA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDAyMyBTYWx0ZWRfX9yzAnUyzCwTj
 LewXwoKgKeLkcenphm5Lw/jb8LYAKO2eVphTzrxJesOy2rxdEc2bv9pplqsQTuoU9qiUAecXrAB
 AecbRRjXyr6DrfhJ2+zGK+9FMbHovUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDAyMyBTYWx0ZWRfXxSiHlwD+OmjJ
 jg5cv+mGsKdOBtQKxKvAhe+uVyMocpFEfGiP5HJ2/F3XNEGZmn0E3K8mOrcbYdgFVU16zmwvBhI
 Tfe40RvhfmKLU0+Sju47uqmrs38lYHdPtZZ/m0PKErm+eMvoc0ygVkvaIGHAraB66+PgnxgwHza
 7NEUuxonhScJfsR89GJ0xrHuhKcRd371QtT9qH/cKF3vboQtBjLDhVrXh9qcdORojWF8VMmblRZ
 Jrl98t3ICYedVQhcwaHXuKe8vI3GczisW0CRKVUAaHCpGYCf2olXfIx3W+Yr2Q5bNoV4psfYO6e
 Af6KiYqR6/A7kfmeCmRYm5ejT6cN4p46zOqpF/ACcnTqOgREmvaJPaHrvLpccRENS4t8b1z3ijP
 fB0eg4YABTS37FaS8kSh5R5gQtqoRrG3rvYwDwViwDqQ9Ax4Qm8lYoZJE4Y7nDKuperOsbcT449
 1QprZPXJq6trmmFRFfQ==
X-Proofpoint-GUID: VZeZ1se9makjNWpHp4PGsc6RPsddpIpA
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a389df3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=G-0MMZ6kwLWl7lZkNOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 380D56AC153


On 6/19/2026 12:18 PM, Krzysztof Kozlowski wrote:
> On 17/06/2026 13:02, Fenglin Wu wrote:
>> On 6/17/2026 6:35 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jun 16, 2026 at 03:08:24AM -0700, Fenglin Wu wrote:
>>>> ....
>>>> +
>>>> +  qcom,lra-period-us:
>>>> +    description:
>>>> +      LRA actuator initial resonance period in microseconds
>>>> +      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
>>>> +      rates and the auto-resonance zero-crossing window.
>>> This does not feel like static characteristic. Isn't period depending on
>>> intensity of vibration you want to have? Why would that be fixed per
>>> board?
>> This period is specifically used for playbacks that require
>> auto-resonance to be enabled, which I referred to as "T_LRA-based" and
>> "auto-resonance zero-crossing window." It plays a key role in the
>> "DIRECT_PLAY" mode, which produces a constant vibration effect. To
>> adjust the vibration intensity during this constant effect, the hardware
>> does it by scaling the peak voltage of the driver signals, rather than
>> changing the frequency.
> But maybe changing frequency runtime still would be useful?
It could be, but the LRA F0 (resonant frequency) still needs to be the 
starting point. You can control vibration intensity by driving the LRA 
slightly off resonance by a given percentage—for example, to reach 50% 
vibration, you could probably drive it 10% off resonant frequency, and 
that mapping also depends on the LRA characteristic. Keep in mind that 
LRA is a spring-mass resonant system, so its output is not linear with 
driving frequency; it is a High_Q system, and its output actually shows 
a sharp peak at the resonance point. By contrast, the relationship 
between driving voltage and its output is much more linear, so scaling 
vibration intensity by adjusting the driving voltage is easier to 
control. Qcom haptics HW scales vibration intensity in DIRECT_PLAY mode 
(for constant vibration effect) by scaling the driving voltage instead. 
That said, the HW can also change the driving waveform frequency by 
updating the T-LRA registers, and this property has to be specified as 
an initial value; otherwise, you won't have a baseline to achieve that.

>
> What does the frequency depend on? IOW, how do you choose the value here
> - based on some motor-part characteristics?
It's the resonant frequency of the LRA actuator that's mounted on the board.

>
> Best regards,
> Krzysztof

