Return-Path: <linux-arm-msm+bounces-51476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531BA61B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 108497ADD43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CE3207A20;
	Fri, 14 Mar 2025 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWzNuy5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A35E207A08;
	Fri, 14 Mar 2025 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982495; cv=none; b=JsjNHimpHNIJVNJlImVSwdCP9AAI0jBpDz97/NT01pHv/EANw2F/LrplHWGywTwwgnyWg3ml28/oT+NzIrz59E3U7V33xIJgRRLI1bukpAhL6ZXrITyQGri/2MVuOE24HP8hWERXkYLBhFSWLM3i9TzsDzCIAk5514e+Y8Ojb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982495; c=relaxed/simple;
	bh=uohp6d3ErtL9RJPbxMvunHKDQks50aUZEQ1kTcx0Gcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkPHXPuC1QLpnby/B0euB0Fbahn1AS8jteeb39cMYwzxaT7adCtwfnUYStVpAls2wyQECovM+Z79/BQciQrklYeqFv2ivfqzOkwGfYdALfrSdXJmDwt5TgAO/0yzOq6rM595jxEUqa2sYBojVaeNSj3QDUXzn0zZKKq4iTHo0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWzNuy5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB00C4CEE9;
	Fri, 14 Mar 2025 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982494;
	bh=uohp6d3ErtL9RJPbxMvunHKDQks50aUZEQ1kTcx0Gcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWzNuy5kv19dDIDmd8kcXQWaDC6IMdQTan4GCnXXWQ7htmWgsthZ9iX486s27kBHJ
	 ys2b4xAvRqUD2H4V/W+Ril8hMVz2b3i0vE5fSpUTWjFJLkJc0C3+eFj9pBH+Oc14vu
	 kn+7UVz82ON8/oeavGndQPlSB5sXO21wvJZaRGkGsIB+HX931JkkOHX7JhBug+oPjC
	 tJynTYAjct6H7l0XxGFVVYq1YmfTnMcNqmaOvDHq9Gwy4jUyZeKspsuc40xmlkPzIC
	 Bss55ttmtC+g/2oO663m4u7irtpb+JrVz9YivYZzWZQQ5iA1XqlemT7QX/XPTOUcax
	 Ry0VfDGsBJCqw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wctrl@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/2] Copy tsens node from apq8064 and adjust values for msm8960
Date: Fri, 14 Mar 2025 15:00:50 -0500
Message-ID: <174198247882.1604753.13649426203222294750.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
References: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Feb 2025 17:16:53 -0800, Rudraksha Gupta wrote:
> 


Applied, thanks!

[2/2] ARM: dts: qcom: msm8960: Add thermal sensor (tsens)
      commit: 4712dbd5fabdd5909b8b3367dfafd61f502b3bb7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

