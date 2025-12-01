Return-Path: <linux-arm-msm+bounces-83939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C21C96654
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 10:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E99D3A47F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7810730102B;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQGsC9T4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D902FE578;
	Mon,  1 Dec 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581680; cv=none; b=b/fJReT8EWaK1RflApl41odYFhOkWHNkQ5sf2Z2KM4vetf56XH9/nUWY4tpRZgMAF6YTxios0y00DdhKqThGuFIE8eVEA8h+6wffJDguigJBw60LINzHsn/uOr7lIgIBKeyHZkqApwUORkSGu7xgu/GQRyc7QtysPtIcCRkHHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581680; c=relaxed/simple;
	bh=TmMiO2B3Os+0UOoUWpNfa5CpZiPIWUmd2ouSSyQjaVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCPxQlNC9Cpu4/rciCAWeYojlCcf8Ai8OUFrnAVLY554y5CAw/1HqAJAY2nJDsBVfBN2vHvJFJFfoCLzKmc2oFP07r0QBkLxwgiFLO/z06CTX+oCwF+/ejJlAN4Gvrjy2qhfClYdFTn2bHxwGXTEXwPGK+mca7uqwuh/6rG+nKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQGsC9T4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4147C4CEF1;
	Mon,  1 Dec 2025 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581679;
	bh=TmMiO2B3Os+0UOoUWpNfa5CpZiPIWUmd2ouSSyQjaVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GQGsC9T4K1QmPAgoULmBrirFgs12qhJp4d+fI56OmhLwM+YKY3eU5HVOI3a9UINBW
	 WL7SGAx9bAAXbrFvzI8/0x2leFrPsSiu1yohd4+bsbKTAcG11qOuGgxl9RQVuIUnJj
	 qgTlk31tx7DRK5lrN5uEbRZpkT98qQ9iPbcX35tK+oaBUNhsLa3aEh1cCHgF9kfkCg
	 wv8pAW3y7l/dtPWxFHV7MqFaVe1s2uWH5IAXMxapFxBfD7oo8W3zTmpW5cnx3/Efni
	 5KSi8Vsj9rpKA/guW6bshecSAC6mpr8+TLAHXlEyIVXhSKZQbgyzdXWN5Hq7fCgm7o
	 Z3bzxsjkZC4pw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ0Iu-000000006NO-24VB;
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
	Johan Hovold <johan@kernel.org>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 1/3] ASoC: codecs: wcd937x: fix OF node leaks on probe failure
Date: Mon,  1 Dec 2025 10:34:17 +0100
Message-ID: <20251201093419.24474-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201093419.24474-1-johan@kernel.org>
References: <20251201093419.24474-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The component match entry release function will drop the references
taken while looking up the soundwire OF nodes when the platform device
is unbound.

Drop the additional references taken to avoid leaking them on probe
failure (e.g. probe deferral) and on driver unbind.

Fixes: 9be3ec196da4 ("ASoC: codecs: wcd937x: add wcd937x codec driver")
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/codecs/wcd937x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 421ec7a2d6bd..339d2f097218 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2843,7 +2843,7 @@ static int wcd937x_add_slave_components(struct wcd937x_priv *wcd937x,
 		dev_err(dev, "Couldn't parse phandle to qcom,rx-device!\n");
 		return -ENODEV;
 	}
-	of_node_get(wcd937x->rxnode);
+
 	component_match_add_release(dev, matchptr, component_release_of,
 				    component_compare_of, wcd937x->rxnode);
 
@@ -2852,7 +2852,7 @@ static int wcd937x_add_slave_components(struct wcd937x_priv *wcd937x,
 		dev_err(dev, "Couldn't parse phandle to qcom,tx-device\n");
 			return -ENODEV;
 	}
-	of_node_get(wcd937x->txnode);
+
 	component_match_add_release(dev, matchptr, component_release_of,
 				    component_compare_of, wcd937x->txnode);
 
-- 
2.51.2


