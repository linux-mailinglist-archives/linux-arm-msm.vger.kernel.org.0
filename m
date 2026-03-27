Return-Path: <linux-arm-msm+bounces-100279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMw+Ga1pxmmkJwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:27:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7733436E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C8CD300538F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E268D38550B;
	Fri, 27 Mar 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NETvdQfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqYCnVA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB713B777A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610589; cv=none; b=UfNRFrTBfotCHz2f7k7LYVqMSh0RmTSBcMgTF/zHT7EK7wZel+dtGTRYBr3yD/zCzyCnoNWU9SimefZP9h15r76id9Ybl/jOZjATdKtn3ht2FdXsGMesZ6EwG9QdvEsxjpMv4LGw89JgmnNprDPrpz9hpCdCNNVaIkR1HDAhAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610589; c=relaxed/simple;
	bh=ZE64kQlavJURXdGjYq/7SVLot5CU4XBtX/mc6JwRh+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pv/1N52dAzjqxxUkav20RntIVopKaUFKJjhTabBIrWtCqGRXOxGrvrWgksnbcf7sVKOoyKX4sADdAAiQzHcgIETN5of8pAVLzESANY0xjwar02qiemfozfAeL83wvd8HWh+Fd8NcFAPf3mUgBQyEJVBel3o/S4nG32i+s2N3e8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NETvdQfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqYCnVA0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vel52378982
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3w2ktYkEZdHcxeWiM/YwaRWS3HtqT2nSX/T7SXyb4qo=; b=NETvdQfyuCGPcouJ
	H0byEs5stHDvAV+ALpQ6mtv9aVZquPL7CbJrIkQqfbDolKrp1f5F4OyzTk98aWxg
	4IjtkoIdBRB1YWcQLbRjKMlCxaaGgVahJtkZYVT0SOCjov8pMHg5aVipfqT13kcb
	q8N4VBn6bHs492y6qXp3JzeRbkHOi9UF3CfoYBbbK1KUSgR3mLRYxr4XpCVLpBo2
	ahrORFU8J7iZX0R0niTBKWHJH8f7/Rzv7ozbuySeWAp/nYNPCcITBWkYObPhKwQc
	BpvQ6djcr9dQNfeV782fkJeyDhU4GnIxPzO/MR95hav4tiiLmGido1DbEdU/+AjG
	xIiyZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx1mex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:23:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8ea43d4eso44105785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774610585; x=1775215385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3w2ktYkEZdHcxeWiM/YwaRWS3HtqT2nSX/T7SXyb4qo=;
        b=fqYCnVA0eEkzXTPnSpk6I3+EVvWxl+kvQ4c6Ro/5ZChxcS1C8vbaCQgXAkWfDlb4SF
         f4VpeVJWCxpHcKBQP1EHcdyGsFeEO/3zLkLpdUVLb3Su7q1hnaQsTwwuSu/Huylk4F16
         1Ni9P50Qj6g18Zxfq7MkovzTspqyrL/HgEgbDPIPWmlQOd7JenHShQxSmZCIoayp/g/C
         uIZq4ua9zNFpLjrdCNR0aN3lYHoR+gqRIQe7kmt/wat+JtV3gt+f+SGLHTGx5SGBb3mP
         mxaR2b3v66Nx3WCRZjSg3tFToD8eKg7UYs56IR4dRcO+9SWSpjmZmEKG4U4IOBMOBv06
         ctXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610585; x=1775215385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3w2ktYkEZdHcxeWiM/YwaRWS3HtqT2nSX/T7SXyb4qo=;
        b=nAWjBz92janRArmHT6vxe8+u3G10zE1FNQet35eLsIkOWhMytNMk6Qi+03L77EoYgC
         OMA4p4x53bIOFbqtXNrCNdJN4k0rGY8sg4uVdPQaQ//kYLrVyD8PM0dIlVp47Z/1il0m
         D80sMDqFRw53PonN/noFPtC7ZopxW2ogFIzf7eFpdcAJOHhCzqu8ksmzW30AWut+MZZE
         sZPoM/HeruvHV7AWey+UDuIT/hAf8vtKLNe3NmojLJ7gb3VE4u6ZtaKggP6b7CnaPLmX
         BIlrntfTMFj4W0m3LA/U+OAI7gD9VSQy2rYKNdgdhjyY4mhPdyNeNdnZJMCKPiQLFaJA
         CBbQ==
X-Gm-Message-State: AOJu0YyhMZ3DQaNGmB4jJxZOLa9SKutrsxg3FvbdgTN4yPN2gSD3hA8Q
	WZyiyP9HV84B4tesUQozWk+yZ17gCcNye4Kr0JVoAa18wtuz+VVYGTTI47A5HyfPxNpzge7PHgp
	3JAMV/9xq8j48nwwwRS4y6tWTQUL4BdeH86xUIBoFafnK2aQrPGSI3DyAgIgP112ws45O
