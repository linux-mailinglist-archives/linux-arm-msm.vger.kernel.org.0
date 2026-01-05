Return-Path: <linux-arm-msm+bounces-87496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A0CF4459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 609D730275B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E83433C502;
	Mon,  5 Jan 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+3I1OYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB433B970;
	Mon,  5 Jan 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622129; cv=none; b=MtjohYn5+ereK6+u5EsKZZeaJZs41ujotjY8/ebwJDaqUZR1K/f2+UnIkUVWjE90o3GXmt0rUZz1kclUjo3auNGfxncLxVVdWuigzGsjo71sJXRJnuyJ3oHRASkHZwuJCRXDfuHlJ6bVzlxg0x2gLZ+8OP3vhDGjmVmoalNCOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622129; c=relaxed/simple;
	bh=gSxg3cOQf8M4Zytg8sXxM+YQE4kaMcWFngZQS56Ibfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2K7UCSuvPLPkIJA5VachRmAZ+VcRGC4mLf4qwUw8ADq5hGp7v1AYYUlONOcIZAuZg8xmT6Pc9i1SyU7hL0d8n0Jr9aByPXGWARjqQJFHA+mY8KOPQK3nT05J9JHpXyRtQVOaLfQEOc6ZXEX2+bBBpHYWdb6JgK+7aP7VAPuTZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+3I1OYe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EDEC16AAE;
	Mon,  5 Jan 2026 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622126;
	bh=gSxg3cOQf8M4Zytg8sXxM+YQE4kaMcWFngZQS56Ibfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+3I1OYewDrIBzH7WKpRm0I4iNE+TTB15w0atPBVgfmfTQnVn0HoX9/BSJcfHgQ1/
	 Z8vR+Z+8hzcJ9iwliNNn1FSZU8mKtGiTaVOc4cTtlS3KuDcX3dKR56AEQ7qHbfhHAM
	 F+r+QnlIltwvZlw9C7l7+QODoF9V5KnHi2qGmEOCvW51XkE65HqVcDpWaEJNlbh6mV
	 lUwWWOzYgapqoPf0NVVYaKdv9r5XT+1GBW0BAy92yYJMrn3sdL6QpM91kKPoLLmMi3
	 1TRpdp/26pcWHcUsRkWuu4pM0gZp4DL5gsUhW3/UvFOH6ii2WOda9N1jjTiibonFG/
	 30RPYDh0SiKZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Return correct error code in qcom_cc_probe_by_index()
Date: Mon,  5 Jan 2026 08:07:44 -0600
Message-ID: <176762206373.2923194.12576641356609051710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217041338.2432-1-vulab@iscas.ac.cn>
References: <20251217041338.2432-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Dec 2025 12:13:38 +0800, Haotian Zhang wrote:
> When devm_platform_ioremap_resource() fails, it returns various
> error codes. Returning a hardcoded -ENOMEM masks the actual
> failure reason.
> 
> Use PTR_ERR() to propagate the actual error code returned by
> devm_platform_ioremap_resource() instead of -ENOMEM.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Return correct error code in qcom_cc_probe_by_index()
      commit: 1e07ebe744fb522983bd52a4a6148601675330c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

