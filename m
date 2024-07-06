Return-Path: <linux-arm-msm+bounces-25439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F385E929599
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C2ACB21995
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5946E14AD10;
	Sat,  6 Jul 2024 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9LbpMJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C04F149C77;
	Sat,  6 Jul 2024 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303309; cv=none; b=c1/xfntF6fdv7sJG8a++3+7RfXJxwd4IQZ7w1AxCLnqX0E1z09NsFycf2wX7JWdrDgAUqedQWdzB1JBSy11N2yuJyknN/fqrJVpebREfLNzKCXByGdkWMWhhll9HTbXWb3NjuiwjldS2LmZkshWqjMltfHXn+Ls13bJl4FPwHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303309; c=relaxed/simple;
	bh=eG7FtwxNwZFucz8uprXN96tbHHZWCpS08tFsJYfjyjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bg4fpotOocMzpJrYirmrqYKT1hiMgXUzYv4Tme81wDVf2QDN8OG/sb9fsgDDA+tECh0wHxpemMBi9Ds9w4aX449hLJubWvCdoa+0npZ7XA8g6FaUw57L/vUBmr6L6etVwLv8rBk7EI30Ea3mtvx/xp1h23cDpCgrfU6+m8E4dZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9LbpMJh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B712C4AF0A;
	Sat,  6 Jul 2024 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303309;
	bh=eG7FtwxNwZFucz8uprXN96tbHHZWCpS08tFsJYfjyjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D9LbpMJhFBQN6bthbTzUzC5PbIWKOVO8/+e7f/8yE+Nj1k+SYrZ5cSkqWCT2bIT7q
	 2s+ZFrCkmwczudU2XOguxa5Wlynxb3LNaLZqtFvNoaslBPhSBvwhnKtjsJ+Hl0hHCb
	 8kRKW1/YPOQluycGzSKMSH2xgLQ0ohfT1KNzWAygj9uaTa2UqfGmZODAs3oMOrCAdN
	 Zm3D0EicmlB20Pz+eYQTXgsT1fpKebqNSxIo2g59vk2Ub0WI/7A0gLzB3VJEbkKd2u
	 aWlI6XSb08vbc+OnTCMtAulVt26+mg2MpC9CSACDoE+Wufk7f2i2TmqUoKVj8rGKQD
	 BEizZxRCEEe4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: robdclark@gmail.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: add Lenovo Yoga Slim 7x support.
Date: Sat,  6 Jul 2024 17:01:30 -0500
Message-ID: <172030328804.28909.17560735197150165366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703-yoga-slim7x-v2-0-3b297dab8db1@linaro.org>
References: <20240703-yoga-slim7x-v2-0-3b297dab8db1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jul 2024 20:45:04 +0100, Srinivas Kandagatla wrote:
> This patchset adds support to Lenovo Yoga Slim 7x based on x1e80100 SoC.
> 
> Tested features:
> -> Keyboard,
> -> touch screen
> -> Display,
> -> Speakers.
> -> all 3 usb ports.
> -> WLAN
> -> GPU
> -> NVMe
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
      commit: c46a239a24908dda57031589f0db944a5d2e9246
[2/2] arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree
      commit: 45247fe17db25594bec804f9db751635c7b6e473

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

