Return-Path: <linux-arm-msm+bounces-104446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEgDDYRU62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:31:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E050145DB99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44949301DECC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B783B7756;
	Fri, 24 Apr 2026 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcqpPRYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm9ntpPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3303B7747
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030244; cv=none; b=IUiTMam6Q8LH1iu9Fbn7leQ267MT3Nafpib51mR5N+6OkeHjH87U1FgWRjfgv16n8H+/zSMRSc8vNwpxx2I+tOaiFaRXdPNb7m2dhhO9NgDlRBpxdNdNNduQ8p823HrjJvMV9zEziA1uZtzyJDqJLxxf8kmo/aZ9P+QU429e1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030244; c=relaxed/simple;
	bh=vileOc2RfzmEYgD7Pm9+BBS3DOPaMysWk/823CMJgWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFhyiTbi9X9qGsIQzm541Oq9AmVpFw+8Jamh1xmEA4FeQdtclw5jmnZrCQIF16ppflljuJMWJr8tJYoCAOZOJ1l2PKa9Am5FH5oKZK8O44OsvA6nJ2T06AIiNIy2I4Npgjm/mLeNl50KGWjepuzhnvYH8yTKemDONjdsG3uBvPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcqpPRYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm9ntpPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9NiRt1533461
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=; b=VcqpPRYAuhsO+kNw
	1bFVZdoV+X2GaE/RWnh3uBx221N7Uzzim5tbMtoozBTQoRB/Xe20FHbpnd0kKj4w
	YJ8Wm7k9/8PBj+0Kmsmt65OP+lda4ju5o6ha+4L8VvsHHMe5q1XlbcQofQfVe8Tq
	eD3p7dpIWbExGmLbl9GH45cjcXk7FmrstaO2QWll+S0eoH74bwZSXDVwf47Iqs5I
	vE6yiXGK6F+3uivSAhhNYhmfeikIL2NI/k4/AnAYpwqCFWc+oZKeyNpFHbOX+UGP
	9/X3ilHdh3wGGbOYeHkQoPOUNH/0klIdkkHjjZVcCOmGnYtWmG8CvR+IMsleN4dN
	fIlByg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kusu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:30:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d45ebdbc9fso155586285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030240; x=1777635040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=;
        b=Qm9ntpPrAjhCwFKa8wwGNgZcvTsvRJggzzRC5Uc7Pp2Of8eUlFF1qTMNvy5OFzwrSw
         p7rJNoRsstLVTjNKPfmCFhTkiFbJbuNfcRp6rXYnRxKMmP3+7U/EmvyLJWNsiNSy8yK3
         RtfNY9u10FOh0A9C5M/nRg2LQgHiJeBWOBhyTecCQ+9frV/RLqLedEFrbSctgFpecqPx
         IaABmuE1X0HJ3NSYWtw3KCnQGGJxGbrAoEG2yWaFmqIg8VkUvBTqNrheKLBv6YRtfVhZ
         7ucn7P3UpETLPiwytlUYTz8yzudXwJMQPa1jkP8Gso24+ztt+aimyeIUTnef8Ro7Z4e4
         OxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030240; x=1777635040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=;
        b=bBgP4vYCF97fpxxgrI05dy7sOeViq5EiHofVMa3P9xkwb/9kmWh375CkoBLvIzhMr3
         A8u55ofCws48fgh73HyRIbaXneKhL2NkH5aDhpDCR5OdSIvMvJVSamqONu0opeJiUw50
         UOXqXdvUgvTJWiolCFCDb6EjAdynC4f1yM5JK0ccoC1LkhKHX7cAFXdYeATiZ0AwhTlL
         b7KLsFNbE7vrQF7qgqsFCVQLDEl1dKQFjV/FyhtPCt2ohm89B8ZCPlUtZ50B1F4L8lcT
         uKcEqDmS8hjFapyVRKUGtKS/5KrjW1QOJGe9APDs7WXBl6QoCf5YG5n8Mdol6FCNBSQq
         P5WQ==
