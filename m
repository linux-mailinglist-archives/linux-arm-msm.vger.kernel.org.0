Return-Path: <linux-arm-msm+bounces-102559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJVMHIQV2GmlXQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:09:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 787EA3CFCEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31F45300B2BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A01E37418F;
	Thu,  9 Apr 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFBZ5xuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYOEuuzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8593324B2D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768959; cv=none; b=vDWfZB5r7RnVA8uzwJsDepElL5r5IUbl1x7PGDHs/hURIdobrDDpx4U7gdFKRNlToH7wYgx/B6nSWN8GjfpYGVD1n8R235N1i/wo0hskpxuqtUI/jy+22ol19pv3GzsUPwJXtDHFv6e5tEyqb33c1xbEfLwm7EhbVLM+3IRZhC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768959; c=relaxed/simple;
	bh=erUaswB5ye54kieH+UOEq771TGYANCNWFE7ZQjVHVCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RkOVFyNyY/P/beHw22e/RYqh6GzaV9K4eIhp6rCqPapDqq777UlGx1sTzvIEIqqLo45/2ehqtFaMDMIpdFRTFp3AXf/8W/JS0IV88wIA2zd7vxD9TwUsmW93LFn7hD0y2bzRbBswN3w1u+0L9epVvoVHQ2J3lB21OLMpQnOwFK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFBZ5xuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYOEuuzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Ibf1X779506
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2OCPNdCm4Xi/TO/uCPxmIx
	7tVWeB2NJi96SMfjBW9a4=; b=nFBZ5xuHgXkaaDTtqQS5iy4c9A+ZB2Kt2XDjr/
	KmtcscYNchoeh/UN9xHjH12nKydL7EaOU97vXwuxHYKONin45RD1wqQy2I6O7csA
	Togj+TncCOYlnbXLa1FV5PgGh0mwaA6Ci5k2n0MUp+UvLU6dzjcrJhuZmHL02uy0
	H/5U3rK1EuUthxo7w5ef3uPvOz1cFL321vS7vUCIeIJYlkT2th5zhan/PgftOk1r
	jRCrSHAfyvKxHfM9h0yselJVzq72P6y4F8pOueeV1KTrCwTz3VEjGO8URO8Ds5xk
	r74AdRv9NEC7IedyUNc3ps4xzP2OHzhlQI2+6ciYmGAflN8A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hswnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:09:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82d40278103so1087425b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768956; x=1776373756; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OCPNdCm4Xi/TO/uCPxmIx7tVWeB2NJi96SMfjBW9a4=;
        b=jYOEuuzYXlYzBRGk3JHu0DVkVvRgg3F7GyTF2Lxqc7sA9yJJfl8QIjZ8hGdprUuM5i
         hU20L35hJXukTxGJ/ZI7a0h8ROau8oQNXHZeHtx5CAm+kOIol92aUj80p5hMKY2lA44T
         VjjfzzkuEhd7lzENByCvvi7Mhztn5uCxTFTVKLHkuf/nSiqBclXP9P5fPCyh/7ucPreY
         +mLY7kto7OLf6MLMlTLoT81JBzIShCig8/PZD1dZ4QN7Rys5binlPknRbqLIRPukG8Fl
         Sg+GSa1SgecH3ZqZoUxBT1ymoN6hjcd0RqfafPNJW7g3o8HO4e3mZWkeIv8sqRWW2zmX
         fXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768956; x=1776373756;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OCPNdCm4Xi/TO/uCPxmIx7tVWeB2NJi96SMfjBW9a4=;
        b=f52YhVJLpcBcLC+rSat2hFnDHpFui9K3c/21e1IxhpxO6Mv4Fr9KCY77arJoF6ZHYn
         yQ7Mi5aiN8bQK7hGwr0ICUPS2T2SQ1Lt++IJl5sbij/hH8H4rxer8vpsPPETE2c4cwx+
         UYCfWmFTTmDf1jxQnCNggqgjOXLQU3VRCINKfV7ZWvmNrKzpndTUP2R53bj0YnYlVdE4
         lK1bmjrepYiIwQNMyG/FpIbYWpge6Z3zm3Fgc/9x1UW3+It6J1LXzHsqPyS1HsLtUmHX
         imk+AompwiKOjXnB6eWk1IhjAJ6LDmbesMaRc4DUmGDnjx4B7iTfmtFanfY/GPb4UYyB
         G7PA==
