Return-Path: <linux-arm-msm+bounces-109662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGmrECpMFGpeMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:18:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E25CB000
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0529C302812A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF5E384CC8;
	Mon, 25 May 2026 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAXMu66O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRJrJjpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD3384CE2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715064; cv=none; b=vGr0+wmkJlNvEZxUiPI/0+k4xIBk4nDvfIiX0t44onjkMHGvw2L8/9S30GfTwweVCcib8k3yC8GqPQhJE4ksuyujQwwt1X/S0p/LmWMQxAhQ1DG2fXVehm2O5PnQKt38VymhkMVznspFby/P3602bfvOD2/lDYHurLFhXtQvn9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715064; c=relaxed/simple;
	bh=gXYX0AcMTJkrn1T9qWtu7vPdQYjZj10mW738SXDvMzs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z3o5zZ8kM1FTc3/zsjhTdANMil0nNm2jtAmY6fZopV4r4+XANXAQ4TKVAeLclVvzZs2ypq+fzydxKPuu+hFwIVoLAs763ZD8LDOnG5Khin9YXGzlDaPAUytrVGtrDzIy5K4rISR8e6NjOH8Mn3HgOmX6mhoYy6T1KeuE4wds4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAXMu66O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRJrJjpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPWQL3263573
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=; b=CAXMu66OZf071LgC
	mAj0pN7deuiUnEEYCgHFnnxGA6imAymF8QrdphCf7JTNmT8mZXgSX81kKEIRlyIm
	obDMJcuMfrbW6vwNBKRiPeYiemosKgY7QHRMJCKAiSY8/BTjxEaNAXqwzzFzxb55
	w6nYOtst2TwFFxcUNCSoELFXAnub+6CVdj+VEvdP1gfI33ol0Kn11rBP6TXTw6Uy
	6dIgB0TGjsr8dR/oFpg8T/YZXL9kjcVnALaqsmcW0YHXiAymULQkKRWC0EpIk5sc
	yPLE3/ONYgBFGkFBFUmen3o3HxF2zxBkT4cA66PhDS0DkawlX9bD6Q7RVc4xk+g0
	Z+yuAw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs0bf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:17:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b01f8adeso12470566a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715056; x=1780319856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=;
        b=VRJrJjpaDIDDoaIlbuXUk+AQtpA6GoGRjyqkNFei6vGw/XQpTiAiWJzx+g0KNWYS9P
         mCHaFV2vjE0ulHr30ILuoB5U1mzcP5l1AWTJub7mfRTLnCWGD8uUBbZ+ThWxBFIsjmbL
         Hzco/YnY+vrBNbNXpeu4brauc/LowjsAyl26icfaNX/3dx8uUq+TmDksOUNsFgZlOWsq
         smXIzyOpcwIx6IoaHSrsvbuMqod53JIcIWfE27UrnDEIuQJhwQ13q/5QjYWtRbdqqc0j
         4yLO/WHNifcuRRl4bOJoxLr7m9mw0uKDsB9O+N0DI2dIDHrINMhknijlpVfKpyoJldcq
         XE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715056; x=1780319856;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=;
        b=T268xErDVqkKZ/KED9Bw/AFYSrL8kiD/1c4egItypziIoAznkNG33XIkNGFzJME33o
         WjxRWCaBF20AdeBB0LsEAJye6UBwyrE27HrK5quuAz2NjzfC5fCdoYTLq0qUVxwnlyRO
         +Iy/XDBts4Kd9hwyt6A1g22k6vxast7bP79hGF+zdwCze4SWykImivjkIDC+tpK5lRNq
         C9PYPOFfWvdQckFm5nOZot7CSHBNUi8gRVIIPmRmbBcNajU86usEFO1D1ZuUIPhv4J+E
         t5c6lZRFYOdd23r9S3tbCgCblxRaHKuL7MgMlrgyK92yjWj4vOaM3SbCqK1vmVohCbEK
         4zLg==
