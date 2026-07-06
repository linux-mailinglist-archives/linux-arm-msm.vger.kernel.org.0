Return-Path: <linux-arm-msm+bounces-116684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LgdeF6ZmS2oZQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:26:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38970E10B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:26:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fWG7iKRg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a6rDcU6E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116684-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116684-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C181030022B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CF83AE713;
	Mon,  6 Jul 2026 08:26:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30113191BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:25:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326358; cv=none; b=o6QA9izsK7BRk5fRLOatavCQ981GvPHK7EbsLW0dbgVOPzBypFp6VY6SCc+UPodU5NNemlEdEA3nM3h6AZPJ3g40vyvVgKo2YJ0UeX5Csv3WoaxCqvus8RlZ/CMFCp6gCxEIwlPePUUObRpk6khIjDJ/3CURDI+fPJjesglBrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326358; c=relaxed/simple;
	bh=4k/0USkPSRP2sC81fYVoyZkUY5+RydOrcxw9BWeJKnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVjNEPAtneOwe4tkdnIPvGmq9ziV3fSyEReqQ3qNIS4LEAEqqS8xRwaLb8+K8NlsYleKmmeAHGOCjUWE0pHX93b26frS1b3oOWfEVEoiuAOBJF+/TJfoxsyf192X823S2CG7DZ1x8NtdFveZK0Dd20cdsyQbU+wF+v0u00cDMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWG7iKRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6rDcU6E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Uks3623873
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAjXdDGsyWcWm9Rj/x0IO4gwVFOjTa22Uaecq9GESbE=; b=fWG7iKRgB16XFm/N
	b5KkaDzOmKGbedsiIl6Ou8Isb58ardhAEElQ52j+aGL98bFLmYgJ4yeztBSAsw5k
	4CoXmHp4yt1KhjqQPLjRtds3uJ0uooPl4+7iC96BGoUu9/lpVNC20B3ltnB3PnhW
	gqLSTF+e/tG6TWz2ALCDFAL4hZuP+llpC10YaxyMdq1gn/nrvc36xwy9G86sV7+v
	GULaiHBehiCk+JqIv7w2HUyqYGtUxPmn+Ydet2aJEhTqayQ/nkCmqyGOj5OtpmdY
	ONm3uLOpk75oaAqdrAQFkq5x5UVt9y4pe3Ms83Y7cNw0wHXu7KoqNUqu4ziBv2xS
	A+JcDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swde8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:25:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9c0c4492so63674185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326348; x=1783931148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAjXdDGsyWcWm9Rj/x0IO4gwVFOjTa22Uaecq9GESbE=;
        b=a6rDcU6EbSuT9qnnfUBKn0DwhrTwIYvI8BPLQBXJ/dYKl2tlbv3XyIS46xxIjxy4cm
         p4SrXih8MDjx17IweI12nnVURvq5AiV+nwqTK9M7HS6nlbtvTQSemrQllI8ukTx8Navn
         ViLnTV23orf1W0KmDibHjCxZiOtv7l1RBbAnUWxC+k3rweb6cFZYR8CWlGQr4qH5iSPe
         ZBI1fuUrHproDOclBS0U+YMbh9J58JSjJUV8p6DSHm64JRpYL3wwuqrg9dvJueDHWq0B
         l1tPBnKDX1Lt9DXlVksVURcakxV8r03gw4fE4kD2FFB//CErAiaZt2AIlR9LD0W3RXDl
         rAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326348; x=1783931148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAjXdDGsyWcWm9Rj/x0IO4gwVFOjTa22Uaecq9GESbE=;
        b=BmrpwW+owke/qiGMea2C2mw+buJJNPVIwKhbF4DvI7c4UdPfDzKDvHb2fOG48mW36R
         bKVm8X+aWOrVoWSFjQzp9NdxUpjnbwAPWMhRxceRARwbGgw1y3Gugn2FkyOnDJvBqUWQ
         RKAP0Z3wnUrXAeL0rO4hyAnTjERO2ilXZm6UbPkeWs5hOxqFqzRmjtzqd0Luc//lC7ah
         db6mczqbvq9XOLJCTO82h8leBQ+KJeMRs6s7eQo5/fIe8Ulf38BFijpe/Qt95Usbe1Wn
         fSE8kcG8CUe2/vmSId1FheRP2d++evy6WG1sYDNGKsljEgaaqaj3K+xX5ervC0WVJwkl
         aMZA==
