Return-Path: <linux-arm-msm+bounces-104282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPp3HBvw6WnxogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:10:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E924505FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F9F0300CBDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB724377EC7;
	Thu, 23 Apr 2026 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeovaRx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JiowDglY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9162C37756C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938562; cv=none; b=Tc0b66MjUW3eMTtJbz9I1s1zhtG3JlRbmZaCAkJ+nSOkew92p/lgJ+DefjRyFpOwaJxtttUnr9CoGLfkVDmPK3QOlkQw+GUFUxyiso96tfF2GsuXU5gRD5T2Kw94KvBVAnyKx4WmDpdnil4jSMBJS0sHuxVVJ2ToK2dUGZ+oYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938562; c=relaxed/simple;
	bh=hJODFl24L8xrJVFL+o40ttsrmgaKsOOKBfRA9fMFVBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=M5r0qyMd48DhkUkhaS3dAcswXT1j8zQH6HEZJU4+TQoW1DLO4Q4bxbeejj4u+TchxoOTo/8kOBYcOLHWnitm6s+/ZBC3uczZs1wYu64vu3g1V3f3cBa4fwvnWw9fIvTjqsS0wzkRIgrl4m1zDPtsEG7z6SnlX2UddTMVr3MsNP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeovaRx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiowDglY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8toBc179234
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SBrLvxov8RzEUMj28YZTWG
	Q4HpP1x3kOvuEW3FT/Sd0=; b=CeovaRx0W4fRn0yj0D2XxEzfbE1KXzM/O4ffBb
	Hb+QxupCo1yNxcE86lPBaxlv8yaWj6M+xYt3Tc3HB3jUqftPbNLQi6UCG4/zJfTQ
	C32Z75wwVZOq2JE+1zfemivU4/+6WkgqeE2c3losG+WYkMa0hoENGfM/nI7Gel6j
	g3CiVD9zjvm8jnskQNK3nAhea3I/6Qf5aUZk4HMn8o10lFYdLut3mQ83MDw/nZtW
	NueTtlTpKd92qLEIaJSB94pqxvMGM6Eg1IvsIeNBCM9g+l+7UrHLKC+hlX74OABK
	yRKUL7CfRGSjOTtk2m9BZqA7Hk0JiGB5C66yX3/9iUxr0qJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62guv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:02:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7a77b8ec9so5044815ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938560; x=1777543360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBrLvxov8RzEUMj28YZTWGQ4HpP1x3kOvuEW3FT/Sd0=;
        b=JiowDglY2o5HO6vZF4xbxRIkyvipzfGUJcrNiGPUOdhHOxFmtyCZIy6B+ArBFZ82tT
         RK3CXYNtkc/cOrJFynAnhirisFNfabIIeDiXaQUlgwaDxLqliyu+u9/lG0dV3FYVyk3b
         z6BzWu5pb7L2KAXhkPMOYhhYRYbZSccrTXugethag0A9RokcDEsrB2/ldo/6l5el4RYH
         xpppn7IP8EqJv8HW6YkNdw35r7BVF9tUPlEi6jNwnQqDJN+XSJwu5vASiU94Xr3VgA4x
         0SBezU9Acgf3JHWZ1+T6O5BxdcYyhpvp/uJ3kn8SLS7eL2jIYBmTayJvqvKj1j/DWpNt
         jNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938560; x=1777543360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBrLvxov8RzEUMj28YZTWGQ4HpP1x3kOvuEW3FT/Sd0=;
        b=kStAsXBFfWf18AX1DPIo1w14LtS/36nR7ob9lH/Mv4VPvJmgJF/5XZglEGBV/uPFNq
         CToqLUIh4NBRFnqauDy4RpV6o20Evb3JnFZ0i764/DCmZ5W+xoMGnV/3df5pIajFBGrx
         2O7JHT4IUmEbSeonPOP0Wp/9oF4LnDXLGjkBJEBKoMxL/dLBN9hMWNahh+eUuVCTThQN
         UQINlfcOfDWOXY0K+okt/7rhxyLIK1y5B2fJMnC4n6HNt9309v3tBfTDdfk7RkDBXzVw
         jEui5kHfLS5aZeVAycJQxSzIntO1SEuUgbcziimixqtcEt7JZFssEm4KgpKGLP6r+TUP
         BsAw==
X-Forwarded-Encrypted: i=1; AFNElJ/mxTMjIDGu3IZJwKZswUF1TU2tIXbLx7TpMpBYLcuJaDFGUNYfwqA5FFbuojSllSMrN4BdMG8o+aLt5uH0@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7AxL39nevj4NdnMl+CekoRWNXNAPJu1VXLDgfm3jrcAMe+Xz
	wvcbZjEV9poqjCLapgEUWmRdfYnawXoYi+pROmnafp5FW9AKTRRbCkT0NYLuxA8j9Iq8HaO+ODg
	5tLM3254AYeAeRnDf4y9NdQ8S4VPyQHMi97uJYMmenBtd7CnVFnlEKRw75aC+49LEeUoD
