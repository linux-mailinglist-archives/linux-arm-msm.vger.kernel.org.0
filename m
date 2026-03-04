Return-Path: <linux-arm-msm+bounces-95291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKkWBJMUqGnUngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:16:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A32341FED42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2491530107A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5F63AE186;
	Wed,  4 Mar 2026 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAg+OC+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxaJRc6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E839FCBF
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622974; cv=none; b=X78Q9t/jKyHFTUH9Q5+el3eds6w2PtHyYc33XFb3HvxAsXDWDSRCzn5EDzO87h8g3yOuGBdQIFybA4Fks9SSDUbALmV0fS1xPLYVhayZFA3WwW4LnV12COMp4+4PKpglNKmBxJLf7EBZn9jPSZ9IRq8DTFrEffb0qRvVpBO1ob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622974; c=relaxed/simple;
	bh=mIXmh6ePqgAY+9cwQ9GnatKCHykTJANip+0Y0nahi8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqQO5rKo7nMP6sXqJfth7a2dBAmL2M2Xor/lHGaPK8aRHRc2S4AWTzVaFJAENPTcamK0D9HZMCDi6XKke3UKKlT7nB+VUZstUp0bLtzAnN3sI//+IjPikG9+vKf59ws14gLN6lsbnxLuwlzepXXzIgbuI5jnWdJUGUenFf48PhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAg+OC+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxaJRc6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Sama1678061
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xUGmd6c3yyk6d6lBHz7pcDkmJu6HnFa6rJyLjczVZ8=; b=oAg+OC+ZQSGQ9xt3
	RjXXfrko40o/yyVYEEi8EqbAiDmarQmW3z7VEu1HxYQhzmQtaYAlhbO9oXtx3CxB
	hzQrYJnl4Ah0NPk41RSgQNQXtz8AO8JsLZmb0ntP7p50L4yfsXH64/c/hMIBVL4D
	unfLU4R9QoycygmRA8bIfF9s4oVADPct4S1QtjsGpBcWxu0S5M5+zloe1yivL5Qk
	2RLJU7eA8lq/5SsEcTh9HvrgnHlSL/HZeJShGF5TfSzphHhZQ2CGoe4nzPSmjbSd
	10bTYSFcfYMdCxe9zs5Vv0kmQBtaJKLXx7w3TjdYP7+OR4EnFgiGEd3Qf21V3OSM
	CXDk7Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hakj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:16:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so5735970b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622970; x=1773227770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xUGmd6c3yyk6d6lBHz7pcDkmJu6HnFa6rJyLjczVZ8=;
        b=NxaJRc6GgnO1rqPz73fIzecWKAsdhfbpzobHyvmSm2RRriiMjLmtcIlN7hHxyq5RLF
         OKX/sgS4yVwZzGrFpoGgJlvumMcP74kAoew2hydbPNwTa+1qzZynej7QQGe+vin9wZz4
         nCQEk9D3zBV0wsH9a6DVnI4iMy+ASr221DzCicmAZ6cfXmPa3TxEwoNfdB3vImb8I/42
         kA/7tmlJWPm9E/u1INrPQ714+CZMU8bglTQB8ljjbXyTqgqqbvjiM4JGCnfuieirFKdW
         X/iZz28Vwoa0jMMK9K2cFJBovQZ0DcqcS2Css4Q2MvnOIUqCBp/bfV6khqh7YHpCsm3L
         +qmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622970; x=1773227770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xUGmd6c3yyk6d6lBHz7pcDkmJu6HnFa6rJyLjczVZ8=;
        b=AsL6urUEqGXal1lBUf7s4UQ5ipP2gtpYRxXzWaE8rKwATAWGF9FM08LSqz/KdW9HCw
         bKdU6vr4+7AcLhZOvFi8Y6VgnAhIbWS8cbdPv0qR0mozI14fehwrb61i9G19j/EIYKpR
         LUxVqdEWP/y/Mnq9DLfk5dagQ1/XEcfMbSE74uKSM/qCq980u4q1Mk+w9Y1lSqI+U1Fx
         MbF1pgyl89JQtXol0po4RvnodKnNIemaHpiof5+bkEGEcT3f4XZDu85aiCl1bnjeOPZK
         DAqeVd5dqGJaEoMKROk7qaY3p8rIPlrj7Dcs/QBmw7eeNKL1c3Tish92sQmGEff9DXt2
         20DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLFM+S07IC/m3MEJU3Ygd5FyUFj1zL8Q9TYRThhKj68k/13+eqsNkLppUzi50sOQCPQQX2vMTKMaaLw8w6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxob5g7o7jA8q3Tx7PXHg4XHC6K5bNNMl3+ZYJCk6qHskXC6aVu
	Mr7jLfGOkYnBJAsWv5SyNruX6ySkVz1NbvfUycRDnjCTVx/oO0QtngPlWzss8zNut1IFzSzO8bv
	a23NGWXYXqwEciyhN3Dwqlx2GLZrZkMDJzHtQXH6pzsOyynkQzvgCEkwN+p8tzD55MSN/
