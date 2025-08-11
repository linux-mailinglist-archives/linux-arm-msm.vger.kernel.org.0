Return-Path: <linux-arm-msm+bounces-68557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419EB214AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2AC626AEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D012E5B2F;
	Mon, 11 Aug 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiYeEP/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79E2E5B21
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937683; cv=none; b=HHD96ZvnZuJhvFI8dGfGWW/Do62Ymv6yWhzXUjdAB0sjhH40p+BMoQ7lYL/F+Jhl8Qf9vZdJyUorNaHut3Hwa+Y+tozTqKLzoJRxFuU3Icb4/7/+FxZyiujePhQxeMjGARXjDJzvzZr5y6es3BX3tjf9iWrMNyVGTa96VE+hPIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937683; c=relaxed/simple;
	bh=LSBZCiNzGiVh1+vQhGu+jz+9dsjrOhSPra3QFpavLxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzFHgchBIgqH55qDr869jZgtjDe+RCWUc3cUM0vp6NkM98YWvR8R4PIsGnB3yK7TsEBKkPjhtbDEN2he5HPyeUEIyMjbtx1UPGmtY+Rn5z1pn7ZeQ4BthHfeoXehp3XySMI+wyrT1yxJo3PNADs4wYhK8dvw9GU6WwWuGh0Q9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiYeEP/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DFCC4CEFA;
	Mon, 11 Aug 2025 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937683;
	bh=LSBZCiNzGiVh1+vQhGu+jz+9dsjrOhSPra3QFpavLxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OiYeEP/dofx9lXeooLW3mfq4q51YAh4NnK3CwgfnWNJtEqR+VjsCPck+6bEx/Bmnc
	 llkgg5BAsHIgYZmZpb7llXtM/1HgkaZeniuPMnnrm050StxH0snu/McTzpi6kJFTI1
	 PASByequHviUBquNEDxZ7h2Nmzl7NLAzXIt2CuKarzJgSfXVfCRVwdqRkVGLlc/9XD
	 M3YfiBnKY8wHe2jXF9H5Opo8P+9qSXJ+C1Ev94ewXtRssJPpBSqT8djZJmhnVQ2LYH
	 fctFO7KWOx6fVu3neITRm/XEpeA+G9kYNzcd8EvMMgs2vk2NXRgaOUXbAXHZygcS4d
	 fZ/+WE/v4sOKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	=?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: rework nss_port5 clock to multiple conf
Date: Mon, 11 Aug 2025 13:41:02 -0500
Message-ID: <175493766092.138281.17699486312058056498.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250802095546.295448-1-marko.makela@iki.fi>
References: <20250802095546.295448-1-marko.makela@iki.fi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 02 Aug 2025 12:55:46 +0300, Marko Mäkelä wrote:
> Rework nss_port5 to use the new multiple configuration implementation
> and correctly fix the clocks for this port under some corner case.
> 
> In OpenWrt, this patch avoids intermittent dmesg errors of the form
> nss_port5_rx_clk_src: rcg didn't update its configuration.
> 
> This is a mechanical, straightforward port of
> commit e88f03230dc07aa3293b6aeb078bd27370bb2594
> ("clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf")
> to gcc-ipq6018, with two conflicts resolved: different frequency of the
> P_XO clock source, and only 5 Ethernet ports.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-ipq6018: rework nss_port5 clock to multiple conf
      commit: 2f7b168323c22faafb1fbf94ef93b7ce5efc15c6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

