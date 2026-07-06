Return-Path: <linux-arm-msm+bounces-116683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FUy+DeZoS2rVQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:35:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC370E2BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:35:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HhXwqs2Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VpJ5hf7L;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116683-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116683-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D90FA32964A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ECB3F58CE;
	Mon,  6 Jul 2026 08:22:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788F3F44E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:22:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326169; cv=none; b=rxsfkMDtFA5wcXUuIsTXP0+eWeraQ3dq+u4HzUTV1oEjfiQrp6U9JRjtKSu0JttNlhzOKdyhzRGZd/wn9mpGF/DTrG8P+zMEYjVrOXDAvDtPdx49h6XuVnYccDfNteU0MA8541JdEDbPkscxpZfKAbhAHgAkXYyHLpRIZSHnJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326169; c=relaxed/simple;
	bh=NlLZ81o1w9dv0DLwq3X7CQmJrz4mrvnag1JZDa93YYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQ+KRwdr1Xta6lso1AR56TY4GOFxq9ar8jjh+MFar6pcAtDCrpXRlTN9coi8h+vp1NoljOpeiKK+yjupV3xmPrs1u1TloG58+RN7FUuCAYEk7DT6C2PlPlOv96+EmXbW83bWGEF8N4sUnZgwHk37w57Wb9mjnmqRw6Izl5yoIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhXwqs2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpJ5hf7L; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SjM3593985
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7kgDUzxypUi9Hv5ERYiztltz8pc1iThxnESL38uqQ0=; b=HhXwqs2Y0ZsHrIij
	AaX2/c5hNOoJABzdK+vgCCvIRziXAvqlKp+HfEApATvvzOlO9sVSrJzcIZ0gLubE
	xqBeUJ0Ot4r44/oeqRtbFiGUFOsXcI+24UltpPC8iakeix4jwSEjHg8KAnEkv6q0
	ozKG0icp+Jc/2I2XUZE/dzB6e16ku1SYwiAYd0gXoUToBKhts5fkNiuRxdirmiz/
	QNZRC3Kl0sJ3Flfz8XAYdQzqc7irlqPYhDO69z5CHlRaOpMjJSVOtugLSl1SguJC
	JU+WCl1umXijhDcuJFyUpO3C8cubO1nyzL1Mk/Ng7Vsc/y6irFVChjR2wthlmyKx
	O74cjA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwk47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:22:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847ad67cc51so2728228b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326153; x=1783930953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7kgDUzxypUi9Hv5ERYiztltz8pc1iThxnESL38uqQ0=;
        b=VpJ5hf7Letim33NLr/7rF/8ya0epFlrlGchbVfmPXNlRaCtaoxrt+O3cuXQq7+ZyNU
         Sw9Wmd3wDrC4DqNtMgd4zDSk8DNwBqqmt34BHvzaeRNE7X/7diizW0q4I7uPU5BG3t1D
         YqiDGP4yUtR1k/f/PRurbO9ntU3EXOQM2nd8hBTKrSr9Qhyh4PNZIoc3R0z5qMLSHrKZ
         ysFMez6awhOfOEsPs0Qoel9Y7FpDJoqGx1YM8KvQeY2+7Ys4pPydC3w7eOs114iO72Lq
         xX+34+WfWzwLikXD6fEJxbikYQTyNSaEmQKGL8y7j3pQABXVE0zRe1MB1q8nxGtZPmSq
         tPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326153; x=1783930953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7kgDUzxypUi9Hv5ERYiztltz8pc1iThxnESL38uqQ0=;
        b=tDUIePnXRRqk/zuoRxaIV6wDtxd+zu6/LPNQ9rTLot1Iq9uF1JSDjOIDGSDIQ0QHnN
         mJk+byXdD4t/10ND4koqVbmJLDzRvJX/2NdJwBbD+8RnDsbftk9LzkBAh7Vr1x1qvgNY
         MDhSWcOv0BrrltOeKM3AeI8x1OghC0Y2SsoCNkStvbJb09xK9uau88ZFeTMy5gTipera
         HeQ2/ZymksLHnQz1C6ckMYAIx4NOOtTPDnM2rIaVB4d9NjyfkWcYxpy/Qx9VBSVy6+V4
         0vBVbpVIRI3HOZHi+qNoDMhZgA6gSpnu5g3Jt1gIsB+Q8UK9GX2HTHlDqh/IKo1GpFLV
         A0Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrVczmIPSvqJiy4uFHxlVuODLnKFh5OQONgUMUTDdBfxwd6P59f9VQZfDtxlxQfWz/1eNATSgS9dz9sMJQv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi3m9STcmK6trmXBDWSFGzQHC31BTq2gG6le3jzBqbPAVhdjiE
	ozynvEgzixjndZbMBbu4+xNVpF+s9bKo5XxK02VxNF/MbQ8KliMCRpgIK282ubXYT1RLCQTbyYL
	NHJtH4e5rPmNbhTNoiY9hQKMQvSLHEjTMOzmQLWkgpP3gqKl1IeOr4D8uc4AiK2Upf5NB
