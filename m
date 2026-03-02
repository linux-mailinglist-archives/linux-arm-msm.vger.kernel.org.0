Return-Path: <linux-arm-msm+bounces-94802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGIZFDZNpWmt8AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:41:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149A1D4BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F89F301FA99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D843876D6;
	Mon,  2 Mar 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTR2oiOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnES+EET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA132765E2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440883; cv=none; b=Q+qb1cCvSKyoqCxu+2n1B/QrsBgtBbsAPn47Qq/grR9NZpp48MeZnr8R3dOIRxoSiIRs670AGT+JREUgfPEYCq4W+wIfc8Ni9SQVyIQMEVeLAKWy+YNTUVZOP6zGLd59yPaGBEjCaxtwHTdlurrW5py3MD7fAeF5vPTI0d5Ozno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440883; c=relaxed/simple;
	bh=DO4Eko53iGFUeU2WNJrcWdblwLfOCg4cPWLdn8xQ5FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtoDkeU/MfdH9+AsrXd3PJqgHviKdfhPaSPqaFrLjtGA23RZNAGptB51ZyIiaw9dCJewA/HG1iJOXUzo9uUwIgnad8KEgyiKnkrmct89ZOXgk8tvst28mME08vZx1Xg5sg7hOzhqXrzLJGCNNLcoyat2iNVP5uAHYaPkX5q8vMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTR2oiOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnES+EET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226hCSK2504657
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55NbmTrZJm9GduVqLSm7GShHdDsJirCn7I8r3hx6xVE=; b=KTR2oiODl0BzJmrE
	+HW+KRxtragNLQmRekHxYME1ZvZ5nZEYoQT0Rq+E4gxFuR/ILrYBCZoNOLiq/IaM
	B1DrVXc6D1vSK5Ywr00lOTCS3YI3mNH5wiP3tdykBX60JAPnSFIEih3hLp1sceqj
	aYftlqOKLt0LbuSyok924lije0Y5MMBc6kDzdcFUDWC5RMjIOlJ7DeYuyE5UdDfW
	KFY8OGeohMyq48Gm89mIognkkAQCZ1++ffst50lqtOnB+agADx4poEvo6YN9llwS
	jU4142KSiKGCGw9QdVZ2gBz1LiIXCY7lMeeuGB6xs+1F6t7psR1HoId8CU0+9sSr
	vIbQXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hercuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:41:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82739e0f53fso15388738b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440879; x=1773045679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55NbmTrZJm9GduVqLSm7GShHdDsJirCn7I8r3hx6xVE=;
        b=NnES+EETWQzIjjtfBNEuFwE9oHTViXuEgkA/FO1q2hIhNEtPtavntyj0jDQNYiBQkE
         YaTtNVdgNA3ylktLdJcvnhK1WOcIkYIwIYosv0ks/2xSsN1d8AbutRw7oYQD6ujMooNI
         Xj+gcN0mgmd2yyXoGtoVP6oDi8/hkV1yEeIVxNR0jvR41UOmpILkI2tOT0/jiDfX6kEd
         TTcRFUw6OEM23tdVnS7W7fYRw1ewidmXm7wyZV0O5XaLyLpsCJNPHfiBB8kLxmSOjxeq
         IFQ70BDjQK8/Nnid+RBW2xgYxQfa+mEWlrXMIMffLiPdslx8BVfgtuTfHvnwIXfHAseP
         XzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440879; x=1773045679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55NbmTrZJm9GduVqLSm7GShHdDsJirCn7I8r3hx6xVE=;
        b=NBW2zbvvRSKw30LBYoiGOuiVRimo0mwVGxN8AZeyzZ4GKRxWNbktXqJ3MUxBWbazpO
         8FwIxpVvwlx2itXHISUA8/XHh14+pkn070Eb4gtU+C4bQwZxB/R/i+RHXjU0OVLmERd/
         p4PuqJDltPYqfYIUNz5SdUtQqE812Cg/4SyQ/VvN2Sawzj+eEOV8MIhE302bRIh424FF
         6TNm5JI7Qt6S3Oi9PzEpv/9o/it4AE3PovZZP8lAcb70YO0Er3DeU8M+Ky5LKeAqrh0Y
         FK7/Ax6Rh02Q401cx8/9Hyu4esHy4UNLs0lGD3di/bLgUWCxhT26o4hM+vbzwQkj+bUr
         nCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhbeESBzWdKO2RuJ96DUIlWb4Sp5wXgYLdR1VkVYxTtcg94IhuGAhx6KGvQ9CXxFQDNEdCYAtxUGrp1YGA@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbxUJgHiDJahpCVVyEokQFCNRA+pip3uRj8zdUC/e+jCZ8kOp
	szWTbethJ41OI7TBUsmVpjlAH90ZYFiAHDp+b1ndQFNkLQbCKAkI8C0PFWSbqqDPQAg0cSWOJIQ
	GC+f54UOVX2w8sfavmFb3TrAO046LpF3tIvMF8GJJCaraGLk9D6fD0vmfIoqzBIqfJL6s
