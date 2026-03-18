Return-Path: <linux-arm-msm+bounces-98396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGpRJxF/ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:31:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BC2B9E85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301023053660
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AE1375F65;
	Wed, 18 Mar 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jisUF2Ry";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcyM+Xf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4D35DA7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829845; cv=none; b=uRszc3keh9kYoaEUiaeiWkesKMMj6a3OThPU93pUww7eLphCDjE8ROmMLnTvOael5BI/qa+LGUJgJyyYU+g7RErICpx/uTADM3t4liXoRxfW0qgo2XGt4KlEoNxS9pTm3WZcjpoy0xtFDJiW1QLCM0hpJrRVpQvY5Cyi3mYXzGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829845; c=relaxed/simple;
	bh=BXVKsVW5KX0qXXNdYZMGppyZopnLVN7FUFFMlRoCCxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gz66r7DK5B/5N11SNjnJ0iTYj9pPageHL7X8gU+miAxjYHl+npfrxLa4sOOU0aEmXH0xd0opkGh7Y8fTjGoT65WoIXm1cWvrca6YO48vsufBEvN65/t2r8CPz+ER/PRkr9oenMSEMIlJ/rD9SK2JsvsUONN1BmG+DtAfofZjaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jisUF2Ry; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcyM+Xf5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MvGE3358516
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOwk4wZNbzlxHVoMnSwlBHAbDQLpKXe/fZRAqQC3Ofg=; b=jisUF2Ry0nJJQTGm
	OCYR5+npAjgEi0uV7WP9RCX6yegltmQge7hA7XiwlTCFZR3iBLWRvAhAzBj4xX0m
	kr1KSGmOAqsYaeoX3oprrDcV4Yoeos2IVeW/Mznwu+9x4m4XVc1eKUz0cxkSz/u5
	jFYhp9Rjq5FXJYsHU3MPPuk9njWq8Y/lg8IVpebfjjjzV9bRRvMwCBTgDZEuzTbQ
	b7vneO2owUtpYK/LCob3ltFPcMMK+SDIU/ioHQdX8QXOiZx2Y2cVpP3MMaMUQ4GF
	QOKhu6LvNPGPAyUOnWmy2b/IQZ5YS+GvrSLP1C27sbTLnyKJ6MpqIG/v+AsF19s9
	mFJUeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb08c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:30:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b8da51b3eso4671235a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829842; x=1774434642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOwk4wZNbzlxHVoMnSwlBHAbDQLpKXe/fZRAqQC3Ofg=;
        b=PcyM+Xf5yN1uAGaDgMJfgZ9BoLu6fX0pKK8EGVwEXK3q5fWrl27zqxDCrdq6ocJQvL
         WkMiPlNv3UueyJGSW0PM7tfskoQBgHbRu2KwhK001sA5Cz4TBhQE+UEtPJzr1ws/pdiZ
         DtgyDQJh2iUt8j6Ovnckl74gs9vexhhJCrF5qIVb34WVhQQYAB3pxzfPsmngEAAcw1us
         nkdpRHXuut8mhpcxV5TiK1XAdP4kB5bpJHTKGUiuCRDxbd4QnekJm+sNKcJagUB/FO9U
         9V8I0XpJWyMveWIIXmzpPZnrXId2SA1raEK1TR4ne2mw9TUFm62yP4VfmhKXKWWSnJWh
         PqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829842; x=1774434642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOwk4wZNbzlxHVoMnSwlBHAbDQLpKXe/fZRAqQC3Ofg=;
        b=b7TJJ3U0/PRzKt7w1TawbTDNfsZV3M+kPEm4jhUI9DeClSJ3mUi2qmRZFSvGp65Opy
         PWUxNNw6tYUXzTYNpXnMiH3S4qILerRuH9qMQ+fx6Ioa7kaH5sqrccWxPsQEqtOHRU8I
         x90bdT3NyAjTGcYj/cEY30DG/3s+zeycTQD/UfLlQPTRSHysqn9agDV5AIzftoxrgnXW
         WgbWWaebZBZpYrQXqAvgHzQAC254uT05KXa7QVHtHbtdoDg7Ift2qQuYIqTeamEaoWJk
         ftCPeKhmuFfoCHxR1tazNaInpp+W04AK4SD0QL0rfRgztYIy+kcPtc4Uq5WV1b0v0o7Z
         qmaw==
X-Forwarded-Encrypted: i=1; AJvYcCWJeOZqQhlvfjoA8e+24ZjGSIRWu8BPn75Xpqo539U8F21uYHFTtNdawyS+5WG4yNfSLtd8m+l1LYUBRQlm@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoi4GZHHnmJ1dXJKqu8ynZlsAh06VdCBDbe6Cd39gL2vQqgt7
	gW3dJkIvmjRruODbSLo5T92p+pNw3pH5gP3Us5CRsrOmfmuQPDvaeP8dNwrxJtFhCTrDDW0TIPq
	uRCd780OSYXzTgusNYokXVDKW7QLuidSDxvo8u8R0O3EBRIecE2U7/viHxxezchR1IsNA
