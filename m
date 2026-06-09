Return-Path: <linux-arm-msm+bounces-112184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KnVJLq0aKGoF+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:52:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F2660BE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:52:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZwqSz2kH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DNhIreTb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ACCD308C37F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CB94218A1;
	Tue,  9 Jun 2026 13:44:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6514285041
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:44:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012687; cv=none; b=C1g/EkiWEKn1jRrLw7UuCbqEh6mtzJ5QGmON+6yTo8qi1o/0Xxfdjo+86MAjQzQsrQ5HAfjiPfIx9N0SbiWgj5oIsN2LaQWzjqBFYi1RrEWof1wt/5q3rDAoGeBZCTYh5to4MuK6D4dE6TnTBK5aMXpbd106NnASHynt1/aVBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012687; c=relaxed/simple;
	bh=yFEUVspAipcSdEHp8C74WICFz2h3ah1KvhUBq50EYn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZYMIbwLyXYOOXaddKu6GQ+zINA0B9I0stC+a0aV+SMjUutAW7yWBddue2ATPoQJbtAZsEtnQNf7ElDcN80rsf/5+N+zvOtXBHiF4IwuecSpWjK886cHXzF2Y2G/jNuQqvMC1+HcJgX9KpiXAbf1R/ZQiRDjwWeaynW7Wbn45TSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwqSz2kH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNhIreTb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClGSQ2251532
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elqZNXCc/AvbcsWkHmbRAiPZ3tFxiY5dxVY+KlVe54E=; b=ZwqSz2kHNMKc02q4
	i0qmxTp4o0hNXajg71aVI1YayfHWuUlW1HFlEQnpLqDED87QLxxa45HDCnfOkANn
	iv6uhs9VcfWJj5DFuVs1Yco5cr/yD2tE11B11ScjzHK8lkJmg+Lr8P6rcMEFmWdO
	Kjxt8R/vH8158WAOETM2ubODyWNsJ7gaFqHST+ZUCqBvRtiFNulCXXNN7f8H/zGO
	LNHO/FUul5GXd3xKgCY+g+gxVeE3kG9oc/bjf504nxRK/oacBa9qO8Q/IKSFnnwW
	cOn6LrjDv+rwzJUfA9KDs6OB9QAs8NmQUIpJzjj63ALYfUtM33AoQmX7xK6i5MDH
	3BsArA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghhfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:44:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ded346eso10933581cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781012683; x=1781617483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=elqZNXCc/AvbcsWkHmbRAiPZ3tFxiY5dxVY+KlVe54E=;
        b=DNhIreTbxx3qRo5Sykwd0VzqWZLLEGbJdZmXfcEfpR0VXiqsCey1h0TVjsbSPNqafu
         EHuYp8J1lqM0vp2E90ho69BpvwXL9LFd+SsNr/ew5W/HM/ygWTqh5HWBU2e0b4mrOcqW
         Ym1eUHSLKBXdk1mzPdDmYPJqjmZ/ERk6y2hnozYx9OCWxZ39Mi1bWbCE6bZjKthLrriJ
         s8rq3dmhxLHGnBu4+EAOEi3fw0DabePnkcXR1WqT6QvFFc0pulzC9QUlXAFHmIS9GZTU
         xa/m1T40XX4Q0mPvIyS0j9/BS11c5mgLaP9wv5x/QQYgkE+eykkhn+AWVFDTtG45Acl6
         iquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012683; x=1781617483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elqZNXCc/AvbcsWkHmbRAiPZ3tFxiY5dxVY+KlVe54E=;
        b=Jv53GqLNcP9L5lBiPyf1BWPagT/9hVK8DzA4hi1l/cSbz5LP/yfw4nIBJGY+4WCENA
         BqOhFQjgHN5w2aiYytr9DCXxDn0BVGAejc0TJCNq3lYSnDci3ks5vfoR0pRad+j1dpPC
         dlKvCQJ6hLlPpuPfLBupFp/w2QcO/tWVqN/a2B1eu1Wj7DXBtc2EfqiMiA8nPCCjruZV
         /ess5IS2YamFBSMJofVrhcoFJS9ZYGVaXQBIVDCsh3N8+vf6OR3T/6Ao7e4oNgh3bMKN
         tlYc/H5IeLlpFEKb24go5eCafkHHJCQyh3N7I7/rFaRz0C5cytg1VBeKbX+31+uC+Gjs
         JaEw==
X-Forwarded-Encrypted: i=1; AFNElJ9k2h8hpJiepSJOpiYA4khv1pnBU1cJ5JP3A2qCuLXtf7uRmgW6R0vMtrHaJol+os5/1DQB5KaqBo6G6wmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8r3eMAhUHn9MA/m8TSInh8Bo8R7I92J4z6XOcwvVPLNIxH1k
	I5EZC3ltKaPAYVkzu5dnqutz5eZW0xnHtIiLjtuSo54TYsBJVyHJ9tOKPKKR3EqZ2mNykJYHYE9
	au52errXC/G6LAVLPAs6WoE0kxaUJWLdIephIzpxWIXpEHtStcZ2jSfL/BkhCkbqmOlN3
