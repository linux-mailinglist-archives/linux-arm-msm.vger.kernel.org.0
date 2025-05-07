Return-Path: <linux-arm-msm+bounces-57051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE367AAD522
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3E711BC27F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3741FDE01;
	Wed,  7 May 2025 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgQ6JpYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732341FBEA2;
	Wed,  7 May 2025 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595096; cv=none; b=rZHCMoTOiKnNfGYCN/tTUIRfavdbpFGfvURENmH9IgaCJYjKwQrok85XWOg8qRX+wflPIGme2NCCLhnMzJKD8UtNEDKUvvnDgPPa5fdfG1NPXYo0+iLPsQXSXqDA/5XmSy/YzdHyT45HpPp1OJ9SMKRQAbMjvRTHKlEI1oBDTJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595096; c=relaxed/simple;
	bh=ZPOxIsXW2ulElosS/A2SFgXjzaSyKVtJssVnwDk+pJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwOb3+NZ+NFK90QrBm5MbSUGMmb+ooPaU7iDBMSR4azTSqLNf1LIv5O5N88QLMH86aO2WuUpsBKhXJ/tRia25dC+h5w4nM6DwBAq2g24DkG5X2Xb35qcdEw89govdglrGX62bPzlyT4MB0ETDfSiY+9SIMaUJWckTPjmSfQ0U1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgQ6JpYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43996C4CEF6;
	Wed,  7 May 2025 05:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595095;
	bh=ZPOxIsXW2ulElosS/A2SFgXjzaSyKVtJssVnwDk+pJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PgQ6JpYbVu2dYADvYed7Ume3WZeliQhfB24Ejx+a9uKhCGZKwdtqW/OzjhH+nUVXf
	 Knl0kXwoxqufQ+rXavVZcWK4obB+PjH7K4a5GOPjN4GjlX6g4aFjvO9WwVSTBXSrqf
	 m5c/0fDCm409Y3JQibN/TbT4jV1EWs9hKInTzszGSo8duUgrbDVfIN8EF7AvSS2v2/
	 kLzdmv1jQ3DxtB0gaN6uOAubWrM385fl5bQlAu6KuBpGcnGSjEuzGOSK1umOyNUKwB
	 oAXpxomzZr1C7hKEt0RFwqwF9v10YMpY/BOVNE90Qr3KmQsAzkQvwa6BHydoBQiYcb
	 2JeHNQbW8szyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add *_wait_val values for GDSCs in all SM6350 clock drivers
Date: Tue,  6 May 2025 22:18:08 -0700
Message-ID: <174659505814.5380.17400921825631529392.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Apr 2025 14:12:54 +0200, Luca Weiss wrote:
> As described in the commit messages, keep the GDSC configs aligned with
> the downstream kernel.
> 
> For reference, this was checked using the following code:
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Cc: ~postmarketos/upstreaming@lists.sr.ht
> Cc: phone-devel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> [...]

Applied, thanks!

[0/4] Add *_wait_val values for GDSCs in all SM6350 clock drivers
      (no commit info)
[1/4] clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
      commit: e7b1c13280ad866f3b935f6c658713c41db61635
[2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
      commit: 673989d27123618afab56df1143a75454178b4ae
[3/4] clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
      commit: afdfd829a99e467869e3ca1955fb6c6e337c340a
[4/4] clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs
      commit: d988b0b866c2aeb23aa74022b5bbd463165a7a33

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

