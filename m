Return-Path: <linux-arm-msm+bounces-113403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4CqsCII/MWo/fQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6468F3DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:20:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="khvTqkE/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aTaUEKEK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113403-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113403-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5CD53111CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11265344DA4;
	Tue, 16 Jun 2026 12:19:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8BC35C1BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:19:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612370; cv=none; b=Q7w0r82EOULFTnO5zzj5Gp/4rwj+Xbp88c9C+VSGMNxuPsvBz/ZZxHC2fNS9LA3z0BozGWYQIi1lmeuBd6/xMM2D86AA/0klKDta/U9wQz/bRPmoVc+JAXD2SBVEXQ9h1tUEJPnjh7K/7b2p5Snz6+HBOPZWC5c9IK+5HDkIL9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612370; c=relaxed/simple;
	bh=XYaA+UWCbB0K6C+NNWFgXK8Fg1SV26FFn2i+1bmxouE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9ZHOD8+qESyS/t/z15FvgmzWGpvSCzEgb3+p9TFDSZ7r1rFUcDFE5DMpUfpd3Vm0YAe1F48xB8fpFR+66w2uwKGt0q2Hj60Ht8Zrl2hzXrXIm3B2JfpQGn8KihyMiDATSLr1P2KuYqQT64ECNq0c0EJl6FN4+1Bwhj/8LX6IBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khvTqkE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTaUEKEK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9iYd2799409
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65fAjQGthFAZQ79zujXvX12R3jKdepcD5FehXN+FWBM=; b=khvTqkE/QCt/mpqk
	ePUpkE9pYyKhtgeH1w6uH9a7x0VFvABfwn/BU4NiF5eUWyuw+OUkvpi9Edp3YI8y
	BTlUoLHhPgS6ikZ2yQNOA9Bnfk4Oi65HfcPN0HettCis/GXvU+qxOV4lE+Fe9kOy
	zfxllhuOXfY209kRu+wIGsBVr25a+tHgK4WKGZdjOg8KPAL730dkHfqjGivMN8Js
	LLt9ljlSn0wgqDn94AO8btO23cmOUFeh59p2Phx6PXp9nQW1ypuK8Oq9S0bjW/hz
	7rfqB9WbFTxyhpZ4DPRWFPEla0InaAEsTvFLh1kMdazoZZaUXZmbIUkqk8u9U49R
	G26TlA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7sqv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:19:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966d2895042so2058241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781612366; x=1782217166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65fAjQGthFAZQ79zujXvX12R3jKdepcD5FehXN+FWBM=;
        b=aTaUEKEKCP8A6g2vk60zCefgBYhNxs1fNoYDIij/QxG+XO7O0EcClZTs6e2sRWVq1a
         7TuSuTQDlfNifWD40AZyMHixa/c8f7nkqmTZrUOIvhhMcMf7BWxY2aAXVZIiN4KE9Uxr
         J+TPUG1E2mdIWa5iSr3hztFIUCetl8NXO6JZW5CHJZPx+gWkiKG5obv8LtJNJixDDqga
         hxQAm324zsIIvdDt6WEPkxH4WTu3dOLzZmp8JG14yRqFvvMNTGIWutsJ8HRqLtUFzf3O
         T5YYiOC75pafFyQ00PamaOIisuS/XIxjXoGv2b8b4WTj6k/ypSxUsTmKEj65klXNPTlN
         dosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612366; x=1782217166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65fAjQGthFAZQ79zujXvX12R3jKdepcD5FehXN+FWBM=;
        b=L9pFYCLd4jzQczDBflNlCLc0RrkUrUHdBDLGqL4hrZ27cEKEKpvx08iBjm6sFBd7sP
         OtGF2NCUrzRN3dK0eD2zbUbmMswxPa8h/OplXFo1gMGaOkgauohw2LvcjBkarhp9l+GD
         4DQxtsLGbVrV653ikl7Vh3VlqmsmDvO2Gr1QM0AGrQ9odYGWe9GNA+E90Cg/HoZCHZYR
         4Xj+YgxXXgdQVsQCL8fsJxtAlizTpMyKSyOJHFzPKumZef9qb2W2D43d2RgCnKGJ8FgX
         SQiKouTUQscC5Axp1nxYZI4QcW0VthG7YzwSjCRa5+5ypDe47bwO4LrvfXXWefU+RMRA
         EX5Q==
