Return-Path: <linux-arm-msm+bounces-111100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t/BSLxzdIGpx8gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 04:04:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E263C57C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 04:04:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eGpmcRjt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TfuchAKy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111100-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111100-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E06E3040E3B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 02:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F18D2EBBA9;
	Thu,  4 Jun 2026 02:00:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4B2DEA6E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 02:00:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538438; cv=none; b=mQRzUZU1IG5HU3Tq1LCDtK7f14pTokB3hQYxCa+fuiuN1QlmmzWC/qMNNQZBifCLKohSPNWssRqmvSQasmuXBIslL7HRFjf3gP7hbVGYlmk+x6HSiLhaYfaXN7/l1F6MRt5MDuPnh2DehDtOboJv2V5vS06GFSYjWl2K6BTDB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538438; c=relaxed/simple;
	bh=dALv+GeRhOhibiyeNuGoTvi6I8lIZkQ6w/Pu9kYjP30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8zwvLS9y49qdWMJEmakeR9ah+8EfLhSJ4az5iq+tGOfvhMNsKwBznCT2fOMHWfqSQoLN+kptGYIkKg4XkPFWKlamch0mIYsPdIIKvX7oxMWqLK0d0orT+Fi/030A6hh6SjITTD708XT6W2ub4+UXhPrB3aGsQTuDx4egpy5L7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGpmcRjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfuchAKy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Leeln3240517
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 02:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPHZ6wKMWABJqg0xN4h85xPsb4s35aG+DXhckI5kGo0=; b=eGpmcRjtaKnKNsJJ
	i8tZW/0ayMiJSaar3Y4Vg+A5A5F2K2nws2HjllBemobpDmy9SSYsRoPEr+8v65QS
	qu5W6wlG/zQZ/+J3QOutlUJQWPrDkvhk+AkJAkQTqMwRxGgQABNMnP2rrmEeb9iV
	2JJeaKs3XHfDSwfqvFvCajOCQckrTc3+1OjXIUzgPiyPkgTGZLY56YeDbOdbtYLV
	QjDx5P9ooJn2WXcsWfcAX+Yz0PZyCQwd3Dy/rZyK6QH573VNrUAz6/JMacRS/JbK
	R3lkCZLpGjkiOOXAU1mzPXdqCCa4rFJnbfv6T8+c6QxfTaRWqPlBxB9+vZ4nJ1GV
	A9zvOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd08pvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:00:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0bfcd629eso2374465ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 19:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780538435; x=1781143235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPHZ6wKMWABJqg0xN4h85xPsb4s35aG+DXhckI5kGo0=;
        b=TfuchAKy+Blg+DPITumxfA/WSSUhLUEEAnAzHh+CaqC2H6qnl5Sj8FeNjZEl8EiQlu
         AURAjoiDzg9Rn6N1KNVD5RjkObVOOU1Tz0LSvzY9CPmMFlQqfb2dRulCMHYyCAi8RMS8
         7lz4N2AH3iTiKyhW0rsd3tQL7DavQAbN2tsRZqlFnjyBnUAq0ZeX12C2CanZ8lfCDa1C
         2BHuhUzZ9WcSwpt/ejNvV3YPuf0UfDaW7QbcBCSm81+/CqRhcYrs874ZL36zc2/w9QeD
         fTUJFAxEm/02AJEGf+dVbDDuKm2soXCS+wCB4v5dTkg9J/eMuh98NQScd0WrV8c+e2Y+
         gL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780538435; x=1781143235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPHZ6wKMWABJqg0xN4h85xPsb4s35aG+DXhckI5kGo0=;
        b=UkBid38rLiZ6E6NviV7CbHWX/4juqrON6AXzp2ho/zp8yd1ZZNWhd9geb9pGFsfgEX
         JmXfBLmwh2h4iYLVq3+Egbemh0Jo37S1Yk1FRRu308324a3Ndl4d3AK7s0wjXUWXbDp4
         63zQpAV0RR1xPAZXlqO3mH4RAXe09DdzWwrFHxF+XQ2QaCgzCut1CzeqZ9QSUsxcWRnY
         JD4LSgHtmbQs+z8XNTJP0nOklL7QqVcV946li/Hn5BJNmdKkuwtl+f3lyqn9PibJZGnm
         0tr1QdyJIjJVvKxPTDA+ps9xCZDv9deNMkYm9y6sU6qx9IREyN6G2K8UkLBwkoPuBgy6
         o4cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fbyaqKlFjjxWDutVbuXYCet5rxMyz8o0oyOoLzRvMJ+cmpnaUG2SIa7sARN8nxn7yvKfEYT/Gv+gKBWYK@vger.kernel.org