X-Gm-Message-State: AOJu0YzSXUxE9T4bie7F0VKj3+Oz1hDVU+ZXI/RG55bO1KHGZNQj5SNC
	dDNR8nVjm9bc7fILI4iI5tnqHKxE904ie8RGnUcuFeKNk3W4tXc97BEz6ORHDxCk1W0wLXoVvS4
	VMNEArjne8GFbKukgZagzGlQu9Tqs8XMKcEdrPudqa3etEpp4RK4PTsD59TpoVrXZpHejUeo1ET
	zR
X-Gm-Gg: AeBDieuFLDVrNoojTULErxxoGwaCG8ZSm3d8FSWuH0KH7DJmuOxIkHYUPscpFZDzLXI
	WJNtS3NDVuksOdFqiRkpuiObmngF8oPKhZUJLBXWDVPxcACXTIgRlAg5rNsPkC0azroMhtagJzD
	tkcG/kuSBwbrwjTmRckizZ6EnFT/uateYQTyrjQ5shLC6oOUpIZEJsevUsUZ5FqrEEnGxH/b9l9
	W3W/bz3Vfc7Ljnkf9jOWQcLh5luzgINaQYgpLUxfmHgq9Qv3IKzSfxx+HhV1GLmd0/MZaxTQZEa
	BJBa3hpmy2hbg+UZ/aDmzQzONi3KhEdfSiXvWfhRQ/QfpGqqG6enuaxE3D242+30wCjKsFO+ESk
	M98wwUH5CsDbWkNwup/BZkkQLM2uAVcvCG4S35wHMVq3Z5A==
X-Received: by 2002:a05:6a00:12cc:b0:82c:eafa:8875 with SMTP id d2e1a72fcca58-82f0c26b33bmr720896b3a.2.1775768956239;
        Thu, 09 Apr 2026 14:09:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cc:b0:82c:eafa:8875 with SMTP id d2e1a72fcca58-82f0c26b33bmr720868b3a.2.1775768955743;
        Thu, 09 Apr 2026 14:09:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm360143b3a.40.2026.04.09.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:09:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 02:38:51 +0530
Subject: [PATCH] arm64: dts: qcom: purwa: Fix GPU IOMMU property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGIV2GkC/zWMywqDMBAAfyXsuQvpIrb1V4qHJG7tHoxpHq0g/
 rtB6XEGZlZIHIUTdGqFyF9JMvsK14sC9zZ+ZJShMpCmVjf6gaHEn8ExFBwyvmRBut3bhqxjsgw
 1C5GrPpbP/uTIn1LP+ZRgTWJ08zRJ7pTnJeP/Dv227Z0i3DyTAAAA
X-Change-ID: 20260409-purwa-gpu-dt-fix-278642bce2be
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775768951; l=3670;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=erUaswB5ye54kieH+UOEq771TGYANCNWFE7ZQjVHVCw=;
 b=/4ek2OLYx2DNvGmMacwdOR5o3QN/UcmXm6eOiq/UWNWOgaSl3N+aJEOXyJqCb89wt3fbKbLQt
 O4bBBndxKKtARdgpvtnGK4L58cFJiyh6fudQ/P1xgtKfR/gubaKyC4q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d8157d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vGxobDzheIaeYMmG048A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4zCfixV48WBbo7svtZUHFPFJTeN6RdaI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfXwZtJadn0ZoDV
 SszU0FR589fC6ruq8SqtWEsgOz3AGdSg2YHTYPnG2bD+olz8lJtfikkoFwNK1RCL9JHQ/ZJClvw
 cx6JJi5ASl/teI+NrRherUpS6BjUaGQwPTsYWwR6NsjGO7RXk9GYm2cR45/mVP3uGRV9Z6DU75n
 feBA3gIRUCNlPQWf1dDkrJi24RasQ+DFOEaMhsJw9SKxoZQjB/xt/X+2pU0tkC7KWJ+YpITPEgN
 askn7fzdtQeHGB+UXYLC0ni4bwlfP7uh56dNY71bbyVOt7Ij4tkB8xLGCk5CAeyNu62J/brfh7a
 Ibsv/qBUcX/+S4vgaAJwM/VbOWC+UBbg0YiOPPheU5CTlV4Q8AFs9oheigWdVRkKwDM/AnfK0aw
 OCfAz5nN+QLfvdNZCRzCgyXYezpc/Bji5v7DvfpfGvoBQGAW8QH6xFmWNA79Ntzwpc/kTTaVcnV
 wCWaobcE47i9tcGJcXw==
