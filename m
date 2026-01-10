Return-Path: <linux-arm-msm+bounces-88357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10250D0DB13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C831030657BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22652C08BC;
	Sat, 10 Jan 2026 19:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0+4vYn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD907288C0A;
	Sat, 10 Jan 2026 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072303; cv=none; b=SbpT/uR+7NvDqMwV4D9c7Ti1wLOLTEuKxP6gqQlpCM/J34xhqJ/bAi99wk951SrSJL5khuRnw95GDRA7KELArBKMOdIleVudC7CooSTtYV+uphVq2PlOOpnsiQQyweLWboWRXuXES0/NaGyvfroFDbtyreiDT/8svCKpfxoplSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072303; c=relaxed/simple;
	bh=HzcRCDnLhSCJn7V8EQcCj1qQZWRWit+OOXgtlzmfDqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iaCcZ4ET4VpFKJQ4bL1bl8N1vleidd00ojhOeKYCEPfvB1eyolT8Hwvf3kispFAwCxECvmAYPZU7dNSLyeegpGxwy0B5l62RK1f9pz+WFZc4MGtdV/mQAgcLyZtHV5hfgZLsvuNI3u5apuccdi2Nz+rmgdZ6yf0m3Ed9XgiT08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0+4vYn6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5C1C4CEF1;
	Sat, 10 Jan 2026 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072301;
	bh=HzcRCDnLhSCJn7V8EQcCj1qQZWRWit+OOXgtlzmfDqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J0+4vYn6V58GoIzXp+xSIwBntwcILufhZ/qd82A9Q/1cTfbNYoJ8GvPwTCbZrkWAo
	 /Z8nl401u4wPpI7tTzTfXig2A6ZuUWSR7C7uUZIVKOHtQAVFdQ6eu3BIDpkTzXzEkl
	 9HcMCeb1acYI1OCDsNX1gvRyXDWS/zw3zsn1w8wNInJSjkGFyFCPMiQrO8Qyml/xFB
	 joJy/4z3BJ4t/zAkda+q12WFVMfapd/kj9wcKjX9IyFwnMnrrLWB/wjDcmH0CnzNFz
	 YwX192avhuY6q897RjE1qV+f3gpLWAgvXcA/2LdksSnv1/wzozS8xG4t22H6gGVCJK
	 cMdgvJSdIEgNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe
Date: Sat, 10 Jan 2026 13:11:25 -0600
Message-ID: <176807228427.3708332.11079450921904072732.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216013933.773-1-vulab@iscas.ac.cn>
References: <20251215074125.2089-1-vulab@iscas.ac.cn> <20251216013933.773-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Dec 2025 09:39:32 +0800, Haotian Zhang wrote:
> If cmd_db_magic_matches() fails after memremap() succeeds, the function
> returns -EINVAL without unmapping the memory region, causing a
> potential resource leak.
> 
> Switch to devm_memremap to automatically manage the map resource.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe
      commit: 0da7824734d8d83e6a844dd0207f071cb0c50cf4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

