Return-Path: <linux-arm-msm+bounces-101242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KELESjBzGkWWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:54:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA237571D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23E7F3019F1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB84626C3BD;
	Wed,  1 Apr 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcvXp+nI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qr3zyLPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027F33B974
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026050; cv=none; b=tbUy0SmwHWiMWms10HHjhLek4GErpRBo4Fdu5t+1nuboHm6La7ay0hlk+dkBEJ7XqdMgYLHBeKAS8Gtom3Ak3Y1UopiHnTkEDUMmXANfadoLjMl6t8s99OWQZBXqqOUx1VjDY93wt91LpKwZukG83TfAGm0Bc7ZnqRlsnQviWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026050; c=relaxed/simple;
	bh=p6eW8LSFNRSF1tTo+myk+OoGn2QUWy92sgeD0/UJTrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hdi5tWhC8n8GTHtTiBx3HaO56b+/+Hk8Bjw0sMwwlGWAMi1TIWA668KzBhTeFVJhYgJnxkbM3oXtjzh/Bi7JH9F4q++yzRLrZ2Q0lp+Akd8RBJY7YF2dNI2utLnUM4Ig80b/YUagYLCvq/IAlbWM6dwh4tonjh1k8JJmph1kyNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcvXp+nI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qr3zyLPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312JAce1006686
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqJzznn7Jynr9ThiDh/BQmWbeg+9dCozPKVtRFqAuV0=; b=fcvXp+nIkCZV7eQP
	2U6Z+OXf5E0JLgERCFCTw/Z3YKRQp47VJpBWg7jCn8oGwt3S3Uob9Oc+RkyEYoaH
	BtmEThIzPnCZ58GIS4MaEvy9NHxBreyM/xwynN15dFwC86gE7czPyOsjzcZRashf
	JGRrWKO2keq2SOn62kAlhsOAu25nitsna0fMWr+QIZrg0MSbcQjWMCG1+j4BGmKO
	Ocaue5q13FEXqeFnqa4zjJQRzQssQ6xgj75rr7ZoiPfRKhfAs4yk+ayp1hOKO/YN
	dmTXGQnkdDgvAqE/NlAFiMV8ziPiG/SrAaM/F+6P8TxXj5rd7ohQb8SJHC++kukh
	HCRD9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjgx6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:47:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so165586151cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775026046; x=1775630846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqJzznn7Jynr9ThiDh/BQmWbeg+9dCozPKVtRFqAuV0=;
        b=Qr3zyLPvy5s1xKH6FnlkxhLJ7HDu3UMc0l3beXoF3Jw7z3VW5zWBF6WUkqfebFkeAe
         AUO6kmYfT3Fzielf5WtTI+MVKbaWoD/94282Ei9YFV6YT3Uiw7WJTMoMJJeK4auXnW2A
         QtT0GxO54XEDG6Tfzc/zb7i7tvT6SK15Ksd7dP0gRVzvUah4YS64Wj0m7WhXnbtTByzS
         Q6iY8kNQZgyTw92+bORVeT0l0c5nM55M2Q+nVGC3Mp/dr/426/Gtqv/yT6QodcW0dpCt
         uyoC9/MYS8CH9lJSc/NypCPrPXnf+7SJ+7cZAuoTmrCcVPSXEpDd7KsJDFMmsEtjc4ZU
         1NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775026046; x=1775630846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqJzznn7Jynr9ThiDh/BQmWbeg+9dCozPKVtRFqAuV0=;
        b=sTSUxiNax6nixh8Qb+HFuoEn5uDZu9RXgtg07OEhezZmJuj5PjQjqKXQFfdywqBTQw
         w9SFLofqIga0D2wGPuTjqeufD8c92tIiUQZ6dTaS6o3j2n3DgGqiWodzZQiLIzQL0wdN
         sRUqVVmiuUGL4kpUT1fm2o7ljHsXzxhJA/8+nynawI98YUWBmI5SQSGXgLbeiojqvScW
         96yxL96/8ib0m+7Xl3tRXHqPj1GvGyhk5D6o/dBgp6X4PA8GTRREiN+dawc9HvAw8yTp
         N2kwlJd3Vx9srPgHEgHIKp+9N8koIlgneM5S36SQ00IKkK/EhXbm+hMgagkpHXmadDvY
         u2bA==
X-Forwarded-Encrypted: i=1; AJvYcCUQAHCzwc9RSqYHAvTzMtZUPA+Ki0+tleMjtVzqhhAmQWxxntGAFQ6eGrovUqSZJkMAJaT955yiy83ngaYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwChB2xgvGbMsrqeiNfR/8rDCytl0/6l+U7lXMx+K2iSekBVY2t
	JsoN8BppMETXyFoBGZqjgXLyDh4Q096TxhOGsL1MwR7HBXHcOKB5OApkpfGaABbiad/a7A/uMbm
	InxJlpQabQ6YsHkpXQJDSAV4dmOny5/aeFPoalbZEKdnijTj6l+PAhfjNc3RbMcohJzuo
