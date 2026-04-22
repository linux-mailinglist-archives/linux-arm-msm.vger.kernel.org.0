Return-Path: <linux-arm-msm+bounces-104029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AvTN1Vy6GkSKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:01:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF78442B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7ADA4300DF7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 07:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBE636A022;
	Wed, 22 Apr 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/AEkkMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVtSx8f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED49369225
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841291; cv=none; b=NZXM5/fuyR/y36Poave8HePA3hwXjG8wv5+WRFV5XX0Ms5TS3IOkrpCJIhmNUCWHmKr311ef7hIOOZEEBSpbmqhPCqO9pmMIynF75tbLt9IucU+9XZyh6IEt8wiXIYB6pK7AIxWC6PPfnVqbwhd6ghR+cSJn2q10eaYrA0zzt5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841291; c=relaxed/simple;
	bh=7Lk34Za95t+kyvgquAgJFZtmtRJLxGQm+zE5m9tIOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8WgnKLCGVEsSZFq03MqdroG2DnT9VokP4dNTKthYYzAjauuRDJAIry0IY9VzDDdfdyF29AChuxSUY37TQcxyizqdsWStE4dpGfQ8SF7c1DPrs1thTtH8x98l2vXDSIfXh6pokchHNG9AwrPDRXtp1Hpax6Ght4EurY61rBmjj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/AEkkMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVtSx8f9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5EUxI727986
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBGSKr8Uva+BtfeptfpzAP+Zxx4G12UZSHcTVG1Bx4Q=; b=J/AEkkMuXJ4aKR0j
	Q0xfteGZyYNm6QcnqJv2Fyk97Wgj5mZPewxb/aFhHsGhLq6l47ynlhFs21fkqq5D
	5Z7aTz2VsSu3Fu8CuTDMI0BIelyo1kLA8epiLnxRybG80m/AnW/Eh/0xXfKIIIWk
	x/rhjoUt9lsQ1thunmJzMgFfN5OyTKDhBRdhkTBrqeGrK0B1roDrE1f7sZ48CTbV
	7SagRQwG3suU1UaoOOEQI0yZTKEQ1VC1aTcGoS+Dpc5gAJu7sHCd7u3sV77mLtNV
	YoLsMHzYU7uWQ1RmA7Pj4gnz8UDoeeFqqO0h0YTI6O38AZWjH+FPWGutQl5SIEPG
	I7jucA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenha34d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:01:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so3053192b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776841288; x=1777446088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBGSKr8Uva+BtfeptfpzAP+Zxx4G12UZSHcTVG1Bx4Q=;
        b=kVtSx8f9yDRXEMuch6bbW0gKlVBJtVHx6OO8U2d8ixyq1s5/Y4xIskMuCUy3d/Drkv
         DQqfOpBxLYDc2kQ+3D5b0Y3hOeZbT6rPSDi0p/a6bl8gf9M+xl77E1euPlv0tzbsGVlo
         5ll3JbpfpE33WQpgh//yxVEx6b8bjlB/ZNB7C20zKky1+L1ZvJqbWkGJYZSEr1bQ+Cx/
         lRxxrWxv8Ytg5PgxGrZiUtvBuY1scxhZdPp0UqxoT751/tvRN9zXr6wZUk2sH5Ueykdn
         eMp/7QCS7/nMoH+1nPUJyjSF9tPvR+yxmO4tcS0+LXQ0oGZs+aiRaQc9PY+aY2022mJX
         OtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841288; x=1777446088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBGSKr8Uva+BtfeptfpzAP+Zxx4G12UZSHcTVG1Bx4Q=;
        b=ZyszeD8qgXjxP6Ac5XPE5t6JQ+5oAN6vUHQG5AVQgMqmxRss94Hxcdz5e+jw17Mwvj
         N6RvcYii2xB145MaiFrilXpaB+JI5cbjn7hHVA13421iQZMHxHI0lFQLVinVGhytXvrT
         iJUbZNKhWpWeH0GQnm4GrsQ/C4J6A8OXKNemYJJEdNOzaRhVc1pv+WDK+OVxXePat6oG
         FqsrayRxuSDQ+RQ0B+s9dTOG25AbfDY92FrT/5l6mRlROz2Z4IArtU+ScF802LGQbAGw
         f1vhKgGLz12ygrb9vI1bOsHUGX8KKZph1x9UvKslcTfiE4Dk4GrFtoronw5pHu7zTfhC
         9PzA==
