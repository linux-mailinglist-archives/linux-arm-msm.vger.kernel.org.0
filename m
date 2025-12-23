Return-Path: <linux-arm-msm+bounces-86401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CACDA285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1AE73038FE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C525F349B02;
	Tue, 23 Dec 2025 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnPUCLNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC1E2D192B;
	Tue, 23 Dec 2025 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511895; cv=none; b=GqsnDI51/e+qtjGd4sh3WHPpfSut7ps//Qg4U83jj1E0Wy3bhzmmRt7XtfIwwVJJb/fWzv6TY5nA1QPmuZ+Gt9ob1n/ildlx3GitqwZmiFKPYdgXuZ9gdloXw1Lt/7hcmjLk/4WbWCciKhOFJGNL5rpwf7GAOpPYV7a714ZlB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511895; c=relaxed/simple;
	bh=l7mFE+aHlv9elt9m4WL244nW2rM2t55/72xk3+kAv/M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XypjAWZtznrqQfLS8/h5ZwimV1uFd3Z3TJCpbUnyCRCx0LFmJ879FCaIYZcXythc1e77DQRMSQkazQX8KFRYt8qF50u7Sms6eSi0B1X3HB9AT9D6kC9EMJASX18JtnFyeZJ7JVuXV3ItIsvzBl/sop99nRN2v981XtuZF3ZRxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnPUCLNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6A7C116D0;
	Tue, 23 Dec 2025 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511895;
	bh=l7mFE+aHlv9elt9m4WL244nW2rM2t55/72xk3+kAv/M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KnPUCLNsDbZ7n929nA2bYR8VgxvrquI4fquSi9LSR6nW0IA5PCUFSpafqBO6Fpmg5
	 v6LKO1hdWOv8zfNTbOpKcvFoV+4sttWVpdZETWjxvE7bjmjfeiUf1iEpccAY1P54TG
	 LqTsyGw5BhJbYUF0Wx5P4bU7iW1NTYA/y/mC77eICgIbmQLiKwgawQwUjhBzZ/ToBf
	 gFYkYosImn/sVrXyvlhTxTkmvG3t7/LLZQSey4Snxc2/OzS2nNlTzbj7AraFxrx7nS
	 yKRvSrjDOrr2IX8uxVUrIPiFZwAfxykEh9mHRJ+7YXMWbE4xg/KG+gMN86PCf4t26z
	 PkQ/pEUf5+fxw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krishna Kurapati <quic_kriskura@quicinc.com>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Chenyuan Yang <chenyuan0y@gmail.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20250905101243.14815-1-faisal.hassan@oss.qualcomm.com>
References: <20250905101243.14815-1-faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom-qmp-usb: Set regulator load before enabling
Message-Id: <176651189214.759340.14310751563093717054.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 05 Sep 2025 15:42:43 +0530, Faisal Hassan wrote:
> Set the regulator load before enabling the regulators to ensure stable
> operation and proper power management on platforms where regulators are
> shared between the QMP USB PHY and other IP blocks.
> 
> Introduce a regulator data structure with explicit enable load values and
> use the regulator framework's `init_load_uA` field along with
> `devm_regulator_bulk_get_const()` to ensure that `regulator_set_load()` is
> applied automatically before the first enable, providing consistent power
> management behavior across platforms.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp-usb: Set regulator load before enabling
      commit: 346ba84646355d651bb301f66137ad4418381a8e

Best regards,
-- 
~Vinod



