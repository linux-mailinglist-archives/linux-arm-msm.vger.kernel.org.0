Return-Path: <linux-arm-msm+bounces-98097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFSQCuQSuWmFowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:37:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A43922A5C57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D72FD300DDC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65685390221;
	Tue, 17 Mar 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="AKC3ully"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801B37FF5B;
	Tue, 17 Mar 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736593; cv=none; b=ls3Mhyb9fl+m/2R05o4qAXbNrpvbjDh8PCoKKqktZpqX6nEmaQyRNJ930ETOit02qCPWgq3Gzfe6vJ5WmIskxvv7ob4bEXqDVZadstfsg5+cGecLQYVxw51qTr2m0R9nU5bziMpGKh1TtTRIEuFFO3evzBbQKWjD1YVkCjLJVAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736593; c=relaxed/simple;
	bh=t8lhSjavVNyVN0m6itU2OGMsya1COEWO1iDxM84EcgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWvuuIBYFkSwoc18h7WTj/X3smJRU7QvCYi4CnKPG7VEEHSMKg4qmTeSfmifdUUPxO2MM/mG88CslfnwbTKh4t7AZHS9i7lYw6T1bUeYZ++BzJYwjkgazPXiHkUX6lbpdjN1TyBBATzvfndEFCRWGUDeRtdpAHcluIqXjHE6dJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=AKC3ully; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 373e3b4a1;
	Tue, 17 Mar 2026 16:36:18 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 17 Mar 2026 16:35:43 +0800
Subject: [PATCH v2 4/6] ASoC: qcom: common: Add MI2S port IDs to jack setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rubikpi-next-20260304-v2-4-5634fabe0c43@thundersoft.com>
References: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
In-Reply-To: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773736570; l=890;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=t8lhSjavVNyVN0m6itU2OGMsya1COEWO1iDxM84EcgU=;
 b=VC5z6stq1Q8d8aLbXgw2tpxfkpuSBbM16ljuxzmt7OrfVi00I3QHXC7jjkfsmIagIgcoFG2+H
 J4rJBh9ZdaJAG+mmKHXdFER4o6wCtT85zY8xR49h5ZI4dy+LDXSKclc
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cfaf04ec109d5kunm8391965e39c9c1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkJDVk5LHhgdHU4fTU1PS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=AKC3ully1U56Lu/5ZVNWxjHdIZ56N6VfxShXvpk1Up8UZlxdGjqbVfKwtaRXpncz0eDV4R9wwakPaE/YXJJggH370Uc6TXE9trZtkHJ8HG2493Be4ubpbwCCpPhAB+grns+7OXxrg6Rmg7Y1/J5SxsVMz1bKk44QJJk/J39rOdQ=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=PYTEvEpolPMmlNBtv2AO7COTHMb4LGvNbz02lBXKnPg=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98097-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,thundersoft.com:dkim,thundersoft.com:email,thundersoft.com:mid]
X-Rspamd-Queue-Id: A43922A5C57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PRIMARY_MI2S_RX through QUATERNARY_MI2S_TX and QUINARY MI2S port IDs
to the qcom_snd_wcd_jack_setup() switch case, so that codecs connected
via MI2S can use jack detection.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 7ee60a58a336..657378474254 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -230,6 +230,8 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
 	case TX_CODEC_DMA_TX_3:
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			rval = snd_soc_component_set_jack(codec_dai->component,
 							  jack, NULL);

-- 
2.43.0


