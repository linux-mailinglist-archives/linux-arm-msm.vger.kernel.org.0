Return-Path: <linux-arm-msm+bounces-82155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A66C65A22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 42E7920878
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23AA2C0F89;
	Mon, 17 Nov 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hLSSHfd5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="s+NsFrvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A92848AA;
	Mon, 17 Nov 2025 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763402348; cv=none; b=urun8iyMOc4/is8oc8MuBFdLHaQFnftWD5jsCx0Q4FgdBPKmo/Lc873zBmVM3qMqIbI0oeiTgzn5PJlSNdXLpY9en7mVkh5bkfAoHqqrnrAREkfJ/w/ZBaztwGqFwi+oYIIIY6t7+Ovl4xOsKlgcYsSgeM3jhtS7MjnGS9BpqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763402348; c=relaxed/simple;
	bh=H1xvOerofGxhB5VnNz27e5hnd6+II2A3o7alZw2pUHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXqxZRI6LRXzuPaZnaaxCW7+5gC+OAZq/Gf8/xd3XIQ6scWeb4qXe3IwJCUahCouZE4WGb8qMmM7y04+oUgHjyxTrN369Nzz4LJjxeRUr5CovP53j+hweZfZpsSNM4kNxnPy8XSp8js63lfQAcE8HJLgRqNTz/IpEYDlYkcpIJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hLSSHfd5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=s+NsFrvx; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763402331; bh=BeW9ZmLFEG2U8UpoXY10QJj
	WSA/TolXfKLH4rcbwXKY=; b=hLSSHfd5CUPb/kYOyMYSd2w46Fj+8MlXXhMe4sDKrOfE5nqZ4Y
	PKc1FXoYba3E7q8b4CvuUKk80ib/9emn+ZosLkTbPbPkKloz8Uz6ndFl41llazinjbSt9u6Luq9
	nhKEZsKpZ/ApN6wLg2jJKAXtjC48Xmgt5pfF/VCD/sguwFknZnLKUANSrhkU/J4OVYgeIVi3xdN
	xWt0SjY+HnFV9TnS9ni63JkEE7DPLavv+c2Y3HgahLTXx4ReKsia+3e1nEc+kYnH0LzXxXGDRo/
	uixNcgwkwrll7UODpV5ICIXZ4+fHgRA/MRBUsCuuDS0nZeQbhrRyh/YQCNo/mqJExeg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763402331; bh=BeW9ZmLFEG2U8UpoXY10QJj
	WSA/TolXfKLH4rcbwXKY=; b=s+NsFrvxG/uqWvv06vqyITos3NBCZCWS9R8rIk11k6dXS9uuxd
	B2XMVm9rlFRRq2+u8RYhtsRp/MBdREWQgGCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 18:58:47 +0100
Subject: [PATCH 1/2] clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from
 cpp_gdsc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-1-db33adcff28a@mainlining.org>
References: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
In-Reply-To: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <junak.pub@gmail.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763402330; l=668;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=H1xvOerofGxhB5VnNz27e5hnd6+II2A3o7alZw2pUHo=;
 b=KaBCUQxdaAyqWTBGcQgRh//3sqpNIKxlz+RHlP7sYGhqmoTSDnhWKnyUoEYxY5psQdldswm2z
 HNp1tNYSXLqCLo8e8WaNhJlmhluUKNqwVMbGYi07LM+5x2w2wRu+s8P
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/gcc-msm8953.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8f29ecc74c50..8fe1d3e42144 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -3946,7 +3946,6 @@ static struct gdsc cpp_gdsc = {
 	.pd = {
 		.name = "cpp_gdsc",
 	},
-	.flags = ALWAYS_ON,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.51.2


