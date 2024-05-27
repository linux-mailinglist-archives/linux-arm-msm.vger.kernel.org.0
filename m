Return-Path: <linux-arm-msm+bounces-20508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919A8CF7B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17F6B21944
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61347139D18;
	Mon, 27 May 2024 03:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDC7Ub4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37597135A49;
	Mon, 27 May 2024 03:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778867; cv=none; b=aQ6Kz86phuR+NBVHQ9B6ZaaQtx+P3ma2Se4zqlpD4yYZk7QA1F5pLpu4hUggi328hNAmCGcl4cKR7WioDq3wM6KserRqUizK7lmTJNsfrB9E9txXJwbe380X2PzUL+aJ/efzKQ2McFYB4bOAfIaxmKKzBOYuwojdYQ1aOYEZv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778867; c=relaxed/simple;
	bh=Yuxcr1yg3vBbu0v+vppY2jr+RSieUntIg5Uf7eXGryE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYkzrZUHeI2PtRBdEGAucJeuUEVVKhjdok4nBWmX2QU2SrgxQcxwCKoYGJ5QMpbwvkkuzuFiUclVO8IAvt/r4PsysLpK3Exk84BK9tDHD6hhSpvFuqxw7gA/fuUfrRhbGNZjnIyxHNYZVR1Kyxz6eW37Q8L2v/5LS0D41RpJkp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDC7Ub4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB595C32782;
	Mon, 27 May 2024 03:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778866;
	bh=Yuxcr1yg3vBbu0v+vppY2jr+RSieUntIg5Uf7eXGryE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDC7Ub4mjoHnYAT6LGAAaHYFxCfHMx0NDvjm0zBKfmFk4Zbbl/n/UQEOLOcC+ZP3/
	 K/7mWbJPpkpxaVQBhixK2Hore/QEgRYfXKFZa97BzhdhYhlOnADffPAbbabvph2G3e
	 swSB4eiTOKoo+r6DprKRdzxWdt9T5SBKfVem4H7gvWF2RI06gNhb7dwpV2PBGEiBTi
	 nG9nYZFV+zwqdwHp0vecTPtJf5rUYJUQGRW/YDZ2M0jiZ8UqtpgHvEEPB5mH4Bqv6W
	 B9rQfylt1VYeFIWg9gLftUkdv7AAe8hnxgMyRCl7ix+TYyffcu2v20JBuAUnbvrPtO
	 T9fGkOR+M5dgw==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdx75: Add modem SMP2P node
Date: Sun, 26 May 2024 22:00:34 -0500
Message-ID: <171677884207.490947.6381584416311780224.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426112837.17478-1-quic_kaushalk@quicinc.com>
References: <20240426112837.17478-1-quic_kaushalk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 16:58:37 +0530, Kaushal Kumar wrote:
> Add SMP2P node for the SDX75 platform to communicate with the modem.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdx75: Add modem SMP2P node
      commit: 355e5d72a4e52c6b7e56913036cb0daa36317b29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

