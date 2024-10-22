Return-Path: <linux-arm-msm+bounces-35356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C09A9BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A29ACB21467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19211514F6;
	Tue, 22 Oct 2024 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbBm8inr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9296D148318;
	Tue, 22 Oct 2024 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584369; cv=none; b=m0GTsz/oybla18J0c3WpZi9WgROtx7nF4/mLhCiExpIWlpykuPwX0l/n/8cUzs7eDWJpc7KA+fr9Ra0MkZ76UJwEeGqzeDsGERAZM9icvgOBILHufv2iEIkNiHoLw9wnj+Urz87EkaVOt1fudfEwaTly9sHRQuT08o3nTcHzZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584369; c=relaxed/simple;
	bh=I8HKFLveGZJhfJuu9wUYHMI2tU8uOUh59VfevzKIKq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbySDKmovE73+XTJNA7KvjifuvszpDW+EJBbLzdn6CW78AZZQdl0pXkLYhxQlTVpb/SDGVAJGBW07zftzyaAUFah+wf1LxvXtPPpP/HG9tzoVv7Fn47Ssr2+D3j5QhnokiXB+pqq7ajupOmWaxVUlWdFkXotgtt11xU+4KbI8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbBm8inr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF2AC4CEE6;
	Tue, 22 Oct 2024 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729584369;
	bh=I8HKFLveGZJhfJuu9wUYHMI2tU8uOUh59VfevzKIKq4=;
	h=From:To:Cc:Subject:Date:From;
	b=JbBm8inrQpsQoCe6ei5Vg9cc0dQ475zaUuuiq+/AWrnpkh3qscTCruqez5iibmOX8
	 Lwc3crQ1ElzzRspTQ1QyqmyQpLpjmYguTJpKUE39j10+beY7Kh/EbqsACTIammBGcw
	 74VpJWpHqdR4qCT3jUSwczwQWN+7kYu63baZeF8cY/keR1zo8+ZSvQAP8RZhOAIBDV
	 efmbfI+H++GlmaJ5/HPEkWKi1Pmmbvo74XgRuEiWx2MuX4GGXysKoEofkhHpz18cOs
	 TxaHnhn4QAlxfcwugIur2VWmLJhTQ4ylE7e3FIE7Ar1ooKMTN6l+SnCYHJFf5ZOHON
	 5hf7PWGQosnaA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t39uF-0000000006u-1uks;
	Tue, 22 Oct 2024 10:06:20 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
	Vivek Aknurwar <quic_viveka@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jeevan Shriram <quic_jshriram@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] clk: qcom: clk-alpha-pll: drop lucid-evo pll enabled warning
Date: Tue, 22 Oct 2024 10:05:19 +0200
Message-ID: <20241022080521.359-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boot firmware may have left the display enabled and this should not
generate a warning on boot:

	disp_cc_pll0 PLL is already enabled

Also fix up the lucid 5lpe pll enable() implementation which did not
return early as intended in case the PLL is already enabled.

Johan


Johan Hovold (2):
  clk: qcom: clk-alpha-pll: drop lucid-evo pll enabled warning
  clk: qcom: clk-alpha-pll: fix lucid 5lpe pll enabled check

 drivers/clk/qcom/clk-alpha-pll.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

-- 
2.45.2


