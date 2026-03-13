Return-Path: <linux-arm-msm+bounces-97324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHVHF92zs2lYZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:51:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 055EC27E580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF992303B7DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DC034DB57;
	Fri, 13 Mar 2026 06:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORo/TkM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZZowGQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E374306B37
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384582; cv=none; b=GlXox3UUrU23wrMoSE+AVPt1ircW4rS5HgRS2shAyYe031B7eX1sM9o0H+8UtdGqE2+4y10V6eZBSvKPzl1/TJIz8hTlfvTwHzzUssva0aHirLUvMq7+8CXR4FRZScOuOsGzhfd8sZ8bmQvohmsyhKhW+SPvrnJ9hUrxZLBfLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384582; c=relaxed/simple;
	bh=faXKEtQyA2DTIzeO2K5IHN8H57kiNXjaxWsjCCelmCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9G56w0+x+KyNKyR5L7A1Ih3rb/RDb54WBTRGpHeZNgcwyfce7bEnw2ndU6emT48gj1tLhbzqqFO7XlQL1gqRQb89Uf4Pv/xK2Sq1TFOcwTY1Mh8xDDIfdWT40PxuSdeP/f6i2X8uZhNaEiwbocuA3FgeCpKHAQ9Bos8Cnk+RqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORo/TkM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZZowGQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbW3070440
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5un1i+j/A+PfM8ZiDy+fOOTdwY75I+GuvNvd3FITUY=; b=ORo/TkM4tzI9nn5v
	9W2AXPdJ4lpj5mr17kqVoUZirEWO2jJhKdpLjT1M3hd/ZXnYm6+dtznbc+3t5NTm
	RX3bKGT2XDGMeGZw/iobyKB5NQh5Dh+L5QOnQJgH/DBXyiqFNFWCOKJX3Y8rpJwA
	NiXcz/rK2xkrW4bwZh7m/AKm8DvBmAzT3okjvkP1rzf94C8cAV6+4J8qBZLMPrPq
	aMUiZHEsgRspYy3RqkU6TkQ7wRTok7mtdoHw7YhtHp4+rz2Ne5f4ehMbDQRIEO2V
	EIBHWs4n1pV0FmXMl9RDWvwlJM+oFquXJMTlvp6XQBYPFqX/ZhWila6c2AFan/Ok
	wOAFCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymv3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c738bebd53fso7215369a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384579; x=1773989379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5un1i+j/A+PfM8ZiDy+fOOTdwY75I+GuvNvd3FITUY=;
        b=kZZowGQ9HUALrg77NFrYjllw+HCKJR/bK1yr8AhNEQ0fFSFvszb3oDGSfiEZGrtBeW
         8hjdFo8kFsX4GDjrc+nZ/JcjGDSVdx6O6R3PQAwR5ozVYz+xSgkgWGHcJE8OiXzg03MN
         Oioyd5gUmdXoI99lWGRGz4BNPGEei+zJCt6KO50bO3gtVccvOt1pCTcaRVJ8Iwx9AMdB
         PRnSPOpdMYE2U3HExgUn6BIYDx/2iSLLQ/XwhgbaxZt5CipGxYTr4UhbDfq0BWpdR3KF
         DPgAQrh/7mAFdafKie/wWXazSY1IeimMW12Em9j49JNHMzgES0OmzMfdbkF1lCpayWU3
         5beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384579; x=1773989379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5un1i+j/A+PfM8ZiDy+fOOTdwY75I+GuvNvd3FITUY=;
        b=AqlN4wgAItFPO707nqzkqK2VBNsDqOPAdjwFd2ta9SAaqE2AJBbUkWI2uOxVfDpxsH
         oqoRKbcgw9BHGfTiGIjO2VJxlYR0EfwqsZFMErWOa8mh1Q78TCcAmdCREAwghow+TtVX
         WXAr8kkgOBanV/zhhZVoiRONZQIzXdlNIDlXA0j9TZTFIqNwV+svSli24bQxrxWHdcSG
         M0A8oyyvpySUEdpx48RKRnHYwe8c7V+u+aNLvq//Kxcjp/k3SvlFYdj3qWM4H5pqhQB2
         ctjsWdrnebhFd8FDOjibcpSm07grjc8u4eAdo7Vuw1QR33uM8imOCehWX5jPiLbuAmFZ
         4bUg==
X-Forwarded-Encrypted: i=1; AJvYcCVeBlLrsV0CT5n8/lUt3DFMyupUHiPOvGxOXvw/KX+PrOAyXJ+sK1kRCTDHslm+AYjuqZP2DOqLU8nz1xjw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pt78UpAHdbxAvsteYpEuvdtRTaWkWoM+vWSSwUt+foGbDUYr
	KFgkf63sunqSOZkDMygJYP7PEevzR3YgEs7ddoCBBeLBlMQR5QltqdIaP6BnxMIXPhFywRCUnaM
	AuXuT4HDo4VNCZX6YHendhcnanncCiK2N3JSYSWLJxTxaWMJ1GUFlpV9W5DAB8FdUqCwZ
