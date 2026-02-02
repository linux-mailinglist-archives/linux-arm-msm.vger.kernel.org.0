Return-Path: <linux-arm-msm+bounces-91421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ix3L4FJgGnC5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:51:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEBC8F5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DFDF300B3FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479B30B538;
	Mon,  2 Feb 2026 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtaQZ6BD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+AWYqcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CCE2FDC57
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770015103; cv=none; b=QTGZfjo783JUlyN4WKiP+6kIvCXOVLueBA+rEDN9Mw4q5GlvZq9iVcWoBrFMIRyDZs1ZfQbeuEoDVeDElm1MDDTP49J4wrM8C4ItylWGUXb11YES46+ctTPoBNJzxUe23eVVzUyEPD26hzY8y0uB/AJFtGb7XEpcw0IIQf9UvTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770015103; c=relaxed/simple;
	bh=kTbxZrQjzUFG9K7bYjfDaz8Fc2XdnKXB7UdLG7fzWbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Iub8T5u7KalKtnKFUeC2AGi8OLr1iEqQu3r8NeRuLlD80qs1dedCwBQ3LNDHefVN0HutlM70hcHIoWcG8GdiTaFcIOdBUuQN/CnIcmX4KX3qGlRRkVeG5Te8nF1GsaFxbkuFCXGbZy2j3bxNUtte7tn+Fpdbyb1LfNJzkMo3JdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtaQZ6BD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+AWYqcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NTx6i681897
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LW+Vjy9g0Y98fAgbe4moCBUb0jVsnAO98d8+7XdroJ0=; b=YtaQZ6BDwB1qR2Xr
	La1SthXJHkC9C20AfiBA+3o4jo1537XCThbekjPBdnEXJkaKs11AVy620vOOg+7A
	QWZBeT/N1FsT+75nmVq0u/ZoFEwzw/gSaijnZ7pjdPsR4ZB45L1eiERiQUKu47GJ
	7NNWcjBYVEPRh+w7m8/hu/6syHyAOE06G6NObtJO4l92ERq1IZqbNPQmWP6SO4vY
	wcp+As+6T09LFup0rtx2698zKWETFWAzyU3u5qEe0B/c0h0d2CHTZ6qneju8hRAc
	uluhGYgyEbdSGqzLwto/yTkG6wt7UsUnepDOwA6WBldizlGBBAy0ePyEbB/k5KIk
	24aYOQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17v8kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:51:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a4b748a0so90268385ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770015100; x=1770619900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LW+Vjy9g0Y98fAgbe4moCBUb0jVsnAO98d8+7XdroJ0=;
        b=e+AWYqcKyND5fxt+lETPUzt2W1preBvGM6x8ePCBRN70WrfoTjEJ1IMlWRF7xiZWL/
         uMIZfwRIzIuWixo5w2t53GxVZLEke/Q6vb+k6ErgaOP0lpwLgoGguIjJMQgz4syebpkR
         pOuTlweDihp8kk46tudxSKGmfAu4jUJzNuuOimgn22VCQrB0P5+57/MzJOSamGM0bdij
         dG01y6t6jR+iKf36Fm1dKzmdfEIOH4p7ln2eBw4nMHpCzSVcM02V5/3VAJjr4iUbMxzQ
         sTzT+we11iAX9W2X7UatOQKsjm1CLgZ71P1kFg9nTUucR58UTjHZ9YuYMhPFs2Le3znd
         7A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770015100; x=1770619900;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW+Vjy9g0Y98fAgbe4moCBUb0jVsnAO98d8+7XdroJ0=;
        b=Ypm0Hb1jSZvAbzsLcfN2EIiuo/eCt1p0bJHFymdluEp8KLSi8T0R8IxirTvj1j0oMq
         qjMseTLhw/+7T8bAiFJWDUZ1eJJrUABjr5tFuMTnyUUC9QMt15EFrzZJcz4xaDa68ZDf
         3s9X8jF7fQG7mTKANTDufansaUG4gfavIjAZvtXB++/OKmQQLz9BHIQDvZcvc1HnMXj/
         nspWYeWV6zQaWyLF/bY2vG3wIbitjc+HU+I4b4G8NZR825GlVdui6T76/a2HTSSc4M9g
         uOctkmMumIWg0M0aAzh3B3dOMBlm+kO+b23lYSlXERUUXitA7AFLsiMRxsDDM/oM+rj0
         H9ng==
X-Forwarded-Encrypted: i=1; AJvYcCWQFG2hw6ga9qK7mHXBZM1RItMU1U967XbZXkXWLFwv4C1Rsoz4xDNXoWpg/DriORQzdmgi4Tf9tPpfSwCE@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8GcXkWu73LvRioFTBlwlt77hABVlssqosdeUgFi5KxarKC3B
	pT4Xx4d6Xff+kzYVwhPcuKvai/h591lojoj5jrPdjkpVruL8hDO1QiqDuSfs/R6H4qB/jIzg6sX
	azpyQsRLDn+kgOmk3SE+BdEaDcTQ06aUcNpIss9XqM+1OVjY+h/BrTseAZe07Ytiqgl0S
X-Gm-Gg: AZuq6aLTMh8196BduQ9a7zNoHh0wJdR512SB2YSaplvzYn91gvm/G/+LuzLVBV2PnhN
	lnDvFEqo4NaxOuhhfrUeybPUMpJl/fnDB3ffO/5yYxJR397xqfirj2kl7yK4UxrNNyXyM3cO58S
	R07tkbIeoC2OCQoB+C85K5Ww/v50Oj5mA0e/XUO7ta80DnkGlKPL7poJ3Je7DSylYRuz4oiVS5g
	oCJbw1gexN+7615OWEZp0C6kcOniG1yrhq+6udsRG54Oy+BdB1qh1N+SphxSg4XZXPXmdFZgkSG
	zIhCXzcMIJoosHUM3XnY0mF/PIIf+WgrAimimn6gbVKf0SI/9ZSRHZCOlMChczzsvJ0KotpsxZq
	oGTywU80b9RiB9OxdXbiEaIQMUwiM4RWG08Qa/cfGiqax589mchsSN2YrBh3zFJuxznJb3CMGug
	GTwfJ3