X-Forwarded-Encrypted: i=1; AFNElJ+gpL1XIbpw5GtIyr0+e8DetTNH8xM336HdityPLQQSD3z2G7y6RD9S9LqSS8o0tpsgz4/TsgI7N6ugXEMc@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ30cO3SV7ENpUuR6ikP/MLFVPczAusVcq6B/QB186wT20XiMM
	HRdDHI9dXRw1A0NFkg8dm3qFspDTH4yFR2JJbMxVLwFfF31vG4fQ8sqyg4rZ+C12HfwXbaDfPsM
	XDI+BccTumib4YzWytk0G5g8YjaOVMV5ca4laWyWNV1DtrppLjWYEHzfeufmwiaxzwkKA
X-Gm-Gg: Acq92OHNZXG+ptZrltXcz6bObHI7VZFz85i/1Y5Jy3nZRJAS/H3xFurznbOrC7eHSCs
	DIOSzMp5uBgZe3QFHWlSeH77H3ItXJ/e+MnPLJrgHCiVIGQaqusHvqCpeIgCxTdlKb2sy6nD/XA
	IgdvbAuVdqHtIsTbfNisvDb9DKfFZiWYg9yfD60dW4UOhAHCd6I92+MGT23H2lbBOJ5wEkljasn
	sBQ98D8RXXN9Q6fkULzOnxgFlCb+3z9yY/df9IBJ3EzgIiM7NNypzg0cTavxfWEWPeNtsmX0KTU
	7uosSDMjIcR7gnAEYyz1lktGvT+cQdD90LlL86hcssuqLorfcbGJv4KwFL0HwleG/5KfdxEMhBV
	awXQLjzw6rAr3rdtpb2MZoTOdJc1BK5Lq8HFuzQls8W/68ZIhdJE=
X-Received: by 2002:a17:90b:4ac4:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-36a67403d54mr12966361a91.4.1779715055957;
        Mon, 25 May 2026 06:17:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac4:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-36a67403d54mr12966301a91.4.1779715055267;
        Mon, 25 May 2026 06:17:35 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72674492sm9226806a91.8.2026.05.25.06.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:17:34 -0700 (PDT)
Message-ID: <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
Date: Mon, 25 May 2026 18:47:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Sudeep Holla <sudeep.holla@arm.com>,
        yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>, ulfh@kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Language: en-US
In-Reply-To: <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a144bf1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=lBx55hxn-Rfz2RAIWSEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: KB84sHwH2Q-yDPzDol-aOfMJUxVxNVTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfX9bDFDony5V47
 bH9UHxoI265qrIGeI5Eb3KhqCiVkcRLyB5PUQVFSPjqOJ7JUwMC2DYd+0C9nT9y1G9C+kLVEwtG
 l7WU30txSQ/4tKKNqhMlNa4u7oBsKlFw+W8nvbYXWpw42ruYOOZkHK9Q4ZVy9Fks5R2Sauhg80G
 dujQZ0Be+OfOafM/VaH5a5CrKL22exT4NU5ujLch/FQd72g4V8unl+ap0TNFMa8CM+sKQOXwnd6
 O+Iz61TXZE6k7adBwAQNFnLqwgbRISrQTpbg0Xm6oeFgt3VPAblGkwjj0Am7tn6BuYv0rQnAam2
 cGA3+lWIwKbehVNCDoML9uBCK09aDBlx+RA1qFB5J7KrWfSNz8H5NrtlwZeaT38/63bnsy8DVky
 SHeXk4y3+Y4jG4+6F0lyTKgViqFbcJg8rQ7lneg46cJm73k6W18t0l/3hUlYaw3fBG8p3MHr6NY
 CxATFxAOGoeMD4HJX6A==
