Return-Path: <linux-arm-msm+bounces-21392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 427208D73A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4031F23C36
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F76839FFE;
	Sun,  2 Jun 2024 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1CZxkLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912339FED;
	Sun,  2 Jun 2024 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300442; cv=none; b=bkBuMsz3jgcSJG99gsDvVZP5ieCkQ5x2bmsb07+2SvtLvVKK8QdUcb4K65EQivKfqQ6TJbOyxSq8DMQDnXlxZwm9198p3l/68fZcDzBg5jLKnmtmFH0RnG89pWixyhmggV7lDtZ0q7a+0UiZIEf7uPoW+6RsSI2KJhvpHZYYyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300442; c=relaxed/simple;
	bh=rVJRjrKplsyyf+18NeAzuWrAp1qX4/rJPbES79MQe2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCOT0sPqTwhIRF3/qpIjrNKv663ebCW5nyLvoAAZO9N2WiTc8cStKk6OYMWVbRV2SL7mWNyHzki4yF638i2/a1G1JCo7IgVUrIlLX41gAKAKIHW5TifcTQPjuxOPHm9agHb4aZteanvMGfXcJQ75v4eA5+M739ysdHxAQGCx0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1CZxkLf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AE8C2BBFC;
	Sun,  2 Jun 2024 03:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300441;
	bh=rVJRjrKplsyyf+18NeAzuWrAp1qX4/rJPbES79MQe2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1CZxkLfm5rSg71q4Jye4wDyWDAT8xGhAmqn3gXAI5GBEk7IA4eeKg5pTVo81h0rj
	 aKrDpUAyfFi7rphZ47WbAUJDB88yzQsDFYoBeJBidGpdEQebYdrN58DZzpJt+2F8sr
	 9xdRu3aCEsQ553MFZybeNFYsyCNFjZN3/Zk/G5jWazoDf++riq2pvRuwNirhsOY5pE
	 8bPUJNJ8DxdB3hxcs3Vg2yhPaXW3yvuwFjhkKlbFyy2YNBtVCyPPBFfSPu7xq5iXQc
	 lerp+tuiiXpwlVLQy3IsZM8Qtg8HyBZjCokacTgQZYsvywpDKnF/t/JmCp4iHZdmqS
	 XmyYrCDt7/lxw==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v3 0/2] [PATCH v2 0/2] arm64: dts: qcom: sm8550: Update some usb properties
Date: Sat,  1 Jun 2024 22:53:47 -0500
Message-ID: <171730042583.665897.17136966514595004729.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240531090422.158813-1-quic_tengfan@quicinc.com>
References: <20240531090422.158813-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 May 2024 17:04:20 +0800, Tengfei Fan wrote:
> Move usb-role-switch to SoC dtsi, and remove usb default dr_mode.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: Move usb-role-switch to SoC dtsi
      commit: 32a7b1d7c72bc846f417c457476efcfc4d283c6b
[2/2] arm64: dts: qcom: sm8550: Remove usb default dr_mode
      commit: 54bbf0a8ef45734531b12cc50528568e4220d1be

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

