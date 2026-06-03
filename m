Return-Path: <linux-arm-msm+bounces-110898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hmKfBDvBH2rvpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:52:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 635206346B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:52:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l8j4zNtb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KTdz3UQq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DC9730BA830
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 05:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D55E3CDBD9;
	Wed,  3 Jun 2026 05:46:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E837756F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 05:46:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465608; cv=none; b=tv0nX7B3UjJnOLt0aeD5SzIH9c0vMRy8t79B+7LnQk05FEpSCYby+DV3Htwv29vY473vhDMe+jGbqmdjXYQU1eNZKYBn4DW9eDbBvhxpc+n9dtYNpfzIkSKU14vB/GrFZ3/5ZUhM+RxaNgmd8BR9JkVo02H6Vzz+0fauRoMZoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465608; c=relaxed/simple;
	bh=0YcqXif0Sc0+zfmEVlu6cC7JsndqG3qCjJYzOwNGScc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4O5Ceeze4sZlcBUibfYjtPsNKySv0oq83jVgpjM/tFyYzbaPT+sPBLpH2G4wSYZPPNU3YoTBrxnW0cT0PajmY4fOVSBS8rs2fs4nQI8NlQhhWvyIG7lk/M8QYOBeqBcRqrI1OMjReoN7226/S3t3VdJwG0wI0ioFgsPKYSCjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8j4zNtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTdz3UQq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535Wrmj301625
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 05:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=; b=l8j4zNtbaNo9Nw2A
	dI861FKta50sP94zsAFz9s/HbxVQJGYtbZTU2VKRrawcVwcmjArJCbq0vLiB7uko
	TqsWqSXPjhAYWSPF5mi1LZCU65HiO7bA10vMCnENN5ctlYxx742kBHkKvrWgFODQ
	X5Xw8JTjr/cBAoH7UvLA1+rBgO2rLZEQFrVs/NTqTgbLtYeXyEGSwvdywLjO90QK
	rUZBHOjPcSqFNwUow8/nseSuP41yZlhym007DBINCXH8wwdLwLK+IlmzKZFXcDYy
	LvqTBWpN4jSXiXqGARQS11F5LpoA+bicR5UPgRXZ7kF47zWEJkUo0G+erkD7mDGJ
	QqVu7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1cmwv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:46:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97415004so6770585a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465605; x=1781070405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=;
        b=KTdz3UQqOZZUWyJfULYlihRQUhjWBks9I5j0vQ27NfJoMePkLvlGreIJ1u1gC/pCEc
         u7Ff7kPQ+qpMKVM3t8ND8QZHORwViN9U19BdIi5oaGPZy7bTt6N6/da3M7sG+pRbx8Z7
         6+mRvWxAprKpy2FO/P7aqQydxosOEPNJseEZr9e9r2cgXZR1XoL5sl17z0DxjKZwtx0o
         qJG+vGyHHoiGIRYQvX/kCbyRAz7crsWvSzTGpZoCZWP5bAfOTFuErcD3YYgQo447ZMEg
         bV2yA60tiPQygZLSFMF6pcIQ4Vw6Nmt+7KL+ILgmIkN1h3T/bs3C9kbpO+vGgi+UDzIk
         H1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465605; x=1781070405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=;
        b=nqJUZHhkUf4+h2fTdYDUJhAA8HPTXM33cLxAGbFRndfpfVNMY62bg8ES+RC872RPID
         QL8yJfFdxOzpLuGhGm5cFQIjtz4pYWxW/hm4b+dJaKUOMt+hWvEEiOV26+XErG9McU4j
         twArbOMGyLpLg9ylGtchjt8K6NMQG4VyS81IgA1Cb5GPV0ENYibmAsIK5i6490NXFqZ2
         YxIxoCxIhsULcVllmChUFexkrjPlGYl0BXT23HppJDGBWfzLYTpfutXn30or2YrBsKs4
         wQZIY3dLN6LMpQ4aXXXx2+ufqRsX97TiU3jYBOmZJLKPDChJ+6egwZ03PQiI538DZ/1h
         OY5A==
X-Forwarded-Encrypted: i=1; AFNElJ8GaugmWv/jVJnObDD9IG4HhC4mkjXJzTduiHmnv//zsZ7SW+y6CsgPOeKnWYPmMICG+IadWxWLk4/pwJM+@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSi05EaGLIAL4+jnKK42iIGWU+HuBNfqblp6Xy6GanSqP71L8
	7Jer3zeCTkUIclIkxR15+xOsI+c3UZ8DkY6cX8UtdpRgmFyZDI7/OrKEjEPye8h4WMUtZeFusUR
	NuOKSWPiRShtVB1CP7+J7YH9alVnStCrX1h4Ro45FkpAwFYU0gt+1X4VmKBow21chHrp8
