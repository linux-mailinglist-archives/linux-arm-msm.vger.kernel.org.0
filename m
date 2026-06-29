Return-Path: <linux-arm-msm+bounces-115165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +FjJNjKDQmqB8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:37:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEF56DC226
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:37:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V78WYW6H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TcMuiCKG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EA4B300E934
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F15372670;
	Mon, 29 Jun 2026 14:24:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C13BCD13
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:24:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743060; cv=none; b=j4EjhaKXQ18pXgJw8U6LgpYVLo5mvYiolrrfn92emxXf0XeO2zp0UXNiB5p6RsqCcTQN66lR8ti4A0Iv9ohT8qhg1YsZfabLikzFXKqDfkrNooVtdDpsZEmgm/DgQ9lMArcr1HIIWm/5iA+WoAE+kw/vYNaksRvpiFsuLnt+Vw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743060; c=relaxed/simple;
	bh=QhjYhjgD+R4jitEU00MSdHpAb1AwqBK0hkMTcNKdHTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCwEo3K8nhKOizBR4E6b4xYye1dMq9zBa00RuRYOBHtxAoKqangQKEq/fFuGS1IQxVM8LquS82YY8arn2z4PY4m6slmnjNLn/L1sXp8g6kC2Nmdc+rsQVdmoUIqJ4kPwbjl3YdnfsWI70mVzbsYDsoWQag9t6Bc2jBPUqycC+FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V78WYW6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcMuiCKG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4rq2646950
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRK2ZjVCU6McW4zLkThd6mMc2zayM66nXbOTiq+zr/s=; b=V78WYW6HJuxwSnnO
	YlctayNajH7/IUHvr6SyeFkPGU8IAZFuHlusrOnBK3u7Yvf+J3zct/sVBKaj8jtE
	c9xb288TbtF4AQ9bmQrso71reXN/UOPp8CykDHX/+BQONHSlUEF9YNk5h/XA25Ul
	MokFbam6GmpX2nsD6l+5X1yPU8+kaIc5HGgepzsjiRnlDkOkuPyKxTqETA2XuJIS
	sv+8GlD8Bpl9Vx/cvLNqYOlT2yd4cgknNbxlnlQzPtc1wGfkga7K2GuIr+vaKVrg
	d/FNm9Jd5YmVb7+nmmpK2Grf7M96e8XSRTS+b63G4d2FwWdBcDdH6i9Bo+cY/hDF
	H16KXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tspxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a15cef334so2811331cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743057; x=1783347857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRK2ZjVCU6McW4zLkThd6mMc2zayM66nXbOTiq+zr/s=;
        b=TcMuiCKGwl3GHfna2HonLIysyqlge3r9txsLhx6tJaduxfsAgfgtEIsIAEWkDeXSEf
         IMRiBHDSL2whPxW52RXtEnprfWZ83qwHw21hXNtMqPh7vTRHy9D9QctIr68I0LAsZsHe
         61iXa5Yf1gZwJCD0xpwSdwy8p3xEaD8c4RtKqnyXqW5fbz6kBywpGO/wX/s5IRhe8nGg
         7Xrfs3rs/z44xAj/MyJkHBcQOXzqtDp60oi8n5JMMtu/Lh5VkSCVHXiyRvVlRjHFKP3x
         st8TEwMs3NgtPOJyqQQH7pjyp0pGymOsBymS/Dg26TAe5E0//sfhtQUTzU9nVu/qZo39
         X0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743057; x=1783347857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRK2ZjVCU6McW4zLkThd6mMc2zayM66nXbOTiq+zr/s=;
        b=MbzpGw/u5kGKA1M1jIV4RiJHoghJMiAvY4MfDYn6VF6w2ho/3fGRwbCFtNHiZRQcE9
         NaMSKgoo2cMrPMlPKO5+NZXyJvrSGodgBqW27n9mMNoGnN/aiKg2kJUCIpDL1nCoeTTF
         YJP4gYTkWmsxeWwTdUtSiHU3SDa0wub45ABx7Tsp9tkg2VsoVnS9LY+/xFxgOwmWOaGh
         yHOlx1XPweXivgq7U+SxUaKuKl8vDmVPTLSUYdB/8piFo1KBHH9nhqqK2fxaB2fuW5iG
         6GGTHMX86nRNe81RFzUNsnIM6dpvsls1llePGNMwsg3JvuRK/g49BWJWDJMmBPwdWVVF
         Z6CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GEbCA2GhOxRWQGRUzMe82HW9VZ3aRie9KT2izGsPo7UyLmjM0YTH7IxB6gcBXJWc6jF7bpMS6epFBi0U0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Vr/auzbzClALaxae2ECaq/+/FPqvLn+vXqYAJu5hDxsE7x/f
	400MHU6JkZKIC9BelItsliZazn5FuQnEq1mtKZQ2JxIg2qH9XUsIjSjS3fdksOMbfS010nV92zW
	4IIy66ciLkNBr/a3NooYwoDhuz5td7lVe4O+E2+xjrZ4MWjge9KdZXaDiKtGIKgGhthkg
