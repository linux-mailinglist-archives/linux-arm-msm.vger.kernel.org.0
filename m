Return-Path: <linux-arm-msm+bounces-118970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +36UOI3hVWraugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:13:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C4751C13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:13:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S7WTkp8J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fVvGlbpE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07D6B3007BBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556A12D7DEA;
	Tue, 14 Jul 2026 07:13:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F619368282
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:13:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013195; cv=none; b=PQk3E6UDZGMJEt5oE9Se4j/Kf8WLSb7GN6brjUAzvk4eSwx1j8TAJTNnNWIe0UWroPbQDUB3RfuLf9LmBNjFskE9uZait0o7tLwWuOzAjwF1LFHI7ljdZwOoCrQqp2jo3hxcx4ZiTYvu8Om9n1GOtr+wMdZsXSyFHuaZnuc3T9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013195; c=relaxed/simple;
	bh=oMF9fxA6TUqHssYpmwKnwt+AK55xxGpKjUk40Can0EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDsvjw4HWTxeWYRXA7q/tYMSmTOiCJMrJeujmqbNQJGFJirIr39CwzRYklX76eR0KwBIgrcVWmspIxPbWEhIRYjJyJ6HR1qH6juPZWwupJYadOIFqlUxbLw1OU3DaGb+XyEMHjupfwObbq5oP3bE+8qAU55uRm2pdMKI6xWUn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7WTkp8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVvGlbpE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SW4g3740571
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90GBrB280GiRPxiqYLOldEYRgmQr41vcQysmzxNp5to=; b=S7WTkp8JhFNzoly1
	yI+Za7iHvAZkdLL+ld9sy/jAWRNiW5wMj5u7ce5zDMo4U4Id2cwjpOYQ0j+SQWks
	UbN06BkNXLTpRdp8wl26+3brU/iPQrMoGCdR+DEvnjSjYz4F+WEL548q04hGVzmH
	ReVm345aUEPaSbzImiMvvj9hrgT/LUxmJbKMCsHHlmLmL12zvT7CEWIEQ0DKlDgM
	sGWkLFrYbPJAQV5h/Jyv6GOgbT7eorRZxWHQEGdyyMVhSUUOlmtiMyUMWb7QwVnS
	OyIKP5u6fprSHVNmAAYCLDLUdmYDlsAnXipfq78O74sSy1OlYwlDBsCJ1xwjuQMq
	w+twhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde08rst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:13:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso67862585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013192; x=1784617992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90GBrB280GiRPxiqYLOldEYRgmQr41vcQysmzxNp5to=;
        b=fVvGlbpEBIwEeUutqTjTggsNeepMUJLhdNvUTaUTerQ89rljAYLUt3/f2w49LTsfUF
         hOdtcTQMFlzElQK/+J9j+f0AQGayAFeDu2Mdi9lYP+TdgbtDUkhc2lkbi7kvrj8SypjI
         EI1EU4SxWreZYi3uXi8GC58wqiHO9LzsSaBA8YIUHnVxnJ0f6jNVdEEj+5Nw49mfJpIg
         GdkPtUjbjIbdEEMgWGLAY3hYdmU416gtjcpk+hcgktgBt5fjzBbIvticwoFB6WgWxZkE
         QoCKu9UjgJF4co+4Ah/B/lvl755wqVpjagrPKpd+DepCw3RcBmHCGtjupKBppCt6qx9i
         dAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013192; x=1784617992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90GBrB280GiRPxiqYLOldEYRgmQr41vcQysmzxNp5to=;
        b=VsrEuU3kA3bdRJhrHjx5Q2PZYmeU3+F5Cg8TOLweNMyq/FljckdTyANtOBX5YSu8ii
         kBp5B9ohHgZ0LXPWfxHRfxCX6Ayfp4G3TSoOuwnsUyP4hHanSrJ/CChkCs1Rcc5MN59U
         wff335VgMysdVshyRolcJDGr4IE2QsOqYmg9BCTxe37077CZFscjrYCqSQ4PNKxMQvBo
         zszGk8LqMydFm97WYlQz0ET2R/LMezwzrgZEns8VtMP/PMw7dtlbrnZqDucc3SKbtx9T
         Q0lyP66Rq7R7A+yDHCqAUBjfo+FbJ0jIxNGkZ35uFrwB5lv279jmfk4hx2kyKZSNBiO1
         7TRg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6KDjZEyeM96etgh+icnHTJvn5CbchE05yhfbDTe9X1YZ4eS0pNvgR5GwQdDXoyj5hI8Hp9WIXF9/5UDU9@vger.kernel.org