X-Gm-Gg: ATEYQzwyaRmV/nm4Zrj/KpoIC2dPrlN8JlBzK6k0i8pfv54SAJmAe7fy15B0HVbrx3o
	4whyiDha7EjJ5myUg8rDhgRpe2RSALWwtRq1VGiclpn+wzW+ZmyknRJK2TfFiZ4P6OBcaBgeqR6
	NtCdbcsot2M/m4qlgULL2mhqkJiVdRRDL9EmAZVT77GE8fu7b9Vv9N9MILWm8r+Oq2KeT+DrGN6
	hYGzCDC6etbHq3q7J0MXBKvlnVfIfbHahC9pE/ClkkzTuJZO0TnuQK8CSxLAX3xglUOprnaKon9
	vb0SzModvToJThZxgwR4CiDLGKUcvAUe5rYlZ6zpKbkOdE5xgCsPoio8TKHel1jPYSOAb4ihI+v
	cPBJzuHrOM4Ce0NYxBGfcUjkiPjZ1SbAdIUdinL6GLhQbQU5A8A==
X-Received: by 2002:a05:6a00:290a:b0:824:d09b:9126 with SMTP id d2e1a72fcca58-8274d93b441mr10896085b3a.14.1772440879319;
        Mon, 02 Mar 2026 00:41:19 -0800 (PST)
X-Received: by 2002:a05:6a00:290a:b0:824:d09b:9126 with SMTP id d2e1a72fcca58-8274d93b441mr10896044b3a.14.1772440878784;
        Mon, 02 Mar 2026 00:41:18 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff3667sm11746360b3a.41.2026.03.02.00.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:41:17 -0800 (PST)
Message-ID: <8bf132e4-527f-4000-9c74-972361b6db6d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:11:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/18] accel/qda: Add QUERY IOCTL and basic QDA UAPI
 header
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
 <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
 <fzfuaeninr7lfbn74reoare7y2zoflddcvvnvyifnriw26swjc@igixj73zawrv>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fzfuaeninr7lfbn74reoare7y2zoflddcvvnvyifnriw26swjc@igixj73zawrv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a54d30 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SgWlgk4r4gR3U-ipCD8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qHbH7an9P0vx4e2Go0Dr53pojdHVlq76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfX8pSSBgPnjExB
 l8yQE+cCFGCZqgaEJhnEz9kWg6UIgJNqjhwiydgY8X40qZEdlJ43kS5qzl2C3LxB4gXb4SNMLJ1
 rnkuZHW1mkXEhXVk2LEuZ6GYn8oq+jVxczoTeDaeW5RiL4eq2lKYtjUAqU9nGAUFMlkcwHYQzPm
 qkModzBb0w2Uu6YXK/g+pT+A/RgddIdSZIjyYxq/uDzHO9+8TAalE3fwOLEF8d0ZSuOBdQ6e8d9
 FDfjjzA3FLYqQas4QjGbsxO+FHgBgdzllO1EtdmuLIEEQEYsf7G6Mydz1JMZ1/VsnE2lezpv7Wd
 FfwGyvNvmwQeb+0Iy6DpCL+FsIi57VBRH63EEY/C7uL5O16Gbbq6gHtJhd2V0+CzDquwet1PxhC
 o2T/WMrqI1Cz4esZ3yIdLUHR2o24G4FSxUYBhWNWz2BoIlTkN2bRqxnZwb5gPj/K8n8MYSMcO7D
 YqvBIcmqM9k2QIX64MA==
X-Proofpoint-ORIG-GUID: qHbH7an9P0vx4e2Go0Dr53pojdHVlq76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1149A1D4BE2
X-Rspamd-Action: no action