X-Gm-Gg: ATEYQzxzpDOr3hHmEhDH51VnXIffa4CzOX88q2rXLMJ94MgPn7Hr+sfWaxs9dgTNLG9
	7lLne+SZgGU87uOEB6YOY1lmRmLY2PusgcdjCffEs1FrJVtY5RaGaI5Gwrrp3Q/MaBpCwn1Qytb
	2apmpypGHilrfSlch4Eleu0PNv+gxs7t5DJTmwUereroVEDw0ryxKuJbyzsF5iepQkNAdJvslGT
	I7qsTGU25nruQMPnROSNkmUQe6x3IRI4AQlvd3cEqvcsaiuCM3igXsC8kya39qGvu/qJwPW19QC
	7eNaxp28lWqnc4HVxxohJdUVuzCoVJ9+4/thQSQNPW1ee3OXn06WRmYQ+Yhkbm39s6yiVlOyqU5
	zEQEp/Wvd1HfihbGZkExFwx55OIQW2CNClxmMqtSB4j6J5RE=
X-Received: by 2002:a05:6a21:a02:b0:398:690c:d027 with SMTP id adf61e73a8af0-398eca8d63amr1820469637.20.1773384579128;
        Thu, 12 Mar 2026 23:49:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:a02:b0:398:690c:d027 with SMTP id adf61e73a8af0-398eca8d63amr1820427637.20.1773384578453;
        Thu, 12 Mar 2026 23:49:38 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97b41dsm936160a12.5.2026.03.12.23.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:49:38 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:19:25 +0530
Subject: [PATCH 1/3] dmaengine: Add multi-buffer support in single DMA
 transfer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-dma_multi_sg-v1-1-8fabb0d1a759@oss.qualcomm.com>
References: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
In-Reply-To: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-pci@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773384567; l=9280;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=faXKEtQyA2DTIzeO2K5IHN8H57kiNXjaxWsjCCelmCg=;
 b=0FmZZc/JAoE1+Mfa2hsGxVfxnhTB+AVaGJQyW+ZM+3JrDVVfrBNthZHWxcgnHjHuvN0gj/K95
 fSvQY9POy+7D0vKMz+GlCBIbKjdamtZXNFy8fvYEfHIftDQYdK/lYja
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MyBTYWx0ZWRfX+53t09MabpVB
 tjFNHVMTTWD6UgZGmYZbWY7Y/TucJA7Cf9MJ//5lX0UWPo6TaJmK1HK50PVGCN4jIPw9WGOCvny
 q6DKML39FkOtaVmV/hwQF2kLvrz4s2joVT9J9SxCGXNZN6XOLbMTFiW9SYd7IRzUlNAn/qy3f44
 Rq7af+mTIgWCIYDTu/b6RGg1WXD4FGQ5Ns1qYWtqHAdVZG9Hpu99tqLB2JdBJ0z/sgUCnL2R1oZ
 2cGBwVTjypIGjOVsnK/NUdg/n9Kw492sd2oI7I+ARcNqsU6xzvEag+H5ov1eqiqGiaUStr45Qn0
 bucc4Qz2dcdjMJjzQAh3EpYHFvRPC9H5+mJgwuwQTA8NvlNbF+Ihf8Ymwox3JdSbW1S5qkTGp7g
 EYM20fyw/d8pWEMM+pSMilaWvyflbbRbjkYzHCjfb3OwgRC8x19C6QjfikmsnJ2/BGC6FIneJ73
 dmbGlJh0ZJqLTM8vqFQ==
X-Proofpoint-ORIG-GUID: 2deHgd-IIWLmWqcMo6A8fXugSYT01-h7
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3b384 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WV2dQidlXXH6c0LHWD8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2deHgd-IIWLmWqcMo6A8fXugSYT01-h7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130053
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-97324-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 055EC27E580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add dmaengine_prep_batch_sg API for batching multiple independent buffers
in a single DMA transaction. Each scatter-gather entry specifies both
source and destination addresses. This allows multiple non-contiguous
memory regions to be transferred in a single DMA transaction instead of
separate operations, significantly reducing submission overhead and
interrupt overhead.

Extends struct scatterlist with optional dma_dst_address field
and implements support in dw-edma driver.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/dma/dw-edma/Kconfig        |  1 +
 drivers/dma/dw-edma/dw-edma-core.c | 40 ++++++++++++++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-edma-core.h |  3 ++-
 include/linux/dmaengine.h          | 29 ++++++++++++++++++++++++++-
 include/linux/scatterlist.h        |  7 +++++++
 kernel/dma/Kconfig                 |  3 +++
 6 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/Kconfig b/drivers/dma/dw-edma/Kconfig
