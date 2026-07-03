Return-Path: <linux-arm-msm+bounces-116282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PKdIE9qTR2oJbgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:50:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C25B77016E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:50:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eRvXERMv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OOZ00OBl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116282-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116282-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA5373051010
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2093D3C9ED9;
	Fri,  3 Jul 2026 10:38:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4693C818D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:38:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075133; cv=none; b=cRcwPnsgyQFa/3l45WITIQcGhBZsrISAI57WPL9u49iiVXxD5JgqQ69K8ZQ3vQnsi3RkGRg9Kl1r3n/Kw1A2E0hRTGI8A/D1LE6lvTVgF3jHVh1+ofzQ96R2BtFTj+NT6g5MW3/OMu9JywV//Rffrcm1IX/KVbfJLxksnaqktWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075133; c=relaxed/simple;
	bh=TLZfpXNa4jTlpCICpFrGEXH2rtYeXj7nHX5GHDbou8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8gTlf89rAUCFihMg833xrrq6z0ip8SU6n8oPNh7M9tJWF8FUh17wTl5bSzTln6Gr0XpuEZFPYihY7vHPHzBPqtB+yaqYQmyNGOGdK/qtUUb7zzVPteyVnPjk5jl4u0a3MspHHI/yKLixKGiadJOJmgrT1yBH4FqOIRH26JPR6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRvXERMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOZ00OBl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635roNk3108984
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3RaEfFYDUv0hytKdheuNDDTJLMkZO6ds3f7R+dKZTQ=; b=eRvXERMvJqO0khyF
	nE45Jp5cvL8zvZtV71e5sx2xQn9KD7LdVoOD8hU+jjZRdfArthDN/z2DMUDOQ7AB
	dQwRPb2637T/vXZhg9ACdZn0S2AWnOe4Ip2hdTsduVyxCJHGA5SRoYCma+pU2rFf
	/i3Z5/iIkStFR4QiU96wDkqaX3QH+ssHPACrsXeLg2ZwAYwBuhtbrZ4O3uYH9dM9
	ScbqyI8mEGA8FFc0Ckp8GuNBS0QZOYyReOrQz/Yzr+XEpDSDTLD7xhGRCoGhB45k
	Irp9u+gGWoG8i8wdcGtwuiSrqnxxlKsZAlPhAJi6ZfeVJcM1rjSgENMf4xNSDjFD
	byCAGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyak1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:38:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so991611cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783075129; x=1783679929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3RaEfFYDUv0hytKdheuNDDTJLMkZO6ds3f7R+dKZTQ=;
        b=OOZ00OBl15fsaLUrkLQ/i6e1Gl3OW4gLCoFapxrzbwlE8n6JeEtUYJQfiRby8y+7G8
         79mF1v27MKLOlcietanv5AO0LKrM3zW7LuAqdOJ1+rH0BaIWzXvWEjxanQHYlDiVQwae
         Z61BQbb/M9O6D6Ss1EI3vmAy/LC8SuqVUhRQAa11SRnf1nCPasfb4e3hk6tWl7ZbHrYA
         iuCgTVR9Xy3f8onoCrCV+ONRIRdrjI6xTHOwPQ9oZZLgmlzMZrn3vwDfVMBj0bRrP84R
         8MnR+Ks6GHijLM6Srgo1pqEKi50BoGvhV+PZ/ErA78HSK/6AH0bMQQHRJ3cOSUT809Sq
         C49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075129; x=1783679929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3RaEfFYDUv0hytKdheuNDDTJLMkZO6ds3f7R+dKZTQ=;
        b=HhS8ANF2T7hN1OStv8UOgxRbzBlLwwB0c4vOk7tM81YV8J66+/MrcIO55UTmwZUX2J
         5nXoi1vrq1crpUtpVxvxu7cThj34GebtpWbJ9y5uTDNMVLGmgk5AbDQYk5+Et3vZ6fKq
         uG41+UPTqt8XkyFiZvzBcsAMs9TuTkJXvxcFpmG0RCMW3ijCwyfedp1Om6MO44K4mr6l
         EYWCN5OmAn0SqL++n8daVOqrnSG7y1O8A8VS+dG61KReQyFu5JNLgXiXRI4EUJxV1L8R
         RtYu2hYNMlJrqE0qcPLpCgCf5V2wNdi969K1NyCMVuTpqRuLl0BRZzS2bf9+IE9zvqP0
         aNaQ==
