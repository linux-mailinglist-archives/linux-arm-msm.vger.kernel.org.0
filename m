Return-Path: <linux-arm-msm+bounces-79053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBA1C11D22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2DCE580DA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F2A345740;
	Mon, 27 Oct 2025 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeZnF4zU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAB343D66;
	Mon, 27 Oct 2025 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604520; cv=none; b=bSi9CqM/Fcs/o1aOhWtAn1vlEd7aWYFXIp+VKtEUD0VXb7CsNgl+lc0Y5d7OkgittrpzxhsojPzUWZz2FPx+x+ltLEQrD9hZ7uxLfP5pbNM8EW8wDNOrBjQwuBxCtU7bquarg7z5hrogGAxj2Onv7UL/Uluo5LgdqcDWTaxko2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604520; c=relaxed/simple;
	bh=saL4Ssn2TEy6ijyFGXNBKuU0eSPNK1Kse7jCBorDwGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1uxsLnIH3B/k8bx7O4hrt3WBHcU9P0z9hepO+kR3crfuqML8NAwWtW4uEWjDTgrywol9c/kWMRKhCnp0pz9fKRMrxMyPa9YdbIyIgOyXdikvmVDG8947cwFb0Wmp4fAMkxCihKS2hWTG5xaryDzyAcnlzl5K8kSzPxwFwAKdH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeZnF4zU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D45FC4CEF1;
	Mon, 27 Oct 2025 22:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604520;
	bh=saL4Ssn2TEy6ijyFGXNBKuU0eSPNK1Kse7jCBorDwGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CeZnF4zUXNwMh6/Zg0PXuY0PU2L+sagAaBSctCvqzRQFUza2bPKG/8sWtY/kpqrvW
	 brv7SOxeqQsOLnlTIPJvn8mwmIiGGDJHzAsDHrT5vJHgHfIaIO+yAD/pzLFnS2pOuN
	 MpuOP1uXHc0EUwKcykeVllRe03Ra1KAQXeUD9gO3P6R461xwU60D+KvrtoQyP1bJyZ
	 AI6a3ErzGXVauuT0eeriLupOS/evD7QHjJ9OuQepKsuw08iqiXI/WQQ24uDW1wpMuF
	 bqvv6crkYgfYrJ4sdWXkLQ4CWculaDAn4fPSPlJ72UoyMInmEy7LwXpTrcSiYPQaKu
	 dX7FGW3PkLKkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH v2 0/6] Further bringup of SHIFTphone 8
Date: Mon, 27 Oct 2025 17:37:13 -0500
Message-ID: <176160465210.73268.325876272935635172.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Oct 2025 11:06:30 +0200, Luca Weiss wrote:
> Add some cleanups and fixes to shift-otter, and enable flash LED, RGB
> LED and Venus.
> 
> 

Applied, thanks!

[1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and indentation
      commit: 03eb18495d2d91214e840064641eade208fcd8c7
[2/6] arm64: dts: qcom: qcm6490-shift-otter: Remove thermal zone polling delays
      commit: a206ee34db2eff05d3d58214ba2e827824b2bc7b
[3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
      commit: f404fdcb50021fdad6bc734d69468cc777901a80
[4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash LED
      commit: 2fd302ea31af00eff7d8e2c9fb13209ea6959195
[5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
      commit: 66e74839662d06ddd11b310a8465b91802030531
[6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable venus node
      commit: 6e66efe16bde9c498789d8156da3aeb0b24e9c90

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