index 2b6f2679508d93b94b7efecd4e36d5902f7b4c99..0472a6554ff38d4cf172a90b6bf0bdaa9e7f4b95 100644
--- a/drivers/dma/dw-edma/Kconfig
+++ b/drivers/dma/dw-edma/Kconfig
@@ -5,6 +5,7 @@ config DW_EDMA
 	depends on PCI && PCI_MSI
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
+	select NEED_SG_DMA_DST_ADDR
 	help
 	  Support the Synopsys DesignWare eDMA controller, normally
 	  implemented on endpoints SoCs.
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 8e5f7defa6b678eefe0f312ebc59f654677c744f..04314cfd82edbed6ed3665eb4c8e6b428339c207 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -411,6 +411,9 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
 			return NULL;
 		if (!xfer->xfer.il->src_inc || !xfer->xfer.il->dst_inc)
 			return NULL;
+	} else if (xfer->type == EDMA_XFER_DUAL_ADDR_SG) {
+		if (xfer->xfer.sg.len < 1)
+			return NULL;
 	} else {
 		return NULL;
 	}
@@ -438,7 +441,7 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
 
 	if (xfer->type == EDMA_XFER_CYCLIC) {
 		cnt = xfer->xfer.cyclic.cnt;
-	} else if (xfer->type == EDMA_XFER_SCATTER_GATHER) {
+	} else if (xfer->type == EDMA_XFER_SCATTER_GATHER || xfer->type == EDMA_XFER_DUAL_ADDR_SG) {
 		cnt = xfer->xfer.sg.len;
 		sg = xfer->xfer.sg.sgl;
 	} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
@@ -447,7 +450,8 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
 	}
 
 	for (i = 0; i < cnt; i++) {
-		if (xfer->type == EDMA_XFER_SCATTER_GATHER && !sg)
+		if ((xfer->type == EDMA_XFER_SCATTER_GATHER ||
+		     xfer->type == EDMA_XFER_DUAL_ADDR_SG) && !sg)
 			break;
 
 		if (chunk->bursts_alloc == chan->ll_max) {
@@ -462,7 +466,8 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
 
 		if (xfer->type == EDMA_XFER_CYCLIC)
 			burst->sz = xfer->xfer.cyclic.len;
-		else if (xfer->type == EDMA_XFER_SCATTER_GATHER)
+		else if (xfer->type == EDMA_XFER_SCATTER_GATHER ||
+			 xfer->type == EDMA_XFER_DUAL_ADDR_SG)
 			burst->sz = sg_dma_len(sg);
 		else if (xfer->type == EDMA_XFER_INTERLEAVED)
 			burst->sz = xfer->xfer.il->sgl[i % fsz].size;
@@ -486,6 +491,9 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
 				 */
 			} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 				burst->dar = dst_addr;
+			} else if (xfer->type == EDMA_XFER_DUAL_ADDR_SG) {
+				burst->sar = dw_edma_get_pci_address(chan, sg_dma_address(sg));
+				burst->dar = sg_dma_dst_address(sg);
 			}
 		} else {
 			burst->dar = dst_addr;
@@ -503,10 +511,14 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
 				 */
 			}  else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 				burst->sar = src_addr;
+			} else if (xfer->type == EDMA_XFER_DUAL_ADDR_SG) {
+				burst->sar = sg_dma_address(sg);
+				burst->dar = dw_edma_get_pci_address(chan, sg_dma_dst_address(sg));
 			}
 		}
 
-		if (xfer->type == EDMA_XFER_SCATTER_GATHER) {
+		if (xfer->type == EDMA_XFER_SCATTER_GATHER ||
+		    xfer->type == EDMA_XFER_DUAL_ADDR_SG) {
 			sg = sg_next(sg);
 		} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 			struct dma_interleaved_template *il = xfer->xfer.il;
@@ -603,6 +615,25 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 	res->residue = residue;
 }
 
+static struct dma_async_tx_descriptor *
+dw_edma_device_prep_batch_sg_dma(struct dma_chan *dchan,
+				 struct scatterlist *sg,
+				 unsigned int nents,
+				 enum dma_transfer_direction direction,
+				 unsigned long flags)
+{
+	struct dw_edma_transfer xfer;
+
+	xfer.dchan = dchan;
+	xfer.direction = direction;
+	xfer.xfer.sg.sgl = sg;
+	xfer.xfer.sg.len = nents;
+	xfer.flags = flags;
+	xfer.type = EDMA_XFER_DUAL_ADDR_SG;
+
+	return dw_edma_device_transfer(&xfer);
+}
+
 static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
