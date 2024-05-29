Return-Path: <linux-arm-msm+bounces-20869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3938D2A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128EA1F25405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAFB15DBC6;
	Wed, 29 May 2024 02:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt6Zt3Ei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E315CD7F;
	Wed, 29 May 2024 02:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948140; cv=none; b=aXCMziwpJAr5nSCUCdy3D08jZYXKsEmH5ioLMKZFgjq+6oug1Vfkwnpx8PhvRJ/enJZWGrfIemEoGmT0iHqqEpbodxbZUmHbYkEm6m7WVnSsEmJtGCuDn0AsSDA9As6rl4EC+m32ba3EyAgZwcWXlYZM+SqqtW+E247j0N+PB34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948140; c=relaxed/simple;
	bh=bNfqyCJDYSpjhiAOrW6H6iHJ8YzYQ6ciMWTUAKdW4qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fk2q76oNQ558kRJFyBAPwU90i2R9qfKjNp0uPLf76XFe0z9FySTMm4VA82mvRfVHyetaGonktaezg/4XuK3/YjShWScRNhyI3oUor5af4s8+sLELiouovVR8SsBm3w3yA5C9BnXpjVMUJ5K3t2BSW4pLhFHweAAKgDpiTSUOMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt6Zt3Ei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56A1C3277B;
	Wed, 29 May 2024 02:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948140;
	bh=bNfqyCJDYSpjhiAOrW6H6iHJ8YzYQ6ciMWTUAKdW4qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rt6Zt3EiFLphtLM2ggwE56Wr6GNB3DffaeBhcuMXta0dbTpNwp4UVc5qKHhxxpTVt
	 X7gVsmbr1OxJPPgPzSUKO+ONExSDBS7KQjS8RrpjKDdqGIDeILDWUX0ZlHfQZdz1+z
	 LmV0eezhPP/ds/g0uYbSTJUTHiTaBb3flluepk/VTphHwVsb78i0RbYWLqJ4E5qW9u
	 QBpFRlZRYPVhCfoXF+iDJhZSiCEJEmwo5PVdVQFRfrMwN5b3oZiWDPelXeJ59AD8HQ
	 VAXJ74MQ1+UB6OgaTy0hu1ZbOr0P8Q31I+PTdbb1iZMByQHD2xO3xIX+6KoJyqPQp5
	 mNyegEIBQVIJg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruby Iris Juric <ruby@srxl.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	=?UTF-8?q?Wiktor=20Strz=C4=99ba=C5=82a?= <wiktorek140@gmail.com>,
	=?UTF-8?q?Val=C3=A9rie=20Roux?= <undev@unixgirl.xyz>,
	Martijn Braam <martijn@brixit.nl>
Subject: Re: (subset) [PATCH 0/4] Introduce msm8916 based Motorola devices
Date: Tue, 28 May 2024 21:01:57 -0500
Message-ID: <171694812067.574781.16443469908872846310.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405-msm8916-moto-init-v1-0-502b58176d34@trvn.ru>
References: <20240405-msm8916-moto-init-v1-0-502b58176d34@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Apr 2024 19:06:09 +0500, Nikita Travkin wrote:
> This series introduces a set of msm8916 bsed Motorola devices:
> 
> - Moto G4 Play (harpia)
> - Moto G 2015 (osprey)
> - Moto E 2015 LTE (surnia)
> 
> The submission brings up the following features:
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: Add device tree for Motorola Moto G4 Play (harpia)
      commit: 65321d09e38bfbebd0e66975e021b748844cf478
[3/4] arm64: dts: qcom: Add Motorola Moto E 2015 LTE (surnia)
      commit: 24773481ae5e54f041a24b99037ba80775ec9fc5
[4/4] arm64: dts: qcom: Add Motorola Moto G 2015 (osprey)
      commit: 83086701167434c444ecde8479f1b9d3e0804a65

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