On 2/24/2026 3:54 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:03AM +0530, Ekansh Gupta wrote:
>> Introduce a basic UAPI for the QDA accelerator driver along with a
>> DRM IOCTL handler to query DSP device identity. A new UAPI header
>> include/uapi/drm/qda_accel.h defines DRM_QDA_QUERY, the corresponding
>> DRM_IOCTL_QDA_QUERY command, and struct drm_qda_query, which contains
>> a DSP name string.
>>
>> On the kernel side, qda_ioctl_query() validates the per-file context,
>> resolves the qda_dev instance from dev->dev_private, and copies the
>> DSP name from qdev->dsp_name into the query structure. The new
>> qda_ioctls[] table wires this IOCTL into the QDA DRM driver so
>> userspace can call it through the standard DRM command interface.
>>
>> This IOCTL provides a simple and stable way for userspace to discover
>> which DSP a given QDA device node represents and serves as the first
>> building block for a richer QDA UAPI in subsequent patches.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile    |  1 +
>>  drivers/accel/qda/qda_drv.c   |  9 +++++++++
>>  drivers/accel/qda/qda_ioctl.c | 45 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h | 26 ++++++++++++++++++++++++
>>  include/uapi/drm/qda_accel.h  | 47 +++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 128 insertions(+)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 7e96ddc40a24..f547398e1a72 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -10,5 +10,6 @@ qda-y := \
>>  	qda_rpmsg.o \
>>  	qda_cb.o \
>>  	qda_memory_manager.o \
>> +	qda_ioctl.o \
> Keep the list sorted, please.
ack
>
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index bf95fc782cf8..86758a9cd982 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -9,7 +9,10 @@
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_gem.h>
>>  #include <drm/drm_ioctl.h>
>> +#include <drm/qda_accel.h>
>> +
>>  #include "qda_drv.h"
>> +#include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>>  static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
>> @@ -128,11 +131,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>>  
>>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>> +static const struct drm_ioctl_desc qda_ioctls[] = {
>> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +};
>> +
>>  static struct drm_driver qda_drm_driver = {
>>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>>  	.open			= qda_open,
>>  	.postclose		= qda_postclose,
>> +	.ioctls = qda_ioctls,
> Please select one style. Either you indent all assignments or you don't.
ack
>
>> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>>  	.name = DRIVER_NAME,
>>  	.desc = "Qualcomm DSP Accelerator Driver",
>>  };
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> new file mode 100644
>> index 000000000000..9fa73ec2dfce
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -0,0 +1,45 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/qda_accel.h>
>> +#include "qda_drv.h"
>> +#include "qda_ioctl.h"
>> +
>> +static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
>> +					struct qda_dev **qdev, struct qda_user **qda_user)
>> +{
>> +	struct qda_drm_priv *drm_priv = dev->dev_private;
>> +	struct qda_file_priv *qda_file_priv;
>> +
>> +	if (!drm_priv)
>> +		return -EINVAL;
>> +
>> +	*qdev = drm_priv->qdev;
>> +	if (!*qdev)
>> +		return -EINVAL;
> Can this actually happen or is it (un)wishful thinking?
>
>> +
>> +	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
>> +	if (!qda_file_priv || !qda_file_priv->qda_user)
>> +		return -EINVAL;
> What are you protecting against?
The intention for all these checks are to ensure channel is properly initialized before any
request is queued for any specific channel, I'll update the checks based on the current
initialization ordering.
>
>> +
>> +	*qda_user = qda_file_priv->qda_user;
>> +
>> +	return 0;
>> +}
>> +
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct qda_dev *qdev;
>> +	struct qda_user *qda_user;
>> +	struct drm_qda_query *args = data;
>> +	int ret;
>> +
>> +	ret = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
>> +	if (ret)
>> +		return ret;
>> +
>> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> new file mode 100644
>> index 000000000000..6bf3bcd28c0e
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QDA_IOCTL_H
>> +#define _QDA_IOCTL_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/kernel.h>
>> +#include <drm/drm_ioctl.h>
>> +#include "qda_drv.h"
>> +
>> +/**
>> + * qda_ioctl_query - Query DSP device information and capabilities
>> + * @dev: DRM device structure
>> + * @data: User-space data containing query parameters and results
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler queries information about the DSP device.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +#endif /* _QDA_IOCTL_H */
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> new file mode 100644
>> index 000000000000..0aad791c4832
>> --- /dev/null
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -0,0 +1,47 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_ACCEL_H__
>> +#define __QDA_ACCEL_H__
>> +
>> +#include "drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +/*
>> + * QDA IOCTL command numbers
>> + *
>> + * These define the command numbers for QDA-specific IOCTLs.
>> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>> + */
>> +#define DRM_QDA_QUERY	0x00
>> +/*
>> + * QDA IOCTL definitions
>> + *
>> + * These macros define the actual IOCTL numbers used by userspace applications.
>> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
>> + * data structure and direction (read/write) for each IOCTL.
>> + */
>> +#define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
>> +
>> +/**
>> + * struct drm_qda_query - Device information query structure
>> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
>> + * allowing userspace to identify which DSP a device node represents. The
>> + * kernel provides the DSP name directly as a null-terminated string.
>> + */
>> +struct drm_qda_query {
>> +	__u8 dsp_name[16];
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_ACCEL_H__ */
>>
>> -- 
>> 2.34.1
>>