X-Gm-Gg: ATEYQzyuv6Loq3eHIUzn4Yx/08SzxckfXb4Eqo7rx04xecaDdg1tskIWcr6A9846XZF
	zSssE5Ab7SFSeti6HOfvUX+xERQrmTzlNYOJ7icM0hD2T0bMJj+5y9ZbP3K+992xN1ymYtoraAO
	oOf52LUiCVn/jFDrrsiDDuxpcPF5XrnRZxKXR49fhMomZGfAFCdqfmzu42ZEYRq6NQcQ+aMqkJc
	O2udpEUPlrkQFPHetJ+3IJS3qnlxjnCpavbe/3ZQyPbrZqVCwLth0slJ46Uk9Kv4SRvz/9+fPAp
	CtAU1EIegn/F3azuh0pf5vftXXEleSjYiSpRdrVrqa/biVxcSUUbqkMP8kb/jdj78lMmkRJP3fW
	Bwyuj56NebWg+vc8+hlzOo762fgUTyOj1gHGQ3wt3GAV3lsiN98U=
X-Received: by 2002:a05:6300:668a:b0:398:71b6:33aa with SMTP id adf61e73a8af0-39b9a08bf3fmr2812531637.64.1773829842389;
        Wed, 18 Mar 2026 03:30:42 -0700 (PDT)
X-Received: by 2002:a05:6300:668a:b0:398:71b6:33aa with SMTP id adf61e73a8af0-39b9a08bf3fmr2812500637.64.1773829841903;
        Wed, 18 Mar 2026 03:30:41 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741dfd4090sm2146786a12.0.2026.03.18.03.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:30:40 -0700 (PDT)
Message-ID: <24d4926d-63d0-479d-b938-6438364e9998@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:00:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com>
 <do62iaopjcahvn576gfcdbyo4yxudf4uit2sbifvjw3pwrlb7j@higm25fdesk3>
 <20260318-aboriginal-peach-bird-cacb8c@quoll>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260318-aboriginal-peach-bird-cacb8c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TppI2wsz6nqP8MfPT-GHsqCcGMxwG9AR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfXyJ+u3OsGeGmM
 kFlFklabDbrMcQ4Hazg7e5nid9LGqWftJZ9hU9JuyYDrpPXs3hyhVqUYZhBB4UlNCw47cjDiIZB
 y6Czohybu7uVbKPTWbTlXIQhg6mXaSnK8v6sAnGe4CySD2pJrTw5iUDarOL/vMAJeZbHUDPEXJ8
 KGw7x6RNA6r/Ba4XWQvfbCSOIGKrd0qwDg2HJ9+dJ3J3sUHQKmMHZx1L6SwJeNV3vGFyoodXn9m
 6SMMZ2pD65WRgH6NqhsqbtH6Pl0BCSQZKg+Feo5MYChl9GXyKBQvnFVaxEpHzW0kf/XOZ3utNxr
 RYvOwOrTXeuUEMWtF0qbX4rh0sL6KRFGQKFP3js9DRieM9lOlyTV+fMbZ46yVMOh6nkGWm0ph4+
 jC6vAv2UOnD2CH2KoDbg502NrYiNHlmCyMWv2uDYGciQMqBeAXPlBEAYJbrIdkhIkxX7PCQqiuG
 k8NAAPUBoNN5CMvgLOQ==
X-Proofpoint-GUID: TppI2wsz6nqP8MfPT-GHsqCcGMxwG9AR
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba7ed3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bjjNJb0cNGASWl-KbwMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98396-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 418BC2B9E85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 12:52 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 05:12:36PM +0200, Dmitry Baryshkov wrote:
>> On Tue, Mar 17, 2026 at 02:50:40PM +0530, Harshal Dev wrote:
>>> Update the inline-crypto engine DT binding in a backward compatible manner
>>> to allow specifying up to two clocks along with their names and associated
>>> power-domain.
>>
>> This should come after the "why" part.
>>
>>>
>>> When the 'clk_ignore_unused' flag is not passed on the kernel command line
>>> occasional unclocked ICE hardware register access are observed when the
>>> kernel disables the unused 'iface' clock before ICE can probe. On the other
>>> hand, when the 'pd_ignore_unused' flag is not passed on the command line,
>>> clock 'stuck' issues are observed if the power-domain required by ICE
>>> hardware is unused and thus disabled before ICE probe could happen.
>>
>> You can simply say that ICE requires these clocks and these power
>> domains to function. Accessing the hardware can fail if they are
>> disabled by the kernel for whater reasons.
> 
> Yeah, mentioning clk_ignore_unused/pd is redundant here.

Ack.

> 
>>
>>>
>>> To avoid these scenarios, the 'iface' clock and the associated power-domain
>>> should be specified in the ICE device tree node and enabled by ICE.
> 
> And this repeats the first paragraph.

Ack.

> 
>>>
>>> Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> index 876bf90ed96e..99c541e7fa8c 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>> @@ -30,6 +30,16 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: core
>>> +      - const: iface
>>> +
>>> +  power-domains:
>>>      maxItems: 1
> 
> 
> 1. What the DTS is doing here?

Okay. I will add a description of the expectation imposed by this binding on
the DTS in the commit message of this patch.

> 2. How did you address "with explanation why this is a fix thus why this
> should go to current cycle." - where is this part?

My mistake, I will explicitly write in the commit message that this change
is fixing the issues caused by missing power-domain and clocks in the DTS
by preserving backward-compatibility for old devices and constraining these
resources for new ones, i.e, Eliza and Milos.

> 3. Where is Eliza and Milos?

I will merge the unnecessary commit I introduced as Patch 2 into this commit
and explain that we are making the clock and power-domain 'required' for
Eliza and Milos since they constitute unreleased ABI and can carry this
new constraint.

Regards,
Harshal

> 
> Best regards,
> Krzysztof
> 


