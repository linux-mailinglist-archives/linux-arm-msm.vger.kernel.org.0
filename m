Return-Path: <linux-arm-msm+bounces-31777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6480978A72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 23:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EF0A1C22198
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 21:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0066314A084;
	Fri, 13 Sep 2024 21:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="or6lYV4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5431474B2;
	Fri, 13 Sep 2024 21:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726261962; cv=none; b=seies+OHYt0oeKmFVH06fDw9omaCSrJm0Iv59Nw8ifAc6d41fDOD7RN2bYqRubW8lYHvUVLS4TnAy8JtC2oJFTKF3hvyc4Z1gS0FQBAPIawpV79+7x2WntLj+KM2a7VSyY6CNv0Eol05i16g1ygrwJIUWZqhahBBHpNHuKXJWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726261962; c=relaxed/simple;
	bh=NFkYmAARPtXSCY67OF9zsQC3L+Z8Pz0byXuB2phdPgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSD+GD7i8MRRhyuehjjOZ+Q8udVZL2S745Uo7UZgB58JBYdE97rXAiuKWxm6PqCfjm8Ku3VjpfrieXLPgtJv6Ch6rWHFNfCLK/Xb5ftfokIeTffKAOR1he7mNQxqiEgqikUXwE2IFGkcTz4VliWgAYSwFpyyMfDUf8o+F/THkis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=or6lYV4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B80C4CEC0;
	Fri, 13 Sep 2024 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726261962;
	bh=NFkYmAARPtXSCY67OF9zsQC3L+Z8Pz0byXuB2phdPgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or6lYV4mHyvfqywcHDn92gGGgi3pzP5bAmF9egDKLy1av96zlSgxdWh7OvTXQFthe
	 ASCE/sfs/1AktDE6Dy45PDlzh7tOAaPshnPGZUYBorBiMCXghCh9vc8+qW87gmO1jm
	 HIc8QiZ1MypPIrhwRCZ3aMR/ASii5CLtRbvuAPEoveRYJrKXcDH4umv4WHdNwUvEpg
	 1aFT17qZG3OKw4Cq63hCWVqekNHJnwz0aYbPZmigKg5nj5NpgvXnEYqajJNaC51Ne/
	 U0BAWY76rlOxew1gEEzeKQTxOpPbqp9IRa40VIaGmyJzXkFQT7M24VaNa53dwEtuk4
	 DxMqnsFR9hqsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings
Date: Fri, 13 Sep 2024 14:16:13 -0700
Message-ID: <172626217010.293677.7413226140005541657.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ZrOQa2gew5yadyt3@cute>
References: <ZrOQa2gew5yadyt3@cute>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 Aug 2024 09:19:07 -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> So, in order to avoid ending up with a flexible-array member in the
> middle of multiple other structs, we use the `__struct_group()`
> helper to create a new tagged `struct glink_msg_hdr`. This structure
> groups together all the members of the flexible `struct glink_msg`
> except the flexible array.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings
      commit: c1ddb29709e675ea2a406e3114dbf5c8c705dd59

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

