Return-Path: <linux-arm-msm+bounces-28673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3CD953B95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BEEC1C212DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899FD14D6ED;
	Thu, 15 Aug 2024 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUTowMx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3BB14D2B3;
	Thu, 15 Aug 2024 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754459; cv=none; b=lMLte2AQt7vxw3KiYD2+maoqpd/e3yBADIey5rz/SVXPJz+fJ4SJ49TKvrQWV0Mv0gCzsWnRrCjlrrZI+MmllX8qSUGRf6t50OSdQfCBelRT5HjWA3sIsrVwS0d8XbuK3E424ZKziRO8uJegXLBi3/+gkOcvdqM0xOlHdk39gkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754459; c=relaxed/simple;
	bh=59yHYCAH3ZjE/4ilK/R6Pyrv7GeApxy6xKMhnYSDAn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DcxkiSxv8tQ6cH3QCTzx8MraRklNIv1OHMCToWjU2EU1f6XPZO50IQAh9Bt53D7fe9MCAUTsSrQuwUFOSXM1RDPcpeA1HvW9H/ZVl6mqfj0B8ZcbAz19N+8VtCR0bfRjP7KNdp7CSe48bTGi5XBCrn36GuDEfamaAUlRfCIZcVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUTowMx0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7842EC4AF18;
	Thu, 15 Aug 2024 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754459;
	bh=59yHYCAH3ZjE/4ilK/R6Pyrv7GeApxy6xKMhnYSDAn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GUTowMx0vAMeM4KyIvAxmdxUwktcdezx3G4ovy++M8yW6KB0N0jyxf3bx6DFSfjzU
	 d4q+BO1cvnEadzIUFd/+xzIJEp/vA9s0SlpNCrroAK9Jwtfs5ty26IfqmEzWvHZ1UK
	 XPbcy2GEZabCLrp2K1uf3j1sf4TezFzfdRmbuMnKx61FXOMyteMcnt5TPQTvLVG7NQ
	 hQ8jHmZDKP/gbNpp4thHfgvJY2DSn8rQ6vCd+pX34qvvenvf4Mu/fWAFdTrnyW2v48
	 /v5R4pdYiGyZP1oX89SuiCjYeEZD5miF3piv9KCIkbg9NALDqmUP2ieaNOtJiE7abQ
	 jWXHsO8mAEWPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: add CPU idle states
Date: Thu, 15 Aug 2024 15:40:19 -0500
Message-ID: <172375444830.1011236.14902438767700632258.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807-sa8775p-idle-states-v1-1-f2b5fcdfa0b0@linaro.org>
References: <20240807-sa8775p-idle-states-v1-1-f2b5fcdfa0b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 Aug 2024 15:31:43 +0200, Bartosz Golaszewski wrote:
> Add CPU idle-state nodes and power-domains to the .dtsi for SA8775P.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: add CPU idle states
      commit: 4f79d0deae37c298bbce5142937080ff5cc61a25

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

