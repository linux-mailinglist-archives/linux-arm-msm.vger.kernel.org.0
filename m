Return-Path: <linux-arm-msm+bounces-44192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B08A046D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8BD165809
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1D51FA8D1;
	Tue,  7 Jan 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tH2DrtAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523241FA8C9;
	Tue,  7 Jan 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267968; cv=none; b=t881jUNIp7H31g2Y3tbtG6sAfssSWdeU3Vvh+b7B17+86kuwdFjxgiZyKf8OlCpNk4V0pPP5frpZuIFLEYWxkEB1QjhIUUxnhWci/wPzv9Zbe8RvL9PEAToO1wzLhoHm4bNdlNywdgDGclbiAWMOdPF3TQeSI6qiW3f4BohvuoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267968; c=relaxed/simple;
	bh=ac/nFydEqRws7qWfNn6C7GUDJsFaUUZdTXUt2E6Db0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISe64/+ZqyUSlAEKmXzj4V1xGYhB8mY0ib0cz3mHyAl4crP6zKJ1d8y0MaqCLx7EHXDuVIY4n9T4AiEeYbOVp6fQKN30I4kUfxiSjJtemAr3ozhH92fm73cYKeETykbIQlJta2EEKjJ+8Gn6z+rrCyB3yLDwUS+HP9ORw3/zjyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tH2DrtAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CBBC4CEE4;
	Tue,  7 Jan 2025 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267968;
	bh=ac/nFydEqRws7qWfNn6C7GUDJsFaUUZdTXUt2E6Db0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tH2DrtABYRGX6YxCf+YYnKYvLV38tfvngdZyYLu1bcJ46CP7cJTc0NDy/N3tO3sV0
	 iHfD0MkW1nsHhMC2ordGqk2yC9uhYORm7V5SEk+CCekcX9TbXDyTcfEFrRY9Nwm+oE
	 BZoJ59CKAZ7GcCMLaIb9A2t+omfYv43BPbHLX1eor06lafjn9Cdyn7qR/zjLuvoEq8
	 s5wPTVsdtGBKw8udvRbDU+HytuNWlli1VwgDUrrprQVKaYoMX/BAB9XIMEWwgupNBb
	 oxxLn1dyyIpt1pJEouTDsmuqKMwd+F/4ivvoObpuIdYKinUVWNIBiMea7filcqtOpd
	 IVxRYdZC/TyPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Avoid out of bounds read of serial number
Date: Tue,  7 Jan 2025 10:38:56 -0600
Message-ID: <173626793394.69400.14376765703036416541.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230-qcom-socinfo-serialno-oob-v1-1-9b7a890da3da@linaro.org>
References: <20241230-qcom-socinfo-serialno-oob-v1-1-9b7a890da3da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Dec 2024 20:59:35 +0100, Stephan Gerhold wrote:
> On MSM8916 devices, the serial number exposed in sysfs is constant and does
> not change across individual devices. It's always:
> 
>   db410c:/sys/devices/soc0$ cat serial_number
>   2644893864
> 
> The firmware used on MSM8916 exposes SOCINFO_VERSION(0, 8), which does not
> have support for the serial_num field in the socinfo struct. There is an
> existing check to avoid exposing the serial number in that case, but it's
> not correct: When checking the item_size returned by SMEM, we need to make
> sure the *end* of the serial_num is within bounds, instead of comparing
> with the *start* offset. The serial_number currently exposed on MSM8916
> devices is just an out of bounds read of whatever comes after the socinfo
> struct in SMEM.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: socinfo: Avoid out of bounds read of serial number
      commit: 22cf4fae6660b6e1a583a41cbf84e3046ca9ccd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

