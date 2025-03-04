Return-Path: <linux-arm-msm+bounces-50100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BEBA4D256
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB721713D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33101F03E5;
	Tue,  4 Mar 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ37B62Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FFB18D65F;
	Tue,  4 Mar 2025 04:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061359; cv=none; b=hPSynG6R/TIhR/73XY+oxVt584/oJpnnfvj10rEEUpQ974Yxs7y6otyhr+eYmf3EXB5mAcgpdLRdMno3OBzxuH9JG429GXp1HxKHeSqpYREgKTIMygJunqss8cpVcmu64cnuitoe03N6ocEz1xWt/mZIeREf3ER5heWqPSr+WZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061359; c=relaxed/simple;
	bh=Ar3o2+9Hpy2WmpR5PZtdlLrJFBTlnKkLwvleGHEkfDI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgujE/Xye4e3WucZYp9qg45SJAHNdwjg/RaMH8CpJwfMDZM6OWyMHTsSeNTLp1YWnB2weRiSoxxWTRh0vhKQlD6CM2/CiIoG4RRdMEPLE3f+szngf5HKodhYsSTj0oXBISf9xFMyDum++gdyvzPZjbX2W6e9Uymwh8xiBibf6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ37B62Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1989C4CEE7;
	Tue,  4 Mar 2025 04:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741061358;
	bh=Ar3o2+9Hpy2WmpR5PZtdlLrJFBTlnKkLwvleGHEkfDI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KQ37B62Ydm6UrJ/TTwdIhkC6VCbsOOm4eGtu9Mk2bAue1/a7bNV4V86NNOsqwjOd7
	 3l3OQpA72upyD9p65Z+CqfpwPfZZWMV3APEdp5qPK3hkCLxkkakI/cyOOgVIoOPDxl
	 MmuE7abtRw8tHnyEqwFXmHGXfcINnT9ahj5XoLZsjwi+44N9NFgD2DX+paljRIwPye
	 QxL41Zhbvxlv93xVdrvIinzgoSLoKMwCi0yaVu8r98VreXqKtk2RiSWpzWNolL7OhD
	 TSRrc1+5jaiy6luKs1QTBLhgeIoQETApUfXUF5jjslxGpR9Y9T0pJA+8yeutYRENnk
	 Zg5dOSAVExwvQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"
Date: Mon,  3 Mar 2025 22:09:13 -0600
Message-ID: <174106135203.690218.17919051354058479651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
References: <20250128115333.95021-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Jan 2025 12:53:32 +0100, Krzysztof Kozlowski wrote:
> Partially revert commit 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add
> QCrypto nodes") by dropping the untested QCE device node.  Devicetree
> bindings test failures were reported on mailing list on 16th of January
> and after two weeks still no fixes:
> 
>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"
      commit: 92979f12a201c54ea94b8b3c9f0737c33bb45e23
[2/2] arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"
      commit: cdc117c40537c5babfa7f261360d5a98e434d59e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

