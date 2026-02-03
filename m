Return-Path: <linux-arm-msm+bounces-91625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOsbBuy4gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:59:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 23565D67EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EC66300469F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19E3395DB1;
	Tue,  3 Feb 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i40bU932";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ayrn5XuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB1395D85
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109159; cv=none; b=XaxfpoKYlibF4XYYuzLslt5/vQV7mvUECS5YAdW7y4Cly4ma4Iu6wzZt764J1YQ6wyr7uTmgHuhm2PwYls/OeCv6t0qR8X5ND6OST4UuQyjcVM3ZdxU/YPfUmZNxCKkaqGkSqFqa7vVjR0VsRGmI1M3eS/J/coIXKGQJ/Scz03U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109159; c=relaxed/simple;
	bh=HlKQuIAuxHl7M3OesECHQBCxcGtp96lDCpnMxQhji20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7+vUD+SxG4gD7p34AgnLomoqqO/TcPb+hGZgtXd4eLl8E1gRIpHo0bQbEHTSEjxDMvbV6cfbQpzwxrkQmxy877/wegXCCKJzF/535mWdjvV4yvt+Yl8Z+hgvu73sbQFtddIBz8bSg4vmZMUVfIjNqdWWmyNHrM1tuoOBpmtNBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i40bU932; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ayrn5XuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136fC9d278229
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEb3DbYYt1AMRT++isVvLSmbnhCgv7KrPbG80iMLXFo=; b=i40bU932lmAAFwdf
	Rn3y3DSzEyGVyxbvFwtbQBogUxZBeetobH+S9q1nw9tqKQ+f+JLHipKdkWGbK+YY
	sFkOOCLFlRkvnWLqxgBc7eU1DrFuOANdFDzYUhzcMPWyuqKkOwUyID+Uf04oke7q
	gNndGuDiz6lZBSo5rXgTrlmAxzzUxXGlSP3/dMU0UXEQSrMM2izBxuoGoHJQsXBa
	ayVAfodua7uDfV03eYmNaqEV71so34GdW9hnP/x9W1Zie7ubFdORWQwoneEXd41n
	EnGGF6HD23kaWhUYHaUakLhleWHJrGNfjsM9adzbj95RBoz27r4koDJUUb/uqD2T
	Fuu6rQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s39y97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:59:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a262380deso14525696d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109157; x=1770713957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DEb3DbYYt1AMRT++isVvLSmbnhCgv7KrPbG80iMLXFo=;
        b=Ayrn5XuS9pYX/Y7a7qQGIBvIGHbBnA/HzRAX/SbCY15sk2hvroOZuBA24aF/ulyJHp
         zsU9FxI0dMKME+3hpcQ/JVhTyLNJUqqRtP7yqTlL7vu7gQlw2Bja1dKj1VhUeY7zFvTR
         GLgps1uNfP3yUeDcKdywu9GludADbFhGdppBuG14peGvthGHy2G5YEN7xtixq16DNcqy
         ygWH4zfk5mRtwKhnv7QM64s8lGTVaf6OWlB6cYk7tnaJHJP4iZ551N8xj3C35goMrKeK
         d6PqENsTpf0Z2vxxMKJRTHUSAT9pvjzLDmjvYChvWQvoboudywEVeZ2ERFlBbNtCNtam
         xgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109157; x=1770713957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEb3DbYYt1AMRT++isVvLSmbnhCgv7KrPbG80iMLXFo=;
        b=ALtJYiFoEpR0N88P+rHAlB7c8KykbL1JFOmGrC9Bejmx8BxbDv0fVhtQXA0BNT78Ii
         tDgO+f/r383ZFF+uF9OUXOu5XzvLbnlRUHUJcPag8giB3jdlY0tWbrE3ihkNTmXuSmBc
         JeMHe4drzqIwY2XvtAkXH/0ZcSeBiHMfPpgsnNqgwdTfroWNe7IzrWtf6Bw0iVP7+z1d
         dKgE0Bnk0341fM085s5n1uEUT0isEwP2BsUO4rjzQeLrR9GHqKv4Fn6GTQAd09/KR78p
         WbArm/T+w+zIC/HknV13DuDTuvRc0ik+D/qMUbrJgkOttJVrDTFU+CgA7MfMp9YzeiVP
         q92Q==
