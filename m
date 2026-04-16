Return-Path: <linux-arm-msm+bounces-103404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJzhAkTT4GkGmgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:17:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B183440DFA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F4143023312
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFB43B6C12;
	Thu, 16 Apr 2026 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD0jjHU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTZHAOsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E7373BEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776341478; cv=none; b=E98bser5HsR4zuLV5tZ752QYD1M6HcnHgbpWFP5OyZg8kgtGKPx15uLoCxm6I4rwqFueVQUR4G2jdmhThoHpuyETaWEyQTZ6xXXE49Zvec037jKKtlQlXMzaAVU4svFLYVe5QuwWGwj8RJ58QAb1IqxDOzG5Fi9oEgn4ZHerS+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776341478; c=relaxed/simple;
	bh=xY9spHG0I9k/xKdB4Jnf6G+YyGWpjiQAq+78b3S6yiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKrGrpvS26dUVkOf/MtTxRaxj1Lk3G+nJpxzc6i51W1vOoLPHpYJVPyMk4RHFV9xO9spG+WTGq3rVOprsbXEV2UBcWDYcj2A+nV1a3LYpEMD09Yiita0GJaQ4pjabogJJIYfnubwBJlWcAXvVvDMbfTA+TydQrYYvfySxzJv3r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD0jjHU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTZHAOsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6OnQ52651839
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vA/0TTJ3KmuwOYZVhVuxVyXB2dY3lD4/8d/ncnJuhb8=; b=dD0jjHU3UoW3eblI
	6VeCNmxInpAVcu57oIlsSmEHJfUc6fz/GMlDDsofyo6G/nCw5sWslaMkjJw96gY4
	QOmjgj+U2Y8Nlsq0uOXS3DYUo3C+52suM97IIIvh5LO6SALswUYVJwRnoPwTTrsh
	TVgLP57WYIKRDLlTdOo0OezgjU/9AwySkN/fLnIrxN3sEL4U4f+7KnSZT8Ic6eqH
	1GAHtQbb2quT6lK23Mi6uxXyP8A7bmxT365trjtt4xyLpUtgCpkW5t7OqsrpIdEj
	O7SiJT3quCZPKxNRiqZ1HZMW22uXS9R6CSc2MOFiH8eyptaWB0E7xuyoyyl/Zcg8
	d1yuiw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuh6yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:11:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso4504623a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776341469; x=1776946269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vA/0TTJ3KmuwOYZVhVuxVyXB2dY3lD4/8d/ncnJuhb8=;
        b=OTZHAOsMZ/4qZ53N/JcX3XYDuvsRNMeoE9jX5rfto+P+Xf5H6f09ge29YC35CjHr6P
         UcaJybh/c+FN7TkuKdo6YKQLcfk6a7zHQyMf7bqfVF2lprIsIxlOQW5kklsHFxmS5lEu
         TMhbhdA1cBJyUS8aWhrsdaOoof9qOfZN3qlpih2jHAt7EG7GuFKU43cAYdenubaB1cII
         F0y0DIMMOU5KivtsFY0va5cgVhR2yJ9IJ50POo9d7rm+VKQu0OQUhO6dxqC9kXpHPKDi
         8KQZTUSue2KIgpvsdqm0Jhh2vWuTjnQB528fC2zp70FMYEMnWAGqofWj+bpOe63oMJ/W
         5Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776341469; x=1776946269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA/0TTJ3KmuwOYZVhVuxVyXB2dY3lD4/8d/ncnJuhb8=;
        b=ObH1kgW9tJj7nRdFyJ9Nvu2byFfnvz/49M5IzfsSVtBKLF5aljRvmcD2D+LKuE1ujA
         9OzmZXUvmuQEcy829llh76B8pDP1d+L0zzRC/HZJr5ccETNYJ2/vd8nE1xkePNQJRfGL
         AwtJqb+M+A+h0z0qPFbDcWg4CBITE67lADXBF9Vv+73QqXAheMDvClzlQuxIPJxQGZhp
         05/s1o+bqaHkd/SWeUslfgXziYLF9Y52EM0dwu2yKao0ikvS8hFeLU1EsuUEdICqlrdU
         obaqJRq66ZcpWDVT1tbWvQDRyD6xCuPiaIF4xTicVBjFua6O9P22zc9aFia6QnAcDYnK
         NqtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PSVzYx35+Gfwtbp9atQJwmhc0rovQGGb1eGgw6Iv3nCqJkS3nOgTYrN2drKfmDLNjaxPpL9H5PEWEkZcq@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHXTnFHIVlFlNnb8gye949NNDX6szNW0pZ5/GYFt15jDJprOc
	VcDPtdxBNxHyVRGMUTb+znk45FKHS89Bd2gr+FLNIX+3koYmC0+McBl3f3HeI0a1QlNhsD5RKje
	UmNEU/iXxb/yw6/d7wLh1lBbxIidK6AqZiKTpLszNFGZZsAoSMLRwBioBcpLl3bpuMegL