X-Gm-Message-State: AOJu0YzoG9FN0ciu3FW3zifp9Ylz8+Sf6lCLvSuEJO0ttNTNbNLagc/4
	unh5ontZbFYb7V3ZqKR//d9Qn0nt0g3779ouhs2DhZVvAXjCva9WsRMVU8evvlSRBzJ3OiWj+8j
	ojSrjcCXZGsK1xwPVctptXhRDrGwjffVRzOieYnRlEF1GW2DsJ//0P/GkJZxKOibzzaM1
X-Gm-Gg: Acq92OFccbw4o16eK1ZVJ1HF1lfUR3yT4/EG077fJDXK5TnrrKhqwV04BfF76DE13lf
	yXPKj1pkw9lYe6T6J1LUQGBk7H0z9zHEhzdzNv8U476Ol38lF9iVjrzHbua6Q/kMb5dUIYH+h9x
	k2yshdF7X+5/LMKY7MUW5Kta0MbUZMwm3EsKUzhQX9SpDuxS9SOE867/Ar81J5UIBCIkzqKRugM
	j6OOZt3x0oP4Ds+m4+BOVFC3yvxwjtLlsHCrkbi2dttCSMqrY+JdvvxL0kdcVdpOOS+itZ3C5R7
	CZU2txY888mHknxalRRTqfSCx3PJU73TqzgFAe6ei/HoKMi6nQc8Gmc1axqGKD5VRL4W9xy5108
	R1Z3eBFqzXQ1FKSiW1vu5Fr+dMxMGCQ8ERWJzjqG0VaLXOw==
X-Received: by 2002:a05:6102:d89:b0:633:7c8:37aa with SMTP id ada2fe7eead31-71e88b9fe73mr2995458137.2.1781612366245;
        Tue, 16 Jun 2026 05:19:26 -0700 (PDT)
X-Received: by 2002:a05:6102:d89:b0:633:7c8:37aa with SMTP id ada2fe7eead31-71e88b9fe73mr2995449137.2.1781612365746;
        Tue, 16 Jun 2026 05:19:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4423439sm640349366b.2.2026.06.16.05.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:19:25 -0700 (PDT)
Message-ID: <026fec8f-1375-4d12-ba7b-63fb2849a4c1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:19:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Qualcomm Maili ADSP and CDSP
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfX/X8iHJ2C6ZMq
 ZsQLspD0Gd3WqrLTrc1M2Xde7UH8SNFIJ1DdMub8GL4IEY/LTiiRBTNpRkJJXrSt4W0odiLl+1z
 c/6nYooAL/4BU9kU0FWSAqri3QXCasDwz/tPbbuNgkZ4U7C6iD14H9Vrzl67OFEB9oCaF4+FWOa
 XQtTUeL16WGmYyUhkLLsSwFrRJrNs+euBp9mj0qXIbdenMpDylMeCIo2BbwlOsGXUqNHv6f3r/q
 3X7JQEfgJgaMpWqX1aEZmUMhY8pO0jw9FTiQCPUVGZfMOGKfQqUmX/v6agdqGNjhTvu0yxsGqxa
 rVCHmYEwtymCjUAsrqsrQFPZY/kY4RmyXwSeYEZfq2pAjZKEXBilnkZ9xM/7C1F6/B7FfmgA6o7
 7W2L2yWzLQkY/OYnJpPXETzG4TXWbU+JMDII89CPzsvikN/T6Fq4MvZLmekpuH66Abm/swzhVuI
 jSuGHzv8nVZSUCNyvAA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a313f4f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9ovQy1WoeHIykmxQn8UA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: s66b5mVzowjk2-13HMvwHdIvR8Ozvlkn
X-Proofpoint-GUID: s66b5mVzowjk2-13HMvwHdIvR8Ozvlkn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfX7seRn4NKzlI/
 GqRE+k/uVY/dM8pyyvNcEGaxeCPmXs1f1mssd9E1uNU5mJbq13ncg/PyzZ7m6CUlPJn0bGLCIad
 geLlulCECB8A8ceP1gr3Ew5QmzoJqI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160125
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113403-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:yijie.yang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFC6468F3DC

On 6/15/26 10:30 AM, Yijie Yang wrote:
> Document compatible strings for the ADSP and CDSP Peripheral Authentication
> Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
> SM8550 PAS and can fallback to SM8550 except for one additional interrupt
> ("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
> not managed by the kernel.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

