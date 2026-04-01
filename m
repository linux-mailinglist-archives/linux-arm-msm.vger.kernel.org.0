Return-Path: <linux-arm-msm+bounces-101245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNBzLunBzGkWWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:57:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E832375777
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471BB303CEB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0D9345750;
	Wed,  1 Apr 2026 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkAs45Bi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnmrcJoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA7431064B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026541; cv=none; b=gmPuST7fUKGQwY80txP1RtjxUrXJzwYACy+hjawtUzpxLrv2nsfJl1eIJlNqRJEKsjVX9BhS0uqtPNn9Eq4DVKoNzC7NathR8a9cPgU8lShRcERah1q6Agt0s19yHQfKsvVYwh1u5rQCjg9mRHHR5vOPIVRiYgnpQ2vTtNqLOxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026541; c=relaxed/simple;
	bh=LmXTESqet5cx41utuDldt6MfCgA9+D6mH1BeowDl8q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPKZyZIl8ZCbtrukQWvl3L47pvkuV5wACWzq1zssTusV98IeXYiqyDiYFJ9xw5J7YGXqqMEOJP0eS/DZBgiPtnX5hzliIWLmkr0vgKy+ZKKBWr/6X55VmyAFamn6P/7k7Alk1BsXiRC/NAOqdPQxPPlU/73qJjbGgMQKrUMrg20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkAs45Bi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnmrcJoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6311oXN93081559
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQQBKnTeuxvZFrzaqYE4weQC+7shJLwzkpMeciVeR2c=; b=kkAs45BixoDdaqYD
	m5zsRRk5FPMRMUuN/wmaYH2UnhTIRI7ScnjOHA+i0PQn7TFDfC0qDMz3765iAtyX
	iUlKmPk3t9IFYtOLlTwyofF71TYu71kSSICrAC6aAhbc8NAuD6sy54fSpL30bnkD
	LocEabT0ljT0ApYU5reQdl3TQPdHss2Xu3NTUlHb8h8ze8ZpS7fY+DRoYNQgI6zD
	bJv6+l2P2svSfjriEORkUgxKWcFD16lyoorkQuBWOuKBxHMH+O/3g4arOdDcUIDJ
	Xx+ObbBZSViwoGG5ftgfn2fw3upOrN5wwfCTysHThtY8varxpWaPrmUD3n2FJJEe
	4dwBjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdktpkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:55:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so36953635ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775026539; x=1775631339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQQBKnTeuxvZFrzaqYE4weQC+7shJLwzkpMeciVeR2c=;
        b=YnmrcJoDoh8jye9lpwy0r50O02WKnJ0R8QkdZUq31/DBdqHL9BgxopXy6PgSqP/0kb
         x4NAZ8BA8tQXdhrYhFEnVC4h1lT/rOebMoMR/rEPuH/zLsL7do9nx8h5L69DDUnEe8LI
         wZ/a/KSd8SNTLjv+lQtCRFMl91PZ1XEcl4V6RTD4luCBVOOpgcsuwYasIe5m2zfeBQyv
         lzwUN65Rd+1jKbN8kVa+jIA0z+WUZpulcOKJYY7zbFszSCq4PxhjqGxJ34cMm+k+itbw
         4TnSaMZxJQKwKhif8GVVeqllDBpmo3xevKgXPCmDd9kl0h3/wbjeAVRiTsmNPu1JZeZD
         MvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775026539; x=1775631339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQQBKnTeuxvZFrzaqYE4weQC+7shJLwzkpMeciVeR2c=;
        b=s3YcdyiG5sSh4JQZW4o2AImFZ6uuXj5HNEQVytuDWM6Qiix8zUiCQmE3uFPYSJkRoX
         smMckR8kXk0YthatwoiAnknsbElDVSvQXjCHTgDySAfBsNSxdbCOOo1kslOEx6c30ZL8
         Yy1oDSbg9JE7el55ZPPxCt01Yq3pwytjIBZBt8LIsFykY59YikdICeRmfWM+x74gb6R5
         dE1DE8Ef89QwK+u9VzvdtF9W4/kA8XooGUVeA+HZle59asjIlVZwvOo2s6fYAwcJ2OOS
         0XVOUznHkEXlQNYGH62adi/IRTyMk+UDnqzg+AAnalM6qygwas/plneK1Hf5WWWflzFk
         +0rA==
X-Forwarded-Encrypted: i=1; AJvYcCVrkPrFhT21G8grZ1pFzn9V8C9DGXgKU5vGgFQgcssXgt5udz2IsYwmnxgxVjUNOES7YQoMCvn7dDXV9EXz@vger.kernel.org
X-Gm-Message-State: AOJu0YzmuHMMi8lzVg1pLrhkiHa9te2OYaJV0V2cnZRmh1Tp2GV28J1n
	Mwb1yBEyRwILR4KcfaHi9WhRCxiQski+Y9MREQkCntrGu5pvebb96NEK2w+N7yEl3zqYc/fwQkG
	MRZPE9XjhWrEDxMS6R09N58QWO5a0ekOB5+ChE6BJQ3iohlsTZae+aY8RPFaBd/LPHUfZ
