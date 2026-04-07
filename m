Return-Path: <linux-arm-msm+bounces-102130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AAjM5vh1GnbyQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:51:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB23AD3D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6673F311A357
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B533AA4E2;
	Tue,  7 Apr 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zfljbcz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzxtrTrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3839A078
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558623; cv=none; b=KQARJQ4+HqYOv9IuUxnINktcgz7iiZrDnYVNaPgoTfjErnjty/Z6shC6wC8wSc5BkrozHdmmXdeIexXo4w+XeOr6wBlgqgsIY077AgVUsAGr0MXXHOUhxqIlp2j+uCXXPgnfLQx6nFGpMi17lV+Qzmuu+sgenKNfitSDHjA1lNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558623; c=relaxed/simple;
	bh=CQIjHIT+z+nLwPmfCgBgKCt4JlbpFBSGzO/WtyZV71U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+WE1MzKCfFGbspzYrmO08e3OizY5jFLOvlKLix4YCWgl026ftkaWoqYBrjaReWB6d8JUauz9YIItchqbB7JMsd5acxaI2/jrtHkoOpfifWtt4QEJ76n0Ueiwlfwl14uKAjDGnrFHtd67dFI0OYDRqSvXQSHEDoMkQaWecEDKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zfljbcz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzxtrTrD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376QIUb2550302
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETys1TN6NMui3A8I9wSgFlHJCcKqCJMgbzi8/hd5ztI=; b=Zfljbcz5AXBhAMlg
	ApFgK6+Qxy3CNaP586kxvz2uDA395O2DhaikDq2/JAdot9cCtsIyW6wmjMWbLAKT
	fyBhrMrv7UD9X9cLva3bBUq0IDkLLLbmOWTeNgZ9+z3wosXBfEPmAEu7Ft1n15Mh
	TW1eNJwVNwryBGRYmif83A04OhphZ9qGi/+vAs9O8Ahfkxnd++fcxbP//n+tyOgx
	aiynX6Q87yOuIlYZkbExrKB39gOgCEngp0TWCvbedCkFbBEgVq19+kPcfvIhhjVB
	/b0ypUXEf1ki7qCLveIjLB1IiMMF7d+XLJNTXxM6Zms4Yov2iCusj/y/ZiANbGZ/
	w5xJZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreabph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:43:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccb129547so16826406d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558620; x=1776163420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETys1TN6NMui3A8I9wSgFlHJCcKqCJMgbzi8/hd5ztI=;
        b=OzxtrTrDGIIYWq0lr5prchFcmYUhGNEpdw3hlOLP3ZWj2CurOFhMlDON6lvqQngnXb
         YBh24cwhLMMffyeTY2CTB8zzCHSt0K0H6SFhAIczRE+YAi7xAt1zPMtg1EoH8ndLxCPh
         Dayy9MOYnq22KvBoyMmt5AnZphkwMyAag4kWTJ9pZ7cnHejO275c9G70BhdgIytQrLRO
         dSY4+QdlTtuoJXadNsLDBkJgevHCL/DdcaZfePtDHACXangfVobcvMQa80bwOysSj1si
         ns+cVuuC5I2MeP0WiEmc+eFP2oyFx9ra2Q8iZ4IwSovAM96rxWNH3jnZYenkHVL/9a9s
         IX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558620; x=1776163420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETys1TN6NMui3A8I9wSgFlHJCcKqCJMgbzi8/hd5ztI=;
        b=lu4aU2DzLCnN7qTFnmRJ6CN5aMaywObEbmWlFaQFmbYBjAhrkrc0xShQ8JzpA+7ojx
         7XmwD1TRuLok4AEcEfP1LFi23ObIpfEdHyNM7DIqhTAI5sWbHUvLW0yYGXb3bJGZPf7w
         bPnDNs/MleqgINEJcCD7VuERylBVI0swldG7L9LHNCUFWdXPDg+mtz/WfoykAkj56tjh
         nzehPV8F1t2+JCx6hn7Zb4Xuy9TpjVDiT87xhXHevoawZ48EyKlmbS+siPEvuYDr09dN
         NwQ1W9ZXAupCrhnjzch8z/hs9kfvf5Bx9Hkc4bSXbjoyCOz3occvgA8y/dnbh0/Pruw0
         coxA==
X-Forwarded-Encrypted: i=1; AJvYcCW25Ilu9W4co3t2jr+hbMzlNnMUjzkmzbapO1lqC1cecqbwMkt03rZ2r5dc1gPhQkoK0Z82UgDaQzr0nzCi@vger.kernel.org
X-Gm-Message-State: AOJu0YxWOXPtIlfNe+J5cAWdbbBXkKm+W9lruBMCEw83FPV+5Fy06qbi
	1Ti2a/w+AT6GJLo0obuFTfbLNtHRRj1fBOYENgvAZK1Dv0s77c7SkpG01/CPXV2fkixf53nWzmE
	2br24ohpj1ntxoO1m2pwoHhn/UQJ5VJgERjhBV4J57AGm807h3JxCJPMNh7/hIsUQJzH7tFCgV7
	R4