X-Gm-Message-State: AOJu0YwvUu+tLBka4nkjhayN4CX6DNP2+ki/m+rpHg5BXPvEyiAZhNcU
	4WkCGJnSh/wZaAoSpwetE4Xmlvu7JyFydQa0Zj29LPpqlwQtQ7D08thBQKgZdvnjogu1WZJFCBV
	2RLYbblv5eKtBZ8pM08jRZfgnQQRHJlCZA7yrOz4wEpGKWg89w1AuGpj7LfIjl9EKxs3vwpBNro
	GGrio=
X-Gm-Gg: Acq92OEnpErD62BnSSuIyd4kpfu8lAUOk0RtRHqZ+nOlE+LhZJC46WDRFuPBNRIB/06
	iXKPZ/EINpYLquauHmkDeCun0Xu3tj4vFvvYwHs15le7Ul0MEdP7TpkB/A6qejh3nzdjQQkuKxc
	/VxOVRvDMqzTB96pwB62aUzLLaEoBvxKxt+/6n5YWFxsgXj0FAFW8sldPdI1HeIWSHzwr/YHwlc
	P2rA7XrVxYNeznqrQDm7SpkRKDxh5DNGS6D6KvMd/z1rNTuCuBoSwGe55TlehQnuaed+RxwZPsB
	cxA+xS8+mWfO6oxUk+83L4zIoxiQE0a8FEc1GvntpFpN1TMfvM302ONdgE2W4lBhDnqlUxbSWJ3
	DkB1cx3xmDY0BsZ4Qu6+2gFRKxl4JI5r/PfhpNp0KQF79TP+LhBJHQsHswbwYdOvPgCKOATTCI5
	tIbKh2iJka9+L7WmUywuk6
X-Received: by 2002:a17:903:3810:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c1644add2fmr66963835ad.33.1780538434770;
        Wed, 03 Jun 2026 19:00:34 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c1644add2fmr66963345ad.33.1780538434322;
        Wed, 03 Jun 2026 19:00:34 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm37901735ad.7.2026.06.03.19.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 19:00:33 -0700 (PDT)
Message-ID: <36a64e47-9d61-4641-94fd-2568d86fd067@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 10:00:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: fix runtime PM reference leaks
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260604004404.34797-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260604004404.34797-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N_F_ipUCfGAQGZsyvmQ6s1f4y5d3jG7z
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a20dc43 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=0rn2apig9_SYVe37ewgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: N_F_ipUCfGAQGZsyvmQ6s1f4y5d3jG7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxNyBTYWx0ZWRfX5sDgcuReHrzK
 GiXuXwwpSwJFPIaufVpHrxZzc8ljY0LlOB+VjwPNflyPxsCjxAvA0XYkTlrUwGT2J007wLfTrjD
 f6IqV2vpRqTdTZsD9Vw3FqipYaEcGzwlFiR7azbiUeMFPNKlP1K5uojL1n3/dNTMBOwy7nUxA09
 pet7aGJZogFgFQFqmw7L3DD6u1dyy03jVYtCqo8DehvP1O9AAyatmplAlucbT84MZupr5CBljxd
 DQatq3Y93d1tbpY2hY2Mmtu5JvQkGDrR9w8ALsShnzYX4XoR7BI6OxCv1f7Jrgp9nJf1h8l50V+
 q/lhEzvTQ9NCKzYHpmf9WQaNJsCOplPRQJInXkr1Ga/woSDyErf4WP4FdQ3LwMXvs9WqEUjuXaC
 JFElvjHxZ6Zg/bPPwCHBa5jt36+KXHwYvAnDdFxpA3Yp6g+JMEHIjU9XSDlDULq5VnbpZQiU168
 PKZEcd5pc215prZkc6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040017
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,linux.dev,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B92E263C57C



On 6/4/2026 8:44 AM, Hungyu Lin wrote:
> Use pm_runtime_resume_and_get() in iris_enable_power_domains()
> to avoid leaking a runtime PM usage count on failure.
> 
> Also ensure pm_runtime_put_sync() is always called in
> iris_disable_power_domains(), even when iris_opp_set_rate()
> fails, so runtime PM references remain balanced.
> 

Please add a fix tag for the fix patch.

Fixes: bb8a95aa038e ("media: iris: implement power management")

Thanks,
Jie

> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>   drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..f5e3341e1430 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>   	if (ret)
>   		return ret;
>   
> -	ret = pm_runtime_get_sync(pd_dev);
> -	if (ret < 0)
> +	ret = pm_runtime_resume_and_get(pd_dev);
> +	if (ret)
>   		return ret;
>   
> -	return ret;
> +	return 0;
>   }
>   
>   int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> @@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>   	int ret;
>   
>   	ret = iris_opp_set_rate(core->dev, 0);
> -	if (ret)
> -		return ret;
>   
>   	pm_runtime_put_sync(pd_dev);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)