@@ -818,6 +849,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma->device_prep_slave_sg = dw_edma_device_prep_slave_sg;
 	dma->device_prep_dma_cyclic = dw_edma_device_prep_dma_cyclic;
 	dma->device_prep_interleaved_dma = dw_edma_device_prep_interleaved_dma;
+	dma->device_prep_batch_sg_dma = dw_edma_device_prep_batch_sg_dma;
 
 	dma_set_max_seg_size(dma->dev, U32_MAX);
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 71894b9e0b1539c636171738963e80a0a5ef43a4..1a266dc58315edb3d5fd9eddb19fc350f1ed9a1b 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -36,7 +36,8 @@ enum dw_edma_status {
 enum dw_edma_xfer_type {
 	EDMA_XFER_SCATTER_GATHER = 0,
 	EDMA_XFER_CYCLIC,
-	EDMA_XFER_INTERLEAVED
+	EDMA_XFER_INTERLEAVED,
+	EDMA_XFER_DUAL_ADDR_SG,
 };
 
 struct dw_edma_chan;
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..fdba75b5c40f805904a6697fce3062303fea762a 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -939,7 +939,11 @@ struct dma_device {
 		size_t period_len, enum dma_transfer_direction direction,
 		unsigned long flags);
 	struct dma_async_tx_descriptor *(*device_prep_interleaved_dma)(
-		struct dma_chan *chan, struct dma_interleaved_template *xt,
+	    struct dma_chan *chan, struct dma_interleaved_template *xt,
+		unsigned long flags);
+	struct dma_async_tx_descriptor *(*device_prep_batch_sg_dma)
+	    (struct dma_chan *chan, struct scatterlist *sg, unsigned int nents,
+	    enum dma_transfer_direction direction,
 		unsigned long flags);
 
 	void (*device_caps)(struct dma_chan *chan, struct dma_slave_caps *caps);
@@ -1060,6 +1064,29 @@ static inline struct dma_async_tx_descriptor *dmaengine_prep_interleaved_dma(
 	return chan->device->device_prep_interleaved_dma(chan, xt, flags);
 }
 
+/**
+ * dmaengine_prep_batch_sg_dma() - Prepare single DMA transfer for multiple independent buffers.
+ * @chan: DMA channel
+ * @sg: Scatter-gather list with both source (dma_address) and destination (dma_dst_address)
+ * @nents: Number of entries in the list
+ * @direction: Transfer direction (DMA_MEM_TO_MEM, DMA_DEV_TO_MEM, DMA_MEM_TO_DEV)
+ * @flags: DMA engine flags
+ *
+ * Each SG entry contains both source (sg_dma_address) and destination (sg_dma_dst_address).
+ * This allows multiple independent transfers in a single DMA transaction.
+ * Requires CONFIG_NEED_SG_DMA_DST_ADDR to be enabled.
+ */
+static inline struct dma_async_tx_descriptor *dmaengine_prep_batch_sg_dma
+		(struct dma_chan *chan, struct scatterlist *sg, unsigned int nents,
+		enum dma_transfer_direction direction, unsigned long flags)
+{
+	if (!chan || !chan->device || !chan->device->device_prep_batch_sg_dma ||
+	    !sg || !nents)
+		return NULL;
+
+	return chan->device->device_prep_batch_sg_dma(chan, sg, nents, direction, flags);
+}
+
 /**
  * dmaengine_prep_dma_memset() - Prepare a DMA memset descriptor.
  * @chan: The channel to be used for this descriptor
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 29f6ceb98d74b118d08b6a3d4eb7f62dcde0495d..20b65ffcd5e2a65ec5026a29344caf6baa09700b 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -19,6 +19,9 @@ struct scatterlist {
 #ifdef CONFIG_NEED_SG_DMA_FLAGS
 	unsigned int    dma_flags;
 #endif
+#ifdef CONFIG_NEED_SG_DMA_DST_ADDR
+	dma_addr_t	dma_dst_address;
+#endif
 };
 
 /*
@@ -36,6 +39,10 @@ struct scatterlist {
 #define sg_dma_len(sg)		((sg)->length)
 #endif
 
+#ifdef CONFIG_NEED_SG_DMA_DST_ADDR
+#define sg_dma_dst_address(sg)	((sg)->dma_dst_address)
+#endif
+
 struct sg_table {
 	struct scatterlist *sgl;	/* the list */
 	unsigned int nents;		/* number of mapped entries */
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 31cfdb6b4bc3e33c239111955d97b3ec160baafa..3539b5b1efe27be7ccbfebb358dbb9cad2868f11 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -32,6 +32,9 @@ config NEED_SG_DMA_LENGTH
 config NEED_DMA_MAP_STATE
 	bool
 
+config NEED_SG_DMA_DST_ADDR
+	bool
+
 config ARCH_DMA_ADDR_T_64BIT
 	def_bool 64BIT || PHYS_ADDR_T_64BIT
 

-- 
2.34.1