X-Gm-Message-State: AOJu0YwKFnSigXIwyZfrJ71QPXR0lSgp7zkxFvbut/eTfseEFTvn7IPX
	iYOVo/SR1PReKCZr/3fhXMl5ftQPtbHTC0nBSLGFhqOcwJ5jWcL2HwX7BaLP7OCsfni/ggCqZR4
	cGSqwsW5rsb4qiQluVr+dE33Y/QslaFQ5CxJiF9WA0YiVZIuYaMuDJAbHMUa+ePNgeJpt
X-Gm-Gg: AZuq6aK58K3GguSPMN+hLzlgvkmfhvBZGzvwi6sq7SKONQwxtW0RGwlCFipKxRo0gag
	da5ayzHq7v5f8l/xov97lvJluY1rGwIlR16MNk+mK0QNexPClkI6LKX8loHm1TpWHhdQLkdJlSB
	6ohDFkFfEeMrRCZJ3djYhVw9wq3r1N8q3aIDoLfCNKSBd88Cxe95mHcnL3uKw5ZUSqnVKYFfQng
	B5q7LoE4PRY+I5f548eAI8g/h9rOy79TI4eF3pct3kol+Mxf9mrTmFW5jZ4KnfovWjnRiO1EXXS
	0xo+QaHoE62X3GBULAk1AwKffvUuilUlNkK/ExUxrbr63cPT42QFRFA+JCENaPbA3QQQ1PQQcTA
	l6iv+mypzDx/pJY1zACQTtyy+v+7KFCSKv3UmwhV0FQoMULeuV3Bzy5D0Kh+DLcmVwxE=
X-Received: by 2002:a05:6214:4f01:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894ea0fbddamr135578206d6.6.1770109156867;
        Tue, 03 Feb 2026 00:59:16 -0800 (PST)
X-Received: by 2002:a05:6214:4f01:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894ea0fbddamr135578016d6.6.1770109156421;
        Tue, 03 Feb 2026 00:59:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e99bsm8778631a12.29.2026.02.03.00.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:59:15 -0800 (PST)
Message-ID: <0dc6c4d0-c97f-4fa4-aa17-efb85a0bebbb@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:59:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Fix UART10 pinconf
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_vdadhani@quicinc.com, quic_msavaliy@quicinc.com
References: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981b8e5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: WKjZPVpKCgo1STvL0Efkuwrx15DWHjnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfX3vcKUm1qndlC
 DWyqctqDzAuayPwPC1gsJ5aZLx/lNo2JhdNmsFCxj0IFetcxZYo5FjHRvVZ8fB5HlaUHMe5ndTe
 WjH4c6g/+eNsoiS1IVdzjUgGs+sT2zAv87s+wm3Lf5lLlhnNDRZUjezFCaV4G2QglZgc1u9Get1
 N0PghvHJ4OLYy4nldkEv7T8WSl/fp6lqdemuNTyRWEhU/g/jPAMB2x4gsptQyTw1zK1ZEegoJRp
 BcArHqB1LKR5rcrCYLJElfP9tgYM+m16HG9qd6aG0zEtZNm5ToxaRQ1XceOIUIZEbItI7124Dad
 vQqJwVmpyJ7MUYggarLcnohvJLxSX8eztQMtruSTCq2u+lqTjvRM4wA6N+BPYC06lYwPaoG/Rpb
 /yzG3H0dJ/vYMtkCrqAw7DIGEljT7wD5fxtQq0URVojrEA3g+1XwOu9lZJau8UJb60ah0FSoT5N
 P4Dr/cBFNYUY/0602gQ==
X-Proofpoint-GUID: WKjZPVpKCgo1STvL0Efkuwrx15DWHjnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91625-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23565D67EE
X-Rspamd-Action: no action

On 2/2/26 4:56 PM, Loic Poulain wrote:
> UART10 RTS and TX pins were incorrectly mapped to gpio84 and gpio85.
> Correct them to gpio85 (RTS) and gpio86 (TX) to match the hardware
> I/O mapping.
> 
> Fixes: 467284a3097f ("arm64: dts: qcom: qcs8300: Add QUPv3 configuration")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

