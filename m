Return-Path: <linux-arm-msm+bounces-102265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK+NJ3kD1mlsAAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:27:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A743B82B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B89C30327BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D90387583;
	Wed,  8 Apr 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ao2psTjY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpMo7buP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E838758B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633187; cv=none; b=iQsASVVN5ibJK4MRbcPWxepVXCnR4R4mLQzxDK2OrWzdEkoPCF50ilgE7OTnYvXHc18SibEnIBXEd65juj6KvRuIe16vKx7oeMHNdVjUV7Jv+b8whm0L32OoYc2CsKUnAqbatgw6/xvLtjpNrKMLe27bv4NPb0fvoO7piVv8v4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633187; c=relaxed/simple;
	bh=Ln3oYyk9NJD1ehlAH14Q3n59O+lfb80eWJIy2aYwuFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uh/Wy58jHuffcjeQhu6sfFw3McsimCQ7sbnFhxxdVo45wRhZzFxhEQ73J763RCetDUNxKZwToT8qW9wqXYH1WFPfiE9I8womDIKiOSg9o5x6Q4sw3dX/ksTqJTbJygCvZlEGWczeuCk4N0xmPy4oTJng8Ywl7wsF+Ch8pznfXUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ao2psTjY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpMo7buP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6383PCw62411828
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2H3ndmymhmzrh7O0zHIVLNuQNg52ggIc09GsHqPIwgE=; b=ao2psTjYeuWNlIks
	B5Ha/DIf2FQdzBeLJtw1QsyMDquC/j2XyIYVbKXYIN7mh7YzY/zMCUHE3P8DfwW8
	2HKO31tRLLktwRrB3QMXuVigxSLZz2xGIiLiHUbLbHVyPSO+LufMCmTF6yVbf/FR
	Y2Z4cNxCZ0URB1s9Fb8fKC8GJ39wMPx6xyNi3L4YY3CDU3bpzhayeZq0jE4a6V0a
	fY7TIbaNxj1OSLpxLJZvgUjQSik99Lt7Q0NRagJDESD/pJ3NFRwGwdDo5SOPjKFe
	ML+jYsg4QS9kVVGllbGekzJfgPtOYgPCKcfh5kgLPIDUOYCvtQFbjbxOukpAeqNj
	iIweUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaj6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:26:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce34a78edso7641886b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633184; x=1776237984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2H3ndmymhmzrh7O0zHIVLNuQNg52ggIc09GsHqPIwgE=;
        b=QpMo7buP2LpJPkUBfmhRhUDvImWxUy4q7AkyaJJbEoJhRsbYihqkxHzTi3ZsUKm2uW
         DUHqfocxSMXByxaZNfH0Ui5PLv0BcNf1N+/vXTbqu0JxL7Imm3xhJioqmZfXH/lt57w6
         DOMa0EGMMHlQ5+VJEd1tWJHZV8PQTAx9dgAkDjnOTPPzrxTAz5Z+WeNveWR14diDJjsT
         ZfhHYV37QyoWCDMdlYSL2y3IvUgMf2kLoLCn+mjPmG7lw1QYaEIXzs6WF02xjMa8qY8P
         TYUjesRBdwTg2+7hZk8GHEZ5m5QedvmgByI88NbVzIIqiImuLRoHKfECqElnwDg6WPc6
         qMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633184; x=1776237984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2H3ndmymhmzrh7O0zHIVLNuQNg52ggIc09GsHqPIwgE=;
        b=H4aOXj8VQrJRQofvgrmd/EQu781DzC4um9LUO9sLgGHyRINBknMLUMePzOImUptqy6
         g3smja1YD/YCxWUIQgMjLHStoTjcsyJOQCrzdaoAdNdBciEVym5C6yU87IVKJ+My2UG2
         x5YCUFe0T3kD3eurkSis4RegT+BEjDucDN0p2AguAov4tVgMO5W3hGvFNBY9sxrt44AH
         +XMMrICSUkVlVgyIXbOWxewmDpPHdkqRa6u2d/kL9306hn3yuIDNlcms2+tymlzn/9T+
         MilWZwC16lT7fDfh7yp1ar1Pmbp96qpVxCJoh7vrOSw8cqS8QaJcRCd03VG+pBwBc1r8
         ff/A==
