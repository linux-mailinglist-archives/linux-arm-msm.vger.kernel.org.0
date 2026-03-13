Return-Path: <linux-arm-msm+bounces-97323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJXDJve0s2l5aAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:55:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54427E63F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33F443001399
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6913218DD;
	Fri, 13 Mar 2026 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJLgPv0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjwttMt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8E33F5B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384576; cv=none; b=JKtzpwbka4GR4mnV79PKxOym1pONjkblsKY5q9EvdM4gJ9Xbt0yRQsxjAfMEnY6PwSG7QNCQbdXUmA4h8PqRMh1hOwiP3/FdfsSmKlQDEqBzqwZ6FCEFKxsveiyUP0jHS2rZ5q8r325avIJDvFpbLXOAIlM74blkyxSS6K+yCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384576; c=relaxed/simple;
	bh=pvlk2gOPkIN+ITxicWXFZ618jc3EqUbu9jfuBJT+Pj8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q8OckkL+JnH4kPy/DZEjsKKnDSMZxSI5U4W+PRLTPpvVhGbI0gyzBM0GGQTOTFuWoFJRtXGY5jVWWYgYaQHHW56vkW8DK5wwXxBiNbpletOrLMXUyhXoZFciZuPuBa2BgeZPLQZEH7gReFSjn2bYjX2+/kvWD+DnKwQJtycjwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJLgPv0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjwttMt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tej13342525
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5AVmFAe9Ik/fE0LX/BsA8E
	1wHztxhMYSWxglI3gqndc=; b=hJLgPv0Z4qDUBFVMEQHi0DDoGS8X4keR73BE3t
	RKLGdEhNe7yWwXWndunp/MZkJR+6CSGY4Ke9tdGCng2D68Bpd+vEhsUfqxG2HwO7
	ZiJlG8zfhLXxIcXG0KTwyNnjL8tF/0S0zdDsl7UKHOB5ZQjJyHvKXLZ2tpbfLglV
	K8jiGYC0yrdyO0Eu383hfcRUAqPFoDCAHgqcbs8VwrRaFAfN+CoTk/CBnYDnapUC
	ZXjC6iQnXBdzEhzfYSWasyBpiY2RgaAREBvHW3z9nLk5u70QOCUtywwUci/rU6cr
	yaveQe29DY55nFQW5Ei5O3g2ASPT61JY3EmJVnHtM6lWJ9bQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w3jh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:49:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-359fe4e9ea7so1599093a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384573; x=1773989373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5AVmFAe9Ik/fE0LX/BsA8E1wHztxhMYSWxglI3gqndc=;
        b=MjwttMt7y0Tm2zBnv5PpTF80+1Yc+VQbJx0EW+i6vQeXrzPDwg1UoADP3cSUBp6Nzr
         pqrXpG5M1vG3T8NT2/JWbO2URs01uSGmeIaQPp3YexsU0BdvrGIhU4agGTmpJe+CFcxG
         7oRSeofL3sDoqtDKFZiyOPs9ehluvD/GznghRoVx4dJnnEhAy3ESYDIJLixSBkx3S15M
         Bl5MN8rEFZHwy8XADvNUzuWjFhP7FCS37vxwjeRXQhWN2UC+oHBhKT/gIj9uQBNHMbSo
         +IoH2xzko/nzjriGQilgRWs8F/mUZrxwjuYxB0drCKVtwrNm5fxlO/gwplyYLUsetgSc
         SR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384573; x=1773989373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AVmFAe9Ik/fE0LX/BsA8E1wHztxhMYSWxglI3gqndc=;
        b=T5n0D5ESnWY2rJ3QQWZrvoAQt+g3aq8o87rZG74zPGFyRrekoO6dOSAZuYGOOTssVM
         Js8mFkFrkkbBN8lqBAZZsA0+xNXKKViV+ktZHZcCDtlyzbi1e/7mfMEa8KmgZex3MpPu
         D+dhUPsU7b6CAxB12KtLxgSydqw4gloWitHUA35/BYDbYOHjW7MQT71Cimxj/D++CzdY
         l9OrvTjJsZMagYkxI2fRJC2KD0xTGvyBLHe2v/cWPMxrlBp9BQ7Xdm/aLqQpVpWwOA5y
         K1aYMNqxOQLVa1l1IfqRv/PjkIVaqmw6QAGNO57kQi/0qctNI6koQe7yOP223Y+5djOW
         u4XA==
