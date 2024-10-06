Return-Path: <linux-arm-msm+bounces-33202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6594991BD0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A64F31C21075
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 01:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EF1166F32;
	Sun,  6 Oct 2024 01:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2b6zzNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66751166F07;
	Sun,  6 Oct 2024 01:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728179742; cv=none; b=F5NZJmqMhJQWd4Mk0IqQIZXBuSPpG9tOHYAI2Mu6dkFpRF6xY4QWxFlIqAVJfV7tVA5TcpPjEQDvpdbwAaZZ5qbrAD/Ty5CMtHN61f/anKKCPnle8rZCNW6ubthjPBz2rzbhjjrKx9qQ8/6dXQK3co+sqoJFhupTVqZRV78IWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728179742; c=relaxed/simple;
	bh=xwEAWlpJQ06UpjFLOHC5wx5+kqHkh2FvRb+0O28gq7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jukch7Qyc43Rxo/E9y8+bXPE8wYR57EKLVYFCtJ+/xjcW8Ji59Oi2HpNkSUOfvVJWWo+HD6Lu+2trO7VXKrjcl/EXQS9sM1ZATtYUDbUavyT+7PJJr/h/lwR31b4U9tf1Rj2w5GT9y6KqT8+yE4HzpK9n3XnHc6lkasQjaBVi0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2b6zzNa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56402C4CED3;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179742;
	bh=xwEAWlpJQ06UpjFLOHC5wx5+kqHkh2FvRb+0O28gq7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h2b6zzNaJNuQVeaajKWxHee4F7nWe+ZBtklJPav/qfryJho0X1XkHF12eJZ3YfNDv
	 F1CgooSnm6jf0YDiQep2VhTFW0h5xfjZ/AjW05De6jj5oR9jrUGG8b4df3MFN2JSkC
	 QBb4VBXt6rFHd3YTXWMInzPCdLS1GiWcc+f1DRiGPCmGBzg0BaE3A1em+Alw2pDhpN
	 dy/7quEyFFvkDYbbBgqockwEHWD7YVrGGHG+8EQOKmU4BNcqQRF7ACuF+JE35p4tnq
	 f/xbmaKKvW+S60nzN1qOCc5lFV7JfWyqlONC5N/EbZv0MTN4CTuHroXcnPEM813KSc
	 iEnwOvA8uUUvg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Qualcomm SoC: Match reserved-memory bindings
Date: Sat,  5 Oct 2024 20:55:34 -0500
Message-ID: <172817973312.398361.10890974412973602658.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908-qcom-glob-v1-1-94a390f36744@kernel.org>
References: <20240908-qcom-glob-v1-1-94a390f36744@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 08 Sep 2024 21:14:14 +0100, Simon Horman wrote:
> commit 8b90269ee6d7 ("MAINTAINERS: Split Qualcomm SoC and linux-arm-msm
> entries") included an entry for .../bindings/reserved-memory/qcom.
> However, it appears that this should have been a glob as although
> there are files that start with that path, no file matches that exact
> path.
> 
> Address this by making the entry a glob.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Qualcomm SoC: Match reserved-memory bindings
      commit: 274e58cc226c54c849760d9a6ec7be23b221cb12

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

