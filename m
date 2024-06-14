Return-Path: <linux-arm-msm+bounces-22760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6232909457
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DF61C20896
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5001618FDB6;
	Fri, 14 Jun 2024 22:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPlFy5Hm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5818FDAE;
	Fri, 14 Jun 2024 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405349; cv=none; b=FhDNrlkprkxTTWsorRLvxN+SxuZ2d6kJQUqZLXrvSCFuYMs7gufL92NLoJU5E74yNclu3s2PZjys8ENwB0uBPizgM6JIiSXciYHj3KfIu7+4ult391DTAzPZJJQFsgr2jwyP746PWIps3zz7vDI05nx45cVoZEMdPrdorRAJIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405349; c=relaxed/simple;
	bh=04MRwLrUYtTgvQGPZCVO57w5ljUrcxqm8yRC+uHUWgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgadwV/xR3sFKF0MwnMaAqJBiWCf0/dRnZrdA87W0rHOTnLE6+yi78Pgkv+Yo3w3HE6JXz+YnT/CiA4vwlSd+uAukm90QK5gtzFI2ksCLvMaqCz01srvs9na8RBBavHQBW/MTCGi878+OhjUYGTp3K87yKj+mLO3u9pZoH1bepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPlFy5Hm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6572C2BD10;
	Fri, 14 Jun 2024 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405348;
	bh=04MRwLrUYtTgvQGPZCVO57w5ljUrcxqm8yRC+uHUWgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vPlFy5HmfVZvOYWBaYiafXN7uIz7EJ+ebJE2emYqLSzpMvSs599ieUwUQ0KxN5e/E
	 Nyelj0iRqBZCzKohihMopLfxk7q0tyrj/EUjQw7B+3M+O5N6+0XxlJeULMqMnV3RcD
	 AT3OaxWoB8j3TjMj6qHxEFnVYLOTXZoU53W+Jm01oJ6FPfSDRArsHuYP4h4miKY9ek
	 Wv5nXHIpL3U7GnLoqkdgOsmiG5x4kEWg1s2Gox0lHOA2YBEkJIl1CRPSscOhZOUfTa
	 nzafwt+T3HW2NaLOxHyjHswdfEm+LAcJp0B9QmObm290f5VVHFn9dtxtxy7pUfIoLE
	 SUzs7w2MBukkg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: motorola-falcon: add accelerometer, magnetometer
Date: Fri, 14 Jun 2024 17:48:56 -0500
Message-ID: <171840533355.102487.13630499618439886724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
References: <ZmWMh6fuLasvGkR/@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 09 Jun 2024 13:05:43 +0200, Stanislav Jakubek wrote:
> Add the accelerometer and magnetometer that are present on the Motorola
> Moto G (2013) device.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: motorola-falcon: add accelerometer, magnetometer
      commit: 5756101babc5334a9bc99601d1cc0d6776fa9ada

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

