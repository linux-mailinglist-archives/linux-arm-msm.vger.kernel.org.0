Return-Path: <linux-arm-msm+bounces-20864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 664718D2A57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976091C248B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561AC15B542;
	Wed, 29 May 2024 02:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dulBZi9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCD15B0E5;
	Wed, 29 May 2024 02:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948132; cv=none; b=ep/Dp+uYoWsr7E8N0IjrCg0hKhTL5rN4tGgxLC5rlni2zE9NfaKmr1DCZEqf2cHLMlitizpyfk1hH9EeXVSonz9P5DamDnrE/5Oe5x6UrWlnT46QfVM0Bn8A9jcAWRboNDGhmjFWFapTKGY3WAuoyKYDcjNiVQE56izsqYmzrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948132; c=relaxed/simple;
	bh=TmRu5x9pN5U3/yknFxdQqIi0uFTPU6OGHMDNrBQ9eYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MAy9K8wSo1MrJbAcuWkdY9BrjlIWC4XZasMYT0i7Xby2204szf6ovjy2aoLRSGYPfXEJ6CKLi4lsXUBXtMOvJfyvRmGMmqCWaDkDxY6Z8DeSgpJOl88w4ovv7Gc1JGPOg++KfZue200hiz4WhKRm1jVqrL39CLLlTkH0p7US+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dulBZi9y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A6BC3277B;
	Wed, 29 May 2024 02:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948132;
	bh=TmRu5x9pN5U3/yknFxdQqIi0uFTPU6OGHMDNrBQ9eYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dulBZi9y0XtYq+DOvL3+gzB/3s8a0/HGFJkCkw4qpqpWQKHDcRo0Ru9a0O201ModW
	 1fCpm/C+gW365hEI7xsycH8+bI9o4FQR8UHTfHHmzXT6aoQmuNwQLShohHTxx3++am
	 pKj5E9mImHl902klIO2V9yi+TxMcfOJ699uuuIQrWf0JC3k/LxwqfC8AjEnD2Avi+I
	 EwdqxuKtP0y5XDLIASHPsoFP+/K6KbUHv/s0U3J4CpcCxqwLct3zAGUceQTGF/Vprv
	 Gr1E+boZAOxX0I93Zd/Ic4WO288nOyMIX8NXsrClnuiaDeSl5CGMnPTsLRCZLSldpu
	 5leXlsHpPMg1A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents
Date: Tue, 28 May 2024 21:01:51 -0500
Message-ID: <171694812079.574781.7010704103668864122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508-sm6350-gpll-fix-v1-1-e4ea34284a6d@fairphone.com>
References: <20240508-sm6350-gpll-fix-v1-1-e4ea34284a6d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 May 2024 10:12:53 +0200, Luca Weiss wrote:
> Both gpll6 and gpll7 are parented to CXO at 19.2 MHz and not to GPLL0
> which runs at 600 MHz. Also gpll6_out_even should have the parent gpll6
> and not gpll0.
> 
> Adjust the parents of these clocks to make Linux report the correct rate
> and not absurd numbers like gpll7 at ~25 GHz or gpll6 at 24 GHz.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents
      commit: 3414f41a13eb41db15c558fbc695466203dca4fa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

