Return-Path: <linux-arm-msm+bounces-87953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 440DBCFF9AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85C39300F705
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A45834D388;
	Wed,  7 Jan 2026 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTbvcFr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106FC34B68C;
	Wed,  7 Jan 2026 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811110; cv=none; b=C+ONogqmo7p/7aVXuxYkPumch1vVyXIdcZhA/9Q3gVxWNCNhdkGulSSuzxXeF2O0lsQnETTJjK5MFdX8McvhIE1JAZX3zvsXszrN4hLXwCVM1PM/m3tC6Lwjn4tySK5Vb5/j7CzKdM7VjrAiHVLWRotLDGLa0ycIqcte0ZxLpJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811110; c=relaxed/simple;
	bh=usgp+aOM3U2xemET9A+LWmf5lR3v1nosL35r5PHNz68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3lnomitnAnlU8blLj2Mef8TtMDsHEl7HKxwbyUPDk+R4GVYyKhQ0piNSaZ0aRWVc+LgxmK7nZU9xR3ol+5BUGlmJ/OQqheyQWpWjlU1zj/l3/5fwbRXoOQ5Yu1m03VPbw8SKDNi65qupJKvcgJod6Fa/UVl35n252MsQpLoPGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTbvcFr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB079C4CEF1;
	Wed,  7 Jan 2026 18:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811109;
	bh=usgp+aOM3U2xemET9A+LWmf5lR3v1nosL35r5PHNz68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kTbvcFr4X3zZo1f5Ude3j275cyAPItag/g+elcxY+2KwLJGu9c0mNLIe7WzlAa4pO
	 PTmStMZp/8oR7oXhNqSS9nmZVfEjnfse1iVvZPH5CWU9LfJmv4LvN44DdUIy3Ca4+C
	 CoLBHFwN7FCiUJpsbHtpdEFP4UZTtUqVtH35iD15IIMXI5d44xUEpK8XYfDvTisVLS
	 TL08SaI/alU0nr/lbJNvPDMMO4waHbCxXDzvuHByteXa2z9pUOnNm8a9ml/8i8QXgs
	 l0VaQ6pEHD1dt00fgHN7iQQYomTnRuB/Nh4uSUy4irfX/Y80uqt/f7+lI0OdSetKE+
	 TvKyVwTKqyVxQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: flag sleep clock as critical
Date: Wed,  7 Jan 2026 12:38:18 -0600
Message-ID: <176781109963.3262943.4201513447634155711.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
References: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Nov 2025 15:03:19 +0400, George Moussalem wrote:
> The sleep clock never be disabled. To avoid the kernel trying to disable
> it and keep it always on, flag it as critical.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-ipq5018: flag sleep clock as critical
      commit: 04c4dc1f541135708d90a9b4632af51136f93ac3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

