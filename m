Return-Path: <linux-arm-msm+bounces-108686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EwIHCiKDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:17:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C1858B91E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFB0D303A1B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57653D75CD;
	Wed, 20 May 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dur7BtJP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+INhhKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E36F3D75B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272184; cv=none; b=ntcXpeIzAeVvU4cA9dAgihLIEdCmYvMvSWRWGU5lew200q4WFtXlnFZjCRvGJbvpqnvz9Pvn/9pAHZaoGQe3SDlxTOSfEOQyFYP25CHQ4jtATkb4yKcMAfR81TZP84xEEGe00R9CWOp6DBE2ab+aCeeVb8TJGHJ5AoWbf9XpbEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272184; c=relaxed/simple;
	bh=I8G1k76NNs/Xtv0KhT9VDQ8pzsCOJaJKPOxPm2Szruo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPTkZ5rnFm4hwXVuETyb1acU4gos5tial/qolMpeNvzWblcQHZW1OA8FpMYV4NZA6cQ1VKDk3S+fkYN589zD3Gfxob5BpO7sAl2PZn0m/KvmycnyGFsTwmx1b1/O9F7miqnCNZqhLsqup1Y0x66Kxx7fJsKcYmQNb+mm1vpz+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dur7BtJP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+INhhKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6qGt3629581
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLPdSyncFsO6G0/UzGd9/9d7L2FVL/Q63pbwujX07LQ=; b=dur7BtJP0OnsCBQV
	ABJAhPsQeOX7Obe09IL9Jo0WhgLzM0qWkzyKcUixEcY2w1NUHYH4HxBrg0WRwoL8
	/ci9nWX0JIofgzK570Lb/2S/V58DVgYqL+uf5ucSca/sfKICHXnvKOYKLi/k4Y17
	iLWcxWevX41R29IgZ2ui/SxcNc5w83w31hp4twpWUlsMR/ZpVK6uZC2Vlv61ePXr
	gNf1hf15GOoX5j++hOlQhA0HeTM+pAKATV8jQLTkXFLqXSJ72UJFsqmcNXczTDoY
	AzcU0JHdqwW7fEYz2IzhSZf5LIH7ZIiyLi3PAp2OfIQmF1wphFrd2q84/WXGeSPQ
	PMEQOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nv9g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:16:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662668b825so9476298a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779272172; x=1779876972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLPdSyncFsO6G0/UzGd9/9d7L2FVL/Q63pbwujX07LQ=;
        b=W+INhhKbzJ/1Of9EONajl97rhUugotaTdFnb70JmXsZVzPjXoVrliV510+YvE6GJHK
         faDEH4rn7D5fnb2vhuN1+MG+MFuwJSOQamBc0cK7uXOoiZyvmKZIqLRNo4hrcFNVB6Dh
         LJFws4yInCcgNiuoKbFaMmRSE/old430Zzep4SR+dfo/eS1gGEhj1Buam5xaGNF1Ed/H
         QhFPjgh7o6g+TrBnpsUXTW9qrur5EgsqHOtOPPvLiOGqY3SbECLhkw7eK2q6RZV6YgxI
         pLV8gGFaipiSdUeCAINFsNZbumcKZWC+YOum0Nke3k/kZOWmjVormsmg9Hvow8D9oCr/
         ywJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272172; x=1779876972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLPdSyncFsO6G0/UzGd9/9d7L2FVL/Q63pbwujX07LQ=;
        b=YlmUG7YnqiDkFpXJxvApIfbrD/meURWOnsfHdu+snhYsClk1tMCFolzhXdNJezPEbd
         hFMdvFxhwsmkDwxI9XoCyOsD+OSYS86JY8QifI+5K8ZAxNMt9fM2ZEB7V/U0dhSmtCe+
         FinqV0m0cNWGd01mvjE6SyGyDJ3sWxTGc1pBi6qK4aiw9+pEgxY8eOT2LU4BCqr4RBt4
         P91GGxy0mrtxOWPM5s4vFU6TvsjR7RCrjtt/SwUikmzyeEJEBQy0bW7aS9DZoVPgCAqd
         2T2/1XcOwYqXVgPGhz6n8AelGC0eI2f527jpPI9bsY8QYvQNRWZjh0H87A4+IKqvQuHN
         EJaA==