X-Gm-Gg: ATEYQzwtvTOl6NKEqNsb+7H3vhzF19IK8hiaq6hXPjffIt293Nn09r8x/f0QpIzuxS2
	TYyKqy6OUI9D+m3elzQHEmm9+YjWukfK4V5O8Fpjv8Rh8ZAIHMbl0yMY8m8H2f3XC9q0bHGjL2V
	FU6rQ1P692LM18CaPLI7XHn/oiNj5yPR+wbPyJpZwX+05Fl80fKV4W526I6htwtnhPqLyKhKcKj
	0qBpO441Ag0yS0zHnczOxUk4olxm2jEjWMbzw++AjtlKEwqKyZtjK2QXGZKp2h3GT21blZmJG4C
	xlYoSFXMinLqxLZrxu479uptCFg2Ws1S8O1ikdj42uMNQvoL43sSoQfUJPNpSkf8UkNw6HXzO2b
	b3O8p3zRiG9Rm7Es8ZVO1gsLVU/1oNVsew9YMRNrMLMX3jhge1eCg3Zca+VIZsQ5JteBVOL4NYd
	Vu1V9ZV9ycG2F4BkK8DKTDfP4C
X-Received: by 2002:a05:622a:256:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50d3bbfd9f2mr34036231cf.30.1775026046213;
        Tue, 31 Mar 2026 23:47:26 -0700 (PDT)
X-Received: by 2002:a05:622a:256:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50d3bbfd9f2mr34035991cf.30.1775026045796;
        Tue, 31 Mar 2026 23:47:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c43b3597sm173211e87.23.2026.03.31.23.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:47:24 -0700 (PDT)
Message-ID: <4cb29e7a-9a75-4f8a-9036-c96e9190b7b0@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 09:47:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
 <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
 <46d97aec-9f46-42bd-8725-2c236ffd13ba@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <46d97aec-9f46-42bd-8725-2c236ffd13ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: icDxE6hDlugjrhCBCr1KJRvPCw5o_djG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1OCBTYWx0ZWRfXxPxaQUFkD7sw
 qgOwKoxp6ytiCw9Kvo5SLBfS4wAfZwSiA5UNzWvu8ZvOcKe9DemXVLQCmrI3NoP3O3ERla4nk53
 6vwQyA68Ns6acRShqOb+KBndA6gcTC6/nQb8rc5PAyZIkNykBqYdAmdek3VaOjc5cxl0EEP2ZS5
 XqrWOMBhv8PyZFTChArDp9O+3Fb7UM/xAvvlWfcNQGIhCxkWm0xMqtbzfyBAn9gGPIlDLfVPa7d
 3r/CHihcSQgbajHL/0803RoPoKzpo9PeEIp1PIdgHT6HQPAsnyj1Nh5cFdS8rX62r3e62qzzwXV
 d1pjsic0W0XMu5vmQRZG0yeabxqTGu7t+p40blxLoTSRFgWmR+0MnLi2Wf4+wp+hn2hOLWy9TYi
 LTr4HnH4kzTjsMvx/FtrzUNh8eJCczlIO0+5LSQaFV+3/NUKG3PzS2r/U8d7gEevKO5Si/1cTH7
 5roH790QdcxsAzmZhbA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccbf7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=hEYASa3n4XitINDXwYgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: icDxE6hDlugjrhCBCr1KJRvPCw5o_djG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010058
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DCA237571D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 09:44, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 5:10 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Whenever virtual channel slot allocation changes, the DP
>>> source must send the action control trigger sequence to notify
>>> the sink about the same. This would be applicable during the
>>> start and stop of the pixel stream. Add the infrastructure
>>> to be able to send ACT packets for the DP controller when
>>> operating in MST mode.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 ++++++++++++++++++++++++++ 
>>> +++++++++--
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>>   5 files changed, 44 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/ 
>>> dp/dp_ctrl.c
>>> index 
>>> 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>>       bool core_clks_on;
>>>       bool link_clks_on;
>>>       bool stream_clks_on[DP_STREAM_MAX];
>>> +    bool mst_active;
>>>   };
>>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private 
>>> *ctrl, u32 offset)
>>> @@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct 
>>> drm_dp_aux *aux,
>>>       return 0;
>>>   }
>>> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
>>> +{
>>> +    struct msm_dp_ctrl_private *ctrl;
>>> +    bool act_complete;
>>> +
>>> +    ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, 
>>> msm_dp_ctrl);
>>> +
>>> +    if (!ctrl->mst_active)
>>> +        return;
>>> +
>>> +    msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
>>> +    /* make sure ACT signal is performed */
>>> +    wmb();
>>> +
>>> +    msleep(20); /* needs 1 frame time */
>>> +
>>> +    act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
>>> +
>>> +    if (!act_complete)
>>> +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete 
>>> SUCCESS\n");
>>> +    else
>>> +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");
>>
>> Shouldn't it return an error if the register dind't latch? Also,
>> shouldn't we set mst_active only if the write went through?
>>
> In some cases, MST still works correctly even when the ACT trigger 
> fails; here refer to the downstream implementation.

I don't think it is a good idea. It would be better to signal this to 
the user and rollback the MST configuration (as in the case of any other 
error).

I will change my mind if you point out i915, amdgpu or nouveau drivers 
ignoring the ACT issues.

-- 
With best wishes
Dmitry