X-Gm-Gg: AfdE7cl88as2wTy9/hA2WCaznzc2h/hG8RP11rzpgEaV2VsYitqvnOi/P+rOWUQyBp2
	cvmkHam7k0A0TIbKuKRbaWKPcvhYfzQ/lypL3I5p1Xvo08BVhpHZSkRKw0FK/kXaISrJQ2rxrBP
	/U6tJz5Xlzdz9qoidruGiYlvdH9AnUow39GhvZadTxPAaqpj/McUxDA/I7XoVeqSVZlKoQ9lEgb
	ERzLEIPySgQcKOiV+i+BQdMekFbtneSwMJNObPDZH2LxvS90Ck1xz9zM0GZcusMKtWIjkSU60Uf
	2OpHgmILPM/lNCb65Acw/qQLVDCAjDvuIlNZWE4DsPGlGsL72/smCic6Ev01/akpZ1VtsbyUHYV
	sKsI0x37Wu9L9RIdHRpD+jtoJ6Y0DiCFMuNE=
X-Received: by 2002:a05:622a:11c6:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c0d8fe47amr6120831cf.1.1782743057032;
        Mon, 29 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:11c6:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c0d8fe47amr6120491cf.1.1782743056584;
        Mon, 29 Jun 2026 07:24:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c127b7619afsm80746966b.4.2026.06.29.07.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:24:15 -0700 (PDT)
Message-ID: <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:24:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
To: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
 <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
 <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX9p1tmWt+zQHk
 FokGDLVhUZvv0KhIBI9pWKOZ+UnFUby7ON+euDi5gddQvmpn5ghHRLuaCRXXPyhGBK/uPADIcM+
 gp2pO4cmh3cQRVmsg7oC9TZ69FAnv/Lrj0k3dLSOowXWadia9LVeZ+o6UYJkZrh4pF28/cSgbQq
 D+zzcz0HnoLMGqwE2iNXimZ6rlvkEFLHQuFA7LjLBkqX/Qi8fApIu3SRnzZ8FO+xs4QNQchaS5o
 OUbmh/fu0eV7r1B7zfzBzMu4Cbu7efIZOZJnE+Gol9KJwWB5epgcYdFhe6qXkYeGA5p1zAgMvXA
 bE2pCBqVylvICN/7JMO9ZgmOru1ffsc0/nNRfL5ETuuPTdo+5QjVKBVFgGBuTTnGSEp0xVJE8b0
 PCx1WEHQ3n3XvKdrFtkO/oevOWWn1Re0icJGbhQUQMNNUh5RCawvHDlQ38BmO8s9TV7vGfktXr2
 HEy/eJeBXyolQ3tOlBQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a428012 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=lKQ-AihTAAAA:8 a=-XagbMCoMRO7K0bwpTQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX6axTmLKH73hV
 LG/68fQOwISJFpT2pEf5Py/Eepu8oM4/CU+E1PeUWHKv6zDr7ZC/M8nZ01K9hqirSMnHMmx+rHF
 +CXyny3lUWwaQcpzlcz0VTVgYSQUg5s=
X-Proofpoint-ORIG-GUID: Jbm74wGG07_JhZjtih4y-Em17gpXPWJH
X-Proofpoint-GUID: Jbm74wGG07_JhZjtih4y-Em17gpXPWJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:me@samcday.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AEF56DC226

On 6/20/26 1:15 AM, Sam Day wrote:
> Hello Konrad,
> 
> On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
>>> From: Sam Day <me@samcday.com>
>>>
>>> These regulators are marked regulator-boot-on, but that doesn't
>>> guarantee they'll stay alive as long as the simplefb does. Adding the
>>> explicit supplies ensures that booting with MDSS disabled doesn't
>>> switch the panel off 30 seconds after boot.
>>
>> Why would you boot without MDSS if you want the panel to function?
> 
> For my particular use-case [1] I'm trying to avoid taking over the display
> hardware entirely, and use simplefb until kexecing into the real kernel. In
> this case the user might halt in a pre-boot menu UI for a while.
> 
> I can also imagine this being similarly useful for "recovery kernel" use-cases
> where again, it may not be desirable to assume control of MDSS/MDP/DSI blocks.
> 
> [1]: https://github.com/samcday/pocketboot

Can you handle this by adding a panel = <&display_panel> property
under simplefb, pointing to the display panel defined in the same
file?

Konrad

