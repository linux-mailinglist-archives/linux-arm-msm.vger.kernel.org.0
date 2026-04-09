Return-Path: <linux-arm-msm+bounces-102478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBakJ4iO12nzPggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:33:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A055B3C9B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7116C30074F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3436B34BA28;
	Thu,  9 Apr 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQgtvptO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQBWO9WB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661533F58E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734402; cv=none; b=PtVWLKcTElNiYbvOA1LNLQY8HSJGnSgta8udeBJ4+/JPWvYJWbqMtsFrTXg/eJMKBk2Co8aCBZyWR+EvX696+j7QuHuCtssAtVxnGWialCF7bUVyyNodydFXqoej1v9TjotqrveMFtoNi9jsRa+faI2vwCHGf+hobXE2n7+6ins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734402; c=relaxed/simple;
	bh=iz6B2SvsfMyjUttUgTJKjLo7OCUxwzZngdfJqkjVMMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdRSUnNTeZNUpzI2GTN033fLajRIHUEASKfcO1HN0fZQZ2TrgXIl9llgvnaVhRZ3/+YNnG0EG4pb52KarzpMTTlVeD4B5Wacyeq9vDjCeK+OQvcvKvnnWr5xfQy+1zqchcZi0Ui5bhd2WjRtYT1v8Z6q+HPepJJOBNW5xJNJG7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQgtvptO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQBWO9WB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396n8f82845045
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 11:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSQtNNtrN/Cj2ZcaKm5dvAcEzbJkLVwFQlaO2exXYfE=; b=GQgtvptOFJ4Wk0NK
	uevgShDBYjEwp02c0y6ad0DT+UWmh5HrVL6y/p5Pu3qQsWBdp98zLG5CCig4g8p2
	amiYLolhg9ESXTTmG6w9gXJoJK8Xa6MSvrjuTaTTRJNrIrM35JArJOcq6MPTHSHU
	vaMKRQs5TGHdLlNAO+HYIL1Iz9bR82vGhYRbhp98e9/2uxqXh7uRBDjKo3g/Xrmn
	hEA+fqOksFk45bfgEgy8hh3bO/xkKdQBVzGGrDkDxhT9M0J/11w/omMX1OB1PuB9
	OZtIZL+YmWyR6fzits8WTA5QDA0jiwfacn8oZR1MYtqwlG3za8Ji7vcVbdE2Kqov
	Xb/PjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt7hktdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:33:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so1007328a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775734399; x=1776339199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSQtNNtrN/Cj2ZcaKm5dvAcEzbJkLVwFQlaO2exXYfE=;
        b=aQBWO9WBWRC1G0sSrZpw9rhjJltCPOLfOWVQ0Ao+Tn8DLEo+CS18pYjnqh4LUqOO0+
         gKF5woZ2nPfyj5kzBFuhw62i7jY+xIZSlTyNnIVPEe6CCB2YNvKqB/7amH9KDx4t94e1
         4CjAGzGWaA8HZ7QChxJeljv9NVgn4zDZYcKZfHWTSfbRs/y3giPJOeuOFSKiFYIFbxSx
         kvo7nSyslgSAxKpKX0FxzWD5Z8MGACjOEMvgX0NtLqPXgwKGgOsTIpM2TcSKZd+HvuHj
         O51JflNLZBBvyUdLeJkzmxmQxNZ3TKIXWrxtZmbEeaWux070seRC+KiUD3eV0MFmHiou
         q7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734399; x=1776339199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSQtNNtrN/Cj2ZcaKm5dvAcEzbJkLVwFQlaO2exXYfE=;
        b=eG1O53ibr5cmoCblgLa9+bgPZY7KcYaUMNkEUmj+ixSs1GrQ+5ms2/mf5K5IJdwsAV
         NZnmkqgqHdwtunrveLtD/a12pNTs0dPYwbeCfjbIt0bKC2YNj5gPSm2aV2XWDgZgX2NT
         pjKRCBOUCHwV6BoEsD2qA57jeDW6YDRHkHdJur6qbLCDDwzoO0+zJKhkltGWUyTNMdnF
         OWHP5DrISZYXFQuWZH3yypl3R2Zx2eVOdS+ViGX9wSvAwfQv2ZzUR2hNF8ZfvNGPoeaw
         /LJ1cwEXXsjVfoeTWpjfcFhNoe7bYCJYqTgwLRi0m9OthEq6ZbY3bHKnrjUVeIpl/Vb7
         PFuA==
