Return-Path: <linux-arm-msm+bounces-116933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wg5gCGXQS2oKawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:57:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F58712E6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:57:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P62yl7vc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jNZI4Wva;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116933-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116933-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2535E31A41EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699A1434E5A;
	Mon,  6 Jul 2026 15:36:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00E0434E2F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:35:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352161; cv=none; b=YFyVZOnTOZq4yjxENSmdX597jukX2RHqsQqsA57PUnPb4jRdfL6Lw3fjYG0eGHw+MVsfYDiiPrjUQ4BPB1eBRCnn2w3nuJ7uCnXVz7UjT1N1YYj0sjnMtwMF3YOlZb0z6tx2b8eW7UBYo0q/Vp1k3VIAMti0bwfaGNFj0B6NJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352161; c=relaxed/simple;
	bh=HdwwW2iPxMo55xo31PeaYKaC9C9c5lBoecOPey2HqeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOHQMFeQ19VLFLsICR40JYojjYYfDXxaTpf2vACYfftMMZxSGoYo46zqp4OhyxwQDFRlUTdVeAmNSTjGAWmIA8k0nefbxDy8GkGgVR4nTUvdzoYlV6kCjHFDPC7t8uLQBJrzzfkwhxYKeuCDREVfzj3oNZBhjDTXGq1p+BIin/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P62yl7vc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNZI4Wva; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF67B982437
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=; b=P62yl7vc/Mvt/dzV
	3MyUrF1pEILkx2F8C9VTrmpmnpEXKoX/nIqigX1Eqadb6Iskeqieg/r0WgGHA/+b
	YGg0RfeJMF0/JeRBjLIHBSP9/xl6Vt0zBHIqCW0b8NSXiFnjQDwV9mcP1SWiNfmj
	0ffPIkGdxV2t9iNW3ytls7tDvsO8Oq1ITDgk58jgNzMMgOwmqPd/17r0howEGJJP
	PUm829Rz6vDfXXLa5M/VyJBr99UDZODxA1RgxsU1GeBNNNC4jqzd8ooksV8p7Hvu
	myfw8om36IA1MClvpkCbcVpRNwcX3ozB82pzY8iRqM1uLzXLFtuLZY5PRo90NYJm
	evu/GQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qphkk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:35:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so3863201cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352158; x=1783956958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=;
        b=jNZI4Wva4yedgQ8aTrGP8Q4Jt2L0uDe8MvEv0IuN4dNgA0DxjTKCMPcPlrEneNkPmg
         cNt7l+4X76yCe8ASDmoHENhPWv1aVi3Nrw+fp+DyKFWFsID+VCHBTsRs6xGqZqxq+0mw
         8nWJaphjHYd6aoakJIdo14XjnfV5u2d5HYrkDfXv6E7s2+/O3h+L7ZdQtQG/dpKZOtKX
         05Jdi5jFOrjasAIqgVMRHNfJhYQUfI9ueHmi9pNUhhX9wMBG4StwX+CzMGC7osM8zk1f
         Rf8RDBhUKdZyQUpKQHeqGLwawY7XoylH9G/Lsek8N0jE7Y8qdYewoDsn44ijTZwKj3wU
         CXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352158; x=1783956958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFu3+CLuR1Wqk1McfQvrk9SrE2yO/Tatw0kE1ejFwos=;
        b=Zm0QFzL190rZaiOPi5oD+7WvWmYwuCj2VYCjkCuQpbGmIJvivj7d27BK4c3AnVXzGo
         K/ME98IQAMFFhx+OdBbIuJuOeoJfdlqiw3O5/X0PpshZc7/RrPC961up+k/Xmtf+LtBI
         Jzrs0fgDtrXl4yQcPY3/thuI9ejS0aP5HsXUXKRhj+gPIekJofPCL+r/wndzR5nSqFfo
         mCTG/MVlkAvDzYT1PzfHRLLC9vEm7uRMH3rdoX5voBYy7lrAwEMf47BBX5neIcqb7OkK
         yO2c62RrBJmhcX9dV2V+1+ubzAElqkHcIdvCt2+Rgm4kZKPOXDVe5BIyokYWNpLLw1bi
         e0xw==
