Return-Path: <linux-arm-msm+bounces-58566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F958ABCCF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A1A3AC620
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E201257451;
	Tue, 20 May 2025 02:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aExZpdTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60A2566D3;
	Tue, 20 May 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707307; cv=none; b=PFWW2ULYLUaLlTxfXgUhVSpiXw/gVRta9gfL1gbwYEOTlGhIsqVpfpqq7pI6xJu4JjjRqTTt2ZhtwhZ/nU5+9EeUaptySBhK7GmU0UfK6bWACqYIV+ELQ/0j3o3QeDrFu0vEzcpzcUNuEGrsHsPFiieoVrM3aoEP2FH/xlw7ntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707307; c=relaxed/simple;
	bh=z/G/N3q66G78UHUKj/fg+czJFO8bZ4e5VQ7K7CXu1b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JN4MeDKOwY2dG28dCLau665XHlPSCjsxVfoTwrdp9QxG2xnagduH3O/WGD9TSFBV3FytvCKvEVH0+5n8xTRMDtjB4pylgIXgQDEjaMHsKD89g65FEy/XgQTCIcME5DIwtFmibzhpxLVYDQAIbLnh4+KYkWh0Pqhhh8jQ70I/sVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aExZpdTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2EAC4CEF0;
	Tue, 20 May 2025 02:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707306;
	bh=z/G/N3q66G78UHUKj/fg+czJFO8bZ4e5VQ7K7CXu1b8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aExZpdTQ6KR3+7WUYCNM/SoFT76NAcvPfqZT++wyNA+4JRWd96LVf42vmcPaDm/sU
	 NfaXUlESP9kJq9KG0S1H+pQQSj4QxE64foqPeUg5tZzLSBNPI5cYbck4Nb6bwAEmy1
	 lGo1xCK+hwOcXSpqz0sbHrpF4cEoPdVwc3P4rISjS+hvRYSSRB05w2PDVVjJmyAAvD
	 f9n9HAfha1QF5lP3adxfSfhc0XWYWyku1i8LE2KOPTS+zHu6n88cBnvYTDRh2pQYj0
	 Q6Kf7pPNWDzLR9M781xeEuhcGbkInHw5E5zioioekCzu4ob3C86Jih3oONlKzvZ0jF
	 Sd/h0bCA1PDTw==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 00/12] This is continued work on Samsung S9(SM-9600) starqltechn
Date: Mon, 19 May 2025 21:14:38 -0500
Message-ID: <174770727707.36693.1243860742774752088.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Feb 2025 19:38:51 +0300, Dzmitry Sankouski wrote:
> Contains starqltechn device tree changes.
> Add support for new features:
> - sound (headphones and mics only)
> - gpu
> - panel
> - buttons
> - MAX77705 MFD:
>   - charger
>   - fuelgauge
>   - haptic
>   - led
> 
> [...]

Applied, thanks!

[10/12] arm64: dts: qcom: sdm845-starqltechn: add initial sound support
        commit: 58782c229e3e17100657af8cfa4b962b76244f4e
[11/12] arm64: dts: qcom: sdm845-starqltechn: add graphics support
        commit: 70005c18c9f7e1afd432b989002f379032c893b8
[12/12] arm64: dts: qcom: sdm845-starqltechn: add modem support
        commit: b20bb726603e16ce68876a309fec49335ed5ffe0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

