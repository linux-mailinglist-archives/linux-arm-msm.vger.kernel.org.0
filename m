Return-Path: <linux-arm-msm+bounces-94239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O/MNDwHoGl/fQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:41:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7F1A2B4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF38C301F49C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 08:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BBD392C2D;
	Thu, 26 Feb 2026 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dACNMrlA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+2p4ZF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED61393DE2
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095150; cv=none; b=jTQrDhubOZFaTPT5UjyWT7eTiZyIwhS6U2onRGwVhkstQee/Ht9PaWY8JP37ImxPYp43DjUGdlhCgAi/yuzmdxN9aDqd1DiEeM2orGAJ1WOi64s4OymSj45PVcMBhfsSJHhLDxJY7q+HMpkobKfClrYT5tdkKvU0qFhEeWUElgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095150; c=relaxed/simple;
	bh=R6K4l/PiiRgIwLZgEKR8QRcOzf93V5Fy49QdAdUFsVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ps+HjekASYcz4fxQsEPmm9bHypfSmK/6JSFaTMFWubcNA9Vc+sDuKQlXvVRJkdsvWIrJ/ifHiUlHu6jezXd/KuLh+0kb8200HC5vtohM5la/rKyXvGqbVqfQB19+44FB+npoYDJePZ5ssoaMjW7dpBxwlCaYNcBY26HeKZcnJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dACNMrlA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+2p4ZF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V6Jv2996661
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 08:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WAf2lFWJkeZZmog0R5l/0t54shFe/JIkci8HejhVV/E=; b=dACNMrlAA6SnWB49
	/U85VgY6dPieg8kAp+l733U2BOVsVLzC5aQrlIxGE8UEudM88OioPpNx5wrxMOP2
	7ZWCSxETgJVWKydVkTt7X5qrSbgCznrokCHzpN4OwFKYVoqyrVAq4oN5byRjPlAZ
	9TkpwWmw3Z+y21kCyimkHbaUTq9/LQGV/skbMtdBxzugPg5dWcuWwERGdOxXFdHQ
	O125QlavaJMxj8YN4EYRCoDakbDKrqY8P50e0Y4B+o1bxODioicj65zZWMUqqZ6I
	zbF6PUGBHDKi47dBsvIQ7BdocAzXHJYsPwg84Kfy1Q2P+WpXPUomxQuzioz5Etnh
	VSseuQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9khty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 08:39:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824a2df507eso2087957b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 00:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772095147; x=1772699947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WAf2lFWJkeZZmog0R5l/0t54shFe/JIkci8HejhVV/E=;
        b=f+2p4ZF0CGVLD0hsIvWHcK2PDK1/+1xeIqqT1ieF8XygyjP1yF/0ljaCBWOYA78EJB
         37f7bm07SYI5lr9JKTBcuRkyocXx5NWSpyn/wiIXxoVvR3MFFBHHTcwp/TrcL/pbOOZk
         ZXx/bj4FcgYwSbqS/wrtI+vLOCW+4HcEhzgqVz0Q5ZG7QSLSfs2MfYuaiarLs5unD4lc
         TErHpudz7cFaQ/L8mkvPMYSC6fmeaIldw6pMdusV1cb97GcQiEqfE2xQuwh+3eOe8g2Z
         NkQVBMq3TLLFDCX7eyzqXIHTnQEHBRo372jubwlp38FKBeUO4ov/+0mYXmEYxITfgGMb
         ubpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095147; x=1772699947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAf2lFWJkeZZmog0R5l/0t54shFe/JIkci8HejhVV/E=;
        b=bo7zH6ZWUC085oL3mSJn+1gLIMD7N2lj6PCX6U20Qoi83UOHhqZENeMOLPMa+QzVVq
         m4F5fqHJt1I7HnyjvLSLhUE1kSmd9pM4Kz3PtbXyajjeHv7w5+PKQDl1oqz1TKGa8Xsb
         PJ3KvGc328t3pbQVFh9bKgvW8CWJIX0IvkdjZuVfWO8PE9ZIybyCjOaNGelp0/1G34bi
         PwQB7ffMMObswZEN/TmqPsBFduNOsrQ4R5gXPJrrgvN3a7e6Xndam6npmUb1AEVK4RbD
         3MnHw5OW8qCAmLdy+Ng4IAgr1afzLYi6OaMSVM31AGdmGm9zfaLkf4F8v9NIVNPh+f9V
         DUVA==
