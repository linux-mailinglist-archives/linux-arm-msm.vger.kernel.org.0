Return-Path: <linux-arm-msm+bounces-110891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9x68LWC7H2qQpAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09233634437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oWTLogLX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EPsyCpVP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67953300CC2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 05:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDAF3750C9;
	Wed,  3 Jun 2026 05:26:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B537647E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 05:26:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464396; cv=none; b=VMhDYm6A0+ZdMj2NnNx7EF2atMQ3+hmSXZhZin8PFB6kxmAwnkfllPVFlAD1YCrwdxyBMhbtU36q8PFtnKEIflhM20UE6U8xxKyPRe7OAFdPbm8GnS/uCRElrde7P/H7nhHfKB85PmdBE/n/eI0HjilzFsg2k7gJFjjJK3TUxWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464396; c=relaxed/simple;
	bh=YJckN7k5QaN4smziFaJ4SRbWkD8f7N5Q6iRQlgaG3Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9KFqoE4WFrJVaWRPTCK5JXg6/q4vXp1ideOg1CwJQ14KZ0ULXPShmmcBpMslUu9vhUVcmm+Wm++NBJxQZq3VmfuCV1zLCfDub4ca54PNWe0IX9DTgd7Z07iyu04QVgxXVG6rpOyolXU6zdmBKmAl6Wabtyvd4/bA+yRcxmPFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWTLogLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPsyCpVP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652KIFts2687973
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 05:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3YqEw6zmQVetKx6FqU85A3xswC4mhkwqjLvA/EaE9Y=; b=oWTLogLXHlBUieIp
	QeaN0yv1pxWQz460jHGVfJwyvC+ISSABgzq/NU2K2JZBMhdjIwkPZ7OAynwQWpsw
	sT5TrLSuvInxSSDqeiO5NPvdKlbpBa8ISSRRHoaF0TlRVhRMHwK0j/pDBqjah6R/
	oWN/446gEL9YJikmBnHmsG+zEQm+RUVhJcvwh8Hx+4LyaD1Rh8sfcCxWnMxy8N4O
	9jbHEnn3UfV45GWYcRJUqJmZiMCAQVJWfq3GhYivelnlh659geNxJ8Rp/yvqsiE8
	urL6JcbMCp6h9lfDmm4XyrUVEEQwPh5vXQ9cropBDJTEIKDdgv/DNqVUV3AfDz6U
	H7Xrig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsjad9p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:26:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so4057792a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780464393; x=1781069193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3YqEw6zmQVetKx6FqU85A3xswC4mhkwqjLvA/EaE9Y=;
        b=EPsyCpVPbiUo2305IrI8xRbvhWYNONhJ/XS10ASAjzz4IudM6u8zepz3aQQRNtpRUE
         f3zbDuuuVVibVa40LrITzUmcQhI4cN2mPFGUh5otjOGCdCEHp+TeqIKHXlT0tZkbfjXP
         Rs5v7Oc2lhtS87zOdDkVtasC8o82Sy4ep59fcfcvE3qSvKHLDcc+mqpQBY6ZS6C+o3I2
         rMANvJqIdCt7hXxXHL+MQbgdWkFvkQLA+R9nH9IZQji5PCEe6RszAQMSzmBI/6TzSl+W
         +c66tVQsAc+t4AMYrh1jJcQtqwe0zV5mZTSXTeJCiliPls73mmW6pC3DoARQY6l17p4a
         46Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780464393; x=1781069193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3YqEw6zmQVetKx6FqU85A3xswC4mhkwqjLvA/EaE9Y=;
        b=WH0H+ljmyHaS+W4Sa7/FykfTfA1ErgU+r4PjrycD+F5Gh7YSlGeZgdfKMVqwRAr/Dn
         sR3Fxjko0R9sZIQ8LyfyvREfQZNLi3jouOuKxoXcBzXxo/kTftJrYQibZOrMqS7ijC6M
         AlxByCCe3mWhEiL7H0owWCBKJik7g8jjIVy14v2f4UkZrPxkfgkTpX3i8JHrTo9tOD4V
         vYygSYRxytcbOEo5zIbQO1lupK1GRzVgPkKx4OErjGDuZJJzQbbfE+sFcwav2mGpeBRw
         ViOwpH6tZ/VR1tGdYPuav6bWLAjhvVrbHChlbrlt/CPbHgWobKp4CKHa2F5AIzjmY5Ms
         NHYA==
