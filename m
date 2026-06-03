Return-Path: <linux-arm-msm+bounces-110961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7s/HzcdIGpLwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 15394637778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ti+qX2FP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Urm/e/02";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110961-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110961-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E19B0304D4B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CA93C9440;
	Wed,  3 Jun 2026 12:25:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE83D349C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:25:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489522; cv=none; b=cA5IT9Wnd/DuIv/7q8+35PvYbXJO5xZTTy6QtHpPfGYD3bbWcs9V7jtASSRuWB6Qn0UaPGcIWhwofm8IYtApjXCpYI+oCnjlfqDvyNgRfHU+E7tk4JkdHyKzdtlj8NyvWJVZR7aj67/MwS5dTcbieGehpQpR+ppsRIdG60dDlFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489522; c=relaxed/simple;
	bh=JuvqwBjym4t/oKt+K9cOMhnz6jIONEmZ6Dhfwekorgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL5he0TpNWeXOP0ipVL2597KXB3pd9xZi8nNrBrb9H0rtC3flce64DP2OzYng1D6DPKQiIFeXYOLsEHXIDEJYC1kY9SeRkui680wf4sWHc8oaCHr6AgQ0A+0HLKQ4GowqIpPAp8xpo9mmjw3OlVDCVwckQ3XsIrv/SAhd/EZ8w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti+qX2FP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Urm/e/02; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395uGS780758
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCV9ZLNRuQ43c4ABS9sAzC9BCFQ6NfEp5U989ijwe4o=; b=Ti+qX2FPMFnRPUGc
	i3nPdN75Kj+WDJL1V5xQC0GPtW6WZ9a2KHhIELU8tC4u2UqQvewZQ8Sk9/hQpwIY
	iIqgHaCP9o2Z+v6BpvAWmYrG+KxW5G6Rb5RFv0cr4bRSJASamPgQZbaeaMMfOp51
	96VhIontED3el1a1mhHRzE2eMnDhXDFepskeEZnuVOjLSctSZoGW0QMteh+TmmN3
	PuYQud7lRl5sxTTkR9q2BXQXQfBiGxqkE1oPrjDeO1DWwSjVs81UUImAi+FUK+Tb
	vITS+XHrXaeL9KFqWFDQPwfPov/QfT86YV/ZgAbH0d75l9tnyDY0JzF1PIfKG8dv
	REIc0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0rwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:25:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso72321685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780489520; x=1781094320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCV9ZLNRuQ43c4ABS9sAzC9BCFQ6NfEp5U989ijwe4o=;
        b=Urm/e/02fX1PFLmAmU9YamE0PYxYfZ30UDiZiugpOSLMjdvGbMCGOoPMTmZlURZVmp
         FtW9/TYXHRppI/HCXgR5803d4AAaGoLzdBaPkW0ecVNX7ERA1vvidOtUTAAt+sUuUnX2
         X5lVABZGQpKQgnPUS8ZfUcMSR83cuY6MPkIoE5ztyGHlrHCWirDoCs8t6w0ZS9Sc3hWT
         JRXglIh0u3im+dfZ/qNs7htBY1rAef8T+PzQo3oTKj1yiZZJFqSnevKrj7HU2BglrsZp
         Kv6dpzI7QogTT258cgYDJ2hud6ApYBVW9s/pihxGalTnvFK+Aq0e9/RCvWTMKBUKFcot
         FciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489520; x=1781094320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCV9ZLNRuQ43c4ABS9sAzC9BCFQ6NfEp5U989ijwe4o=;
        b=nE7gd3ip3wrZXHUBUh0UxNNG5AfV0RNshE/yLTK6ZEC72Qx5mv0zm0PKMKLxruRuJM
         USiv2ijjztB7jOrLokYd8dCTzv7jVfjDG0WQK9KyrnrFw4NjBDNla0uhxlUmpSYHxvZb
         CkH5IgytdkI8PTqqYOc8BnYObqKl6c5TKnLVOfdeZpfy2Az661qJ0nfoBnbP48XJ3JyE
         OmwtXWYFFJ4zElHtc9jkq/WH/Ls7Akpp4kco/SVaWe29DNrCW5OmoFtDljEEQTMOm162
         9yMARmZJDhs0k5s/L0G0YyJYmaAzUjH7A8lkqCEisZPLyQjwQVRzxp1Ixc4h6+mcZqmJ
         XRmg==
X-Gm-Message-State: AOJu0YzSgoNetpyIWSi0mznrvCSWWB6KNsdWb75boAxS0zXHJvTSNCI3
	ekWIkbJ1wWVg4sUUWrsFzf0dc4tjWfvXFv3R+L+biPSXlazJgi5fQVf0aNCjfitM3p5xkxH8mpA
	pniOOi/y4aT4Z5Y3ihKE/QXEMFOCQIM3c2ootWYjhB2sUd8HrNNWWFmtZu4XDNKfK9H+9
