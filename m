Return-Path: <linux-arm-msm+bounces-94812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KEyFg1UpWnR9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:10:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B062C1D5520
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D681B303AF0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BF9253F13;
	Mon,  2 Mar 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxEzbdGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2ODREPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE1D378D80
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442434; cv=none; b=b7RdeA2CXJ8MssSi5b5iamQDPlD826b5ny2Nw8RcmBwEi9SOPVs0l+kS/D/gRTlzo0N77kVwTCg6StUqumFHCMaA0THiuRF/aGNawyKWd7Kgl1x+QnEyOEE9FLbgo9LzVF3seL7e1juUGDJhT2XpoMW4fLVDo3T0IJdNhPm1JOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442434; c=relaxed/simple;
	bh=3DYGcwhIywuMuVcxgzn8mDrQQkH6d0xAwzusa7ndpj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mjt3PxADjyILAZwF2P1UGV1Heotebvpyleth7WBBBbyB9DQG7HzeASqfyxIlQmakb834b1KeutzwURh9tMS+ONfvl0WgsKKrAHKAUCQ71O2FaTn2XQsOt7kzE4aFyyi9KNtvkoCWDGhqDSCa7ZRgwyHA9VadyqP75RfUUOc7l90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxEzbdGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2ODREPI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227uMwZ342736
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=; b=KxEzbdGCs4hAdRn4
	vsYCcuDDN+XEaSmt5f3FIsF1ze23z72sfGKzX+E92H/HfsKiVVmq/fDrNZZ03m0s
	x8JmTmx60LFfn7HIQ5BxWKFfp3cYkt1aE/B5hfHfFF3eIPQVtMV/uN9Sejb55VV8
	2JYNilAlhSQHpf8WrYvjxrhsYehGM3CQdd/QbHNDMe482Btm2Uz+Uxm2EbenrDgi
	ngK93U9CD2xEggZoMGI9bD4i9FSYZHe2Uqbxok9z4zKS0vKCBqXBFZXnMnoS2z1j
	A8fQNOLa5d92YUwXaADpaAOnk5QDWtx96q2gHnq52vUcKlAnLz8kwAL9phBi4JJz
	05OKyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649myk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:07:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35842aa350fso22199770a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442431; x=1773047231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=;
        b=D2ODREPIo6qKqFkMeSU/Akf2zUta1zaAol2n06vUx7ere+I5T51OeytI2wab+wTcs0
         wFolGR5eTtDY3hfCSQlZUVjgE/lGjdnn72AGTjdsFVXRimoLiz22pIu+y/aujWOZ+XM/
         98QvphuHJc3EyGsE0r00XX/WCWugjrKzw/TV20WFCiIygc+kOcnUHGV/NePWFI73WM4W
         habx5exFmUkCeJkpgRN3Vs6nQITouflQVsfvGwDOyfgcnjbHmpaoSCgtytwvKujP0jHt
         DDKSzmH4/7rPpXKSo6UsDkcgZQfRdnWEse/GTHBvqeJJdAKV0bBRzVrTbJdn+vGUmpjl
         dbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442431; x=1773047231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=;
        b=czIeyYQ8L+ZvAcOcV/3Iro0xKyEY6ELcnLaDf1TFJiVwb0L3Q+sn4u2kQWNzcqhlfC
         auX+cXGfcwoN+Brhy7SRaqiq70lN46Vn614eIaJ1QrjlOskbqn/rDpQLF4l3S7HMl3M5
         v/btk8MdubjPSHLYlSv/YK7ZjHSiKIwkV+sPfPjPVnBjBJzEL1CsJfCYHMGodXWI2exK
         51XtsSoLJEL7z7L/sm8Ac2vjr2vz+ke/DHisJO+Xwan+RvB1M7vEXzHTvwz/7+DYNdIJ
         cwbEwgA0G8H6C0D7N/Ypq6y1LRQ8ztkIFTa5pKp4nyoqN9JL8qss5P2Xm3aOWUjmKWaF
         gHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX877h5cxuzqOLez4RIrC1Wn9ESh8Z69t+4V8uHqob93Gg7h48AB3Q0ajv3QKg8GgrV2BgG9jDyQ+B7xW5i@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3wNxeqSdmW04CZGA/tAqxqAgQNs2/wqE2rbiMzfYpdrVN0wK
	lHM/d/9JPcvcMx2nU+ix6qmocLjkvcirj86o0XdLi9gQBZjvCMpXgvbr77TJ7As9fRjxYtg4PlH
	S3r6+lXLpG1UDxAnlm+xwI3zZLQTjQ+Iy3X5ZO76A1nPYAKU/pdW9rBdrtwTVpDuBMykB