X-Forwarded-Encrypted: i=1; AFNElJ/fszf+UKxR3+OcoA7ilcOGpW8IBCwfJ7JAJwtBChbq1QB1OVqjZaNQJ8EGY30zY/Fm/aYLrouFcpcHIsVZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFosAMhux9KpTeHCDFrm2x8zSzHR7nsdQfO+Pr5o2owrMJsc4W
	91gXeWWh0pJk50xaBEXbtIIVLUwVxjxelw9b5n4l0YJFDCOALu357auHTdcgKEjUYNrpWiNaQIe
	tOCBGoAONiA3cknSnjJfCnN0P7tSX/gpyC6EgV44KcinodPiT8LoqXjTbtD9PycOVabIi
X-Gm-Gg: Acq92OHpr3Jmb+2eaXhJZbTtYmyJh5fQh+ZjdVgp7uYABP2if75T/pj/C0Je4cM8qMW
	Tj0y0ptmGs0y4/mbH3NxrGNjoPnCveD0mDWbTXqXu38RbKWItvtaPDmlBv3orpgIOqd+txLVENO
	l2K6TSaWr6kZZstA4NwQdRXnMJIwD9t7+f7iwYoDzVljNROREOmynwcEoFBzwboueVZ8EVsucgO
	rynioSeelvpYHoDU0WN8QmVX0H6XcVrChtiVydoaLblRSeybUUuIoL3MnuL3nXtfd98SVZqhFJi
	lj5AJ1mOA1dO3ssGU3Qymnn7mlwv/OQIxrpuOK/B1nyM85HRqMcML6vvuMZ/3Rrt2rfhdNdwS5e
	YlvmtKJHLdg54gFV978UoP046Nmj47hJvjaIqCDxxo/vKIJMjNQC+gShfjfSr
X-Received: by 2002:a05:6a21:46c5:b0:3b4:7bcc:5227 with SMTP id adf61e73a8af0-3b4977ff33bmr2188809637.12.1780464392892;
        Tue, 02 Jun 2026 22:26:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:46c5:b0:3b4:7bcc:5227 with SMTP id adf61e73a8af0-3b4977ff33bmr2188762637.12.1780464392345;
        Tue, 02 Jun 2026 22:26:32 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm1964720b3a.11.2026.06.02.22.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:26:31 -0700 (PDT)
Message-ID: <8cdcca7f-7167-429b-b7ce-28e9b1f32256@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 10:56:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] accel/qda: Add initial QDA DRM accelerator driver
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
 <20260519-qda-series-v1-3-b2d984c297f8@oss.qualcomm.com>
 <wbrrredwk2id5ntjlvxhk66uxxa6elwbqg2sj2jmrydz7ss4qz@hsvwcj4iocsu>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <wbrrredwk2id5ntjlvxhk66uxxa6elwbqg2sj2jmrydz7ss4qz@hsvwcj4iocsu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA0OSBTYWx0ZWRfX3txkigeJqbBA
 SRJGjABO/rwFdBjsPbWQJTvqE9amnl92DQ/boPpmk09r0YB8Jq1abc9w/8kiCP1AD7NdSpxChTt
 U6hPBPr1sEvFxbjIWsB+EIHR7BTKfySGUxn49MfWZvs/IOL2PLMJXFnKGxw/zTqS106eBTggNkx
 YtZYawO+MXZQkLXz/x24FQ+di0aTaxGAQRoeSsRgM87NZD53iy/f6NndihurfzY1QNVE6Is/+bf
 MJSAJ9HKo0oC9L6cVpovfnCX/+dbJ5ner4kF0nSHVQyc0qGDXS1gXmVbIFgc21cSdhm4w8+3MFR
 Da2b2w82KXaa33sNeOQ4HXLWY2Uq6JkJq+qmxwBc6NMhEDrasWw8srSEPQlNZ3VqrTyEYuKaOD0
 55lceOZm665/AWKDjn3xdLl7ll2IA7WW/qUQLU5zcVNsHt4SUHNrP982PDPeodtQWmaZkjC2amn
 6XAmGB94of4nyP6o9JA==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1fbb0a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vu9siaMUKByHOgeoVcYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vtN03978UCJJA9h8BPF5oUtg0CsHzR1o