X-Proofpoint-ORIG-GUID: KB84sHwH2Q-yDPzDol-aOfMJUxVxNVTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109662-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arm.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C52E25CB000
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 12/19/2025 3:51 PM, Sudeep Holla wrote:
> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>
>>
>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>> domains. These components require special handling due to power domain
>>>> constraints.
>>>>
>>>
>>> Could you clarify why PSCI-based power domains associated with clusters in
>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>> OSI mode was originally intended to support them? My understanding of this
>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>> to be a flaw that should be corrected.
>>
>> It is due to the particular characteristics of the CPU cluster power
>> domain.Runtime PM for CPU devices works little different, it is mostly used
>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>> framework to manage the last CPU handling in cluster.
> 
> That is indeed the intended design. Could you clarify which specific
> characteristics differentiate it here?

Sorry for coming very late on this.

This series is intended to handle coresight components which resides within CPU cluster.
For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
are hotplugged off, access to coresight components can not be done.

The implementation tried to address in two parts,
1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs
2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
ON while coresight component of the cluster is being accessed (using smp_call_function_single()).

The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,
to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
cpu-maps (which also defines the clusters) from device tree is a better choice which will give
the information on which CPU belongs to which cluster.

(2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
cluster) will not enter power down in between.

> 
>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>> .power_on/.power_off) callback implemented which gets invoked from
>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>
> 
> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
> correctly, all of this complexity is meant to ensure that the cluster power
> domain is enabled before any of the funnel registers are accessed. Is that
> correct?

Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
for same cluster are being accessed.

> 
> If so, and if the cluster domains are already defined as the power domains for
> these funnel devices, then they should be requested to power on automatically
> before any register access occurs. Is that not the case?

Cluster power-domains will be only available for PSCI OS-initiated mode but also
will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
platform coordinated.

After discussion with our HW team to automatically request power on for coresight
component GPR [1] can be used but they seems not working as intended on the existing
SoCs and will be available on next generation SoC.

[1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor

> 
> What am I missing in this reasoning?
> 
> The only explanation I can see is that the firmware does not properly honor
> power-domain requests coming directly from the OS. I believe that may be the
> case, but I would be glad to be proven wrong.
> 

please see below comment for more details, This seems not a firmware issue.

>>>
>>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>>> out of LPM, making standard register access unreliable.
>>>>
>>>
>>> Are these devices the only ones on the system that are uniquely bound to
>>> cluster-level power domains? If not, what additional devices share this
>>> dependency so that we can understand how they are managed in comparison?
>>>
>>
>> Yes, devices like ETM and TRBE also share this power domain and access constraint.
>> Their drivers naturally handle enablement/disablement on the specific CPU they
>> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
> 
> I understand many things are possible to implement, but the key question
> remains: why doesn’t the existing OSI mechanism - added specifically to cover
> cases like this solve the problem today?
> 
> Especially on platforms with OSI enabled, what concrete limitation forces us
> into this additional “wake-up” path instead of relying on OSI to manage the
> dependency/power sequencing?

+ Ulf in loop.

Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
requests, as far as i know, runtime PM was never meant to implement this part and
pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
to cluster power domains about a child CPU/ sub domain being on after it has already
been landed in Linux.

The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
low power mode.

To put it other way,
For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
its cluster power domain) ON. In order to turn on the CPU, one has to still request
the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().

I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.

> 
>>>> To address this, the series introduces:
>>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>>   device tree property.
>>>
>>> Really, no please.
>>>
>>
>> Our objective is to determine which CoreSight components are physically locate
>> within the CPU cluster power domain.
>>
>> Would it be acceptable to derive this relationship from the existing
>> power-domains binding?
> 
> In my opinion, this is not merely a possibility but an explicit expectation.
> 
>> For example, if a Funnel or Replicator node is linked to a power-domains
>> entry that specifies a cpumask, the driver could recognize this shared
>> dependency and automatically apply the appropriate cluster-aware behavior.
>>
> 
> Sure, but for the driver to use that information, we need clear explanation
> for all the questions above. In short, why it is not working with the existing
> PSCI domain idle support.
> 

Explained above.

Thanks,
Maulik

