Return-Path: <linux-arm-msm+bounces-29494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74E95F33B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 15:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476F128239F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 13:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FA017B51C;
	Mon, 26 Aug 2024 13:49:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from forward200d.mail.yandex.net (forward200d.mail.yandex.net [178.154.239.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C41E871;
	Mon, 26 Aug 2024 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680192; cv=none; b=qbhOs3LCTEBfI/UASXlcetXvETv3X5gVJBqEgxatjffqbZypowbK+Wq8MNwyv8reiWWWtPF4tF7XpVKTUS3qjlvIaosQ8M8NTeKd9ukDY4hjw6I6kL34YQARWFxmAnLGwKtjfDZ+DYhT6zqRoGL8Ig5uMDf58qxzAWuaDKe2ht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680192; c=relaxed/simple;
	bh=q7iT8GXC+/yBu/TQLo9oXisgLFx+sRNml6nYmwUVrF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O6bKVfUKz8AuboW4Ggr2UqsFbnO31+HmHB9FxUrfKOIMX+SRb4mGlbGm4f//x1K+xbbjLnlieVHTXhjc1ZiuLagrtLQXewL7oZQNdPFAM/w1stIstAwPEfU6dzKrfrQseIYCCgH/b7BqYyZ9dOnl2dc7Spqf1fOtqnx4RIn8dq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d103])
	by forward200d.mail.yandex.net (Yandex) with ESMTPS id 1C44065BB6;
	Mon, 26 Aug 2024 16:49:43 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:24a4:0:640:473f:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id AEB436009D;
	Mon, 26 Aug 2024 16:49:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id UnTqJJ0oEKo0-29xiquGt;
	Mon, 26 Aug 2024 16:49:33 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 0/1] Add support for primary mi2s on SM8250
Date: Mon, 26 Aug 2024 15:49:19 +0200
Message-ID: <20240826134920.55148-1-adrian@travitia.xyz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for the primary mi2s interface on devices using SM8250
audio drivers. Tested on SM7150 (xiaomi-davinci). SM7150 sound is close to
SM8250 and we intend to use it as a fallback in the future.

To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@mainlining.org

Jens Reidel (1):
  ASoC: qcom: sm8250: enable primary mi2s

 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.46.0


