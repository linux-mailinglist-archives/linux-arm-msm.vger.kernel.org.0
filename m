Return-Path: <linux-arm-msm+bounces-81914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A238C5F592
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BBAA4E118F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 21:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB5A355038;
	Fri, 14 Nov 2025 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBRQhkBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9D35502E;
	Fri, 14 Nov 2025 21:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155308; cv=none; b=Jof7G3UM/9m9CntF6vQzHCTkREgPve4NKLcOjg+6QvHzZijqrI/m5e71Zi/DC+DT2YbnFC5aNC4ZfOHtcnS3nHYQ/0iII7VMC8oB6a791ndlobqbdQpgs3iYzeEElM9u1WW8lzgH6byNbLJ0W4xZOBsBoSkzDIaY+Vo97yxUvm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155308; c=relaxed/simple;
	bh=DhggUwHOoUo/8KK9KlD6xoCXlipI3Vtr6TjBrmoWbtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/dTagW4yj2CotgKqC5vhC4FmqJNaz0Kni9J+durqSTOwouGWDCnXV7wTlgLv8j3CI5hHbi2aLG5V+TYuv4H5C810J7UxQ5qkM8PuMCf7EiCLVl4j+TdSitMYOTO1k7UonC/pOwd15zvee1zjFexd5bWGZrHhj4Qwrnt4b4SWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBRQhkBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7316C19422;
	Fri, 14 Nov 2025 21:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763155306;
	bh=DhggUwHOoUo/8KK9KlD6xoCXlipI3Vtr6TjBrmoWbtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aBRQhkBrl4wrQYK4MlOI1XiyHH8+QqHg/EhPFgk1QITKwn+s9lm1WAmrrDfEMsui2
	 8Uqx4DIfyumrqBDvQMMO98mZMQ6KgVfJiHJt5396Xw+ENlGdLkhxWJoaxTSOINAHnq
	 lDXCwMatdedadL+moBXDSG1X2/PlC/jNhQQXiYyQCWliHBZbyLMhzW7/6L/25XXsJn
	 9s+7l5YTMEH0gCodbsA1zfLW611iwP8doipe7/nDvADqnL+PWj9ZRXn2ipE4ecTP3s
	 YkQ+yPKUendQDXtZoilAosrFF9UNJqkA1krNX/+acHpPFv2U8E5Hn/LsiqYPN5RHpU
	 rOuhx3/CWaFxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Flatten usb controller node on SDX75
Date: Fri, 14 Nov 2025 15:26:14 -0600
Message-ID: <176315557190.2705403.459519496322659825.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
References: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Nov 2025 11:45:51 +0530, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach. While at it, add the usb-role-switch property
> to usb controller node.
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdx75: Flatten usb controller node
      commit: 101dae743d4bfa1c779de4ef1c65393cc4824d4e
[2/2] arm64: dts: qcom: sdx75: Add missing usb-role-switch property
      commit: f481e772e014da92fa1232de54e4cac66b5fc5e4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

