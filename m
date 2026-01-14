Return-Path: <linux-arm-msm+bounces-88922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70413D1CF1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 309303038990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157BF37B41C;
	Wed, 14 Jan 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzvE+lwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRdtblHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF02B37B3E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376902; cv=none; b=PgbwZ4VBjf/D1pqc1/Mf1+18AA/OrOMzEy+9l5Wv/o7V0XOVMN/caAzDI/fXM+VC6VXHSPCawlm+12D0lHrTedMR2BBBTbpcFlUSvu9ezwowqM1Q77LLJNkW9Um05z+mwKhvoaRNqK+T1RDCCn0ekoegjncLjLwTYeczHmO5mPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376902; c=relaxed/simple;
	bh=xBE7iLt/pbkNzeyLsOV/cFKCYy6Tq/Mgamea0ST/f+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eENLSv5JLYwmTIlj4AptKvlR38hISE4jFPOnMsSgGZ7MEoA3d3A8wbLsdcbUGmW+/moCkMlpfCv3H0QTFxabRDWVqRgxZJFQs86EsV5BKXjFT7Sl8v9ueW4QA9n9SoRLCD3fdrPrb7qB2Kb/fXnbZFKsceJuONY/keRjOCxIiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzvE+lwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRdtblHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jEwX2497637
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=; b=EzvE+lwH2jTHb9+J
	LBrBMbIN7Lgb2VU69/w/hcUgnm1/+cP3W5Rq4/2aBg8pvTbDeAalhCnWkxc3TuvH
	+gfscO5zGTiQU/TLeTcvxxsn3wuLSnWkxpCwyUvXorwyl2QP5E2p0QnX0hqrNb9X
	l7wyKizsLoqYhsN8hdqxM4KYNXKZlfVKjx00WRV7udRyVW4ZagI40vGNWu3w5Sov
	fh+j6j/hNIHrPud16Dyrsdn+qC/t7MDcPBiMOqif8Qo7THmCKvZzRpIMfd/C6vZT
	d/cf8AdFdzLt934u6vNjE5DZgqbT12dKHmoemrujOQ6b2wZrM8EWOvWke52cepCQ
	KcJItA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x18yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:48:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a4b748a0so59290795ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768376893; x=1768981693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=;
        b=GRdtblHWlFOFQZvZ6k+19wWQ+S4V+ZyV7Pe7l01mfKMHkbec73pzBHUch+KXb1wVDg
         Pxj03OwB6xJn/6y5DPajunD2VjovCtOujY92I66q9RUsa7RwodVtzav5ZR52dM+MVJLV
         B8o1NMYvfDljQx2L3IjMm9J9wlwYLgGWJVMik/x7LoAtYpanRPPCqv9kHGULzYV7TzYE
         BFkw1qcLbizimtgo0ppCKzDDsGqiyUdnzFOvs7o/Mtll4C4G12KI5fEJREbCsWIc/eH1
         ygWy0P3SpF6NCTMQFOrMLUZ/bfsrUF3M8K2M8ZomAhRVDdLYC5fCF//gwqgIIQD65E4P
         4czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376893; x=1768981693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=;
        b=QfqWh1/wPneGCTiDW6BvKUA6s94ZvA9sKkK9wPuwB4SBRmVzzJd4mK9pBeXBU9RtGi
         t0++3jEsZDrmJhJm7IvmfZfH9lj1NEQkmB/e4GBbLAuZw+2DAG52PeqzHJ6Hc/V1OfFP
         kr/pXLZuebad/LdwLgkaClSTj+syqvQsaCp8eQriM0/15cPwHr4Si7Bp7zf37PEOG+cj
         pFcyvugT1GnsoGa0Zu+iRFxQZMtYmi8F2in9TZDaO3whTynh+P+nm+m3LlnURKLyPTiJ
         Vc/slsdIFwEQ+k5l3KCKAC9WVfzTd5vCA9w2DA7zon5uNIAvV7RHnWagtygY00sy4dVA
         r0cA==
X-Forwarded-Encrypted: i=1; AJvYcCVJxgSUjibcqXgIfvNSVDCN2/MjaeLdSz/HMR0VdLdPYTb0BD3IuZeUKeyg1Rdl57Bvm9pYnyJwJ7tBZGR4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbDPI7/XCvc8RewheppFBDYXJbrSCz3APQu/kDcfqgi1gjdqr
	WYx4IP/94WXDbwpPZOvWE5fqyVJ7zTqh4b51obIUXBOzLnWnGIDox18QjA6Q6JKRIWN2Ipc8mXW
	mktoEGylfTh+TH995Cc4pEaiC6VfA5Nc2uGhlXH1OEbJycFgmm+i5lwIibZtLHYxmgyAJDAKVG7
	sB
