Return-Path: <linux-arm-msm+bounces-57765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6ACAB5E12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAF207B28FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9F720B7F3;
	Tue, 13 May 2025 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRN803rF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AC11F3B97;
	Tue, 13 May 2025 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169227; cv=none; b=YXz7n+y+/0Jt3IReJG/LVnPNru7WksHilSyTIF7gdWZw7ZyHaFaot2OXYVlA/HlEVKbv/Sd0S+8cMxOKk+WBrBH+fDrOSSLiMEflr2WpWhhgaXURwtyzotqI/qA7u6/NUi6L5o32/3amIqumYW7d2Q3zWcgs+XEY6TRvLwLbgp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169227; c=relaxed/simple;
	bh=8n8/bY5LAWpyfxrimtYmM53zT/Z/g9DhZOdMQxbL7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dy827/TidNr8vn7LGvkT36zCaoCMGf28GxVcYNIqoch7h5zTAioXjDTTfQc7tsu8CAjtf+uPFF1fK9oVcLA3fV+Wy2Ir8N6uHoWHEvBsAItA07bJ1rYAJH8K58OKnKQIGBVLJr4UEH61oZPIPdURzIpUrXqSqOIXUK61tjrfzyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRN803rF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD33C4CEEB;
	Tue, 13 May 2025 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169226;
	bh=8n8/bY5LAWpyfxrimtYmM53zT/Z/g9DhZOdMQxbL7qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRN803rF3MXyZo/sCduaCDqXHx54TbHvRsx8w0qF/iQNvLa/JEtjgSsZTNFXax0m9
	 EVsxISYB+ng5o4jPweTZk4/SR/01QKV+2x3YATBZjKPFV5muyrq29w++yXuPHjjXuX
	 AOiYTOoxHnkoQ3QYmsa3abJ3+G+NI80sKbM4fe7DYdNplJ+so0p3v6KGf+Tdw4pwOC
	 22xRL+O0l7l9eCKips+B/n0rsDupZB9R7bhn0d6BLBMPZ8fz4V0ymDzdTdsSdNVDU9
	 xxQreElLyMpJUiUw94X0kEc9Dc6x5rFkqXc+UrcfNnRL7TjoaSz7d+QS+yDy3/fNRV
	 de0w1JcirHYgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] Add DisplayPort sound support for Fairphone 5 smartphone
Date: Tue, 13 May 2025 21:46:41 +0100
Message-ID: <174716895375.39748.1659820530327447413.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 May 2025 10:01:36 +0200, Luca Weiss wrote:
> Add the necessary sound card bits and some dts additions to enable sound
> over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.
> 
> The UCM files can be found here:
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> This series - in spirit - depends on the series enabling DisplayPort in
> the first place, but can land pretty independently, especially the ASoC
> bits:
> https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound support
      commit: 8fc88fbd471044d66cb2fd85dc0d431866ed7448

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

