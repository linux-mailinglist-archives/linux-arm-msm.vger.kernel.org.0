Return-Path: <linux-arm-msm+bounces-102323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNjwN0ZU1mm8DQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4B3BCA8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5352A300EF76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCD93CAE9A;
	Wed,  8 Apr 2026 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOQLOC4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIErUD+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067853815E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653717; cv=none; b=dTxKMbcQatRXq+GGZBrsWUbcJXjWs2Oe/R2/iWAiBsK90g+LK7Wazmy9nhdqmTR+zqAyGjpTyozwez88aWL5cRgPT/zJTBCgXCaVJVIobptRbtrcgodDXZIUTTthmNWUhHbQU3lv2+teJntxc7QiBzPlc7h3rftAciGSGhDyltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653717; c=relaxed/simple;
	bh=KQwk0Mdce+W21y7dALQ2Q9dpKAvtJUjSQiWHRa+1mjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=s+/9plK3Ru4TRDZFoXvNVx2UF3BOZPQthJV3Ht0JUYEdVkt5Mpv7gG+Fojk19mXA+vvp9INVi1aBJN7fLclZUXOirObrxOqZVu4TvM8/V7W86TLQCbb8ZH4RFcyzEs7hFNnVlyBJJArjfRWKpI+awiDLSA8npuu30TUSd2qxiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOQLOC4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIErUD+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638B2TFa3363716
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HntEs+8pzBI+y7qt7t4W2U
	rvZTm4MrVZ9wGejJw7xFA=; b=hOQLOC4Pqd9JJMAXOHmewoVLftRrhHPEDd1v17
	/ttW0cuJGyHHlKIj/bbk+ZTexlZVNa2np9A3PRrbFSU3YhqVR0i3MiOZXWMHEfit
	h9KX0UiWjHrhZC2Q+JkbpfmXD/okIiIO/wT6vEXmhY1lHzQRBErd5+OJJ8qXfNAA
	xX19ydjn5RP8VNfeyjmV/wZiumJntxPwCloADOXELg3GV/wiN/26ztsnXu2uZEWc
	zSLjdeBnjVLqwQmzDfdLKMLgvma6LK72EgL3s4R9cellB0Ss2jAXjhNbPVmHfR2s
	NbG50WP8K8M9ZJJX6Wdqg4vtX9vI+ORk6JJsXF3lm4QM7HMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkkg2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:08:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f56eso3785382b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775653715; x=1776258515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HntEs+8pzBI+y7qt7t4W2UrvZTm4MrVZ9wGejJw7xFA=;
        b=EIErUD+NHWvMyHfpXOQFLj7npItGPE7gsEfyjEopFTT/0GBw5AfWQn0IUnjlAPCijQ
         v9XZ8KNEqpn052bA2WE2mqkbhev/BSneUKVnxXeDgkDVo5UxNiz3jZkcWSRmbnZbE6zx
         P/hMYQ6z0Pg/516gi56eP0cq44SZYyr/xVTFad+Nsw+9jyfB3OfMoy1HDrEPRQ1/H9+W
         Iyn48FJQld7nrYs7b3U3ZWF2sWzf1K8HOGNwFV6f4G1CWg/E7wOxxJV5SksiOtHOuH2a
         MIVEiXEQrQwchXo7vYpEneqSP4oBM1qsrxuMeLNohYXAnIprn18bY9qe4NapoyZGJ/RS
         zATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653715; x=1776258515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HntEs+8pzBI+y7qt7t4W2UrvZTm4MrVZ9wGejJw7xFA=;
        b=NV8sn/G38JcB/3hEXF5CffKhTWpRvNpVpixao3c9Nv35JSB4wslZK0tTvyCDff2yKR
         z4LgbrnHpS3LySnjDMv0rsryFFW0d9LKh8sCYFAk8XdvJMLddrSAKdoaVmYpeMKqtcD8
         OOIH7Xfv/nrc90ot9+1nMvuJJw575JZPSWfRdEVW62Le9+NRDTfhs6+yaRzXLmM4DhGR
         ED8M0MdP9eORK15v3HlPGJipUjOVqvDeCHjWp4+ANU0UHl4F56JZ+yS72DZqCl1FYgYZ
         Iw0UCgttnT1dLPidE1iZp+ASQZji+Q8OHzDLMBP5pcGazH7w9Ij5g00CU5zx8FQFh/Lf
         8vug==