X-Forwarded-Encrypted: i=1; AFNElJ/kZ0F1nzX7newHhvZs1KkqMS7o8+ZoOKFZD2TOC9Yzq/v6GQ3VRUEjByGQE189OltHfw8kqEjl0bA6Lstk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/27Zf9zjhV8Z502FeuZGOghQtn80/EqXst7F/vEoFrtf9gnaD
	zxRYZy5/u1Ia1ByFHYKFbUcmSQq1ULnkZ0KbYrXKlCdsV32o9JMAJXDR9Ti0/25nAZIuVl9oKi9
	yq/0gMkZtincVEEKaR+6QHGgpoNxVP7ZGCTAIotpbBixzgQV5sXwDuy0VqV3gTADPL+PM
X-Gm-Gg: Acq92OH/UhFMTgb3EE+m51MjQFrrFRGISNsuD3ky5e6fH94ubGG+cgUv+QF+XX1M01n
	xrewiL+cVqtkPMHyrd0anyewRmxwPrr76kwBiukUySyn/eSvAZEYTc/lPyQv3xJr6qXY8ZOoJQc
	URL9Xe/16eltsawxE84VySKBfqowCTS0b9LCsnOU2sLA94QIE5iCn+OGXrqg+7nso98vrcgC8X3
	1KoYcZWJJs4S9pVYp4IKuuoiOPKuzvudT+qsaxPGe1s4ZigkTWTT8Ci47aw9U6wfBq1EbuBQ5az
	TZUUtPmWXLLE47O9ouBo1FhEkC6Cq26R5yYaS1uBQyZkEgpUCFU3ZxNnKmezPGtuQ4C8tRIdQEo
	kka7LrWk8ik3kJRBoqPDTYhHyTjUJE6fK5NPTVx7IEM7Li3T4AGebWk5lxWJRryFe10uO2MTtsX
	NZDKCn/Fgyv538ELeH9w==
X-Received: by 2002:a17:90b:5290:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36951a044b5mr22745959a91.7.1779272171932;
        Wed, 20 May 2026 03:16:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36951a044b5mr22745868a91.7.1779272170556;
        Wed, 20 May 2026 03:16:10 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36968dae27bsm15108021a91.1.2026.05.20.03.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:16:10 -0700 (PDT)
Message-ID: <c1eb178a-4cde-4a4a-bfd9-e3b0ce4b52da@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:16:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/39] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
 <omw63f7fbqiuw2t266dq5drk7rz2kohydpvbbhcrbfiehb7lzh@aucqhfaliams>
 <57f574d3-7000-42c8-a5b7-88f1a73efd50@oss.qualcomm.com>
 <etjni6nlx5a6xd4oqb6ow5ihxdl5zcdtcofmo74pbdt7lilnxd@q2zqgiqycjt3>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <etjni6nlx5a6xd4oqb6ow5ihxdl5zcdtcofmo74pbdt7lilnxd@q2zqgiqycjt3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5OCBTYWx0ZWRfX34zx7hCq0eH/
 YcgwwQW8zwcZF19oIUbUKHMU8gRWqw+TGFG+fqF65GACLKPxbzR5H28xsz5UzxWKZQTAaviSQBP
 UltWIzyfISdt+OxUnfeFnVQ/pQfaBKObyMaMZz105G4qYvezVFoIDi+AGCu8b0rR8t58sKcKdw6
 NmE7WdV/72j9UqHJPTqn0Dee9gr69GzgDGLmXXxAg1mRGOhwfb9GLTMRPGgvIYGMlPs7T0aqubt
 qPATsTLLYJe8pcMcSy+CgZNBHvotv/8XOFucmlz+dnXDAybkvreFWIrO4QZfh/mplfLOSs9PXNI
 2wmm076eIIdrTp7AAZJfFAbqqtbztBEpfm3KbalAXff8KEPfWGzqYhXFQvtgE9VQITTXh0a/gn9
 Mhp96zLG+jdNo4oyBJu4iTehWyysPAtTJG6W1bZIT5XXWQlTOVUAfZi819I4Xh1BFcdmNv84Xj3
 jdsQBO9TfJ0E4wPLx6w==
