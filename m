Return-Path: <linux-arm-msm+bounces-116244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kx7KGBJ9R2p4ZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:12:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B687007FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:12:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hMm8lBFk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XKlUoR9H;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116244-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116244-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39E8D3033014
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DBA384CC1;
	Fri,  3 Jul 2026 08:57:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F513839AE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069064; cv=none; b=fk1duBtmCPOvd5HraO9hWdVO7VhQj0Ly+rdm2NkjLCx7MM+AQE4OtsaC32FWsPWag45V9d8a/yoxsJhq4Zrhs6IYhOzf9PjLfgP2qPtIkJeQm4FWjdX2B3CLPxmZiFOZAh5OOHieI2XgekiaCuQuAAwzBfC009Yxh/pMZSdBcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069064; c=relaxed/simple;
	bh=dWBB8QHWzV0smXiNLQwKYnR7PGnvKRc6FyXeEmLh38c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8xf2nzVOjuE7sc2SSc0SyTs262QPyzeIeSInEELnch/8jXOqGsK8GLSQdTOEZsJIT4QTiTD6w5JSF8dnNXNh/yktCloKPkSbZh4eMcA/tnN6ozr72lb6qG9nbdzQ/nv7BDcR0rJLDbXyY2EN+1Y8T8Hs/kYd3pJelbQPRy+FY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMm8lBFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKlUoR9H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rhtD3147314
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUd+sBdE6ArmNncIlX7wMKayRRbzXx25rT/FYuJHI1I=; b=hMm8lBFk66PCdT6U
	BVKqFqO6el8z19lQ8Zdg5dx/X4axaBsp86f82xddAzMDKpJL7fOVkOiJIfFcpiuJ
	MpRP67hQCaUIUoHzDQAP9PlBYyro0Wyh4FWdA4DsMMFOgTkg7hs4ggYK/7ri3l/E
	Sk5GF3frlNrDxHsgn4+90wh+pfW5wNq3nNpDMg5eaXhVsRF6BCuhPDVCZdo+zzqS
	cQaBYzT+m171mxV16DM3j+xCV/oKf8vu2N64XXByjakGiwq+H59U5oYQZNq7LKLf
	qFNHcd/sX129k0uuxS5LJXfbPt92Y2D8W6pWB1ncrR44EoZoHhVdlRsyDJQAKBvj
	bWGvTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwwcdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:57:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf9df2eabso666051cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069061; x=1783673861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUd+sBdE6ArmNncIlX7wMKayRRbzXx25rT/FYuJHI1I=;
        b=XKlUoR9HPz6BeM1AJIqSuiVDeADP5lGYVUDd0poSMzk5VCDnKiMtXmax22kfit+LdT
         c3U8hX+AewGkvE2j3zX4swIrxlHGt0B3azsFd3HbQ5gUTJWlNQ3LSD+WoWkcCGYhkWEv
         D8bh88cj8QtZOwnCJn2OQcK1z5ULU6krrI6gvYV/c9gbie5vYORqEMNOy15bxxnFsFDq
         khUe855ITZa6+/lCHCxOaXyLhPFdLlNSfOZNLgSdq4eX4OTL1JyX3lB+7Ox8c1Okuygu
         t07TR1jlzV7iZs2qDm8QJGBG/x0BwE/7hW7Z+tro38vs6FAKGQKpfUnpzrwc0JDXgpwt
         8BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069061; x=1783673861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUd+sBdE6ArmNncIlX7wMKayRRbzXx25rT/FYuJHI1I=;
        b=Ets8RFuiqbq6XZhPqKMRFMbouOqmH/xr4TRZ+8o8QF2Nd4/akUtJJrZgpOlSzPUbeJ
         9JA+cCYQOWCAH9VUTeA1XMbjAY/9RoGf0ZvnF53DJshjqLhoocGxHXERnPF6jUtCRrLX
         sOX99p1nasR90GcR0YxDejOER8aRymtLJTKezkJINhGqUMnujcVjgtk3VN+CgNEP9tiy
         lvh+2+QqBkGsrkwhmwXXOu87xkZwgJXnz5NukorARXe5iHz96lPDrKN3jkJopmD7Xm0C
         CTL5ggumcgXAbJk7ZhRD9Secaov998th6RgIWsYn4Sx5+ppPNrUNSlWoIxliJd5tmnZD
         J03Q==