X-Forwarded-Encrypted: i=1; AFNElJ98Bar4SHcD81aQPFqLt0K2vbhCXKyGdLn0Yl3RhEe8G2h0ZzOjBm+bO7+fuvmmGpSahBErPLwwNLWE7N/o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd8pcDpcYhwQy+8vg1z+GEY79XJg6MDVIp1HHcvzUOw9Vz7PoC
	nA9nXlEFJq3tbsvj7fCxwVyjTBSZHdRJ4whxWcf5An4jp8D4IO1Pq4GIroNYwrFOFnSAgQ3zc1O
	e5EvXeZ1PD/Mb+3T3vjwu5ER6x0XDYhX2Y/ptUrOTkrI7VVqP8kTxsa7BbQDWvotBoN8Y
X-Gm-Gg: AeBDievve2aUOHCK5SET639HlBz2sprj8XySRUi4Yl3KWBuYDCgCREbybEuzScEtb4W
	VDAf714lLzePJoO5/Sh95G/XvaAfF5xhAvXtu2mZiPAfwPAH2Br8oLs9X14LhwOP3La+Cza3/KX
	3Zi1WooBB1rBpC3K6FXgX4l52LF3LMbwG30eDXVd71qWtctn7YLoygzuY2yl6YrTn3SQReapJmg
	fns1a/sKk+IIpI6briPruo9QM0yNyH4mGJkubtAoBtP4WuM0Rv7cphQ1Z9DLsQIQoNn/Wd/gEwb
	W0EoI1NL6Xr5LVnfC4z82E0FJTa13zG/5N/MJCAJX2tmpHPmKRZ3Xpju5XuUlktkXdv+Kt0+LUW
	FlxA7NvfXpN7CFU/QUfJ/h2NJ8JFpEP8PZcY9IW3GqdmMYvRsg18q/NArSWiDS5cN
X-Received: by 2002:a05:6a00:22c5:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-82f8c9300ebmr22580054b3a.48.1776841287503;
        Wed, 22 Apr 2026 00:01:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c5:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-82f8c9300ebmr22580003b3a.48.1776841286814;
        Wed, 22 Apr 2026 00:01:26 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981d00sm15665619b3a.5.2026.04.22.00.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:01:26 -0700 (PDT)
Message-ID: <077a99c2-c954-c5e6-3699-cd0360e8b9f6@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:31:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] misc: fastrpc: Use context device bus for compute
 banks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-3-4d904d40926a@oss.qualcomm.com>
 <cc90c55d-c93a-2789-f313-aaa5e4090be2@oss.qualcomm.com>
 <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <r25ibbsw3flfashrp4x2cqy6thckgez5k3gtfqp46dcpbjniev@s4ngoa46ekvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e87248 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N8QG227OEIr4kTigVUgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA2NSBTYWx0ZWRfX1oB7SY4E92E+
 QN6KR6VbWWkptc7DNNPNvT0wNGTENIWtySE8NPgAWAoct+EOIgvEDbScS7FdilUXGAdTAAt6Nww
 N2/O0GkDphUnz/2Xo04mCwIH0Mni7rcIiYoJfubjE11SqkwVBo9Bb1szz2ynqVDRAUcrVhBAS0C
 xOPOx3036WY0Ht4HNYEnri4SBloqjri/8Jz0HG7SlHUIRh9wD4WEMMrLFCHYW8kya85AGQBXXjk
 aWLo2dOSKEIA1CotvIZlR92zRKCYTyAT6wTKo89y+Iiefq8981UCf6yBN5CHNpm9yBzmkYuIQ5J
 UzrA/BLCl11f8QZLj40RLen1nvVv9PerOpHxcCKnyBqfE7MtYyD/KUExL6Hxmm0ZedhzZrDFb+4
 nVsBgC56qEE9C4mQIeldOFWrK+N6FyLkoyzK2sXTdT33JRDCV5SD4yYReazl7zV6M3mGqGqm0Nf
 ppGDnT2KV+SNTKH4hHw==
