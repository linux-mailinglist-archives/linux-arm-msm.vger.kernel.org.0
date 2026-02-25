Return-Path: <linux-arm-msm+bounces-94176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFadDbEvn2lXZQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:21:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D33EF19B79E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00A0E30EBB26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1BB22157B;
	Wed, 25 Feb 2026 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgTnxjVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OA/Qed7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1803D34AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039820; cv=none; b=u8MLRzpwTjjv+AOdnHZm69IzJ9gv+eSwlzgA48Ds39PHzrccvydTYyC9yjY/19OOF86ZEOuJTvN/4EZdzpz/voetke890Gh7dhR5QUSWowf3/ONj4LGXQkJZ3B1vlRYF1qttT+KTeXLYbEF7Goq1pkvRjrp4oeEy9u56WFSSbic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039820; c=relaxed/simple;
	bh=kf1VhgEVHDSWqNcgyUIDo+HRqqLO7+Jy/6FcfuBfgYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2GenyYl+6PddadGNNPiFzlprYaQmm8gidkx2M4OvM/JQ2NJ44ZXZnVJltzBhkdwaBg19SpEjAanoNrB2zdiaOmrqKGBxG42iv1mqXHU8WomXn7oJEt79O50k6pd6WxQ67DG6iISRKwJdXzHYEiXIQ/5pR3LOIfIKd7kY6zR3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgTnxjVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OA/Qed7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEkX803041182
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ucOIudrT1HeNKGnFCXAy5PnfmnhZNLc1JNcH6FfXVd0=; b=NgTnxjVbxDx9PZC5
	eGbsvbueGpTBBWMYr+OFoWbIvqGBsXta8czs7u/FZQDW8JT90NymttscOv5eU+k7
	x7NfD+8UKxeEeoYNei4v94NM5qEltXFJKwY7hQ+Y6DJO5cnkYXLuqN1IGuo/D0xz
	XkC77SKISOGHcM3Yb82rHZJ/FsZag32wE1EtFdPBHJAFnPUA347b5wzkNg0GRMaa
	Ak2PQPcQKGBqtHFFKq5SxRg9NIDOQ0TT4UatCNo809L44/hxRZqbj7FxP5FUmWnG
	ghDrbr2nXwT1LfvwWYVDZMv87NHDPzVDZanIg54SU9VvVjcvwrOpImmDxI7aTlu3
	xSyWLQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350ghyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:16:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e8ec30182so34041291a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772039816; x=1772644616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucOIudrT1HeNKGnFCXAy5PnfmnhZNLc1JNcH6FfXVd0=;
        b=OA/Qed7xDW+18igzRPtB7eRXBq88vcGRPsmP4/Vvhi5E23l/LPZGrzUOX6TiG8VW+w
         p5+pPLJtbkiGBjh32wJBMZgS6KkxYC6/SLkftV4vWfzwb5EQkkSOwlLrhxfWyeU23wII
         O2OR+bkZleeOGYkF12mpswriQLqHSt6ka+oi6VbFIHzusQFlJDZxS3URR0p0gYw9cxtL
         nQAIbMc8xVexZd4HgW9LS8wPwY7MDKgGmMINT0nKd9Knj6H3YwSvVmkWkitWRUStUJ16
         pCKkuGOEOFTLRxG/bV0X7+2bjJicLSL32cRW0WxVBXRSwrbEqQ5GgjYD9I9+FJDsq116
         /6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039816; x=1772644616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucOIudrT1HeNKGnFCXAy5PnfmnhZNLc1JNcH6FfXVd0=;
        b=Mr9oiJ1iuqYWdMN6mxhe+MMrie10bfeMTDhqh52i/7lvqV5eEpvaGona+QWF6oQeX8
         HOP/uDl60+7+Y7g9u7KNnGOc55aEw0jfmvMTZ02YY7CmHJDgFZ97B4oJqzvbcBS77s90
         np3yALerIh3ikKh5vPKJ5odH+tIHkCnafdb9wxZ80ULS412Bf0+4CsNPvnSS+RYUHd0P
         F5qV10OGrIrr1kRA99fbmWVlnQiIzJCz4G2+gf+/KuOU46p2OafbCHVJ18iIKYUP3V96
         OZK69iENkOXbdc1ui6xFgaVW2Kavmg8xYd41/f9rXsFxlhq4mBlkMvGy4zvhoKx+uj6S
         mBFg==
