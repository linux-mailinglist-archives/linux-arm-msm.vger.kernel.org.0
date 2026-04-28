Return-Path: <linux-arm-msm+bounces-104915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCQhJTd08Gn5TgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:47:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401B48081E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 269773082044
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366803D6CD7;
	Tue, 28 Apr 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGo22BVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAvwdHem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2A3D6CC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365570; cv=none; b=ENyZPqxSp5yf1V26AYLXBnzm3MlOP98t5nQLKTFwwY+XlRhwU3jxlu1plA0KN+8S6dgJp0qUjDiGTykYFG10mxil+1buOSeERyeHPGa6fyz1KonA+5T6MzishK+DsdAbCTJZzaffR9dhT336g4unrGpZW5PBWK2b+QQngCEst6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365570; c=relaxed/simple;
	bh=KL4znERtt/tJO4ikEqK5eErCZF16B28Ar9LH6Hju0GY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W2mPxiR7tiuJ7D0iKOwfBo2WSIONggdl2f20hskMIUaH3N1LmVYDFjV36Sdn3OjUCOUFNDrJzzUrr+4wzJsAr6rojg+pi8pMqJ6wKT0mxaIcPQtgzuTkobk6V8aseS0SkA5CjYsbX0tcFePxNbccI/KyhZz5plKCmMTg0aUI8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGo22BVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAvwdHem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7wCj11746795
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyV96uodgdeNjz4t0ZV0JjfLYUJILt61U+hBRQpFU/E=; b=aGo22BVc2lIYE6ya
	cPp2mw/mt4btxIjD72T6x/OYQ4UOOPYr+rldbx0gGyqXt180/p67T3mK/VpRxiQ0
	BrkTHFsA1bmj8ZQPWtIpFdQbzgINBeRhhDetym/o+iB0l8pNvS2+Vk4V6R81SRRv
	Y6/EocRlLPklgQOfsJYYQ/piTlLxquuYr3xgBRS6X28kCaiZISbaGkFkujFWcycQ
	nGCUNKyvLR9Hq78tqlU9YFWEW6GXfTFEPJ/ewK1xaWEQJwbqopXccWbY0rXPGkop
	Nj2eIKZTnmvf6sM/zhNcbtCUq0cDZBf1LmsoZTC88MUEhSgUhlaNC6nCcid9Lgvs
	Hm4DSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd853s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:39:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so116534131cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365567; x=1777970367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyV96uodgdeNjz4t0ZV0JjfLYUJILt61U+hBRQpFU/E=;
        b=TAvwdHemCNtoWuEHG60VQM6oeSeVDuV9XFxVkecuMA9G05tp0zZgQeIEHStdS8kA34
         5wqDcaWGIjKNXkQ3nJS7zbVE4ret44mOSS6nT0POxGQ17bTxG0la9xwp9et45w9iCccq
         6PZulW29RvQSan0bCOZ5oUi3z2KMIbwS9ut2gd9X9BAjBpEiUoFr4QxvNwgHrKXp1E1A
         arBduF4s5a6z5W7bc9saGFhD752B8QsPm2ADWKwt9ZS2Nn1gVg/Tzb7sFBWv4NSRhjnI
         MS14rt+xgVFScAVCa51Yftg6W9fTtBLNMThko/OVCRtGnDHOwnNVqv6JleUsKNHjPyuG
         wIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365567; x=1777970367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyV96uodgdeNjz4t0ZV0JjfLYUJILt61U+hBRQpFU/E=;
        b=EQed4teN8BtT7VNAKdpNO7k0LJY9dZGM8u9ArLbrzOzX0N4vs7mrlHqaeEMN6uYxJR
         ynaXoKfaS9zfE/I8ektkZWcv6mcSIAzA8n/kRa29X5S3rO7G/NKqKZ2d4OgopjV7GXsi
         c7Fwz1btG9zzWQx9/k2o3JsYR0CWX3TTBQbd3w/7MYjub9MtN+9da1+VlyRcY0aBX/Iq
         g5JDWxp+nw6w+HFDm43QmNRltKZkcNfQCkqHHj5gIueD/biA6R0MJ88DTgxhRSIMhwPe
         T9DKx9CjTAeX+axn0yBeeqvUtC6mWl+KnGMhx/Qgo2m5NCt4uwkLfAdW8jW7ZCzQQBEw
         xwOA==
X-Forwarded-Encrypted: i=1; AFNElJ+ynFJPCuwcbegoGPQcMzgjfAADhp0io3gcq5MtxUho2lmnyvyt3+eHXHxh9rDWeDyCVkO48r9cKSFhryc9@vger.kernel.org
X-Gm-Message-State: AOJu0YxKkKSMUdjV54itfzXnLwB+VU6A3x8krBlEmn9mb/FvKxQQv3wm
	+iD+zrL9XUqFDHFkggodcQO1SKb+JuJVDBbc99x5esFWu5RZTIafBu3r1VGeJkATa28PjOQZITy
	5h0qR+esMdVh6S/odMoN6DZgwejszV3VC6YDkgb2rYN+XUmW1lIktzDBOpOFA4ZTaccYGmqz0Ob
	Lz