X-Forwarded-Encrypted: i=1; AFNElJ8DIugDF1/0KaGwGvKXCxNefWiBi1pVBIY1WtANupL3YNk5TtI2EWoTLcMk8/o14ExpkeDhrL5+k++OLoqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9oWyC8k1dkrXbEYmKEnwqQIlWhnVTH9whsnGGh0w5h/Q+MYX
	dQfl2FNCdWYtbgIu3gqmarQw61Zw2klKQg6ijMdk1nX/cLeMMcu4bP1Ohb7OfBJjKAxTWMOtl7w
	4Vf35YJfbeBzH6tQ+R3rGChvd0TmIAU3KPE3sS8fpDUxl8pKiyV5Q7gEWBci0w9eSStIV
X-Gm-Gg: AfdE7cnrwl8F7qGZyUb3sE1cXgg1Alr/Rk8YijqJ7vjvEFEgaI/MVdYxNf9qrMLg1QO
	xIDxWumVbFcfslDt9Lp+N7GaB073LeJqJs3cep2dGvMi7HPDYDK/YRvKorQ1Aqp/C5+i8LdgNjX
	07gO79mA0+6spRFke843TQxUaJfRowmiPhDce0HSphuddmhyA52l0YAl99Jbp1E+KNS6WcErYQN
	Lc8H0uMtgUs2MV3U2xc7gn8gv1bv1i4vuKjk4vsbouTZq4ocf5CxalBXx94uHOUPTLwUZzqL7MJ
	bu0PWbKFCgcjeIll4uL+ylKIRuC5GhNj+PmtNMK62DM3sGu9zDzSVB3gRQDJE6NYVHrwhmiHGym
	Ua6VK8TZc+MSolpWEvmfWRUgVCx1SMSwneQY=
X-Received: by 2002:ac8:7c51:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c26a7769dmr76954001cf.4.1783069061107;
        Fri, 03 Jul 2026 01:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7c51:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c26a7769dmr76953791cf.4.1783069060725;
        Fri, 03 Jul 2026 01:57:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62fc72dsm256179766b.63.2026.07.03.01.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:57:40 -0700 (PDT)
Message-ID: <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
 <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SFBjNe5dDmycVxtbGlZtbZ6ZvQzldSmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX2tMKSVUv/hx5
 LADdiXRDbiCVwN0Hi0gYQ6rcqx/4wzVR2+bPaAhRieTz43nqQI0fHbrZYguM8IDtYRV2ofiAHsl
 6ilaen/Vk0zD44daCvnFIioiDqibhXUSExF2v0Q1HOIKIMIH7z2tJ7tFcxskyDpf43B0aFcvt5p
 ZITiMAfHY2DxZuAuPAWBf36zSaYwo6J2GHbWP7zxufvSSHjRZTymOQ5MUyVu2GQVwHL/4VssLiZ
 84SnGqz2UA36EFLTOZmyRbPM7zF/xrRz0Npkghz2g6S7mOTo9dNrpugUwch02J2vbyzuPEs3+iX
 QKSmT3oFMr2dN83hZZ4o3aGmxJWzI8vhNjEGVsksUSqNlh9IpbE+1mhvrGOnRc8RM2PRIQlWMLu
 yTSNtnA2BiNk4hm1JNURjF/12jUw+Tfp21IWMR4ASWJRiDVvSYnsk4ADPQ0RAZ7j3wQDS7LwUcY
 KlPgkzmKaI8+BUNQQ3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX1Zkl2AH5wJ99
 tdzbsHXZG2nLai7wy59zoMMlHqH1qm8AUbI20P66orFXC4fsPmwmn020jkcJbctyxBpezLeLg5x
 QAAP32BquPogMj/9mHubSvPZ+bUhuoI=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a477986 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7f3yg-VG_fZZVZRDPQcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SFBjNe5dDmycVxtbGlZtbZ6ZvQzldSmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116244-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6B687007FA

On 7/3/26 10:38 AM, Kuldeep Singh wrote:
> On 03-07-2026 12:24, Krzysztof Kozlowski wrote:
>> On Thu, Jul 02, 2026 at 01:47:15AM +0530, Kuldeep Singh wrote:
>>> Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
>>> `iommus` maxItems constraint.
>>>
>>> Fix below error:
>>> dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
>>
>> There is no dma-controller@1b04000 in DTS. Please drop all the warnings
>> which do not exist.
> 
> Kindly check patch 6/6, it is introducing bam node with 7iommus which IP
> describes and hence, updated bindings before to accustom this which also
> helps in avoiding rob's dt-schema bot error.

Krzysztof is saying that the error doesn't exist in the tree (because
the offending DTS hunk is not merged), so you shouldn't claim this fixes
an error, rather that Shikra simply needs it

Konrad