X-Gm-Gg: AeBDievFzT1SV1G28mHj7xqtxRwdUJGxdNZ8fuO+JJ0feiRMZzAlfAvQThOpxAjuwWD
	0VzW5tDwyF6szkS9BriRX5K6QTtcr9niPIza23glO7H2ZzR6Rg/LHyFLNoz3WT46tDG2jdy51mI
	cYR3jb5/xote+6EzAuW3aaqqwMf61uH/Uz7lt/0Ns5Rdfh+VYAHnuqyPxKF77XA8BSGqDQ49YaN
	drB+rq1BNkDXnM2y3Y2SBLtSXSmH/5Eyu6gA6W7+yvFCWK2LBCfd+xboaj1rZu0bKAPuCRt4xPU
	6oliAmIAtSfZbQEba2CAchIKuNzX5gwlfFtxVy1MbLu0lIO1hqlvHtjF7sF6CGJLw0TW3TJZsv6
	pQ6Ir/FtuQc8HZYs+I83GZT96Ar38U8hFJixThFuHIehQj5o8a9IB
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35e4281374emr25473738a91.23.1776341468373;
        Thu, 16 Apr 2026 05:11:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35e4281374emr25473672a91.23.1776341467609;
        Thu, 16 Apr 2026 05:11:07 -0700 (PDT)
Received: from [10.217.218.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36132dbce55sm2084793a91.13.2026.04.16.05.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:11:06 -0700 (PDT)
Message-ID: <220f1f5d-6382-4aac-9af8-bba11a87cc92@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:41:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
 <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
 <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Language: en-US
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
In-Reply-To: <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: olc8UHMqB4m2I7rz1xfZYv4KtRf-BVxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNSBTYWx0ZWRfX5N4R1Xl/+HJv
 6Nu47cdJWq+iYydICxC9eto2TpiRN6waj83CqAyLBtC1js1SYP0c0HppP9bqAeQz+0y1S6RoJl2
 gQO0eoT/u6H2YP93dckQttwvppwifAXkcgkd1ZzVY7ULXCyG77tQueCTxR9LEfVKt5s7Wedjxxk
 eVSHyrIAsEYQ/6Hnn9KWkYnqCfRRKwzyIsFlb5aLhQozhXDZleldYtc0vYZlm9HUlyhbZ+ulA0F
 izSY9FQaCukJC6VupsMU8P6UqO3dZivOAWfro82FWOM45NR6FT9h5KvrigOXq0hFjIIq0BFE6dB
 HkRpW22fJ9WntfSzgPj363PgZ1Rgqd70HM3+oVej/Ss3KkioK3OtgFZM+Hi0tKqxnGP7Kp+G/i0
 Q19DNevZpu4XTea2f11/iM5DKFW3k4mdnEAlt0scf593F9S8hmDXjvgk/5v1pO1myxCuOmj448y
 SBsS8+v2mW2R/P9m/Iw==
X-Proofpoint-GUID: olc8UHMqB4m2I7rz1xfZYv4KtRf-BVxP
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0d1dd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6NPFZmL_EsXISEHCnmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103404-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3b:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anup.kulkarni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B183440DFA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 11:39 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 06:20:14PM +0200, Konrad Dybcio wrote:
>> On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
>>>> Few CAN controllers, part of RTSS sub-system on LeMans, route
>>>> their RX signal through a I2C GPIO expander at address 0x3b.
>>>> RTSS subsystem is an MCU like sub-system on LeMans with independent
>>>> booting capability through OSPI interface and supports peripherals like
>>>> RGMII, CAN-FD, UART, I2C, SPI etc.
>>>>
>>>> Describe this hardware wiring by configuring the expander GPIO 4 pin as
>>>> hog with output-high, asserting the selected line during boot.
>>> Missing platform name in the subject.
Will update the name in the next patch.
>>>
>>>> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> index a1ef4eba2a20..b8371bdf9933 100644
>>>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>>>>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>>>>  		pinctrl-0 = <&expander3_int>;
>>>>  		pinctrl-names = "default";
>>>> +
>>>> +		rtss-can-sel-hog {
>>> Why is it being described as a hog rather than a pinctrl used by the
>>> CAN device?

The RTSS CAN device is active at boot-up so used hog property here. 

>> My understanding is that the CAN bus is managed by SAIL ("RTSS")
> So, Linux can affect what is being required for the safety island?

Yes, CAN bus is managed by RTSS, but the transceivers are

outside of RTSS. The RX line of CAN device is connected to the transceiver through I2C

GPIO expander on board level. GPIO Expander pin enables mux to connect CAN RX to transceiver. 

>

