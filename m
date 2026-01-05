Return-Path: <linux-arm-msm+bounces-87545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39821CF5576
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6180530DDB18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D9E344054;
	Mon,  5 Jan 2026 19:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfSFsVlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365D3337B8C;
	Mon,  5 Jan 2026 19:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640599; cv=none; b=WBkzP6pCsKyx8k6kH3GwPU4/Pg8jSKe4QE2VJEapuAeL/rJqFNG75vb3CpcsaZmG3KpegybvJZQZgu/8mPdbp7PqfqDZiyEnLEqyKWRaSDvtCNCbbQfQAO06N3m8CpWgENvsZ0IGitEKlwFjniWa0Cq18e5EfcTO3zGV6yt15ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640599; c=relaxed/simple;
	bh=xuImhXP+cNSM5R+oQNq40Trs0AeZW5f8bbImVFJ6wnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDozVPSoZh+hJHdK7OIeN0tjCWJ4pqZWRkl6xDCt/Dwqd3BDBfbekKxesvj03CeCyI1GF8tdUPE+InyGCwrGgYgzQaerfdpW+bc3c0pwAzr5yp+ohsSvBysv1YRH4G2t/5UwvfznPvcQEXuLeYtCjMUYasoMy0sDZBy/7vLopc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfSFsVlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA95C19424;
	Mon,  5 Jan 2026 19:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640599;
	bh=xuImhXP+cNSM5R+oQNq40Trs0AeZW5f8bbImVFJ6wnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hfSFsVlz1cnH1Jjs6tUQdjY5jgwfCqZqzVrIO9c9sa2PjTwDVRBU7DJgW/tZ7seJX
	 2jRYFgje4zrTp4yz3tTa687g4iO5DTokJ0qRBZnK/1onBWsEOnviFHJq8wo4zzlqaE
	 vsP2KgFR5NkHbd2KPUFdRk9Adg2ppt/msobQGBkc3mU6j4jvhlmu3AS/wnPTIxkfms
	 WzUuKR69hSWoIASUCLN+2McPd/N6FASQ0upfZXp/Jhoz/CNaijCWc+x2YNTH92b6xo
	 8uwTQy54P9vIvBl7w1DBrFrWGEI/wzYpn3LVzXMhdR/Xvuufmh4H0hdzF1IUogotgM
	 9rQ99n/5W7iPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Georg Gottleuber <ggo@tuxedocomputers.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: correct firmware paths
Date: Mon,  5 Jan 2026 13:16:19 -0600
Message-ID: <176764058416.2961867.8767181298228995774.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224-fix-medion-v1-1-305747dff79a@oss.qualcomm.com>
References: <20251224-fix-medion-v1-1-305747dff79a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Dec 2025 03:09:13 +0200, Dmitry Baryshkov wrote:
> Per the agreement, the firmware paths (even for devices not supported in
> linux-firmware) should follow the SoC/Vendor/device pattern. Update
> firmware names for Medion SPRCHRGD 14 S1 to follow that pattern.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: correct firmware paths
      commit: a1a515c21dd70d1b761ccbf6efc9dd1ba6d26d77

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

