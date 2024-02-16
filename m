Return-Path: <linux-arm-msm+bounces-11444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A768589D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 00:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD1D1B25A78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 23:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9F61487C1;
	Fri, 16 Feb 2024 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7yzjXaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB339856;
	Fri, 16 Feb 2024 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708125047; cv=none; b=RqEAMraj7RloxSoCSSKp6zMYswqDI6qzGKLS9KsxLsM7HKnFTP3M+Fn5/PrqF8BxF+hi7B/k8qx/BRtj8MvI+F5fG7YHK3nDzP/Dki41/is0F8kormKhX9R1FttkHjeMFjhw1APY9/IPNGLMfQNp1Gtp9UFOd3QLTvsNI54faR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708125047; c=relaxed/simple;
	bh=o+l6DU9HbNznlsygg6jz8ZYUc/mKMxQUxt/hW2FlnrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3O2F0KgVTsdduYpHFE8rU8D3BAyHqCuJDGfB3WotIk5LVK+oPnpSGRt5gNsrkPI7XSBuyOg7BWu/e0BPQPwOp03RehMjc4Of9/XzO4Tt97/u2LMvL7REvNfTaT46ddSZJghFCxVy1jHU5z9GhOUousiWyhR472lAENFrONY1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7yzjXaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A49C433F1;
	Fri, 16 Feb 2024 23:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708125047;
	bh=o+l6DU9HbNznlsygg6jz8ZYUc/mKMxQUxt/hW2FlnrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j7yzjXaQTVbetRJXoWI0DLK0dO6pEeEqjdPXFZScjIfRUugjezGuNRwh7qV5vNg+O
	 dKIHoiB+Qo5CYkSNfGaNVO1yGnIJREgRTJEoQieFRTL8fv6Ak09lda4sLeiZ//FaBO
	 jwQKLuNM3TRkrISAO3GbINMxYIhJAtntUOItjN5e9Rwlt7NVvXNCY73C7bTBlqXksd
	 0gxB6jFr8FE7PA66XfNVK3nmx4YT5z+4J+nSHPkc1reOCCfxMX40fEqbf4HY6mN1Of
	 suIUwb2O5NK9/18iQCq0XcLS85/9QAufFkWBDrRlw7V1K9q7sZ5mKurtoXPz32XV1v
	 kJFN7vGJJm+WA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: Re: [PATCH 0/2] clk: qcom: drop the SC7180 Modem subsystem clock driver
Date: Fri, 16 Feb 2024 17:10:33 -0600
Message-ID: <170812504018.18043.13679052985689475337.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
References: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 16 Feb 2024 13:14:57 +0200, Dmitry Baryshkov wrote:
> This driver has never been used in the DT files merged to the kernel.
> According to Sibi, it only worked on the pre-production devices. For the
> production devices this functionality has been moved to the firmware.
> 
> Drop the driver and the corresponding bindings to remove possible
> confusion.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: drop the SC7180 Modem subsystem clock driver
      commit: c630cf8f3a6cc3048f8c78b130a9ce9749b81b30
[2/2] dt-bindings: clk: qcom: drop the SC7180 Modem subsystem clock controller
      commit: 6624b25c206e8cce6b93ef3e24d95b3d6e0c52d5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

