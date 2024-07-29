Return-Path: <linux-arm-msm+bounces-27161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C67B93EC0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7791281CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE1180BEC;
	Mon, 29 Jul 2024 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLJKHBUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053B2AD15;
	Mon, 29 Jul 2024 03:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225519; cv=none; b=CC1Cj8nA72M7YGikRqttbhH2WQdaaD1QwYzTqDWnvuZ84sLyY4wIOM/6hc+BPrBivdBwn7PTE+21L2d6TLGa2Ch0KIfmYksxKjUUnHioYL84U7I0HW2JYsZJwG+HuQCdjMBGyzsjxgL2JGUKj8FH7QGatZ+ivZLosKPshh/ZOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225519; c=relaxed/simple;
	bh=vvqVnCeHJvgfAzD1HkRbya53CiHXZp2IQuZWKejiS0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXG9eHDobYUbDKiEWBwkxLy2Z2wjkJGlJgtdk114IqjohHMtR2evoUpVlgPzRYR9X66HASDONkhHiqAOwcj8pQXtQdeDkP8TkwEt94LiqLXTIUpDjhfl3Jvli4sl8LYbiWCLtEAEmOGMYU7afPMRXbc8jIBCpd2Fd87x2Vt5n0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLJKHBUh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FC4C32786;
	Mon, 29 Jul 2024 03:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225518;
	bh=vvqVnCeHJvgfAzD1HkRbya53CiHXZp2IQuZWKejiS0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLJKHBUh8GQpaunc7mmLuiXQQhC5caVby7i9aGLM9M/NRkaphE+Aun1h/qV9znyuZ
	 zkSOcwXU/hMFp1oaDjW9+8F2btWN0RGzvG+zBIzAHbQHWZqMaNQk2fxw8pM7LfSX1d
	 U22/axuLeWPe+wHrLgM1iFlT1tCluhHVEzONdEZHPPXp3q5UIsdjcBLGeSPU8d7+co
	 7qov1RDxKHHkFzb/REIo07xfoqt8Zqz+cG858DZc78TJy6uoXNC7w4LZ02TC/65FAi
	 oYOKsvsZFiYzkNTgx00h9l8s4N2Bflp9tImY3sR+RMO34KLTahe7+igZUoH4Pex0rm
	 O3qKPQMguuUdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST
Date: Sun, 28 Jul 2024 22:58:05 -0500
Message-ID: <172222551299.175430.6158692391772729987.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725-pd-mapper-config-v1-1-f26e513608c6@redhat.com>
References: <20240725-pd-mapper-config-v1-1-f26e513608c6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jul 2024 11:23:33 -0500, Andrew Halaney wrote:
> The pd-mapper driver doesn't make sense on non Qualcomm systems. Let's
> follow suit with the rest of the Qualcomm SoC Kconfigs and depend on
> ARCH_QCOM || COMPILE_TEST to avoid asking users about a config they will
> not use.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST
      commit: e4ab5d7cb5f19858305395e034f214c92afc3cf5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