X-Forwarded-Encrypted: i=1; AJvYcCVffiixiecd5A/NU+I8fAhOsxeZKg7ObKkq/5ojWPd9RnocpqN8JFIGXcwonwcHw9UfTSHnbz3ZavwedEKg@vger.kernel.org
X-Gm-Message-State: AOJu0YybSMWYTzBPIltS2AnYid4DdQKYc78x0UeA3oEkWoaWXSSMq9dR
	7Dc4eIrLqd0bzlUPCQGPBCr2CgI463yoACZVfsp0XIHfnt6xn4q+lEcMbbPW7TwH5uME5LA7nSm
	Pav129vHy96tDoqBrmbpruak1+kzab+eWGG7k11iYKwKt27CYzHnJwWGPbDg3XTCABR78
X-Gm-Gg: ATEYQzxVzQ81u7kgpdHv9oHmGBuTVweHJZr5Niyqz6Xu+MCiIQHKEEJE5Q6fBECS+jM
	/DEgtdYluW0+jR/3gYRwW0tk1Z/dlx/GwEe57RNxFiZeuYvzQOeai14xwCo4sv6VpB1HpjvN5N2
	HFBEyWr1tqisAdqB1QovFQAnfOk0OM7JastKvwVzRc6c8eDFMr1ciN/EqhzcE4irH1jMhIt5rlS
	JiGG7HKQg0bjoZOGGzexUlsATOkLG0z1BQ9DXQPZqNoEp8WfN6SgJB3e3PDKxZHF+TJrfll+CH6
	grFGe/FBvS05LyfT7C5pqr19b3GVmQcdBlET5rp8EwiHyX71lpKS0kXaEefjHpdPJrRhBYmZ0fP
	i1+yCkEbqGuW8rCIocrXCt91djNHppOepzxJdEkWCWF3pDAK9OzI=
X-Received: by 2002:a05:6a00:4501:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-827337897f7mr908993b3a.30.1772039816288;
        Wed, 25 Feb 2026 09:16:56 -0800 (PST)
X-Received: by 2002:a05:6a00:4501:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-827337897f7mr908946b3a.30.1772039815684;
        Wed, 25 Feb 2026 09:16:55 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86ca41sm15171981b3a.36.2026.02.25.09.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:16:54 -0800 (PST)
Message-ID: <843e550f-185a-4906-b61d-15c9b34d341f@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 22:46:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm DSP
 accelerator
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FRRNpah2p3Wpc88XkGpItMXazfqZTftY
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699f2e89 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WvnbiS2QWwUXfDwCy_YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NSBTYWx0ZWRfX0skmp/tk2xw/
 +7i5bN0EDGR+t7s95sCfLvRKYeuPnyDhiwck2+/j06gOF06nLkJMHQcuCr7WVkp24Wj5W4VcTHS
 qR4QcjLK3f830E9Hstb9FybtmYS7qKuzdlUCr4i2DVO9BGGrRRxGqW+4cmV691qQlc6/Wflp8e+
 xj9R2WIsuHe3FS43GadblX0E6fNGjFPvLOfsRj5HzP129z2ryA8LPjqpg/C2h/0KNi2dH+uVXKZ
 h1oxB49Qlj9WYjcAc9bFbIjWPLMITh134qktlLO0rWZ8x4O5KzluQV+c6z7N7bs6ADhN6NoqA68
 PUPAWCwDIbmxN16Mxa3HR48Kf5OCi+I/LfwSa2JF7rHGdxUIj4+YY3jHsL0FeH6pbCkkoko6DgY
 qv8/m21WMyesW0P75JXrALQPe0+f/hxbushQnGb0gW5u6w1ijz+WyMAyeWi3f0VTx6FuPk9W34z
 LY2ddOwScbnCDoTRANw==
X-Proofpoint-ORIG-GUID: FRRNpah2p3Wpc88XkGpItMXazfqZTftY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D33EF19B79E
X-Rspamd-Action: no action