X-Gm-Gg: Acq92OEdL6MZgTDqcXhHB9Kc6EKOK2ZVmDZ/Tq1D46qsbFGl22X6tCXma5t2t33NSQJ
	2gcSnFh+onJgkQ4D+pbUVeu+ytdEz7YksMiuEmnR+r24kiW6MrzpcNPtHLEWJu2lo/L2s2gejDG
	Lpjc6RN3dVC97ERXYzBKn8PeP3QWuUmAlm1q0xpV5qazqZLFB27hgwwh68Ss/v+SSApWWQyr7w2
	Y+iS790Zwk5BCwFeokbJUW7dsuT8aQLjGSqdo7XmclJ8v1d/46XpdcWuKamCLeY8ZQi1dOlFF1m
	KA3CwzBEIYRc63hxOfptMju85DV/ShY9rUF6QuA2NVZPNw4bWM7/4NURUjnpeTKP0vdLpx9Ffgb
	17ffCjvQj1/OITWL/QOjZXOlp6vbMFOJ2mSy2IW/wDrRwtFk3MHJU9JULLEFCkObaYkxT8XQpUc
	/mMCrCPW3srxE=
X-Received: by 2002:a05:620a:46a6:b0:908:a758:baae with SMTP id af79cd13be357-9158a31557dmr354626285a.6.1780489519592;
        Wed, 03 Jun 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:908:a758:baae with SMTP id af79cd13be357-9158a31557dmr354621385a.6.1780489519033;
        Wed, 03 Jun 2026 05:25:19 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm146052266b.38.2026.06.03.05.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:25:18 -0700 (PDT)
Message-ID: <80333371-48b3-4cdc-85b4-5625af6517ff@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: tsens: Disable wakeup interrupt
 setup on automotive targets
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
 <20260601-tsens_interrupt_wake_control-v2-2-ce9570946abd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-tsens_interrupt_wake_control-v2-2-ce9570946abd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dahqZIlWM-EnC75i5p2CTvoXMJfvvh0v
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a201d30 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JgYOmoMgnJlLO9fjyWQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dahqZIlWM-EnC75i5p2CTvoXMJfvvh0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExOCBTYWx0ZWRfX73a8WTinccu2
 r6TVVgT0/xFC96Qpv9ue+9eUjnCxWIRVzkbJyY+U1AkCs0/3eK8Xt2urpXb+mWUm8gRDH9RLhNz
 Ly/c9KGi55J24eU33me2b2YWO3E8+CFZhucc4JQKRRT+tlyZexzIk0z6mYWr/DwB1RoDo4qGvGi
 +r4g+5Y0V1pjQ74Vb4vrY5mRmoX4+ix/wr7qbHwKEEQwlIkzYSK2XqvnE2b5lytdULcIqERbeWZ
 ZjREJjBc8d9DNJuQVhHGw1vebgbL4W1ne6QWEr89Xh+DlaipT7AJ+aUhMhubiymle3ktMzOOdVD
 GOfLdHgtBfY6NUs//qieuKVJg6taqC+GF2InwgtTbxpT0z576jeT7ytrS/hV/NjM01uw2zTWZPw
 7yOno8Z0ZlFEpeHytVRuNCrJVlHx3QBI6zMen9ROigQndC+ODeSyfCyD6Kbt/EfNl0D1mY7kUoX
 1etRWZvUnYqyYZNuB2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030118
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
	TAGGED_FROM(0.00)[bounces-110961-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:priyansh.jain@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15394637778



On 01-Jun-26 08:37, Priyansh Jain wrote:
> Add a no_irq_wake flag to struct tsens_plat_data to allow platforms
> to control whether TSENS interrupts should be configured as wakeup
> sources.
> 
> Create a new data_automotive structure and add compatible strings for
> automotive TSENS variants (SA8775P, SA8255P) with wakeup interrupts
> disabled.
> 
> Automotive platforms can enter a low-power parking suspend state where the
> application processors and thermal mitigation paths are not active. In this
> state, waking the system due to TSENS threshold interrupts does not enable
> useful thermal action, but it does repeatedly break suspend residency and
> increase battery drain.
> 
> Allow these automotive variants to keep TSENS monitoring enabled during
> normal runtime while opting out of TSENS wakeup interrupts during suspend,
> so the system can remain in low power until ignition/resume.

Can you not just disable the wakeup source via sysfs for
your needs?

Konrad

