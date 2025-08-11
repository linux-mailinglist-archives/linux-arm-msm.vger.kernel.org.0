Return-Path: <linux-arm-msm+bounces-68596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B46B21949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F266C46306D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C400280CFB;
	Mon, 11 Aug 2025 23:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDb6WyG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF9280329;
	Mon, 11 Aug 2025 23:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954852; cv=none; b=SuQco8DgvwCu8vh9Q51uHr47wYu9blPWdrgLmyDW2ON8BpSM9Xf/JDQpxCOLAjr4cDdbU0zCJOsUL9bNkR69GvrKBPuSjbPhPt2V7Y0MBzZc5NuhE4QrauDkUK2foizDpDrP0Xk+c5w0IVNFcoFOOusBLNvcpp4BqStlERKskEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954852; c=relaxed/simple;
	bh=FHFg0xJKWlFTi3MTsePgnAcfNPmkmoUwMw1qhfHJSqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EANDDqTo6YH+h73UB3DoJl0+oLHJbS8Ey8fJQgyKw6ePJnQiX47fBpkyMwlVHPL13Hmj1jQjZBKWKXxcX83jdoxRcMRROsBjJoYwOnWq5NfldF6Qol6ct/h1cjtPel8d5cKygaVDqgh40GAjo2x6fgi7k5ssTbMyfbyTsna3Qzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDb6WyG5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88168C4CEED;
	Mon, 11 Aug 2025 23:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954852;
	bh=FHFg0xJKWlFTi3MTsePgnAcfNPmkmoUwMw1qhfHJSqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDb6WyG5tvYzrr6luojtNV/cD49RHMUHhfyGe3C2n4djOBWD2qx4qvtNO0lx6Oc6w
	 ae1s1HC5MMtXv8KXFZBzhLqlaRXJwSdQWiZc1DGnLH6U172Fe4jb5OXkrtf9koJAQ0
	 ONZ2JjK+DypQBXoDy0XsfG3JsQ+WvSh7dOV8qTGALVr9iFesRtb3Pe5vOCbEZ1VNZU
	 aR7kSKxtjsTU8DTLqUuj5Vc2ajS2C30wb4HOYyj+BlSDfpA8VTUSOjynz9yaa4Lw/+
	 1VzzDfCZ9GmoJD90Fth0o+BWHyI1iw1UCTcN1qKyyDhx0mL0uYqsNIih2rnCAFOf3X
	 kmctTqS5kbHxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: tzmem: disable sc7180 platform
Date: Mon, 11 Aug 2025 18:27:04 -0500
Message-ID: <175495482434.157244.1529071502369291928.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru>
References: <20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Jul 2025 18:28:03 +0500, Nikita Travkin wrote:
> When SHM bridge is enabled, assigning RMTFS memory causes the calling
> core to hang if the system is running in EL1.
> 
> Disable SHM bridge on sc7180 devices to avoid that hang.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: tzmem: disable sc7180 platform
      commit: 10a2bc3278c872db6841f2e3b738d89cba5e718c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