X-Forwarded-Encrypted: i=1; AJvYcCVr2n25qAjea4m1ylJmJtC1n4ED8j2yUoWudwzPeLxLqnbAR7+g5Bx3UjDWOsHVJgt9IpPjUJgzj260znro@vger.kernel.org
X-Gm-Message-State: AOJu0YztcyXmRQY+0PLTkgOecipnV73/UmsLKzFMnDG+wjOSQUp7c8nN
	MxSYfc8+CP6c8Tm2cpj09qRVfvSEi0fHzCpZbZtUaAFHQXVa4Vh3BhCUNhuozSy2ZgyTEDWmh77
	yTo6rWY0I5EWafII8h+DpWG9NfKxX1VFgjkOALZOm/0Z3GlcZlDUsDk2uPLFcmSbEIHoq
X-Gm-Gg: ATEYQzx3Ck0xZ/xDX4oaq3Np8aDxtPUI/fcNig1l9neRDK4QKiQhXFZhp/O2REf9Xzm
	BCeMIcAxPvaYIgwMhqid4gIQSppFQnPBaG70KugnrMiedYcsBVaS+h68MtRb04p8nAe2mqqLy4R
	HkZ8bStfpveAYd9QeN3VerFgGLSOC9AdWe/la++XEc758ssAYqovO++t2A2kcjD+31bwOv4mrE2
	9BS71y8vnZJdgoQuTJRHMY4I3JhJ8bGH1lFHxlo60Dg1adKz/AjnNYgqwzlCIxBZUalQvRfqnlt
	r+6i5Ijp1Yr03S50B9YhVvdPb3Uteoqwyw+wisd3IFcN+Aagz0wURslcYzW31eu0B+9NqUpQiZV
	Otlr++CkVpqK2j0wCx4647TznfNc1s7/hNjc1UdJ7DF9SnSvm8A==
X-Received: by 2002:a05:6a00:3d48:b0:823:1cc6:d60a with SMTP id d2e1a72fcca58-82733672a72mr3351028b3a.2.1772095146918;
        Thu, 26 Feb 2026 00:39:06 -0800 (PST)
X-Received: by 2002:a05:6a00:3d48:b0:823:1cc6:d60a with SMTP id d2e1a72fcca58-82733672a72mr3350990b3a.2.1772095146324;
        Thu, 26 Feb 2026 00:39:06 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a088517sm1538103b3a.65.2026.02.26.00.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 00:39:05 -0800 (PST)
