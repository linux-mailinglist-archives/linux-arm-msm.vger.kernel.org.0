Return-Path: <linux-arm-msm+bounces-103308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I5tJU7M32lwZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 19:35:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AF406D42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 19:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13FDA3001CCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 17:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC83D6497;
	Wed, 15 Apr 2026 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIzZLNQr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJZ4Bkep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B4314B9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776274479; cv=none; b=A696jHir3VpopHc2beaW/lfhkUCYsIXWQB3NK3J7tHCt+ZM4Jrq6hC5NM2nNb34aW+C7+dsmgTlF75/eo6cw2Ra+0qYpjavbrIpIIqtRMvj07LKg53FKin5hio1kJ2xYyqGQTws60G//2OekM+fSJqfcpinLfM0h1Rxb+yMUu+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776274479; c=relaxed/simple;
	bh=PTd4B5uhCcPDIe5w9NIhHzaDs9hz6KZ6USjgaGgCaFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKzBC39v9nc8iosCqJ+AkpAeI23zFb0EU/xACGV39hpGJsKXvoGtYSmVhXY8f3Ysj90AeX0x9S2w4VGacoMBEAHKpP62c7SHmqvw7AJwbnMuOf75ofMOXjMcei6eSpTPTQMW75WBGho74A36VOhHPvDYJmJnS3nOl/DIqTqzB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIzZLNQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJZ4Bkep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FEl3Ub579874
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 17:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbR6uymC69o6Z8rsQWYUozstbIH9JlydsnIlYMif8rU=; b=gIzZLNQr3c5GZpCJ
	DAvLsiqk4yCnL+T32P+6t65uFnVeGd2BAl53FHVbbg2nXX57DxzV55EGKRtYNG69
	tUKwuIUPSddrCy95Aofs1v1BEhC+BJiX/rdMX06n+/4vv7GlsdJH2bQVycq62kKi
	0osILBVmxC4qNHfKWVjpniLeU+MiN18L25ako0u7QF+P0P9p16DBY0IJs8441zT9
	ADJ7dUgvDlK3Qh52UJGE3buGYoT9tMgzv/ugXRs4Tk5EJhrkXGfMXEEJVfMRojvZ
	2zezmIw0SvNZr69FLxes7jKlICbPW+dOc1xewDhjWlLgnjTJFMvMmuRnmjUqLb59
	K42vQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcr8rkyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 17:34:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so139979105ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776274476; x=1776879276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbR6uymC69o6Z8rsQWYUozstbIH9JlydsnIlYMif8rU=;
        b=gJZ4BkepBM9+RmfE+zrOBT+xEZ3akPjpEkxLq+HGDoR0J+6kzUerJxPx+HUonn59Dn
         wH32HfI8wROIiDfPKbUejy9Vbdako5sVwAeJxuQNowZFF4URitcR1a01Ura5/E+CCXgM
         Ig09Avfw7eGYel5Ts+WDji2NzMaCc0OLbXc6dRPxk86owJuiClYDBLuARizWFQjjpwHb
         TAQExnh3RZEA+rA/lNLnPS1LQ+LbM19Pf5N7QlFpC7MWXCBxp1+usuNS+E+lVLRsAj7V
         71kL+XRsLKbLfb5KFdGSv79yUrjgO2DCjq3+QfpgDTHmGuULuqq67rNQq+CBO1l5wlQ+
         7U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776274476; x=1776879276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbR6uymC69o6Z8rsQWYUozstbIH9JlydsnIlYMif8rU=;
        b=P7UDb98KIqvv7gvC1BdoWPhKdlOJh+w8y+OndgPESi9YVlvTSUuU+q3cFmGni+mt7P
         +0BVc+Xjrb9mUccmIECCtbHL76E26PggftRBBlVu68kEUJRuhJfgXWbTKd2fDaMHay0E
         xtDSQN0Y6ex0rA/0fe05BuJUb+Gg0Lr9A8AnS+vYJI1/qdefpoRKB9zjELGKv6jUAWFW
         c5Q0QA8DqOjXfazuma50qtBDkMT8JAD5SGNUX8QM/p2NFtVOwmPcUEsfFt0Lopuyc4Zr
         kZmxXcsQlWFUzNRymLHLIy+hdeUPierNkoO8YdRNa+5tHWDAJyMECnoA3c6gzUs0q64x
         dw6g==
X-Forwarded-Encrypted: i=1; AFNElJ+80G6MpAlKlxIJMCs20sUHKZkW60tQ2gwmejn3PKRQgml/buuV2Cj3+nRR/PRUtexFGlYIKv5NBFwpRWSP@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZMgo+q/4WTedwZdZsAyG0/ikF1qBWAhD96gEY2f4TuqJ9S97
	2yj3erEUmySjf6hZRUsSYH8d1m12aY2csosxX9vFpouFF2g+WEcNhBA3/9XLm5nfHrWbf8QmBql
	svE/BuvzbTqWFUlwvbSgeXOjJ0e0GD9J2+LSKRS/G0UygFh6i5+YkeBaSw6JUkVN9LJpS
