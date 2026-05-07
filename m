Return-Path: <linux-arm-msm+bounces-106230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UkfvF9EG/GlkKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 05:28:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4154E2968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 05:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64673301DC32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 03:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193462C3271;
	Thu,  7 May 2026 03:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itHj9n0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwggcVmY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9B283C87
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 03:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124492; cv=none; b=VzXIABNphQCBsolGZbuPL09Ks4vn1t5CYSs747+DnCguvQQkXMFY9ce2GJ2hnAYVkAA6LAzov0dA4lJ3unaaWi0QKR02ADw8xpTA1SgYIGqhzhQunDkt8ojxDU0X5xtRvloqkbvnBP79mSZaH+C5lD/1fSVlchzvbFkcLA1iYkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124492; c=relaxed/simple;
	bh=Xcj3OienWhKhCQV8lmue847Tozpcy05sx3/myZShVB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFbOoTkcjf/BQk4T3tVqp49SHGP5LMrDvikoBDrePP89/nWOB/XeHv1teHIjyIKi6FdqTlTV7ROFy1J7PtZYNM2NpYXWBAnhs8UtALuYr51XmBkfZFjcppOyDCXYoO9kI3wHP3W0AGvV+k078wcEeuXXv5nwrLhOhbHN0lwTXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itHj9n0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwggcVmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472BwuQ258795
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 03:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+iK/VRqnXrENHqyoaUBW011Aa4rY5QCI7A6FztKWHU=; b=itHj9n0Cx1WI3fer
	0pz8ZDyx1jTqy5wiSbwB768nFhmGVjCrsJgcDcO9eelzqZ8uRrtD1vvyYBWlzmtT
	tcneewSnlJKk48pf2tZ0uP/dAp3IjszhqQL0Vmp7o2d3e1AJp4ItqM7DZGoDD/yk
	cb/bCahhLoGa3L21QkB3MdVypwH4cwTlp1p5oofB1o6FAvxBk0nI5YuJhfEKovwK
	qu7tO3ds64JaTGUFrJp+pzlZJKoc9y6DbiWz/Jx1zOqNIoeRV+bAJa6TRTrvPO/a
	rf5YOPLWGFa0Dbc858XcSRLCoHzH0+PoA5TdQ/erS4BhQunzJ/BvVs4XiK07b6LD
	gX95DA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8r6gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 03:28:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f5943ca81aso1534783eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 20:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778124489; x=1778729289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+iK/VRqnXrENHqyoaUBW011Aa4rY5QCI7A6FztKWHU=;
        b=ZwggcVmYDL9Gs34S014iAeDaWsbxU5rCq2WQTTsaiKuo+eHliaEslM4AyQDytDjI9A
         vWRGFXhAOfhZXb3IZzwLtCxMw62fpLx6UumKk+6V6C2hqVMGOMDGUFCEZH0yUhvplHMN
         olWPBfW6ShaRZ2uWoD6ti5wzk1v/iqIVKWY8IT/i/OYSB6c7cCOdPBELItbA8DIn0Tui
         WOgAaFxmW0HDUX9usrB4NtaYcqi0ZqaaHt5iQsxQDClp6jF9AFOXrdaNGPhoKV6jDR4I
         uS89pyf02iAr2cvbf0JetPLsgFo9ACW5qciVSlfqOsy2FVbK8gyIRiLbrbfe+LZ3erZU
         DmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124489; x=1778729289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+iK/VRqnXrENHqyoaUBW011Aa4rY5QCI7A6FztKWHU=;
        b=JUu8JkdkPnhAa/GBBVmDHgW+ATk1U04MgGgiVXghlShZHEBC17dClGzZDM+K5M8khN
         edAZ4wPn6HRxkypEj4tl/MdsEhfRsxGIq2ftLU5+XrvsebbB2vu+eLCPtgikZty987Os
         B2WBtVlr815HMzmuVS4jkjsNkU35YjJjDUR8HgOQAFDSwSa+ZlKyd6OJOTHREIKG0/nr
         whjXJZ/tIBd981kt45JJbSbLLGfY9O7z6mpOdsf7iVW1Vv3supJoGBlROciR7/AM+HeL
         je2LDQABvdeul6RyWM2Ht8oG+eKJS83rJvgo9t/HAkqZ5uTqt/qYL5UhV3/P9mVK+f1j
         61nA==