X-Proofpoint-ORIG-GUID: ob3J5ZxbwOITSmsamz2wwJyHV_dUvUwZ
X-Proofpoint-GUID: ob3J5ZxbwOITSmsamz2wwJyHV_dUvUwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,quicinc.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFF78442B33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/19/2026 5:46 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 15, 2026 at 09:35:47PM +0530, Vishnu Reddy wrote:
>>
>> On 4/14/2026 10:01 PM, Ekansh Gupta wrote:
>>> Replace the platform driver approach for compute bank (CB) devices
>>> with the generic context_device_bus_type. Compute bank devices are
>>> synthetic IOMMU context banks, not real platform devices, so using
>>> the context device bus provides a more accurate representation in
>>> the device model.
>>>
>>> Currently, fastrpc used of_platform_populate() to create platform
>>> devices for each "qcom,fastrpc-compute-cb" DT node, with a platform
>>> driver (fastrpc_cb_driver) to handle probe/remove. This approach
>>> had a race condition: device nodes were created before channel
>>> resources (like spin_lock) were initialized, and probe was async,
>>> so applications could open the device before sessions were available.
>>>
>>> This patch addresses the race by manually creating and configuring
>>> CB devices synchronously during fastrpc_rpmsg_probe(), after all
>>> channel resources are initialized. The approach follows the pattern
>>> used in host1x_memory_context_list_init().
>>>
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>> ---
>>>   drivers/misc/Kconfig   |   1 +
>>>   drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++++++---------------
>>>   2 files changed, 125 insertions(+), 56 deletions(-)
>>>
>>>   	}
>>>   	dma_bits = cctx->soc_data->dma_addr_bits_default;
>>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>>> +		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>>> +
>>>   	sess = &cctx->session[cctx->sesscount++];
>>>   	sess->used = false;
>>>   	sess->valid = true;
>>> -	sess->dev = dev;
>>> -	dev_set_drvdata(dev, sess);
>>> +	sess->sid = sid;
>>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>> -	if (cctx->domain_id == CDSP_DOMAIN_ID)
>>> -		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>>> +	cb_dev = kzalloc_obj(*cb_dev);
>>> +	if (!cb_dev)
>>> +		return -ENOMEM;
>>> -	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>> -		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>> +	cb_dev->sess = sess;
>>> -	if (sessions > 0) {
>>> -		struct fastrpc_session_ctx *dup_sess;
>>> +	device_initialize(&cb_dev->dev);
>>> +	cb_dev->dev.parent = parent;
>>> +	cb_dev->dev.bus = &context_device_bus_type;
>>> +	cb_dev->dev.release = fastrpc_cb_dev_release;
>>> +	cb_dev->dev.of_node = of_node_get(cb_node);
>>> +	cb_dev->dev.dma_mask = &cb_dev->dev.coherent_dma_mask;
>>> +	cb_dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>>> +	dev_set_name(&cb_dev->dev, "%s:compute-cb@%u", dev_name(parent), sid);
>>> +	rc = device_add(&cb_dev->dev);
>> device_initialize() and device_add() can be replaced with single
>> device_register() call. You can refer the below patch,
> Keep in mind that for several arches device_initialize() sets the
> coherent_dma_mask. So one should set coherent_dma_mask (as it's done
> here) after calling device_initialize().

I can see that device_initialize() sets dma_coherent flag for several arches,
not the coherent_dma_mask. The final dma_coherent flag value is updated later
in of_dma_configure_id() based on the dt dma-coherent property.

Setting the coherent_dma_mask here and calling device_register() which will
call the device_initialize() won't change the coherent_dma_mask value.
Please correct me if I'm wrong?

>> https://lore.kernel.org/all/20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com/
>>

