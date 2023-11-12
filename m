Return-Path: <linux-arm-msm+bounces-533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3CD7E9361
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 00:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494501C203A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 23:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808431BDC4;
	Sun, 12 Nov 2023 23:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JEvR2iz4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Jw1Te+uF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17861BDD6
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 23:51:32 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1841FD6
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 15:51:31 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 279D31F383;
	Sun, 12 Nov 2023 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1699833090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jNW7Bzw7TX09brrWz+v1VWayH/XTzhvpfHeCgoFNfzY=;
	b=JEvR2iz4dZ+HMj+FMPvFNqWDqweKp+T9SEHP7zy3kMpXdOMBJq/pDXLlbgSl8NzsJOF7vx
	UCk9MdNhKuCTZccx1qlngK61jDA3pyno19MtwvOB36RnZvDcfyYeBXoVmwExjhORopKKAX
	4/zOrCsmZLMZ77zbRUJ+SOchdFLW7jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1699833090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jNW7Bzw7TX09brrWz+v1VWayH/XTzhvpfHeCgoFNfzY=;
	b=Jw1Te+uFlRS5fsmYZXdESHKuyplaqtc0D8p2PIYRnTgt7xUQbSc81l7n2cJ6lCfCrtXQWh
	wDQsk1KmJBX6hRBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D882513915;
	Sun, 12 Nov 2023 23:51:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wy27MwFlUWURLQAAMHmgww
	(envelope-from <pvorel@suse.cz>); Sun, 12 Nov 2023 23:51:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Martin Botka <martin.botka@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
Date: Mon, 13 Nov 2023 00:51:24 +0100
Message-ID: <20231112235124.1671468-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index acba803835b9..10a098aa8b1b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
 CONFIG_SC_GCC_8280XP=y
 CONFIG_SC_GPUCC_8280XP=m
 CONFIG_SC_LPASSCC_8280XP=m
+CONFIG_SDM_MMCC_660=m
+CONFIG_SDM_GPUCC_660=y
 CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
-- 
2.42.0


