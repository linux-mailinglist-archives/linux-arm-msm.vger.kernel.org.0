Return-Path: <linux-arm-msm+bounces-100725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLStDndGymnn7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:46:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5935873A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7850A3004DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A350F3815F2;
	Mon, 30 Mar 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2AF7rRw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzIjrLLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF722A817
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863980; cv=none; b=EP+md/sjMjOX5zP+CqkMbwtYnSdGWEl2QaXADwxo7yRbvjW6BQoMtXWF1jHEvv0J32fSmDoUySwtlEFUBHz5/sJ0c+qVSEwgUzXP8V/qZs9QPqBMgZr9zYsx5rIPafDhL0Zm5ME+isewG7TGnJ9qIEkR39Nqbchef5qERBjmy0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863980; c=relaxed/simple;
	bh=fKjVpe2/bKS/lVKVSAkeoLR4pZbTsZ4ZKSgFHG8UX6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZdrfjFtYtfOmJYzZpvnutTKftgbV80c5ZXyGbASCG/F8yfHIfQk8BGzCxJBUVTfCRAisIssL9AUUZqv7wEe5+kdQgK5Bo3tgP0ridaRRuz2JeXgIfFecbZuHiarXw8t1kYyHCFWR0nR5BDolPK0F7aAtv9ZDDREhrbO1/juG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2AF7rRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzIjrLLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7UEx83783209
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDrYF8AidRgM/KSPWZFhvJmgdmBlKR/d3nX2Pp8zXbg=; b=V2AF7rRwPDOcqgET
	M7MuA0dy5S8N5GasrsDZqvagyHXI/mPCrjjWps4xfuEdUaSnkgL23PvECeyyY7cK
	LAQESa1GZec2ew4rBzNw9CLvUgblD+DYecr63U0LEMudoJ3n5drl66Y4a9rCF4bu
	SKe8aewV6wI+WxX/dNl5a162y/oN5rjIxQsJyh0muTmNOGr67e2IryY/wP/ZdL2q
	IBEkSkgeQhiQMWRHdf+pKQktFX3DnKwfrmX2setHEKdG4usARHVgbWZ6t+St7zX3
	FYqMHJPdSeBtoAyYyb5VE7arsU1ux1awDCoVfCGNpMuW0KypavV1PD9KT645eGmj
	cJ7rWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afwkyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:46:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so1719328a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863977; x=1775468777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDrYF8AidRgM/KSPWZFhvJmgdmBlKR/d3nX2Pp8zXbg=;
        b=RzIjrLLgNoG3HsYrOKR+Dy6rPGoov+5xpArgEJN6QHYl44LomkyJFLniSUHcXaXcX+
         i3qlAiRrHHRj3oWI8HZ6ZqxhgolWGfzJctcEojmestgNhxFxlbx25h8VXQ8BA8mtSC9S
         8qb+lPcMWDgaiEJrXtRq21awujibdgIxz/DOMiMsmfvG+ju9jOwpbSV/s02MW7St81AH
         QKYoFRdkoSvrAUKtCf8gSRMqOCa4+eM4Nyzha143q/SsHSxp4iWBZPAi9/A+OSbT6MTw
         og22t0Cfkyfc1ooLlbfa5ggQXzhZNmCb4b5GC7852h62au02dqGtSJrw2yjum7H6sX0g
         kqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863977; x=1775468777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDrYF8AidRgM/KSPWZFhvJmgdmBlKR/d3nX2Pp8zXbg=;
        b=BEGN1XuKm3Y0BjlXMUYs/lXKJPfHMvEDhe9ug0JeXZHWLyF87orpe+ZJtwOTzGv+4D
         QSAZzTTCr5v3I0+56VQEjAUeXn0ef7CcHIVvhlruRYD5domX4LfceNAGx02JElNTcPGE
         NmJdjkk5l3rEFOjP81E7iveUZOTc6IgVqX6fzIFhe+juM4kAajd0vbPnE0kN+M1OJKCT
         ipzVtm8Ub2OIPmPWlY2gWzC9I+VnJwCQ6KQxZbIo03+fOPQwX9fEBOH+vT8M0SPr5K9g
         xKGVWO5BJTaEVxxf/ln5yyCtZItHtxsHRe58KNi8omMJqQA3TSvbpt7qRvA4xp85RILE
         lAGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXummxsZbwvBfgYNEgFX2V7uQzE4u+UzCuWn22AppbGnrLZLEXerob068KovxXz+nhaPPbYtbj7ESNC5jU@vger.kernel.org
