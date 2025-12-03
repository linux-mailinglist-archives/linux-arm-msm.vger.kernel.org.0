Return-Path: <linux-arm-msm+bounces-84222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73371C9EFE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 13:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51B83A73EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 12:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906102F60CF;
	Wed,  3 Dec 2025 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHgaUk/C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6tmHSbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806282E8DE6
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764765014; cv=none; b=pYzvIqvB2gK9LnPloGht6wqIGEE9oCD5L9DbJ1XSD4+NACbNTOdz9le+WYyL+A6ByFshN3zlmltjwRdKHZs9VrUkYUBoEsdsQ3si+8+PStRIMImtOBfQGgLwxM4D7MftbVruzBOHqwgUZZLgjQH35221TPbX/wVvalGe23+fWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764765014; c=relaxed/simple;
	bh=57y2PMcZtQpat863EjZRPmyOnIiP+0dqb1YuhpvrzEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQt2qH6SgTQK+t0tKKrxBspOV6sItz8VF7rDWNNb0+9+VJXxXeyok+9+U+RAgaHfSxoHaEC0d/ZDzlpvFhlpKX+smjY4TQVdxM/uNnQpr9YfdiPsLL2L8vrDdFrayUHJQqJ8uQaJ6i5v7vrxtLkV9bLkRGC9NFflDuRRnx2pCbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHgaUk/C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6tmHSbj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3Cp31374513
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 12:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=; b=aHgaUk/C0Cf0iAM+
	P2cEI46fknVlFZLKSgr5FeaF+P+vdR4ILAF+TSQFP6hWuZdVNn5yIAItYFAqbVPf
	kQfPAgRdO4MLoP0CsyDqIFFB6iVFnoahqDofkP6eN9NUS4bf+bkRnTtGACvndBYi
	hBX67SZR3VgryPz/pgUtNyfMsrxBzaFlVKb4h9ihVguGaqP7YMGay431UQCXTfYq
	sYkN+5U3iDs/8Sv2sNNcdd2bqEIBXDzM4ElLJpnByDpUjtNumiVWI/8QssheHNmn
	yvdgRn5j0ky1p6PifAFzm4B5W5JthvbKV5LUgp2vFbQmx41cLPIvcVULz5zx0o4s
	pK6JoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b8732-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 12:30:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982dec5ccbso116991685ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 04:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764765011; x=1765369811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=;
        b=A6tmHSbj2mYB2yNNd46XBW60dqwvgXRvJUNhG1XO6lpC7JvFJEHqr4sZ+hPavANuhl
         vmAAZELy0HPDS3NCiCyGWeym0VOjFfsOrSx1/jZc9X7bRbucfDvvPo2D7R4NaTA0sfJm
         eeN+GEDRMtLJm8mcRsFmTekYVjbVF4tb7zGmG19DXQVplgKbjn6AnUEPHMzOQ2XnIMvq
         4d0LkM6OpM2tLdZvrbZZ3zpJgj51WqLwaDIxSegFt3QNTSWmUkjbZuQ6m+YXqLS2gJxj
         UIxoAg2R/xbjbo1lVeyZ9ps8JZ5m+sBfd6KoC62rZews2AaMdptmEAsCcUGN09WWycQq
         aJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764765011; x=1765369811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=;
        b=RmJ+wEqnKgUv4HZnHyViczF2bkx/dxX4XC/qotaunQYRA2bujHU2WyULCZZ5Nvruug
         XP86ByRBn/Pr1c8kQJ+TrpisCCMFvdg8ColKyn9A5gQbbUaFPBnxnx6218nkcbO0Mz5F
         MNtlsm5QssG1xqu0SoVZvVTKJBkgIKtd8Y8i+slVWRgGfiqHdSpGpKL5n4aweAxo8BhE
         HqIvE7SQRBua2ssR1Zx3rlV8H7TWe7Qh6YpIV90KCqbanW0ItokEItmpFafUkcr/2sQe
         3DA31NCu7u0mEWqbwVuxFtmgAjokbeExHe8cwUT2QitmBV+j0/uu13ewyBznGXfgV1Mc
         oj+g==
