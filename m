Return-Path: <linux-arm-msm+bounces-24062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8A915D3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 05:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD4C1C2126E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 03:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7FA4D13F;
	Tue, 25 Jun 2024 03:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpr8kU8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575254BA94;
	Tue, 25 Jun 2024 03:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719285390; cv=none; b=jdpfgZfccrdz00roGzUaYZyEkxMc5RgzyL5lKpw27IoX8R+Af3plYtSG7FDendC6dd8Qc3AUAodRX2E7vzUqVesgSTJmDLsc+1p4Q0J0lhlcQgihI0HcWL6JnnuDv1IJAW0/LqFJSk6uKBrHegHH5TuGNGtCqCjZJyeCoGWKyaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719285390; c=relaxed/simple;
	bh=rOTOxM/UbkKrcInxCB24RhMXUDzg8lvf241J4Xb53hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ljw73L7x+aVhsLnMBB9pn8ut8rbAEduGDfNmW8ZTt7kNwBa3H157iPBqu9uBAD5cz9Srcp6zKCjHfDOJXuC6l8qlPLkqbpfQQgmBw8xmchSyzmEz7AfguaopqXChGFyxLTi/LauvzEKDz3SMmxlDRYSdoBHWO/d7xeNJH/t3eC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpr8kU8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE3C32789;
	Tue, 25 Jun 2024 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719285389;
	bh=rOTOxM/UbkKrcInxCB24RhMXUDzg8lvf241J4Xb53hA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tpr8kU8pZN4K3YZh7GPimpVKWJKoTFDlmry33NongBMJEDPWTFwXg5vUYvFd88Bsp
	 j6VuYUV6jVgUhMWRoTe1NoUsqpVZBtalVRH5yEcaTBi2K0spw78fNHUjPLUrclm82G
	 Lz7DLMHo+Mp6BUrDkysMSvpwpKZrJQX5DpNb9s9oYR7fWBmugoMdWaKJzbhpt87SRx
	 957tsftugknT8jmxD9UaH/4kGg8wdZZGWN574UYWwbKOHknafe8Iei1olv3dypoRKI
	 9c7jetrHmHdfYlrBYpVqWSQ7eADqVIr7/NmNffkvBQyRPSKYChMhUJPKBJSJbI7vJN
	 YCfrgb86nA97Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Steev Klimaszewski <steev@kali.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>
Subject: Re: (subset) [PATCH v9 0/5] soc: qcom: add in-kernel pd-mapper implementation
Date: Mon, 24 Jun 2024 22:16:25 -0500
Message-ID: <171928538270.25855.4993022152157455848.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 22 Jun 2024 01:03:39 +0300, Dmitry Baryshkov wrote:
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
> 
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
> 
> [...]

Applied, thanks!

[1/5] soc: qcom: pdr: protect locator_addr with the main mutex
      commit: 107924c14e3ddd85119ca43c26a4ee1056fa9b84
[2/5] soc: qcom: pdr: fix parsing of domains lists
      commit: 57f20d51f35780f240ecf39d81cda23612800a92
[3/5] soc: qcom: pdr: extract PDR message marshalling data
      commit: 0ac5c7d933de6570e0efa62bb5ef9e440311a6fe
[4/5] soc: qcom: add pd-mapper implementation
      commit: 1ebcde047c547134e894508468ead0b7bd3b967d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

