Return-Path: <linux-arm-msm+bounces-105748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDDYIDOd+GnHxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:20:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A14BDC86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CAE0305264F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00FA3DD505;
	Mon,  4 May 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSvuHGy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMhwT42B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B53DB626
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900260; cv=none; b=uBJU8xMvh/+mtVnOB+kXm0D8j01EJBV0L2aUofYvUpK65eqzOfjZ28mblBI2Dsm1CdA9iEJVDxSX+8LJ5QNnYDLEWLTcwylI5jY2jkyC8LkPqkD22MiLRa84SSc7ZR1Tqg11IHHCMxrqVYX/x+qeqHAiUlbecAZ+rpr+r2tvPmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900260; c=relaxed/simple;
	bh=65BCyDO9jtqHt0rIS+TTWdrkvghKnA/Z0GBZ5zaHOzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDmZhImBiIxxBCYqTzX6hqub0/RBxhrctZITOBrHNSPkQoMxM1dAJv5yFEF48dAqqwKubNtsQ81gkKCOsz+1HXfV+WQogFkd+qtIUiYSqCfKawSfBc/hFfgCI4pP1qEUhDce/W6okFcCJgnzT58i9F/FrUUT6tvN48LV32EjkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSvuHGy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMhwT42B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4JN7798102
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 13:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=; b=ZSvuHGy95t9IhfsP
	U3AUnAAWUZb4mq54JFS6nvzoZ9btK6EbfUg23V7kI56xOv7GPGAzijdIcg4NtuwA
	QQzmGEQyU/M8acpw5M99WmnZoh9sOA+qPIXl0bAnsEezyx4ZT6VH1emP73U+So1v
	P7dUn0UWcIkTpQug6+gD66d4Umg7wTExv3+MGH+pzOShYIhqBy74moGYuJ7yqwDm
	qW8DAN2Nh0Yov6kGScLpG+Pb6VQHKwO1zbNqBJ1kq530dm4W+d0SNFH8E8kP9XW6
	SVo8kV2gK42wvtxUL6SkLKEtx02NFmBDUEtCeGR1dxi/jjEP3YV433YmTCMgLyDY
	E780jA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxnsay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 13:10:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60fa6cc0c81so367822137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777900257; x=1778505057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=;
        b=XMhwT42BYOa/tG22c5TqncrG0WSs8tKCsN2doO/JXG8VgUpTHTnSgrdBFk4rSzfJ/s
         bSbWubMyxaZbQ/J1aoiXx+Ac8BUXJQwkv1O9+6QHcbm8tMzlWacj2HVy1O9TnwZxuJmC
         0zOCXYIYB1doyquaS7YVyMsDrl3PEfskfNs5x3rvmmBlNiWQglWeS6irATSTgT8jPEbh
         DVw3Q++hjcJyuX5AmE8kmRG5blbynWQ1Lrz6Ul0sXjzDy3d3hBBIRdqYHZatQJzZxKyU
         DER3eEAiaCLU4s/vc9S6TYXaGRFiGud0IfsPCF9RxyAcUi9ZsUEbw/Gkmb6xLybr07lv
         DEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900257; x=1778505057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=;
        b=QNC4etJm0iiSw7kV/0k31GNbrUZsPw2n/3eSP7DSboo1/xfc2pSgdGh6dkoffumcmm
         BCHmBlN36C+tDi0QA6ooa6+F+1uoZJzFwPDjEefctxmjSKfgs2nilbSTu1/aLIpIYkyX
         7cYUf5SfeVoe3BmUmjnNWzbP+BZhMB/foBVDjjFevl5JyhypjlY3hfb4lQAuvFY7Ncgw
         ZnyVD2s/34NxptSaIQrsUWUE9/AsryPilcbwqWyV1800cE7eUKCrFKaWZBatbnDD8Uvr
         TyhxEHBjbi0WZ72A0kl4UznWcvmBUuzexhZU7pQYGovhHZAqf1QnOPkSvWIH0IP3guUx
         VWvw==