X-Gm-Gg: Acq92OHpd0OlGnbIOYDIy4XLndobGwBlfb40AM6t3nSk05Ac26Y7+q708zbUWJtuCU1
	HXYD+em8NFGb8uq6LKB4yZlO0f1Hp2SjIbvUw4Uu8UmIvL9gR0xSKYxEU/xAS4ANIeiLBIzAlaE
	T0+lCvMcjEiHfZFZ3w2OcgT5VsS4kZiTb6Y6yL6xQu4JQcPmNvNGbJwUgYgIWmMlqo5vlFW56Ex
	OP/kbm0Yopl/45mgxZQswPpQR9H0V3hEQSE5Kfj2bBIsOIMhkb7xwTA1q2LNKw9fvWi1boUz2Kb
	HH4B16xyiCepwTP9h4XiKOGjkh9u/wtlDXXvz82EULFCAfEa0ltA6Zbrz8eEJU9Xwrym4b1t6Wu
	KNyd+fC02tRbeaa6mH+5i4MYxJBdUQbaVvH6Wp4a57bJKqbB4gHT3VO9DGeqE
X-Received: by 2002:a17:90b:3a90:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36e33bb9354mr1974871a91.18.1780465604772;
        Tue, 02 Jun 2026 22:46:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3a90:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36e33bb9354mr1974830a91.18.1780465604223;
        Tue, 02 Jun 2026 22:46:44 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ca4dsm10999325ad.76.2026.06.02.22.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:46:43 -0700 (PDT)
Message-ID: <f146f972-6508-4147-86f1-2b88c80e1c89@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] accel/qda: Add memory manager for CB devices
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
 <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UayVUG1Yx-UpTyAnigr6siY6dkI2HvWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MyBTYWx0ZWRfX/GCcpPVLTkkd
 0pql1v/5kFk+bJlT5IhqQFZ+qDY4vJqPoHY6h3xuRIAZTewtEKMyW+ZHP9DvXwRztyg0G2mbFgM
 hs3emulZGHAYJlwhePwpSuH4RD4xUR2El/pdEc2LN6CdQMgpmF8hnqwjLzeH9xXQ4qN5l8QZjLx
 9FmPEpwBoDcRprlLvSfK5HjltM7kbJgpyotzRwJKjag7Vs1R6OILtWSAA6fjWxXyr3PoUgKuh0g
 UrF/ZK9/2+LdE+r4oeNpq1ushA8MX7q+GOv2tymnCWsxh6Zm9Z2m1LNogc4e6MSMLkP+D9wqc60
 OIrTkxHt+rfgv2BwtIVveK6JWc7EypuSI+9F0KanKgw8oASuuDEYKyLFk2t9tYjmOjxVn/a1eH4
 j3OmIqY7X/YCXLFkq/v3pekuSaMHbSfGpROyQWnfYY0NqGqMMzhzHUX/qgf86qHb7q1l1QAf/bl
 qbarMpRoSxXbSIEhhgA==
X-Proofpoint-GUID: UayVUG1Yx-UpTyAnigr6siY6dkI2HvWP
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1fbfc5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LzV4jstc-Az_XmsxRYMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 635206346B2

On 20-05-2026 19:57, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the QDA memory manager (qda_memory_manager) to track and
>> manage the IOMMU devices that back each compute context bank (CB).
>>
>> Each CB device registered on the qda-compute-cb bus is assigned a
>> unique ID via an XArray and wrapped in a qda_iommu_device descriptor
>> that records the device pointer and its stream ID. This registry
>> allows the driver to look up the correct IOMMU domain for a given
>> session when mapping DSP buffers.
>>
>> The memory manager is initialised in qda_init_device() before CB
>> devices are populated and torn down in qda_deinit_device() after they
>> are destroyed, ensuring no dangling references remain in the XArray.
>>
>> qda_cb.c is extended with qda_cb_setup_device(), which is called
>> immediately after a CB device is registered on the bus. It allocates
>> a qda_iommu_device, registers it with the memory manager, and stores
>> it as the CB device's driver data so that qda_destroy_cb_device() can
>> retrieve and unregister it during teardown.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
>>  drivers/accel/qda/qda_drv.c            |  34 ++++++++++
>>  drivers/accel/qda/qda_drv.h            |   5 ++
>>  drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c          |   7 +++
>>  7 files changed, 254 insertions(+)
>>
>> @@ -61,14 +62,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	}
>>  	qdev->dsp_name = label;
>>  
>> +	ret = qda_init_device(qdev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>>  	if (ret) {
>>  		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
>> +		qda_deinit_device(qdev);
>>  		return ret;
>>  	}
>>  
>>  	ret = qda_register_device(qdev);
>>  	if (ret) {
>> +		qda_deinit_device(qdev);
>>  		qda_cb_unpopulate(qdev);
> 
> No, this is not how you unwind in the error case in the kernel. Follow
> the established patterns.
Okay, I see your point and the same you highlighted on previous patch.
I'll update this.>
>>  		return ret;
>>  	}
>>
>> -- 
>> 2.34.1
>>
>>
> 


