Return-Path: <linux-arm-msm+bounces-84033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008CC9A2FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E73E345A66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601332FE599;
	Tue,  2 Dec 2025 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpzWodLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB542F5A3B;
	Tue,  2 Dec 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655620; cv=none; b=GPRjofqXGf4akQpioFpgxMlWxWAg4k5zwcbLi/1ZAd7QQZiyw8pPqQDX9e8GqeCDxNH06vHNecod+qHvAdgTkedVYCf5D1zMh1oT0QnACSBm06USF6arI1FOCwg1gq95QKAd6SMuznsqvuSqPuU7aobpoATTKuUa0lB81NyOvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655620; c=relaxed/simple;
	bh=egsCTEe6Cun7ZwK2z6anda/abJ41k1bceFxHlqU/DX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tx32Ep10DiOPrVW+XvYMg0VlFrbrN64NEV9+lp6S9xzqaZEG4RAAfTl+tQ5S8vgnvvrjjXTp+3XnfK+dvxGnLTjMk0Z01V17JrQ5qYlOgJb7ykk9nQQoi9ueC51mhtA1qOGyQMyPSTY8eqbCe1w1IIO+RDAE/C+mqWTZrrC8D+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpzWodLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24Dcqw1593282;
	Tue, 2 Dec 2025 06:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D7t1WEYnE1ukCDyjY4prxe
	wMeSf7STL+PnwGhlcd6s4=; b=QpzWodLd7X1ESuXdzJgvb1NIu/A4ILpjJhrG3F
	Ud+TvizKfyvJ/DjDFCWcwDm+4+I60XFEhvo06kktJ3HN76Ns5pIPNh8yJmZ+Ed+I
	zsopAChUt5+4xzBC0tiV4FOhQrZIoaaaU9zZgYy2RKg6L9LGfhac3gtDSRT725ZQ
	eCSYOWdb5PATU8Rddv0qLltgVDgVWOXKq3DRgOoZL0CTE2aC577gl9Ik7BCpA4sQ
	qCOvPuBv8LO1tdiNFM/RSfa/mEkb4YhbbqIXxOo0WswiH9EI8Mr/JZQ0I5R/sbFM
	aLxo68/YB8Wq56JHQKMQwyqlInH2skdIj2aL8B87f2MTNSpA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr89ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 06:06:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B266hf0002044;
	Tue, 2 Dec 2025 06:06:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswkhqdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 06:06:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B266hVI002039;
	Tue, 2 Dec 2025 06:06:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B266g6x002035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 06:06:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id C65E8570; Tue,  2 Dec 2025 11:36:41 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: [PATCH v5 0/4] Add ADSP and CDSP support on Kaanapali SoC
Date: Tue,  2 Dec 2025 11:36:24 +0530
Message-Id: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692e81f7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=12PqH8mLdQwCrg6kZbUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: I7vubpa5fi-rq6VD0yWftKXjA0ZpseHH
X-Proofpoint-GUID: I7vubpa5fi-rq6VD0yWftKXjA0ZpseHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0NiBTYWx0ZWRfX+zJ+ml/EGCRo
 LPVocVNjEIHzeMfwmps8kvyFD4M9h5PdihY5TD0JlWvV9uVzLVOlrMjvjmQKFvIHiyZUrSHvzzX
 i0dRd93NLcZyF2iAxb2hSh46s3zNVRizNVTLswjypyrxvLLVqRWl8pNRca97K0rm23rFwe9A4tk
 HGtGGHHZ04lOmy5fpl64xLGm9215/tdjoqPxtdY4QillgB9EGx3SM5pCsTQbhgkfAsxgmMXbXfb
 JQ1PAXEKv3EKiH3jWd7sbTd2L+YzdqtScC1zPJFlFoZSv3A4nnjfBld+nVAzL+ROvBq7MGvlacM
 DmGSSvEK/mHNcbPaBaQOY9fxgdea1ZEgHCeJYKp8ukbItBaM7WGfToYe7sfqB7s9Ay8jvV24pBv
 rreLN3OQmPSh9EDHMl+q18knYXW6lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020046

Introduces support for new DSP IOVA formatting and hardware-specific
configuration required to enable ADSP and CDSP functionality on the
Kaanapali SoC.

Add support for a new IOVA formatting scheme by adding a sid_pos to the DSP
driver. Sid_pos standardizes the placement of the stream ID (SID) within the
physical address, which is required for DSPs to operate correctly on
Kaanapali. DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access.
This is being upgraded to 34-bit PA + 4-bit SID due to a hardware revision
in CDSP for Kaanapali SoC, which expands the DMA addressable range.
To support CDSP operation, this series updates the DMA mask configuration
to reflect the expanded DMA addressable range.

Patch [v4]:https://lore.kernel.org/all/733afe4f-51d8-4c5e-8c18-9843a316523e@oss.qualcomm.com/

Changes in v5:
  - Update the commit message to clearly explain the background of the change
  - Use the proper format specifier (%pad) for printing dma_addr_t instead of %llx
  - Remove unnecessary NULL assignments where not required
  - Rearrange code for proper alignment and style compliance

Changes in v4:
  - Resolve warnings reported by make dt_bindings_check
  - Convert the data type of the dma_addr to dma_addr_t
  - Replace the macro with an inline function for more readability
  - Rename the cdsp_dma_bits to dma_addr_bits_extended and default_dma_bits
    to the dma_addr_bits_default for more clarity

Changes in v3:
  - dt-bindings documentation update to support Kaanapali Soc
  - update comments to ensure clarity
  - Read SoC-specific data by matching the SoC’s .compatible field
    in the driver’s of_device_id match table instead of root node
  - Rename the dma_mask to the dma_bits for more clarity and set it's
    value based on the dsp_default_dma_bits instead of hardcode to 32

Changes in v2:
  - Rename phys to dma_addr for clarity
  - Remove iova_format, add soc_data with sid_pos in channel ctx
  - Remove sid_pos and pa_bits from the session ctx

Kumari Pallavi (4):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Kaanapali
  misc: fastrpc: Rename phys to dma_addr for clarity
  misc: fastrpc: Add support for new DSP IOVA formatting
  misc: fastrpc: Update dma_bits for CDSP support on Kaanapali SoC

 .../bindings/misc/qcom,fastrpc.yaml           |   8 +-
 drivers/misc/fastrpc.c                        | 130 ++++++++++++------
 2 files changed, 97 insertions(+), 41 deletions(-)

-- 
2.34.1


