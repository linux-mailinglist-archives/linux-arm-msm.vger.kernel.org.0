Return-Path: <linux-arm-msm+bounces-93986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FqJK5yZnWnwQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:29:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7A186F81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA0F430A8475
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A812537F737;
	Tue, 24 Feb 2026 12:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffwSI+qs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoXStBNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2ED396D11
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936135; cv=none; b=cWwlg6BN4SdPiIrThCMCUMOZQ3JWGDcQXYjlXGJMCTl4dIVggCQBzJSlCYjWaCQ1UE+mUFp6U+6Z0b98RoVFRpQCkWz0Z1QVownKkRTmjX/kCziKf6RWAIkAYwJLZl0pdQ2DF3k409zPfIqjKq+rkphrkI46IY5QPRdTZN1kBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936135; c=relaxed/simple;
	bh=ylJd8bPN+y8OAcV5u35DXNrgBg9iek4M/OiODRPo6Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL2H8PtHZVnSB/yzVig32PP2JsRgzIdMtPSDItR/t1PDmOnorL7lxgX3hFJmjd8Zn0220Z0ChNFcDVRBuKYL7dqQZd0YukhphttdaLYCYez7YlDNWlNZVSArq9aUsdhnjiMHGVkSfHP4weqF2OPhY43YcUzsWM8cXwBzY/VcZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffwSI+qs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoXStBNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFVPU2006500
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyW4HtjLNOaD4aJTtkqV12S2QkDM2E43ad8MyKZlMm0=; b=ffwSI+qs5wScSKZn
	m2XXS+Kvv0R78rUtAcQDJvXEhmZRgz4VJCBcooW3EB0AYLPBr3XPURxdj2WZVhUI
	vjPh8PGy2v+RPuJsNGt7kmHR2ppagQj5L4g5/W6HL8joIXjjmhcilONr7UPZjPQV
	6n9VFvqNAI3up7/OyVZQ3kWX4XiwG3CetmoqWFWSYiBpjR1zR4dxcMgBWmaZqgjF
	S+mZ/zLPD4KzSsF5fHJt0sIqLQ6XJVdTN9kCqZRGUVgJDb35CbeMsu9mHaiADYhI
	DHPPWYIHW6i06QMNFdiuqSeJRy05HSL5lEaCTG9xlq3Y/jrOXj9FXNKwc2pA7fBa
	GGr1AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4569eyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:28:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so572063985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771936133; x=1772540933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyW4HtjLNOaD4aJTtkqV12S2QkDM2E43ad8MyKZlMm0=;
        b=CoXStBNGbRAtwYpMq81hPkh7awbqvYXH8bqGileU0DR+5zTwISizH5hit5rceoM0dt
         ++fACswwgFVVTcZ1BjGZul+qzLemf7Le+W/XIfDlbqHL5cjYWP2G8YmLcgF9iAjK57L/
         7O4FYpGZFPNsp1ZGLmlWIMSpRgiLGNGY9afxn9l5EN7fl9JFntjUBlwwvbrezBtLg/5l
         WQhW7hD3X3lz1eDvMDNRwD37L8EJNUh+fHdHHigNX0NXaUCJXO2zauS7gBt6K1qL1rjh
         Yr+QuLxaXx+Ol4TCoGpjsK9OvSAbVxiWvf8naPMLCdAfTQgBzZNbQRgiDvEtRCwiltb0
         fT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771936133; x=1772540933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyW4HtjLNOaD4aJTtkqV12S2QkDM2E43ad8MyKZlMm0=;
        b=aFosvGnNxBbOBl2pBey8LCP3dzjR8BuLXmXhskZr6QAdOJ0+nO6ji6Cdt8rjad9N7I
         cG+uxx8K7nIT9egSH9OD5dpSrt6b4yqkQ85WPuhTktUGseFKqRDEckRyrf16EAs+W9IQ
         +CrWl1RkkbbVF9BVoocwDEAJ+VpmsrhzcrHJkBw0EUkjjiWLleF01yNHxUuM/M12BJPG
         XH+vE5b2ihRq9j0bKZlgbsiBMZ1BxMEvSSEjmGANkpqqnlqgje3GhlIoCLgvrP9jfte0
         lgV6G5nkouxVqY8rpe9Nwb/UQwo62tiLNei0E09k3pXcPW0+v+Bz8vJLtZl0ulJxuLRj
         DyoQ==
