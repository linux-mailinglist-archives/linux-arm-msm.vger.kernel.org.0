Return-Path: <linux-arm-msm+bounces-66627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13EB11343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 23:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E681CE60E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 21:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB6A215055;
	Thu, 24 Jul 2025 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0FvR+Jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7E182D2;
	Thu, 24 Jul 2025 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753393601; cv=none; b=qAI+z0CPtmF+0qz/Z31cPz5szfzX6gy8G55WrhyOZYvYuMl6qaAnj3s+FHLJhGwfuuArYqIOwybfpEoqxilYJd7Bc+Sr8YVmcPq0KO53Xqe+h7MlO6CXNhKPu9s0C8W6YpY5bswvuna8d8xgXGbVqWTYPYCwV90oHzrr0CJ5aKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753393601; c=relaxed/simple;
	bh=44md6pA4ZzVglA3NS+dgGyjtnir2qbYnclL9GMjcIRw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZZrQvXGp1oejc4Ee1OLlxUq8mcg6uqYWMvuxfPk6t/bHvuuGs++HgzCHS1hkXZuRhXgULGfiygd6PbNOQN626qhE9beYUUgVaCERmhQrs0Lv9FtscKU9brZuKwP1bthPsEPmLR+fFPr2g3mst7LJsVPO21Dh6redud0sA2D2U6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0FvR+Jp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3331C4CEED;
	Thu, 24 Jul 2025 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753393600;
	bh=44md6pA4ZzVglA3NS+dgGyjtnir2qbYnclL9GMjcIRw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p0FvR+Jp1bqoen3eT/19dZX/XAStD+iMCHjGZxETIjLzaY6NcsQ1ohiEil2rs2Pvh
	 yV3rZBSjjKYdohz4crIHm3se3RQw/eSu0oxgJlbe5Yo+pK3SGkBNu5c0Z259kSmoQn
	 BWKL9fvKo/1HpS3mDNhXJxHtlR5bLLyz0qBuVhcBxAULRhIPb/7+p1vRJEzVeBIcyI
	 8chYNJIq++NmHwxJYZLenr5hxptR0atFQ+VgP9CmabxdXlXNYWHYvJVm6tIiqK5Fk3
	 cIVAAPFN09KkgpRdCD8gufvbReganpd+CTsXktm8IahOR/4Wt7h05Lmj2z1mLSVQMa
	 TYk6Z/8K8lIKw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250704075401.3217179-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075401.3217179-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 07/80] clk: qcom: Remove redundant pm_runtime_mark_last_busy() calls
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 24 Jul 2025 14:46:39 -0700
Message-ID: <175339359981.3513.4796612957232915828@lazor>
User-Agent: alot/0.11

Quoting Sakari Ailus (2025-07-04 00:54:01)
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Applied to clk-next

