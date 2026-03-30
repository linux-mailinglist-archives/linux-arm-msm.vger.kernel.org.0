Return-Path: <linux-arm-msm+bounces-100731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJpVJZxJymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:59:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F2358BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC0D63009CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EB93815F2;
	Mon, 30 Mar 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ued8Ge8B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzIWzF6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250C3ACA7A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864386; cv=none; b=RKaGgVJl5bf0NjbkIGK/AFKFBs58g4IW+HOF9jbathJsWjOdWmPKk5a+ZwKIVFTxlY/4QDseLte0TeqbDD7ifeWRjpdt5+dqJDJQqqHPPspeFcYjpXs/xVNehniSQl+4RosaNR4assKg0QLBw9yZiPtWDcPwB3fGiVWydhAo4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864386; c=relaxed/simple;
	bh=fNTiS/H2gUkjedeL15QTSU/7mML3BWEe0xtBdBQqtlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rWGD9b0SFi5zLWMIyOT1ZqX5GRvF9RexygbDwFx+Ub5LhHafE/rWPPYvUpdnxGgMpIND2kUjgv8jrqC/Pu/ZbrdGG9/d2zdujRGsdqlTnu5yR3qlQ0fUXfkQAmsNtHKtN/2NSfhOAWVFS8G34pn5d/HFOEs1zYrQ3QitvgLxMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ued8Ge8B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzIWzF6i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8PwjD2458297
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gXUaaYBTPyVGwfzrBTCeQK
	7umpGaf7wY4Ve1YT9tETI=; b=Ued8Ge8BNwaUGjw1r8CHB6/DDxkyj4EIYg7Ksb
	U2+Qdko2lXbtWL0G5nY8tRGYVMHppmidMPwq9/bktLwdPOodBNeB+ECz66sRQNZb
	HFPM4w9V9Rwv8+KqJmNjdMSzCiiU/NlyUkzpM9PLWX7/8cj6Nl8emtAVWKLYP+XV
	ghE2HkT5ZNkIM2UoZlG0auxBIg4f50r6uUK2zshFsxdc9ubPNcilMeAoqOTkIARz
	+t1KEq7kL3AWDhokM87SvpOduBvQITwB3scDDzYAwf7LEi+bWjKOeC6VDiiMZvuJ
	9C0YQkU3euB5GORrpTqO+3aqLbZM5Ds7dvyqScFIl1A4h/yQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrc1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:53:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so14404185ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864383; x=1775469183; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXUaaYBTPyVGwfzrBTCeQK7umpGaf7wY4Ve1YT9tETI=;
        b=gzIWzF6iUcGdz+HfDUhcI+6Xq2CPdlCDzcYoJz91yB8F+BtGuBfQTxW8Yy6aWdmP4F
         X/u9QPl1SufFjtnfgMhHEGrJ6pUBy0C69rqfTbCm3SCjBxjz2UZ+NFPGKYQBI+/i/Rm2
         F7t5gbSZ4dF+ZMkw4XulW4vROblovxeEVw2jYaIbGLrdh0/JS1LcEj5f41RTvwoO41mX
         So1OkyI8HmoVr0itqFkWYGkxntj5Dkks7cgecZrgQD15kq/qOqGRxQnV543iegVnXDrl
         Whic9DxX52da093y/82hkXnerwsCEr4goTEXGfHW3Ekrfn5cKUZLEO4+eBg5Ja0Eyak0
         uNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864383; x=1775469183;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXUaaYBTPyVGwfzrBTCeQK7umpGaf7wY4Ve1YT9tETI=;
        b=pYz8A3ne9aM222udFrvBu3DJrYf6j81qiM6eIxk0G2bNvyrIBjDUh+xCtq166i87Ds
         CvO+WVFmF5VJuA00/KSuvRHTaJsZMscz43l7daiqjlGNuoHkty8Yoa7wewHGEeb0JUBx
         hphPgXmLHwO7SxJiE3qEslpdAQBjQp7Pr4+a5hEsHtz8poSsSVauOMlZT7/XgmhuzekU
         Z32CBN4F8hn8m2tb+BUfFJkxn1G5ysogn7Kc553/btGXH3NJ/P/vEu5w/wX/JfZOcyWo
         9cnvEl5QNooCCgnWdDVBdeHAFXBtfhoqKFBws4NhGYUxI8r5YtEfr2Xq1G5ZzjqEB/Jx
         PE3Q==