X-Gm-Gg: AeBDiess8o8ITpK07HJqCbObevSWE2SOwdo6LWfKEHL+Lx3HgUCft1swSx4Nb3b/dAq
	cZMH0wRqeWJAAwODIXZLOMqairJ0CClTSawEf6mujEHIMd+hTKyaf/NJCnenOsdf/FJ/iUOuw33
	564JyPJoHThkZPkTI/SI7CAJTgjjsIMgiRZpgh0/DLqu6/XG0345gzqpjWgi3oJ+WqeMUBWtGel
	l7wYFnXRRMylG2AStps+LzVgNSkzMebH8u7P3tIJhuPHPnVPAxWKUXEQKhmjUkV7es71gYEkOe2
	J/JIdFbMsiGIKaekFP6FnN00OXUWj9ackUQywibATxR2+XJX+FsDTxsjQ3bJAbLE9+HzLapLzKk
	pyt1rirlxhF0/S497Xu8COvye0AjZAOCfbK3DY7ima6PvFclFUGGUwhJFcyBxNf4xT0jyaQMpgH
	mzOoCGVP4W25npOM1S8QYnkI47gr1yx/c/KBfv28h2qo8KGOtnmqZTvfDgbSy0Hoc6vCQXUREVm
	debGNdijMS3cN2Lw+L3JtmaiSM=
X-Received: by 2002:a05:622a:653:b0:50e:5a33:672c with SMTP id d75a77b69052e-5100e125124mr27627701cf.17.1777365566717;
        Tue, 28 Apr 2026 01:39:26 -0700 (PDT)
X-Received: by 2002:a05:622a:653:b0:50e:5a33:672c with SMTP id d75a77b69052e-5100e125124mr27627481cf.17.1777365566209;
        Tue, 28 Apr 2026 01:39:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb809021ffcsm65545566b.23.2026.04.28.01.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:39:25 -0700 (PDT)
Message-ID: <67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:39:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <ae-YlXZAuWqgPd-c@baldur>
Content-Language: en-US, nl
In-Reply-To: <ae-YlXZAuWqgPd-c@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 39ag3n89iZhOSit-Ujv7pmi4UoL-x1cO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OSBTYWx0ZWRfX5XEMeD14DBPi
 bK2Pf4K+Hu1+sjNdrqnxu/z/bGkhc5PEvky+mGO+Mh1smFNPTt/wQGrNHthgy9GNfMxIbF/LVTX
 L6Pu7s8ZdBTz8Drh0akr4nzPZGdArYVznzrb5l8d33vLTLn7gmY1BwHug4ow3GvCJTiINS0ngZx
 Wz+R+7KEFnyYE7MQqzsUdjGSNADD2OP2aUG+fwif9a2TnE5oJcEBcZ/rxNTdG9D5O7eydOp9aOH
 kwxn5kF5Rv7WovGkkUh7ce8YismJRlQZmI4EcII50CIkGrXdmsHZH9xhPRlydkp4VYmgmyZSR9a
 iSX9qMc3YnXes7/MA6B/kf4ZtQ1d8TQNsJaAoXr9Q9HW27WwA7bOX6ta2nvXpOcV4nlEFSX5v9W
 G18thpVbhmd0Pgs8myrkJQeG3JQBSOstn92odq1/+0GvnIXWfTbc8Tcz5ONlLETZ6hh5Tz3dqCp
 KaCoaLdtzLXW0WJIB0Q==
X-Proofpoint-ORIG-GUID: 39ag3n89iZhOSit-Ujv7pmi4UoL-x1cO
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f07240 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UM9yahQYuGUx-RwQQNcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280079
X-Rspamd-Queue-Id: 3401B48081E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-104915-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi,

On 27-Apr-26 19:12, Bjorn Andersson wrote:
> On Sat, Apr 25, 2026 at 02:33:51PM +0200, Hans de Goede wrote:
>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>> to stop functioning. The EFI GOP framebuffer should keep working until
>> the msm display driver loads, to help with boot debugging and to ensure
>> display output when the msm module is not in the initramfs.
>>
>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>
> 
> Wonderful, thank you!
> 
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Could we attribute this to one of the commits that changed the parking
> behavior and get a Fixes: here, so that we could pick it for -rc?

Ok, looking at the clk-rcg2.c git log I think that should be:

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")

Please let me know if you want a v2 with that tag added instead
of having the tag separately in thread here.

Regards,

Hans




>> ---
>>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
>> index aa7fd43969f9..cd45bedf2649 100644
>> --- a/drivers/clk/qcom/dispcc-x1e80100.c
>> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
>> @@ -580,7 +580,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>>  		.parent_data = disp_cc_parent_data_6,
>>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>>  		.flags = CLK_SET_RATE_PARENT,
>> -		.ops = &clk_rcg2_shared_ops,
>> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>>  	},
>>  };
>>  
>> -- 
>> 2.54.0
>>


