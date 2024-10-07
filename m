Return-Path: <linux-arm-msm+bounces-33388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B43992F24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D532285B35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB4B1D8E1A;
	Mon,  7 Oct 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8WNvQ+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBD1D8A16;
	Mon,  7 Oct 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311180; cv=none; b=C4Dq4a3SuqFndtCUatvbPR4LZaIFL+zavuzgRGCslI+mqlPhPf8mS5zv9nTJwDx6xW7elwdSaw/TMj2vUtxWiQWeQIlemDtpYwpA6nb81/ga5KPhVTCX5P5pPCj5zNiO0EhrgerP0BZAUBvYhUEUwejAWkz4bCxR7WTFODNqhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311180; c=relaxed/simple;
	bh=9j6MPuLUbHEBD6jadnWX+6ZascYtP/Svkvb5cbNgWt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GmwnBuSYk4Q7tfFJgkBffcV14bcOxybW1VXVVnPad0GKwv1PqAGjf03YgG+7U5bYiqcWyHOVaPRvrTMWnZwWw6lDzwlqGR+5LMCaPo/cWEIHB2W/lm2MduXrrnuYl5d3Vps3mUC1KhvuHk1v8d9mVo4Am74Fs6JvNpqbmR7oY0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8WNvQ+/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF3BC4CECC;
	Mon,  7 Oct 2024 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311180;
	bh=9j6MPuLUbHEBD6jadnWX+6ZascYtP/Svkvb5cbNgWt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l8WNvQ+/qxF6WAwOJMNf2yyDLU5zl/XwoB4Nsr1+gNXe+nAYxmL84MMUPV8QidIvj
	 8T/T91cYoiOdvuvRymgbBRSZi0ADa+PJo1EdgGCZm6m48WcUmVY+Rq3Vba8d/SxBiC
	 sMFmB2l9BMfbduv0MFCpdkmWrp0oLGuouuZ5aP2UgUz9MalP98+SUhmBVRkPf6Eom9
	 a2BQMGNlh0hs6ztQDPkZAFlwnanSoxf05lvJvaw8Ysr9njPb0u1MDHxrsiVJcOxz6I
	 R1OKIra8swDABxw5gWGM2eYj/+ERr9BKydFgFT7lMsMygEXjKtgOeq/8KcCcg9uUI1
	 KZ+eDnOLXnPdA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] firmware: qcom: scm: suppress download mode error
Date: Mon,  7 Oct 2024 09:25:53 -0500
Message-ID: <172831116166.468342.10983573311951807037.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002100122.18809-1-johan+linaro@kernel.org>
References: <20241002100122.18809-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Oct 2024 12:01:20 +0200, Johan Hovold wrote:
> When booting 6.12-rc1 on x1e80100 I noticed a new error in the boot log,
> which I had previously also seen on reboots.
> 
> Turns out the scm driver is incorrectly logging the fact that the
> download mode feature is not available as an error on both boot and
> shutdown even when the user has not requested the system to enable dump
> mode.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: x1e80100: describe tcsr download mode register
      commit: 8beaf6e08d986ebba38d5168ec1aeef4a66082d0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