X-Gm-Message-State: AOJu0YwPUPmM3UaAGmDJlq8NpHaCm54b1wW+ulqkqod9yuHUJC9ggEQ6
	BShyCVLxGNIXfU3AFX470xLb0O8Gqqt8lwyl5WI3ucfnHXFmqB7bQ7cwYmDHa426blfUjccPm72
	pW+Rjb6qz8gva3UjRktWjPYc8jM5ecjF+nmKpBlpvL2BcRsVbMbcb6aRunqiT7hb49zCZ
X-Gm-Gg: AeBDieubWoUi1NgrB1SUBw0yihYZog3ml3x6/L3Xo4KOR7XUb2sn63l7esklpnScik1
	6JOUd//vD3UptIS9dJ0fWovXHn3ddEk4+IjVv96nDGaSkO15f+MhMUg3KruTGHRztExNDruJq8T
	9L1iLVa6HJidQ9Jgb1jokNCh66tF4C1mkW9VAA+ndUph1kp84eEaDtQSwvaERWRYllS9vOqdnsj
	pP3gK+Ox9BEQYApgFmT1AGCU7INl78Gr1B+3e3CDe1IYrD3YL+Lc+G+JCL4zQXS3Qrr+d9G2ejA
	gv/pFV/4n46TxYjkGEcbgYLKVqhQCMlAQz6HHeHCXfpQTUgciQ68hM1asT4MHsn748VELBNhSu0
	/STtoEeJAmhea1mXcVrnlTVNbBp68tWyYBCWwV/ThWcEJFYZvH6tJ1bFwgM2fZWyTOc1Np6ESO1
	Z/2xtHkuDYcVZuEQ==
X-Received: by 2002:a05:620a:4101:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e79217c512mr3005248985a.6.1777030239866;
        Fri, 24 Apr 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e79217c512mr3005240785a.6.1777030239300;
        Fri, 24 Apr 2026 04:30:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d6f63fsm4763703a12.31.2026.04.24.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:30:37 -0700 (PDT)
Message-ID: <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Oh6go1V8Kgoi8hYmvYJBIHrB0IuO8VS
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb5460 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yenN7Bsoyp7keh_6dZ8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0Oh6go1V8Kgoi8hYmvYJBIHrB0IuO8VS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX88QbcNOJo29N
 IX73JffJf/vbtIBdyegBl79iKzkZJpO/byekIUFZ4RvvOnR9EFdMvqgf/OtUm4MlEryiZLLmqjD
 Ag3Bg3ebkXIheNYBoFZcpYkqlcISmYUZdyslzDAqVWOykZ9sv52uhJemOcKsulrTA3M1RiePthu
 6PPmftPYAPPle4ogkTL4gBcPuJna5QZuzAZcMzrH7VHhCPt92g3/kwSDZ90Hx19+xGzjxIrqFyk
 qcpWNd0XNjGHS+i86Deg5hZn159yl9uYenQSsNsVfdhhntYOOjbU/4QKTLi87pm1/7Uex0/UuV6
 ipvUu6sXYnGg805Zj6BrzdXYKR5uWoqqnaC/ZhpDv8sG5r1bbo/Qusy76XlVhFytSmiVo9A7wwe
 +0VyW6fRV0e2qXBabWnqlx/ida3Um7rFqrDM0uJQqyQX+zfarzVXWcqW/WP3skiWM/xPEcQCnV4
 OXZS4jzdiIfHm2Evucw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110
X-Rspamd-Queue-Id: E050145DB99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104446-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
> +	.cmd_rcgr = 0x31004,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_0,
> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gcc_pcnoc_bfdcd_clk_src",
> +		.parent_data = gcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> +		/*
> +		 * There are no consumers for this source in kernel yet,
> +		 * (will be added soon), so the clock framework
> +		 * disables this source. But some of the clocks
> +		 * initialized by boot loaders uses this source. So we
> +		 * need to keep this clock ON. Add the
> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
> +		 * disabled. Once the consumer in kernel is added, we
> +		 * can get rid of this flag.
> +		 */
> +		.flags = CLK_IS_CRITICAL,

I think this clock is normally governed by RPM.. is there RPM/H on this
platform? (doc access still pending..)

If not, what's your plan for this? icc-clk?

Konrad

