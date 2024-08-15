Return-Path: <linux-arm-msm+bounces-28705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393F0953C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E93DB28736A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA99C172BA9;
	Thu, 15 Aug 2024 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opvpgsWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F8817279E;
	Thu, 15 Aug 2024 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754501; cv=none; b=Yrs4MXZMZv0Kf9erodPaTT+bwWCOeoIORKshCazAcKwWJorTjk1OtXqiDv0POE5CMcKyuSvZ2hXDlF0RYgwgDR9OJIxe6Ppl17PL3z7WsWNV14L+SN5eb94e2Nuq9O3yDyqaRs05m8810fiuo38gOO7Kbv6C0GUfKayQ/IIoXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754501; c=relaxed/simple;
	bh=plFYLz3qZ5uLAJRk/eDPWBD6atb5l+TeDeRvVftkjcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5B+aN4Gk7RrHSkjO83unzld9xlEvH4hT2wM8lvQT0IOa8VEFDM94K4C3KbHeqBBDKFeSAnZqPtsYe6zKm9/xioP3IAI2C7c1fL3vmQPcCzOHfMypl7bg9ShTrgMEdwWOvQpkjPWmx+RdS1rGMHEmCLov2oI6W2kodaXBC7FROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opvpgsWI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6A0C4AF09;
	Thu, 15 Aug 2024 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754501;
	bh=plFYLz3qZ5uLAJRk/eDPWBD6atb5l+TeDeRvVftkjcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opvpgsWIrD2pfTFZEdc20ydJcHxbapac3u9+BsRVHB/6QyhLbCnP2V6X2INqadxun
	 8wKFJ3EJvMZ+OtJUrxpry9kwqVoyrwQ0cIAiy9yc8pCDsUYMfNaQOEt8FMUmRgabRX
	 s480TMIs8YMkSmQOqVu6i0WMFUizIy0XL+gIptPOUtRQPTbmBU4EToea/bMwJKHWPP
	 dGxIcKVvkLFJcNPB/Doh/2/DH6ov3ZoBqBa8rM0BuxYP0RSlcKHGagB8fVT8TgVidQ
	 /Q9OwK6E6HvYvIVNWTfN1x1AY5ioSzaqYnA8Uknw4JNWbTTugGhzZwU/KtaH/aRfRb
	 ku1LLVIYQKHJQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/2] soc: qcom: pd_mapper: Add X1E80100 and older platforms
Date: Thu, 15 Aug 2024 15:40:51 -0500
Message-ID: <172375444805.1011236.7812815658652492158.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Jul 2024 18:22:08 +0200, Stephan Gerhold wrote:
> Add X1E80100 to the in-kernel pd-mapper to avoid having to run the
> userspace daemon for charging and audio functionality. Also add entries for
> some missing older platforms without protection domains.
> 
> 

Applied, thanks!

[1/2] soc: qcom: pd_mapper: Add X1E80100
      commit: bd6db1f1486eedb8460647b3fbe9b5ae8fd09207
[2/2] soc: qcom: pd_mapper: Add more older platforms without domains
      commit: ed2c37520893427dfb8b615fcc6263af796a0ab1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

