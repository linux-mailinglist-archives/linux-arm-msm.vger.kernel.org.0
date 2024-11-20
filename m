Return-Path: <linux-arm-msm+bounces-38413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 996199D3394
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 07:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F3C1F23CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 06:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A97158536;
	Wed, 20 Nov 2024 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OypKmllz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80EA74040;
	Wed, 20 Nov 2024 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732084454; cv=none; b=RBiWL0977xvQbG+pebAdfQ/Fi2yrwag1ZozGxleUqK80QsxymuyI7FevrDJ7iK0CNzSE6t/VRqkJ5qRv4qZxLtDVMLzv5Jrx6oHd5T8kASclD+e9lL7vRtKeWbulb8m/X+Wc3zCDVE//vahQEcEHJjOflAQAO+wt2xH6/kh7OO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732084454; c=relaxed/simple;
	bh=QJ6GD/d/v2cmMsQuGNcuTJhAMmJsXai1pek9EAHmU8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a3Wxh9HLhLMoZf2QNmt9EjEopX3PqfoT/0y89NjahzWkxIfuTFkrPX/Cm/G46wqNBbStSOAixMoGQ3mkZ3rzZYKUgzpdw5FXpMi/MKom8Pb2+ymybkvnay1qmcL4KyUm8Ec7rrtTGNlu/OWasqgCIwBpm9jBrkjh3WFBCGYJdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OypKmllz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIF9Mb028405;
	Wed, 20 Nov 2024 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qzv11e7LxiQljZz3oEzNpoPzyq3sIquPveSx2g1Yh4Q=; b=OypKmllzMioMWE1J
	L7cymb+5TXj1piluJbuerDoFuLUnZp+IXeTBh4rGBLbPreVER2UFbNVWPfF59DkF
	80Rlc2xc8mEtiYU0EY1JOZd3RC7hQ8atBGcbkEMkTzio/alBLvRlvA56MjDEW36X
	64Kk1D+VKMWQ5cmdXeo4dvppC+QIVP1lyQJK0jasAWBxfEqSS68ogc7ts8YMGpAC
	cdYGL+ZZgU2x1Rlhlveo7uhFN+K6IrXuEkYfrbKraYYJEjVLw8E84wnuL3vsbinU
	m4xtf/7sGY11rmhTAF8BRTnstq42t6lCsVtHUUGkZyiKyf/ITQlFXS3THPUURTkp
	C4oB7g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y5vyaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 06:34:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK6YBdL015299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 06:34:11 GMT
Received: from [10.214.66.187] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 22:34:08 -0800
Message-ID: <6e930d07-4b0b-422f-8435-b25ab14e585e@quicinc.com>
Date: Wed, 20 Nov 2024 12:04:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs9100: Update memory map for QCS9100
 Ride and QCS9100 Ride Rev3
To: Kuldeep Singh <quic_kuldsing@quicinc.com>,
        Bjorn Andersson
	<bjorn.andersson@example.com>,
        Konrad Dybcio <konrad.dybcio@example.com>,
        "Rob Herring" <rob.herring@example.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@example.com>,
        Conor Dooley <conor.dooley@example.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tengfan@quicinc.com>,
        <quic_shashim@quicinc.com>
References: <20241119092501.31111-1-quic_pbrahma@quicinc.com>
 <30fda0e2-f314-49b8-8c1c-bf4fac87050d@quicinc.com>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <30fda0e2-f314-49b8-8c1c-bf4fac87050d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CWwTnn9yhT4ZXo_8Je1xz_cX5oaeNeir
X-Proofpoint-ORIG-GUID: CWwTnn9yhT4ZXo_8Je1xz_cX5oaeNeir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200047


On 11/20/2024 1:41 AM, Kuldeep Singh wrote:
>
> On 11/19/2024 2:55 PM, Pratyush Brahma wrote:
>> This patch series is based on Tengfei Fan's patches [1] which adds support
>> for QCS9100 Ride and QCS9100 Ride Rev3 boards.
>>
>> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
>> introduced and the size and base addresses have been updated for
>> a few of existing carveouts compared to SA8775P. Also, tz_ffi_mem carveout
>> and its corresponding scm reference has been removed as it is not required
>> for these boards. Incorporate these changes in the updated memory map
>> for QCS9100 Ride and QCS9100 Rev3 boards.
>>
>> [1] https://lore.kernel.org/all/20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com/
>>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> The memory map for qcs9100-ride-r3 and qcs9100-ride is exactly same.
> A good churn you are first deleting(based on sa8775p) and then re-adding
> for qcs9100-ride*.
>
> I think it's better to move common qcs9100-ride* to a common file ex:
> qcs9100-ride.dtsi and keep specifics further to .dts files?
>
> This will ensure common entities are present at same place with no
> duplicates.
>
> --
>
> Regards
> Kuldeep
It is true that the memory map for qcs9100-ride.dts and 
qcs9100-ride-r3.dts is exactly
the same. However, I am not sure if having a new common dtsi file would 
be the right approach
here since qcs9100* dts files inherit the sa8775p.dtsi file already.
I'll wait for Bjorn's comment here.

-- 
Thanks and Regards
Pratyush Brahma