X-Forwarded-Encrypted: i=1; AJvYcCV55VWHiX2DaV3ayZuZgjtGNbr1sLSbiKe+hUxMBH3KIfAbjXciEs0yYYP3ZMpjpkJC2d3HNEQdCIO6ST42@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUj0T744xphogZwmtM80sXfqPc3Io5mT0rHhKNQqX52U1SmjR
	Iz1eaB+bxauxwu6nDX30hFthvrd4RvJpKuYLr3OM3poX6FrnJZy6glJUPEk3Cj+xD3EXBem6/2w
	yIBKoYwBXVrFfhbM+dqvvlMswmcfll/9CyHdn8cTJUn0qxkk+pZYLNwTY7GYvZua2sZAs
X-Gm-Gg: ATEYQzwd9xRu7RaxN6EjNkhcqjCEvoMit+6KGO9ZBTZOw9Tk9db3OgLTPTqjB8cylNC
	6wC//WHSRLiKPk+BHXJNqe12Tl96D5XRaI+n6b9YtwLSnGrwgdfXQPRU7zIW7Yt3LCkm9knbdXG
	8h1HJ3WbEgEOflUYFWEdXP4BN1B6g7ToBNzeksMq2toQhVipwHHQKGzZVC4/2E5n6O6I4cHur6+
	iEWeiFV0yk4rviE/9AeL+k6qi3yJ1B6j1PQIbrQHkSTk2qHnOVWL7Sp9SoX8LRW0hQ+4HO2cILI
	KG/irCCL8hK2bp2NtZND35BD4KONagQBTYVfjFxcGc5YoPsc6J9PqGgxuzMwwHvSApwYIg5fc7o
	ykl6Qd0vEggLR7x0lfJGJqOw0v6oKB/OHCuBnIa2Kef65n90=
X-Received: by 2002:a05:6a21:6197:b0:398:afdf:3463 with SMTP id adf61e73a8af0-398ece212b3mr1705946637.70.1773384573487;
        Thu, 12 Mar 2026 23:49:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:6197:b0:398:afdf:3463 with SMTP id adf61e73a8af0-398ece212b3mr1705918637.70.1773384572883;
        Thu, 12 Mar 2026 23:49:32 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97b41dsm936160a12.5.2026.03.12.23.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:49:32 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/3] dmaengine: Add batched scatter-gather DMA support
Date: Fri, 13 Mar 2026 12:19:24 +0530
Message-Id: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHSzs2kC/1WNwQ6CMBBEf4Xs2ZJuUTCe/A9DCJYFNqFUu0A0h
 H+34snLJG+SebOCUGASuCQrBFpY2I8R8JCA7euxI8VNZDDa5Br1WTWurtw8TFxJp6zBIj/prMi
 sgTh5BGr5tetuZeSeZfLhvdsX/LY/kdHZv2hBpRUezT2eEBXYXr1I+pzrwXrn0hhQbtv2AQN8W
 02vAAAA
