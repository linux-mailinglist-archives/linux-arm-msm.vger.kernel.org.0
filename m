Return-Path: <linux-arm-msm+bounces-108398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE9kE2sbDGpJWQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:12:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37683579BD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AFC5302BB08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359F23E00B4;
	Tue, 19 May 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV1zaUWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKhbrWTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A963DE447
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178335; cv=none; b=Ed/3SLrgAquMFGTtpxFscjgoFB8E7Y6M9ilj/+OtxTFJ7m54Js6RjckiJDf/vy6z695H+IsGNDiPKLvDixD0aliCBIK0JT6xmc/wAhG5tOToY7bC92TL+bia/8fMokLGq6LbH1BhRWH0x+EWFamizVQlPQulc5wCaDcyfurt4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178335; c=relaxed/simple;
	bh=AkD0HPf/oaVgoTetk1xqcnpVbcaiOfhSjrBkQLLIB0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6Dc/baYwiFahUSMCLxtfdUgj62L/R1l4h6+wrwOl17cVjYDTeVW8dKQA0d/p8jUSFzx+xAY947UPx3BqeIrI4nQaTtN9E5euaJBUj2FqOgsVJQ5jBscGLWZ1cC8p/PaL/FT6q8D3RhuJAvSSUUOiwru97GuM+SrFp3ewEZxeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV1zaUWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKhbrWTI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5a7Sn867004
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaprrUF8vpUjVLa4vb1XRD5DpMNQM8FYKVUvlZftX7g=; b=RV1zaUWhSzkBkfnh
	M3MpFsVnyb7EXp5C2ahi1ur4bxpISkeeZNizYSJSucLSIg6cq3qcgH8KrDVqM5X+
	RlKoy1RpAhoLidmf5H9/lRfnFQA372k0EAL1WLK7RVqneFcIE2jaOqv1yumFXcnM
	H9CDJMzZ0+qE7o0KU8XqPWPef5Qw618P3UJQLShFLT7G4kJ86XebGZOQH77oXLG4
	Xck1ju4E7Gl4RnQnX99HYV8XMLqjPuHixbfFXY75zwBCUh1RBjDD079bvF0Hyxd7
	LWezCENUJzVfJ62HBjMeoTlYVeolhmPhm4R+dXQjFanBZrrehdBCvZIoaKJ0lLCY
	n7vCkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1gn2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:12:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb0b93e90so10384711cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779178331; x=1779783131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaprrUF8vpUjVLa4vb1XRD5DpMNQM8FYKVUvlZftX7g=;
        b=UKhbrWTIZID4vdyrHLtxoSwXGgZeA1trr+0+xydWvdKRIALGN9YZ1fi66L9AkMCyLj
         30AQEXTay1scn2Roou774IkJwgMOXdP/DwP366xDEEsSJjOdB4PLkZHg5x4pFqsMAwFS
         rCUnL8mPL5SyZ2BrEBrLHBONEYLKwFrYOQIdJjplQipC0v/3pejVWC+4KTvfl9k13FR8
         IMyn1rqkk2nZcSRDvBz58BLW1TtAxK5eS5JJl/biPw+z5YM08BdC1PnYiSXdkV12VWxa
         InwKOPCJLCUKHXie5pwe14iBja14J2Zs8h6XX4CHoE7xPJOTTRGeaatK6K88cBrA3PGX
         e0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178331; x=1779783131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaprrUF8vpUjVLa4vb1XRD5DpMNQM8FYKVUvlZftX7g=;
        b=TG2WH0FZBlXEfvp9scXFN9CviodYZ+uUBEJ9mdldJbSDbpukHaPhSONvq6BmjSxScY
         LPqXSXJXUZ205rG12nN4L0He7Z+Zi7a19Oe+UAT+spgBfN/cV4qd+3V0mQNRZJ4DLRxl
         ijK3QZPJwVMGf/ebwHP/s9Vcb2WMFuVxN8fXzj6Okg2N7zIzB7xHxo0vQ8RMbFmUID8W
         GM+8h4iMJmg7yyfTIMF+Sqlje0/WhauaifOWqIBIL5WfCztT7pqFFn9Ufoywj2DweVSZ
         jqcC8Z7wo3rg7h+wFYKMouFiMTZGiBdzBnUJFhVGXVYdC0oPIZje2i6DFj+H8Qv7FGTX
         yd7g==
X-Forwarded-Encrypted: i=1; AFNElJ8ob7n2vYEE04CmuW75Fz0Z8w8OIxKZgzK2IQP7Fco8JTSd4df7sRpodNqtufxGeb7nArzUq3ktJtFLIoEv@vger.kernel.org
X-Gm-Message-State: AOJu0YycsTUuz+oNvyUVr1yiRG5iOKzViGHpMWcUIgnc89OxKOiZm4Ui
	50JoOgR9KmF2jkVMj7+4nWHImidMRLfP5OXBbUnNzUuMEq9iDyrL1U5AUvrHYsf0cfJjwjOsIyY
	Halx/hlqOcvRnCWWOT4lBL9ieeOevN9W5VNiLhOovoebTIJS4NZhL3SGVjiWfgnKc93VO