X-Gm-Message-State: AOJu0Yyax2aDEzOQvfHnQLoySf1Ojh6Om8VkoHn+uWmDeslMpQriJ1aI
	2sEXuidlsjWLEJzmHU3uXrVkV1iMv4MRUC5YRJF+uGEUmXaZ8N1NdjhoK8q7nN9A4g44HEvUm8q
	glR7xRJUAV19eXQ/CTwNyljLJOID4fgYvn0K032ef+ng8bw9IM3YxAtYO7yOY+JZ8BmTE
X-Gm-Gg: AfdE7cmNSO6xrTUcpElQAOq9Gt7C0bbRx0TjaqTq/IkgXcSCwghYP+4MfhWhlGF8wpx
	ojIwv+pbVvV5BiY01WztWSgD5BEW0KkMHj+NNyZQ/pVMFrOGxt1sUoWubfXtkO4JqpxNxkEjwNi
	R5QbELsJiHrlJ9iiHsZYO9RIAIZukK5O7/E67/rlh5GwVoIyk5zQpzsdhDogrtUrIcfhQ401+27
	9vr7slltIDZYoqTHAbPNsOS5xhzZ8vkwL7tpPvBC/FT5peypqE+CnP7eclY9//KoJ7nGURfdYyb
	UcOnfhNp2iH+50tJf3p2iI05dTTpdvn5iaRCCfr/Q+tw/tr27X/sHIBhlo/kAZFJdp/HuKtDxaq
	8DDxwfUKm/su9DFvoLkAVyQ+Ey1NIrEE4uUU=
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr98177281cf.1.1783075129089;
        Fri, 03 Jul 2026 03:38:49 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr98177071cf.1.1783075128715;
        Fri, 03 Jul 2026 03:38:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091b60sm261765966b.14.2026.07.03.03.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:38:47 -0700 (PDT)
Message-ID: <bfd5b522-da85-499e-a36e-b303bde791ef@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMyBTYWx0ZWRfX0VfuBtaZR0MA
 NRKHl+p4zaBwuc0gHK4SbzyjMKtOKyK9DLrKyz+SQ5h5pvf55PVOHriXdErLAwArSxE+LdfTej4
 0coPc2l3cF+YlPW40LANLook8Y31HNoN0icLDJFf75vdDZfJUh9pgYffrhrwRU2cWJw2t1y/lk1
 1d8RRriGcndPNs5L5S8G1/hQ7elTuRx3TpDRreh0XM9B0evrwAnrjVZv2zsc3s0a5EhJVDhApd3
 Uwj9O15txYvS4aP29PL8S9MrqsC2y8UwgQhgjAVrvgVVrVfJsUVcB7O3yrhCWuYYWojRjSNCu6K
 lrIrorDIajpWO5Nt1T1I8mddfo211beAMNmQmtUuH1TYJ1XZ3yqDiZn8P40mxvsliKq0ejlsp2g
 dK1mzAbYpcEfMBce3cJAzUz8b0UrIj0TWCuXfdYBUj3xxat5UZLQoC7g/WkVBYpW06GLJ/owRYt
 ymlbKGwV8U5EukMwbvQ==
X-Proofpoint-GUID: KOt319SXo2Un8pB9cNxwUFQTiNU1BRAf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMyBTYWx0ZWRfX6ZslynpK8pCg
 X4zWXN39ifhRfiZeziClpf5etbiGQdYdJ9cvFcn73xaUwkMkyvzti/m1oM1rKe8hVrQHPxpVWml
 74IcIc+LYb6/pmFj4dbff0L6uOrO8Og=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a479139 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=t82OjkPGvLD1vuDj7LAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KOt319SXo2Un8pB9cNxwUFQTiNU1BRAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116282-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,outlook.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: C25B77016E4

On 7/3/26 7:01 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add nodes for the reserved memory carveout and Bluetooth.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

>  		apcs_glb: mailbox@b111000 {
>  			compatible = "qcom,ipq5018-apcs-apps-global",
> -				     "qcom,ipq6018-apcs-apps-global";
> +				     "qcom,ipq6018-apcs-apps-global",
> +				     "syscon";

You'd have to alter dt-bindings for this to be allowed. But I
don't think it is. The functions to grab a regmap from an OF
node create one on the fly

Konrad

