Return-Path: <linux-arm-msm+bounces-102059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKHzOjid1GmTvwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 07:59:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 469EC3AA222
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 07:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5E5B300B12C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 05:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B83379988;
	Tue,  7 Apr 2026 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXDBf8zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBOKEYdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC447379EC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775541558; cv=none; b=QJ6gzXMHiAhROO3j727h9hHqrYa5y5nIVl8ggya/NP4xueRbjIuXfk4QBQPCuU97Q0V+/SrZNW2e3/S9AUd6fMf42nZtslFB6kDWByEjxPbGn1XfzqQhyrpgTTYnS7aqvySn0V6H2JXnhM1s4RECU7336OhQAUcE3hGZJPUw8mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775541558; c=relaxed/simple;
	bh=+waxWvuIdblQwSK0LMBlRssWQWRBByVD1LkgZxScWxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqkR12tNSWFoLCXZQKxoiBhnuc2WOHqpGDIQFlzmevxSfgV1AN4bSoq2OLDp3b3UoOTyNrNJwkuYkqNYwywRe/mUDK+MQrLaFK8c20k5KnV1R/F8khw3yqEhg4UlB85U375Z48N+fubUKiPDXzUUjxrvt99yskQkVScaE/WtHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXDBf8zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBOKEYdJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LTKax2329704
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 05:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfT7QPihX4OgkMMOjbehnijLiUTAAKQj5AA4AOc8mVk=; b=EXDBf8zuH8JhncLl
	aI3XulCjdgPV65gy9QuL40kqX+fGXAqiTr+jStkrrC/Mw88uoGyhY4qh20TACZv5
	BA21nJIvPjvFhvWSMs1UVHxXLPZbC8l96OKMqbwcqoJsDAO4qHGdrfxQ7x0uGkhL
	wLLheU4PWHSvsyO2cR1K/fYUM13TUaT5UWmKc6Vuqjad7Dq8NRhdjuO5xPiugbCH
	hn2VCpAQtS/SvSz1faFDO250stFhOAx/w87oiGSU/FF6cCVc45ZHBpu+gF36L0pX
	vXM9ky6xtrZN9Ue+DqC+K5yLkJ1ZFYYvIrm8g1bV0lVF/U0eqXSnTkb2liGYQm5M
	eIwcPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4s8yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 05:59:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242cbb97aso37884935ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775541554; x=1776146354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfT7QPihX4OgkMMOjbehnijLiUTAAKQj5AA4AOc8mVk=;
        b=OBOKEYdJWEt02+UHGjljL4rNTc5J6g7PhdiQBtmqQ203GJTogsMjaqxaJwy206l0Xz
         Tp68gWdlHP44Bg3SKu/FsWEzw3D2t8KIDERQfpMrVT8MDU0iki/KB1HQ9cucbbMhUYx3
         jM+dRJVmIAUw5JS7NSExRIhA5B1X4hUhvdR8ippiSX9MdfbOR8Leyk04IFbNrGDvBE6w
         TOpjSUUyFwOsrQuX2AlsdKPf3sg0zQp/JqczJxUThkdeSnwFPfUepCe6xdHOSG/ghUeE
         sXEYFnBLt+kNFM3n/7WHe+7ZnJNumcNTb4QvZxp9aDZTXRkCFbcY88Yq5ebMH0uVccxP
         iBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775541554; x=1776146354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfT7QPihX4OgkMMOjbehnijLiUTAAKQj5AA4AOc8mVk=;
        b=E8XwozajimzoWhMVhLwTzoVXlemp/rbK0iWDy6LDpxiYgaMdmVySeiA4HwDpl8/ohl
         uGu1a4ibL7yIxqYNK7TWxOOpsrnebR7/+40L4vGmgVrzHGxKFwMqquMZC3N1nfiGIi/w
         ln9HIHNnaBPfAFIN6njRM/oSky7ec+bRFm8N4wnoMeoGPatnDrE5wZsCmT2te2TbYKqX
         JjfnQJjqa7W9NJRAj/imeFcUsQzSYxqkSmB2WcTwF43ieyJqbw5vklhzNWuLBtdIorq9
         nrB4GIYKxiXvk4XaIDP8VCs8GfIcWDcKDTNS2Lp2optgFwmZstnonQJ64acQ49R7RPlN
         6SUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd8mS8Y2NObJutmgQRVGW3MH6afktDdkl33z2z55IEZAKMuLPGvaQO7H+mbCriYatpFNz1OFp5Yjy+cH/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwTIOq8aiuDKILxeFUQMPlKH/QBzGLDAqyXx4QrzTgxpIl250
	tkwQqCTI/QsqI7fG6945cH5xDr52GtZa3VvKf4hcT5XvV8mhcLw/qIF94q2Mj/iZwlaJpYUjeOX
	0CoJX9N0YbNiAcyq+9eAnPIAEOARrn8wiUu8msVV2RhDmH/GUuH7+X/WWF3UlJfz+BUo9
