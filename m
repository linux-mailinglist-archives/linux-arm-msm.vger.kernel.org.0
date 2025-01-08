Return-Path: <linux-arm-msm+bounces-44270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6FA0506D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE2B67A14E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D671A3BDE;
	Wed,  8 Jan 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1ViOtYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067C51A3A8D;
	Wed,  8 Jan 2025 02:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302403; cv=none; b=jri3ri+eBhTSENV0+N8ZaUbp6Qov4lFMHjngYDWR9ZeR7TEvJaWo/9AQBkDTP/MM1uIsWKqLIKzulMm2qkztUIJV97nTJZP9UZANx9xlYzuJFYZWJUjLcYFVgzZ77PT09nKe0SCtAxhraITCxhadajVMnIVSpA4rgjHvOJqDX4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302403; c=relaxed/simple;
	bh=7zuqITzGSMcDjMXmuLrgmCwS3Z0imN3SO+TTtEpaF6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8BuzpJ+KwbT8JcbYfu0uJadehoEUM6VIkCP9jIaI/RLcPO+LNBFDIIEcOAH1DsIQDySmINKQC+/wI7WCdqTe/EWB/KVgYD+tUXW/DAaZEFZnEoZgnRGIGD4rmeSu4hFORIDoEXNL41nKPp3pUL+FV71fxjitR6CxR/cb9+QTwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1ViOtYL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96D6C4CEE4;
	Wed,  8 Jan 2025 02:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302401;
	bh=7zuqITzGSMcDjMXmuLrgmCwS3Z0imN3SO+TTtEpaF6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s1ViOtYLMIsx1Ceyk3dYEvwMr04IDN9OcCn/0zPxJnG8S83+njmUF23B83SVRIn1A
	 D8GSENdBCnd2+9GT1RiDSW6RWucwEFKnDbHFKnZGGilUqaXv3QDiUOT/sdpcsnM+lZ
	 0R1Zx8zY5vL+4HnPZt44N1ShfRv14sQfLFFmFJGsbTnwHo897HHmwTHoroHcJK9456
	 pZsRtyNXqxwvAAE6CL9HEAZfBuna72NoxwnqwaJhU7dZ8LuHqRkaahfOeY+78PJfQd
	 N6eH6LY0qHK+b6gfepgQZg+XV8/3kYOVXY1FcHSEdFF2xPFrEsorBPsUxpUAXZ5RYY
	 xnkBMWiWmxOqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix usb_2 controller interrupts
Date: Tue,  7 Jan 2025 20:13:12 -0600
Message-ID: <173630239533.95965.17986968259395887798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107-x1e80100-fix-usb2-controller-irqs-v1-1-4689aa9852a7@linaro.org>
References: <20250107-x1e80100-fix-usb2-controller-irqs-v1-1-4689aa9852a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 15:15:16 +0200, Abel Vesa wrote:
> Back when the CRD support was brought up, the usb_2 controller didn't
> have anything connected to it in order to test it properly, so it was
> never enabled.
> 
> On the Lenovo ThinkPad T14s, the usb_2 controller has the fingerprint
> controller connected to it. So enabling it, proved that the interrupts
> lines were wrong from the start.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix usb_2 controller interrupts
      commit: 680421056216efe727ff4ed48f481691d5873b9e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

