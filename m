Return-Path: <linux-arm-msm+bounces-116863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gD+NOk3KS2o2aQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:31:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C27129ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8HCX4A7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FJILlPke;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116863-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116863-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 210E0308D7EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02B937266D;
	Mon,  6 Jul 2026 13:38:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB1736EA82
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:38:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345130; cv=none; b=QPeABqcVZazKYtoez0ihXcMs7Sa+0O2Yjugsy/SkWwRAbAmwchPXrvTo3Kvv7cY1rPQTMNWVSbG3OtNaxlovcIZTjFTfyM/3dS7Eyl0PcXthRBqVQ7itUHbyGaXIgJYd1laYaFS7VYJrZdiD/BlC9/KhN0r+EGWxieOoSyaeihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345130; c=relaxed/simple;
	bh=xAO8W64tER2blYKJ1bCUGeCt9pGYu9JHqw0HBiSEd8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmZLSEq6dS7bPxa7bgWTmq6kBBYrqkW1ZV76rEPpmpizBINs+WSWdHJy5j+pKbHhg+JMp04jK/Ty5qEXTrTQG7Z/03DX74kW17NRf9uiDSh9Y7vCRimyFmuc0f0O9VfvmUZm75n8uURYdPFwaK4aywBwgs6dP03/hbe41zIrZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8HCX4A7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJILlPke; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxGDb369006
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZAtX2EVRHJ+6lsa4UnNLwpRz9laRCH4Ykn7Xi3B21M=; b=V8HCX4A790F3LZyc
	vv8eotDI86MX4qwja0XNjWuso8K7l4dOpyxTnpwoE5Zu3SoWAJgIroF9Ybo6XZYY
	hUtg5FHUflcJZXJP384Ih78WpbULzqPwTTVRG1i3EBO9H0pDUpTGUYfQzmI7m5R3
	g6ouZttO8WsCBRmXqxl4MQiA4Mg4J/4CCgKKLY0UB3+uJaJRHf8Whcv+hUn1EOss
	gF9EpJKSqLrMSt+xcHICqV+V61wNfuV0/hPIJBcn9ob1E+vq353MJgLysZzGrcII
	lu3F2DtOnD6YnZhr/+A1E7/9l2gn+S2X0FvIDIcyWhUClcuGvjcsRgYq2o4xbf37
	6VJ2SQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99b12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:38:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so7119661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345127; x=1783949927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZAtX2EVRHJ+6lsa4UnNLwpRz9laRCH4Ykn7Xi3B21M=;
        b=FJILlPke5Cerzvbslfw3f57xJgIKYmpMtTfRElSrghXyv/R6N5XtMe6j0JH4etXUYK
         8wJykOid1/c64hhFcPrDySuq3ViZN0sA2RtLMoZDcg9AbVT4phQT3IO5z0QeAnXGMgnA
         zXCcVnxKeZQQVJDWujTO6dTkwU9R/NLCStsRjbb/BUaT8mG0UMTwlMDRu+tcbpxtq5Ux
         /smGpEqYpm9g1mPE+BE0Zu/FBmpvKt1odV5/Mk2tU2FWFmsbXTPlBKlxyijLIJBr/Fhf
         Ch7/M40yZeH0nRBAKGMYIJ/ksThVttk0f16RVnOEwxE3LXrhraFUSEH5ypZPNOz+yYts
         w+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345127; x=1783949927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZAtX2EVRHJ+6lsa4UnNLwpRz9laRCH4Ykn7Xi3B21M=;
        b=H+zchSMt7C78aCqhUg7Lhd4eDuRogXeXtJvomrC4IsI9Wq3Y5KuMGZGGp9necJMFu4
         j8q5qSRbSrBxOl9+koGtQTRmd6B2ElM9TsrFkTFj033KcDUzOGZfhsDuc1an2DggWhlc
         Sp9Dny2zOC++7bURz8SCM/h7pzg3ZzbijcgyBN+VxQ3W6r+omQKW21gCpX0sAeuHGzX5
         ugeqLsuNM5DSBZeaPAqXKPDHeHvwdJYrNIbJT8tXJHDOZ50M9rfxD+JMvEPenWZEEzUP
         O5mbDTvO/DmUQqfiqWQxYbo9PPPUVLA8/GlFaq2D1BgtOB3CQsGvOXrvDdSMNyYAD4wC
         N5Mg==