X-Gm-Gg: AeBDievcj/9Du3YlW0cYzG50/+YFj6hW549Pt+9sjvgRSV0GFV9org8SoZxIFxsCt68
	oLuSZ5IvldU0nMmXNmqaZ27juouZZLP29Hq7RjliuKnZZwPhDfx4WNv8BvNM847cBYUTbGXrCD5
	dgtptZqJiNfYiDxRAJ+e/0mcUSs5ZVzycyew9+I9fBaR4tyfzAhT79cw0EnV3ZBfO6J14dRluaM
	h8tZjctr8gTVAr7XV8hCvAZ3ExwyQR7/V6aSesf+CrjdShDjRvSEhu3KMKCYi8ocjj7fXHYOXBu
	kFMQyS/9Cue2z1SnzIndkjY1jHwlraEFmLIQB4dFbTLoPGzlVtIcMQ6/OcGUHOkfqq0q+4PukKA
	uj0ZD8kEU9d1xfMbdPnVhGkSICmrvN9gmT1JHWAOi3EV8dQPPFsQLNDPZlFCHYL0E5bMmk8qyKk
	9w2NI=
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr191378126d6.1.1775558620556;
        Tue, 07 Apr 2026 03:43:40 -0700 (PDT)
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr191377906d6.1.1775558620066;
        Tue, 07 Apr 2026 03:43:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028955sm543149566b.61.2026.04.07.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:43:39 -0700 (PDT)
Message-ID: <74eb2ee8-b99d-418e-ba5e-d0802d571a7a@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce
 EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
 <e9826e27-da9e-4cd5-b368-be3e56f62072@oss.qualcomm.com>
 <oZ3ETRlKitLSlV93KwI5jlHnDIykdpHxhzThD4pT8FVvY48Y0jrPqDuwI81Zrwy8nwXe7DR0ZUKBTEN9SO8bsPa5xBNWlaNS8u_DG6Kcntc=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oZ3ETRlKitLSlV93KwI5jlHnDIykdpHxhzThD4pT8FVvY48Y0jrPqDuwI81Zrwy8nwXe7DR0ZUKBTEN9SO8bsPa5xBNWlaNS8u_DG6Kcntc=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4dfdd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=I76Qk8w-AAAA:8 a=8FqYyGtbWLuB_zq4eA8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: EWRMAf-mzRVIVTFBSIeGGj34FJcp5pS4
X-Proofpoint-ORIG-GUID: EWRMAf-mzRVIVTFBSIeGGj34FJcp5pS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX8VH2Hs/hhQWD
 +qqdCd+5AzIZNBnjvwf9gN+aXme6sDLg4ZrT5RqIY1TvveNcNdxzHbQucDA7jRK7iaOqnpiCp5y
 6u1TOsc/taSi1BjEkUxrATQxXJB3F9uejeG26O4rgYGGAJ+lf0QKbH7jO0wsuMvVqXVTnNJHPPe
 1YcQ8mJruFFJWCXTbV1ZblWCS7n6g335iI2EfNDoioS4mD2niw+d1XwTOc/T2lcRzC8CWfUhlVp
 Zc3/oSFWCs9tarD4d1SBr/TeG7MRSTj3K4oPfu/fkUpc0m4L9sSyq/j25aX8jqaQJdm/Py5Aqb3
 rklFn5msYIU8YRg0azcxCos/S2TP0PnDPD2OIv3aujuHKpXlF2RNxNYW87ZpkJ8Xyn0Z5sV89/e
 rGwnuSCzfIgBbkLZ94djTI9K+RUK0zl0ncKc/KNQOmXPEd1jym1VPCIGlStk+YPmk25ar2vaiVR
 LOYjTmLLeqtMCXXxXjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102130-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,vinarskis.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77CB23AD3D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 2:52 PM, Aleksandrs Vinarskis wrote:
> 
> On Wednesday, April 1st, 2026 at 11:21, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
>>> Describe embedded controller, its interrupt and required thermal zones.
>>> Add EC's reset GPIO to reserved range, as triggering it during device
>>> operation leads to unrecoverable and unusable state.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>> ---
>>
>> [...]
>>
>>> +		io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
>>> +
>>> +		io-channel-names = "sys_therm0", "sys_therm1", "sys_therm2",
>>> +				   "sys_therm3", "sys_therm4", "sys_therm5",
>>> +				   "sys_therm6";
>>
>> nit: one a line please, without a separating \n between x and x-names
> 
> Will drop \n. One a line as in:
> io-channel-names = "sys_therm0",
>                    "sys_therm1",
>                    "sys_therm2",
>                     ...
> ?

Yes please

[...]

>>>  &tlmm {
>>>  	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>>> +			       <65 1>,  /* EC Reset */
>>
>> Is that a "this may not be accessed" or rather "you can, but it has dire
>> consequences"?
> 
> The latter. Triggering EC reset appears to leave it in un-initialized state.
> When analyzing i2c dumps I noticed UEFI sends some data to EC prior to
> Windows driver loading, I am assuming its required for EC configuration.
> When resetting EC from userpsace:
> - Keyboard, Trackpad, touch-row power is out. WiFi connection drops. Dell's
>   UEFI allows disabling many peripherals, EC can 'veto' their resets and/or
>   power supplies. It appears in default reset state it kill some/all outputs
> - Holding power button does not reboot laptop, it looks as if it asserts and
>   holds EC in reset until released. During this time fans spin to max speed.
> - Device can be recovered only by disassembly and battery removal.
> 
>>
>> Would the EC driver/binding benefit from having a reference to that pin?
> 
> It will not be used by the driver, and it would greatly inconvenience user
> if triggered manually. I would make the reset pin as inaccessible as
> possible, but if you say its cleaner to reference it to EC driver and just
> not use it, I could do that as well.

I would assume the EC is powered from some always-on rail, or that it can
at least somehow sustain entry into all the various low power modes and we
won't have to re-initialize it from Linux, but that's only a guess

That said, like you suggest, exposing that pin currently causes more harm
than good and we can always circle back and revert this in the future, should
that become desired, perhaps with the only caveat being that users of old DTs
(i.e. without that description) would not get the ability to reset the EC on
demand

Konrad