X-Gm-Message-State: AOJu0YxLvdYiSP5MBwnr2G5kJB4EI7Q9Guu5ayDik5Vuvt+PJiBQxrZ7
	Db0VkfAtXyk0vxTtlj1D+oxlyx0GrzSvysiFe4o6s5Utiwxcy3l5L8kkFxqDaj0hGgJh6bKCd+T
	6vuLjmMoAji4k5RRhUQWCz3UM205egN5W/07YhBMd1Fd/RQSKtqB4e03OjpNjyIyzRQ3w
X-Gm-Gg: ATEYQzyZe7oFUPYAAG9n8A0a59hHEaCQPQ7tvy2RzFjNnx2//JUmbwXqZz7GrWtsm5z
	XYEYS9F7N6NvNJZwIGvPl/52oloj2cW8pMfDMO95l51gPfemFrV9SsR3sDjzACfWjIFl2fpi8h/
	in7/RmfbK/FTjSsL2C4NrLQ8Xeykw504gg6F5nm9NIxMWmnS4IT6++sSbohwJF2bgJnuRYcJ3Vi
	7Jwk0tgD1Lq973aVpXWWtxfUvQAp5O5VtI4aGrB0HIo9ZmVkX4+4hOJi9Yh5PmTGeeKh3dMM8rw
	sFbrMBxfVe0GyYWkOxD7zPJC2mioypwUmuW/il+aICMijgI2JqVz5oofx1X9i/fRhTEXcjwPnAS
	cUVhr6q2ixbsZxkvDS4pY3ixzJzRS/zMD/sFQ+NAPS8y+kAJB
X-Received: by 2002:a17:903:8c4:b0:2b2:5091:1c1c with SMTP id d9443c01a7336-2b250912298mr36178125ad.18.1774864383068;
        Mon, 30 Mar 2026 02:53:03 -0700 (PDT)
X-Received: by 2002:a17:903:8c4:b0:2b2:5091:1c1c with SMTP id d9443c01a7336-2b250912298mr36177955ad.18.1774864382537;
        Mon, 30 Mar 2026 02:53:02 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm94134125ad.78.2026.03.30.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:53:02 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:22:44 +0530
Subject: [PATCH v3] drm/msm: default separate_gpu_kms to auto selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-separate_gpu_kms-v3-1-a3e54b9c9417@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOtHymkC/23OQQ6CMBAF0KuYri2hU6TgynsYQwpMoVEottBoC
 He34MIY3UzyJ/lvZiYOrUZHjruZWPTaadOHwPc7UrWyb5DqOmQCMaQxZyl1OEgrRyyaYSqunaN
 xUkOlkjpnCCTUBotKPzbyfAm51W409rld8GzdvjEAvmL4hXlGGcUMOEOhWJodTsa56D7JW2W6L
 gqDrKaHj8OZ+H3KQ3DKGEQlc1HmCv84y7K8AE/xMeL/AAAA
