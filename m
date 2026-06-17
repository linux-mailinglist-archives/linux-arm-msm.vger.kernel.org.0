Return-Path: <linux-arm-msm+bounces-113537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ng46Dyt1Mmoe0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:21:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD16986DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TPfnMdTK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QVYGQ/2C";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34434303DB62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A94A38C2A7;
	Wed, 17 Jun 2026 10:20:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1BF3F54B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:20:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691647; cv=none; b=NbepTKrXW0LaNIjhHpU2rTyiSXEf7KUnZLH8tt7kw4inYPBxyzYVg6jt+uMCqKZ0vMzNl6qo8MszP2sweOsUylpShvifbpYUBRpjJEYnTysv3p7S9X6tKfhmYHHTO0R9IlamilLAJoZg2YE0cZhvfVcHtK/Gotkc5QQWQDMvlFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691647; c=relaxed/simple;
	bh=WuP5u/ZoxribT8PGwz8TXVGN3HwyXXM3wzG9TYRQ4K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJizuHnAjlX60u+5E3rp2+/0EmIqDJSiLdw8ByaB8Dm3pHxlIF10oasGBEnadsyrP6Bt8vJc6Z/tvSGbdFuokT2AjCGB8mgqxQPhSSihVCIcrGnbZ9ezXfl4dI8AYRLYBkhCCPmrrKa+5DQcQtiNS+99eGnn819PGkBJf8Otv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPfnMdTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVYGQ/2C; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8ULSS239815
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cg2K5gQ16+6GwG5qTL6Bdl6HDq+V+fzBEDj9yIQ9kPc=; b=TPfnMdTKWtxk6qw0
	8RCLsC27+b76QXs4DXMpso2qS/qnEb2OYesHWBGHbticyKFhm+RQOhhUfb3s/6QH
	z8HmIpsFrNYkPVP353XvME+GemVM7/NC/bZpby7DPNDebKyQdFXIO0Hz8xeKneKt
	w2pC6bS3Bv2Pw7fbPpOqIQJkrg2ADYUisP6OBxfHKosY5MIoUwOVDQCBPEPQiElS
	vNHmoltvl160K9UYwhc47RJxlku7VJSWUsqej/ms1mUXlbJTiWDhCQM05RpcbbT+
	ib8oScklN/lcu2qUKsYH1XP7aOO1SRS2Oz+CF9wbhwzdkhS7Wh2kUUrH5U+S6+4h
	ahFddQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjj2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:20:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842446a3851so2907377b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691640; x=1782296440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cg2K5gQ16+6GwG5qTL6Bdl6HDq+V+fzBEDj9yIQ9kPc=;
        b=QVYGQ/2ChHpHQygK8YbRjhyfARzrQ6ipbQdFaKEGmU70mW8BjQ+r4zybIFgUZOWQbb
         /Q6SrPx5NUlz/KUNWZFy0b4q5nhbLehi0C0kw1ypYO3fayu/v4Kb6ulkpxpTZ9SBjp/q
         XZIucW6lPNteu+4TTdqrTVhZzIAQ37eSqaELtec69o9rySfBWC7oI2/X87/uWXGvZdSV
         NDR0rbdotcbE5XSk9/Jpfy7sI7tI+QnKnuNqwmQHYfdstBOVnnQEf57mM5bkDOXoLOwG
         B64dtG0H++0RgJYe1p++M3aRzV1FhZDHk9a26U7H3YrnQ1DIeoISRg2acOhZFWnhbIPs
         lQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691640; x=1782296440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg2K5gQ16+6GwG5qTL6Bdl6HDq+V+fzBEDj9yIQ9kPc=;
        b=kP5YCxA7l6s0tjA3vF25uvy7BauTSI+kf6Irz0YSfuuxPywT2E1poxlsAI7e7EeP2m
         mXfrgG2ThS1mcdoSdm817/ov/kySUVWU7CkkF7R6Cj2y+zvl5pz1d4cBLqpja6oV4msY
         Z+JoWJQ/hbBARWterN5gEM8jlP1jrtgtT8dCFv6+EgZRJOOPfbPQAb9fSS86C2Bbnm9G
         KUsQcirFV6Dxa4p1uTNuOTzLhFGINngjuWS1+Tr/HXs2woGWEAISEbpdZRobBdwkPsgo
         IXzebd3vbPw8DsTy8MymMv+gnWXQnHeiBjjZbqXi1/yrIxgFlI8pZRvM7uvF+NXcy1iO
         2o6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+vO/YGxlFb2GubLxiw7oRMq3O+iSWvp26uf9gp2F579V6+zLkDWHFY4igR0hShC9SzciYIqU/8jHzOlCxW@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWWz5bYcvCyn2UafowEICSoZakjiLuF2+7g55/Vhm1fD+XCjB
	RQaZMRkvrO3XpSyD0kei2yV4ePDNd4ynkLJ9oy1F8aIDLEMykvKO4lmdrGV3zOZ3T1bnIaIReH9
	WmB22UOnsw/3+PHu1+iqLNwyULSD8c9WM3M+6gIvv5EXYU2nULtQsO5oQNEOx/rYh8Fsl
