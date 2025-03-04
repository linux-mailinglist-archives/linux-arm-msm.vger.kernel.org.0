Return-Path: <linux-arm-msm+bounces-50232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3BA4E8A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E5A07A92E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CE41F4169;
	Tue,  4 Mar 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXsh4wuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B61F2380;
	Tue,  4 Mar 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107621; cv=none; b=HTBD6PE7EIQjbbaxLfQhl4Sd8PfLCxZgHOedG3KyDVt5ifOuJFUQgDWXbvlvCjySU+xgEzKV9NDBdJjwKhB+83LWtVgIJD9c9A0yb/geNc2IWabzBQbA+V5rlQ5ym9Wq7+SCtT2wRD49PErzLnc7eMxAfvu2YsmDnk6cOy0dAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107621; c=relaxed/simple;
	bh=va+5FfUBxcXQFDJSH5+Jnt0bb4db2qwTMBJCzvc84/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JR5r2ZKsgTDY1pOLuR4rZKrjx06CfabX6WvsUvsJAkaOBv3l6Q/WX0rLI36VIoMhYmBhoRFfdghJ/e3hi3JH9f9TcgcQKRh3bjaIAd1RfwGf6t/HuIBC+uwa57Oyy1/08oo3U89VOGXZ8KboV19n3fz/qwRLVI7EqXuSjinvvC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXsh4wuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB45C4CEE7;
	Tue,  4 Mar 2025 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107620;
	bh=va+5FfUBxcXQFDJSH5+Jnt0bb4db2qwTMBJCzvc84/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RXsh4wuFYAufBhQhwC0iFFxaiLaq3fZuytzx6XCrPmhhbiVU6uV+qYLFT+dOzS/gw
	 9bRO+YC1UmKzgUN/1rY6BxjddnfcJOMF/mTutmiKEfQLTfbLrSxrCIHPaz+0T2nWgY
	 JOgLrCAny9y/aPvDaNE/xfQo4BjZXm27Tqw75JRsqxvumjARVSwk/YvklfQ3kJbdYo
	 nmaZpiK06PaeriocFHlcospXvBQe87IYH+kLasUK4lE6H10whJG/vSE6CfGXpjvaQH
	 OHmsxapk5pJrFCasQLL0YJj45kSXB4ACLGzZwHZrC1G3iJ74H4sks1+2WMRo3AS9KU
	 AnomtTLqoPOUA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH v1 0/4] X1E Dell XPS 9345 External DisplayPort, HBR3 fixes
Date: Tue,  4 Mar 2025 11:00:07 -0600
Message-ID: <174110761299.741733.10103309701082281896.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226231436.16138-1-alex.vinarskis@gmail.com>
References: <20250226231436.16138-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Feb 2025 00:12:08 +0100, Aleksandrs Vinarskis wrote:
> As initial LTTPR support for msm driver [1] has landed, enable external
> DisplayPort on Dell XPS 9345. It appears that supported frequencies
> need to be listed to allow HBR3 speeds.
> 
> While at it, enable HBR3 speeds on other X1E laptops that have external
> DisplayPort enabled already.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable external DP support
      commit: 01a3d5e3cdc833292bdc80a4320235551083982f
[2/4] arm64: dts: qcom: x1e001de-devkit: Enable HBR3 on external DPs
      commit: 027dcb3de88dfd1b82f5f712361d216f209110b0
[3/4] arm64: dts: qcom: x1e80100-hp-x14: Enable HBR3 on external DPs
      commit: 9a49698252b78471a61873b4fe27dfd2e2fe2bad
[4/4] arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on external DPs
      commit: c72c7105c82de59fb711f8379843f80b4abef7e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