X-Change-ID: 20260316-separate_gpu_kms-04d2cf4d91e2
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774864377; l=10232;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=fNTiS/H2gUkjedeL15QTSU/7mML3BWEe0xtBdBQqtlg=;
 b=Btm2O22/s5VhxC8DHUlfvFV4Xre388n2HqqyBUe0LyO2602PJHLq51w1MmYWy565DqqvSWhnQ
 iOpAjrQWTpfBYNI00EQwadQ2hVOvwIeR/SmJ4DRCSHK7toCnVGeUUVv
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX7xKgCj+Zs/8k
 92i/50lqPfKT2h8PJxPh7E6/WqMIQrMUkEL5aMTDx7ddm6xx55DfDmw9SfbQw5l5zPvelDMOwB5
 N3pyiJrtm5xlld7dQOu93H9QhhmkW18kpvL8TMTfd9w0AAVI505ClC2N2mKn3myYmZwiutmC6qr
 eiCsiQu1Ptm5ctjRDEnhb931+EtHl7IFuYraV/oM/R8junwqG59H2wXXyk0SiExHvj4IYxTup+c
 Q2aSdnLdMVX4MDO1aw5Rm7iPY+GkcoYt1IO+0g+QMnhnohm3ecQGVuLZb4QQWOz4HtLdQ5Ufnar
 PuMlmcvyuA5E26XqS19BINwaArbYduXQqriuEXIk0SA7Ryz3c5Sa4s07tejl61dETeIWBiEZuAM
 vijKKQMuIwz4VWcJrbL9Dbpam89bJFZqWjxpCLIKAW/BrdYqwC4n9pE9kaWe1Gh0uhUUTrc/cFL
 dGvEd22wXMR4bRCvpmA==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca47ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7nrE9rN0imP4snLddHEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KkgXFSRoE3tj1VGMbigwXvlcu2fqHuVd
X-Proofpoint-ORIG-GUID: KkgXFSRoE3tj1VGMbigwXvlcu2fqHuVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100731-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F35F2358BE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On platforms with multiple display subsystems, such as SA8775P, the GPU
binds to the first display subsystem that probes. This implicit binding
prevents subsequent display subsystems from probing successfully,
breaking multi-display support.

Use the tristate separate_gpu_kms module parameter with the default
value set to auto (-1). In auto mode, the driver selects the binding
behavior based on the number of GPUs and display subsystems. This allows
display subsystems to probe independently when required, while
preserving the existing single-card behavior on simpler systems.

The separate_gpu_kms module parameter has the following semantics:

  -1 (auto, default):
     Select the binding mode based on hardware topology. If exactly one
     GPU and one display subsystem are present, bind them together to
     form a single DRM device. Otherwise, expose the GPU and display
     subsystems as separate DRM devices.

   0:
     Always bind the GPU and display together to form a single DRM
     device.

   1:
     Always expose the GPU and display subsystems as separate DRM
     devices.

Additionally, ensure that display subsystems are always exposed as
separate DRM devices when no recognized Adreno GPU is present,
regardless of the separate_gpu_kms setting.

This ensures correct probing on multi-display platforms without
affecting single-display, single-GPU systems.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Depends on:
  https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/

  When separate_gpu_kms is enabled, the GPU and display drivers are
  probed independently. In this configuration, the Adreno GPU driver
  may no longer be loaded implicitly via the display subsystem.

  The referenced patch adds a MODULE_DEVICE_TABLE() entry for the
  Adreno GPU device, ensuring proper module autoloading based on
  device tree matching. This is required to guarantee that the GPU
  driver is loaded correctly when GPU and display probing are
  decoupled.

Changes in v3:
- Ensure display subsystems are always exposed as separate DRM devices when
  no recognized Adreno GPU is present (!adreno_has_gpu()), regardless of
  separate_gpu_kms setting. (Dmitry)
- Extend auto-selection logic to account for legacy display controllers (MDP4 and MDP5). (Dmitry)
- Rename msm_mdss_count_masters() to msm_mdss_count() to better reflect functionality. (Dmitry)
- Common helper to determine presence of a valid Adreno GPU node, avoiding repeated
  adreno_has_gpu() and availability checks.
- Update commit message to reflect the above behavior.
- Link to v2: https://lore.kernel.org/r/20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com

Changes in v2:
- Drop dependency on Lemans dual-DPU device tree changes as this patch
  works independently (Dmitry)