X-Forwarded-Encrypted: i=1; AJvYcCWmWFUB8Xeqtyx68dUkVz1H7DgsbshxwA4EygZ9r5yXqWGhDjn0+iRLzoBB3Cs4hWYuJAWAjM3SRvUGDV5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5TIb0DhgVQ7Jm9dwj4ZRSm2uFW1V/xyyEPW2E+D9z7IkSvrBW
	s9oLcVHZM3sPNL359a5TCr4tlokul7GDBKMjYDN0BXMd30TGnbd4Z1LhFcM89XShm4Ma4UBlT0h
	qnb5XnFnpN9mqn6QFhBDD/sAW8PuB7cPwRoKUNnU8lSipYzFBBFN4y6xHLSgIHGQwM33E
X-Gm-Gg: AeBDieu5MaLoyJA/XHOTF8fQUVM5u2S1DQ1+MoK7HPPsjc5BSo4b1hiItgQeSxABUu2
	sRpgBWww5LKqqrk8nNVyG7RQJaNLfAoCuYQ+EguT8/16KX+3q3+27bCtF1oV/TLdXqvpyZVwW/3
	FPP8dXYuuRBBo7wNtRXxYWCXSO48GnedmZG2cN0DbaPPeXu+BeRCRGwEHYbMT5yEUSc6+1LsKsT
	Mg/HfTUJDClc7zs2aUBb1cu9Dk8TDdaztJ94m+P1M/Oyr1XkoWkS4g8YE+2zASbHPJnBMe7a3yM
	/jGFZ/oNq9eaLJwgt81CglM57VwR+DbHiObyQ5de3E8XymRMMVuDMP4hYUgH9SJOcyU82zUvuXG
	WfYPZQXmtcQQt8r7ksfw9cFYS8WG80d4vTPdc/DvGm9tsHcj/t7IGTW/tedYKYndGgE+V+WnnzF
	NsBWIxVsK7dFyQSOmo/g==
X-Received: by 2002:a17:90a:e7ce:b0:35c:195e:112f with SMTP id 98e67ed59e1d1-35e3548977fmr3157566a91.18.1775734398596;
        Thu, 09 Apr 2026 04:33:18 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:35c:195e:112f with SMTP id 98e67ed59e1d1-35e3548977fmr3157537a91.18.1775734398074;
        Thu, 09 Apr 2026 04:33:18 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e34cece9esm1549105a91.1.2026.04.09.04.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 04:33:17 -0700 (PDT)
Message-ID: <1e3e0fd7-742b-49cd-b432-da9bd2a0ba7b@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 19:33:12 +0800
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
 <fbca1547-d54d-4bab-89b9-404d97c3c08c@oss.qualcomm.com>
 <4rhd6qlj4jevrnj2zqctqrcbpkvcalk5qmr3ryuk6ewwa7e35p@o7xzhuzfsms2>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <4rhd6qlj4jevrnj2zqctqrcbpkvcalk5qmr3ryuk6ewwa7e35p@o7xzhuzfsms2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O5IJeh9W c=1 sm=1 tr=0 ts=69d78e7f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YxuP5ldsg-JQntm2Dv8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DYP2-S4fuZmN_v2G2Oxm5O1wcS3sYIlQ
