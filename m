Return-Path: <linux-arm-msm+bounces-117752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YlcRN+5wTmo6MwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:46:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A977283C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b1QuN8NG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kJweCrYb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117752-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117752-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAC123243400
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E9C3F12E7;
	Wed,  8 Jul 2026 15:16:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC09D3F12EE
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523763; cv=none; b=nL/A0eBU5h7BE1/bZWCcGI0U3J027Zsgv5vrllUEDHTZKvYFvYa68+BKFdPLo6FO8yV/oFv+yxmtv4bw2gcPX+MYrloYMSCHw1F73vU7S4vIB5KsXI+VeK2tcWq1AM2L88UlTikGF6sXaqfzXIdyxt3iImIdjDcdscvYpxJVTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523763; c=relaxed/simple;
	bh=7HZ/p2qWs0/610chpsEBI7thFDTZBQAfrf5UF3//urI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdFBBYWg2iH6a4Qng7JohOpWZ5SGsLcEEOBJr2XVqLaUTZVqAONATvE/FWZenj2Jx+gDNr6x0dF1E9bWfslx5wWctXESmB+KTi8MUFJ6qnDgYpVgYo5QqIixkHDA9dGLPxtnKIZV6Y6VF0YCainAf6DG7OwcXzPxOHoR/heRDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1QuN8NG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJweCrYb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3sYC2751523
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=; b=b1QuN8NGglJsWzFI
	/5/OWMr0iy45ykbTib6rymqZnggykGKI7MPCQvcCYyMuo6CU7W2dM7tvgAIUyjBV
	6c5mtGi9uby5CqhI49cGSA4KOTAsFVN/WNeepR8mDPxX5Mr5IJPqZ4UYCMHw4eO5
	mCCFRELf1Zuz75R2+02jvLYLCEHJtu+3Tj45B9ED1TpZ7oWFTQ7XkD7Xf7B1UUY7
	of9RAUSqWZxfOhN+x5Lf2Iry7rsZqeARGcYhOwywGz4uA+G0ciLdJ5oiyQzTkXES
	+pTguuAU+a5IgiT+Gr5hrsY8vl444DDJQ1Ng4v75jC+yf19YzzgNe5Wf+6NLvPmr
	taRn3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu3w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:16:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1182389a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523760; x=1784128560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=kJweCrYbaNT/4vfy90dbbBVDmrcA7rLH3rL737zCOFqlo/XEzmCpmZINie5SXP+EWH
         OHGiNbHJC6WNXTcTDU4/EQ3sjONhxLHdO29sKcsj1fKQY3zBu2pqIin6pR3w2XPA1wpp
         vXsfcqJPG8vixZvak81aiMVAeYpqYtg0wbHc+HriVQ5gRGqDBVmLTFwWhYiSIXERzMHs
         AoxEMexI09AEXhkq5/NbvjTslqPyHH00B0w62wburP/tUgOysrWle5ButPjkcpvmyzJu
         kDo4NDwMzm1IbLMAnU23CfxSfLMFmaYFTtd+Q01FhV0FW6afHBq9wgJ49ceuCs9jUfmt
         3Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523760; x=1784128560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=Ft7vBjqL1bSjDtnMxmb0vVrHPzogBXm33PEGGEc/QNG8l/3jwvg+6L901zHKqnUCzF
         uWDLzsLuRZRmTZTj6J0U8XjAhW4dY2vrrNuFn87p/NYKzjSN1vv9uNKXCtGjY2aBWdT5
         v15SFnoaUFeFhneyz9s879OY4uOS8m/L/jEakOq2p15RztyPz8cTDbDATpU/RjGhkZ0R
         CkAFmbNW/TtXHw0epjkytkjc2G7u2U0PUyd7Pzj7qN521o4MGYk6lNItsu5N10Flqpsh
         8qBi2jAZZZvVtH7JBO6z88O9q2aso37JjY+Y1ImnTsLflx1CpEse3XuqC35MNU79gNHd
         Yshw==
X-Gm-Message-State: AOJu0Ywxf53sPyjHhZWL/BbuU9ULI6IPwCcu7kWY8oFLbmo7d2eSnvRl
	4zwIaQX1wAKDqUIFbmgbS5tRIL8JkIdyhVVPmAfkZEB5R3uJASo8s0iW5HeN39Uo0dnYgsvoCAs
	dsFiVhWCXxhrGEzmUMwdya/VbrtuhF8SHgZBjl41P0dl2uqEtZwT68KnLSg+xYTNVpENA
X-Gm-Gg: AfdE7clWwQgDME5rn6g+NcEiCRTZvgi+NPWeO+t5EUQALWwQkpArouwbeUHE8u6m5UJ
	I1LN0rjnSlGQWbQ8A20Cfc+6Yqr8QWFvCPLucwWNLUw3ykgsUOVEkGhw4fEG/mPd9vYoDVpq+Sg
	iny0P/2eRQyq93yZBL5ceYuYKaq/NL5DQuORZoVRvrFaW1QohSj+hD8/pSmUzHSvEif6JKB03IS
	0obqdz2Z97CZlCGrZctac+l1fz30gFr1/F3UKTyeMQg/wSqgwSyTkMZHaQOdJC63T4qNpqgQ6oT
	ANetMf7MD65baMXSKi8maYTGRZ72tJ4VN4KEL3iVtAbI9p80TInnkuKJx7PnqLtldIqvVEkFQ0i
	5PCvbw8KK4X2UlRzLzXJ8wRQ7CFh9MNKpiQILEAq+
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475170a91.6.1783523759647;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475100a91.6.1783523759171;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
Received: from [10.204.66.13] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm18273012eec.18.2026.07.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:15:58 -0700 (PDT)
Message-ID: <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:45:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e69b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=hdgLcCZjOrcdczLgVvYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXy/vQTec0ymy1
 gs6RbZX8BfgdWix8dLh8oRCs8lHZy1tSv9fB8PCgjbvotLStweHKc57R/DLgxsIUgyOa77JvjjD
 suX18/puhis5LZ4g5sR+1mhz75L6h41iO5Nb93OL6L43ZSGJSi5g9Xb2SyrHcuH0X94OAAbMP+6
 yuZoh6+aooyKevOq48gIkZ8YmNOk1TT4qSpzMYlIDrTZAFcdQg73OIdSbp0kckWXfaXrb/6T0xD
 n1eQbZADA9L2Ha2k2z4veMD1SUNgwxxiGNPYrspMWwOjldeujVhixROelDEyObOG4aeZQNZ68V5
 nf7xsETsfyXkgJFKT2P1A6Cu+J7r//+Bu6feJBM/sWkzLYgFFPnoaPHCv9MJh6xVq4/LUDbAFxa
 AUec6EAHEpLUk6fbI7GFd9DC1ANEweiv7yfNwFX0POT6YdFek26/XgHg6zyEuq+bI17Wt10Crvp
 8/Zh7l2XSp2RtGbld1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX5PzfI96oNViz
 L/6bEwpTg4ZUKzSqK2IoER2rAhHiUGlT8nJdM1zXt1cswE2mS+js3+N9cZfC7sGk8NzTExaqK4Y
 HpcZEfzCMoMA5jtMAXWDTzl3YSg1Kuw=
X-Proofpoint-GUID: q10Qe330Zn_3ISw3DJ5uwZAJrgLJ0Uqj
X-Proofpoint-ORIG-GUID: q10Qe330Zn_3ISw3DJ5uwZAJrgLJ0Uqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117752-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37A977283C0


On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>              iommus = <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,

I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.

Regards,
Vikram 


