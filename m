Return-Path: <linux-arm-msm+bounces-107837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHPfCbgHB2qNqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:47:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02A54EB9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55FB43144A69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF4147AF60;
	Fri, 15 May 2026 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+YqUy0n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIIr4vIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C546AF2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844071; cv=none; b=A1Hi/GoCmqUOJcn6m8Dhqmd6EHXvQFH7gJHlU+6647wn9Awq7HOS+Ebg+dcYADWLm+VTusCmY5UrKWNjfP8ort0H6E5sl5aI7SpNdLuy0193h4eHrD3oBN7ykWS/DZdEbJAgCYGKuRcijP7rrBQ5Oud1dgIzv8p8QSW6a+axKxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844071; c=relaxed/simple;
	bh=30w/Dz4DHVJOJ0saZ53MomLXFyE2pfTJ5WwjLxeeNjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FO5mwlB2/V8GOO2t2Gt8lLNMvIWHMSWeIuVQRbK6a4xRui9nYih/EaZtg9bA/rHD/CdFhrpIRa8iPDrtCnK/4VY0B5b/bL3OcdFwiv4KhY7EqdWM5jpo5WnEJQV+WWGj3x86IXtKJ25VdweW3xStE4V++fxtPwGem0TuI6srLy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+YqUy0n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIIr4vIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5G00T4008232
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/OU3VpcyP6ezliR1RElx+1+qYN427OKZn9xUmYZuEE=; b=N+YqUy0ncaIRt4Rb
	fH/wWGSlzx56jCniYQhlvFbmZRUxyhWnpdCBylmk29QZtJrkVZIUMEnnt9WsrI+Y
	/CKW5hjJsiPaQrvOgBFzDVKTz/pcaqO11WvnwPE1mkAxpXeDnmvHs5BfkcbsIByB
	Kv5pgUr5adgn49LwzEz1ZaiNNgDtb/KNIkFx7sSTW5BH34xHXQog4i+CF7PXzKAJ
	/vs9+CdZq4UuPSRlVg/EDZ6zlgfmkhXWiC7cPeIIuM6nWFEuSb2oPadlKWfWCKLT
	ghgkXKkUtV1grXBUYpeF9iLL5hT58I/71ls6SmtbUGnDpq5bmO5Wz9qsh79FcL4i
	86+kbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su17c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:21:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662668b825so3742277a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844068; x=1779448868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/OU3VpcyP6ezliR1RElx+1+qYN427OKZn9xUmYZuEE=;
        b=OIIr4vIpyg8/PkYcWwcdF1QS5pDe52wBqhoCvW6qPsqEX7ZPfPqLO2RGDFCznpmGkq
         lor3X6rigukNzo0/JU5kdU882Cc4gl3jXnWYHMQ/QijslmcD32uZtuMNq6BCefCQ0sb5
         JgtgbC+Ya8P6L5BtRtWIc4W4C8Fk8uHYC5zkRSqqN5O+iluZn/n/KuOJKBhIh7cp7su0
         OFaRdBr3KxMgsG4FqPKekmnjlr5CIApHKoyU5GmVwD0uS572A0JONsGixY5txop3zsT/
         z7vgTyXjxC9bpGMArASk3bDLPqVpgszYSUMfyjdTTgHh7sELCYtYe/E5ZXaWgYIZdsKx
         Uhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844068; x=1779448868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/OU3VpcyP6ezliR1RElx+1+qYN427OKZn9xUmYZuEE=;
        b=M6DIitHO+7UbKCHFB0XI2CpXZWURw7W6zFBnOxzoG7m5Rd/qBtMcQGO9kozLHKICTN
         iUuS4XR1S1X8N4XBuX94HejK1X/EtUSx/GeDYx5gRNtTfeoGeDTd8u1caMI0e1+iaHd4
         ZpHqoDmvU1eZ8RpT3SA2Sm4Xs1rbyodzWtx92nd5pUgq7JoJvPkh0IY+4lE1oCdbGCeb
         lTlU7Ygn2aB/985A8TckA3mStDZyWOB7u1t+sqF14cM7wZIrnOF44cdRQrkm7qgFcNFB
         Czj65q6yIBNChEPpxWUDGxU1Nr+YbLHM0+LXHGXBGRrsvfEsUdoX82xKit+k97Ne0ZIj
         0yAQ==
X-Gm-Message-State: AOJu0Yw5Ai6O6yeQG+xC5LeSKddvYuSys19azKex8OjAwPsFJe8EezNR
	+vMzt5CNH9JUHtd6rNrydespgikgxtjKsElEulQwx9UUh1FhuxXAbpyQ1aBICmadc2SY2IpNLQd
	wqhloC1UtaEvgOXC3jJKX7BLysNVbFlKeYeVWz8y/NnEzGQYHGQ5FcHkCIMBhOOxfCM41drwsf8
	HT
