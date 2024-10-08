Return-Path: <linux-arm-msm+bounces-33523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0B994660
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7B128A230
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8508B18CC13;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCBUWLyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038C1D12EB
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386224; cv=none; b=QTGpLlAeqWSDqwdoMD+BzZ6J42i+vYv6paYmG5fruc+8+EKZ8vX1aigyAv6aWeyd40UqdQ58lEagMUMhkec4K1g2XYypijuR/Fri6M3w2G3qu0FafjxmLcQyPSpv4M9k28RkNdIfj7Lpgr+JffC6M/nvllzHHPfmknVNVfGQ+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386224; c=relaxed/simple;
	bh=SriKfHfhoKdNS3/P6FDcBxmjpvDM1p0JnqL9IBCCw0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VuET/YzFBbqregIRkQ7CMZItK/6LoS7JBoHYzgwl3NHI3caPqRAtMadmUapjTxrcG5OHmYl9d2AOO2RuF3RPFiGVAmLVOw1ijx1/aTNHFI9Oypo/amHUWMEmu1xsQRVQvts/ldGZZ5TNHgMeAytBV3MTzVadMnUzQOum/TUMBgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCBUWLyX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35C85C4CECC;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728386224;
	bh=SriKfHfhoKdNS3/P6FDcBxmjpvDM1p0JnqL9IBCCw0Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NCBUWLyXL2ICRoAkuoN3GQJ9aOEEC3G5iHe+2YiW3QtcqkvQAGy3uXqNWRUHaC2to
	 GBJAqPp2pCFJzMH2csKPf8ikNrXqIfBM38dph0BqGqRhFH/oOz4wu2C5/iQNB2HdAc
	 w0t9oTxfqAcvSZWSeZV7AjUSR/M1DXeQS7kh4PlhWmuecbcYkxf114wPwL+ru/b9vp
	 dfxb9b6Zts0g4A1lmzQxHL5Nf/+rYyM1uIDdwA90ro/64s9an1FotRsXw03PI6gb5t
	 Zig6NUzBDOveHT7ncSMiB/WoE8tEIzEbNhmPALjLzcGRrab7GBbD+ESBoPbZMdwYSt
	 URsRUAKAAraOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCCFCEF152;
	Tue,  8 Oct 2024 11:17:04 +0000 (UTC)
From: Renjiang Han via B4 Relay <devnull+quic_renjiang.quicinc.com@kernel.org>
Subject: [PATCH 0/2] media: venus: enable venus support on qcs615
Date: Tue, 08 Oct 2024 16:46:33 +0530
Message-Id: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJIUBWcC/x3MTQqAIBBA4avIrBM0U6KrRIQ5U82mH4UIxLsnL
 b/FexkSRaYEg8gQ6eHE51GhGwFh98dGkrEaWtV2WqleesT5DslpOz+MdErUhpRbnAlkoWZXpJX
 ffzlOpXy8HfYoYgAAAA==
X-Change-ID: 20241008-add_qcs615_video-d13e06b63ce5
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: kernel@quicinc.com, Renjiang Han <quic_renjiang@quicinc.com>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728386222; l=837;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=SriKfHfhoKdNS3/P6FDcBxmjpvDM1p0JnqL9IBCCw0Y=;
 b=H9WCnPW5vLCUv4vXCtd3MGtznp73rC5phpIg+6N/Idwxqs51T1ekpZwvG85hcWxOcFWYM9bhw
 b2FTg1F9IIFCM2fnjuFuj3pKAwu9vvHOvRUhJTjbkNtXnYTNV9QE6U1
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Endpoint-Received: by B4 Relay for quic_renjiang@quicinc.com/20241001
 with auth_id=235
X-Original-From: Renjiang Han <quic_renjiang@quicinc.com>
Reply-To: quic_renjiang@quicinc.com

This series enables support for 4xx venus encode/decode on qcs615.

This DT change is dependent on [1]dts

[1]
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Renjiang Han (2):
      arm64: dts: qcom: add video DT for qcs615
      media: venus: core: add qcs615 DT compatible and resource data

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 75 ++++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c | 50 +++++++++++++++++++++
 3 files changed, 137 insertions(+)
---
base-commit: 9e5393d83e3a5cae58bac6d511371b21a9117302
change-id: 20241008-add_qcs615_video-d13e06b63ce5

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>