X-Gm-Gg: Acq92OHr/571ijnZHEQzgKzicJUddUWnM4PGYxZRjJ3xALXUPk2iIDTYKFRBS530dfq
	XCpXq+Q0v7C3GxYQmpKIgYamC92B8nSIY/ytZMJ7r7Aoc/b8BYQsvG8nHf2BKs7uTEfEQwNbILc
	sHq3LB9G711jGRWn+QS2EjgBYviFT525al541JPKNed90cBrIqTgGsOdBo8RD3Bl75PzCExBA9r
	yZn+zRpIJ3XYolCfBwXWEWKIK0/v4x/MBcddWNTPgfgtdyIk/pGX0D8HjVrmRJf8L0O2KnoDyLq
	Aw84VufZZkRY+3ZQnHJZiIU3h0cw8uHBAAdtrHeubs5euiS+60WVUkc9YeG3I31KiuykDAnR8AF
	+hEV6PM4LaJ27yp1nmwX5l6ulVmqOE4od6eFC49yZcoaEiWaVjnKzVFwqjBwyQ35TOtYH+N7iaw
	uGEHo0ztFI5sBWXQ==
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr201374281cf.5.1779178330926;
        Tue, 19 May 2026 01:12:10 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr201374001cf.5.1779178330493;
        Tue, 19 May 2026 01:12:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eac613sm667423166b.56.2026.05.19.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:12:09 -0700 (PDT)
Message-ID: <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
Date: Tue, 19 May 2026 10:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MCBTYWx0ZWRfX1EYsarZnViUm
 UYgVd4PXDDDk6ip9nAseu2SB41MsWw0Y8rQQ4lbBfFzxNfRO4T14dXsk+Npspq9RRAbbv5D9k3T
 3x42kMvb4v3PQKphDClPnblm4Vy5l9k5MD2y7hdJrKJSM+3ZZiJ/XTsCm0bznWMcnIiZN96TdUV
 3+BLQ1Mabchv9h8TCnOKADNL0P0qkHwQz9BNBqcY2GVPVOEQ/2Qg2Zf5DqUWrIRnN2/QG9BGr3C
 +HGpimADLTeuXHsiPwf0x3iLugKXN9Qkc0X7HzS4COJ+pVUy7Xsiq0ZNsiuuc+2hhXYARBKzjbB
 5nIoU2ZXPjvpHe1IatXIEt2IzxFE99AcLH7HeRx1uAJuLE1boYwpXE05QB0H6TWZwRk1RJNlMPq
 +70FnfW3iTWiQ4C+vYGN5Vlh7QqXqpHafIVs9fLBdJ0aRS8Pokhy2mHV5WHj/0By0YH9Hefs3jM
 QQ8hkh5fhJ+CIzsRIPQ==
X-Proofpoint-GUID: rh5rC7rac5QMcZDUNM2o5Lg0TuHZ2PZh
X-Proofpoint-ORIG-GUID: rh5rC7rac5QMcZDUNM2o5Lg0TuHZ2PZh
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c1b5b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-TPEly4Dc_bI0ZYMlfQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108398-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37683579BD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>>>> and DP signal processing capabilities. In that architecture, USB3 and
>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>>>> The DP part is roughly the same as on the instances without USB4.
>>>>
>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
>>>> given moment (not to be confused with USB3 not being able to be
>>>> tunneled as USB4 packets - that of course remains possible).
>>>> The DP PLL is still used for clocking tunneled DP links. It may be
>>>> turned off to save power when no tunnels are active, but that's left as
>>>> a TODO item for now.
>>>>
>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
>>>> the Host Router, and as such the QMPPHY's mux_set() function is
>>>> nullified for the period when USB4 PHY remains active. This is strictly
>>>> necessary, as the Host Router driver is going to excercise manual
>>>> control over the USB4 PHY's power state, which is needed by the suspend
>>>> and resume flows. Failure to control that synchronously with other
>>>> parts of the code results in a SoC crash by unlocked access.
>>>>
>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>>>> submodes.
>>>>
>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
>>>> couple specific overrides, pertaining to electrical characteristics,
>>>> which are easily accommodated for.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>>>
>>>
>>> Overall it looks good. The major question (after looking at TODOs), do
>>> we need a separate submode for USB+DP / TBT+DP?
>>
>> The problem space is as follows:
>>
>> After a TBT (collectively TBT3+ and USB4) link has been established and
>> we have a link partner, we may (based on the HW capabilities and user
>> config, such as kernel params but not only) start or stop a DP tunnel at
>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
>> as a separate DP AUX host)
> 
> So far so good. But I still don't grok if having a DP-over-USB4 is a
> separate submode or not. I.e. I see code (and TODOs) to detect and
> handle DP going on and off. Would it be better if we specify that
> explicitly?

I really don't want to end up in a situation like we have with:

$ rg _USB include/linux/phy/phy.h
29:     PHY_MODE_USB_HOST,
30:     PHY_MODE_USB_HOST_LS,
31:     PHY_MODE_USB_HOST_FS,
32:     PHY_MODE_USB_HOST_HS,
33:     PHY_MODE_USB_HOST_SS,
34:     PHY_MODE_USB_DEVICE,
35:     PHY_MODE_USB_DEVICE_LS,
36:     PHY_MODE_USB_DEVICE_FS,
37:     PHY_MODE_USB_DEVICE_HS,
38:     PHY_MODE_USB_DEVICE_SS,
39:     PHY_MODE_USB_OTG,

>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
>> (and each of these routers is hardwired to one of the PHYs).
>>
>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
>> super high-res display at one of the physical ports, or a long
>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
>> we would only need one of the PHYs (associated with the router that's
>> wired to that port) to provide a DP clock.
>>
>> This, along with the normal (logical or physical) present/absent status
>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
>> or something along those lines to toggle that bit as necessary
> 
> I don't see phy_set_opts(). So maybe a submode then...

Sorry, I misremembered the name. The function is phy_configure(), and it
takes a union phy_configure_opts, hence the confusion

Konrad

