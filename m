Return-Path: <linux-arm-msm+bounces-116189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wTPJLy5iR2r/XQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:18:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55C6FF7A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:18:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Spmt+m5k;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b6O0Bg7V;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6320A3043C22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E613235AC33;
	Fri,  3 Jul 2026 07:16:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D92C0268
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062964; cv=none; b=gP0X3PANdkw8mw1vylYTFYI5IIxFHjAOHdECXDm2S6fMW7UM2ZgGfai6JsZylgWHc0RaFZ26QYHm0gWXh8xaXbSEH2wrVpyQxYhC97MoXpsC7frK1Wp9oKgl/+8inH+eTfUSb6LQdhuIM3LsbZigx7+6lacHPbqp8+8tdcCKbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062964; c=relaxed/simple;
	bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylr49EN6tMgKplxdC5u84mdjLBb40MahFzRnvY6mL/NCME08AI3EpXb+IMMWWMCHhSsxeiQvtgFEUiYvzKHcR6ti6k2C96HaMhki5thzTvrj9LdEKbrY5Oyi7dTEfb66rCa3TPknfaWr59jPMw+IbWtDtQiYzMatiu7PTfCpSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spmt+m5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6O0Bg7V; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rj5S3123373
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=; b=Spmt+m5ktSNHvBKI
	eJ0P4rvCFfucl6MpwY/vWvwUaREHxZhLd7UCu7We24vFtAfIdiZIthIKB04oHAAN
	EsNHTlqrRTXOMsx7WiYTzJ6dDrjx7wnOImXJd3x0JiGkIi5FwtHXtJs8hhWDiolt
	NCSsSlMq7BxlK+zga+pgTXOnlhcln/Klx5EfW52Jjq3fqqkvkNThWif8MEAeXTVL
	KyKoCasRF0KKCCqZdpR7GQ8z5Z63mLB6zLmIGOD0x9TboJhXkcCMOVLmMIVEmL2f
	KpZeoUnk/TV2EzIcK0hWH5l61EKjPObnRUZppIIKMkqvMx7BDbIJ8f/6o+pRa/0u
	ZSseYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpc5rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:16:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4ecd1ae4so5058985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062959; x=1783667759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
        b=b6O0Bg7VatTNQnCWxGKNd+Lp2atwYEeE4Md+x6Bvab8jr2ZX8xukbm1dxem/ocgYOn
         PJ4HP6fx7QwFxZJSse81KLHe5jitbMxCK0giVt8KY+haRuPkDIk+PRQsUKGWfxyOotah
         pZv1AKMjpaZA4ju9lPPTiz+2KV9iOL9dG43rrdaidiAkXkpCo8UVa9Y3V2Lrmz2YSJQy
         5gXSg948GdPlvn3B/bQO6s1853jDeZzc6b+GsiJx5MFQtUExG2DSU/pEGuhlEfnYBWz9
         2TdfMnWjtS39Dcd++L18obpyF0pJ16KbKgJv/wanuV5Y9zz+dDiLy0OLdKikCCjPD+x5
         Jsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062959; x=1783667759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
        b=nZojak6jLsH+utiF36QCZvsVVoBUYyDWpB1ktgovq4ZUzPbnhG+GW5Ufmru0vGh+26
         4iToITdAzrtwUujGn+mxocwtgMBJoJArPDAvj91I937O1tlOeqDKf9OPA3cK2eefMa+d
         vO8T/+O1dKyWv2vykvlp56BqbfKMjCMX/q+YexPaBzNI7hU6XF6O7h4vIlZmZc499Y6v
         eKDso8t0KWh9PViMFy6OXIVGk0oN8qzQc1dv/6kl27/VP/lWpXMrFeL0GmsxxS4XiVu2
         3jOxHiTEnoaDpPMLfJelQT9Rf3jMr0t3W7cZgxi/YUDxEM5gHot823bcT2Y3nn4eAr0d
         GoKg==