X-Received: by 2002:a17:902:b107:b0:2a2:f0cb:df98 with SMTP id d9443c01a7336-2a8d96bc109mr75445955ad.25.1770015099995;
        Sun, 01 Feb 2026 22:51:39 -0800 (PST)
X-Received: by 2002:a17:902:b107:b0:2a2:f0cb:df98 with SMTP id d9443c01a7336-2a8d96bc109mr75445785ad.25.1770015099472;
        Sun, 01 Feb 2026 22:51:39 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecc5sm142880255ad.17.2026.02.01.22.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:51:39 -0800 (PST)
Message-ID: <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:51:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
 <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=6980497c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jMqK_s9pk_6wsJaoijUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: qdxf3iMeKj-BNuaOqyNc6WCTaxbm7cUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NyBTYWx0ZWRfX4ma7l0/eU6YM
 jhdW7AShZ1xpxua9ljk13UynYITyvXcGc7/jzj0mwoD6gEpWtznZgTCKjbGiCs7RxZE8864UvOf
 pF6lT5zANPxyLUCmaZmYD/nHzdRwr+sRWLoy/hryvfQlVVDb/ESOkt6YVfc8QvwDsX5DZ9N8RbK
 Vc8qJXhoipEmDJlLb8w2HCCE9j75eXKFw+KE57Tq7Q7MMUbRrA2Qm5NoajYjrk+fEZIoURnIzOz
 69PrLWJkCfuxbJoKK3G/GAEuATp1LcUE7TxTtqo9rECQqg7cZtScK4DxsSKrGuS+SuCR2zLfDpJ
 9ZPXSoIwo8gFs5Vi864DYCz0A5qWv+Sco2t95Vciws0oIEeyeikInBklfycoim3CasN7Fded8YB
 pthPUVAHlEHPKnVk5nDErdsUGMAheYbTY0HQ0NfbEHBsbbq+lI0qFS9etj0+/lexYtGvq4ZCYhd
 QjY/yTDLLbySQ14WTPw==
X-Proofpoint-GUID: qdxf3iMeKj-BNuaOqyNc6WCTaxbm7cUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91421-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CCEBC8F5B
X-Rspamd-Action: no action



On 1/16/2026 4:47 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>> getting removed from the list after it is unmapped from DSP. This can
>> create potential race conditions if any other thread removes the entry
>> from list while unmap operation is ongoing. Remove the entry before
>> calling unmap operation.
>>
>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4f12fa5a05aa..833c265add5e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -202,6 +202,8 @@ struct fastrpc_buf {
>>   	/* mmap support */
>>   	struct list_head node; /* list of user requested mmaps */
>>   	uintptr_t raddr;
>> +	/* Lock for buf->node */
>> +	spinlock_t *list_lock;
> 
> Why do you need to lock this? Isn't fl->lock enough?

According to the discussion in v1 patch:
https://lore.kernel.org/all/p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg/

The lock is stored in fastrpc_buf here.
> 
>>   };
>>   
>>   struct fastrpc_dma_buf_attachment {
>> @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf->size = size;
>>   	buf->dev = dev;
>>   	buf->raddr = 0;
>> +	buf->list_lock = &fl->lock;
>>   
>>   	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
>>   				       GFP_KERNEL);
>> @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>   				      &args[0]);
>>   	if (!err) {
>>   		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>> -		spin_lock(&fl->lock);
>> -		list_del(&buf->node);
>> -		spin_unlock(&fl->lock);
>>   		fastrpc_buf_free(buf);
>>   	} else {
>>   		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>> @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>   	struct fastrpc_buf *buf = NULL, *iter, *b;
>>   	struct fastrpc_req_munmap req;
>>   	struct device *dev = fl->sctx->dev;
>> +	int err;
>>   
>>   	if (copy_from_user(&req, argp, sizeof(req)))
>>   		return -EFAULT;
>> @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>   	spin_lock(&fl->lock);
>>   	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>>   		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>> +			list_del(&iter->node);
>>   			buf = iter;
>>   			break;
>>   		}
>> @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>   		return -EINVAL;
>>   	}
>>   
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_impl(fl, buf);
>> +	if (err) {
>> +		spin_lock(buf->list_lock);
>> +		list_add_tail(&buf->node, &fl->mmaps);
>> +		spin_unlock(buf->list_lock);
>> +	}
>> +
>> +	return err;
>>   }
>>   
>>   static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   		}
>>   	}
>>   
>> -	spin_lock(&fl->lock);
>> +	spin_lock(buf->list_lock);
>>   	list_add_tail(&buf->node, &fl->mmaps);
>> -	spin_unlock(&fl->lock);
>> +	spin_unlock(buf->list_lock);
>>   
>>   	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>   		err = -EFAULT;
>> -		goto err_assign;
>> +		goto err_copy;
>>   	}
>>   
>>   	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>   		buf->raddr, buf->size);
>>   
>>   	return 0;
>> -
>> +err_copy:
>> +	spin_lock(buf->list_lock);
>> +	list_del(&buf->node);
>> +	spin_unlock(buf->list_lock);
>>   err_assign:
>>   	fastrpc_req_munmap_impl(fl, buf);
>>   
>> -- 
>> 2.43.0
>>
> 