X-Gm-Message-State: AOJu0YyAp7knxUPLD/Ye6Bo57F3jxmHiKirFAldZNN6hifSNH8LnP1eu
	Qy6f4YCanh4CKiUDjmqIB4u9PRiTpwYKE4di2l/GafZIEv7N5oQoSuelTJbEf3t4631JSdkv0aO
	8uqvJYnbo4jok7symi3d0JEbs1HYws9A8GWLkrsD4AjNOIscD/PuBVkhzUNMkUuRtx1Lv
X-Gm-Gg: AfdE7clQyPU0jSEN9V18WZ6KuoLAEAqF/no/TNpm9vgaoOlAYn9r32zIf8XmR1MFQ8m
	2NtMF9lcSQymRnDzRLkN3pmLxXLSpp+d0AhU3H2zNNb61duhHz/Y0oEl7meet0B939BLYK7Qqel
	FbaRHto6opTLRKvfwzIAXRS9LXEUyR/AReLKLTviyNh3vTZqtUDRmoyD+QhkDbprY4OIuOYBtgE
	wv8uxyPXE4i1MW3SjIJIfPnqDs9LmH4Yj/2g193G+/juYSIGX8f7Vpj3YBgjXUu/Opgmwhqfwlq
	aOZrn/n+EVY8ysGcMyxndo0SvHlA0XoNpxGg0IxKej70rODZdg+7erH3jMWl8zz+A1wHaAsQI7O
	MHXjHWbX5VTq9UslT4SBjDhWIdEKnzyUbhHs=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr93124101cf.8.1783345127076;
        Mon, 06 Jul 2026 06:38:47 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr93123841cf.8.1783345126554;
        Mon, 06 Jul 2026 06:38:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b5ae4959sm746544066b.0.2026.07.06.06.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:38:45 -0700 (PDT)
Message-ID: <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:38:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y-vC2_P2ddNCjPse4nShtHCFouD4PtUg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzOSBTYWx0ZWRfX+KJYJTDYGTt/
 ATVY8L9ZETrZZOfIXCVAkqBgnu4hmHE5IHDaJp6Qag+XH8JazIzU6YlEyvFvXJThIHkvoQh53y1
 Ek/DQxVMKuEVzVJF2J6ylxlzGDBXBJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzOSBTYWx0ZWRfX8KoFTBuVFdPW
 OZiAfmJgU//PlEGGBlEkKkJrGnyB+PQRuGXL/Q/Gh0W+nRfaAzc32bT/qwg2vg79XIjX10JoXR1
 AquuA1ehKSzKeR8Ogj87DDrLdvx4G3TstjritOgI8/k9GYQxK3zYeJorQoGHaBXQLyKiEYC3fz7
 uFLJ6i8otNbs8S1AlYk6k/9xlLVNslKWj/HvGN9rUm+fh2+FQwwFKpvXbH71nxVRDENlSN4VeSc
 lOpxa1qeNyCmWXWFc/FycHEgts1lYdbnBf3Uhg+iTdW/VeV5uxZTAx43Y+gE2ykqdRIokbwgcQU
 Xwto3adPm88dhaQBNSCn1vtStf/4nY9/euyABPErCc9nVQBA4FVkJCskk4q7pdjjd2McrvBMIZZ
 stWIiwJO5mTtS4WVYM4KpkSK41VO1MGpw0Gr5nqhWzWAHjgTErIQufK6UG26XohUGcqLp0Z9Moc
 rFI84KTZZoWwJdcziqg==
X-Proofpoint-GUID: Y-vC2_P2ddNCjPse4nShtHCFouD4PtUg
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bafe7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KqYH7--bGGNAKF--rM0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116863-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,igalia.com];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 428C27129ED

On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
>>> +&usb_1_dwc3 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>
>> Does super-speed not work (if you also remove the qcom,select... above)?
>>
>> Konrad
> 
> I can make a file transfer over scp, but the speed is inconsistent and
> slower than with high-speed. Must be because this device does not
> support USB 3.0 (super-speed).

I'm asking whether it enumerates as super-speed if you make the changes
I referred to and use a super-speed cable.

Some devices wouldn't, because not all manufacturers connect the
necessary TX/RX lines on the Type-C port.

Konrad

