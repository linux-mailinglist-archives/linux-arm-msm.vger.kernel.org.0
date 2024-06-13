Return-Path: <linux-arm-msm+bounces-22589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B47039075D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553262828B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 14:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02EB14830D;
	Thu, 13 Jun 2024 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2PSVOG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521861487F9;
	Thu, 13 Jun 2024 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290640; cv=none; b=d/eILuHbsykKJFED2o4ZowhNHww1g5DUiMhLBfbifJXL4xQx9e3Icj6NIlhdbHesKEZE6VhSV/FPWR3RPBrgbP+UmC7vXdkC7kow5vsXm2IXWMu+b+b7SDCnrG3twtvX53o3REStFSChfecrPc21IkqHkPQPZzEXNNo4u9DO69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290640; c=relaxed/simple;
	bh=VpDZul0bhSNu3Zrovm6iLbd1UEv4aTxLzxdXk/cP2X0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nKYQ47y1hjqx4kihUd7OOOCH+J4BrVfAZFwdajVkytZ9rgPhFOdr5XNNL3y5t8cwIx59hiCXYSquzoz1T6JwnDUgB2qrn18UGipWdMbqBQKKy4WX1+EgBxByb3yqoFXWFArWirIwmfqIMrxqnQEb288w98BC7USUy7c7Iw5ytXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2PSVOG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BBFC2BBFC;
	Thu, 13 Jun 2024 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718290639;
	bh=VpDZul0bhSNu3Zrovm6iLbd1UEv4aTxLzxdXk/cP2X0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F2PSVOG0MlFsHAq/999jEQp7J8eEi49ExPpFlfq4Qi+2K8ypzQsEFAWq1RBP3uKcj
	 Xp7WL+kVAe17fCpXy6AytoH4TuXKgPL+eLOq38aTw2EEOpRKPAlEuBlv7srEhZ/EF5
	 omts0HGyoGQDEodHlc3vmdMWRFnv4dG8Zl+8KWAAVkeiLtMaqvFlNoVVE6pZlvNGV9
	 /xlqhTkS97FLN+e0qQTor1srVAJchM5U93UgD4sTmDG8c/T36MH2RahWAdNZz+e2zd
	 fiAogkV7OVmbeZzh3tVwNxRqEDE1F/VxincbIT/aK4arguf0wg1RH6WMECZuZi2VUr
	 lGIqyXdjcP29Q==
From: Lee Jones <lee@kernel.org>
To: kernel@quicinc.com, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240603-md-drivers-mfd-qcom-v1-1-88e48013eccc@quicinc.com>
References: <20240603-md-drivers-mfd-qcom-v1-1-88e48013eccc@quicinc.com>
Subject: Re: (subset) [PATCH] mfd: qcom-pm8008: add missing
 MODULE_DESCRIPTION() macro
Message-Id: <171829063819.2654460.17122304587816760447.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 15:57:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 03 Jun 2024 17:05:44 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] mfd: qcom-pm8008: add missing MODULE_DESCRIPTION() macro
      commit: 7d58eb159f217c69e5b6a0d71b3cfd5f40b367bf

--
Lee Jones [李琼斯]