X-Gm-Gg: ATEYQzzkebxwwImKCN4qvOQYxFUJItIrD52WUqAmnzotU4PbsU6qvwikvt8RFxnUNu1
	wNObp/NWWvYhVMP2T0DiprzbDdywZ5sjnsBw66OLR/+dWXzUVvbStjCZ+Ja56BJKEiLQW3kN2OO
	8sDtqmb71hFN6HgkC0rk0tqUu3NLsg54BY1cZ4RNEHgIzKWSn+gLJBn9RyI9wzirQO3/+0MUiVQ
	5dn4Au6Vdr2forZuT12Re+97F7AKkrI5fDJkmbwcS+hdmP2NKO7PtC7VSSIW9dSWeDJ6/0tCkdZ
	XWzparHDyuhLcBqE7mha/+vZSuGVGStvRNoNEQR9PCynov6VqRR95VZ100t1E9G+WtlKUyibUN7
	L5kbMVSoqMWtKftBwXgbpPXpmcYzVhnEHIPpVbWQvcG+HzyaNUefHhw==
X-Received: by 2002:aa7:9a87:0:b0:81e:7734:9e85 with SMTP id d2e1a72fcca58-8295d95957fmr3947673b3a.20.1772622970289;
        Wed, 04 Mar 2026 03:16:10 -0800 (PST)
X-Received: by 2002:aa7:9a87:0:b0:81e:7734:9e85 with SMTP id d2e1a72fcca58-8295d95957fmr3947655b3a.20.1772622969809;
        Wed, 04 Mar 2026 03:16:09 -0800 (PST)
Received: from [10.206.105.120] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm18625480b3a.12.2026.03.04.03.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:16:09 -0800 (PST)
Message-ID: <f4569240-dcb1-0d74-e1a5-8a87ae570d1f@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 16:46:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com>
 <a09b3e50-1967-486d-9489-351fa04ee8da@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <a09b3e50-1967-486d-9489-351fa04ee8da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mkyGo5WLC2Tyg3DlvLrW1DJWJiRd4aqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4OCBTYWx0ZWRfX3z0MAPP2J8la
 u/onZYL2l3asZ0gFf+FmogtqsPwnZ5EhjGDq5Yv8H7cdEg5vJewwizGS4GE+RFQhNCFUpqhXmIx
 x3OZ+BNTNKthTl1M5pflbh9rFnUQjc2cYZIkTe+5WmRiKhxfuUGKaLEfBykm3ImBO5UhtTXjw5X
 TSuY1vrgqYhx5zPlv1iKzRDOIVB0y2GShXNLJ+aGVqNXLHv22s6Rs+H7SHvOxYqjazcnNS8mw7p
 PuurMdgIIMvDIM9kJuBamo1tVKMUW8ZNMIiLMlZbr+kOjpurUe0u2X2HOV/iUvWsh5koIw2sVOD
 tEAHj5MSJ7Wu7OLSG8uy0DmB4MKSxWdmIf0ksv+Ld3Csl81X9vMK2lRrhMwg+izjXSlEqE8XPJq
 704mFCzEb7TEc/UkG2KtQg16m5RMPqVXqMANlLJTarMrBb2uOCrv3t206InEpBlYHzZVpZ5xjVf
 pDnkQZRBH/oh0eKvl6A==
X-Proofpoint-ORIG-GUID: mkyGo5WLC2Tyg3DlvLrW1DJWJiRd4aqJ
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a8147b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yWDKly2dQxHXO_9xnGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040088
X-Rspamd-Queue-Id: A32341FED42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95291-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 3:04 PM, Konrad Dybcio wrote:
> On 3/4/26 10:18 AM, Vishnu Reddy wrote:
>> The driver was using a fixed default FPS value when calculating the VPU
>> frequency. This caused wrong frequency requests for high‑frame‑rate
>> streams, for example 4K at 240 FPS. Because of this, the hardware was
>> running at a lower frequency than needed.
>>
>> Add the FPS measurement based on the decoder input buffer arrival rate.
>> The measured FPS is stored per instance and used in frequency calculation
>> instead of the fixed default FPS. The value is clamped so that it does
>> not exceed platform limits. Add a VPP firmware overhead when running in
>> STAGE_2.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
> [...]
>
>> +	/* 1.050 is VPP FW overhead */
>> +	if (inst->fw_caps[STAGE].value == STAGE_2)
>> +		vpp_cycles += div_u64(vpp_cycles * 50, 1000);
> let's use mult_frac() and trim the trailing zero

ACK

Regards,
Vishnu Reddy

>
> Konrad