X-Gm-Gg: Acq92OFKxrEw+Wnu9p0aw06A3wOR+PRwGgUIj60RADFi/dG7nwvUPANrhSbBxST8uYQ
	gel6L0vUkNimrW7M2t/3PgRhs5igChfuK9hnpFooG3VBdUK2VdSEqX3YdYKlpH5pMtXRKRk6dwN
	m1DVGMc2FplPS8sSm57ZWJX1LMKMekZRx8tr+1XrrKydWPclQ6SeiYducMf8S57yvLPEteEbV+l
	Yjevjcis4LpKKK+LesfdoVG+SWHzb4jJpauSK9lrsxeKjbboenYCshUPawTytowef75Xz6iomWM
	FokN1rmxqBdND7rdpwGYX3+lSxxnf9Bp79y6UkkHYHHoPIiiyThmYapaYo/7TLSYcZav4UAPyo5
	W5NbwNJ59MrutiVmV3P0j/hFCEzx9kkpz+U2GpZe/pBOMwidHGv8qSlmsn5+sGzYZv4n4rOylqM
	/vah2o6w==
X-Received: by 2002:a05:6a00:1397:b0:842:540d:42ea with SMTP id d2e1a72fcca58-84524495c6emr3011233b3a.19.1781691639641;
        Wed, 17 Jun 2026 03:20:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1397:b0:842:540d:42ea with SMTP id d2e1a72fcca58-84524495c6emr3011203b3a.19.1781691639167;
        Wed, 17 Jun 2026 03:20:39 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84531dbbe7fsm370446b3a.14.2026.06.17.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:20:38 -0700 (PDT)
Message-ID: <84686669-ec39-46f3-ba28-b6180e630964@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:20:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony.truong@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
 <ai8wxequ5yWxoi5H@baldur>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <ai8wxequ5yWxoi5H@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a3274f8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bMOh1Y247VvR-8fTSPQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: D4wIsO_VTmF7Z30KiqSC7L-bDphPPwsS
X-Proofpoint-ORIG-GUID: D4wIsO_VTmF7Z30KiqSC7L-bDphPPwsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NyBTYWx0ZWRfX3c71Iy7VX53r
 hAFCDb97wNYxwL/iJzmiNdU34MyIqNkNf2iBtqpddA5yIJTuA9V4a3u63b5yQNd/HOrv1ePggdF
 9d/UT9VniybyVSPFU25rgi+qSPL375yjpz4WFB7KMLkcbrCSXUFhRIKuRLdt1dutxaYPZpQBt7e
 JtMwJzFCr/qGUByItQum0lDLAn2hKOjSKVvGmaKpRNE5k2net8xWOrUf10MgZwOsY636aTZ6Nmm
 uFqtCKZWxbpzRI2WuyCIk8/HYLQqI87xP+COQ8+b5KpGINWL7fUEKFATHiNCGRRK6qDNcDsXFHI
 0aVPQZyGDSwFwAOdw7rDyTzO8BPeT2a/RMGHIP44v6e1wyASKIvY44vNs6/1U1gnGLEXfTw2YEZ
 uCN0WnIUSbNO24F6K/0OxQl8Sj1Tk89V/KKsjsGm4xiA07XlDP8mZSYhYT1e2al/FOaKeL0Y1oa
 FUcvEFIBCw6GK2u7yhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NyBTYWx0ZWRfX30WCcmwxW3qM
 Onk9Pfp9dPKbLgiXLQLZ7yw2eV9HP9QPLye9XSqorR1cg+6xXXgU5ORHG+1jhqvhm8yCHfX0XgF
 UXL83v+E9Hj+Z2o+upf6+q5xxPvWNV0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113537-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tony.truong@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9DD16986DA

On 6/15/2026 6:54 AM, Bjorn Andersson wrote:

> On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
>> glink_smem_rx_advance() wraps the tail index with a single subtraction,
>> which only corrects for one full wrap. The advance count is derived from
>> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
>> if such a count reaches or exceeds pipe->native.length, the tail remains
>> outside [0, length) after the subtraction and the next FIFO access uses
>> an out-of-bounds offset.
>>
>> Use modulo so the tail is always normalised back into [0, length),
>> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
>> checks added to the FIFO helpers.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>> ---
>>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
>> index 42ad315d7910..4f143921b719 100644
>> --- a/drivers/rpmsg/qcom_glink_smem.c
>> +++ b/drivers/rpmsg/qcom_glink_smem.c
>> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>>  
>>  	tail += count;
>>  	if (tail >= pipe->native.length)
>> -		tail -= pipe->native.length;
>> +		tail %= pipe->native.length;
> It seems unlikely that the "tail" will point to the start of a valid
> header after this. How can we make sure this is more robust?
>
> Regards,
> Bjorn

Agreed -- modulo only normalises the offset arithmetically; the
protocol state is already desynchronised at that point and the tail
won't land on a valid header boundary. The patch hides the symptom
(OOB access) without addressing the underlying issue (a bogus
remote-supplied size).

I'll drop this patch in v2 and keep just the WARN_ON_ONCE patch as a
defensive backstop.

If a proper hardening of the receive path is wanted (e.g. validating
chunk_size against rx_pipe->length on header peek, mirroring the
existing "tlen >= tx_pipe->length" check on the TX side), I'll send
it as a separate patch so it can be discussed on its own.

Thanks,
Chunkai

>>  
>>  	*pipe->tail = cpu_to_le32(tail);
>>  }
>>
>> -- 
>> 2.34.1
>>

