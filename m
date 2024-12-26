Return-Path: <linux-arm-msm+bounces-43414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7709FCD09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4EED163133
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82EB1DFDB8;
	Thu, 26 Dec 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqf0wT0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC41DFDAB;
	Thu, 26 Dec 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237673; cv=none; b=hCy55HkRwFcoxYiZV3fb9TxsDMKfXwewDjZTe00z6o+wZPP39Oiu1D5N7C2bmH5ReM/TnXk7c9SgzGmI564WcxOSSUp1EJYWbEb/mtxrByqjkIBLPI+E4gDZjHblOjxOGnkJ/2euvtGhTah8JdC4lYvAK34HdXJ7HDuQpKUTlPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237673; c=relaxed/simple;
	bh=V3/0p/mF/tXtQxOMbRL0fTawGvBGGeNdHlT6pIpkapc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ccUGfvv6IlpAfwgHzcBvKfX3A9+o1VN5uy0Y1IF3FBUPF7dFz0zKmvQ+WDkQYb4VRkB8zHRGfHjUmB7ZruGdkDlSRNo2NjUUMCZXXPkzQHIIs4241vAIGBIZAnI/lvuYWcI5aQRTMl+GhaTFpyzm9voRK7AJuiMXPZbqFQitX6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqf0wT0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E9DC4CEDC;
	Thu, 26 Dec 2024 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237673;
	bh=V3/0p/mF/tXtQxOMbRL0fTawGvBGGeNdHlT6pIpkapc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqf0wT0vliC4ty/F5VdmuE2xfh2EIODolEst3BosiIxStBfCiNeKvcQeJDlsRJq9L
	 cZ0VrOIIUWEyDesClR44+2N6voOgRiyTGpV+mGDyTItGz4mibD0j7HCUXUrpNxLz9w
	 x4ahhrnW+rQA9h9ivslFyHzoseq6bQo8HavDkSmIF+CyQDz2AFudAIUSQzVVEick4Y
	 QrJaix9GqstHcYHbqHPcjiL0HFi3zW7S93cOKgQFbSnjtQvmq2n0z4QZld310EeGui
	 Kcrtbh4Z2nM1wAHzPVJ2C1MLSOP96nBg+xeC5lXhTIcEpaicBhrkYQjfp4gr/SQUq5
	 J92F3HXsQd13A==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	quic_imrashai@quicinc.com,
	quic_jkona@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH v6 0/2] Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P platform.
Date: Thu, 26 Dec 2024 12:27:07 -0600
Message-ID: <173523761384.1412574.17195452154242339333.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
References: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Oct 2024 14:22:52 +0530, Taniya Das wrote:
> [v6]
>  Update commit subject and commit message for both the DT patches [Bjorn]
>  Subset of the patch series applied: (Removed from this series)
>    Link to v5: https://lore.kernel.org/r/20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com
> 
> [v5]
>   Rebased the device tree patch to add clock controller nodes.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: Update sleep_clk frequency
      commit: 30f7dfd2c4899630becf477447e8bbe92683d2c6
[2/2] arm64: dts: qcom: sa8775p: Add support for clock controllers
      commit: 727dc481e50a4de846c49d6ef761616f299d127b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