X-Gm-Message-State: AOJu0YykJScLXTy8qlnU8bH6w8abjcTfZSGwI0YS738iiCck/klh+7ho
	Q9PZJNGaDU8GqA74c0wbuHyRqvIVLGOsmm/50eCQMnnf0bAgLYhXkNS0buYnfD5HIH9Xhm2nc7e
	GTop2BJQDu9Ju9sUTmjyiqpexNUBhRHKPmwsOsH/Z+Q3ssXA7L8QIbnWnLjfJNjt+FBB2
X-Gm-Gg: ATEYQzxOdk1iuEf7vGjDhzI1dhhuYjNjzcQFZELPd0XUGkaTTqNzBtDVyayfNmpZIjL
	HOKc1JEdOFEUWvBag1s785LjSfU8ac4+4136weN+KwiY3emdzCglxHaWDxCTG/M52DNBQZ76WdY
	zI2d5pVHFyokIKtRCFaeSEPYUK5TGfh38q6zl4eyxlp391UKblhKKNteUuKaULZ+Re3SOjXK2NT
	nKedHw80zVdrg/LUR7RujJR33D6YAURYp1UEXk3eqJmQuoc1sFJuEqQOMovUy3X+kL+sG34LEYr
	8+kgXn0HSIGqajktip48aVtRB6XcDhM1E/c8ftv7y348LoPeeqMszCXHzGkhJ3S2xVJakvqTiUY
	QLZY5MWwzsavwTGe8fZpQG05y2rqTZObplplb+Nnqve1wpb/2
X-Received: by 2002:a05:6a21:3086:b0:398:66c1:aca7 with SMTP id adf61e73a8af0-39c7385982amr13909258637.38.1774863977310;
        Mon, 30 Mar 2026 02:46:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:3086:b0:398:66c1:aca7 with SMTP id adf61e73a8af0-39c7385982amr13909222637.38.1774863976529;
        Mon, 30 Mar 2026 02:46:16 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916ceaf1sm5852762a12.11.2026.03.30.02.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:46:16 -0700 (PDT)
Message-ID: <52455b77-fc3e-40bb-9462-8a78238bde0b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:46:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
 <rsywfefrwv67umbi6xeybelsu5u6xqyklvtarnoluu5mzz5u5k@bkexqpdd47ew>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <rsywfefrwv67umbi6xeybelsu5u6xqyklvtarnoluu5mzz5u5k@bkexqpdd47ew>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hzijsQOY9wmm1yug5dapClJlGYlyZ63J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NiBTYWx0ZWRfX1qk5umh1mWlG
 HYAfP0O04tIdJeiSWFDQu5xtvzhX9av2q4xyl0nxPxOvi8ur403irOPivnheQwFClBgs0RSG7F3
 1klRPG2HGkHIoYnx8f16fzJy969+RgG/67n84xTsqhFTgv64SZQQLG8kg/pY7rNupk0kD28BXNd
 D2yUY/mbmtGeLjHDZOzrEiFbQGJgp7/uqdz7s5nU32FJ1K/AoRtMQO+GMUEj3oW6YO/EE4wfT8T
 /TD+12XrBCFiZsffGXiQeNrPBVjMx7P+2u9W2mN7O1d8rAAweOjf0xMxCRe8QMdvR3OoS+BPxkv
 hWRbEOqVk2OXk6s22sPTcB0NmngE4ntH+QfHTKdu5+plYvRDiMzE+HlRoa1N+IO+kakDXZKLoZc
 4wm//lE913d0rAAPQiMe6g5jA5l/kMMQyMKyGcTmAZtiK/axXgKMHWyWgzIdBX9oocN7BqDrrbJ
 5mAbNT24WbtEu3WQSvg==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69ca466a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KxCuJjgNVnz-IXmmszEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hzijsQOY9wmm1yug5dapClJlGYlyZ63J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CB5935873A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 1:39 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:57PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> dp_display_prepare() only prepares the link in case its not
>> already ready before dp_display_enable(). Hence separate it into
>> its own API.
> 
> Why?
> 
In the MST use case, this is expected to work as follows: when multiple 
sinks (two or more) need to be enabled, dp_display_prepare() handles 
link-related setup and should only be executed once, while 
dp_display_enable() is responsible for stream-related handling and may 
be executed multiple times.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>>   3 files changed, 15 insertions(+), 4 deletions(-)
>>
> 


