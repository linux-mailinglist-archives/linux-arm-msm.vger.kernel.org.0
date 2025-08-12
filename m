Return-Path: <linux-arm-msm+bounces-68838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AEFB23A74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556061B6498D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7056E2D7396;
	Tue, 12 Aug 2025 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS7w2UVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578D2D738F;
	Tue, 12 Aug 2025 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033240; cv=none; b=cDJQF2bpj1VwdTryYubVSFpKtVPdW9TVahi2afEQP4wqxFPCtISeW/kDT9wnyqTIYUdAmehgMBtK3CEYBypGdlarOw0NZ1lH8GKSqIg8sYpTtRIFfeFPAtaVHEgvdkdomGauNrhxgNuqHNsoo1XHUAdCnAYG9ToscKiyqmkJyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033240; c=relaxed/simple;
	bh=YhOmscR7zMS1RKKfQKFHS3r0NQs0SERPj/UPn4T2M1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e1H+UUqlh2UkG4/3mK3Kn6dkiG88RRIS0oxTwpU5k7mlVOFRjP6srJ6GwhD2mYENJln0DWP8AN7CGwFbyDBy7igXBYlPQ5fRQY//11jzKTBmresT7TwfGsEce2nRYdaACa4S8lsg7KgcKgzKScnUUDkLJcqvlqHO5yYrBBNgLzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS7w2UVo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443C5C4CEFA;
	Tue, 12 Aug 2025 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033239;
	bh=YhOmscR7zMS1RKKfQKFHS3r0NQs0SERPj/UPn4T2M1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cS7w2UVop4QX7AUkhGhm30952y34sbGUMoZi2C+AtrCr8MpixTdIU6g+VyBSGNLx5
	 YYrttZae+yPlHvk0uO/d86cD/gE2s/I8u0jcZRmqI5Ol9/d/PYQykULGxSMGLrxez5
	 DGg+vHjbDftA3JthVpRXk/InHwVe+3VqRmn5JmrBxNGmsHk+NddLRkbuuiBTDZ8oqL
	 /LnxG+m4EQvA+jBhKZANjAACnV/KNn9PUjiVjqV9iiJf9nczuzsdQ5pPYCOEmGDsFB
	 iTChQfdsNxfT0gl36+Poam7O9bRCzRGa11FJvmbuFYY/YV7116L9Jjke3ArqtU9SXU
	 C7UBNm7C2Py6Q==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Describe the first PCIe controller and PHY
Date: Tue, 12 Aug 2025 16:13:43 -0500
Message-ID: <175503322843.231048.8956982707170764479.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
References: <20250811-sc7280-pcie0-v1-1-6093e5b208f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Aug 2025 22:16:29 -0500, Bjorn Andersson wrote:
> Only one PCIe controller has been described so far, but the SC7280 has
> two controllers/phys. Describe the second one as well.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Describe the first PCIe controller and PHY
      commit: f8328b7549e1faff45e32ab2ecc2573b90604e76

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