X-Forwarded-Encrypted: i=1; AJvYcCUChEyZXATF1W152rx+mqfxc3sPm/F2/gbxh7hmN1I+SQzFyrhD3gKshwo+ZdBbeB45uXDIyhwTqx9pCAfn@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQxR0OoCHxSSTciPxac6ZnAqNOJjBydWi58HSa5oCwErI2Q2u
	fTFYPAEEt208YwQd9ngK6qpQoD/IMH5Vp5BDDHWqZl8sose0xIe1umvTVSbO3n8YmGVJSlz54/R
	4RoIw1irhO+KwlI6d99UoZUjvN0asXr+0Bca3xS2YTzUEaHgWw/UqomJhXe9WC7SdSjkK
X-Gm-Gg: ASbGnctEEjZDUfsdQiZyOs6xZjCrCr1kYzpiDrxqRgA9NHh2ML4UbBrzHsahYleK4hk
	H308uod2k69/f4s/KAAqVbXcsrM+1IX93YSURZ4z4KtbZi/237et448TPyrOqcp0qpgTIijgfQf
	XM2fUjFD+RTLqByG0ncixTGuJSzEx0oj6R6XXmB1eF2GCPhEa9J41kiGYZ5vTRicEq6LMSJyqZp
	g7g7FniTk97lV4i9NP1rBNV7gpl478BxmzVHZ4ze2jn/EJV54FUrDHKkcXNuD2g8cfmT4oLBJG4
	s/u9f7wgdrZcRz68lw06ja0ZPTRiphrFtEVk7vw/YP1sRRNKuQHMoPguBxBqoZZ0SnXO6IUuxBr
	buVl4P5hjzHsTaND9N3NxNn2sqYuaXTajfrw/M1bowYkxChF7TNgdx2HcAvJ7WY3qQXZbteSSZ4
	w=
X-Received: by 2002:a17:903:1b50:b0:295:2276:6704 with SMTP id d9443c01a7336-29d683d8d2emr22768215ad.51.1764765010692;
        Wed, 03 Dec 2025 04:30:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi514MvoLWPQ+mY3QhTw3sJim5M/u4DvZfebZxJa2M+8ysnveo0HmfWywoFhk2Q0m5oo41QQ==
X-Received: by 2002:a17:903:1b50:b0:295:2276:6704 with SMTP id d9443c01a7336-29d683d8d2emr22767635ad.51.1764765010040;
        Wed, 03 Dec 2025 04:30:10 -0800 (PST)
Received: from [10.133.33.113] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29d8f4075cfsm880765ad.50.2025.12.03.04.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 04:30:09 -0800 (PST)
Message-ID: <3e069b0b-c73c-4a42-9d39-9fc5072a2710@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 20:29:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan
 <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69302d53 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=BaEammc9KrtT-KL9giMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8VAmOkM8jSnIFIKhWTFSupDSA00RoDZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5OSBTYWx0ZWRfXyOCpTeWwp6JP
 dzSINtZh3lznm9f7NK11m7v0PqekD6Y5Hts+8R6+c3zTWVl0usy5tP+ZT3Lw9TIi4gaTdBxWwwK
 Ymt6Hyh6ZhWpIC1+aOCeBtVF8clSNASJfaRxN41B8MMTApFtRavy7mK4C6tXd+uuvFqyNOup9xA
 Ih4BdH5P6kx/Z2W88EfkrIHRE60v6hezOlQfCKcY5vvDixYVNoQI2P2UvV9a6inuxb1LEUCP3Jr
 3qxHVWL6KVq2VmY5uygyllGZFyNwxp0xfximIXw4i85kkOWogDDc3Jx3XiyQMNijLH5w5JvtJx6
 hzwL7yTuHBytVdxHVAC99vBvxFESNyVTee75dBpD3e+iHG20c+2/qvgZqKR+EITFzth8/0KbrrD
 dY9Ix4w83AKrp6JEemBT6PDT5WXftA==
X-Proofpoint-GUID: 8VAmOkM8jSnIFIKhWTFSupDSA00RoDZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030099



On 10/13/2025 1:49 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle reminder.

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
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Enable both ETR0 and ETR1:
> echo 0x10000 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold
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
> Jie Gan (9):
>        coresight: core: Refactoring ctcu_get_active_port and make it generic
>        coresight: core: add a new API to retrieve the helper device
>        coresight: tmc: add etr_buf_list to store allocated etr_buf
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
>        arm64: dts: qcom: lemans: Add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   6 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  17 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   5 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  59 ++++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 368 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 108 ++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  62 +++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   4 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 112 +++++++
>   drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
>   12 files changed, 825 insertions(+), 59 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-enable-byte-cntr-for-ctcu-6199b791b77a
> 
> Best regards,