X-Forwarded-Encrypted: i=1; AFNElJ/WlESFsSY0rCiunQBFKHx/7IDlUSnDIhd7aHl9FQx9fzPm8M3AW/Qp5xGiOhsMMJoRu55ZxnfxIRzL6hZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YyhgipdQRDeqXtyk6l2Qs1qSWSJCVZsa+LOy+olU3RTJAPihyW5
	wWKw9XhI24TwlPGogc8HFpCHASm3sllVJusBff3ESDzdyGRkLIpGHgPdKXrg6o61V0gGOiMXT+g
	Xxq+S2PLTxfNDyZrW55ckUu386xu5JlWDtks6Od/wLnYkUiqUowd3efgGiBAG6BUPZxd5
X-Gm-Gg: AfdE7cnabeRRbw17r/HTtgn4k6qPCwFadn4MVgKUoXP6MV9jKRiOQnGYNQT0Y4dq2bY
	22tJ7mszCIFqqP6Kjk8nCV1QKwM0BAPeCZHrZ4HfCNcyIXcNOBozfKUyWbKda2Te/rzVrP2iNh8
	8FCbhGCsTt4sQAtS7d25VSXMdIQq9UU0PkSZouEjuS63Gde7bEP9CBpx6dNltdZ4nU22Vtx7m4N
	WzY13bFTuuYDoR1Mddmj/WqvD9JkC58oHLGk8tFVk78siQB9msAuhHptS44Vv2tjRzVoncTrpkM
	i00lJpkyIHGEXLNI/pNOH3EEP8AWerxcCC8VBsqmpcOm/mfvfe+n74CXIYaOQHL9LREQPEN6ioK
	Q+I7iS0LaFN7+k31qSVwrtrazpEjKsYRVoIs=
X-Received: by 2002:a05:620a:4724:b0:92e:7662:8f19 with SMTP id af79cd13be357-92e784f3766mr810629885a.5.1783062959479;
        Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4724:b0:92e:7662:8f19 with SMTP id af79cd13be357-92e784f3766mr810627685a.5.1783062959105;
        Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm244113466b.7.2026.07.03.00.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:15:58 -0700 (PDT)
Message-ID: <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX0atU/J+xzpz6
 89x3FobfLL7x/nDDLcckZbMHjJqN9aQAECCPrxSJYFt77+2FM6nj32spzx92L/G8ggu8oCDZiuK
 NlzqblMBnOlXMmW1hJr0D9Q/T9LVTqQ=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a4761b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IhUa5yoPuCKIE7YosB0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX/DBn8CUv8sM7
 1f+9TLcmCTET7OlUxABoW0vt2H4zj2AyFqQZ/ICR9QnlUJVlyFKWtlxAk/S8+TnRQh1fq78kfEy
 8UKuUb/UJ7nvK4kdoYhRzUeggg9026gnKmoM8FPQk3i5RCnxdutkuZN4ewAIcydzuJDBAMHmY7A
 wx9nMXceDn0eOasqi9D2AE2yHk250+CaW8uPpM6wSxN0jUezI0mC/XT08lrBrC6gO0YkPvJUKpA
 b1N/py7y/Qwa61tQKrJeMZD65zDPzmJvUU6zh1m9pezgqYjgUdaOjtGIIlDLLgQifdux9YJn8lI
 yZdoQpQJ30KSQh5KcTc0HUlr9atAO5aaVoXuVlpiL2pkM8vxLYaIWVigT2zF+lujC0O5EjhS0Go
 znnILygKnqrf+pXd33cQrNG1ZW6ADL606o1fUXBQeLSRJ9CQD75/cievbVj4Vr///kTVli+8/Gi
 AMttvlzo9G+Ttt3X2eQ==
X-Proofpoint-ORIG-GUID: ZHJvrZp6gmKYHmMQXdaEWmNX_j-_M2Zf
X-Proofpoint-GUID: ZHJvrZp6gmKYHmMQXdaEWmNX_j-_M2Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116189-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2F55C6FF7A4

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention. While updating the parent data,
> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
> frequency tables, but should be corrected to match the hardware clock plan.

That change is invalid according to the agatti clock docs -
DISP_CC_MDSS_MDP_CLK_SRC RCG leg 4 takes GPLL0_OUT_MAIN as
an input

Konrad

