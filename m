Return-Path: <linux-arm-msm+bounces-83941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F90C9665E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 10:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 270624E27F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 09:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AB0301473;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWj755pf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD43002B3;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581680; cv=none; b=HTXBvV3ZjS+cFsUtyPkLLJTTepaypxlUBdGubbTOmNDmESNN+PdZbFtWuud/eZAA70NOR/8W25DZBDesn7Y+k58yNrVBISBN5ANv5tzrdmvg/gPGQxgcV7f6ml/bymvkgVfZOYTVH9BGyTuXHUOVvvQnVbAQMOgHTgEC9rTipJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581680; c=relaxed/simple;
	bh=X0xgTrvrbRT3vicXSOYk8aHO444O5/4B25EbvlqQ5Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rRW6K8vjVOlVczulHdnhHOl/rNFkj6u/QXU23O/8cLCfdOISlum635tzp/AWptZQCj0OE5lcqcXhl2ueomMuVu90D1qCgWNQGUGVyOEiFYhuZdmtZLQVF5FfVUrQQPsSBmwzgw+xizWe52OfAoFwYbmPsSQAkNrOIu2HlZ84B3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWj755pf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17276C19425;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581680;
	bh=X0xgTrvrbRT3vicXSOYk8aHO444O5/4B25EbvlqQ5Sg=;
	h=From:To:Cc:Subject:Date:From;
	b=LWj755pftCQz03UlmHgJHFMduhfzE74cwxyNK01J7syqKYz5eq2TmU2HDjNLFeDRO
	 EoLVGoKLPMns1+1qqzXs9Vt1gqx2b3WFQ06P/VqMbW1H1qcus9gMh8GKbz9hoShR1+
	 wshnRqwXC9DHiXYT1KtmAXmwgbUOoayML/PX229vWD1llWXwQ0uSQin/wfF0Sfl+fH
	 LsbTbK9TMkghpv4OclMo5UNDmg9wZitOWJVuAGUnOyTdrlp8I0dyzLBudKd+HP+sg7
	 geDhSz61w9W+9+CCOyhJJoWYzm2CW6rMOWf/emweNbyayo8z1Kv9XzIj+PiYpk+3PP
	 9GhceYGR1n4xg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ0It-000000006NL-2tt9;
	Mon, 01 Dec 2025 10:34:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] ASoC: codecs: wcd93xx: fix OF node leaks on probe failure
Date: Mon,  1 Dec 2025 10:34:16 +0100
Message-ID: <20251201093419.24474-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original wcd938x driver has a couple of OF node reference leaks
which have been reproduced in the two later added drivers.

Johan


Johan Hovold (3):
  ASoC: codecs: wcd937x: fix OF node leaks on probe failure
  ASoC: codecs: wcd938x: fix OF node leaks on probe failure
  ASoC: codecs: wcd939x: fix OF node leaks on probe failure

 sound/soc/codecs/wcd937x.c | 4 ++--
 sound/soc/codecs/wcd938x.c | 3 +--
 sound/soc/codecs/wcd939x.c | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.51.2


