Return-Path: <linux-arm-msm+bounces-85902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39DCD041D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C56DA30378BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FB5329E55;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baaonRd7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7583128CD;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154477; cv=none; b=qItfQOKhPmnXWSgDoLeLY8ahq/fMZ3vX2rdK3UKcxOCIy3dHvMo5WRto8BHvWTeMzLgTptfxZuz8K7AiceivC/Cuwqz78TvGn7OwutjhHOSwRA4VFN948LfTf5rkQY6V0tByEF4uCK9w2Mg5ceDmwA3uk/tvDfZMltOjm+870BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154477; c=relaxed/simple;
	bh=4ArHLwtTmR62WXgJJARcgzQabrkMoat1ZGxmiNJ5+ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0rS3xe+zbG7+hfWm7FTniofrYaECqFGNGFWB+Rm/jdZ8vpmIy4eiEGt3qMz3Q+hkvYB2CCpJ2kOs4W2oYlKA0SUEKIIXh/PbVoeg6akAQxkUnZS+R9ucMXurZMwjoZTu4biw+FOgubUN5rMn6yzwm9ccfNVmGe6UMmv3Hoxa1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baaonRd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4758FC116C6;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766154477;
	bh=4ArHLwtTmR62WXgJJARcgzQabrkMoat1ZGxmiNJ5+ug=;
	h=From:To:Cc:Subject:Date:From;
	b=baaonRd7+XB/dGYw0kFquTHyzZvdp/WpnehTRW0GeMwv1RJ60KtOhms7MKC6/k0DF
	 EWDi/+KH/2LrDqha1UIkg9n3dNBTboAzoDWXSZSnsJuK3tCTwad4lB0jzcdjVbnMOX
	 WsXy370yxgKStJ1qXjEM0VraapIZL9kPPoPRHQWU5z8MIaeemkKUeL/vhswefn0RD1
	 vKtYp5ywxfPuYLRPTrrgYMBMprYzZbBWxu5bUcPurGUNEZ/q85FPIxpqHk3S5DnukS
	 RKvganMvccTQyVRuvkYEtQpX9MqZX1yGVbzy33krjyI3syjLQY3QuDyUjFJq1k9D8Y
	 Nf1S/M5g1SCsg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWbSW-0000000051V-0wV3;
	Fri, 19 Dec 2025 15:27:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] ASoC: drop bogus container_of() error handling
Date: Fri, 19 Dec 2025 15:27:12 +0100
Message-ID: <20251219142715.19254-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_to_sdw_dev() helper uses container_of() to return the containing
soundwire device structure of its pointer argument and will never
return NULL.

Johan


Johan (3):
  ASoC: codecs: pm4125: drop bogus container_of() error handling
  ASoC: codecs: wcd937x: drop bogus container_of() error handling
  ASoC: soc_sdw_utils: drop bogus container_of() error handling

 sound/soc/codecs/pm4125.c           | 6 ------
 sound/soc/codecs/wcd937x.c          | 5 -----
 sound/soc/sdw_utils/soc_sdw_utils.c | 4 ----
 3 files changed, 15 deletions(-)

-- 
2.51.2