X-Forwarded-Encrypted: i=1; AFNElJ+/Ubw+KYsaBHivLyk7c1Sy4SkltAXVyJP4PibdrDiHnwvbkuWYIkRd2P6gGZ5W9ZAXxErl8ZB2+4lb9Xpf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++gLSY7j+Jjg3uzebhb8z3sCivsJQxoO4F+U7LuJEK3jdZZNG
	9HxL40an7EivnPOkculZ6ddY+OCFXIxnQhar80CCJkIlwo5s9dQZiZa7n0mD2YmfCohr+2GHJ46
	xvsx4AVPLJ0ETOJwrgRQ0eA3zitF9ZRAgTgixPODBrzXPI3yVTRMuRhuiyxA9iy+rp1WD
X-Gm-Gg: AeBDievNx9y/vU7fplNmbHQmD3RqigchkMetVdjCvLNmU+AKXRWrJj0C1irZkK3K+j4
	liYnrgT9203/aEmuZzzEOnfYd1AkNT6w00KB5Bl1446DH3RUAZDL/noCApxaScl9SJJsPSxb7t6
	B/e6NZI3H8yn23fSUmgfeBbiukOzf7rVDQGuWvebVfmYfD/0hCjqyZ3EUsE+3ziQX7CxqB7VUU2
	icWC0HZ+f9/zETcTxm9fyR656nRzk1LN2zVPKcSHWoiJzI0+e6Oo7NywWMpIGpdt/O8/R0HjfCT
	xp0GPa/E7Qlr/a1eEWbfp+HqsKeeUxJ/VqtDB9kSuzij5hfCgHAP3aNnLui4sNMs3JUsfVoLT9h
	za+riOm6nmOpo6K7lgGmfb54UdFnQ5lfnf6o743D/UIOhxcVwQ6zC7T7W91fxHfo=
X-Received: by 2002:a05:7300:7255:b0:2d4:aa5a:391c with SMTP id 5a478bee46e88-2f54869a41bmr3245342eec.12.1778124489131;
        Wed, 06 May 2026 20:28:09 -0700 (PDT)
X-Received: by 2002:a05:7300:7255:b0:2d4:aa5a:391c with SMTP id 5a478bee46e88-2f54869a41bmr3245319eec.12.1778124488482;
        Wed, 06 May 2026 20:28:08 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f88f89csm6086152eec.15.2026.05.06.20.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 20:28:08 -0700 (PDT)
Message-ID: <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:58:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <afvkiT50ZUEXZ-YO@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KvEQzaVQGGzubccoZWpWB2rErz9qf4J2
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc06ca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=RmYZSZXQ8PJLqAOd_dgA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KvEQzaVQGGzubccoZWpWB2rErz9qf4J2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzMCBTYWx0ZWRfX2aVTVY+taV6e
 Za6ke/IXnsoldejkQpB3KkWH/SQtBp2sek6XQUjc8GxEQE8NCRGSt0pbF0ReSN8wJaUmaX3CcJo
 Iwt+tdc3u27E+yFcpzxBqprKZ165ahTKgueIkSQgaslfxOhUb3oigpa6/PhsZZuP01hssCBQz6W
 kFKVnngjkj9OVMwSRDN4STtlJw5pnXnDjYlpEMkUEDgS/wZvbBBzAFb/iDRwH1J1oiavkwXPAd5
 HkqzQYTxKYOivRj6AORteSgB6oNu51CrCotQCgMfJbJUM39eNrwpEYYvjt2emZXZVcVnJmvr/Wd
 n0SVhw+YmMhJy0f6woqLXDprSfbA80/70lw9w0Bvzew/vVzkPRukt+UHwNDMvQbKKI+LQ5QrYsg
 GBxBXgAi+NUM5ysYLkTMnoc3nuuIhLXrM8aVEkmqnVzqNOD5/DvR9qIa59fmVO3C6DyhswQP/aF
 vecCG1mcPi/tMIB46ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070030
X-Rspamd-Queue-Id: AB4154E2968
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106230-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Mark,

On 07-05-2026 06:32, Mark Brown wrote:
> On Wed, May 06, 2026 at 10:59:42PM +0530, Praveen Talari wrote:
>> Add tracepoint support to the Qualcomm GENI SPI driver to provide
>> runtime visibility into driver behavior without requiring invasive debug
>> patches.
>> +TRACE_EVENT(geni_spi_tx_data,
>> +TRACE_EVENT(geni_spi_rx_data,
> At least these feel like they really should be generic events, there
> hopefully isn't anything driver specific about them.

Initially implemented as a generic event; however, splitting into 
separate TX and RX events may be more appropriate.

Which approach would you prefer?


Thanks,

Praveen Talari


