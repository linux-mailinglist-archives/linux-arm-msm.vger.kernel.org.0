Return-Path: <linux-arm-msm+bounces-48070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A95A36859
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C19D67A5394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF9D1FC7E2;
	Fri, 14 Feb 2025 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmCZrUJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BBC1DE2B4;
	Fri, 14 Feb 2025 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572709; cv=none; b=q9EFaFHy1HLNj+4XoCz/Exywhl3UeVYf05kpYoY7Ikqd/Q/3zrOubNCj5edxUaqnjkUC5tlOdD6wAdauziauxnWQit0hGswalQgHxO+keFtlHd9QGnwMh+bFYOGi4zFtG2JP+Qd6wDdprjMnvYjwzloJvqIJMLEe4uoaguKIIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572709; c=relaxed/simple;
	bh=szl/OLYs7mzB+NubdfuL4IBkjVF11zP8JCxRFtT6eK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zh9Bv1hwrCueOIIlfCz2MKtZZ+1ZLqq5QTgwkESvSk4KuoOvQdOfeMOl60IFR+hMHMpSyOCb2dMKqXQ4QLqidu9yN5LKS7zSFf8+GgqqHK4g+fY1oNKPVnzm6WYtwcrHULwfZTZm8068qfgZTP3C6QTiIJ0k2mK/K6GXlZfJOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmCZrUJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE60C4CED1;
	Fri, 14 Feb 2025 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572709;
	bh=szl/OLYs7mzB+NubdfuL4IBkjVF11zP8JCxRFtT6eK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmCZrUJEPno8p6kZ6lkrEVnFM245IHgwgIg9agQmzBsaQ5oLCLsVY8qzO0EE8raFs
	 Qz1WAhSNKm81Ziw1D77HO06a+PpBobRm1SIng6Uiq79Gi7ukm1weI1h9Xk9dmtodNQ
	 z/cvagwsQsn8KISeWQN8RzJ8g+4XxT+kU00RnrwILYnb1uiFX9XAAfGWU4uB1pnQ9l
	 5TCaxXXXCZlfpBLvu2F4Y8jnQqbnxEORwXBv2gPT36ubSbJ/mMQ+dIZUgK4m+Dokhl
	 mvUcpq6ZNdQKfIdVZgD4zGBLTnJPHHvH9vtKhtP3m28TZ4wFNfPaDmbzMUAfSAeH2Q
	 4e7qOQA4rqJuQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Add missing SDCC resets for SDM630/660
Date: Fri, 14 Feb 2025 16:38:11 -0600
Message-ID: <173957268924.110887.17281364730088178156.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203063427.358327-1-alexeymin@postmarketos.org>
References: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 09:34:23 +0300, Alexey Minnekhanov wrote:
> These resets are part of GCC space and were missed during initial
> porting of the platform.
> 
> Changelog:
> 
> v3:
>  * dropped fixes tags, picked r-b
> 
> [...]

Applied, thanks!

[2/3] clk: qcom: gcc-sdm660: Add missing SDCC block resets
      commit: 497457f61fd6d375c7615926956793286f631f7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