X-Forwarded-Encrypted: i=1; AFNElJ9M8zB1js0exwJYFbbGx5wMMYgWfcQDj8Lj+nUlxv8QnEUBd7ivISvZyaaFlvuTwykw2V6kZ+PFZbrApjZH@vger.kernel.org
X-Gm-Message-State: AOJu0YxDX37Aj3jTjfA93rgyfOUr0QIi00lZGZ0Oof/KaEjIQgrwzt4R
	yVnjpb1p+tZgYQoLJDaIgnCq8fVJ0CeMKJczNvjMfaSkAB4zNITl2dF73etb/3u/jrHk+yBYdLf
	oOou+EY11LmWndGN7BJgjLjSBUhLfweyyRVUnyc9bRE+FDMhmED8QsTtYhyRSrGCjuXgF
X-Gm-Gg: AeBDievv0g3lryX+ch34JgxKs7HAEsuVpIqZvOHG6kpUCr/fYr8ENoyl7BFPVo7eaKi
	NEb+uhjcDWtYmp+Q9ZD5FyOOr+tFzRZCaCX5Ij8gua2d2THa1OwSmMDWYiYyGuNTytCzDKpp6ZW
	ASVE9wREebpoCaO+5EVjwbH9SXqmBx7mIGdFiLTVTyKwj2omhvSRgIQSIEP0NIxv+EgAwI4i99k
	V3mbxHI3XhQJIhxPrULtuz30DmCbyC+5gT3PXqzQLM3OeLBZ8tEu+6jpmJhqHKGzt6x5+iBko19
	fW5ho0Fo9ONkGaU1GY88uhHJ7VVI8Q6m0xojcYKgAMwKelGwQaQA/iQVUYHFxy4EDRCG7UIhnqh
	vAmqvmzjOUC/HoinPbSLU7o7JYXu+8EUHVVGkvTBIt7hpl2uOxeijbN6658r0aChoTzRVsrroBR
	ndszGVXII2sWQeJw==
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr279788e0c.3.1777900257411;
        Mon, 04 May 2026 06:10:57 -0700 (PDT)
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr279764e0c.3.1777900256820;
        Mon, 04 May 2026 06:10:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ad2d59fcsm149037266b.45.2026.05.04.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:10:55 -0700 (PDT)
Message-ID: <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:10:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
 <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4mke7Qp2dTfpSRaMLw4Fg69JTuy_tytF
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f89ae2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1iLxIbVeREuL6hqEqU8A:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 4mke7Qp2dTfpSRaMLw4Fg69JTuy_tytF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0MCBTYWx0ZWRfX5tKlmN9/kMBb
 yjTVJpLf9kjmDgUXVni8x10l4CuGJAKxb1LDk+2fvOFVemKuZMlyPeFvv6nAcLOotSljSySpzUb
 7BLrhX8QNFb3n3++A/A5HA7T8hRQYeA3oNsdvLYskWMChMLEmDq10XmIhA16lYb8X+xrPsY6mUx
 KIGrgBAH9TTs82RrQS3CEebFuj7a4MYcsSBWmO9aXEewN048MJAbCV/BbKYldRiV8tI876yrIE7
 jo5VkRJbRTRylEA8jNXQr0BhzV7RiHW8YcECjxIiwGZyK//0jKZZPF56V1qfqpR97XpySnwXTCJ
 G2n5cTLZlwnGlhvNVQ5w8Y4B9rdc3UFyZntp0HSxuuZNOAiKnQzrRPRRl1HsajkvGRmUJ64a4rg
 CkOgQDhqA1lECH1dUW1czmdWUGQXFwKpYZdh8p60f6IDa+lq0+fi6ZgDU6u+0uWqqebcOyBl3wt
 ZIgETLDr9s+m95w3YCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040140
X-Rspamd-Queue-Id: 5A0A14BDC86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-105748-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/1/26 11:20 AM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>
>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>
>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> index db72418b7195..d8ac495ca7c8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>  
>>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>>  
>>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>>  		pinctrl-names = "default";
>>>>  
>>>>  		regulators {
>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>>  };
>>>>  
>>>> +&pmk8550_gpios {
>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>> +		pins = "gpio5";
>>>> +		function = "func1";
>>>> +		input-disable;
>>>> +		output-enable;
>>>
>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>> sequencer?
>>
>> If you mean that it may be needed to toggle it with specific timings,
>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>> access to some docs that I think should have the answer, hopefully should
>> get it soon.
> 
> Did you manage to get anything there yet?

Yeah, sorry, it got lost in the sea of emails..

The PDF talks about the electrical requirements of the clock signal and
the section titled "Power-up sequence timing" doesn't mention it at all,
so my assumption would be "OK so long as it's ticking before you power
up the WCN"

Konrad

