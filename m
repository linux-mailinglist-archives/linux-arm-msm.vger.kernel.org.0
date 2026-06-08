Return-Path: <linux-arm-msm+bounces-111775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CxhJH2OLJmoVYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:29:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C74986549B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:29:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TkWkBUxQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PWt2R0RL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111775-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111775-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 131E93027697
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD5B3B47FC;
	Mon,  8 Jun 2026 09:21:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FAB2DAFB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:21:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910502; cv=none; b=QQaY1VmJjlWhShtTL3yHJ+ASNWCEKrM3KchI+NUtcGH12LZsDb4P1C8yvJ5a5BVNTVVpQlJG3+rDlkx4b6luATgvGF6CvST3qAfJtcwZUhINHbrlDkuzDSDMShSkGXOmsddE8cm1zguRJEo2N7A37hnmwLXtUncy/D6JtbWWoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910502; c=relaxed/simple;
	bh=/bF39d1NIuczfJ3IZUCdW7MiQjF0yS3eUlRvpoHWi94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=li+pUuTjtjQooEieAHfcoy8/f+hstUB3PvUNShRFQu7YSjUdjY9dkJNkqckI8csx7iuYKHsjuPx4fMFKpIztfKm761dzE/1DcaVwaDz3iKtsznYVAN4YdrLdKK9vIs76+Latu3Wgw0EawJbFhhFshchZ7aixYpDoxKn0H4ETvQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkWkBUxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWt2R0RL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkDf2347122
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3Qo/8d4aE/Bw4GAlPbSk79wc0v9MrjJB8silbnrFxA=; b=TkWkBUxQel2vcd/5
	t4JgxiOvkIZyvRHdd2w8RhIbIWb/euyIcdrjprZpWBMHUIUyZH67IADt+yyWdoKG
	h0vO67PhllfDR8JUV/9uWR+uxNj6SZFYWK95H07ODfGlpAc9js73W36Ce1bTgj7P
	/UJeBw1pO1YnvJTaO1qXBRdxJOx+U23YCvymKqrzCYdE/ieT3ZftAFBpXi4aaEZ6
	/Q3aJAWce4rRG9fJCj0kbP6BO0OKQPxo4gnoxFEZMc1kiFN8oCN7rFpJK1BejuiF
	7WTza2TTAYG74Nur0ww8ItPRZuwURG8WRU09j+EehdEmP3Y1ZY/0mP7iGTY4zbvw
	f9KKmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrfarj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:21:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a4ca0a4aso133184885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910499; x=1781515299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3Qo/8d4aE/Bw4GAlPbSk79wc0v9MrjJB8silbnrFxA=;
        b=PWt2R0RLGxqq34mdugjjn3uH/YnU3C1TWIJIYhbY33qWHXThDs1X5qgBAtIeRWJAEM
         5ovpCTmYgCupTySXCfH3gG6jnWNW2i7YR02vDdDmomkEqzyqA+isgvaqKwvVFg3E2jzg
         /CI3QRcL70bayRe9YQsxICl1r32DY/XuBHcUYsAJsOBKlUJMj4d+dILQn9djGM6gkTQd
         pk9fo6Pl2aG4IWwqhCPYMLoBDNxCkFzjddhjmnVQik/yslAbLl58gnow1fOvguY4i4sm
         R77ReHI1N7SV9sE51V5It8/kyTqXf15fP5w2QzaSyKTfZsOAV2IlXz06wfyg+YiVIB/O
         mocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910499; x=1781515299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3Qo/8d4aE/Bw4GAlPbSk79wc0v9MrjJB8silbnrFxA=;
        b=BFKbIa9lQMp4JyosbNCvdxwfCyz5HEI83nF4hbyiThhVDykahoA5We8wUjJI2bjWQ2
         C01laz2xhs1KaBpJFe0nup5VHs9GGNujy8VoyVW+zlNOZYz/+Qk9yXdgE9nSOz3/GYQo
         I1F1kyEMRRItPzz9t48IcqbR64pzs56gFxP0pjIPvPUQII+wHyS9HsQEseZRnC/z6ebp
         +lIRR4hTYgIRNyProxF2KxHQspEhUSXHtu+zNNiCEMyw+40socA1ihSouBtndfeC7f8A
         xuVdVookGBnZH4TrbtMrzm0r2XJ2Rc5/N+VDKrGGqsFZcdEjOaBqQ9aoSh3hKOXXEIpV
         JIzA==
X-Gm-Message-State: AOJu0Yzb5GMzhx8HC/FUij1DMLIsUStmd23YfYrtOj6LDoP7Ly7kWVPH
	1XNapHb9qaxQcai3tDDi4XnHo/7ZmNbywLmG3vjch/SjTSrB+aoDsfAvn84e/2fcRi6qpQK4EuU
	C0WT9jNW1hua9mSjSi0F2c88oWfk6JYcwH1xgpb0eJrmHpmasoNIVkUhbxHX+gVjzkbdA