Message-ID: <57937a68-7f22-4ca1-8980-0be12cf06c66@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:08:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
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
 <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
 <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ocZh8kKUeHaOdykBuHNXi4kvOsnBcUkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA3NyBTYWx0ZWRfX95ZvxKwDRzbf
 R5sWpmnf0g0xaIqqTbkQaqXp+LtDe7L6EyjF6xqp/mZ1noMmbPVpotlUthHPzs+e8hvMfuWua1R
 jdRz7vqORLgFBWmiHuOfT/+DHnaFItEs0D1wE6XEMQ0wAemuKye8X1HS8uCbJlGhHvMm9tAs8Hm
 rXukeCwdvfMop4SxKXJ5gLtbvVMiPwODfLfs5IdGLGJUIwWsAVQeH5DBm8HVwX27LiWc3QD/Ro5
 kLQGu+zQpQ6FL/+jFoZHkf0JDtZ2KoMr24M49C7l2kmZ0RSsn1hieOYwVjXihfliYHqg0ysEtz0
 hx+afYzwksCjqRxGEWSAmw9E/PNaWZ/OC3USMSF+NAyuiqu20VgZi2+gJGjED4wAh4IcbxgBlyH
 7dakwWs9um0Su0lkQarJ5fTZzqPkP+CJosmvXe9tlyT0KxG3LDblQXxOuTJps7Rla2tVikOxrYz
 YK+i9rMysUIlLkXm30w==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=69a006ac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DUi5Cioa4Bt8-YlJvggA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ocZh8kKUeHaOdykBuHNXi4kvOsnBcUkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260077
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
	TAGGED_FROM(0.00)[bounces-94239-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57C7F1A2B4F
X-Rspamd-Action: no action



On 2/24/2026 4:19 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:59AM +0530, Ekansh Gupta wrote:
>> Add support for creating compute context-bank (CB) devices under
>> the QDA compute bus based on child nodes of the FastRPC RPMsg
>> device tree node. Each DT child with compatible
>> "qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
>> device on qda_cb_bus_type.
>>
>> A new qda_cb_dev structure and cb_devs list in qda_dev track these
>> CB devices. qda_populate_child_devices() walks the DT children
>> during QDA RPMsg probe, creates CB devices, configures their DMA
>> and IOMMU settings using of_dma_configure(), and associates a SID
>> from the "reg" property when present.
>>
>> On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
>> devices, removing them from their IOMMU groups if present and
>> unregistering the devices. This prepares the ground for using CB
>> devices as IOMMU endpoints for DSP compute workloads in later
>> patches.
> Are we loosing the nsessions support?
Yes, it's not part of this series. I'll try bringing that as well.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile    |   1 +
>>  drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_cb.h    |  26 ++++++++
>>  drivers/accel/qda/qda_drv.h   |   3 +
>>  drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
>>  5 files changed, 220 insertions(+)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 242684ef1af7..4aded20b6bc2 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_drv.o \
>>  	qda_rpmsg.o \
>> +	qda_cb.o \
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
>> new file mode 100644
>> index 000000000000..77a2d8cae076
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_cb.c
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/dma-mapping.h>
>> +#include <linux/device.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/iommu.h>
>> +#include <linux/slab.h>
>> +#include "qda_drv.h"
>> +#include "qda_cb.h"
>> +
>> +static void qda_cb_dev_release(struct device *dev)
>> +{
>> +	kfree(dev);
> Do you need to put the reference on the OF node?
Reference put is happening as part of qda_destroy_cb_device.
>
>> +}
>> +
>> +static int qda_configure_cb_iommu(struct device *cb_dev, struct device_node *cb_node)
>> +{
>> +	int ret;
>> +
>> +	qda_dbg(NULL, "Configuring DMA/IOMMU for CB device %s\n", dev_name(cb_dev));
>> +
>> +	/* Use of_dma_configure which handles both DMA and IOMMU configuration */
>> +	ret = of_dma_configure(cb_dev, cb_node, true);
>> +	if (ret) {
>> +		qda_err(NULL, "of_dma_configure failed for %s: %d\n", dev_name(cb_dev), ret);
>> +		return ret;
>> +	}
>> +
>> +	qda_dbg(NULL, "DMA/IOMMU configured successfully for CB device %s\n", dev_name(cb_dev));
>> +	return 0;
>> +}
>> +
>> +static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
>> +{
>> +	int rc;
>> +	u32 sid, pa_bits = 32;
>> +
>> +	qda_dbg(qdev, "Setting up CB device %s\n", dev_name(cb_dev));
>> +
>> +	if (of_property_read_u32(cb_dev->of_node, "reg", &sid)) {
>> +		qda_dbg(qdev, "No 'reg' property found, defaulting SID to 0\n");
>> +		sid = 0;
> Don't do the job of the schema validator. Are there nodes without reg?
> No.
Ack.
>
>> +	}
>> +
>> +	rc = dma_set_mask(cb_dev, DMA_BIT_MASK(pa_bits));
>> +	if (rc) {
>> +		qda_err(qdev, "%d bit DMA enable failed: %d\n", pa_bits, rc);
>> +		return rc;
>> +	}
>> +
>> +	qda_dbg(qdev, "CB device setup complete - SID: %u, PA bits: %u\n", sid, pa_bits);
>> +
>> +	return 0;
>> +}
>> +
>> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>> +{
>> +	struct device *cb_dev;
>> +	int ret;
>> +	u32 sid = 0;
>> +	struct qda_cb_dev *entry;
>> +
>> +	qda_dbg(qdev, "Creating CB device for node: %s\n", cb_node->name);
>> +
>> +	of_property_read_u32(cb_node, "reg", &sid);
>> +
>> +	cb_dev = kzalloc_obj(*cb_dev, GFP_KERNEL);
>> +	if (!cb_dev)
>> +		return -ENOMEM;
>> +
>> +	device_initialize(cb_dev);
>> +	cb_dev->parent = qdev->dev;
>> +	cb_dev->bus = &qda_cb_bus_type; /* Use our custom bus type for IOMMU handling */
>> +	cb_dev->release = qda_cb_dev_release;
>> +	dev_set_name(cb_dev, "qda-cb-%s-%u", qdev->dsp_name, sid);
>> +
>> +	qda_dbg(qdev, "Initialized CB device: %s\n", dev_name(cb_dev));
>> +
>> +	cb_dev->of_node = of_node_get(cb_node);
>> +
>> +	cb_dev->dma_mask = &cb_dev->coherent_dma_mask;
>> +	cb_dev->coherent_dma_mask = DMA_BIT_MASK(32);
>> +
>> +	dev_set_drvdata(cb_dev->parent, qdev);
>> +
>> +	ret = device_add(cb_dev);
>> +	if (ret) {
>> +		qda_err(qdev, "Failed to add CB device for SID %u: %d\n", sid, ret);
>> +		goto cleanup_device_init;
>> +	}
>> +
>> +	qda_dbg(qdev, "CB device added to system\n");
>> +
>> +	ret = qda_configure_cb_iommu(cb_dev, cb_node);
>> +	if (ret) {
>> +		qda_err(qdev, "IOMMU configuration failed: %d\n", ret);
>> +		goto cleanup_device_add;
>> +	}
>> +
>> +	ret = qda_cb_setup_device(qdev, cb_dev);
>> +	if (ret) {
>> +		qda_err(qdev, "CB device setup failed: %d\n", ret);
>> +		goto cleanup_device_add;
>> +	}
>> +
>> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +	if (!entry) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_device_add;
>> +	}
>> +
>> +	entry->dev = cb_dev;
>> +	list_add_tail(&entry->node, &qdev->cb_devs);
>> +
>> +	qda_dbg(qdev, "Successfully created CB device for SID %u\n", sid);
>> +	return 0;
>> +
>> +cleanup_device_add:
>> +	device_del(cb_dev);
>> +cleanup_device_init:
>> +	of_node_put(cb_dev->of_node);
>> +	put_device(cb_dev);
>> +	return ret;
>> +}
>> +
>> +void qda_destroy_cb_device(struct device *cb_dev)
>> +{
>> +	struct iommu_group *group;
>> +
>> +	if (!cb_dev) {
>> +		qda_dbg(NULL, "NULL CB device passed to destroy\n");
>> +		return;
>> +	}
>> +
>> +	qda_dbg(NULL, "Destroying CB device %s\n", dev_name(cb_dev));
>> +
>> +	group = iommu_group_get(cb_dev);
>> +	if (group) {
>> +		qda_dbg(NULL, "Removing %s from IOMMU group\n", dev_name(cb_dev));
>> +		iommu_group_remove_device(cb_dev);
>> +		iommu_group_put(group);
>> +	}
>> +
>> +	of_node_put(cb_dev->of_node);
>> +	cb_dev->of_node = NULL;
>> +	device_unregister(cb_dev);
>> +
>> +	qda_dbg(NULL, "CB device %s destroyed\n", dev_name(cb_dev));
>> +}
>> diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
>> new file mode 100644
>> index 000000000000..a4ae9fef142e
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_cb.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_CB_H__
>> +#define __QDA_CB_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/of.h>
>> +#include <linux/list.h>
>> +#include <linux/qda_compute_bus.h>
>> +#include "qda_drv.h"
>> +
>> +struct qda_cb_dev {
>> +	struct list_head node;
>> +	struct device *dev;
>> +};
>> +
>> +/*
>> + * Compute bus (CB) device management
>> + */
>> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node);
>> +void qda_destroy_cb_device(struct device *cb_dev);
>> +
>> +#endif /* __QDA_CB_H__ */
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index bec2d31ca1bb..eb732b7d8091 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -7,6 +7,7 @@
>>  #define __QDA_DRV_H__
>>  
>>  #include <linux/device.h>
>> +#include <linux/list.h>
>>  #include <linux/mutex.h>
>>  #include <linux/rpmsg.h>
>>  #include <linux/xarray.h>
>> @@ -26,6 +27,8 @@ struct qda_dev {
>>  	atomic_t removing;
>>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>>  	char dsp_name[16];
>> +	/* Compute context-bank (CB) child devices */
>> +	struct list_head cb_devs;
>>  };
>>  
>>  /**
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index a8b24a99ca13..5a57384de6a2 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -7,6 +7,7 @@
>>  #include <linux/of_device.h>
>>  #include "qda_drv.h"
>>  #include "qda_rpmsg.h"
>> +#include "qda_cb.h"
>>  
>>  static int qda_rpmsg_init(struct qda_dev *qdev)
>>  {
>> @@ -25,11 +26,42 @@ static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
>>  
>>  	qdev->dev = &rpdev->dev;
>>  	qdev->rpdev = rpdev;
>> +	INIT_LIST_HEAD(&qdev->cb_devs);
>>  
>>  	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
>>  	return qdev;
>>  }
>>  
>> +static void qda_unpopulate_child_devices(struct qda_dev *qdev)
>> +{
>> +	struct qda_cb_dev *entry, *tmp;
>> +
>> +	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
>> +		list_del(&entry->node);
>> +		qda_destroy_cb_device(entry->dev);
>> +		kfree(entry);
> Why can't you embed struct device into a structure together with the
> list_node (and possibly some other data?)?
I'll check this.
>
>> +	}
>> +}
>> +
>> +static int qda_populate_child_devices(struct qda_dev *qdev, struct device_node *parent_node)
>> +{
>> +	struct device_node *child;
>> +	int count = 0, success = 0;
>> +
>> +	for_each_child_of_node(parent_node, child) {
>> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
>> +			count++;
>> +			if (qda_create_cb_device(qdev, child) == 0) {
>> +				success++;
>> +				qda_dbg(qdev, "Created CB device for node: %s\n", child->name);
>> +			} else {
>> +				qda_err(qdev, "Failed to create CB device for: %s\n", child->name);
> Don't loose the error code. Instead please return it to the caller.
Ack.
>
>> +			}
>> +		}
>> +	}
>> +	return success > 0 ? 0 : (count > 0 ? -ENODEV : 0);
>> +}
>> +
>>  static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>>  {
>>  	/* Dummy function for rpmsg driver */
>> @@ -48,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	qdev->rpdev = NULL;
>>  	mutex_unlock(&qdev->lock);
>>  
>> +	qda_unpopulate_child_devices(qdev);
>>  	qda_deinit_device(qdev);
>>  
>>  	qda_info(qdev, "RPMsg device removed\n");
>> @@ -83,6 +116,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = qda_populate_child_devices(qdev, rpdev->dev.of_node);
>> +	if (ret) {
>> +		qda_err(qdev, "Failed to populate child devices: %d\n", ret);
>> +		qda_deinit_device(qdev);
>> +		return ret;
>> +	}
>> +
>>  	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>>  	return 0;
>>  }
>>
>> -- 
>> 2.34.1
>>