X-Proofpoint-ORIG-GUID: vtN03978UCJJA9h8BPF5oUtg0CsHzR1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 09233634437

On 20-05-2026 19:48, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:53AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Add the foundational driver files for the Qualcomm DSP Accelerator
>> (QDA), a DRM accel driver for Qualcomm DSPs. The driver integrates
>> with the DRM accel subsystem (drivers/accel/) and provides:
>>
>>   - A standard /dev/accel/accel* character device node via DRM.
>>   - GEM-based buffer management with DMA-BUF import/export (PRIME).
>>   - IOMMU context bank management for per-session memory isolation.
>>   - Standard DRM IOCTLs for device management and job submission.
>>
>> qda_drv.c / qda_drv.h: Core DRM driver registration. Defines the
>> drm_driver ops table, per-file private state (qda_file_priv), and the
>> main device structure (qda_dev) which embeds drm_device.
>>
>> qda_rpmsg.c / qda_rpmsg.h: RPMsg transport layer. Registers an
>> rpmsg_driver matching the "qcom,fastrpc" compatible string. On probe
>> it allocates a qda_dev, reads the DSP domain name from the "label" DT
>> property, and registers the DRM device.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/Kconfig         |  1 +
>>  drivers/accel/Makefile        |  1 +
>>  drivers/accel/qda/Kconfig     | 30 +++++++++++++
>>  drivers/accel/qda/Makefile    | 10 +++++
>>  drivers/accel/qda/qda_drv.c   | 97 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_drv.h   | 62 +++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c | 99 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.h | 13 ++++++
>>  8 files changed, 313 insertions(+)
>>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index bdf48ccafcf2..74ac0f71bc9d 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
>>  source "drivers/accel/habanalabs/Kconfig"
>>  source "drivers/accel/ivpu/Kconfig"
>>  source "drivers/accel/qaic/Kconfig"
>> +source "drivers/accel/qda/Kconfig"
>>  source "drivers/accel/rocket/Kconfig"
>>  
>>  endif
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 1d3a7251b950..58c08dd5f389 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>> +obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
>>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
>> \ No newline at end of file
>> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
>> new file mode 100644
>> index 000000000000..484d21ff1b55
>> --- /dev/null
>> +++ b/drivers/accel/qda/Kconfig
>> @@ -0,0 +1,30 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Qualcomm DSP accelerator driver
>> +#
>> +
>> +config DRM_ACCEL_QDA
>> +	tristate "Qualcomm DSP accelerator"
>> +	depends on DRM_ACCEL
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on RPMSG
>> +	help
>> +	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>> +	  This driver provides a standardized interface for offloading computational
>> +	  tasks to the DSP, including audio processing, sensor offload, computer
>> +	  vision, and AI inference workloads.
>> +
>> +	  The driver supports all DSP domains (ADSP, CDSP, SDSP, GDSP) and
>> +	  implements the FastRPC protocol for communication between the application
>> +	  processor and DSP. It integrates with the Linux kernel's Compute
>> +	  Accelerators subsystem (drivers/accel/) and provides a modern alternative
>> +	  to the legacy FastRPC driver found in drivers/misc/.
>> +
>> +	  Key features include DMA-BUF interoperability for seamless buffer sharing
> 
> Key features of what? Consider distro maintainers reading your help text
> in order to identify whether to enable it or not.
ack>
>> +	  with other multimedia subsystems, IOMMU-based memory isolation, and
>> +	  standard DRM IOCTLs for device management and job submission.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called qda.
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> new file mode 100644
>> index 000000000000..dbe809067a8b
>> --- /dev/null
>> +++ b/drivers/accel/qda/Makefile
>> @@ -0,0 +1,10 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Makefile for Qualcomm DSP accelerator driver
>> +#
>> +
>> +obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>> +
>> +qda-y := \
>> +	qda_drv.o \
>> +	qda_rpmsg.o
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> new file mode 100644
>> index 000000000000..1c1bab68d445
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -0,0 +1,97 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <drm/drm_accel.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "qda_drv.h"
>> +#include "qda_rpmsg.h"
>> +
>> +static int qda_open(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qda_file_priv *qda_file_priv;
>> +
>> +	qda_file_priv = kzalloc_obj(*qda_file_priv);
>> +	if (!qda_file_priv)
>> +		return -ENOMEM;
>> +
>> +	qda_file_priv->qda_dev = qda_dev_from_drm(dev);
>> +	file->driver_priv = qda_file_priv;
>> +
>> +	return 0;
>> +}
>> +
>> +static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qda_file_priv *qda_file_priv = file->driver_priv;
>> +
>> +	kfree(qda_file_priv);
>> +	file->driver_priv = NULL;
>> +}
>> +
>> +DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>> +
>> +static const struct drm_driver qda_drm_driver = {
>> +	.driver_features = DRIVER_COMPUTE_ACCEL,
>> +	.fops = &qda_accel_fops,
>> +	.open = qda_open,
>> +	.postclose = qda_postclose,
>> +	.name = QDA_DRIVER_NAME,
>> +	.desc = "Qualcomm DSP Accelerator Driver",
>> +};
>> +
>> +struct qda_dev *qda_alloc_device(struct device *dev)
>> +{
>> +	struct qda_dev *qdev;
>> +
>> +	qdev = devm_drm_dev_alloc(dev, &qda_drm_driver, struct qda_dev, drm_dev);
>> +	if (IS_ERR(qdev))
>> +		return ERR_CAST(qdev);
>> +
>> +	return qdev;
>> +}
>> +
>> +void qda_unregister_device(struct qda_dev *qdev)
>> +{
>> +	drm_dev_unregister(&qdev->drm_dev);
>> +}
>> +
>> +int qda_register_device(struct qda_dev *qdev)
>> +{
>> +	int ret;
>> +
>> +	ret = drm_dev_register(&qdev->drm_dev, 0);
>> +	if (ret)
>> +		drm_err(&qdev->drm_dev, "Failed to register DRM device: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int __init qda_core_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = qda_rpmsg_register();
>> +	if (ret)
>> +		return ret;
>> +
>> +	pr_info("qda: QDA driver initialization complete\n");
>> +	return 0;
>> +}
>> +
>> +static void __exit qda_core_exit(void)
>> +{
>> +	qda_rpmsg_unregister();
>> +}
>> +
>> +module_init(qda_core_init);
>> +module_exit(qda_core_exit);
>> +
>> +MODULE_AUTHOR("Qualcomm AI Infra Team");
>> +MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> new file mode 100644
>> index 000000000000..7ba2ef19a411
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_DRV_H__
>> +#define __QDA_DRV_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/types.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +
>> +/* Driver identification */
>> +#define QDA_DRIVER_NAME "qda"
>> +
>> +/**
>> + * struct qda_file_priv - Per-process private data for DRM file
>> + */
>> +struct qda_file_priv {
>> +	/** @qda_dev: Back-pointer to device structure */
>> +	struct qda_dev *qda_dev;
>> +};
>> +
>> +/**
>> + * struct qda_dev - Main device structure for QDA driver
>> + *
>> + * The DRM device is embedded as the first member so that container_of()
>> + * can recover the qda_dev from any drm_device pointer.
>> + */
>> +struct qda_dev {
>> +	/** @drm_dev: Embedded DRM device; recover via qda_dev_from_drm() */
>> +	struct drm_device drm_dev;
>> +	/** @rpdev: RPMsg device for communication with the remote processor */
>> +	struct rpmsg_device *rpdev;
>> +	/** @dev: Underlying Linux device */
>> +	struct device *dev;
>> +	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
>> +	const char *dsp_name;
>> +};
>> +
>> +/**
>> + * qda_dev_from_drm - Recover qda_dev from an embedded drm_device pointer
>> + * @dev: Pointer to the embedded drm_device
>> + *
>> + * Return: Pointer to the enclosing qda_dev.
>> + */
>> +static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
>> +{
>> +	return container_of(dev, struct qda_dev, drm_dev);
>> +}
>> +
>> +/* Device allocation (uses devm_drm_dev_alloc internally) */
>> +struct qda_dev *qda_alloc_device(struct device *dev);
>> +
>> +/* Core device lifecycle */
>> +int qda_register_device(struct qda_dev *qdev);
>> +void qda_unregister_device(struct qda_dev *qdev);
>> +
>> +#endif /* __QDA_DRV_H__ */
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> new file mode 100644
>> index 000000000000..6eaf1b145f8a
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/rpmsg.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "qda_drv.h"
>> +#include "qda_rpmsg.h"
>> +
>> +static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
> 
> Use the prefix uniformly.
> 
ack>> +{
>> +	struct qda_dev *qdev;
>> +
>> +	qdev = qda_alloc_device(&rpdev->dev);
>> +	if (IS_ERR(qdev))
>> +		return qdev;
>> +
>> +	qdev->dev = &rpdev->dev;
>> +	qdev->rpdev = rpdev;
>> +	dev_set_drvdata(&rpdev->dev, qdev);
>> +
>> +	return qdev;
>> +}
>> +
>> +static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
>> +			void *priv, u32 src)
>> +{
>> +	/* Placeholder: responses will be dispatched here */
>> +	return 0;
>> +}
>> +
>> +static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
>> +
>> +	drm_dev_unplug(&qdev->drm_dev);
>> +	qdev->rpdev = NULL;
>> +	qda_unregister_device(qdev);
>> +	dev_info(qdev->dev, "RPMsg device removed\n");
> 
> Drop the spamming. And useless (where it is useless) drm_dbg() / dev_dbg() spamming too.
ack>
>> +}
>> +
>> +static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev;
>> +	const char *label;
>> +	int ret;
>> +
>> +	dev_dbg(&rpdev->dev, "QDA RPMsg probe starting\n");
>> +
>> +	qdev = alloc_and_init_qdev(rpdev);
>> +	if (IS_ERR(qdev))
>> +		return PTR_ERR(qdev);
>> +
>> +	ret = of_property_read_string(rpdev->dev.of_node, "label", &label);
>> +	if (ret) {
>> +		dev_err(qdev->dev, "Missing 'label' property in DT node: %d\n", ret);
>> +		return ret;
>> +	}
>> +	qdev->dsp_name = label;
> 
> Why not just of_property_read_string(...., &qdev->dsp_name)?
> 
>> +
>> +	ret = qda_register_device(qdev);
> 
> return qda_register_device();
ack>
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
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
>> +		pr_err("qda: Failed to register RPMsg driver: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +void qda_rpmsg_unregister(void)
>> +{
>> +	unregister_rpmsg_driver(&qda_rpmsg_driver);
>> +}
> 
> Just use module_rpmsg_driver(), drop all the wrappers and module_init()
> / exit().
I'll check and update this.>
>> diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
>> new file mode 100644
>> index 000000000000..5229d834b34b
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_rpmsg.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_RPMSG_H__
>> +#define __QDA_RPMSG_H__
>> +
>> +/* RPMsg transport layer registration */
>> +int qda_rpmsg_register(void);
>> +void qda_rpmsg_unregister(void);
>> +
>> +#endif /* __QDA_RPMSG_H__ */
>>
>> -- 
>> 2.34.1
>>
>>
> 


