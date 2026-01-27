Return-Path: <linux-arm-msm+bounces-90651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFw1LmhieGmrpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:59:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774F908E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FFDA301D681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 06:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3204532C33A;
	Tue, 27 Jan 2026 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="FvIG/ctt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3274.qiye.163.com (mail-m3274.qiye.163.com [220.197.32.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509228F5B;
	Tue, 27 Jan 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497141; cv=none; b=hCMgmYSdYoRqoglynFSj/Bn9mv15WhLA4H+XBxhPR5j1KzBR0x2tfsThzIC05xG44DQaBonDH/S4ZJYPa9lOzqGGgyK3SFWg7g1K7L73K/c2gv+X2EKFzp/G38ZtQskpu+pt4qAgFo06oMFBFybIRcPkVigRByxiXiqIRoiCiiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497141; c=relaxed/simple;
	bh=iQeFSl9uFu9SYuWhe7ZE7oDkxvwKxI56/SIHXX7NCS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngb0ooZqmgGRH8FDZXw5GfstjLslzlzV7jh4Lez9ZNdriYYNx2Up5t1GDf/yIbduYGv2qdAn8+mztAd58LPnqvDBSPh/K5oXdu3qBhe6WLtjM/MEM5Ci1do+GhWBay1geNAB34ChRyCQZneNXL5MmLR2AigiOUiVcq8txfhDbbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=FvIG/ctt; arc=none smtp.client-ip=220.197.32.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3219cb6b6;
	Tue, 27 Jan 2026 14:58:48 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 27 Jan 2026 14:58:13 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use DSI port B
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rubikpi-next-20260116-v1-3-0286c75150c5@thundersoft.com>
References: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
In-Reply-To: <20260127-rubikpi-next-20260116-v1-0-0286c75150c5@thundersoft.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769497120; l=874;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=iQeFSl9uFu9SYuWhe7ZE7oDkxvwKxI56/SIHXX7NCS4=;
 b=ozw6cgKjPRMaM15YTqNlVX9fhXev9DaKUhHTwkof7jfprQP79CWQ/ZxLzlz5WNeRgxXvug3aO
 n5W2t2jqgiEBbneHqb2wKoJ0un3WiUYnnl1/UOB/PZlqqNuhi63LZk7
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9bfe3f6c9109d5kunm45ebbc0d840bb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCThkZVk5JTx1LSx9IGExMH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=FvIG/cttWrhzrnN1h3yTjMFKzMlmKLQem1GXwjpJQVWydLGZLxztQW1MD8ZJIVuaNhYG6TLQUgRAQjlZOT1tKpVnCX5v1YuGE79YYqykSXgVAuAN7+ActZnxYTb4DlKc1Tsv/DCPmY9frQMWb5nFP7nzLSOWK+JebyD47qpEreA=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=hHtMcV8iObgzkyDHvyhdHK0yD4OWru5iEfX7HVh66Uk=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90651-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.39:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6774F908E5
X-Rspamd-Action: no action

The LT9611 HDMI bridge on RubikPi3 is connected to DSI port B. Add
lontium,dsi-port-b property to configure the correct input port.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0b64a0b91202..0b27c5343271 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -751,6 +751,8 @@ lt9611_codec: hdmi-bridge@39 {
 			    <&lt9611_rst_pin>;
 		pinctrl-names = "default";
 
+		lontium,dsi-port-b;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.43.0


