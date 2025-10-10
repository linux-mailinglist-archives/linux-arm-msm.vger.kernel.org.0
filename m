Return-Path: <linux-arm-msm+bounces-76772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728DBCC856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 12:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F204246E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 10:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF5A2EDD63;
	Fri, 10 Oct 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD/ceDK6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1A2EDD40;
	Fri, 10 Oct 2025 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091910; cv=none; b=LXw31e5OJ5GgZ2QYFoDOyYtdD2h7+kOhaZPXTOPUeJBcgm5bH6rPRLGP97pel8+y4yQH+OMzk2uf6lWN4Po8krqHlPxqqm0b8/l3LPB2pTzTZ4Ucf6U73baEERajGFfbJKgOBBMsELYskKIiwfW0UbvE0ZPbQ0UPCsP3htNzAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091910; c=relaxed/simple;
	bh=EvoDRDWpz97LXHCpb4TlphIBCYbTL2ihidH+0E+WDKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpproUtzxkrnx9eELDjWD78kR5XkP37g624WFjbl1+EULU87mL1Urx1AdoPEPYp1X011AKTFHHZSag/ADRzYLRRt9v3SRmF/UVkyVhEAO/6K+3+fregtr6gLaf5zPSv53TTz59d1BtvqJelkq4TvE6y6uVmGMj2brI9uCC57gCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD/ceDK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD48C4CEF8;
	Fri, 10 Oct 2025 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760091909;
	bh=EvoDRDWpz97LXHCpb4TlphIBCYbTL2ihidH+0E+WDKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aD/ceDK6LPH1CUnnZF5XXGR1Eoa1wkoVceNqNHExLhVt4Vx/TuHdTKD0B7lN5no53
	 VSH5fehuFD0zL2lSfA/VK6Jp8kzGHSq/+bhVut58+0YpSMmJRV9IozPSFBZfNcWcAL
	 rP0ueVptkDCkY8HvZdI/Syyjmm8osVtfbRBB7/ouRtF0qs5/5feb2KFLQvL8vEG7Db
	 VCD9GqISEfNJXd3i604jUkEHvqPWEql+n6UTos9XdgtIi0V7eIXEGePAMlBZW7q9oV
	 QDc1xbN3Hmlt/wjvqNWRX1RU9thaY5oS6yEdpmwdttkSoI6fT0XAsiINKS0oJ59KkV
	 vzKy31lJzhoxQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 10 Oct 2025 12:24:50 +0200
Subject: [PATCH 1/3] clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4 master
 clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-topic-gcc_usb4_unused_freq-v1-1-4be5e77d2307@oss.qualcomm.com>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760091904; l=1008;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=v6QwlbxLPugcL28ECNV1lP+lQYh07Dz5MZqkBaPT/tU=;
 b=jVflgr2rFXmX5pbkEdCWAZkpem46O82SjkbUE85ghr4ZxxGt3VU2A25ZxVbAh/GVMlUPgALNU
 TN2nEebuvoWDTgZvOTOOrmQo3v+M/b5FfcOb3nT2DBda67sQwRJkJ2g
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB4 HPG says this frequency remains unused, remove it from the
frequency table to avoid any misunderstandings.

The reason it's unused seems to be that the lower RPMh level required
to support it (LOW_SVS) is not enough for other pieces of the pipeline
which require SVS, which in turn is enough to support a faster, 175 MHz
rate.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b683795475e3..2ab111585d7f 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -2224,7 +2224,6 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb4_1_master_clk_src[] = {
-	F(85714286, P_GCC_GPLL0_OUT_EVEN, 3.5, 0, 0),
 	F(175000000, P_GCC_GPLL8_OUT_MAIN, 4, 0, 0),
 	F(350000000, P_GCC_GPLL8_OUT_MAIN, 2, 0, 0),
 	{ }

-- 
2.51.0