X-Gm-Gg: ATEYQzyCDp5vCmtrd155Ss6y9dEAyl+nyGf+OV/8JtjbaXcDnMwWYTBEoIorHmhg0rE
	kLgLEadUB9vjKKVWdv5E2UnbhZT6snqC7FpIqtonuR9U/qcQ3HUy9n8pWU3NZDZEMPclmAZPIuW
	/0UTlLW+fdWyA84lKZXks6lNJlJwWTvX6OB1njopetGXLAxCM6t1oZZXpGw0O4ziDrV8MGFx5qC
	I305IJTZz/BkgL3soOtoqKBJ+ZhMTw610TzObmVJ1N/REv5R5tbLqwp1xqxhyUTTnrFUQZE4YV8
	16MLMrLEW4+YZGqWaeeA2e792vwS3zzkhYlRoVqUmxfJbmfd2SRyYdIFKGe/OPCxIWax7JDCbCh
	dZCP1wDClBLqFyr1hNgqqla7Xq2HTPuMQUXZspfwuli5cFwY/OY1YCiCIxyOIhsVomcfZcNkVvE
	xofy8=
X-Received: by 2002:a05:620a:4686:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d01c849700mr182385385a.8.1774610585534;
        Fri, 27 Mar 2026 04:23:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d01c849700mr182381085a.8.1774610585035;
        Fri, 27 Mar 2026 04:23:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad60361c6sm2214131a12.7.2026.03.27.04.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:23:04 -0700 (PDT)
Message-ID: <4522e20c-70ab-48ef-8b0b-59f2548ebe64@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:23:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] drm/msm/a6xx: Fix gpu init from secure world
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-10-fc95b8d9c017@oss.qualcomm.com>
 <e44e776c-df8f-4555-a487-9a7a6fe032dd@oss.qualcomm.com>
 <7d223573-438c-4e93-b4b4-64975c4da93f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d223573-438c-4e93-b4b4-64975c4da93f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6689a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JAnykeg7oUmYEFbxpzMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uw242r9Y6iORApqy_R96OzteYSXrJj85
X-Proofpoint-ORIG-GUID: uw242r9Y6iORApqy_R96OzteYSXrJj85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OSBTYWx0ZWRfX0S2kZohFwWgN
 p7yLwunNcRXYReBwt9O2y1PODP+c/zmuaxnY4WPleu7Rr40PzCKXfpiUhuJzbndOzrSWFBVhdOS
 o27sGrGQZY2UjdW+cE0Yn5wu0PSM5frIjkNB0i8fvHgn6yBikp1HIwXrWs52TIW8ZFsxZ7G6GM2
 9VsLYvtbs1wYg0pLvRg2DLtQbgxDtmODw4PwCYUzeuixjeNhyArT3pEzlKnqmxbiLQ+gdFF+RvA
 clP46SbpfEezSy5lM7dWnR8viN7yAmuKjrA+POEfr9RCqFlEk0JHcolE/TqObxJpnnC0EKaqM+o
 JdGOyNb1RIlHBY7lY6WbjyEHzNZAg1i3cl7df4R99RZrZtEW/nevj76o+dQH3ml3+SyuSKjypXC
 wT1LuJ6TiGS4q5XrSaS69A80x7mEYcjqSYvG/c7LSp8FbMVsgAqjrYZ7wAJDgl1U3wP+OCNSQlL
 fHKviDVC0jsLsm7jSsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100279-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD7733436E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 9:12 PM, Akhil P Oommen wrote:
> On 3/24/2026 3:37 PM, Konrad Dybcio wrote:
>> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>>> A7XX_GEN2 and newer GPUs requires initialization of few configurations
>>> related to features/power from secure world. The SCM call to do this
>>> should be triggered after GDSC and clocks are enabled. So, keep this
>>> sequence to a6xx_gmu_resume instead of the probe.
>>>
>>> Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> This now makes this happen on *every GMU resume*, which sounds
>> undesirable (kgsl does this in gen7_gmu_first_boot)
> 
> I had this in my TODO list, but forgot to update. Will fix.
> 
>>
>> Similarly, we call a8xx_gpu_get_slice_info() on *every resume*
> 
> No. We check then slice_mask and return early.

Right, but we still branch into it

I think the best solution would be to add something like
gmu_first_boot_setup() which would be tracked by something like that
bit you added in v2, where similar things could be moved

That said, this is just an optimization

Konrad

