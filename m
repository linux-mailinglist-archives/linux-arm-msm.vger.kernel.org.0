Return-Path: <linux-arm-msm+bounces-78932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F325BC0E4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E35C4237A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEC23081D9;
	Mon, 27 Oct 2025 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMxvyLtY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E92FDC3F;
	Mon, 27 Oct 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573991; cv=none; b=o0PSJgp0a8MaG5J1rYb3i5ZYoikTsSmHMnubDkpWE53P8RqnOCsbhTN15Cp2AJ1G8UN5HNUyCcwR6fl0zu8bPhpftqaxvo9DFUPJMNIUW98NIXeNT/1jlbpjGYJR/KLHpMppKqF2nPWOKEDolLa5fhhLW66TLo4EB1BWc54UI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573991; c=relaxed/simple;
	bh=ZJPOcZto9IVp+Sc14UzPqMCjcasyNdEsUuTxrA84pb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsHY0DxIpNMmigfml8r7h/QOtBbCqs4L1XGQUgJ1NOPdsFFAq2r201YVrXYiDISuwenWTlIawYwAHxagWM+gg5CdlIko8XorrCWqMTv3L0561O0xzivXUC1raSnJTK/LyIT5uv7nKy51jmaXlCEJ1zSqV8DfVFZpQhjNXEqXKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMxvyLtY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AB1C116B1;
	Mon, 27 Oct 2025 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573990;
	bh=ZJPOcZto9IVp+Sc14UzPqMCjcasyNdEsUuTxrA84pb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMxvyLtY6Y/LbKDsRV8CIiRN6DD5dPxipEjFLAD6TDM2ix0dSfm2oI+oOn8E8FI0L
	 Jof/8uXj2EAKqZsFGW+e2ul+1s6LFr21UwPMAl0wYi0wpYINGtb1jhnM7van7tx3ke
	 MOW+nM9ITE7mIEaBEosGe5cw/eT8l9ieT+kF5wUJbV2hBYDafy//lsTSDWozqzy7XX
	 1bsvmPAxCKpOQ0Qz3ZtdJcd58/VOtBTNFcoHCoi8XI6dI/6zeC1tKI5w6SEs1t1K90
	 ZKtt/IQ9rDWvoerFi66w9OXV5YZ96Xhx49m0NWRSTSIxzjmex+6mICXrmPaMpKUK+r
	 RvC7zpqtIlfew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: ocmem/pbs: fix device leaks on lookup
Date: Mon, 27 Oct 2025 09:09:05 -0500
Message-ID: <176157405467.8818.3435922572772732972.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926143511.6715-1-johan@kernel.org>
References: <20250926143511.6715-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Sep 2025 16:35:09 +0200, Johan Hovold wrote:
> This series fixes device leaks in the Qualcomm SoC drivers when looking
> up platform devices using of_find_device_by_node().
> 
> Johan
> 
> 
> Johan Hovold (2):
>   soc: qcom: ocmem: fix device leak on lookup
>   soc: qcom: pbs: fix device leak on lookup
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: ocmem: fix device leak on lookup
      commit: b5c16ea57b030b8e9428ec726e26219dfe05c3d9
[2/2] soc: qcom: pbs: fix device leak on lookup
      commit: 94124bf253d24b13e89c45618a168d5a1d8a61e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

