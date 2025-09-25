Return-Path: <linux-arm-msm+bounces-75080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554BB9F03B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA724E318F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BAB2FC017;
	Thu, 25 Sep 2025 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7qW1Q7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96D2FBDE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801264; cv=none; b=VXRLNI1cW6+BHUHqNUE1xFv6UD/dztsUWHYmZBcLBM5PGNJ5/doD/pMibLI/CGNKV58l6uFX9CszOCwtxI4Z/7jYcknjib3Qv7O5l0zye1TfCvqfPrY3dTrKIKbYaBd5mEpb3YIYCANoxoKZtjHkQKXGFY5u5xMdms9gsriONN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801264; c=relaxed/simple;
	bh=SyjT/o2z0dyOG2o4BytzIRC4dNs1eO2vwpK24YRaEkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NYlxFwbGUmsmh0Dz0cNSMIwkrTrqJ/2hAiKDYeKffOTHWD/zrzuu2mtWB5NiBJfWE6gqqvNMBdh3B/OJNqmOiAHsnNH95L8Z6xhbhh6yYXFVABX/039M9FcC2SBU8K/ALELMWx8w8b/HC/6aYfI9I1PqZWqSsE5sMdnr9GkED5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7qW1Q7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P90Eis027782
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnY
	dDBg+Vjw=; b=k7qW1Q7/SptebFxWY3QJgijbjb8kx1guveuj61ZnjJ70SxrHSW+
	f/VugZaQ3HWw2ZT2ZS6sc4FnUoU+GuOzNJRe0M2lsvohTQObbRUjW8lI07u2F0C/
	giMUSgAWEAoaJXSP7lYSJfsS30efuoGi/87V8OuMMiwUoCAy5cB8Z4WBJo0p1TA7
	lNjK0WfXeyg3tQhDO52kp8x2pf0gXnnQyFS0UhkRQ+ajz4eLDv0ellFi7io2DmCx
	R1Uu5DVRCGHJqcH1pZFekAlEJGpJjhpq/F7rD7aFrklQOvryXADtEu0LhOuUENxu
	xf9Z6s33PlONOK7lZPF1n6gp4+zj/Zi2nfQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp0b1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:54:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ed6d43dso10425575ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801261; x=1759406061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnYdDBg+Vjw=;
        b=G3Fla+q8SazO0xmna1Rjgk6y1FB/HfY3Y3KxYrycqGH6T78xuPQCNKzbU+TxGrLeUC
         OkZ1eb9TD6PTWKS50tNvvafzdYrwfSxY9c0M74g/Vb8TLJy1ATXukLd1DUx77edTeRLD
         03OPOtQgVqx+Kznl0nP0fEb1IAc1mED6ZBKYXe7JVfU9tDjEoxaCeSPxjWQXUZSuPFL8
         DxSZMBB/Il8Y4fDXxliEZCoDGdNmoT1+UkCGALq0pKSTPy16tWckLss/4+HvE2+/RTKw
         IxUzjxnrUh+KmeLIIJnamCy9xoCSzKC8PIteuB8zPyz3dnezMFFmpZHx4ZsUyGBIO9M8
         UA0g==
X-Gm-Message-State: AOJu0YyERBPS0IMfhmDtHs8S6kD6c53R8NNU7uaBd4nZmLdsLBFDaL+R
	R2XuG5uGn2Ap/Kes3dD7fR1iQOqlxA3tnrbyiqJbAQrVoRl24GGKk0qDEX9HOVawsUVbx6YKPQ0
	vRvueA7L5wGuQkM7OFba+xXTZ7SIiZCfUNUCeP0j4+btjkDqGcCWWTcW19tN0saeG+hQE
X-Gm-Gg: ASbGncuSRKoq6JSemxVyPkO4wjHAP9YUdOau3iRPl3/KOir+dLSq2vYjUNdw7PosPU+
	cIVWLMYcx/iBTYjouIvE6Ud4kXAjZfXCaYeb9f2EMbqZMMduxe8sY1XLzKrjmWCSLtS0lBnN5to
	LEEiTcvuH1RlM2mJJOP1gV+e/4/9hCwLCmQaIEJWmoRnuP7W5VEdiIlYr6Sv/ec0E+9dvW4n4QU
	3J4wf9nEcoHGUooIyu2ppFuJFGWa2xdM0eGDg+lYVZl2IT0zxrHPs9jnQj+3WhIjI7fNwNRPNYG
	RTm+xWJ+ebneijcLHZSkqg+0fw+P4DDUaK84KMc/BLcDOUsjdYJ7zsdJkjs+/hxBaz0tL48rbcs
	=
