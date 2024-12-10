Return-Path: <linux-arm-msm+bounces-41360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B499EBC04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 22:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15EE116814B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 21:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68AB23D404;
	Tue, 10 Dec 2024 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lb5+4/8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABD23A59E;
	Tue, 10 Dec 2024 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733866928; cv=none; b=QGkJ4aaSEnbt8c0H3Jil2/hGVXMRuLIduibGwoaMIdpcszIjTAJaPlNvN5kHhHaoJw0DmwFSl0/ctvmoPf5Qm1QyVSM/ogh/WQf16FGSzF0BITJ1JcrW1aN397DO5o23V74PCiWFtHoYAq0FxscGLe99yW0+Ye1yBa+OnJ0b+pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733866928; c=relaxed/simple;
	bh=YCSJYLc8PV7sGAwwOHp08NgZQlYhY95c9nKRtIl33+Q=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SSVdYOeV3lQ7ITYVB7TEP/iLAtHk5BG7e85qU1EqblfpmE7Nyw41+fylfW0Pq8Y6qpfyI1xw9UDhLZxfCtdssi+44iRcczroQPT+TLouviLCKyzt7x+Oa5Qe3SN6B0WqDEmws/s+38unDdPVTwHix+mvF6BsCyosKRqHzzhiuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lb5+4/8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6A2C4CED6;
	Tue, 10 Dec 2024 21:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733866928;
	bh=YCSJYLc8PV7sGAwwOHp08NgZQlYhY95c9nKRtIl33+Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Lb5+4/8SkvoLef6ssCM/j0bJe6FRFbgAwxKdwd+UUaq7e/nNNvFjINHGDBd4niJGe
	 p0sbuhZRLUVb9SdmAEOD/BSeiPDifBspYXugBV64QsSUfm7/o2qI98pBNaPGWOl/Ee
	 JbKoKMvNsKdVw3Tqf4R/mrMmagiq8omPsbVLYIm+mdaYWZdY8tq8X1Aumv+Y0+xIdD
	 VPm7DvEA724S3gzP9vqZ+Bd0RVnczL6GFlSweK0cpFE4aGQkEI1jsR0CdtKyxYMhBF
	 8FashWgzcV1AS3P0ThvTMXfTmnidsOc5tDfZGa3fCr4Z9/6L9sukc3vBmZeqAakA5w
	 bvcEAUfcr3DJQ==
Date: Tue, 10 Dec 2024 15:42:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
In-Reply-To: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
References: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
Message-Id: <173386568810.497638.4312845461558580089.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-pmics: Enable all
 SMB2360 separately


On Tue, 10 Dec 2024 09:36:01 +0100, Stephan Gerhold wrote:
> At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
> default and leaves the other two disabled. The third one was originally
> also enabled by default, but then disabled in commit a237b8da413c ("arm64:
> dts: qcom: x1e80100: Disable SMB2360_2 by default"). This is inconsistent
> and confusing. Some laptops will even need SMB2360_1 disabled by default if
> they just have a single USB-C port.
> 
> Make this consistent by keeping all SMB2360 disabled in x1e80100-pmics.dtsi
> and enable them separately for all boards where needed. That way it is
> always clear which ones are available and avoids accidentally trying to
> read/write from missing chips when some of the PMICs are not present.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v2:
> - Clarify commit message, there are actually two SMB2360 disabled by
>   default (3rd and 4th) and not just the third (Aiqun Yu (Maria))
> - Link to v1: https://lore.kernel.org/r/20241203-x1e80100-disable-smb2360-v1-1-80942b7f73da@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts               | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi               | 4 ++++
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  | 8 ++++++++
>  9 files changed, 68 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/x1e001de-devkit.dtb qcom/x1e78100-lenovo-thinkpad-t14s.dtb qcom/x1e80100-asus-vivobook-s15.dtb qcom/x1e80100-crd.dtb qcom/x1e80100-dell-xps13-9345.dtb qcom/x1e80100-lenovo-yoga-slim7x.dtb qcom/x1e80100-qcp.dtb' for 20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org:

arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b84000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']