On 2/24/2026 2:53 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
>> Extend the Qualcomm DSP accelerator (QDA) driver with an RPMsg-based
>> transport used to discover and manage DSP instances.
>>
>> This patch introduces:
>>
>> - A core qda_dev structure with basic device state (rpmsg device,
>>   device pointer, lock, removal flag, DSP name).
>> - Logging helpers that integrate with dev_* when a device is available
>>   and fall back to pr_* otherwise.
>> - An RPMsg client driver that binds to the Qualcomm FastRPC service and
>>   allocates a qda_dev instance using devm_kzalloc().
>> - Basic device initialization and teardown paths wired into the module
>>   init/exit.
>>
>> The RPMsg driver currently sets the DSP name from a "label" property in
>> the device tree, which will be used by subsequent patches to distinguish
>> between different DSP domains (e.g. ADSP, CDSP).
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Kconfig     |   1 +
>>  drivers/accel/qda/Makefile    |   4 +-
>>  drivers/accel/qda/qda_drv.c   |  41 ++++++++++++++-
>>  drivers/accel/qda/qda_drv.h   |  91 ++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c | 119 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.h |  17 ++++++
>>  6 files changed, 270 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
>> index 3c78ff6189e0..484d21ff1b55 100644
>> --- a/drivers/accel/qda/Kconfig
>> +++ b/drivers/accel/qda/Kconfig
>> @@ -7,6 +7,7 @@ config DRM_ACCEL_QDA
>>  	tristate "Qualcomm DSP accelerator"
>>  	depends on DRM_ACCEL
>>  	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on RPMSG
>>  	help
>>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>>  	  This driver provides a standardized interface for offloading computational
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 573711af1d28..e7f23182589b 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -5,4 +5,6 @@
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  
>> -qda-y := qda_drv.o
>> +qda-y := \
>> +	qda_drv.o \
> Squash these parts into the previous patch.
Ack.
>
>> +	qda_rpmsg.o \
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 18b0d3fb1598..389c66a9ad4f 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -2,16 +2,53 @@
>>  // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>  #include <linux/module.h>
>>  #include <linux/kernel.h>
>> +#include <linux/atomic.h>
>> +#include "qda_drv.h"
>> +#include "qda_rpmsg.h"
>> +
>> +static void cleanup_device_resources(struct qda_dev *qdev)
>> +{
>> +	mutex_destroy(&qdev->lock);
>> +}
>> +
>> +void qda_deinit_device(struct qda_dev *qdev)
>> +{
>> +	cleanup_device_resources(qdev);
>> +}
>> +
>> +/* Initialize device resources */
>> +static void init_device_resources(struct qda_dev *qdev)
>> +{
>> +	qda_dbg(qdev, "Initializing device resources\n");
>> +
>> +	mutex_init(&qdev->lock);
>> +	atomic_set(&qdev->removing, 0);
>> +}
>> +
>> +int qda_init_device(struct qda_dev *qdev)
>> +{
>> +	init_device_resources(qdev);
>> +
>> +	qda_dbg(qdev, "QDA device initialized successfully\n");
>> +	return 0;
>> +}
>>  
>>  static int __init qda_core_init(void)
>>  {
>> -	pr_info("QDA: driver initialization complete\n");
>> +	int ret;
>> +
>> +	ret = qda_rpmsg_register();
>> +	if (ret)
>> +		return ret;
>> +
>> +	qda_info(NULL, "QDA driver initialization complete\n");
>>  	return 0;
>>  }
>>  
>>  static void __exit qda_core_exit(void)
>>  {
>> -	pr_info("QDA: driver exit complete\n");
>> +	qda_rpmsg_unregister();
>> +	qda_info(NULL, "QDA driver exit complete\n");
>>  }
>>  
>>  module_init(qda_core_init);
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> new file mode 100644
>> index 000000000000..bec2d31ca1bb
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_DRV_H__
>> +#define __QDA_DRV_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/mutex.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/xarray.h>
>> +
>> +/* Driver identification */
>> +#define DRIVER_NAME "qda"
>> +
>> +/* struct qda_dev - Main device structure for QDA driver */
>> +struct qda_dev {
>> +	/* RPMsg device for communication with remote processor */
>> +	struct rpmsg_device *rpdev;
>> +	/* Underlying device structure */
>> +	struct device *dev;
>> +	/* Mutex protecting device state */
>> +	struct mutex lock;
> Which parts of the state?
This lock is added to ensure proper rpdev before sending message to DSP, now I think
it might not be needed if I can ensure proper checks based on any existing helpers, I'll
check this and remove if it's not needed.
>
>> +	/* Flag indicating device removal in progress */
>> +	atomic_t removing;
> Why do you need it if we have dev->unplugged and drm_dev_enter() /
> drm_dev_exit()?
I'll check the helpers and replace wherever necessary.
>
>> +	/* Name of the DSP (e.g., "cdsp", "adsp") */
>> +	char dsp_name[16];
> Please replace with the pointers to the static array.
ack.
>
>> +};
>> +
>> +/**
>> + * qda_get_log_device - Get appropriate device for logging
>> + * @qdev: QDA device structure
>> + *
>> + * Returns the most appropriate device structure for logging messages.
>> + * Prefers qdev->dev, or returns NULL if the device is being removed
>> + * or invalid.
>> + */
>> +static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>> +{
>> +	if (!qdev || atomic_read(&qdev->removing))
>> +		return NULL;
>> +
>> +	if (qdev->dev)
>> +		return qdev->dev;
>> +
>> +	return NULL;
>> +}
>> +
>> +/*
>> + * Logging macros
>> + *
>> + * These macros provide consistent logging across the driver with automatic
>> + * function name inclusion. They use dev_* functions when a device is available,
>> + * falling back to pr_* functions otherwise.
>> + */
>> +
>> +/* Error logging - always logs and tracks errors */
>> +#define qda_err(qdev, fmt, ...) do { \
>> +	struct device *__dev = qda_get_log_device(qdev); \
>> +	if (__dev) \
>> +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
>> +	else \
>> +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> What /why? You are under drm, so you can use drm_* helpers instead.
ack.
>
>> +} while (0)
>> +
>> +/* Info logging - always logs, can be filtered via loglevel */
>> +#define qda_info(qdev, fmt, ...) do { \
>> +	struct device *__dev = qda_get_log_device(qdev); \
>> +	if (__dev) \
>> +		dev_info(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
>> +	else \
>> +		pr_info(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
>> +} while (0)
>> +
>> +/* Debug logging - controlled via dynamic debug (CONFIG_DYNAMIC_DEBUG) */
>> +#define qda_dbg(qdev, fmt, ...) do { \
>> +	struct device *__dev = qda_get_log_device(qdev); \
>> +	if (__dev) \
>> +		dev_dbg(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
>> +	else \
>> +		pr_debug(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
>> +} while (0)
>> +
>> +/*
>> + * Core device management functions
>> + */
>> +int qda_init_device(struct qda_dev *qdev);
>> +void qda_deinit_device(struct qda_dev *qdev);
>> +
>> +#endif /* __QDA_DRV_H__ */
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> new file mode 100644
>> index 000000000000..a8b24a99ca13
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include "qda_drv.h"
>> +#include "qda_rpmsg.h"
>> +
>> +static int qda_rpmsg_init(struct qda_dev *qdev)
>> +{
>> +	dev_set_drvdata(&qdev->rpdev->dev, qdev);
>> +	return 0;
>> +}
>> +
>> +/* Utility function to allocate and initialize qda_dev */
>> +static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev;
>> +
>> +	qdev = devm_kzalloc(&rpdev->dev, sizeof(*qdev), GFP_KERNEL);
>> +	if (!qdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	qdev->dev = &rpdev->dev;
>> +	qdev->rpdev = rpdev;
>> +
>> +	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
>> +	return qdev;
>> +}
>> +
>> +static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>> +{
>> +	/* Dummy function for rpmsg driver */
>> +	return 0;
>> +}
>> +
>> +static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
>> +
>> +	qda_info(qdev, "Removing RPMsg device\n");
>> +
>> +	atomic_set(&qdev->removing, 1);
>> +
>> +	mutex_lock(&qdev->lock);
>> +	qdev->rpdev = NULL;
>> +	mutex_unlock(&qdev->lock);
>> +
>> +	qda_deinit_device(qdev);
>> +
>> +	qda_info(qdev, "RPMsg device removed\n");
>> +}
>> +
>> +static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev;
>> +	int ret;
>> +	const char *label;
>> +
>> +	qda_dbg(NULL, "QDA RPMsg probe starting\n");
>> +
>> +	qdev = alloc_and_init_qdev(rpdev);
>> +	if (IS_ERR(qdev))
>> +		return PTR_ERR(qdev);
>> +
>> +	ret = of_property_read_string(rpdev->dev.of_node, "label", &label);
>> +	if (!ret) {
>> +		strscpy(qdev->dsp_name, label, sizeof(qdev->dsp_name));
>> +	} else {
>> +		qda_info(qdev, "QDA DSP label not found in DT\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = qda_rpmsg_init(qdev);
>> +	if (ret) {
>> +		qda_err(qdev, "RPMsg init failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qda_init_device(qdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id qda_rpmsg_id_table[] = {
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, qda_rpmsg_id_table);
>> +
>> +static struct rpmsg_driver qda_rpmsg_driver = {
>> +	.probe = qda_rpmsg_probe,
>> +	.remove = qda_rpmsg_remove,
>> +	.callback = qda_rpmsg_cb,
>> +	.drv = {
>> +		.name = "qcom,fastrpc",
>> +		.of_match_table = qda_rpmsg_id_table,
>> +	},
>> +};
>> +
>> +int qda_rpmsg_register(void)
>> +{
>> +	int ret = register_rpmsg_driver(&qda_rpmsg_driver);
>> +
>> +	if (ret)
>> +		qda_err(NULL, "Failed to register RPMsg driver: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +void qda_rpmsg_unregister(void)
>> +{
>> +	unregister_rpmsg_driver(&qda_rpmsg_driver);
>> +}
>> diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
>> new file mode 100644
>> index 000000000000..348827bff255
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_rpmsg.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_RPMSG_H__
>> +#define __QDA_RPMSG_H__
>> +
>> +#include "qda_drv.h"
>> +
>> +/*
>> + * Transport layer registration
>> + */
>> +int qda_rpmsg_register(void);
>> +void qda_rpmsg_unregister(void);
>> +
>> +#endif /* __QDA_RPMSG_H__ */
>>
>> -- 
>> 2.34.1
>>