X-Change-ID: 20260108-dma_multi_sg-c217650373c2
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773384567; l=2678;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=pvlk2gOPkIN+ITxicWXFZ618jc3EqUbu9jfuBJT+Pj8=;
 b=CJsyKHGdctf6eMe9FYY1OpAZhEpTLB18Re4kWKHiZ0+TKe0AV4X/h4B2qhl75oyvumt11XvKa
 T/JaOl/TpY9ArzGxVUQ0/u9VR0ZLcx4FAaInJyDJiUPuxoHqhv3XDfC
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: QAJYdv-kGF4DxPlzySw7X8mSF8dweHDJ
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3b37e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=f6ynY6_RdjVN_4bGfK8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MiBTYWx0ZWRfX17iSx7EkOhPe
 xnlp01l4UKae7oI1l+EhJ+Q9GYhzMK30Nyi/ulL5sV2lTMqxxwfE77IXD9mNCm6OsI36pB1bscV
 Z+5lNgsr8f4AoR1WRb2sroMO7UU60tBj+N5/NVAynocYD5EwUxVkshcr6C3gTUqujwEvWHKcoO9
 gnLc96Sv+DULPsTC8dH7xV2FWy784sMhKyn+CaZvU2HESztS9uL75L5PcFjOAFi1L7tIYfUQBbf
 5H9FYYJjSsKPnGiZLaSNQJWOLqNFdJKafk4P8snSr5QNZahKaNu3cM4vXpajbf20C4d93ZT21r4
 JWGUufpt3Tjxdzy2vrNeK/9qUvk4bbQxwXsTX+n3QRtP1ElcrlWE8WgwtOoVxMUModQF07G7mIv
 KvVKNgDBau5IX398KvMf84KDaBUtyYkA0qOgtHimro3WP5mRaI6/kEwBYn9dEqseVqRVdzUx18x
 VEjLbhuyQBDH0nMLxIg==
X-Proofpoint-ORIG-GUID: QAJYdv-kGF4DxPlzySw7X8mSF8dweHDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130052
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-97323-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D54427E63F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Synopsys DesignWare eDMA IP supports a linked-list (LL) mode where
each LL item carries independent source and destination addresses. This
allows multiple independent memory transfers to be described in a single
linked list and submitted to the hardware as one DMA transaction, without
any CPU intervention between items. The IP processes LL items strictly
in order, guaranteeing that scatter-gather entries are never reordered.

This series leverages that hardware capability to introduce a new
dmaengine API — dmaengine_prep_batch_sg_dma() — for batching multiple
independent buffers into a single DMA transaction. Each scatter-gather
entry specifies both its own source (dma_address) and destination
(dma_dst_address), enabling the eDMA hardware to process them as a
single linked-list transaction.

The primary use case is MHI endpoint ring caching. When an MHI ring
wraps around, data spans two non-contiguous memory regions (tail and
head portions). Previously this required two separate DMA transactions
with two interrupts. With this series, both regions are submitted as a
single batched transaction, reducing submission overhead and interrupt
count.

The series includes:
1. Core DMA engine API and DW eDMA driver implementation
2. PCI EPF MHI driver support for batched transfers
3. MHI endpoint ring caching optimization using batched reads

Performance Benefits:
--------------------
- Reduced DMA submission overhead for multiple transfers
- Better hardware utilization through batched operations
- Lower latency for ring wraparound scenarios

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (3):
      dmaengine: Add multi-buffer support in single DMA transfer
      PCI: epf-mhi: Add batched DMA read support
      bus: mhi: ep: Use batched read for ring caching

 drivers/bus/mhi/ep/ring.c                    |  43 +++++-----
 drivers/dma/dw-edma/Kconfig                  |   1 +
 drivers/dma/dw-edma/dw-edma-core.c           |  40 ++++++++-
 drivers/dma/dw-edma/dw-edma-core.h           |   3 +-
 drivers/pci/endpoint/functions/Kconfig       |   1 +
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 120 +++++++++++++++++++++++++++
 include/linux/dmaengine.h                    |  29 ++++++-
 include/linux/mhi_ep.h                       |   3 +
 include/linux/scatterlist.h                  |   7 ++
 kernel/dma/Kconfig                           |   3 +
 10 files changed, 224 insertions(+), 26 deletions(-)
---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20260108-dma_multi_sg-c217650373c2

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


