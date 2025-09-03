Return-Path: <linux-arm-msm+bounces-71705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC4B41190
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7986203228
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCC019E7E2;
	Wed,  3 Sep 2025 00:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0bz4Hgb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4972143756
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756861055; cv=none; b=B5hdu8TzXOpW8bgmfPkIrKG/udikIAykE8MP4qzSSEoW+AXlMppFufezCdJmwT1WkrWxRxmfUDtTlN9JByMc4dDPIwkriqT09dlbgKsA2n0e16J3in5F3iErCdr4xhm9YOJTQNuhMTy4daqneyg7CohsLy28WCOEXkkqIdIitpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756861055; c=relaxed/simple;
	bh=KX2L1OSzEQjP5CIuY1OZ0sO7glYqDChLojpPjBEMqF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tqw6MUMeNrQucTehM+uA8ro05DVJjvg9aj/THjvyg5Ce/cX+GO0byobzq9mA/ASAJUQRbDkLkXdPBVQJ0MRkYWKn101F/s/4a7IirCUC3yX74Lc9bI/1JCMh3jPa9ep7k60PDmg1/x9z1gEpc+LRDtZzVD7yBz5Oq61zp5Xwj7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0bz4Hgb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqAUc025278
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 00:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvRBZ8l1soa2w5f7bVMj5H2wpo59ehpd/EgdLHhxglk=; b=j0bz4Hgbhfhw3Loo
	siOeyg0W8pTGzedIHctGIoidzuPdlGDckADqummia5zSpPkuOvVKBlYxVr4LOJmm
	+pEMglmEGv8DcSrJL4FHk9+zzMBLzZW77n2rev0w4Gk2qXH7yyvlpaWBYQvgVt2A
	5AsPLC52K8+gmnRgNbKouk1RM/JKdQMaxLv39Thth2sW/oGcW248/UVhfmpe+UBC
	bIfZq6yxXoGUkklwGacKY/rjj5EGqQSIjCGkURsq/qBAORQ/Fvg0qPZEHm7Rb8Rs
	O2Y7sfLLj/b6ro0DxbxodpsRzFhHvxTd1/nQOAXfdI1EhJNHnk31qqkuE0N0BQLt
	weSkTA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv1sey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:57:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so3178003a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756861051; x=1757465851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvRBZ8l1soa2w5f7bVMj5H2wpo59ehpd/EgdLHhxglk=;
        b=qHo945xfOIImbDAG4JwZfw33v4yfAyXyhVByC/8Lm6/FQlyNwMmqOJrdiEvGpCaLCl
         8pF2630rc4+kVw3KpNrfdvIVjxALp7oQcYTKjN3C2M+f0wLCC7PWtMPw2nrAHavi46im
         hZAqJQALcg+2FQdk1F3t28+9vh8MkP2cxdTEBF/zxj7nc1zflkbStyTyRaRJ7q93ft1v
         WDfcJfa4p74Bg859FdMbUkCltyFv0e4gsRt1teHvwiwyRAGk8FCSqXMrLVFcFREK7IXY
         W67Ycjq/CmvHQ3lmgrUC2xXhMjMrbHpz+PhmpQIGqDtcGS4Tg3cnJ88TE6yNn/klPkaI
         myig==
X-Forwarded-Encrypted: i=1; AJvYcCX0oCB4pfaTJa8kZpeTXw9JRUN4Ks6XXsVRprANOwqwmQHhHLq/5uYvMQRRLexGirfCzvC49QMD4H81cnpF@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8CO7PIxjeUtjh0VzENyOFNFzrkgfUGMXhMMOclCedq+uJ3iZ
	fcHgs/mHf7oHwqEPVhKWAq7HdwxJ934aZKJxCzK6NTmB4Zk/KD9qSKFD3B5uiEq++vn71REVPL9
	D64fsNSIGVDDW2v0RIPWnZZPWzaBZmGYvViUGb08h3wFwue5vES9LyUjI1cBQQzElc81k