- Switch separate_gpu_kms to tristate and default to auto mode (Rob)
- Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() for clarity
- Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 14 +++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 14 +++++++
 drivers/gpu/drm/msm/msm_drv.c              | 64 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h              |  8 +++-
 drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++
 6 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4edfe80c5be7..e40648c05797 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -272,7 +272,7 @@ static const struct component_ops a3xx_ops = {
 static int adreno_probe(struct platform_device *pdev)
 {
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
-	    msm_gpu_no_components())
+	    msm_separate_gpu_kms_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 809ca191e9de..409000b739b6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -15,6 +15,20 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
+static const struct of_device_id mdp4_dt_match[];
+int msm_count_mdp4(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdp4_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static int mdp4_hw_init(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 1e3dc9bf9494..086895c9f103 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,6 +19,20 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
+static const struct of_device_id mdp5_dt_match[];
+int msm_count_mdp5(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdp5_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static int mdp5_hw_init(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e5ab1e28851d..e2101c6632ac 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,16 +54,64 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
-module_param(separate_gpu_kms, bool, 0400);
+/*
+ * separate_gpu_kms (tristate):
+ *   -1 (default): decide automatically based on hardware topology. Split devices
+ *                 if there is more than one GPU or more than one display master.
+ *    0: force single DRM device (bind display + GPU)
+ *    1: force separate DRM devices
+ */
+static int separate_gpu_kms = -1;
+MODULE_PARM_DESC(separate_gpu_kms,
+		 "Use separate DRM device for the GPU (-1=auto (default), 0=single DRM device, 1=separate DRM devices)");
+module_param(separate_gpu_kms, int, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-bool msm_gpu_no_components(void)
+static const struct of_device_id msm_gpu_match[];
+static inline bool msm_gpu_node_present(struct device_node *np)
+{
+	return np && of_device_is_available(np) && adreno_has_gpu(np);
+}
+
+static int msm_count_gpus(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, msm_gpu_match) {
+		if (msm_gpu_node_present(np))
+			count++;
+	}
+
+	return count;
+}
+
+static bool msm_separate_gpu_kms_auto(void)
+{
+	int gpus = msm_count_gpus();
+	int display_subsystems = msm_count_mdss() + msm_count_mdp4() + msm_count_mdp5();
+
+	if (gpus <= 0 || display_subsystems <= 0)
+		return false;
+
+	/* If exactly one GPU and one display subsystem single card */
+	return (gpus > 1) || (display_subsystems > 1);
+}
+
+bool msm_separate_gpu_kms_components(void)
 {
-	return separate_gpu_kms;
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, msm_gpu_match);
+	if (!msm_gpu_node_present(np))
+		return true;
+	if (separate_gpu_kms == 1)
+		return true;
+	if (separate_gpu_kms == 0)
+		return false;
+	return msm_separate_gpu_kms_auto();
 }
 
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
@@ -1019,7 +1067,7 @@ static int add_gpu_components(struct device *dev,
 	if (!np)
 		return 0;
 
-	if (of_device_is_available(np) && adreno_has_gpu(np))
+	if (msm_gpu_node_present(np))
 		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
@@ -1030,7 +1078,7 @@ static int add_gpu_components(struct device *dev,
 static int msm_drm_bind(struct device *dev)
 {
 	return msm_drm_init(dev,
-			    msm_gpu_no_components() ?
+			    msm_separate_gpu_kms_components() ?
 				    &msm_kms_driver :
 				    &msm_driver,
 			    NULL);
@@ -1069,7 +1117,7 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	if (!msm_gpu_no_components()) {
+	if (!msm_separate_gpu_kms_components()) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..a977fe7b36b8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -555,6 +555,12 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
-bool msm_gpu_no_components(void);
+bool msm_separate_gpu_kms_components(void);
+
+int msm_count_mdss(void);
+
+int msm_count_mdp4(void);
+
+int msm_count_mdp5(void);
 
 #endif /* __MSM_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..4c788f2647b0 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
+static const struct of_device_id mdss_dt_match[];
+
+int msm_count_mdss(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdss_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-separate_gpu_kms-04d2cf4d91e2

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