X-Gm-Gg: AeBDiev9aQ9n/BrpePvaNZS0C5OIG+0GZjatgA5ejq9OMsQkGTqRqMhmLNxEU3oyIFY
	4r5wcBNVlTSfUURol/SGPhHd1acV1rwcF17ktafiXsSw36DI2uIjoSMi8dQwEaWSk6Tn99PzPvm
	s2O7MOtHpPg1aFZrTCpeFozbvZ9X6QO/Ad4rYVPcWKgefjFlvJorEcBHyflmsgWUl4jJyeJNfNx
	XPibZ2+iCLqVCBfO4iJzQ836SaY02Z4TgaLsKWzzDOBKaAYl6yx0f9ll1PZR6Q6JuGedud/uX9Q
	PFi7Vq1cguMBbxTC5lwaS7+xnfGeMvXj1X0y82UFJJ/f2Hr9gIFFs7eaVQQVVSNyVFmey6FIfhk
	+zQDtSQOlUDwaMkgdp3oPYGXhOKyJ0T7Yer28zzoEFVhTkdh6V6K9iZAvEnScAwo557CVxAW4hu
	ecIEbRQ4uVE8Q=
X-Received: by 2002:a17:903:38d0:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b281833d73mr163088425ad.26.1775541554218;
        Mon, 06 Apr 2026 22:59:14 -0700 (PDT)
X-Received: by 2002:a17:903:38d0:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b281833d73mr163087785ad.26.1775541553346;
        Mon, 06 Apr 2026 22:59:13 -0700 (PDT)
Received: from [10.133.33.146] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478d329sm152349425ad.34.2026.04.06.22.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 22:59:12 -0700 (PDT)
Message-ID: <cf62d8db-8268-470f-871d-76fbe4d94b89@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:59:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
 <20260323-enable-byte-cntr-for-ctcu-v16-6-7a413d211b8d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-6-7a413d211b8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA1NCBTYWx0ZWRfX3AyjDzN+gphi
 FKeBk6UNGeWoUX7clCR1KNPWa/zsbkuRl6ONz/iriEsBs6ukvkgpBT1yWtzt+A4ycrniihSlRD/
 SivhsKSAWLkvG9m0AEnGXg8Mgwfp1gIo+FQQkQu71TJehJjJMGm6Wbu2SLqv2+mSA7KVTfEFESw
 0dwJFiv9rJMzOohdQAl+fI8mGITSnaMrv4wUWXoloEdXfwjNUj/h61iX4I7kd6HW4lehYm/qLkN
 TJrOHyWRNzK8fiKN0/MSX1FcFC8ozxUz3NJzL6JnU9JghsjXAfahZQWAwH6GOOO/vvkMIgt6EJd
 P4XcfIlbDXUN7S3LWmP1M+zmZ2kW48bYlN2u2YlcN/EX0sciARPo0OmYUPkjFx+YDREtWQa0gxg
 L44bY/QPZFNPCiXyjM1MWvY/683u30ICWfFznzKZQlRaZ+Orgu2Eco+VTurZUywcYM3DIn2rUUD
 1kVxCAlJm1OJFjLdEcQ==