X-Gm-Message-State: AOJu0YyYpjYEJaGhVRgWbx9wCxLbQHHz72m2eR25Eo2e2NVUDr4JKXqS
	EWvVdClQdFNnZ29LFU2S/zI4W5bjJ3uEsXH39v7DdbOr9+5/OZSNmXm1cT1cJUFZDXsD2If2PwU
	15HTudHaio5Sb7FfdvW0981/ovvD4gY7jpIuPw91fK0iwMcYvGVKihnCwiNGRVUgqQi/f
X-Gm-Gg: AZuq6aL7xmEGFWLYvA+ZttSvh65ltA6SaCYeKgr7WiFmdXbFmY2FYshpenNfFOyE4FS
	8u0e31/4DITVuxK6M8hWM+Ek71qloQxYTU7jEYAghv3rg8qq5c74r2OWn7ahbaHbEUFpnxSDOzH
	pw+DDN1WISrm4aW7mFZVph2j3KAaPWNQYCGYrieQ6iwXGWcnZaTDK+Vim79R7iOtuiYFmSsG8Cq
	griNYKkTYNE7A+/ptG6zykm8IVK3MssDq8txjlxtbMBsGbpyJE/Z6grTFvaO6N8K+Nlq2kN70hs
	NzUnfYL8vdzM+gKSBO9igz2SZ9d5seNUxZ3yJl0JNN7H7RVZjUj6kF2lHMOZq8KxYspFv+j8mhr
	pWL37OH/0AGPCUNCr1s7AxKa8BC+yJZ/8cPYDOJrx0czZiNuAnSOOaoqyrkpMLASFvNRYGfQP+M
	3zXOk=
X-Received: by 2002:a05:620a:28c7:b0:8cb:47cc:2dc8 with SMTP id af79cd13be357-8cb8ca4f8fbmr1109186985a.3.1771936132706;
        Tue, 24 Feb 2026 04:28:52 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:8cb:47cc:2dc8 with SMTP id af79cd13be357-8cb8ca4f8fbmr1109183285a.3.1771936132117;
        Tue, 24 Feb 2026 04:28:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90bdf80b04sm93767066b.3.2026.02.24.04.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 04:28:51 -0800 (PST)
Message-ID: <07cb095b-7765-4810-a8e3-db2bd9ba6276@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 13:28:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9xih0su7D-3fMWe-GEyyyMlUmsnH8d8k
X-Proofpoint-ORIG-GUID: 9xih0su7D-3fMWe-GEyyyMlUmsnH8d8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMSBTYWx0ZWRfX1If5SKedQbY+
 ld9DmaaQvdMpyl+yG7zs1odGbtZGEdOWvXYhcDs7FUCfjOWXuJDn2n3Zl5dWEx80XUc6OP4meOh
 EJbGQfx5OeYn8VtKsIGLbt/380DMEJjIQJTNPw+SYokS/feEnDENdfuQ43tW8CPsoCz3cX5TuQl
 4syCli07r5PABmwLjckIGpiEdalvBqylmKKV80SKvTWxf1mRbbA+lfHlUdMO8yP64+Msu65yokx
 Rh8Rl2q6ekIDXTlNh4uKZralJ/JYD+g0mSR2ex5lR1uhvbr1dlOrsgMpJfyIXK6FvaTp3ascagh
 AqjxQGjZdpf+i0nm9wLc5ccCPlGy00TExtKv9+RL25xFfXyfI/clnTVUL+ilZwP7rksaoJ9T4Zn
 incnTZVce4r8r6SOhkPW6zmMvWLnlNpxya0r+HWNgXeoAqP+aRGNxLkzYmGUeuvv5dEfIdPWoPn
 6N19GRcwiw9hHZszAMQ==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d9985 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ryQpv3NTzVwweAL4bfwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240101
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93986-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a7ec000:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CA7A186F81
X-Rspamd-Action: no action

On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +		lpass_audiocc: clock-controller@a6a9000 {
> +			compatible = "qcom,sm6115-lpassaudiocc";
> +			reg = <0x0 0x0a6a9000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +		};

This should be called "qcom,sm6115-lpass-audio-csr" and should probably
have a syscon fallback as there's a lot of various magic tunables in
there, in addition to the CGCR bits. The clock driver can continue to
bind to this new compatible, like we do with the SoC-side TCSR on e.g.
8550 and the tcsrcc-sm8550 driver.

[...]

> +		lpasscc: clock-controller@a7ec000 {
> +			compatible = "qcom,sm6115-lpasscc";
> +			reg = <0x0 0x0a7e0000 0x0 0x12000>;
> +			#reset-cells = <1>;
> +		};

All the same, except "qcom,sm6115-lpass-tcsr"

I'm once again sorry for not getting this right n years ago, but I did not
have the sufficient documentation back then

Konrad

