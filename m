Return-Path: <linux-arm-msm+bounces-90193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yELHD6whcmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:10:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 994196712B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBFE3904893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FAC421A0A;
	Thu, 22 Jan 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgegzRcA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442183ED10B;
	Thu, 22 Jan 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083854; cv=none; b=TeDK8FRG07qdMwuEuOHU9gX65pcgl3SkHNAuo9ylF12/0oaoGmW539Q31hiNXZfga/WzgbmT1FizNavdsqVXDbcigXZ7wGnsIeMxi12oRtE57QU1nA2XzLvCMjRV18MJX6+oeMcfWf3M+E4gELoQqQN9lhrRti5O/Rh0k7xB6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083854; c=relaxed/simple;
	bh=jFeL5oqa2JoXzJDPUOQQU09RWMQWx1irVoFqHXhTcdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMo3d2KYZvSsGUNBd7281svc3PK/dd29ZGw5BnDK8bHZ9wiPoU0+t/RLIvf6HfNqsAUuQW5zxnoQlhBMMe2yVeXXw59GJVz++vggB4rL1HW7T5idumy4VsVSJuBx0TqYlE5p1zI2EDR81j8R2/Trcnc4yNtVo727Vfexu4eJ+Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgegzRcA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B70EC19423;
	Thu, 22 Jan 2026 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083853;
	bh=jFeL5oqa2JoXzJDPUOQQU09RWMQWx1irVoFqHXhTcdM=;
	h=From:To:Cc:Subject:Date:From;
	b=QgegzRcAtu4CuufeKFSd8dlWqjx+hK0Q+spSQFt4S8erOoXzF4ETa1oStY1WrQNFN
	 kg98DM+3MLhwQrxa6VkesvKSFco9WYya9WYdPDbmgtvLbIlsaS7e6oN1dL+4AkoS9D
	 HKHI57VW6pQVMaJQuoiCvQMIdkre24iPl9obtLiGAeh+xTXb2vnpFOoIt+2/2Bmc0J
	 RMFvl8toB78C+sKa9uUGQPGix35wEG9hax8g8jGbijHkc0jVk8pP+n9vld+fqnjkkE
	 M8mq/AAoXnIM9XD0Y9JcB1K8JDXsG3VMn8ntj8mE/f08pOBXJrGzbCKPs0pXUpmk91
	 57X8i/e8Ek3ng==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Date: Thu, 22 Jan 2026 17:40:39 +0530
Message-ID: <20260122121042.579270-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90193-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 994196712B
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Fix IOMMU DT propeties for GPU, display and video peripherals via
dropping SMMU stream IDs which relates to secure context bank.

This problem only surfaced when the Gunyah based firmware stack is
ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
as a fault by Gunyah hypervisor which were previously ignored by QHEE
hypervisor.

The DT changes should be backwards compatible with legacy QHEE based
firmware stack too.

Changes in v3:
---
- Fixed up maximum value for iommus property in DT bindings instead
  of adding the minimum value as that places implicit ordering
  requirements.
- Collected further review tag for patch #3

Changes in v2:
---
- Dropped Gunyah related reserved memory requirement changes
- Added DT bindings changes related to IOMMU property fixups
- Collected review tags for the DT changes

Sumit Garg (3):
  dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
  dt-bindings: media: venus: Fix iommus property
  arm64: dts: qcom: agatti: Fix IOMMU DT properties

 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       |  6 ++----
 .../devicetree/bindings/media/qcom,qcm2290-venus.yaml |  7 ++-----
 arch/arm64/boot/dts/qcom/agatti.dtsi                  | 11 +++--------
 3 files changed, 7 insertions(+), 17 deletions(-)

-- 
2.51.0


