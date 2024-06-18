Return-Path: <linux-arm-msm+bounces-23106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2590D68A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 17:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C48421C2328A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EF51C698;
	Tue, 18 Jun 2024 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TcPgzO3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7191C6A7;
	Tue, 18 Jun 2024 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723183; cv=none; b=aDok0JVA8f3R3p69dF6kazJTBRNNM82o9CV3Xs4xKnGECoOyrRSVCkQyeQtStcBIV6VAxYHkiMrK1OEF6coLElEzhG9FI7mDqxehkQdyWhlgaq00mV7q9WbP90RJlFIJyizr9eRGH+N4onrC0Lk1HlcsahzPYyoUByK92FGRp60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723183; c=relaxed/simple;
	bh=cTbpVT23FE/WdzJQYZy+vAP+uyhaBpAzNVPE9fPplag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uy4JiiLo2e35fDnOYUUHHfMXTiW2jnJgVYBSC88De0D6A46BbOPD1NfeK9tO2zCc27sy1xG4lSnpFeRawLNc/RfKawatwSl/VohbMUOR31Af2xOEQre4P1SNQlJb51jDkwUKDt64FCcBrqEn3DmkBKe66vXI4IarwWbCt5DfPuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TcPgzO3d; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718723180;
	bh=cTbpVT23FE/WdzJQYZy+vAP+uyhaBpAzNVPE9fPplag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TcPgzO3deaTccIkpgSR4l5GHYEa1/1Nd/6rbe9PZsM/lscs+kHQ7+CMyuvks22NPd
	 Hv75ZTy4yYSjkUrFAhuWMSZBM6E5rh7rWKi3Vr+MBRwQokslmEoG5i+gCUfbu9hK29
	 AQpboHeiI+5/7qG4V84zS7a5j8GUQCkYGtyqZzh/sY+XUCr+QgkBTqGP0TbkZtYBoV
	 rvCv/iDSbdXlNVZbkR2of/lKC0YJmIexUGYLa01iu7vK8AkpmAI0BzuWAidx6llUhe
	 ueOu2igMvTSj/CHuxPbLFZlMHTCgYLwLa5VXfap1hPbDaENnntCgXdiyqGZs+jC7UN
	 7BoRo9W+njIrw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 541B73780844;
	Tue, 18 Jun 2024 15:06:19 +0000 (UTC)
Message-ID: <dd33eae5-4d5d-4210-aac1-69d1c0339911@collabora.com>
Date: Tue, 18 Jun 2024 17:06:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node
 where unused
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
Cc: kernel@collabora.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 14/06/24 22:59, Nícolas F. R. A. Prado ha scritto:
> Currently the keyboard backlight is described in the common
> sc7180-trogdor dtsi as an led node below a pwmleds node, and the led
> node is set to disabled. Only the boards that have a keyboard backlight
> enable it.
> 
> However, since the parent pwmleds node is still enabled everywhere, even
> on boards that don't have keyboard backlight it is probed and fails,
> resulting in an error:
> 
>    leds_pwm pwmleds: probe with driver leds_pwm failed with error -22
> 
> as well as a failure in the DT kselftest:
> 
>    not ok 45 /pwmleds
> 
> Fix this by controlling the status of the parent pwmleds node instead of
> the child led, based on the presence of keyboard backlight. This is what
> is done on sc7280 already.
> 
> While at it add a missing blank line before the child node to follow the
> coding style.
> 
> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