X-Proofpoint-GUID: DYP2-S4fuZmN_v2G2Oxm5O1wcS3sYIlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwMyBTYWx0ZWRfXwab4iB9Xc0WL
 9xmdPibhhLXFAE4uQdHV7dDqwyWIWvzs6Efc/fQa6UQyZmUJ0fbSRtlFfWpM3xM/G9tHQL9cB0P
 HGqo0ZPcO7hXkZsZgJs46JyifNuisuXTyUiw2sYNir5f/X+xPD9vD7Lgls39jGvS3fUCWUJ2U1I
 4e58j6LvXK75F1J1ZlOE9guYz7etH6DP5R24YadbO3TrjXilh6Dx0/YVQ452fkVNAoMI4Q6/Rz2
 gWppfBC9klrmZYHQmzEQ1gZfzxe62RJ30kh0yaD7KIuyP+C5sNMxAXJNgqlue/oNugWzmB0T/e2
 YoWGaKe1af5D6b15lnbZBfbQ4Od7HJ0VBTejl7bHL3bcyjq9pgA4ivFo/2mrhYBojbN67hRXAhl
 xYNg2q8FeDGL1J+clIMiFbusEBuvIkA4a8MFIBfo4g4NL/D0BOZAU7IaD4KLd1tlOOgmi5j4G3N
 /cSQ9FtAxMwAHaAp6/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090103
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
	TAGGED_FROM(0.00)[bounces-102478-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: A055B3C9B1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 7:27 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 02:55:32PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/1/2026 2:47 PM, Dmitry Baryshkov wrote:
>>> On 01/04/2026 09:44, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 8/26/2025 5:10 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> Whenever virtual channel slot allocation changes, the DP
>>>>>> source must send the action control trigger sequence to notify
>>>>>> the sink about the same. This would be applicable during the
>>>>>> start and stop of the pixel stream. Add the infrastructure
>>>>>> to be able to send ACT packets for the DP controller when
>>>>>> operating in MST mode.
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39
>>>>>> +++++++++++++++++++++++++ + +++++++++--
>>>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>>>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>>>>>    5 files changed, 44 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> b/drivers/gpu/drm/msm/ dp/dp_ctrl.c
>>>>>> index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a
>>>>>> 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>>>>>        bool core_clks_on;
>>>>>>        bool link_clks_on;
>>>>>>        bool stream_clks_on[DP_STREAM_MAX];
>>>>>> +    bool mst_active;
>>>>>>    };
>>>>>>    static inline u32 msm_dp_read_ahb(const struct
>>>>>> msm_dp_ctrl_private *ctrl, u32 offset)
>>>>>> @@ -227,6 +228,32 @@ static int
>>>>>> msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>>>>>>        return 0;
>>>>>>    }
>>>>>> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
>>>>>> +{
>>>>>> +    struct msm_dp_ctrl_private *ctrl;
>>>>>> +    bool act_complete;
>>>>>> +
>>>>>> +    ctrl = container_of(msm_dp_ctrl, struct
>>>>>> msm_dp_ctrl_private, msm_dp_ctrl);
>>>>>> +
>>>>>> +    if (!ctrl->mst_active)
>>>>>> +        return;
>>>>>> +
>>>>>> +    msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
>>>>>> +    /* make sure ACT signal is performed */
>>>>>> +    wmb();
>>>>>> +
>>>>>> +    msleep(20); /* needs 1 frame time */
>>>>>> +
>>>>>> +    act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
>>>>>> +
>>>>>> +    if (!act_complete)
>>>>>> +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete
>>>>>> SUCCESS\n");
>>>>>> +    else
>>>>>> +        drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete
>>>>>> failed\n");
>>>>>
>>>>> Shouldn't it return an error if the register dind't latch? Also,
>>>>> shouldn't we set mst_active only if the write went through?
>>>>>
>>>> In some cases, MST still works correctly even when the ACT trigger
>>>> fails; here refer to the downstream implementation.
>>>
>>> I don't think it is a good idea. It would be better to signal this to
>>> the user and rollback the MST configuration (as in the case of any other
>>> error).
>>>
>>> I will change my mind if you point out i915, amdgpu or nouveau drivers
>>> ignoring the ACT issues.
>>>
>> Sure. Until I can find more convincing evidence, I will make the changes as
>> requested.
> 
> Or you can point out the relevant part of the standard.
> 
Emm ,the DP HPG only specifies that an MST_ACT needs to be issued, and 
does not require validating its contents. This appears to be a 
Qualcomm‑specific hardware register, not a generic one.




