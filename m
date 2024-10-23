Return-Path: <linux-arm-msm+bounces-35506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322909ABCBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFE21F241A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFE41494DE;
	Wed, 23 Oct 2024 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTvbo6Ex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A0149013;
	Wed, 23 Oct 2024 04:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656978; cv=none; b=ktsCkCuX8qfRc1g0C6hzX6cU99iDm74a8SbiLKa1NV+9u6A/T/WcqrTWtUq7Ow3Z7dPK/XKCZZ35ixAt4mbRryvjL6zi9GYbwOpFvb+yhogc4m+8WriiIY6k21ZFkfXWQDD0tvpge/twaiuXcorFrqvLjHng8nR5Uw+Zp1NyGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656978; c=relaxed/simple;
	bh=HtUrsFF9E3/9eRwQQLMlTmBHV1nknflCTbqN35M+p4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4E6ve/pdwNaU+iwZ6wwQUM64NHlWwaBd7wJbErf2hVvPxFgtJcs+eQYoRldNbG2jmwdaPwWF/rgd8zL4eejV57WdU9Pvj83uzy3RugtvXYkvzN8mJNIhELaAttW+C7/i4VaI3zpiP7cPZzjwYSUY3BVT3N/BQbK0iXoaTQHdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTvbo6Ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175D8C4CEE7;
	Wed, 23 Oct 2024 04:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656976;
	bh=HtUrsFF9E3/9eRwQQLMlTmBHV1nknflCTbqN35M+p4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rTvbo6Ex3AlMVUVE3iTCPhIEm0C4kKZlzlB8M7GSZRkXXtliOtQA0UeS+ZKzr7HVA
	 dPy0bkAAeK+HZYzomxRgkCLSCbyiVZ4RlCp/Es1DpPuKRDfH/BCBPpY3nCmxrD/K1a
	 ocDpW2z2YtFvNB5fYYOZKTOxKNs9Wwwx+a+nTT88kfWSSexicnx6ZCfGlnzyunzBm6
	 vK577ItszGp3fByu9SfhmDIVvaRhn/e6WKc1HOmudsBdGGicjPt37b6w79+bb/Kv9i
	 qZvH5/LepiNelhZeitiNdkQev2yX2cRjMGrCe/tFoe70hEWpJpIalRyN/HFyCqDey+
	 VubhFgREPzAhQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
	Vivek Aknurwar <quic_viveka@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jeevan Shriram <quic_jshriram@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: clk-alpha-pll: drop lucid-evo pll enabled warning
Date: Tue, 22 Oct 2024 23:15:53 -0500
Message-ID: <172965696415.224417.2449883638734713639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022080521.359-1-johan+linaro@kernel.org>
References: <20241022080521.359-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 10:05:19 +0200, Johan Hovold wrote:
> Boot firmware may have left the display enabled and this should not
> generate a warning on boot:
> 
> 	disp_cc_pll0 PLL is already enabled
> 
> Also fix up the lucid 5lpe pll enable() implementation which did not
> return early as intended in case the PLL is already enabled.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: clk-alpha-pll: drop lucid-evo pll enabled warning
      commit: f9b493de63eccf0fb6dc1549863590b9749f6f26
[2/2] clk: qcom: clk-alpha-pll: fix lucid 5lpe pll enabled check
      commit: 05b2363b1359195f3c86c98abc133907f8769a69

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