X-Proofpoint-GUID: pCvXly-IRc58LrO86b1KhQP6idR2C5q4
X-Proofpoint-ORIG-GUID: pCvXly-IRc58LrO86b1KhQP6idR2C5q4
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d89ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0cozv7LJkoRnZ4qxxmgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108686-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11C1858B91E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 5:23 PM, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 03:46:36PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 1:34 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:40PM +0800, Yongxing Mou wrote:
>>>> The DP_CONFIGURATION_CTRL register contains both link-level and
>>>> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
>>>> all of them together. Separates the configuration into link parts and
>>>> streams part for support MST.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c | 43 ++++++++++++++++++++++++++--------------
>>>>    1 file changed, 28 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index 476346e3ac19..85315467b5d0 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -388,26 +388,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>>>    	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>>>>    }
>>>> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>>> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>>> +					    struct msm_dp_panel *msm_dp_panel)
>>>>    {
>>>>    	u32 config = 0, tbd;
>>>> +
>>>> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>>>> +
>>>> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>>> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>>>> +
>>>> +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>>>> +					      msm_dp_panel->msm_dp_mode.bpp);
>>>> +
>>>> +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>>>> +
>>>> +	if (msm_dp_panel->psr_cap.version)
>>>> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>>>> +
>>>> +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>>>> +
>>>> +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>>
>>> You have an RMW cycle here. Please document what prevents it from racing
>>> with the concurrent msm_dp_ctrl_config_ctrl_link().
>>>
>> Here protected by mst_lock in MST case. Will add a comment.
> 
> And in SST case?
>
Emm, do you think this comments fine?

   /*
    * RMW: in SST, config_ctrl_link and config_ctrl_streams are called
    * sequentially on the same thread. In MST, caller holds mst_lock.
    */

>>>> +}
>>>> +
>>>> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>>>> +{
>>>> +	u32 config = 0;
>>>>    	const u8 *dpcd = ctrl->panel->dpcd;
>>>>    	/* Default-> LSCLK DIV: 1/4 LCLK  */
>>>>    	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>>> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>>>> -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>>>> -
>>>>    	/* Scrambler reset enable */
>>>>    	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>>>>    		config |= DP_CONFIGURATION_CTRL_ASSR;
>>>> -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>>>> -			ctrl->panel->msm_dp_mode.bpp);
>>>> -
>>>> -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>>>> -
>>>>    	/* Num of Lanes */
>>>>    	config |= ((ctrl->link->link_params.num_lanes - 1)
>>>>    			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
>>>> @@ -421,10 +436,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>>>    	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>>>>    	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>>>> -	if (ctrl->panel->psr_cap.version)
>>>> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>>>> -
>>>> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
>>>> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>>>>    	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>>>    }
>>>> @@ -450,7 +462,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>>>>    	msm_dp_ctrl_lane_mapping(ctrl);
>>>>    	msm_dp_setup_peripheral_flush(ctrl);
>>>> -	msm_dp_ctrl_config_ctrl(ctrl);
>>>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>>>> +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>>>>    	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
>>>>    	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
>>>> @@ -1628,7 +1641,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>>>    	u8 assr;
>>>>    	struct msm_dp_link_info link_info = {0};
>>>> -	msm_dp_ctrl_config_ctrl(ctrl);
>>>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>>>>    	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>>>>    	link_info.rate = ctrl->link->link_params.rate;
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 


