Return-Path: <linux-arm-msm+bounces-113532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMJyFAJzMmqW0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:12:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE869853D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:12:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VOjbLpui;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aRweQXOb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113532-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113532-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52DB0302DD5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4571D3DBD41;
	Wed, 17 Jun 2026 10:12:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A83DC4D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:12:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691130; cv=none; b=CfMjxg7rxANy3Pn9JnKbZCaMyccAVwFpgdg8CZE7Hz1Y/JofcppvSHF/1qTs34roTkMevxiEIPjyADznP2jZPFfPAC1SWngF3/hB+g1PUUI5KmmRdMZBRheZHUJ5dh9m410YIw2AAKZwu4vbFEbApZUOxEyz80h194UWJIsbBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691130; c=relaxed/simple;
	bh=IofKbrrqGGgguSMKcoRuaRky6ui8uyAcE3dtMmTC6bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBTMc5EKJep4jHKOJr2Cts4fLvHX9JC+9zD9uwBJkK2FbuI74NIfweum+dU0M7mq0Xy+mYzKWX8xI+tBBHCzbJIPfnnI7aGN7Gc5GuSfKDsPHlufwkuuumcrESc2F8MzBlIlm11G8dKfKeysbuvLsJkMwPUZJcAgVkcnKXuFFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOjbLpui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRweQXOb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8W0mi2056636
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx8sFvctcVsILHzUm7KFAzcrIbXLjkatPOBEx/N+528=; b=VOjbLpuitUJlclLl
	DpPI/t75ma52BQI3d0GkuGHzxGTKdxZ8Na2obN+P97jORWUKafa3ysze8YJz+Cic
	NaIFAWfMTcISVfcZpoS3NlN21Ko53KDNfC5Q77KI/8KeGsgaUJPUILRP4Rm9rmqe
	fMYrii1zfmTLFV0Sarh7Jk4EQ3puzjALNYYznzhUBz8qeobIGzlJ9318LI2ihSGl
	k5a43Y6ofrgYSBU3naTnpmpmkyVRDf6rObJr+Nhx7NAi/rmINNa16n1VsrIXMtiJ
	tjdkflnDOPyVVPHxo1K9hFs14HWoAovpu/nrVuuRw+JLhnHMxbYGQ1Km1z2FV/6k
	dIovbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesam08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:12:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9160006de85so144682785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691126; x=1782295926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lx8sFvctcVsILHzUm7KFAzcrIbXLjkatPOBEx/N+528=;
        b=aRweQXObx53MqGxxxrx6T+cOu9qyBdMMALi+07zNeVYioUFiO0UPAPbDHs1ZpGBBbV
         vpwdCjp6LBEWBHFhzqL2cJpeBR+2QE8XpgCRD3XIqOcTQ6eeBzi6clgZ5LZKUFDiqdbF
         VW5FCUqUpyoG9KoPosbk15sRM3ZpvOS2iij4BzEktYoJMa5x0WzTmy+8lgVE1QBTBAEC
         wIlY3LDUmj1rm5AJht9q5fXK6QO5i6O6D62etPieG4ZS2eUoX4tHthJ/RpeKYeyEsltb
         UpBw6Ws61HZnCk6q1LQdwyn17nswpRAGc536BdR3Xj0DArzyZ2Em3m8knAPyKkdrxuAF
         oMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691126; x=1782295926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx8sFvctcVsILHzUm7KFAzcrIbXLjkatPOBEx/N+528=;
        b=i5sftGrqy0mXaEVPqsYB+FHAwKVXawoqeRha18DBDVZ1BxMQ/CqET3R7QY1yMmhrUz
         VJWyyGK+UAP3YgqGl2VjnSGYLuW2mL4U+zKc+5gcqsIbvq0InnhK9bdGlA0eORFdjxbF
         yZQf1KlGSqMVxc32Vk8qNAjoL6DaFlFuo6RSDZknrnQ1bi5Ry1M3xhzTjiqQ7URQOabV
         CjtynrXWBlzWag/wjLZeDnhI1GTZav4RiclHTJuiFNVnAFboSQRKTuOZNDVHJrl1HFAP
         csIdB4GpMBElDTwP0eMC7T4S2WMImhkAS8YTkBFH97bbByxttHqk7T3kt8/pP5ed3qxQ
         0+SA==
X-Gm-Message-State: AOJu0YzW0nWmkwed1SEedQh3dHKJPbgrLFJBXJQWwcu3IqCwhmXlxpKe
	woVwoa7iA+PavIvXdGgpNNwOaq0LdiCOsEaSHojrdqG8oum0CwsOlVwgBqv3JdD2xfkL67SpbVs
	qX5cAsxvfAtCOB7xr0Ps6sh1XZhTMtrEe8k2/S30UP552XHc9Iy3RqPob3TdajQEOyLNyWdC/Gu
	x1