X-Gm-Gg: ASbGncvDTaY5X/P9k4iPhx1oJEz/Zid8M/vlpDu2Tf2OXMFlEVYgFGL54htOHdEnFnT
	ry+iPt/wIBeiN4VApXk009LoKrB2f4tccmKWEZ0k2QrTHinLKbP5nhdlPydf8W8c6MXq4K02a/V
	Ujy+oPQCXiJ+IE3VnD2ZzJUysBxdyPZZgV/F5fef4Type2niyvpaDOB5YMPyEoRB9xJ461ej2fn
	H62FmX0fei6f+pUdHy0u78aIreZ9Lun2r5ApPBdzTJSDvjgN9D7lo5I6uOoKOWEeHrSHqfzl+Wc
	vMapWfemWMj4zeanZr/6I/iU504FK4wLG/mH/C8WELXtKUhkUUMRFN/XryAJUIpQgWGzixuj0K4
	VskI2lz+IjYloGzT6nb5Rmj5b1lEY
X-Received: by 2002:a17:903:3c45:b0:248:f762:865b with SMTP id d9443c01a7336-24944b196e1mr173916115ad.28.1756861051326;
        Tue, 02 Sep 2025 17:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMWFJ+CC9Sz9EcWuN1L7X1HHC53rBd/UlzzUN3mZNfei+7evwXupqb4deQ1I5sJ5h9nBJvig==
X-Received: by 2002:a17:903:3c45:b0:248:f762:865b with SMTP id d9443c01a7336-24944b196e1mr173915835ad.28.1756861050801;
        Tue, 02 Sep 2025 17:57:30 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249144837fcsm135630555ad.15.2025.09.02.17.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 17:57:30 -0700 (PDT)
Message-ID: <1a50602c-6c9f-4bb0-9072-f5a6322079c7@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 08:57:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX57PQ7yZkNNMz
 hoLf09GLkKJ6yojmWJznfx4KNJ5PHKOQik0JtTezIEDRwk0VMfb7VCvLPtMEUyaWdO4VEmgjQf7
 pFAqL+tVfziQ1h+lPsLJaYDfNtO+mP4xfHsnntknDIpTaHgt/2tpMFxf2GQyGxTYozMNIuilv84
 TS4EGhNRZh4NzFk0ODpj/ag4AkDXnKsyFxTDQLZZfSEUHVXi8sEtwI7FPlpXnz7Em8MMoEiiiJg
 B3pqd7MqxpVhZcZdnpiHGCGqZNoUHmDW2Pj7QbJWbPto9Zfgrv6jlzo9GNEMSGxZHZ/Y7qVfxul
 2q2IDN4W7viC46xgLU6mcw85YBop7kLWhdCeFLY4TMifTJWaZOqT1cOpqwvsgUSQVBbi/bxh7EV
 ptaXbd5E
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b7927c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BaEammc9KrtT-KL9giMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N3sqPkYUVn2_Z9zMS_ysfMDCL9dITtj_
X-Proofpoint-GUID: N3sqPkYUVn2_Z9zMS_ysfMDCL9dITtj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031



On 8/12/2025 4:37 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle reminder.

Can you please help to review the patch series?

Thanks,
Jie


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
> Jie Gan (9):
>    coresight: core: Refactoring ctcu_get_active_port and make it generic
>    coresight: core: add a new API to retrieve the helper device
>    coresight: tmc: add etr_buf_list to store allocated etr_buf
>    coresight: tmc: add create/clean functions for etr_buf_list
>    coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
>    dt-bindings: arm: add an interrupt property for Coresight CTCU
>    coresight: ctcu: enable byte-cntr for TMC ETR devices
>    coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
> 
>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>   drivers/hwtracing/coresight/Makefile          |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c  |  59 +++
>   .../coresight/coresight-ctcu-byte-cntr.c      | 368 ++++++++++++++++++
>   .../hwtracing/coresight/coresight-ctcu-core.c | 108 +++--
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  62 ++-
>   drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>   .../hwtracing/coresight/coresight-tmc-core.c  | 104 +++--
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  39 ++
>   12 files changed, 824 insertions(+), 59 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> 


