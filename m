Return-Path: <linux-arm-msm+bounces-87210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63735CEE4C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5B33009F83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7612D94A5;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu5d8VdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45242264AA;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352625; cv=none; b=t4lD/tIta/ElR4XvyVrDkGm+x7w+WjvmNLuK6sBydISQN2GdSiFJnCCW3P8mat/v14XXhWrSXgGh9npYOlSb49gW7VJyoIEf7CjVlxpDH7K5ehwrHHuDhWjNz6+hC8gBcfgCgCgmlWLCQod+HevzCH/y28Zt6QWBRwtr79N/QDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352625; c=relaxed/simple;
	bh=KJ3eAKTtentyuvftW96tPJQl5uYUV9GrF2quvXSD+qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TvgrrciT/Stjdza5pgNxbL4Lec1i/v+het0LvzNTzKiVO0S90dzXyY58VZ2RFMsCXNxVZ0BVb1XNU1drv5gkM8pKRG9VNh/ow53I+L+iDRLRCLu0shx2PqG1b7bcs8kadGwBPhaEcrgmK6cvnTOhiHnX25u0oncJrcTCXHPUAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu5d8VdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C33DC19421;
	Fri,  2 Jan 2026 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352625;
	bh=KJ3eAKTtentyuvftW96tPJQl5uYUV9GrF2quvXSD+qI=;
	h=From:To:Cc:Subject:Date:From;
	b=Nu5d8VdMNfW+TNrysIFB9KPuC1R0Wmu6ikFh/ULCKkhOOVzS9u4coByiu+H/Yza0t
	 Pzw1WfC5kx1SfvVNfEozBiPxnIXyFwjCk7yJv9IJyK1EoUcNTuSYUCYynoVO6n9qMr
	 vew+mt7sAhFqJJXTax1iQNYX7lpJrm3AT6enZFipv/hUgkNsuYEuT2kbK0KTlLF4d0
	 D0wrRBV8Hpaxr//d+Bo0Wd0uWHY6UfzniarSGoqjmSH0mZptos06y5dS6G4SlIbgh4
	 6Ci49sf3ICCpHOEuyLNMq+qM+Rn2DCbOzNPPdUa9x/fDOWp8ihEsXJSQ7z9qa8fxyE
	 uQeN6fZR+cdLw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vbd9I-0000000044y-0Ts3;
	Fri, 02 Jan 2026 12:16:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] ASoC: codecs: wsa88xx: fix codec initialisation
Date: Fri,  2 Jan 2026 12:14:09 +0100
Message-ID: <20260102111413.9605-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The soundwire update_status() callback may be called multiple times with
the same ATTACHED status but initialisation should only be done when
transitioning from UNATTACHED to ATTACHED.

This series fixes the Qualcomm wsa88xx codec drivers that do unnecessary
reinitialisation or potentially fail to initialise at all.

Included is also a related clean up suppressing a related codec variant
printk.

Johan


Johan Hovold (4):
  ASoC: codecs: wsa883x: fix unnecessary initialisation
  ASoC: codecs: wsa881x: fix unnecessary initialisation
  ASoC: codecs: wsa884x: fix codec initialisation
  ASoC: codecs: wsa883x: suppress variant printk

 sound/soc/codecs/wsa881x.c |  9 +++++++++
 sound/soc/codecs/wsa883x.c | 26 ++++++++++++++++++--------
 sound/soc/codecs/wsa884x.c |  3 +--
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.51.2