X-Gm-Gg: ATEYQzyAjPTfXwh1NveqRRv6FQRL/sLTSPI1orXomxIHo9zCrZeNqh7kqS3rwDyiY67
	0s1LfenjjSepM/Q+k0nMHjLqrbBwto7P1zHDbqAMsLpdkIy1f5hxHCLKMeKDr1pCoioCsQIk6T9
	KcnxgigMPe/SOhqhhACZBTO5cJTNo5fsouFzsXpSoI0kTXLVULN6u4pjzu9JsqD/jRdrxGyOyzs
	EgIcz/G9ye9gd8MST5sul5CFN3IPMU+zu7BbknuZ7HJwTsK5NnpMKjWV/MnTobY2Oh/w8f4c0JD
	cDFFvZD/tiWYUcJVsL7A1XoVKybYmwxvL5wnsLV/H9oYNkYkwE63wC29qX/KUGOrqZArTOD46Mg
	rgKMO8IM6sAmNoVjfiwLMgphb6NXIjBYAqi5+Lp03i50wZ8U3GA==
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-3598230ace5mr3362791a91.8.1772442431312;
        Mon, 02 Mar 2026 01:07:11 -0800 (PST)
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id 98e67ed59e1d1-3598230ace5mr3362753a91.8.1772442430727;
        Mon, 02 Mar 2026 01:07:10 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593ddd737fsm17419480a91.13.2026.03.02.01.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:07:10 -0800 (PST)
Message-ID: <741c681d-b496-4dff-be2b-06dbe13acb21@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:37:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
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
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yThdUqO80onCntazezKZ9lQ5rsZfaq1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX2drewSq2EJz6
 TR3w4qLcM49HVcaRjbSsA8vLSibIQ0YFb3Xn66aTeuSx4tsfKYVcuJ2VCitRYfc07DLiczikQdP
 HS0M2vqBcAI8ZxlKf2ft1i7r4upujaQxL1hy5v2gljEEc4XtjE4kxM1iO1AEke6BU1ifevQaW23
 EKt2jmZqdzttFxLN3UVF4KW+e/k5LsdVK7sc8otMQrFgMRkLNcBJbcD0mk++RtfZRV7EUMTcdcR
 vIFE2UJNT8IkY5THs8H4eQ1XDLvLOFQ8jFc2D7fONxGtTh7iNSqohrSMqsPpNv/fBNSxVs8YZbO
 1PQao0oWGQ1VzgjoENcIGQyLHlJR/HW5UrxcZ6qM9uIPXc6FUKv4MRq0l9hgpbBbiArnb/PuG+O
 V3yATNrRGHOT6eikB/Sbbsi5DWfJX5SbxoTEllw7DCvZMIzqWaUuVbXauMjfNpqcOqhvFXxuDw1
 qCMneEPjwGdQmhbSiwg==