X-Gm-Gg: Acq92OF0g6vOQsy/dehZ8hIx2hG6D/Q8/QgXG5nNxclM1n/3UzXHB7dzmxGRCBkh/K8
	K+jLa3Cnn5ylGQK/fMnQL6SuR6suqi00a5EUWQzS528WJnXeDWuY2newLcMvyNYwZnrqCv6cNGe
	HfxsstYfizOzzPcEigIipoRBxgx4m5YRNebHAqqnJ+KXMIjAuAIx8qsPuFIXj0LmLyG4WC/cV3k
	A2o3CUByBp6Dfyo4gMcpCVWp1vCQfSZD01s+PC8gmub9XZMlarHlNCS7iAfSxEFOvzTQlOrrOA9
	GaVoCW+EnPZU4DiXXvyXuB9i3Vs8Cdo/VUGCTIWkKuVyaoHmvTSivBlv4XPZUB0v9rKphufzfns
	+PB2dR4lQGcIa/bNKBnmyk0dDRpPypBe2+dBLuWpw5izzvTNjAc/fXTrx
X-Received: by 2002:a05:620a:4153:b0:915:7dd2:f855 with SMTP id af79cd13be357-915a9e16827mr1242566785a.7.1780910499620;
        Mon, 08 Jun 2026 02:21:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:915:7dd2:f855 with SMTP id af79cd13be357-915a9e16827mr1242563685a.7.1780910499171;
        Mon, 08 Jun 2026 02:21:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f34asm7139892a12.4.2026.06.08.02.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:21:38 -0700 (PDT)
Message-ID: <1ab6db68-3347-4555-8ce4-108c4ac01438@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: gdsc: add RPM_ALWAYS_ON flag
To: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
 <20260606-submit-clk-gdsc-msm8x60-legacy-v2-2-187a32d2f015@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-2-187a32d2f015@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NiBTYWx0ZWRfXw6I7WgywoFRN
 k7pJXzhViXMtGNZ0e8woyKXl4HAEsBi7vdfl36npET0kQKtYpa23l+5R/awA+/yo4ijYBixw9jf
 5RIJp/GIt3DK8eT4q6YP1/+Ocg/rQuRt/ezyKffCjXnJ8SeTPU7BApQPqBMd+x9HYShDwILsAfD
 cKt0aiY1aWh7tKjztmZSprrM/kBfhRMyMwTvsEg/gm6Epqk4HBjPnWyGoSSCpfXJ8A7ubyI2XEo
 NbZseQJoX5GpYmIs4jij98v6YRtBcko6uEAHMXsod1R8LjCrqR9CHXvdIvpnrw7ZpQP9Z1sj0VA
 EbuFxn2Rzc1ufUutUQPu7kgjKtu0kaCPk/GSwmm/87UByZvMYOysArMj7C0ttcrdgHy35YTgfB2
 O/4E9y1VQ3ImbDsN2FTmDJGmoF9yMyYzRtlpV/VwgGnCR/6ZDxAI6hye+8nat/81ZJxqKB5Tbi8
 xIUN++rumCj2fuOeuLQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2689a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1DhR-0cvEugVRngfOrQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3M0VTYHNOaxSCYmyWyM_sJNCHnLy-9fZ
X-Proofpoint-GUID: 3M0VTYHNOaxSCYmyWyM_sJNCHnLy-9fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C74986549B0

On 6/6/26 2:34 PM, Herman van Hazendonk wrote:
> Some power domains need to stay powered across runtime PM even though
> their clocks may still gate, and only collapse on full system suspend.
> Add an RPM_ALWAYS_ON flag that maps to the existing
> GENPD_FLAG_RPM_ALWAYS_ON on the underlying generic_pm_domain.
> 
> This is distinct from the existing ALWAYS_ON flag (which keeps the
> domain permanently enabled and prevents collapse even during system
> suspend) and from leaving the flag unset (which allows the domain to
> collapse on every runtime-idle transition).
> 
> GENPD_FLAG_RPM_ALWAYS_ON, like GENPD_FLAG_ALWAYS_ON, requires the
> underlying genpd to be in the ON state at pm_genpd_init() time --
> the framework rejects registration otherwise. Fold RPM_ALWAYS_ON
> into the gdsc_init() block that already force-enables ALWAYS_ON
> GDSCs found powered down at sync time so the flag combination is
> honoured consistently.
> 
> The first user is the upcoming MSM8x60 MMCC driver, which needs
> RPM_ALWAYS_ON on the a2xx (Adreno 220) GFX3D footswitch: cold-cycling
> the GPU rail on every runtime idle forces an a2xx_hw_init microcode
> reload whose MMIO burst can stall the shared MMSS AXI fabric when it
> coincides with an MDP display client-switch underrun, hard-hanging
> the SoC. Letting the rail stay up during runtime PM (clocks still
> gate, idle power is still saved) and only collapsing on system
> suspend avoids the corner case while still allowing full power-down
> during deep sleep.

Is this something that downstream works around, or is that observed
behavior with upstream?

Konrad