X-Gm-Message-State: AOJu0YwhjQR+PmwuW6Cn0oICBuMQp+G481ygj1N9Lt9a895ZSlpXCpyR
	8Yu1gw34+/6Un93oK5DXkY96ubi+M7xymSVKbY40jJC3xdEVqyN5GbJwQMAFRReEn9AoMYQfxpD
	90tfyhrxr1tXMiUwcChS1oAJLPo/j3t7xTpHAjMQ7CK+y6svMjP067Wni+n4EdGNey1R1
X-Gm-Gg: AfdE7cm3AL1lc2ORM/rQ9Fctpr+ReHohAnTUY+zJzLOYwgl/TF+zesgBOppGxXOkazC
	jf1IoTgpFB4E3XthD7abUk3uGP8wQCCeClw8FQWWugMFMZo3xyxZkIyW01i+DhznYC06hoYQqmw
	3mB0zFiuGEk3vocPupYdsSjsc14xQMuAy5KTHcJeICtofyvJhm5wA7dhcb6V+6b0YjCLhn6l+Q3
	SEEtSjMxk0/+Y4zUmQmwqy8sAaTHJ7PUzAR8wkAi5wwnbAHwbhiL2s0DIX3ApJZLdQi0dL8uG0f
	78sUEy1wQpttMh3OGfEcdI6OlRAFfLvx3GxRAb7uIk3pX3lN+jyESc2w+22l6HtQn47n4uhJ9eB
	ZvoRyp2g4Dhk1s+rf8Dg/qjtee0b5/MxrDys=
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr96724971cf.4.1784013192292;
        Tue, 14 Jul 2026 00:13:12 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr96724821cf.4.1784013191831;
        Tue, 14 Jul 2026 00:13:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd29213d7sm910711a12.16.2026.07.14.00.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:13:10 -0700 (PDT)
Message-ID: <3f197b61-3188-4c0a-8413-b43beebaf3e6@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:13:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Alex <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
 <3f923649-34ff-4089-87e2-8989dae335ca@oss.qualcomm.com>
 <CAD3ATv2awRTVKXD_+fK1vMv7R+du9deuyZoBqsZCT49mnLB0SA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD3ATv2awRTVKXD_+fK1vMv7R+du9deuyZoBqsZCT49mnLB0SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX5HFo6gei+Gbn
 64ucR7okhT6DclkjolEl/+Wy0TbZVOGzxP1WIZr/oYXfViwJAiQJl9fczS2eJWFyqBEf1eoA65O
 KGAesQW9DnHfH25tag1UrcRVhznWusI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX8FVrTmB66mOt
 4tX0FevOSDxyFMIBvW0txTXQHnaODg22Y7IYfnbI8NrjtBt0tK0SquyScujKNpP6u0saKmOWYh8
 mmR//CLSHDuqTjsa7E5dGJICdacpcS4kGpVeGaNmkTAQEcb3m6gdzcnEFq1PqhZskY5Rm81Ylky
 r09a5hXJXaNGREoMywIjwLCVQUcLRUyzITM1aq8irlDVbJzKnH8XFpoYyt5yYU+JdZhsSXYUJ81
 FNfv45JXasRT6b52KzckoyUyABXVNjr4DJmLO75Gw+raok6CNXM13jlXRDrG0LCjcME0Fe2s13Y
 AqEDNnEs0XYr6ZG4R59DiAWVMZpLf9ViIIDOpDKySf6fak150YXIZ8VWs5Iz6RvgVFmJiIO98uN
 QOjXqkzBzpP+FOcFpkVKzWh4LMrxqWm+GBlCVo+UB5XpEZkMTKS4f9HbirTFoDtVZmOq6g7CYGn
 nV+YJt0ctvqIz14VQQA==
X-Proofpoint-ORIG-GUID: I4mHj-zMdiMzGVgRoTZ6dSvJFK2r2pQB
X-Proofpoint-GUID: I4mHj-zMdiMzGVgRoTZ6dSvJFK2r2pQB
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55e188 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3CuGTW51vA1zEpcHy6AA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118970-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksiionchul@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 902C4751C13

On 7/13/26 4:10 PM, Alex wrote:
> On 13/7/26 at 09:52 AM, Konrad Dybcio wrote:
>>> +&usb_1 {
>>> + /* USB 2.0 only */
>>
>> Did you test that (with an actual USB3 cable)?
> 
> No, I have only tested USB 2.0 operation and do not currently have a
> USB 3-capable Type-C cable available. The downstream DTS configures
> the generic Yupik primary controller for SuperSpeed, but I could not
> verify SuperSpeed operation on Lisa. Therefore, the initial submission
> only describes the USB 2.0 configuration that has been tested.

That's ok

Konrad