X-Gm-Gg: Acq92OEl38UBAJ5f4jWV+AyAXS7b+kcxRDKUVRgcxduUZzA/zriGWSJ2auVTT9ycsNa
	SWSTeJs0qBi9kRXr0OP2UlZVGAp2nHyMyafEX65cTsXsJPyLqcsIo0YxGcSLWINQS48Zw0qumqL
	IgbAJ9AGv264463VDFf1nnm7ZN6rcx0rEVk82KWHeQVl/l6Mr1C8XjDKpeCwx+kTNLW+EnKd2CW
	fX03Ro7MNRmFlea24BFdku3eRitSWA9Fyfniyqn1ZAazwbguyCM16FVM8eRqDtwbux1rayFoJz2
	v6XaRPd5K+vwbOgvNvBmjqXf2Z/mhnI7XJLhw30hdpaA4IhCE22wyB3ad8Ws/t8YF5ShYwBuuqC
	TPk2Ps475D0SPui+xIbJm9U9I70IcwxB+OWPzyrOVzsWu1UFbgTigsiHUZ0ZDBmypvEyPTQPNb7
	4mIW51coOaeB5wM8AWJcI2WOScm1Rh+8uGW9y+iKdR
X-Received: by 2002:a17:90b:540d:b0:366:479c:59e7 with SMTP id 98e67ed59e1d1-369519cdb4emr3536222a91.4.1778844068111;
        Fri, 15 May 2026 04:21:08 -0700 (PDT)
X-Received: by 2002:a17:90b:540d:b0:366:479c:59e7 with SMTP id 98e67ed59e1d1-369519cdb4emr3536198a91.4.1778844067679;
        Fri, 15 May 2026 04:21:07 -0700 (PDT)
Received: from [10.190.200.212] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695148b6efsm2717991a91.13.2026.05.15.04.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:21:06 -0700 (PDT)
Message-ID: <cdc0876f-622d-4790-95d5-4c35e3fc4d3f@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support tsens in ipq5210 & ipq9650
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rU9US8YWV2ygMalzXeoDxnz1UyvCEnP9
X-Proofpoint-GUID: rU9US8YWV2ygMalzXeoDxnz1UyvCEnP9
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0701a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SyN3j3mxg8ih-LVgmwgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX/9Lp7LZ1ZjBK
 nlvPYzTNP90yYKJLx0KgXDR2wvs3dhvjlO4er8U32K6I6Zl9gzxpgWbz3OpJ0wDzzLRNTZ81mCb
 yqe8cmJduO8ATleaUtxuFuxk+Db5ha/WZd5vERq8NfTlm3LsNqF4B8ORU4MEEJVB1w62HDCbThu
 nhS+a6WkQ7m6NdL7ZsNu77XReXzztwPfywbBoEC61RznAHZJkAceV5Ce4FkQoGRVaZhm1MwJ4Jv
 xvAU9nNMIvKIx3kQlN48mU51POQ39+CMyng0BDDqMoJ8S/U2bNeeIG8gi0Hi/PBOdXzYmhZk/BB
 mLXQ9kaxe7OzSXYFkPy3u/eZ3+KWBjtbCCHxm1dTwAJwz94M4Gi2WmsmnS67OCU36KHRBkUApMM
 EodF07pP0AFsBfGOZuogRf62zfDPQpp96dLGFYYd1O69zpo8wYkHzWSt7viUzXqJB2j9g2n/PpN
 aQOe4ZOn4YvjVMRfsWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 9A02A54EB9B
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-107837-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/2026 3:47 PM, Varadarajan Narayanan wrote:
> ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
> in these two SoCs are similar to the one found in ipq5332. This series
> adds the sensor data to the tsens-v2 driver.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> Varadarajan Narayanan (2):
>       thermal/drivers/qcom/tsens: Add support for ipq5210 tsens
>       thermal/drivers/qcom/tsens: Add support for ipq9650 tsens
> 
>  drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
>  drivers/thermal/qcom/tsens.c    | 6 ++++++
>  drivers/thermal/qcom/tsens.h    | 2 +-
>  3 files changed, 15 insertions(+), 1 deletion(-)
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260515-tsens-driver-779b1f46da85
> prerequisite-change-id: 20260515-tsens-yaml-5f517c948b89:v1
> prerequisite-patch-id: 23a443cf15da9852d647ceb75a1b7ca98078a1e3
> 
> Best regards,

Can you club this with,
[PATCH] dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible?
Or send 2 separate series for each target, helps reduce maintainer work
Bindings should be in the same series which introduces the compatible

