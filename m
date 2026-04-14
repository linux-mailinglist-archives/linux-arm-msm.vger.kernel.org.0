Return-Path: <linux-arm-msm+bounces-103098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPg8CkkO3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:52:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C43F83DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3672D301489A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5713CB2C1;
	Tue, 14 Apr 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nw4JxSAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF4TJCRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3F3B7748
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160322; cv=none; b=FsWJghPEktQnsqQbKTrfT3al4NeQjVXxQkbNGyvkzQzFUD/LNqsubIALFb0Rq/YS8yZVeMdM+8QMIuWvaqcnSjpYhmyktNsuLY/8JH4bABxhV4bQqsqDObUPHMlBAifWAlSLj24lR7nSnjgQAPXLnl3qFSqQji3eqxSWoZJbMcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160322; c=relaxed/simple;
	bh=DOLnUSDJfrz00YzDgW8EfqppsWlerG2cnpfD7ypu5M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTLW9TGF2VqALja2Q9Auv8knoqCkY+eWiUycq2EbZ9rbt3PQ2mNYRyUAkoSGXRJJEyfP1AbncZwnsXKkcySreRqw209WbZRcpUb0JDUJ8LqdF+C9Q3CH5mHGH4Z3qWe06m/BZ9Vo8h8cf+T9yzQ7gohNnncviMVKIfTeb7T9oec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nw4JxSAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF4TJCRv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6apmP282234
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWChOupg+vdURK7dSsm/hBK2/Y/ha3fMXKiVhsxo7RE=; b=nw4JxSAB+NuLLXc3
	o9eOyVq2tF3RtFloo2HVbRw2HcgLJ7YYbUOgP1fFfY2tzfnlla1SaGqtutP+3KIE
	HqildVx+6zdcomNkiRfQZjBBvj5J8yU1sQAsKAxs5/JcIgPXKUGFM8NGsxVtoa0g
	TdWN9t4JA66fXchKPdVeigBAhjhFC0QVcOzuFtp8B1B9ckBZNsVLHcZDMg3LQsM9
	z4BZ2Pa3hzHGQ/Yuvn/1HG7XR56hBUbksxTQ4kT8vtwye+SYxGyc4yb5AbJGXK6m
	OpXqqfItSmFn47wq3XmBY1E8SxhcK3U+CPdBKE90mv4xb6PHFdIBD1DSwcoPOAEt
	mVyRsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj58g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:51:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f460260cfso1811469b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160318; x=1776765118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWChOupg+vdURK7dSsm/hBK2/Y/ha3fMXKiVhsxo7RE=;
        b=ZF4TJCRvW39fswQ++ueU6nHQFyaQWayGDlryQM2pDzPZMv1xryhzu15Di50ffi98TR
         6BVH17S5lBxeFb/MDVCt3jm3cqZTjzDb0HicTWWKs9SVR167oLRf4hAJnbBvVZsK7/cj
         vBtwo4rGr9ByRCmNjKjygySYR6uqT2I95MxYxNLatOOAIForJBL1gDjZHteRX4AM6hce
         FlkhrTerYIMAg/a/0+idl673y2xUBFDj01eeAqEuzsC53JnYUFx6VzpgLctGVifhQD4e
         /O19bSu5g5QKG51xkMWxMgm1VvV+Kzk8QBouyBA4XomIyaeWNr3yJkdx8nsX25VnBuc4
         PqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160318; x=1776765118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWChOupg+vdURK7dSsm/hBK2/Y/ha3fMXKiVhsxo7RE=;
        b=tQoTdwEh+7iJxcyzylKdY1olN0WTu7DAo9WGjiUWYhwJpn9dj7Z9PIheKAQ/NFcVmy
         879g7QHO8SGqgQW8ylGhxVZJ/kaI/9sIkf6jRufNuNZR52D4LCy0Gd5LBH1Qw6q6UJdK
         R3UO0Y1v1wr++aW1MAgihHYJ3tLuYsdOzlyHkl3IiW9S3OdXtJxhg+P4+gdg3eyY2j15
         4NhHiubvnYxcputvZJoSjXe6O2L4z0f6gIk7HMJui+LrUw8pqlIosTz+mcpM31yhCw6C
         nd71chvnS9s88n5bFj8CZsjTkaXs8xc8V3ZZr4rnYBMYVk89d/e6YwRJ0FC6vdDZuR5Y
         VhWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l54NfDS8BFNUQ8Kli/8EHrasyaSDRD+uPd+ORZPBWLapzS7t0THLBSZcDXx2Km98wZY8ahfkyEFoV/wq9@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCLvc6yq8+c+6qs0LRagFoSTVS0QqYRLVdXRHKfwpcPN5pKmm
	VpgP6obMPJPgjnLXvUmO3Oum4gAHKsJvOA3Egt1p+sX8X9a8tPUlMg9VEZxdvKjY375X977FJBN
	I6VUTiuholkVecBUfuqUSXtSmQSY/l7ZvWUNOr0IlVnQYWcbkkM7bPdplRv4PJcAC3JU4