X-Gm-Gg: ATEYQzwzfM2xgajx7eTuHA+tvFvfSKWY6CvdiMkTJ43RsLBflu+uJ/M5DVSb9NpbGHg
	nxmn1F2pnDaEPX5i/okAxth2eVWHtX3tmSUkeyVJONeG6f3VDDFxX1AnvxIxklUkWRuqWMV303M
	SROfV8ZQyDs2afSJxxIonuGGNIm9mSmNffq1gYwOB5Y1Hg7V7k9fP3RQoHbmMQsUX0kuzLdmzbM
	WN6qtc5kVaPnqGPl5N2KFVH6LCWgbd1D35Eo+gLwzocGJuoD0mQkE3ZdTjG8TK4T+Npr0aaZjZK
	SKy8ciN2oIUB0ijOCrlprLWUIDd/kMTk0AifPn7r985UMDmRNLl8i0TbRNrh/uHgG0MTZBD/VX0
	9Xoiqw65wNjn/oXpJCmI1AgLk7XNaNChnaiibx9sOqxWH1sZHj7hm5wUyGtSsK7G498syUcjjtD
	slmuCSsgfi8XI6jDUytA==
X-Received: by 2002:a17:903:3c2b:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b269ab5ffamr23059205ad.18.1775026539044;
        Tue, 31 Mar 2026 23:55:39 -0700 (PDT)
X-Received: by 2002:a17:903:3c2b:b0:2b0:5968:a6d5 with SMTP id d9443c01a7336-2b269ab5ffamr23059055ad.18.1775026538539;
        Tue, 31 Mar 2026 23:55:38 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24ddc0afbsm137964415ad.64.2026.03.31.23.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:55:38 -0700 (PDT)
Message-ID: <fbca1547-d54d-4bab-89b9-404d97c3c08c@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 14:55:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
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
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
 <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
 <46d97aec-9f46-42bd-8725-2c236ffd13ba@oss.qualcomm.com>
 <4cb29e7a-9a75-4f8a-9036-c96e9190b7b0@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <4cb29e7a-9a75-4f8a-9036-c96e9190b7b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2MCBTYWx0ZWRfX2CNaqIiLlkxq
 kUGyWTjqNO5SRb++D4tu3n2dqxwHlT/D2QTRfApoibkYo8xHxhsRa0UH2qGq3GO9XzDwLjotuvD
 IS8+B09P6bHRy4j6K+rGS+VCB/9tZquK0Huk1aHR/kaH4/4SBFTSARlvZFkNjmOebmNJD+EDUC/
 O3QHbgKjycJ3ydDAVmdpNEuvSaEHKIv1ativLBaMn73chLT98EvQ64qrbQkkCy5CiDn5jq4biUb
 gv/+Dk4agXmTELioE3LGTTR4hqy4qjSjE8NlcMVQOrrAID36Db94uIqWx8O7BB4AYU3R1eRVIEw
 oGNRtNIxn4aFK9l1Lu6GqCtbwjDlpbNWux1hGG6ZKb+WcV4ZOkrnYev1Hr/Fp8p1oEr+GwB5E0J
 8k6GqHurxOE9/v40azBsvLyinyxyps0ITVZibVq2dMjLMN4aSEuJz37FuiUXsL399bP2eGVmyq9
 speHXaxpDR0Z79dnIAw==
X-Proofpoint-GUID: bUc41hkIoziufQD5UhJZe40714IKxZur
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc16b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FT7dueq81gZMvNQLzlUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bUc41hkIoziufQD5UhJZe40714IKxZur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010060
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101245-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E832375777
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 2:47 PM, Dmitry Baryshkov wrote:
> On 01/04/2026 09:44, Yongxing Mou wrote:
>>
>>
>> On 8/26/2025 5:10 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Whenever virtual channel slot allocation changes, the DP
>>>> source must send the action control trigger sequence to notify
>>>> the sink about the same. This would be applicable during the
>>>> start and stop of the pixel stream. Add the infrastructure
>>>> to be able to send ACT packets for the DP controller when
>>>> operating in MST mode.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++++++++ 
>>>> + +++++++++--
>>>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>>>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>>>   5 files changed, 44 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/ 
>>>> dp/dp_ctrl.c
>>>> index 
>>>> 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>>>       bool core_clks_on;
>>>>       bool link_clks_on;
>>>>       bool stream_clks_on[DP_STREAM_MAX];
>>>> +    bool mst_active;
>>>>   };
>>>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private 
>>>> *ctrl, u32 offset)
>>>> @@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct 
>>>> drm_dp_aux *aux,
>>>>       return 0;
>>>>   }
>>>> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
>>>> +{
>>>> +    struct msm_dp_ctrl_private *ctrl;
>>>> +    bool act_complete;
>>>> +
>>>> +    ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, 
>>>> msm_dp_ctrl);
>>>> +
>>>> +    if (!ctrl->mst_active)
>>>> +        return;
>>>> +
>>>> +    msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
>>>> +    /* make sure ACT signal is performed */
>>>> +    wmb();
>>>> +
>>>> +    msleep(20); /* needs 1 frame time */
>>>> +
>>>> +    act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
>>>> +
>>>> +    if (!act_complete)
>>>> +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete 
>>>> SUCCESS\n");
>>>> +    else
>>>> +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete 
>>>> failed\n");
>>>
>>> Shouldn't it return an error if the register dind't latch? Also,
>>> shouldn't we set mst_active only if the write went through?
>>>
>> In some cases, MST still works correctly even when the ACT trigger 
>> fails; here refer to the downstream implementation.
> 
> I don't think it is a good idea. It would be better to signal this to 
> the user and rollback the MST configuration (as in the case of any other 
> error).
> 
> I will change my mind if you point out i915, amdgpu or nouveau drivers 
> ignoring the ACT issues.
> 
Sure. Until I can find more convincing evidence, I will make the changes 
as requested.