X-Received: by 2002:a17:903:2c06:b0:269:ed31:6c50 with SMTP id d9443c01a7336-27ed4a091e8mr37880435ad.10.1758801260808;
        Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuENIT7uqE/PhFHkktSwABTjczamPHUaUnB2zTV5WRthAd1QMusVFWwc0an+6Xwk23xxnGrw==
X-Received: by 2002:a17:903:2c06:b0:269:ed31:6c50 with SMTP id d9443c01a7336-27ed4a091e8mr37880135ad.10.1758801260297;
        Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bb502sm22087935ad.118.2025.09.25.04.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 04:54:20 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: [PATCH v8] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Thu, 25 Sep 2025 17:24:10 +0530
Message-Id: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d52d6e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=AcHsLZsjNhMhd8_3HEgA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cjyVN1gl7yXfHSyAma_XT17R4na-U2lC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXwh1pq5NNOS5d
 uKexv06HAS4OOk9cYSXCHfPf3nBbFlPpsPVMABTSHMbRe7hfxcYkrtDhW+HaW9AA4ZUcfIzaWCO
 t6QigvTrHpPwhuW5L3coTXp980KYOExii4bstcXznsqlxbzriifHVGJSvAdu+lHSdSomSGJHtP9
 WhqncjK2oQl/cXqe7+lyN4hTwUz7xTPxQR6B02kW3R6SkRXhTZljJnADvL1fkTN3Zyt8Aw5L42C
 3MIcSZeONr7gxCz+8wUO3F9Tl/FHG3CTcDa2FqFjNmDFvLgL458Ltoyee32lnOdPeVo7HM4B7wv
 Yd3k9wOEcYDs3NyErnE5xs/sOri4c7224w8rUD64Cq4bdkEg9LmezOphnjL2pMx8SlOZOCTQcDq
 WsY/HGla
X-Proofpoint-GUID: cjyVN1gl7yXfHSyAma_XT17R4na-U2lC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

The I2C driver gets an interrupt upon transfer completion.
When handling multiple messages in a single transfer, this
results in N interrupts for N messages, leading to significant
software interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI)
mechanism. Enabling BEI instructs the hardware to prevent interrupt
generation and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v7 -> v8:
   - Removed duplicate sentence in patch1 commit description
   - Updated with proper types when calling geni_i2c_gpi_unmap() inside
     geni_i2c_gpi_multi_desc_unmap().

v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - dma_buf and dma_addr for multi descriptor support is changed from
     static allocation to dynmic allocation.
   - In i2c_gpi_cb_result function, for multi descriptor case, instead of invoking
     complete for everry 8 messages completions, changed the logic to Invoke 'complete'
     for every I2C callback (for submitted I2C messages).
   - For I2C multi descriptor case, updated 'gi2c_gpi_xfer->dma_buf' and
     'gi2c_gpi_xfer->dma_addr' for unmappping in geni_i2c_gpi_multi_desc_unmap.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function and
     so avoided using external variables for DMA_PREP_INTERRUPT status.
   - Updated documentation removed for "struct geni_i2c_dev" as per the review comments.

v5 -> v6:
   - Instead of using bei_flag, moved the logic to use with DMA
     supported flags like DMA_PREP_INTERRUPT.
   - Additional parameter comments removed from geni_i2c_gpi_multi_desc_unmap
     function documentation.

v4 -> v5:
   -  BEI flag naming changed from flags to bei_flag.
   -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
      file, and Block event support is checked with bei_flag.
   -  Documentation added for "struct geni_i2c_dev".

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support is
    moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.
  - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
    struct geni_i2c_dev.
  - Removed the changes of making I2C driver is dependent on GPI driver.

v2 -> v3:
  - Updated commit description
  - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
    "!is_tx_multi_xfer" to else part.
  - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
  - Changes of I2C GENI driver to depend on the GPI driver moved
    to patch3.
  - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
  - Added description for newly added changes in "qcom-gpi-dma.h" file.

v1 -> v2:
  - DT changes are reverted for adding dma channel size as a new arg of
    dma-cells property.
  - DT binding change reveted for dma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues.

Jyothi Kumar Seerapu (2):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |  11 +-
 drivers/i2c/busses/i2c-qcom-geni.c | 248 ++++++++++++++++++++++++++---
 2 files changed, 233 insertions(+), 26 deletions(-)

-- 
2.34.1