X-Gm-Gg: AeBDiesOcF6PDw5HQOngyFlmSPbfXwuc1yD5aH4GCyg374YjX5DoV07aIHxlaj150kW
	H6zgMmmGaWS3a80LnbQ4PzAhDtvVsTOhm+TWXSK4NvoCwZ059vSq2NEqq/+BBDBa+ZPW7KJGM28
	cUgHXwWKpRA9spWB3qe6AOXrpZl+mzi/j1jQDv4fmD+hHYS3drMwBwUi9CuXGMLB7zzYrbU/Zy/
	tox5KTFOfnhGYqyEbQVy0K7bkaduIDArDjlzEEmvsmu8Ry3hsH0Gm5HHpvAe9qunDj30f2qHHvD
	VJPAEC7AQypZ/MDce0gmzn1fR/VuZYuAb00qatxrsSwi3j8jYrhxPFAzM1IY/jZaHQlQmEFjgxD
	pc0O3MjewW5ky6hw2jk6LTMOvXrmflB9sRwEIepQeFySfxTKnNUvWGPoPCv8Lujol04mOaU43cG
	ALTAFyZS6D2RgKC4EA
X-Received: by 2002:a05:6a00:9508:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-82f50cded65mr3749898b3a.13.1776160317459;
        Tue, 14 Apr 2026 02:51:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:9508:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-82f50cded65mr3749879b3a.13.1776160317029;
        Tue, 14 Apr 2026 02:51:57 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c343b16sm13872900b3a.23.2026.04.14.02.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:51:56 -0700 (PDT)
Message-ID: <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 17:51:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
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
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
 <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YXJIpKveeL3ZQtduaF8PuuX2i462s9g2
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de0e3e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rS42QUC6qLDb_W9ZlKQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YXJIpKveeL3ZQtduaF8PuuX2i462s9g2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX/w6o8pa6utrY
 lr4Y5FA3jcD8unkDWdMv0R/4GGH8GEheKkml30XLA1pz5Hr3gp2RSib0FB4PbT6w4ilmoZdiZ2+
 r3HaYY7wIbnKfNyrgRFhg6qU2N51eifpfon3Z3cUmXn1ZH79/fzDluHw7e83hktOkNUtqPkvwI2
 NAHvdRA1aZOCeJvA/kHv8LoFDJ+KZ4gGOVXmQgzMMoppjrEQaGugUgpRONZJfF/czt/1hJdK1xA
 AcPxb4yqmUBoN4vlOJ1xNb6rKc9OWCmB66R1FukVOtX6o6QZvlske7N9p+tvGSbnIIv5WQlJh/u
 waFF2TiBWPaBEvdH0fIIfvmPgWjsj7TSgi7veujF1YGe8Zl+D0nI5dOjBL8TQirA9JexEQTt0MV
 /7XZCl6DgUq/Evb0ZNnEiXmtyr8gRZSC+sLQJIfldxwc3b5gCKD37p36oSvT3OvyunJwMgeqyp2
 r1HE8brjm9taf0Lx+Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103098-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 253C43F83DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Add HPD callback for the MST module which shall be invoked from the
>>>> dp_display's HPD handler to perform MST specific operations in case
>>>> of HPD. In MST case, route the HPD messages to MST module.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>>>>    3 files changed, 48 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>>>>    static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>>>>    {
>>>> -	int rc = 0;
>>>> -	u32 sink_request;
>>>>    	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>>>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>>> +	u32 sink_request;
>>>> +	int rc = 0;
>>>> +
>>>> +	if (msm_dp_display->mst_active) {
>>>> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
>>>> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
>>>> +		return 0;
>>>> +	}
>>>>    	/* check for any test request issued by sink */
>>>>    	rc = msm_dp_link_process_request(dp->link);
>>>> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>>>    	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>>>>    		msm_dp_display_send_hpd_notification(dp, false);
>>>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>>>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>>>>    		msm_dp_display_send_hpd_notification(dp, true);
>>>> +		msm_dp_irq_hpd_handle(dp, 0);
>>>
>>> Why is it a part of this patch?? It has nothing to do with MST.
>>>
>> Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
>> I tried an alternative approach by calling the MST IRQ handler from
>> msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
>> DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
>> msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
>> could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
>> However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
>> MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
> 
> When are the link status bits updated? Please remember, we need to
> support all three cases:
> 
> - Native DP, native DP HPD pin handling
> - Native DP, DP HPD pin not handled by the controller
> - DP AltMode, DP HPD pin not used at all
> 
> In the second and the third cases we will not be getting the IRQs.
> Instead one of the next bridges (connector, EC, AltMode, etc.) will send
> the HPD event, which lands in the .hpd_notify() callback.
> 
I added some logs and did some testing. I think 
msm_dp_aux_is_link_connected() only shows the current HPD state. Since 
IRQ HPD Pulse Count is very short, by the time we read 
REG_DP_DP_HPD_INT_STATUS in the IRQ flow, the HPD state machine has 
usually already finished pulse classification and returned to Connected.

Because of that, the condition hpd_link_status == 
ISR_IRQ_HPD_PULSE_COUNT will usually not be hit.

do you have any suggestion that in how to distinguish between an IRQ 
event and a plug event in .hpd_notify() better? We probably don’t want 
to introduce another state machine.