X-Forwarded-Encrypted: i=1; AJvYcCWzZD5NYI+301VobYfIhKDgNZkp8wLdA0rfBgDWRTekboxQ+xNiva88iAlZ9Uii01G88nOvYPNv3MYsOCkf@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2WVmDknUS257jBC2bkLiY80eUurKA2eG7Ye+hn4uDF+1eohf
	TK8CidUAAi5V0mhnn53wcw51k4sSQm627iT2JTukZHIunfWpjB7lFJv+tjupKs9LiiehFU/148Y
	hgz86AzHctpbqDjhXXHXLxupcdcu9b2n2M1i5L0ONSgfnXBmBIFBY0W7uGShEqM5iy8do
X-Gm-Gg: AeBDieuT6NZWD7Bwm71Hdi6mduq916MBgkGiEAIB14djfINK1A7L+cJRLCcuY+Zwd2Y
	RJH6hljUVkpy6/eW+dP8sI5o5csi1/4Zj8YNgJV/8dv3siS8vzjzozz6I2JG6RG6nzVCdj/ktB1
	JHceBuRdSlkVJ9LpNzV3hAP04cXpDiI/gizmhQa4kBTbvjKbiM4BVjm26Lq1cQHcokOAzQDV5Hu
	erIhsCamjKk9xIlxpnfkNH9kewGHDE97cWaG3qE5JsizT0oCZvwkOl+1qQDFbTY3/VE15NyjGDT
	vxNbgaTqe0iYQADNC90x/K2SqPdY41k2csJSkYnXY+x8LgO/Xitbs20jK8CcN4LeFqzh8orRDQA
	cAaEPy1IyaN1wZ+Xl9tmfYCdm1Rp1dJllAbbKSJlWkafAcp+R+qAL
X-Received: by 2002:a05:6a00:2e85:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82d0da9dca4mr19823928b3a.23.1775653714528;
        Wed, 08 Apr 2026 06:08:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82d0da9dca4mr19823878b3a.23.1775653714032;
        Wed, 08 Apr 2026 06:08:34 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c4126bsm20426192b3a.36.2026.04.08.06.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:08:33 -0700 (PDT)
From: bibek.patro@oss.qualcomm.com
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
Date: Wed,  8 Apr 2026 18:38:25 +0530
Message-Id: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d65353 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCvnzbEyROO2_-PIDOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: bupjZSvRDndKOgKxuC0-opWYBEOSgeRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMSBTYWx0ZWRfXxE2AjC8svhiJ
 Qr+Zp6V4q5LC6CcX7NNkQwJTMc7T//ggWAV5w2txw8HnzPKIlxcowIQ8cuQPTJ4zRdT9BLTGEWR
 hQgJoW7c8pWOxs0EHxF4ZUrlJDEVthCezJ49vGmRFJzF6vkIbNj91OsqBWUf9aNsSl0VbZjtgRY
 UND/dIZyYnFUKRQB1VPpOoeiVQuCmgsGWzrZW0M4ylNprV/9UElU64rYxEkyGH573OsKNIvih1V
 2IZI5ysk54uehVfRJwk6iC1IRB5QQ5EcksUfZTxwTyWmdKvvQYbcuFk8fkFoSABuxRb5LRNN/v5
 kJEvmozIo6xgSTRRmeL2L4DhdJZOCnnPca5ly0c4FjUpfkSL5b4Oo+fv9EWCqfs2xLb1Vg4crPj
 S7KaQJnLqmQeNUdnVg29u+zdEXXjixBbKtj+zMoo9hlUt0W5uez28AINmRKsMI6SK8ItRNvYsgq
 WEj8DPL1Ssnsib/RbJg==
X-Proofpoint-GUID: bupjZSvRDndKOgKxuC0-opWYBEOSgeRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080121
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102323-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41E4B3BCA8D
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

Assisted-by: Anthropic:claude-4-6-sonnet
Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---

While there is an ongoing discussion [1] on how to differentiate ACTLR
prefetch settings between compute DSP and audio DSP fastrpc devices, it
is necessary to first fix the compatible string to "qcom,fastrpc-compute-cb".
Both compute DSP and audio DSP fastrpc nodes use this compatible string,
so both will receive the ACTLR settings after this fix. However, for
audio DSP devices the effect remains the same as the current
state since they do not actively use prefetch — the write is effectively
a NOP for them. The fix is meaningful for compute DSP devices, which
actively use prefetch and were previously being silently skipped.

[1]: https://lore.kernel.org/all/9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com/

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