X-Gm-Gg: AeBDievh+PNfpi+HTnyzjpZ7wss8qlRCav6QR0oHZ/0rTXyeVe2hqYvnkeHbwWDpdM3
	d4HJy8jWLjoQ+lWAid6Vr8AIJp/+KtJCr7yQUV2Zs3aP+JCINuMYFqc4pO5zvU4eOmZFu7NMklH
	+PuE5/l5YhY6dF31lA4dF0msAVMFCKplTjOR7WSBlAQ/lnog2zjt8NkFDrHwT4MZyc6Cs6rSxCx
	Rjkm+RD44lzb8RiV3ZNPGa3B+a8BnFOvcgIX0/wozQUPCwaNZPIWvIFwgPDu1f/2ccK2g1TGjr2
	yT+nJDldl8kFKjPWGv5g6+1A2PL4FqzqtLx0sl4EVlRItRWcDaEGX4R8tfLEsVZu5rpKJCdsDWp
	tbS/2axZFWzb2ynS1Ws1SBDGUxCOMlyyvKs6gOQhSyVosECmCAUWFUyCvGxlgtGM=
X-Received: by 2002:a17:903:3204:b0:2b7:895f:407b with SMTP id d9443c01a7336-2b7895f4214mr101857865ad.21.1776938559982;
        Thu, 23 Apr 2026 03:02:39 -0700 (PDT)
X-Received: by 2002:a17:903:3204:b0:2b7:895f:407b with SMTP id d9443c01a7336-2b7895f4214mr101857205ad.21.1776938559257;
        Thu, 23 Apr 2026 03:02:39 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab29398sm194785095ad.66.2026.04.23.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:02:38 -0700 (PDT)
From: bibek.patro@oss.qualcomm.com
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
Date: Thu, 23 Apr 2026 15:32:30 +0530
Message-Id: <20260423100230.3462214-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lbG1bv0apIdlp9wrTNhUQOXjzZwA0EpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5OCBTYWx0ZWRfX5NluuF3F/1EH
 /bl91TXlk6AYLwiu0eP/Gg+QKGyx67dBcvCXH7Q1P+XrH842qeeSQPiNvCsOxpR8KqIa7iEX0NN
 6BGhDIsweA6un9Es0mL/YfsDcL8WF3jVjrnCI2jTbWRtYEA4sdCjUjc9+51U/r84+Alj/aw3D71
 i/2TPOKk/FeiEcQc/horr5hkSOvya1Iaq9Rw34DCL5YBOob5kbkfzw3QTVD5VPhSmFZPxVCkQ/5
 ZYrjMmOCaf1aQpmhuk9J4w0MI0CwPNG6hgA6Lo/UpTSXpyE60aFvVyQeqLqCXAkRWsHM35hRdhe
 D1koKQOCXQs64rMW8w6UDbviA923PkwxZe0vnB89Nc927M+VNVgSLYz4l9eNf3xUhJLSS/Di61j
 jUmOXIiGeZh/a0NN7cYP9ktP6v2GMk+e1DnNUyVORllv8fubVdIhtIJSUSdWx6pkgSP6ucz3Hf+
 oqN4emZ2UN16TkyE6fw==
X-Proofpoint-ORIG-GUID: lbG1bv0apIdlp9wrTNhUQOXjzZwA0EpW
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69e9ee40 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCvnzbEyROO2_-PIDOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230098
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104282-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.3:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13E924505FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
the compatible string for applying ACTLR prefetch settings to FastRPC
devices. However, "qcom,fastrpc" is the compatible string for the parent
rpmsg channel node, which is not an IOMMU client — it carries no
"iommus" property in the device tree and is never attached to an SMMU
context bank.

The actual IOMMU clients are the compute context bank (CB) child nodes,
which use the compatible string "qcom,fastrpc-compute-cb". These nodes
carry the "iommus" property and are probed by fastrpc_cb_driver via
fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
each FastRPC session. The device tree structure is:

  fastrpc {
      compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
      ...
      compute-cb@3 {
          compatible = "qcom,fastrpc-compute-cb";
          iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
      };
  };

Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
device being attached to the SMMU context bank, the "qcom,fastrpc"
entry was never matching any device. As a result, the ACTLR prefetch
settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
for FastRPC compute context banks.

Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
in the match table so that the ACTLR settings are correctly applied
to the compute CB devices that are the true IOMMU clients.

Assisted-by: Claude:claude-sonnet-4-6
Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---

While there is an ongoing discussion [1] on how to differentiate ACTLR
prefetch settings between compute DSP and audio DSP fastrpc devices, it
is necessary to first fix the compatible string to
"qcom,fastrpc-compute-cb".
Both compute DSP and audio DSP fastrpc nodes use this compatible string,
so both will receive the ACTLR settings after this fix. However, for
audio DSP devices the effect remains the same as the current
state since they do not actively use prefetch — the write is effectively
a NOP for them. The fix is meaningful for compute DSP devices, which
actively use prefetch and were previously being silently skipped.

[1]:
https://lore.kernel.org/all/9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com/


v1->v2:
  - Collect "Reviewed-by" tags.
  - Address nit on "Assisted-by" tags format.
  - [v1]:
    https://lore.kernel.org/all/20260408130825.3268733-1-bibek.patro@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..2d006049dd61 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -39,7 +39,7 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
-	{ .compatible = "qcom,fastrpc",
+	{ .compatible = "qcom,fastrpc-compute-cb",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
--
2.34.1


