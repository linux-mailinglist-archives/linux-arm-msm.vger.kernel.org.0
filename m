Return-Path: <linux-arm-msm+bounces-106092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKOYLYML+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:36:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D34D8B31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AC4030413A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335063E928E;
	Wed,  6 May 2026 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDDXqJCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxqLbY54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89F3E9295
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059976; cv=none; b=MX0SRwfKz4aexHiGeIuBK+pcF1/Nqt9djzl1kksmw/wiIAGgM79YNThl7IUooQbi7HdkqzXOmjq6tbahRLlxrYZ/lE5kmV7BTh2tUIJ6W8V3+V+2PxX/m6LNg8K6bYg7LAnawyz5AsaJ41pPM3yaODyPRGWtVmEu/UWuW8PcFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059976; c=relaxed/simple;
	bh=aCWCeJiNrXPS1VKbBYDxcuGhg0ZqyJcxbC3dVJWs0q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQRCzlMbvQNdNkl4JWOc+Xg1pwXVkNksovTk9SoQHfauTkZFGMB92THVERP0tCxHcoCzacnnQt1QCUrcBoeUBfgjn+1fRdK8UhM69CrzcX1SeCtGFx/E0/BAxi+y3oeuEPMyC9E0uLYueP+oDTG51nSyTP9GEOXSUm6u6EXtmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDDXqJCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxqLbY54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466aq6D248341
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1mTTk1pROV6By6vVpOchigpFI99l60HptIVVRd/8BWY=; b=NDDXqJCW4GmJC+xV
	ytI7UWkWgs+GHi0XRxzdQcbF6ooKOvhv6eJReSP4MVvKNX1pIEF8PnLHT4en6Gd3
	mZNN34yMncrH74RNnndTZPzVpoNnOjbS/YER28gswTS/mFrXNOjuhEVWdP0SNh0X
	Iv6wLXSIT0jSkUd6t7HTlxbTsJxV5SfiN1B5ueKTLQq+kpyy9Xq8uI1bgAy6DB9X
	BJpP42pxYA/uy2Ebv56VI3lN4TsOAKlSgc5hP50QAoSxjAoHJ197yY3uBAXxNaVs
	0OaT7u3sYoL3dT0hHI+gpGEe7PcyRe9arHTiL+4KgnU6565rz26K11yCevuc83y8
	ihcpHg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43v58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:32:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa366fb79so6284845b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059972; x=1778664772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mTTk1pROV6By6vVpOchigpFI99l60HptIVVRd/8BWY=;
        b=IxqLbY54l6IydfoaVJUwJxzYF29yHUEi0SlRGbne3ldV/TnTYGdC62yCs4MjfWkevS
         QqHl4k01SbwY56m4LQi1HMe+eU7EzRfKgQaerjtrEq2H6WsWw1NLMCgRdoVmVuRAL0Py
         Ytas9m9dCzwAKtUlcdT3EzaeBsIVvXoDVuZ3C9L4VIwgHKkqOu5/YJVnoRx7N4oFcEDw
         mradrUcLoT6DTzwbYfSK0wbisXaj1b4XNMnR3efKZtsyWDCSqy2dffR8QA3GZb8hTPNL
         pjlj7/uNZnDolvRlxyJ08X8IaupbqhGjfs/oPjujQoi2fcfEfRf30ycy6VSvQoOX53UC
         R9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059972; x=1778664772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mTTk1pROV6By6vVpOchigpFI99l60HptIVVRd/8BWY=;
        b=RtC7lQPgSz+iV3mBMoGIZ9zjfiSdFyAH+aS6oziY8t7dsPO3xxAX+YZZqHY6rO7ntw
         5JGmgljXlTZKEYUD6UeR3hXbFM/r9Eiub6vBttJbaGsac88UCuz2yKSelOpLOh2bT/wF
         anU3H1fwgDGKlnGmh9l18qHszt/U+B8FQwdQ7kqog96GK1LnoRo/gzHq9A+MPMtRvDtB
         TneP6k1B99Z7zroWVy0WPH4NOJRAHvl9ecj5YLjkKOPtkQYfGzRSvdifqDotIjLxPuOi
         6yTYVpDV4KlpG0ZzBjfabCwjOwLWgJOSX9x3PwF6hT5xue9C2qTUfXLfwC/8XQiTZM69
         gHmQ==
X-Gm-Message-State: AOJu0Yx6ndWyHVZjY6MvqNYTZli2hEie9GiLNGDICXswSmz2PXd64rWR
	bV6ohTiWjx7FJPUP6cRWAF0KcOcqwXAsqptWdwThOfmmAbojF9OkXcGnBjZYy7SJ/gUcomLOMi/
	ZoF+VHg37JQymzZ215Nf42Tohs8vnjXAk3B9tlCnr5DcdPkrC9Y8tOe9s7cNfLe9//WPl