X-Gm-Gg: AfdE7ckOvYJYYKzOtYIkUq4NUYw0tyYSm6WLXv3i1F3FED/H4x5EWXTiqZDow+n2Hzb
	jmk6yDZiK5kTI6irZX1pjB4/ViuZAHtAwViFuytAzwwe4ZiAJqxlu+FLzDek2Kk5MWioJk869tb
	/blRfvCWSWRXuTzvyInqnr/S8CUe1nSPf2ZZvo4pNXPv5odCa8G4sH6w3szTy0tMV8sWMd8c/Ma
	hPO7/Gtkv8LTAEaWHSQTod2S8xhksAtftNDw18BCze7DIAQlcvSvlEUkoWEayHVHtU1Mo+smYdh
	RzgpgMYNYw7kmO0YlDLC46KPvEL7selNesvss4VcTIL3aTHK9FiC6WxAO/8PSaA3FaJvnYtGqe2
	8EFHeoo1Bhhmp45f2pz8WsXv+8iDop0TaxqLAFMzTh86yJUHmxg==
X-Received: by 2002:a05:6a00:1254:b0:847:833c:6451 with SMTP id d2e1a72fcca58-847f6fda4f9mr8656837b3a.57.1783326153113;
        Mon, 06 Jul 2026 01:22:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:1254:b0:847:833c:6451 with SMTP id d2e1a72fcca58-847f6fda4f9mr8656641b3a.57.1783326148965;
        Mon, 06 Jul 2026 01:22:28 -0700 (PDT)
Received: from [192.168.31.103] ([152.56.16.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4986bsm3304973b3a.29.2026.07.06.01.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:22:28 -0700 (PDT)
Message-ID: <b1299875-9fda-4477-b533-f491f19e8a2a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Krzysztof Kozlowski <krzk@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705134619.4030745-1-aniket.randive@oss.qualcomm.com>
 <1edb643c-1d09-4ad8-97df-66c86e6123c5@kernel.org>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <1edb643c-1d09-4ad8-97df-66c86e6123c5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b65c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hhhz2GjkF5S+8y/bMxhNDA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CKx7tiaC2mrULMmJUrMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Gtxdm1te-sV5VxdGUqhTA8VmaWwOq5BG
X-Proofpoint-GUID: Gtxdm1te-sV5VxdGUqhTA8VmaWwOq5BG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX4ezcpqw1WjsR
 OIWAox3Y38s4riUsba92lis7e3+3krgiqWmt+NXyVNG4xbl2+EwYzr2qbL1UUOlxzJJX0dqyHJP
 ICkWn3wTsF07kVJX6zxdwDdEeraeekc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX/h7UsfcK0r9H
 IuVO/GwqabgFvTl4DHLGC0vbEk/N7z95bCNPUlSwfP5bx+ViFZxmi123tSRug+0BmfmOcQqtiaq
 QLkOZTQr/ZBfFTWCHvworvIy7yTkDdaCbldnYe/71DkwUR9T/zm/MApvBN5anPUZjTXQBsjJqx+
 rvv4K4oSFpF7TEvDJuMai4ap85njBmfgbxFeFsiNrn8eAHXoIBOt/4p8L57+DfXXNhEPkU2AXng
 Pc+IRYFdRd/obbYCUAUAeBUTsgJM9pR09csNOnVT51BJmjz5tZg7s8H5k8mp9YqNS5o0Brxcuu5
 8TezGIwRR3t5oSDCsluXTC2fjFD3LhD42jRhRadShoqsXoHBA0+SEfBPY3SnL/CUl82oGJp5grs
 9Gg2fR3sySAZeZR82e1zHhHk4H/T8P+mKNJcSfGCIObBU6uUtL1+x8ri5IC49JH0OcEJAe9UScF
 4PDsfuOKjf6tzU3P8uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116683-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DBC370E2BC



On 7/6/2026 11:28 AM, Krzysztof Kozlowski wrote:
> On 05/07/2026 15:46, Aniket Randive wrote:
>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>> regardless of message length or bus frequency, causing unnecessary
>> delays on error paths.
>>
>> Compute the timeout dynamically from message length and bus frequency
>> with a 10x safety margin over the theoretical wire time and a 300ms
>> floor. For GPI multi-descriptor transfers, use the maximum message
>> length across all queued messages as the per-completion timeout.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig       | 54 +++---------------------------
>>   drivers/i2c/busses/i2c-qcom-geni.c | 37 +++++++++++++++-----
>>   2 files changed, 33 insertions(+), 58 deletions(-)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index faf146441f97..841108ae2d01 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -32,7 +32,6 @@ CONFIG_KALLSYMS_ALL=y
>>   CONFIG_PROFILING=y
>>   CONFIG_KEXEC=y
>>   CONFIG_KEXEC_FILE=y
>> -CONFIG_CRASH_DUMP=y
> 
> 
> Irrelevant patch change. And not really correct - you base this on some
> old tree.
> 
> Best regards,
> Krzysztof

Please check latest [PATCH v2] i2c: qcom-geni: Add dynamic transfer 
timeout based on transfer length and frequency.
- Aniket