X-Gm-Message-State: AOJu0YxcWZPmpfTYji1b07YZWbuJb/a5WFUZZEvUadHBz65Aw1OhSAOB
	PTkV3JR1Ci29ZkmxrDygmyeT2GFNJWnmBOMWYevK8ilyMpEVUN3H9Y1/0wLNll7kMy9xgJ5Sg6J
	3j1EuaY2VQ2qn3buVWlnlazGqptmxCnDGm32lQ5EQgUsNxvBCFrHp8bcLp0D3fCsch688
X-Gm-Gg: AfdE7clR3lYz9hUfkWfz2gbCHTuKJrXW3pKjNpneYO8IoMy45PpwN4hRhSvNu7aVZGK
	m6ZhaqN63+pAnAaXsyaCyXoEEFWydHk2wtgOxLMibDwOTh+kWKwNkQw7euFs8HLlrb2vK35trxZ
	SuJNffR6Npr8it2bFHi5WHExrhoiOiDvyNUWHp740PoaGqYCrIbThWwI6IhHVplUYpBQbWvqsH4
	+dECvdjyxzNdZBxBrZhNwDWLPXrzxcrcPKb742+0zkWEt67c5Q0O2Ut9Pcq+PjRzJTf2ZmV4bTv
	5NQkO1cDQiB/R2Ozr069LTSy2Aohf4eUmpFS+ixLV8MYDV6i253VO7iZBjZeP3R9s2FZH8NR3OT
	yFFqSrw/b+axAN5Wu+NEprsSMRMpPy6QqvAk=
X-Received: by 2002:a05:622a:15d1:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c4bf465a3mr85914071cf.11.1783326348453;
        Mon, 06 Jul 2026 01:25:48 -0700 (PDT)
X-Received: by 2002:a05:622a:15d1:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c4bf465a3mr85914011cf.11.1783326348127;
        Mon, 06 Jul 2026 01:25:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093794sm687325066b.21.2026.07.06.01.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:25:47 -0700 (PDT)
Message-ID: <78a5342b-0a38-4d28-bc33-d18a24d4595b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Use tab for indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-2-16ce82a2bcfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-2-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXzOK4E6SexB00
 yAVn3gQPlgddDsVdPNAq0zRzRj+4gyVkdErqwpfigT+o852kdzYHrAQnpFu57bJ8ogthG/09DBF
 qpr63CcqzcbszfuDI96w0RGUa813DXE=
X-Proofpoint-ORIG-GUID: HpxX7fr_9qpukMBEhb8Jp7gHm7kJPb_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXztcjoJdfCgTJ
 R5VvaSbTSJ/Ip5orb01BGR2ZvbwDOxdrd8os3Y96U+6oy51c03Fjth1M10sVBmxJGGtyMSBTZJm
 D3PslCN0tJKbNAAUwPu23+IsOYD/LBboOWBXVKVC5zAV38qik6Tw+N1g0DGthTs1Wl3zZjtZake
 hWvqQc3avwHS1mj+0UegItMfv9bgIiDIWHEAzuYGROjjkUP+qpPhkdIkRAsuMhZd4DXGbvf/h7O
 SiypYnd6usc5AKHpm/X78aaQSnS1jYhhA26j0Yevi+FsuKJI8ROQifDgLICnuid8RKTNJN941Q0
 8Ua3grfQpHeUYdRbhQ2AN3XUURGJK6h9u80CZo6VsoohCn8Gos3t6ZJXevc6bYggJhCpOm5RJXu
 ehjahMDFDtjlwzX3Bb33r4e6AKKGIexFqWThmfDOpkIRC67//9h+gQUZ38lqTmTspZF8SZtWARZ
 xTSIlV2IEU9NOsdfvkg==
X-Proofpoint-GUID: HpxX7fr_9qpukMBEhb8Jp7gHm7kJPb_K
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b668d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AZJ-QSGf8ivbqnDstL0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C38970E10B

On 7/6/26 9:03 AM, Krzysztof Kozlowski wrote:
> Correct mix of tabs+spaces into proper tab indented lines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