X-Forwarded-Encrypted: i=1; AJvYcCV2clXavIiPaesVuWSFXVHQKAr9LyPJUI3wK748XYwhelFEhBhitBvG2X5FhSTn3HFzcu/8Mzn4GZJfwNfK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6XHqgPe7gjHGbY69xkDR12gtuipF7UsDleWV/XClwT8uQWJD
	nAafuuScX8Khn6MFmUOscovKVXAyZjIGTnsJ8tn/UidakQVRIwYg9r3QdWR+tDmKThwtJYdqJi+
	TqvQr6OLTdryaQ2PmdlSAtn0mybJLRC0WXFdhkW/+G21yWew7jvqAi09WeeYi8KwDjiNa
X-Gm-Gg: AeBDieubcLhuq3E2hHbfNgIn7fFRHza97pvAaBBAEYo3zKbyECXBJhJbKO4Hhen2z2s
	Ua3X3RGl+H2EJkpujF2luA0yUfiEp2UIj1AfT0Jpzrnf5y9THJ2T019z2y2QXTDaBx97ko3aBiu
	3ppobCtAIhClkyOWXWAtDPbilMicvVEM3YbuWvdhiYvI8XEq8isdFdb+/UPT2UvuHNXT18/Vb8W
	3CjGRCQOEf03J75f5ggFEPWNf3MFJulh+LNGfgbuYbvUoavdJ/4ioDWdjkUtkc6GyhAuXpRFkgl
	kdcCM9DKOaxcQxviJP+A/VREDsVQufgP0tqdyAGvR5v/Ufs2rZ2miAp5ON0oynUOkIFlmxVY+SI
	z7qF/CALPFG7+39qc1cgAl2fSlVYit5rmyX6WMWVsaW1IFZ94fg==
X-Received: by 2002:a05:6a00:800a:b0:82a:6d9d:3f85 with SMTP id d2e1a72fcca58-82d0dbbca07mr20585711b3a.48.1775633183755;
        Wed, 08 Apr 2026 00:26:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:800a:b0:82a:6d9d:3f85 with SMTP id d2e1a72fcca58-82d0dbbca07mr20585685b3a.48.1775633183348;
        Wed, 08 Apr 2026 00:26:23 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm24431255b3a.41.2026.04.08.00.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:26:23 -0700 (PDT)
Message-ID: <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:56:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
 <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NiBTYWx0ZWRfX4r56BNXdKiI0
 eszdNQhgLe7183TdtAwpnv8Z9jH0dtK82QhFwzXw7l8j00g/6mVa/m32qEG9JnpziTJO8dGY/Cr
 IWYMj4x65dMWzYIM4Yc15o56m2SLjP0giYqkx3oSNhncqzHWwfVDaeCM0D2NswqkAoSqWmIEUhG
 quGQpzjwD2K/3C+lx2kAnrYSbP76g+7AObAaMXgD6XMohSYT6peGtlBwh+qDIPvxnNlF0UINkzB
 e7ojZjPkLM7XKvYeEHmE5+Cl4SGXiIV1s3PcdySL2oi5djye7QJEF5y7YaNojU9ljUAEz1Azk5V
 Lm4eLzENzbjIGpF+CkzX5kxErTXJGxDECxsyBA4yeWmekJzeOGBkltdj84uKuJZHMWGqwuYjYkY
 VL/dt0pjF9Cs07FVIwi+EZZowpOpkeNsMec/jVcn1HWMIiXjOjikfjITnT2DMmkkiWGIeSvyCFP
 QwS87LMQsgecDwJGIJw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d60320 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ej0lypjitWEjAblOXOAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ntx37b9XNtwtxeN-7XrkjtF8QGW8xfbc
X-Proofpoint-GUID: ntx37b9XNtwtxeN-7XrkjtF8QGW8xfbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102265-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40A743B82B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 4:28 PM, Konrad Dybcio wrote:
> On 4/7/26 11:30 AM, Taniya Das wrote:
>> When the clock controller is probed with 'use_rpm' enabled, the
>> runtime PM reference is currently released using pm_runtime_put(),
>> which may return before the runtime suspend has completed. This
>> can leave the power domain transition in progress while the probe
>> path continues or returns.
>>
>> Use pm_runtime_put_sync() instead to ensure the runtime PM “put”
>> completes synchronously during probe, guaranteeing the device is
>> fully runtime‑suspended before returning.
> 
> It's not immediately obvious why that's an issue, is there an
> observable problem when the transition doesn't complete in time?
> 
> Konrad


Calling pm_runtime_disable() immediately after pm_runtime_put() prevents
the runtime suspend from completing, leaving the clock controller active
and the HW rails in the ON state.


-- 
Thanks,
Taniya Das


