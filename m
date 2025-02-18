Return-Path: <linux-arm-msm+bounces-48389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D18FCA3A131
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6ADD1890FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 15:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7153626BDBD;
	Tue, 18 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDDI9t9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A926B977;
	Tue, 18 Feb 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892580; cv=none; b=iSDh+Um/bkvh0qN5mKUhNag6/80wxtkQa1aR8d/OPylAlQWPKMW/GRl0V7i+XPIG9N2A+HmpoH3LS8fituX+QQrr6ByQllh0wA9Qy9nZGtCS2X6cH8hRRz91XuXinb4hPWewzyrKHjzhGu7TPzdiUZqUSVWveqgNj0My5eqxlHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892580; c=relaxed/simple;
	bh=PtPRjdFC0LZ9nIX/aLLRuOjU4yBVVBHKeS+vx4R8tpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdGT0hrF+72xC6R0PKe1lsHlZvfcSDAGc8CM2fezcdJ6gOuq610emrr7ulGCNizOZuDCRkXKW5Iuzu4bFKGrfv5y7zUQcL5MlLHESfMt4+DGv9QMltFVN33DEGRK2aadz0V1NUk9W+4xzytiZY0dw+tANAQI7Ms2m3zy9SdrPmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDDI9t9a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF9C4CEEB;
	Tue, 18 Feb 2025 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739892579;
	bh=PtPRjdFC0LZ9nIX/aLLRuOjU4yBVVBHKeS+vx4R8tpg=;
	h=From:To:Cc:Subject:Date:From;
	b=tDDI9t9aer/LBkULo5Aak1ep6YMaEw/IOmGkqzCqLSZXPEbSAuxRgHghraIoPG9tX
	 C2mtXMRMhbjxHwo+NyigFVfeo11A3skc07iAgXAfhIna+iWVWrpqg3aoIeAOdAyR+p
	 YFk+cVufATV3AmdKTltVZ+OEet3sDynfrSxL7/6rHBuNgzBnkUo9XlLjzx9UScpQhK
	 ZB7QNyiV5UNBOXEcD/ojRHi4dM6pyHvuZn+FFZlpnuv5qxdhwQn1Se50D6wNV9igh9
	 1o7s9HYRwK2KyGAjHs6w24oLX3a2hnyHB2hA33kQSsi3su/Gp36V+AQe2jLEUHH1e5
	 vSL5Kml4lLGcQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkPXf-000000005zG-1ruW;
	Tue, 18 Feb 2025 16:29:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/3] usb: typec: ps883x: follow-up fixes
Date: Tue, 18 Feb 2025 16:29:30 +0100
Message-ID: <20250218152933.22992-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are some further follow-up fixes for issues with the new ps883x
retimer driver.

They don't strictly depend on the probe error handling fix I posted
earlier today, so I'm not including it here even if that one ideally
should be applied before this series:

	https://lore.kernel.org/lkml/20250218082243.9318-1-johan+linaro@kernel.org/

Johan


Johan Hovold (3):
  usb: typec: ps883x: fix registration race
  usb: typec: ps883x: fix missing accessibility check
  usb: typec: ps883x: fix configuration error handling

 drivers/usb/typec/mux/ps883x.c | 78 +++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 25 deletions(-)

-- 
2.45.3