X-Forwarded-Encrypted: i=1; AHgh+RriAtpkUdQ2CPQtSRmAj/PiHBaIjxAkrCv6quDvyuIvaflaBMu4DnbUf6FepnATHuwN8YnEk8Uxa7eoAvGS@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvZI4vNlGloZUtQ/qX3ZPLM5+8lZ5UIEsOHSob39F/5yF+lIh
	QXXTnz4uUujFT++9FLxOhOoDJiAiR6ZjKeTsRoVJiiFsrhUnFoyyDPCUinC1RKoV6D8v9RVST4Z
	5k+YR+6Qf9+DKohMn1/x2h1Y51k9IiLVsOLwysux0ZfN3MVwWSSKvj6mmEFPGtQNuoE98
X-Gm-Gg: AfdE7ckwxymmT8q4EWhtO333TIFXUjuCCNgsm6UzR477YgifnA3iuNKCWD1CnDJ9Q5K
	BP6XJPWhjUhtAalw0F50PWDtfQeN6aAh+3jQYXul6ozsYiDMzf9zIVI7d6hLl+IiCftKdJT/a9d
	FxhjgvdajlDmJ6g0j+UFVIiXxKwjOXVxfFBoKPuFXzCgo4u6VxNalHu2wzsstP7saVQ3/vp0JSI
	SqcvFqMntw+siwMjY0quqEehquV/Womm8KxRweZUykj/ilhVs1aJ4mh5pYbNAUioK1XbsaRD72K
	oKEg+PiGTLaQqNDw9HK94ChyMleGgYlvTepuFfm3Vc8oNELqF2+2QrUs7QDdWHNoswXHWp6HHAO
	vdDA1SjmtBIZ1ZccKz8zPryTVWAfb80lbisM=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr106810791cf.2.1783352158107;
        Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr106810451cf.2.1783352157695;
        Mon, 06 Jul 2026 08:35:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290972sm775556466b.41.2026.07.06.08.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:35:56 -0700 (PDT)
Message-ID: <97a4a44b-7982-4705-85ec-664838658b63@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL
 and related clocks
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
 <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bcb5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sy-nuy6jZFkMOSGpH-IA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lP8S1xZ_Xf0Ld1MAYrmR2tyRIbmQGEf3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX/08+lZ3YuWko
 tHuZQpDrJD16MoOUVxal4IgDTULq/fSqB/7DYN9QOc91lGJQLwAF156qXrNPZZG6ZVBMkIKUZgO
 OGOw0JY90dvrMUNRn18R9L8xC5caaIv2ZZesIkst4GuK0zW8qrR6iQjwSWqz5jJXegJB09qHsNq
 j1Qo0Kk+GeZpunbaAz5jJ/KahT7aB9S4j4r/gEoPARD1RqqSJjKx9Or9FrASdQKmcC71i4ZQKku
 OkGiCbOehiMiH/4aUGaJ8DNtsOQDwAzWXIKEuc5vfDXi80RjcxKyofNA79xHO6gYLQlj54Kjakq
 dun1nBgD8MD12MQy3xAXeMjIApiUm0rnkji+U5wy6ehBluYWSiNVmpQxU7WzkBNq2lcmCmLG/gn
 3ZOgwpU/MX9tJnaxMhm3i+6VYwfts6Q7c2kcwwwVDnFVhGLQnOlk3svAcQA/8M/xk5gQWkJHttg
 rU/esUUt7iZgyi1moMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfXxoKXx67WZoMy
 hJTl9R2PORgqNU+sD1kVCHCiWD5Cpj7H5RXKoi2mDrIn2xucs488JBhLakPmQNMIgoAO1NBc3AJ
 N8gVBdofaitqo9vvZQr0WDYMplm3psA=
X-Proofpoint-GUID: lP8S1xZ_Xf0Ld1MAYrmR2tyRIbmQGEf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116933-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7F58712E6B

On 7/6/26 5:02 PM, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> match nowadays is gcc-msm8909. Looking at the differences between
> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> definitions for the BIMC PLL.
> 
> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> used for GPLL2.
> 
> In practice, the BIMC PLL is exclusively controlled by the RPM firmware and
> Linux should not touch it. So far, it was defined to model the full clock
> hierarchy, but even in read-only mode with CLK_GET_RATE_NOCACHE this is
> problematic since the RPM will silently change the clock parents without
> notifying Linux about it. The clock framework reads the clock parent only
> once during boot, so the resulting rates will still be often wrong.
> 
> Follow the example of more recent SoCs and drop the BIMC PLL and all
> remaining related clocks to avoid reporting stale status data. This means
> we cannot determine the rate of these clocks anymore. This is not a big
> problem in practice, since these are NoC-related clocks that are
> independently managed through the interconnect subsystem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