X-Proofpoint-ORIG-GUID: yThdUqO80onCntazezKZ9lQ5rsZfaq1q
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a55340 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AnjHHbesreVsCw1LpdIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020078
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
	TAGGED_FROM(0.00)[bounces-94812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B062C1D5520
X-Rspamd-Action: no action



On 2/24/2026 4:09 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:05AM +0530, Ekansh Gupta wrote:
>> Add two GEM-related IOCTLs for the QDA accelerator driver and hook
>> them into the DRM accel driver. DRM_IOCTL_QDA_GEM_CREATE allocates
>> a DMA-backed GEM buffer object via qda_gem_create_object() and
>> returns a GEM handle to userspace, while
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET returns a valid mmap offset for a
>> given GEM handle using drm_gem_create_mmap_offset() and the
>> vma_node in the GEM object.
>>
>> The QDA driver is updated to advertise DRIVER_GEM in its
>> driver_features, and the new IOCTLs are wired through the QDA
>> GEM and memory-manager backend. These IOCTLs allow userspace to
>> allocate buffers and map them into its address space as a first
>> step toward full compute buffer management and integration with
>> DSP workloads.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  5 ++++-
>>  drivers/accel/qda/qda_gem.h   | 30 ++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
>>  include/uapi/drm/qda_accel.h  | 36 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 105 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 19798359b14e..0dd0e2bb2c0f 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/qda_accel.h>
>>  
>>  #include "qda_drv.h"
>> +#include "qda_gem.h"
>>  #include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>> @@ -154,10 +155,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>>  static const struct drm_ioctl_desc qda_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>>  };
>>  
>>  static struct drm_driver qda_drm_driver = {
>> -	.driver_features = DRIVER_COMPUTE_ACCEL,
>> +	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>>  	.open			= qda_open,
>>  	.postclose		= qda_postclose,
>> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
>> index caae9cda5363..cbd5d0a58fa4 100644
>> --- a/drivers/accel/qda/qda_gem.h
>> +++ b/drivers/accel/qda/qda_gem.h
>> @@ -47,6 +47,36 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
>>  void qda_gem_free_object(struct drm_gem_object *gem_obj);
>>  int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
>>  
>> +/*
>> + * GEM IOCTL handlers
>> + */
>> +
>> +/**
>> + * qda_ioctl_gem_create - Create a GEM buffer object
>> + * @dev: DRM device structure
>> + * @data: User-space data containing buffer creation parameters
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler creates a new GEM buffer object with the specified
>> + * size and returns a handle to the created buffer.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +/**
>> + * qda_ioctl_gem_mmap_offset - Get mmap offset for a GEM buffer object
>> + * @dev: DRM device structure
>> + * @data: User-space data containing buffer handle and offset result
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler retrieves the mmap offset for a GEM buffer object,
>> + * which can be used to map the buffer into user-space memory.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>>  /*
>>   * Helper functions for GEM object allocation and cleanup
>>   * These are used internally and by the PRIME import code
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> index 9fa73ec2dfce..ef3c9c691cb7 100644
>> --- a/drivers/accel/qda/qda_ioctl.c
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -43,3 +43,38 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
>>  
>>  	return 0;
>>  }
>> +
>> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_gem_create *args = data;
>> +	struct drm_gem_object *gem_obj;
>> +	struct qda_drm_priv *drm_priv;
>> +
>> +	drm_priv = get_drm_priv_from_device(dev);
>> +	if (!drm_priv || !drm_priv->iommu_mgr)
>> +		return -EINVAL;
>> +
>> +	gem_obj = qda_gem_create_object(dev, drm_priv->iommu_mgr, args->size, file_priv);
>> +	if (IS_ERR(gem_obj))
>> +		return PTR_ERR(gem_obj);
>> +
>> +	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
>> +}
>> +
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_gem_mmap_offset *args = data;
>> +	struct drm_gem_object *gem_obj;
>> +	int ret;
>> +
>> +	gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +	if (IS_ERR(gem_obj))
>> +		return PTR_ERR(gem_obj);
>> +
>> +	ret = drm_gem_create_mmap_offset(gem_obj);
>> +	if (ret == 0)
>> +		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +	drm_gem_object_put(gem_obj);
>> +	return ret;
>> +}
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> index 0aad791c4832..ed24a7f5637e 100644
>> --- a/include/uapi/drm/qda_accel.h
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -19,6 +19,8 @@ extern "C" {
>>   * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>>   */
>>  #define DRM_QDA_QUERY	0x00
>> +#define DRM_QDA_GEM_CREATE		0x01
>> +#define DRM_QDA_GEM_MMAP_OFFSET	0x02
>>  /*
>>   * QDA IOCTL definitions
>>   *
>> @@ -27,6 +29,10 @@ extern "C" {
>>   * data structure and direction (read/write) for each IOCTL.
>>   */
>>  #define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
>> +#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
>> +						 struct drm_qda_gem_create)
>> +#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>> +						 struct drm_qda_gem_mmap_offset)
>>  
>>  /**
>>   * struct drm_qda_query - Device information query structure
>> @@ -40,6 +46,36 @@ struct drm_qda_query {
>>  	__u8 dsp_name[16];
>>  };
>>  
>> +/**
>> + * struct drm_qda_gem_create - GEM buffer object creation parameters
>> + * @size: Size of the GEM object to create in bytes (input)
>> + * @handle: Allocated GEM handle (output)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
>> + * a new GEM buffer object.
>> + */
>> +struct drm_qda_gem_create {
>> +	__u32 handle;
>> +	__u32 pad;
>> +	__u64 size;
> If you put size before handle, you would not need padding.
ack
>
>> +};
>> +
>> +/**
>> + * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
>> + * @handle: GEM handle (input)
>> + * @pad: Padding for 64-bit alignment
>> + * @offset: mmap offset for the GEM object (output)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
>> + * the mmap offset that can be used with mmap() to map the GEM object into
>> + * user space.
>> + */
>> +struct drm_qda_gem_mmap_offset {
>> +	__u32 handle;
>> +	__u32 pad;
>> +	__u64 offset;
> I'm really not a fan of the pad field in the middle of the structure.
ack
>
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> -- 
>> 2.34.1
>>