X-Gm-Gg: AY/fxX4nIkB/TeLK3xNxQVwRb3xocy68MRlyJTJDtG0fsBsJ5/s9u64i+RSef6fm2k9
	5YmZkYXrK9fBiWf61e//qQWOhmmgeQHe4LUi1LvcHur0EYfbK/bYofPkfLDZedAimBlwGtXEYvv
	kpNLutX/y8xn2fb9kxTz74KYWRMBca70lmEC9uC8kA8mmBYGloQBuhw9GpBF8UungJdUU2UrkpU
	vD1wN6TRQwNpfySGsoqSntu7ZfI4DnNs7xdcyZ64RDjsoZ4Iz+ID0ezmbTSgjVzUTTsXIloS5bI
	z3GLVUUmgvyZnhXwxdigzcc/YyTmGahiK0Xwjz1/eDLM+mMldUgzONglTqlz/JNNZWE67pJhg69
	E7Vga80FRbvhEWomfLjcWi7CgN0DqUwI3yU4ugneSq7cNJhr5oeObHCXfVbaAlvq4b2lzRFa9cK
	0=
X-Received: by 2002:a17:902:d4c9:b0:29f:87f3:9c22 with SMTP id d9443c01a7336-2a59bc6c386mr11612015ad.52.1768376892677;
        Tue, 13 Jan 2026 23:48:12 -0800 (PST)
X-Received: by 2002:a17:902:d4c9:b0:29f:87f3:9c22 with SMTP id d9443c01a7336-2a59bc6c386mr11611805ad.52.1768376892172;
        Tue, 13 Jan 2026 23:48:12 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a328sm217118275ad.4.2026.01.13.23.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:48:11 -0800 (PST)
Message-ID: <4e6053d9-ef1e-422d-bbb4-e39e103e93d7@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 15:48:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lqNVjI-GexJpRR5Lz9-f94r5Fj4HoViR
X-Proofpoint-ORIG-GUID: lqNVjI-GexJpRR5Lz9-f94r5Fj4HoViR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1OSBTYWx0ZWRfX9PvnY9XIs/4O
 r239wGBZ0ClKZvgd8Pe1IIqSVmTs7XOMQi+WWkfqaQMeJ49RN9EHlTytMGb61kKMB5SMAUW/Rca
 9uVqdSq2u0nHFZqK72Bbu6JsKubvJslg8h+YB98KSklg0bXBDfXJrYzguH3RxKCIJssV73eXP7W
 NjtZQvms0n2FrgK9I5xkhMpJnqPhV2KVZzqt7L67n+p9UoAcG46ygVxfshdyBKTKMdMgYIqMSqH
 dy40OZKO9rDSSgMJoU4ia63zmdCbRPeAq/adSSbPlfofeSM+m6eGzvayJaLHtgWQA+89+tioahU
 08dY4ILzTLk68+x4VLo2AUsXvOO7S63Lo70Q0CESRUursRASIiIqNuxQP0n2Kw1/LGR4841mooJ
 8gEai3ARyRr+cZebH8lZcYD9OMveWQDUG9VtzpQS7k6vVFCXkavXam3LPMIMp6s9wN64AeZT9W9
 55+UjJut/HzCTZgrtXQ==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=69674a3d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=hyi39RYjpJE5wifr7rwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140059



On 12/24/2025 5:06 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 
> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 

Gentle ping.

Missed one more point of the changelog:
4. Removed interrupt-name property from binding document. Retrieve the 
interrupt corresponding to the given port number in driver code.

Thanks,
Jie

> Changes in V8:
> 1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
> 2. Combine the patch 3 and patch 4 together.
> 3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
> Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/
> 
> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
> Changes in V6:
> 1. rebased on next-20250905.
> 2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
>     lemans.dtsi.
> 3. fixed some minor issues about comments.
> Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V5:
> 1. Add Mike's reviewed-by tag for patchset 1,2,5.
> 2. Remove the function pointer added to helper_ops according to Mike's
>     comment, it also results the patchset has been removed.
> 3. Optimizing the paired create/clean functions for etr_buf_list.
> 4. Remove the unneeded parameter "reading" from the etr_buf_node.
> Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V4:
> 1. Rename the function to coresight_get_in_port_dest regarding to Mike's
> comment (patch 1/10).
> 2. Add lock to protect the connections regarding to Mike's comment
> (patch 2/10).
> 3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
> 4. Add tmc_read_ops to wrap all read operations for TMC device.
> 5. Add a function in helper_ops to check whether the byte-cntr is
> enabkled.
> 6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
> from the sysfs node.
> Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (8):
>        coresight: core: Refactoring ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
>        coresight: etr: refactor the tmc_etr_get_catu_device function
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  24 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  40 ++-
>   13 files changed, 833 insertions(+), 72 deletions(-)
> ---
> base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
> change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9
> 
> Best regards,