X-Gm-Gg: AeBDiets7U77mShKSVnnPwRGrBvH6gbwxc0jVTrygzWQVludmY5XCp+WxkzyCUaSWHC
	QFYIGZ+miPQ3yZj6tl4Id7AUKM4zAqBldbwNCczrIUIl5HW14iQR9w2H4yGSDAHVMEChMPJnlKs
	+sSv7wXZHOGx1TImc/uUFep8vvSr45nlxWNQ5o2LsGZ4yI3snDL+NvRMoWULEHC+BzArA9N4cgX
	MKB+w/D3o/6SX/76kZTV1LLmkjwLkAZctDjvFu+wFW9NJSl+tajXITDf8r7nEOiRIPmVqs7JtaA
	uCQ6Ixp5emMqoCnZHcQi3sE0Pk18a5oXfVM3Zk2Rt0pgIlnYRrktDnWY9voyjT2MhB79vvmvPNb
	bMFooiW7w07kCJ0+U8ycKnYPE0NWYh+dTCdo6ahNq/LZDzQ8w1uTaa+da1NYocw==
X-Received: by 2002:a05:6a00:428c:b0:82d:162c:581f with SMTP id d2e1a72fcca58-83a5eb3943dmr2408183b3a.48.1778059972349;
        Wed, 06 May 2026 02:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:428c:b0:82d:162c:581f with SMTP id d2e1a72fcca58-83a5eb3943dmr2408142b3a.48.1778059971853;
        Wed, 06 May 2026 02:32:51 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm5895467b3a.20.2026.05.06.02.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:32:51 -0700 (PDT)
Message-ID: <5864c10c-5ad5-4896-a503-c184f4ee7717@oss.qualcomm.com>
Date: Wed, 6 May 2026 15:02:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fb0ac5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TjbBIv4-FJWQbs9x9KIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MyBTYWx0ZWRfX4TEuJduDz0a9
 M9QqsCvefbyMIk/+T0eq4qC4oafNjFuoBuzB/tS6NhWgqM0s6tU4vrUd+uAHEMDmu/iN8ua8TUx
 8hl54NBE1Mg3f2cRJkxMopduJRU+dWE+63IMR73tKvigpEUSo3tMMv+wu7698RQpoP5mFzl1PhE
 QCcn8eoh5Mrdrjn0eCHgP+HhoGSIIzqvL4KmJxTgCY8ThOytN4AxehCYL+Vb9R1UEYq+Ay+r0XZ
 Jv5hpMHU42MLgegBbaJ7FEoadcMKsbQtbE5Wfzpgugs87O1rLKjIBjvrhG4ToRpKhMvWPz2yM8E
 Myas1XIHBEBtzBf0mSwfr2TdhA5HQydqfJjqq5wdcynTJcXDxkxMe8hbkBFY0+SjdjhqfUKMMcB
 fY4MAH6CvYxbL+T3iULLccDFHZFw0yYiTWTXcmWQXJNW4069oa9jgdHda9Rk8KCNP9psapKoea7
 PDK0XwNZLeD91v4WK1A==
X-Proofpoint-GUID: FULvQjLY2IKjRAeL6L-q9bCe5uE0z9E5
X-Proofpoint-ORIG-GUID: FULvQjLY2IKjRAeL6L-q9bCe5uE0z9E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060093
X-Rspamd-Queue-Id: 618D34D8B31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106092-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 24-04-2026 14:05, Harshal Dev wrote:
> Glymur has a True Random Number Generator, add the node with the correct
> compatible set.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

root@qcom-armv8a:~# cat /sys/class/misc/hw_random/rng_current
qcom_hwrng
root@qcom-armv8a:~# cat /dev/random | rngtest -c 1000
rngtest 6.16
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.  There is
NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

rngtest: starting FIPS tests...
rngtest: bits received from input: 20000032
rngtest: FIPS 140-2 successes: 1000
rngtest: FIPS 140-2 failures: 0
rngtest: FIPS 140-2(2001-10-10) Monobit: 0
rngtest: FIPS 140-2(2001-10-10) Poker: 0
rngtest: FIPS 140-2(2001-10-10) Runs: 0
rngtest: FIPS 140-2(2001-10-10) Long run: 0
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=1666666666.667; avg=54945054945.055;
max=0.000)bits/s
rngtest: FIPS tests speed: (min=186.995; avg=280.435; max=334.623)Mibits/s
rngtest: Program run time: 68912 microseconds
root@qcom-armv8a:~#

-- 
Regards
Kuldeep

