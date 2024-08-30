Return-Path: <linux-arm-msm+bounces-30161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E3E9658ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A151C24B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C9916A95A;
	Fri, 30 Aug 2024 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O27weyjd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F737158544;
	Fri, 30 Aug 2024 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003792; cv=none; b=XSvxc0tIdxCCfF71G3emw5kyOzxN9SkDcMkEmhFc3Qn5CTwBywYeflaxyVYBTOR3JmXQua6bqO9wD8u7D4nlKA5MJiJBtP/kqUiAfHeAjIwZiQIBpl1MacGdeO7PA/xipWZCp7rFPGqFAKl82cswo9idN424ixU5b/67PZELDh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003792; c=relaxed/simple;
	bh=p2GL4XduuEoVsX2bFk1A6bJbFb6KOOcHDQhwYEwgMKM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k8365bddyaCsufsldOmA6im+omCENXHwfCGjYEXc/M+4kvqUnXC9eTA8c4tGKqiLq1TC0fS+S1PMT2hxVP58yugPuZ5oRRcPs0nFsq16WJ42TyKlkBZa8jVZv4SRR4FrQcv9JM/Axi3ZaxhO0UYZ8jfRm9c6swhFmHAuAdCc6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O27weyjd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B944C4CEC2;
	Fri, 30 Aug 2024 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725003792;
	bh=p2GL4XduuEoVsX2bFk1A6bJbFb6KOOcHDQhwYEwgMKM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=O27weyjdpt8Yw+EX3GS9XbOAVD6Ss7msg6QT6XdrpXLbb4NKtdiHPQCPN/bAAKkHD
	 pgwlV5AnwLkwKTzgfg36KPqwf+KA4Z1AwhgWFw10xKPKTeyfIzA2B5qHd5iKFhYGoM
	 qvz6hlZjI36nmIHxODiukBsk4yfH7vSIz/VIMrrTIvnule7sE47ZwJSuLtGXUQ16lb
	 M9k6jfiIF2co1rQoC2WzTrpnCZ8ppRA9b1Dwwb0K4E/F0uxP6u2DaiQsWmBbjj0Vu2
	 Jj5nnqCnDyGsz1Qm2YR75jaQ24DPehfeK6KPLPAM1QfSW1BSUF3YM71JLgGcmH8vlN
	 E9aQ7iDj3K7SA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, krzk@kernel.org, jic23@kernel.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826092734.2899562-2-ruanjinjie@huawei.com>
References: <20240826092734.2899562-1-ruanjinjie@huawei.com>
 <20240826092734.2899562-2-ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH -next RESEND 1/2] mfd: max77620: Use
 for_each_child_of_node_scoped()
Message-Id: <172500379078.59806.7835669679693188987.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 08:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 26 Aug 2024 17:27:33 +0800, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> 

Applied, thanks!

[1/2] mfd: max77620: Use for_each_child_of_node_scoped()
      commit: 2b96330e5ac0426087e34e55494e2c2a6a96a8b2

--
Lee Jones [李琼斯]


