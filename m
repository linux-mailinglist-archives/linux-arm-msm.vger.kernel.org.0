Return-Path: <linux-arm-msm+bounces-89038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8ED2058E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65349301099F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 16:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112183A4F29;
	Wed, 14 Jan 2026 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEc5NWqK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bI4a/+XZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46C2441A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409428; cv=none; b=aDIGlpuMO76yDo8vYWqkNXppTB/rGmO4eDU7G3cE9OjMoWNduKnMM1k7vlJ5OBKpODXf/nmjaGSkTggS/lkhiA9EXCJLZ7b66a3bvTPfH/VOvgN9vWieNTV9zgVvGZbQxigcWfa1P1evmcU9qy+REsMBnb4TA2j8z8tXs6GRzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409428; c=relaxed/simple;
	bh=iDvAt21gWqilp1udDntg8VUpylZoadwImQpiy4/D1y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0qL9BQjuXBPsyBbKrmFsZVMnvNMMR24JnBUdaq7xlxC/XT1A/tu/t/jdeDXrNH77XqmU8F1LsHZwFydHLuicx3jAcIvKFt+Eptgx0nbfUKvg74nnzFnrBQLAkxTrvfrOrZEBrVea5XwEupfPRjUf6zlZEghM4ZSb9N/215PbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEc5NWqK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bI4a/+XZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB2eGV3416551
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=; b=LEc5NWqKgA6LQFcK
	nhboESyQgehNu+GfDzMInXLysAMN9quFlJ9BBaX2B04Ww7phS5xpMlSITckMszs5
	uj3rZRBVfWIBTrvOA4c/3ZvMmS0fVZde2kqsgCx+9/hwRj5N4mrPPN87dWQJofyQ
	NRIia55IkBOYojqouMkwpEUSL9w4K0pxlzA8suY7HJXAPCSEyJa/HK7hTl0qFbOs
	mUiBHCZKiaTZfZ9hZB7TLHzA9U074n1Rx07EeYiBurjwXDd3C0d9yFW1uKBB/MAK
	wN/Dj6QVd+Noxev3yeyWYzLQHm/xBdE70aXH/rW2CxmKCIJwhuH9HUMQkuh/DLXd
	C4S5+A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x2h69g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:50:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12339e20a86so565969c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768409425; x=1769014225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=;
        b=bI4a/+XZASqiyz+P/aRPukJ/M1yPYToGOWVBYTfPZWSjk1ZhSXltSyuR5wVLSQiknN
         7juM5Y+r6qeFQS7Ge/UW3DjM3STUCD92ROMPChtCZQ1LlasVwod4RYlRnNtaDzU5GPOc
         v6kbuVNKK0sYdx70pz4PjbXbBiwMi/rRC6tD4EgRIMY+jadUKzWxdgkXPN+yMUKpcyxO
         fK9m7GFnjoWXjZBtcZeCzKUTCpZHYo5gU4vrbyWOFd7etBphqXxE1raWt1UD26xg4lpO
         9cAWo93oIGCNg1i6Phde5hzdhpwsm+URxZZJJq23b/fYDuV8O0NZ9f2ZwCd0omBY2TPC
         EVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409425; x=1769014225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRmdtQHok0d2jBmyTsl5idZlyVeo88nLijUkHb/8buo=;
        b=nh7fEAPMbTAFuEKpyGsoFUE3kxS9oa0KA8rq6rIxqur68f2wrXOlcb6lCx7CgvqHyC
         PWm3ORz6aPXSHIzY72NK2/LjqMh6/PJAkqcp8ZYTHyFFuRtYrm+Pl1NJ9J94ayCC45vl
         dfVjWpS+RpC++5DkFb35qzXmEL+GGTxE6BnJFZBeEQWtNe161c1v3QD6gLky51QQoLil
         Fhdg1Vixgdx090Lj1v3vhzi5gEFadEixGRgTofoDm9o48FXWmApsdhK+j1PdYMm57Lk8
         Onu6iYE+jwH7JAi0ILBHDUiJJaOFWpXF+STuIRoS9KS8/ZPlt6BrBdjBLpu6rf5dnzRg
         n33w==
X-Forwarded-Encrypted: i=1; AJvYcCXKT1uax2xrL3DR2vliGLSwFNjkXuYsenCy67HJZmZ0NbwjAySznsOdDCmMKmXksG92ahpJrJR1cyH5zJK/@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGivpTRuE9BTABG/fyIMIviAZYOADWLxKmErhUnjlt4TjPevN
	9YEA/vZiBLLf+Ep2tTJk47sSCf1f5VSFLkYT9qxrRVv+PzdUT+zLyg3NyVd0OQyvg0JoDux0c6Z
	MsqIQB7GlFWLkGZXTIx1Dg0S/yB5dK5B8em8M4bhqi3l3UEnL0vH7YAKgEzLdaZJF/w4u
