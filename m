Return-Path: <linux-arm-msm+bounces-5101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A688160CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95FDF1C21BFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588DF48CDE;
	Sun, 17 Dec 2023 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqUkVX3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358FB46BB0;
	Sun, 17 Dec 2023 17:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3FDC433CD;
	Sun, 17 Dec 2023 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833703;
	bh=rteGT3ifN232/KdA42Tg3cP+sus0e9KBkWdPlsCRq6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QqUkVX3N7nS81q07JwigZhD8YlesknfNZifkMt7eMqMsNmhTZGA4hgU63L+klqxEU
	 Bd0kWP/mPs6g0nOWIX9fgqcLnEowjKPc1ResGEXHbApqhwbPxm51b6mjXxPBhGtdWh
	 tjmAYYiU+fPbhMO+vqdCv1MuE037Drt7eRkTE/UD6nkXh+98Y85k66aSuUoQfjM8q2
	 6PDElsc8IdJnkzLVO3lsDBTbQz6q0JmvPWTCl7kdVFzamqF44MFAXcLQG9pI60gKgl
	 tjGdOSgHfV73HiAL3rrUqyFfcd/MtQQJzo9XSfMSI/x0RKopWwmHYtvXMGjj9nZu0a
	 sk/NS/Bodsbig==
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Prevent error pointer dereference
Date: Sun, 17 Dec 2023 11:20:59 -0600
Message-ID: <170283349426.66089.17091761546670182222.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <210d48ce-6ebc-4a6b-b30f-866d10d41a16@moroto.mountain>
References: <210d48ce-6ebc-4a6b-b30f-866d10d41a16@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Dec 2023 12:21:51 +0300, Dan Carpenter wrote:
> If "regmap" is an error pointer then calling regmap_update_bits() will
> crash.  We only need to call regmap_update_bits() if we had written to
> it earlier.
> 
> 

Applied, thanks!

[1/1] clk: qcom: camcc-sc8280xp: Prevent error pointer dereference
      commit: df14d214105e29d0e734aa36445888bd2b0dde78

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