X-Gm-Gg: Acq92OGKCp3n2VZJVV2GrJ0dYVA1Mxw0pTuFT8bRiOwjP9rbRu6/PEiMnQM8Xzic+6B
	rogSjT86gZwB7PjZ9xk4En1ZrSeOh1udyHJAluMoK4ckdGMQeFLLT7JTl4mG5QWqo7REJYu2yCz
	H3NHgYi/dYnKSqt6hLGN56xMaA4xVfobDS8+Q2P62qxohSlZg0xYMXbN/NG31yBB4q/ukyNLS78
	FPuzSiusaxInRxWDSIvmRMQoqAyayR0o9uGMAV9YXO5iE7ZGYWLNZ+N7Clx4OhTQAYUlmXSlunR
	jVTV5k0WHxgh8dMTAsVBXiSLifQCThy13uVGM3AIR1kgu6kKpCPkN5AkolYgOCJKZrMJTq387Fe
	C78/cCE5V6YvwJASHEfJDoE19as0rpeots27QplbWAw1yUA5R6u/gKkc4
X-Received: by 2002:a05:622a:ce:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-51795c0c10bmr185039541cf.5.1781012683042;
        Tue, 09 Jun 2026 06:44:43 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-51795c0c10bmr185039121cf.5.1781012682479;
        Tue, 09 Jun 2026 06:44:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm1046373866b.50.2026.06.09.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:44:41 -0700 (PDT)
Message-ID: <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
To: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMSBTYWx0ZWRfX07Z8S6g9vBsu
 iPNkuBfwNSOBUjUWvxi0d5gpsD874Ji0LD9y3jwGwx9BMVm7Z+puOKEEyAqgrJANH6OT2Jyo2NX
 Vf6KsyP5lUnaKA3jKqqb6y6XWye7ruCoXfMlWegyVzBdIjRowYrD9zzs/V3+0KiPWHdHjlqCf4n
 Sb0kDrDatAGelIMJcr5LPpKIaV7El5hJgwE5nXsI17AwK60QvdcXVAhnpj7nVfsBKgwHE4KPW+l
 oGiKGckXxOJSj1iOD2MfzKM3cxIM/1FugEu+Z2MCYzWjQL9vHwF5zI6W6tnAw4EoQdJ/1GdR0C8
 dKGZhB4ic2l3c35Fgyqtx6q4NUm3LcV5K2rvLnygfccccN+4t1khu1LRn066nQgjjdj3eICD8RR
 jJlQQXNql54SU8NQWG7U3QLkO9U22y2kvnmGDbitps3GsVVCOEZav2YhDiW1RNUFzXm2A/GgtmS
 K3Mll5PRdNBp2yM0z3g==
X-Proofpoint-ORIG-GUID: XQP8t2p35UhZAqO9KLBqjiYiRe8pBPjF
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a2818cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=cTwmTnRGAAAA:8 a=1-bfvCXmkCd3W1BBiQUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: XQP8t2p35UhZAqO9KLBqjiYiRe8pBPjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090131
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
	TAGGED_FROM(0.00)[bounces-112184-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 561F2660BE6

On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> generation that preceded MSM8960's Krait CPUs.
> 
> The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> make a separate driver cleaner than parameterising mmcc-msm8960.c:
> 
>   - the pix_rdi mux requires a custom set_parent op that temporarily
>     enables both parents during the glitch-free transition;
>   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
>   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
>     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
>   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
>     later 8960 reorganisation.
> 
> Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> rotator. Reset IDs are exposed via a separate header so consumers
> can reset the GDSCs and individual blocks.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---

[...]

> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "pll2",
> +		.parent_data = (const struct clk_parent_data[]){
> +			{ .fw_name = "pxo", .name = "pxo_board" },

Please drop .name (the kernel-global clock lookup), this is only a
backwards compatiblity measure on existing drivers. For new entries,
.index is the best (because well, it's the fastest)

[...]

> +static struct clk_branch camclk0_clk = {
> +	.halt_reg = 0x01e8,
> +	.halt_bit = 15,
> +	/*
> +	 * The legacy webOS kernel used halt_reg = NULL for this clock,
> +	 * meaning it never checked the halt status. The hardware doesn't
> +	 * properly report the clock state via the halt register. Use
> +	 * BRANCH_HALT_SKIP to avoid the "status stuck at 'off'" warning.

It may be that some piece of hw is holding this clock online behind the
scenes. Is there perhaps a Qualcomm-authored commit that mentions the hw
bug, or is it a guess? Due to the age of this chip I would imagine I
won't be find an answer if you don't have one..

[...]

I see you have a lot of inline note-to-self comments, please strip some
of them.

Konrad

