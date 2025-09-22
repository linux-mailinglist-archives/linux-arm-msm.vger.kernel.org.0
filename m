Return-Path: <linux-arm-msm+bounces-74438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6542B918DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 16:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79CC18997B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 14:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022571482E8;
	Mon, 22 Sep 2025 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCx1AkCv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB744AEE2;
	Mon, 22 Sep 2025 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549627; cv=none; b=JGrVE0W51MWqp3RyEreU+/vukPKtc+musRlVYNXvrXWNeaB0pqmjRPJelIHS3Juiuy6Zmp+VTpupKTOGWUA/5cP0CS9pyLBkipjAeSSs6yDAK+8uXjNT1NnyE83OQ1qhOEDkvxhTlQ+LiBi9LOtpt7UPlyyvma/46/d9FsrF6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549627; c=relaxed/simple;
	bh=E3sdM+sVgc4gPEGHLFWWB3ONFSYLIUVewf4FnPVnNko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWvcmW0wT2bcqLCDsYkO3RUBto+Yh43i9xJqZYzD1pMABCZkvL+9MAz91W/LuUEdQ41+7ZvVmWk4hVYm6+JrRreEIPMTnMcZzkKv7mdiaejWTiNgLog6Pzc7yTZSsIPkNJEhlRf8tj0niNX+S37dboqAHZ19uIni5K07wuWdN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCx1AkCv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9D8C4CEF0;
	Mon, 22 Sep 2025 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758549627;
	bh=E3sdM+sVgc4gPEGHLFWWB3ONFSYLIUVewf4FnPVnNko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VCx1AkCvfPyrVhShnCv/SFwo0rbnut3TO4KhIXnqKOrGlriQAPyOFpACn+ipGnbuV
	 jtialiB8qyI52fU2nWl1UKuKxf3y2bPFvHJEz0RG2E1plv3aSVnq0lNirIy5jckzkO
	 Z7UuC5bbpRpB5sug0AhLN+rbtks6yRJ62rCEUwTmXJ4+sAyh7APVK8071uYX7hDa86
	 8pa3HnCeDdZ4B+mICbtGdR6vnWi4XGzWnBiQVUNwxv4kwA2LqMo54PdH2mGWa0pM2s
	 Y6PJ81QkgYZxJ06WNXacCkaqpkSp8So6ma4W0W7M7QKZunyLYQuG5ZQ0LMD8VyeBaR
	 pSQAScWU9rOSQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Weiss <luca@lucaweiss.eu>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Date: Mon, 22 Sep 2025 09:00:20 -0500
Message-ID: <175854961645.817693.1581014950745950581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250725-fix-qcom-smd-v2-1-e4e43613f874@mainlining.org>
References: <20250725-fix-qcom-smd-v2-1-e4e43613f874@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Jul 2025 22:02:58 +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.
> 
> 

Applied, thanks!

[1/1] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
      commit: 09390ed9af37ed612dd0967ff2b0d639872b8776

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