X-Gm-Gg: AeBDieuQFXHMCJAa8UECmgSwgE5BGPA+vnRi+zp5UDLGyqHU4QTEvk7k/xC4FCzt2tE
	QeT4UZpN0aBn9ranFB69L2NaDzkVCYGdET2U1haS0dVJevn15WMb6ZSXDGVWB5NfwlxLqjI5hvB
	Qyw0aGpK/L5I8+AF792/cD1lrumhD1g60FiuLnI+hELjHHn5VKSb7MtPbluq+7SnJX9W/zYmuaa
	UMn++r+K0vLMsld5wpZJlWgypyn5ewGynpDInvZnJ5Pk5l7H00vH6v4k4h8n81iK8O/tsWIIA1b
	huaMF/q27pbIsso75EUklqilr0SRb0I+Y6OIZBpO+h/QunMeX6MCCs5f6wGYgijrUNlBWCl/MDs
	V+2/tyhP07sfPLXsLI8IcQEAb/TDT+RZfv0dKBmlGM7bZJc4+TznFdA==
X-Received: by 2002:a17:902:6949:b0:2b2:b117:1e16 with SMTP id d9443c01a7336-2b2d5a459ffmr160044655ad.20.1776274475846;
        Wed, 15 Apr 2026 10:34:35 -0700 (PDT)
X-Received: by 2002:a17:902:6949:b0:2b2:b117:1e16 with SMTP id d9443c01a7336-2b2d5a459ffmr160044375ad.20.1776274475300;
        Wed, 15 Apr 2026 10:34:35 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47810b70csm25397215ad.23.2026.04.15.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 10:34:34 -0700 (PDT)
Message-ID: <c4f21420-c299-f161-2bf7-c9b79ca15037@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 23:04:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ekansh.gupta@oss.qualcomm.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
 <2026041418-volley-composer-6363@gregkh>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2026041418-volley-composer-6363@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gc8nWwXL c=1 sm=1 tr=0 ts=69dfcc2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xRG3GzwA0ZaNjhFdG0MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7qrhLatqY7KVMPCHMcus-WTi_eUTlC23
X-Proofpoint-ORIG-GUID: 7qrhLatqY7KVMPCHMcus-WTi_eUTlC23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE2MyBTYWx0ZWRfX8ouaeLnOqIta
 o2Fz7MSAU+8GawFiVr0sHRtSvKpajvDlCMabviAHLjqL/48iAB0ac41u9R2CsknU0ZXZTyc7wFu
 2r6CuXJG5xycXMFYPamLUwOwY+Md3U2aENNBasn25bt9Xa3qlcHgOtBHQVfRttdKXO+H2Kprob4
 7UeSkkJCPuVK0OWi65Go4YdA+gVsY3ejsRwBYJ4M04Wpe7RnZUiKXpomgS/lAPv3LvxezC6rtVM
 cfLdo3gVqhpEDWkrA2YXVbfMXJ/K1ZYK+6l84V9UShv9q7ubv1jC3TGaLqwW/hKNNT5ogvuMxUr
 jt4UVHdbHs9hm0MmgGDlDexrkTz1TwR8vJSN6zsRdwIhT9WakKtZsXxLegydMUp5OBnowPtEgYb
 nSP4b8BkMZJiOYuHodasacWkyI2tpsao163amQ7gUVlqVSOumsA3243qPGK/l1LH8GTbntOO7/8
 pkkxkADC7EiMJrdv15w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150163
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,oss.qualcomm.com,quicinc.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103308-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F4AF406D42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 10:19 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2026 at 10:01:15PM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce a new generic bus type for synthetic context bank devices
>> that require IOMMU context isolation. This bus provides a shared
>> infrastructure for accelerator and GPU drivers that create virtual
>> devices representing IOMMU context banks.
>>
>> Currently, drivers like host1x implement their own bus types for
>> context devices. This generic implementation allows multiple drivers
>> to share the same bus infrastructure, simplifying the IOMMU subsystem
>> integration and reducing code duplication.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>   drivers/base/Kconfig        |  3 +++
>>   drivers/base/Makefile       |  1 +
>>   drivers/base/context_bus.c  | 24 ++++++++++++++++++++++++
>>   include/linux/context_bus.h | 15 +++++++++++++++
>>   4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
>> index f7d385cbd3ba..479bc4bb442b 100644
>> --- a/drivers/base/Kconfig
>> +++ b/drivers/base/Kconfig
>> @@ -4,6 +4,9 @@ menu "Generic Driver Options"
>>   config AUXILIARY_BUS
>>   	bool
>>   
>> +config CONTEXT_DEVICE_BUS
>> +	bool
> 
> So this is a context-free bus?  I.e. no documentation?
> 
> :)
> 
> This feels really odd, this "bus" isn't doing anything at all.  So why
> do you need it and can't use auxbus or faux?

Looks like the device have specific iommu configuration (via 
of_dma_configure()), then using the auxbus or faux bus types does not 
have the bus notifier calls to iommu_release_device(). Please correct me 
if I misunderstood?

> 
> You say something about an iommu, but yet this has no information about
> an iommu at all, so why are they somehow special?
> 
> You need to provide a lot more information here, sorry.
> 
> greg k-h
> 
> 