X-Gm-Gg: AY/fxX5VbhgWE43uyE7rteTTfASJkt6TehsYxZzMWcrDOJv1NIJcEWObExB6+1NB4DK
	OLvCaHvnsx34LFnumLHzNauA2oUudqgHf94rLMXBJcq7gSmPVRUx0BnuFjlyckIaP97rgWYxnIh
	Q+Nkv6Um4Sty0EuyHmHr+BljlhrjuAt/hsCvQcjlvJoWClqjBVtmdV0WfT7qqb1E2ichvdtBW7V
	/LIzotvG7BVRI1IKRvtAMop+IUHnCfdaitQaoiZMH0iHSlBVM4mfNdKLlQBr29ilD5CVm3PQLjQ
	3yMvS7m8cHgvpYIjRYZ1wV146EzjCg4IJ5dRRD+UuwP6RjFWFVcPrHSSPGVNDmSsw+OpeLe+12z
	JSpEM3Z44mNCdg2GCZKKkEhATnzPREqLLOyzLTNJ0RA==
X-Received: by 2002:a05:7022:3f0b:b0:11b:9386:8272 with SMTP id a92af1059eb24-12336a8de37mr3291875c88.47.1768409425094;
        Wed, 14 Jan 2026 08:50:25 -0800 (PST)
X-Received: by 2002:a05:7022:3f0b:b0:11b:9386:8272 with SMTP id a92af1059eb24-12336a8de37mr3291833c88.47.1768409424542;
        Wed, 14 Jan 2026 08:50:24 -0800 (PST)
Received: from [192.168.68.59] ([76.93.176.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24346b5sm32458339c88.3.2026.01.14.08.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:50:24 -0800 (PST)
Message-ID: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 08:50:23 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWY6kx8Bwa_2azIl@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V7eRp-xHo5GYab1utS5ZgtXvA8UGzvMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0MSBTYWx0ZWRfXynP25yEbReVv
 h/1oqwiu5OxUKS1lmpWP3OhJMALVffOfRyyfF0pMjaq/DIsJc1SPHepEGclP1cPe7cE1iPYsoqc
 76zWCd6qCCwFr5Mz0PKkixk09nhduHSOerEz8B+wL44iE5fIfHP6+5DLgdMyUuOAL456AAYtwL7
 GPENJviEsKEIvcootHU2oNn0w/uVr2UFmlj5CcRBS5lAJ/JfUMviXvYFv0i7OzKY5vDWpnevTFz
 XilgIE4EdnJnkoR5uYjHZ+lCe91vG9kTd0o2oa80oXB93hwE4z4McJRHgQYepWy3jB7rKH6P07F
 B/ahGhXBZrt5b8dcHnqNmJjQImgmMSjB/6KVBR4QHFOpZIRfLEz7kIZhtnDDElRJVQDgxkKNc8z
 cMVieRQ8/WfdkrrpBmoI2LaDtZhd1vYUfI08OnemAwtYELQTOe+2zgmTZq/q095UEpZGIBNvL9N
 zSaP+h8e/05f0BhO2iA==
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=6967c951 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Q5rFrUx7DTp4enn/YD2GRQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=g4MP2Je7yr20VYQK4wsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: V7eRp-xHo5GYab1utS5ZgtXvA8UGzvMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140141

Hello Sudeep,

On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>
> Instead of relying on a vendor-specific SoC driver, we should consider
> disabling it and using the OS-agnostic SoC information interface provided by
> the firmware.
Would like to add some history here. Vendor interface existed [1] even 
before
SMCCC SMC ID was introduced [2]. And there are several user space 
entities which
uses the soc0 interface already.
> The presence of this interface strongly suggests that the
> firmware is designed to support multiple operating systems or software stacks
> that already depend on it.
That is correct. We started seeing the issue with user space when our 
firmware
started implementing support for SMCCC SOC ID recently for non-Linux 
based product.
As the firmware remain same across OSes, user space is broken on Linux.
> Aligning the Linux kernel with this
> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
> dependencies and improve portability. Any gaps can be addressed by enhancing
> userspace to correctly parse and consume this information.
Agree. Updating entire use space would need time and we are looking to see
if vendor specific interface can be given priority over the standard 
interface.
>   Given these
> advantages, why would this approach not be the better long-term solution?
As mentioned above, existing user space will be broken and fixing 
existing user
space is going to take time. As the feature itself is "optional" from SMCCC
specification, if we can't disable by default, we should at-least have a way
to disable the feature by other means.


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/qcom/socinfo.c?id=efb448d0a3fca01bb987dd70963da6185b81751e
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/firmware/smccc/soc_id.c?id=821b67fa46390baea0ac5139a60eaa48805261b2 