X-Gm-Gg: Acq92OGnIcePAJkdQh6BGEvBg4aNMJmcjjeUNwwhPpW4GishekodwgC1Qh48kqfMZCj
	YcGdcqG2Ko0hT1vfYzr7Dkjjg/vfPeIg19lungkEKiht9sXzFjeI0X0lz9KnjNlFoFfdDDYdn0h
	2WLCqalD0U6fNgTAX0dAPFYEmnVkW3ZprQTHqmEc1jnGkVTnDkjKLkyk5+BPNqyBO4mr3q5rMYt
	LH1fKk38KDFzqJ2vuxW5dpRJuXxKfHSUOkkhS67Gd1XiGIGRECtlXoAYiC6J5VqJeUeND/2rGsI
	l78BXndrYehXnAkSDqLTpRLzOtdcmMPNCiR2oUukiMOmkNyLD5CkVO9hJC1gWWjcyivJYQ/J+4b
	K3mZXIt8d94+eDVSGEOOV5f8pKY12N8AFj1A=
X-Received: by 2002:a05:620a:44c4:b0:915:7a64:cb68 with SMTP id af79cd13be357-91d8885c02fmr344513385a.2.1781691121700;
        Wed, 17 Jun 2026 03:12:01 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:915:7a64:cb68 with SMTP id af79cd13be357-91d8885c02fmr344509285a.2.1781691121203;
        Wed, 17 Jun 2026 03:12:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954fb225f4sm749227a12.29.2026.06.17.03.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:12:00 -0700 (PDT)
Message-ID: <fdf9782a-d5e1-426b-89cf-813318e9a1ba@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:11:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260608143329.252033-1-zstaseg@gmail.com>
 <20260608143329.252033-3-zstaseg@gmail.com>
 <8b8fe93b-3df4-4dd4-acd6-3e87401071f9@oss.qualcomm.com>
 <3bc5c1f5-8994-48b7-a376-39afc7e429e4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3bc5c1f5-8994-48b7-a376-39afc7e429e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NSBTYWx0ZWRfX7zDTju0buGk7
 g1qh86bpJzZHuL+6Ij3dG6h1FqzzAazdzTw2KTLH2v6Hkxsm630CQ64EGOclu5hOmE3r1x79m9l
 5u5f0IIJHLdGyrmWK6UCKOkfJ/DSEGM=
X-Proofpoint-ORIG-GUID: 3fPPF0kUNwYxv09RfiwnYvERg5jV72oH
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a3272f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Hr9uyJ6E012qHgJgGN4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3fPPF0kUNwYxv09RfiwnYvERg5jV72oH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NSBTYWx0ZWRfX19v2259Y1OJI
 uG6RTKxds0UMS6TZAYfpgDXTkhqkHADNs8JAa21WNlzBWLrS9EX6uqCUEec98zsELu4c+e86Q5H
 4n82bIU+ezRmc3MeQGneI/UzIHmuUzxCJg30nLc1JnFN1d6mthwDvWUuN3cquJdb05m9gamJsIf
 yICzTxN7ZkJeCLzs5LeyTZnwPnJ4mnnNrr2sG+f+G6L4WOS0sRnP1wRQiz8nk6gdvJBnsLW/20h
 hPw5ULpjAi0sJ8OmDEwhN4XRKrYFQidH7nmvI2m8gFwi8IVBRMxL6cjpkAkYxWou4SnrJdnDJSj
 8D8Qs16PNRkEnTK3xpW2+451+ajpDmghr7RKp3fXULSnO8x8qJCW5aGzyJu8TVpV3+FYDa5jGyl
 N/dyb2WzHCmV8Y9JK6b0RnjFAyDWt9Gwxt9iVNZOpK7G95H25C6XqI2XU6XVzhNxYXuMiRUAkNe
 w+ZkzyrP+Tgg1UYykhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113532-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zstaseg@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29AE869853D

On 6/17/26 9:55 AM, Stanislav Zaikin wrote:
> On 6/16/26 12:01 PM, Konrad Dybcio wrote:
>> On 6/8/26 4:33 PM, Stanislav Zaikin wrote:
>>> Xiaomi 12 Lite 5G is a handset released in 2022
>>>
>>> This commit has the following features working:
>>> - Display (with simple fb)
>>> - Touchscreen
>>> - UFS
>>> - Power and volume buttons
>>> - Pinctrl
>>> - RPM Regulators
>>> - Remoteprocs - wifi, bluetooth
>>> - USB (Device Mode)
>>>
>>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&ipa {
>>> +    firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
>>> +
>>> +    status = "okay";
>>> +};
>>
>>  From make dtbs_check:
>>
>> qcom/sm7325-xiaomi-taoyao.dtb: ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property
>>
>> Please fix that (or disable IPA)
>>
>> Otherwise:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> Thank you for the review.
> 
> This patch depends on [0]. With [0] patch applied, dtbs_check passes w/o warnings.
> 
> [0] https://lore.kernel.org/all/20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com/

Ah, I see, thank you

Konrad