X-Proofpoint-GUID: 4zCfixV48WBbo7svtZUHFPFJTeN6RdaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102559-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 787EA3CFCEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Purwa's GPU does not support SID 1, which is typically used for
LPAC-related traffic. Remove SID 1 from the GPU node's iommus property to
accurately describe the hardware. This fixes the splat below, seen with
some versions of Gunyah hypervisor:

  Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
  CPU: 0 UID: 0 PID: 80 Comm: kworker/u33:2 Tainted: G   M
  Tainted: [M]=MACHINE_CHECK
  Hardware name: Qualcomm Technologies, Inc. Purwa IoT EVK (DT)
  Workqueue: events_unbound deferred_probe_work_func
  pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
  pc : arm_smmu_write_s2cr+0x9c/0xbc
  lr : arm_smmu_master_install_s2crs+0x78/0xa4
  sp : ffff80008039b570
  x29: ffff80008039b570 x28: 0000000000000000 x27: ffffaddd62f1ab78
  x26: ffff00080a4ff280 x25: 0000000000000018 x24: ffff00080b896480
  x23: ffff00080ba9b7a0 x22: ffff00080bb05160 x21: 0000000000000000
  x20: 0000000000000000 x19: 0000000000000001 x18: 00000000ffffffff
  x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008039b1d0
  x14: ffff80010039b37d x13: 00746c7561662d74 x12: 0000000000000000
  x11: ffff00080b7fbd98 x10: ffffffffffffffc0 x9 : ffffffffffffffff
  x8 : 0000000000000228 x7 : 0000000000000e87 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : ffff00080a4ff280 x3 : 0000000000000000
  x2 : ffff800082a40c04 x1 : 0000000000000000 x0 : ffff800082a40000
  Call trace:
   arm_smmu_write_s2cr+0x9c/0xbc (P)
   arm_smmu_master_install_s2crs+0x78/0xa4
   arm_smmu_attach_dev+0xb0/0x1d8
   __iommu_device_set_domain+0x84/0x11c
   __iommu_group_set_domain_internal+0x60/0x120
   __iommu_attach_group+0x88/0x9c
   iommu_attach_device+0x6c/0xa0
   msm_iommu_new.part.0+0x84/0xe4 [msm]
   msm_iommu_gpu_new+0x3c/0x104 [msm]
   adreno_iommu_create_vm+0x24/0xc8 [msm]
   a6xx_create_vm+0x48/0x78 [msm]
   msm_gpu_init+0x2d8/0x508 [msm]
   adreno_gpu_init+0x208/0x324 [msm]
   a6xx_gpu_init+0x604/0x8cc [msm]
   adreno_bind+0xb4/0x124 [msm]
   component_bind_all+0x114/0x23c
   msm_drm_init+0x1b0/0x1ec [msm]
   msm_drm_bind+0x30/0x3c [msm]
   try_to_bring_up_aggregate_device+0x164/0x1d0
   __component_add+0xa4/0x16c
   component_add+0x14/0x20
   msm_dp_display_probe_tail+0x4c/0xac [msm]
   msm_dp_auxbus_done_probe+0x14/0x20 [msm]
   dp_aux_ep_probe+0x4c/0xf4 [drm_dp_aux_bus]
   really_probe+0xbc/0x29c
   __driver_probe_device+0x78/0x12c
   driver_probe_device+0x3c/0x15c
   __device_attach_driver+0xb8/0x134
   bus_for_each_drv+0x88/0xe8
   __device_attach+0xa0/0x190
   device_initial_probe+0x50/0x54
   bus_probe_device+0x38/0xa4
   deferred_probe_work_func+0x88/0xc0
   process_one_work+0x148/0x28c
   worker_thread+0x2cc/0x3d4
   kthread+0x12c/0x204
   ret_from_fork+0x10/0x20
  ---[ end trace 0000000000000000 ]---

Fixes: 1aa0b4e36436 ("arm64: dts: qcom: x1p42100: Add GPU support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..5b17840fb62fb2e664837b125d0ed5cf8b272326 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -47,6 +47,8 @@ &gmu {
 &gpu {
 	compatible = "qcom,adreno-43030c00", "qcom,adreno";
 
+	iommus = <&adreno_smmu 0 0x0>;
+
 	nvmem-cells = <&gpu_speed_bin>;
 	nvmem-cell-names = "speed_bin";
 

---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260409-purwa-gpu-dt-fix-278642bce2be

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