X-Proofpoint-ORIG-GUID: X6uGFZWD0Hp7tAEhKS-m4AvW7LzjYBSq
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d49d33 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NmVXsfOrwXwJ6YnwkfAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: X6uGFZWD0Hp7tAEhKS-m4AvW7LzjYBSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102059-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 469EC3AA222
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 5:49 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is triggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the synced ETR buffer.
> 
> Switching the sysfs_buf when current buffer is full or the timeout is
> triggered and resets rrp and rwp registers after switched the buffer.
> The synced buffer will become available for reading after the switch.
> 
> Byte-cntr workflow:
> start -> ctcu_enable(ctcu_byte_cntr_start) -> tmc_enable_etr_sink ->
> tmc_read_prepare_etr(jump to tmc_read_prepare_byte_cntr) ->
> tmc_etr_get_sysfs_trace(jump to tmc_byte_cntr_get_data) ->
> tmc_disable_etr_sink -> ctcu_disable(ctcu_byte_cntr_stop) ->
> tmc_read_unprepare_etr(jump to tmc_read_unprepare_byte_cntr) -> finish
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 286 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 104 +++++++-
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   3 +-
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 104 +++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |   9 +
>   8 files changed, 571 insertions(+), 25 deletions(-)
> 

[...]

> +
> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	int ret = 0;
> +
> +	/* byte-cntr is operating with SYSFS mode being enabled only */
> +	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
> +		return -EINVAL;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
> +		return -EINVAL;
> +
> +	if (byte_cntr_data->reading)
> +		return -EBUSY;
> +

Found a potential race condition here.

I should set the byte_cntr_data->reading as earlier as possible, reset 
it if we suffered an issue for creating buffer list to prevent to create 
the etr_buf_list twice.

After the correction:

unsigned long flags;

raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
if (byte_cntr_data->reading)
	return -EBUSY;

byte_cntr_data->reading = true;
raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);

/* Setup an available etr_buf_list for byte-cntr */
ret = tmc_create_etr_buf_list(etr_drvdata, 2);
if (ret) {
	byte_cntr_data->reading = false;
	return ret;
}

guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
...


Thanks,
Jie

> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
> +	if (ret)
> +		return ret;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	atomic_set(&byte_cntr_data->irq_cnt, 0);
> +	/*
> +	 * Configure the byte-cntr register to enable IRQ. The configured
> +	 * size is 5% of the buffer_size.
> +	 */
> +	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
> +			       etr_drvdata->size / MAX_IRQ_CNT,
> +			       byte_cntr_data->irq_ctrl_offset);
> +	enable_irq_wake(byte_cntr_data->irq);
> +	byte_cntr_data->buf_node = NULL;
> +	byte_cntr_data->reading = true;
> +
> +	return 0;
> +}
> +
> +static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
> +{
> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
> +		return -EINVAL;
> +
> +	tmc_clean_etr_buf_list(etr_drvdata);
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	/* Configure the byte-cntr register to disable IRQ */
> +	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
> +			       byte_cntr_data->irq_ctrl_offset);
> +	disable_irq_wake(byte_cntr_data->irq);
> +	byte_cntr_data->buf_node = NULL;
> +	byte_cntr_data->reading = false;
> +
> +	return 0;
> +}
> +
> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
> +	.read_prepare	= tmc_read_prepare_byte_cntr,
> +	.read_unprepare	= tmc_read_unprepare_byte_cntr,
> +	.get_trace_data	= tmc_byte_cntr_get_data,
> +};
> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	/* Don't start byte-cntr function when irq_enabled is not set. */
> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->enable)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable = true;
> +}
> +
> +/* Stop the byte-cntr function when the path is disabled. */
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +
> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
> +		return;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
> +	if (!byte_cntr_data)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable = false;
> +}
> +
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct device_node *nd = dev->of_node;
> +	int irq_num, ret, i;
> +
> +	tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
> +	for (i = 0; i < etr_num; i++) {
> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
> +		irq_num = of_irq_get(nd, i);
> +		if (irq_num < 0) {
> +			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
> +			continue;
> +		}
> +
> +		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
> +				       IRQF_TRIGGER_RISING | IRQF_SHARED,
> +				       dev_name(dev), byte_cntr_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register IRQ for port%d\n", i);
> +			continue;
> +		}
> +
> +		byte_cntr_data->irq = irq_num;
> +		byte_cntr_data->ctcu_drvdata = drvdata;
> +		init_waitqueue_head(&byte_cntr_data->wq);
> +		raw_spin_lock_init(&byte_cntr_data->spin_lock);
> +	}
> +}
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index e8720026c9e3..56590f22ad79 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   
>   #include <linux/clk.h>
> @@ -18,6 +19,7 @@
>   
>   #include "coresight-ctcu.h"
>   #include "coresight-priv.h"
> +#include "coresight-tmc.h"
>   
>   #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
>   #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
> @@ -43,17 +45,21 @@
>   
>   #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
>   #define CTCU_ATID_REG_SIZE		0x10
> +#define CTCU_ETR0_IRQCTRL               0x6c
> +#define CTCU_ETR1_IRQCTRL               0x70
>   #define CTCU_ETR0_ATID0			0xf8
>   #define CTCU_ETR1_ATID0			0x108
>   
>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>   	{
> -		.atid_offset	= CTCU_ETR0_ATID0,
> -		.port_num	= 0,
> +		.atid_offset		= CTCU_ETR0_ATID0,
> +		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
> +		.port_num		= 0,
>   	},
>   	{
> -		.atid_offset	= CTCU_ETR1_ATID0,
> -		.port_num	= 1,
> +		.atid_offset		= CTCU_ETR1_ATID0,
> +		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
> +		.port_num		= 1,
>   	},
>   };
>   
> @@ -62,6 +68,85 @@ static const struct ctcu_config sa8775p_cfgs = {
>   	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
>   };
>   
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
> +{
> +	CS_UNLOCK(drvdata->base);
> +	ctcu_writel(drvdata, val, offset);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +static ssize_t irq_enabled_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +
> +	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		return -EINVAL;
> +
> +	return sysfs_emit(buf, "%u\n",
> +			(unsigned int)drvdata->byte_cntr_data[port].irq_enabled);
> +}
> +
> +static ssize_t irq_enabled_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf,
> +				 size_t size)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +	if (drvdata->byte_cntr_data[port].reading)
> +		return -EBUSY;
> +	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		drvdata->byte_cntr_data[port].irq_enabled = !!val;
> +
> +	return size;
> +}
> +
> +static umode_t irq_enabled_is_visible(struct kobject *kobj,
> +				      struct attribute *attr, int n)
> +{
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +
> +	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		return attr->mode;
> +
> +	return 0;
> +}
> +
> +static struct attribute *ctcu_attrs[] = {
> +	ctcu_byte_cntr_irq_rw(0),
> +	ctcu_byte_cntr_irq_rw(1),
> +	NULL,
> +};
> +
> +static struct attribute_group ctcu_attr_grp = {
> +	.attrs = ctcu_attrs,
> +	.is_visible = irq_enabled_is_visible,
> +};
> +
> +static const struct attribute_group *ctcu_attr_grps[] = {
> +	&ctcu_attr_grp,
> +	NULL,
> +};
> +
>   static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
>   				       u8 bit, bool enable)
>   {
> @@ -140,11 +225,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>   static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       struct coresight_path *path)
>   {
> +	ctcu_byte_cntr_start(csdev, path);
> +
>   	return ctcu_set_etr_traceid(csdev, path, true);
>   }
>   
>   static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
>   {
> +	ctcu_byte_cntr_stop(csdev, path);
> +
>   	return ctcu_set_etr_traceid(csdev, path, false);
>   }
>   
> @@ -195,7 +284,10 @@ static int ctcu_probe(struct platform_device *pdev)
>   			for (i = 0; i < cfgs->num_etr_config; i++) {
>   				etr_cfg = &cfgs->etr_cfgs[i];
>   				drvdata->atid_offset[i] = etr_cfg->atid_offset;
> +				drvdata->byte_cntr_data[i].irq_ctrl_offset =
> +					etr_cfg->irq_ctrl_offset;
>   			}
> +			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>   		}
>   	}
>   
> @@ -209,6 +301,7 @@ static int ctcu_probe(struct platform_device *pdev)
>   	desc.dev = dev;
>   	desc.ops = &ctcu_ops;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.groups = ctcu_attr_grps;
>   	raw_spin_lock_init(&drvdata->spin_lock);
>   
>   	drvdata->csdev = coresight_register(&desc);
> @@ -248,6 +341,7 @@ static void ctcu_platform_remove(struct platform_device *pdev)
>   	if (WARN_ON(!drvdata))
>   		return;
>   
> +	tmc_etr_reset_byte_cntr_sysfs_ops();
>   	ctcu_remove(pdev);
>   	pm_runtime_disable(&pdev->dev);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> index e9594c38dd91..a2ae0a0d91d0 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -1,23 +1,31 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   
>   #ifndef _CORESIGHT_CTCU_H
>   #define _CORESIGHT_CTCU_H
> +
> +#include <linux/time.h>
>   #include "coresight-trace-id.h"
>   
>   /* Maximum number of supported ETR devices for a single CTCU. */
>   #define ETR_MAX_NUM	2
>   
> +#define BYTE_CNTR_TIMEOUT	(3 * HZ)
> +#define MAX_IRQ_CNT		20
> +
>   /**
>    * struct ctcu_etr_config
>    * @atid_offset:	offset to the ATID0 Register.
> - * @port_num:		in-port number of CTCU device that connected to ETR.
> + * @port_num:		in-port number of the CTCU device that connected to ETR.
> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>    */
>   struct ctcu_etr_config {
>   	const u32 atid_offset;
>   	const u32 port_num;
> +	const u32 irq_ctrl_offset;
>   };
>   
>   struct ctcu_config {
> @@ -25,15 +33,68 @@ struct ctcu_config {
>   	int num_etr_config;
>   };
>   
> -struct ctcu_drvdata {
> -	void __iomem		*base;
> -	struct clk		*apb_clk;
> -	struct device		*dev;
> -	struct coresight_device	*csdev;
> +/**
> + * struct ctcu_byte_cntr
> + * @enable:		indicates that byte_cntr function is enabled or not.
> + * @irq_enabled:	indicates that the interruption is enabled.
> + * @reading:		indicates that byte_cntr is reading.
> + * @irq:		allocated number of the IRQ.
> + * @irq_cnt:		IRQ count number of the triggered interruptions.
> + * @wq:			waitqueue for reading data from ETR buffer.
> + * @spin_lock:		spinlock of the byte_cntr_data.
> + * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
> + * @ctcu_drvdata:	drvdata of the CTCU device.
> + * @buf_node:		etr_buf_node for reading.
> + */
> +struct ctcu_byte_cntr {
> +	bool			enable;
> +	bool			irq_enabled;
> +	bool			reading;
> +	int			irq;
> +	atomic_t		irq_cnt;
> +	wait_queue_head_t	wq;
>   	raw_spinlock_t		spin_lock;
> -	u32			atid_offset[ETR_MAX_NUM];
> +	u32			irq_ctrl_offset;
> +	struct ctcu_drvdata	*ctcu_drvdata;
> +	struct etr_buf_node	*buf_node;
> +};
> +
> +struct ctcu_drvdata {
> +	void __iomem			*base;
> +	struct clk			*apb_clk;
> +	struct device			*dev;
> +	struct coresight_device		*csdev;
> +	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
> +	raw_spinlock_t			spin_lock;
> +	u32				atid_offset[ETR_MAX_NUM];
>   	/* refcnt for each traceid of each sink */
> -	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
> +	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>   };
>   
> +/**
> + * struct ctcu_byte_cntr_irq_attribute
> + * @attr:	The device attribute.
> + * @port:	port number.
> + */
> +struct ctcu_byte_cntr_irq_attribute {
> +	struct device_attribute	attr;
> +	u8			port;
> +};
> +
> +#define ctcu_byte_cntr_irq_rw(port)					\
> +	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
> +	   {								\
> +		__ATTR(irq_enabled##port, 0644, irq_enabled_show,	\
> +		irq_enabled_store),					\
> +		port,							\
> +	   }								\
> +	})[0].attr.attr)
> +
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
> +
> +/* Byte-cntr functions */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
> +
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 110eedde077f..9f4fd86e8c32 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
>   		return -EFAULT;
>   	}
>   
> -	*ppos += actual;
> +	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
> +		*ppos += actual;
>   	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>   
>   	return actual;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index d4a99c77dd90..3253964d1ce7 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1168,6 +1168,8 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
>   	return rc;
>   }
>   
> +static const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
> +
>   /*
>    * Return the available trace data in the buffer (starts at etr_buf->offset,
>    * limited by etr_buf->len) from @pos, with a maximum limit of @len,
> @@ -1178,23 +1180,39 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
>    * We are protected here by drvdata->reading != 0, which ensures the
>    * sysfs_buf stays alive.
>    */
> -ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
> -				loff_t pos, size_t len, char **bufpp)
> +ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
> +			       size_t len, char **bufpp)
>   {
>   	s64 offset;
>   	ssize_t actual = len;
> -	struct etr_buf *etr_buf = drvdata->sysfs_buf;
>   
> -	if (pos + actual > etr_buf->len)
> -		actual = etr_buf->len - pos;
> +	if (pos + actual > sysfs_buf->len)
> +		actual = sysfs_buf->len - pos;
>   	if (actual <= 0)
>   		return actual;
>   
>   	/* Compute the offset from which we read the data */
> -	offset = etr_buf->offset + pos;
> -	if (offset >= etr_buf->size)
> -		offset -= etr_buf->size;
> -	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
> +	offset = sysfs_buf->offset + pos;
> +	if (offset >= sysfs_buf->size)
> +		offset -= sysfs_buf->size;
> +	return tmc_etr_buf_get_data(sysfs_buf, offset, actual, bufpp);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_read_sysfs_buf);
> +
> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
> +				loff_t pos, size_t len, char **bufpp)
> +{
> +	ssize_t ret;
> +
> +	if (byte_cntr_sysfs_ops) {
> +		ret = byte_cntr_sysfs_ops->get_trace_data(drvdata, pos,
> +							  len, bufpp);
> +		/* Return the filled buffer */
> +		if (ret > 0 || ret == -ENOMEM)
> +			return ret;
> +	}
> +
> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
>   }
>   
>   static struct etr_buf *
> @@ -1248,6 +1266,33 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   
>   }
>   
> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
> +{
> +	u32 sts;
> +
> +	CS_UNLOCK(drvdata->base);
> +	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
> +	writel_relaxed(sts, drvdata->base + TMC_STS);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +/**
> + * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
> + * @drvdata:	drvdata of the TMC device.
> + * @enable:	indicates enable/disable.
> + */
> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
> +{
> +	if (enable) {
> +		tmc_etr_reset_sysfs_buf(drvdata);
> +		__tmc_etr_enable_hw(drvdata);
> +	} else
> +		__tmc_etr_disable_hw(drvdata);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
> +
>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   {
>   	__tmc_etr_disable_hw(drvdata);
> @@ -2040,6 +2085,35 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
>   }
>   EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
>   
> +void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops)
> +{
> +	byte_cntr_sysfs_ops = sysfs_ops;
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_set_byte_cntr_sysfs_ops);
> +
> +void tmc_etr_reset_byte_cntr_sysfs_ops(void)
> +{
> +	byte_cntr_sysfs_ops = NULL;
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_reset_byte_cntr_sysfs_ops);
> +
> +bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size)
> +{
> +	struct etr_buf_node *nd, *next;
> +
> +	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
> +		return false;
> +
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
> +		if (nd && nd->reading) {
> +			nd->pos += size;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
> @@ -2049,6 +2123,14 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>   		return -EINVAL;
>   
> +	if (byte_cntr_sysfs_ops) {
> +		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
> +		if (!ret || ret == -EBUSY)
> +			return ret;
> +
> +		ret = 0;
> +	}
> +
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   	if (drvdata->reading) {
>   		ret = -EBUSY;
> @@ -2085,6 +2167,10 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
>   	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>   		return -EINVAL;
>   
> +	if (byte_cntr_sysfs_ops)
> +		if (!byte_cntr_sysfs_ops->read_unprepare(drvdata))
> +			return 0;
> +
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   
>   	/* RE-enable the TMC if need be */
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index fbb015079872..a15e2f93f16a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -211,12 +211,15 @@ struct tmc_resrv_buf {
>   /**
>    * @sysfs_buf:	Allocated sysfs_buf.
>    * @is_free:	Indicates whether the buffer is free to choose.
> + * @reading:	Indicates byte_cntr is reading the buffer attached to
> + *		the node.
>    * @pos:	Offset to the start of the buffer.
>    * @link:	list_head of the node.
>    */
>   struct etr_buf_node {
>   	struct etr_buf		*sysfs_buf;
>   	bool			is_free;
> +	bool			reading;
>   	loff_t			pos;
>   	struct list_head	link;
>   };
> @@ -480,5 +483,11 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   extern const struct attribute_group coresight_etr_group;
>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
> +void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops);
> +void tmc_etr_reset_byte_cntr_sysfs_ops(void);
> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
> +bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size);
> +ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
> +			       size_t len, char **bufpp);
>   
>   #endif
> 


