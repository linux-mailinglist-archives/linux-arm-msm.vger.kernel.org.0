Return-Path: <linux-arm-msm+bounces-54293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E6A89244
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 04:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 986277A6678
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 02:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C178215040;
	Tue, 15 Apr 2025 02:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAOLADc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153822144DB;
	Tue, 15 Apr 2025 02:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685567; cv=none; b=qMk9v2qJJ07mXbWEJqCxL7gxxXC2RLXXSVxxL6fDjoRTY/fVIHuEF7Esgu5W8DlRw2qWd8XBEK/MXxVptxw0Y8HcUVxd81832X6jEyGWrQvkDyhjdekGlg8NogNBvlEbfIQPVjU4MZobcvAV7Zs545jRvU/OoS4bM171zdJ12zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685567; c=relaxed/simple;
	bh=PQn6OeimQolU3wGoTb/bxlB0yG4NJSd5Q4MyaSlJeyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XotaOwDwt5TVjdko4NL7QOMNb4RZY19FHm7N7VjRYY45ZBEKsW1xa1SJnF/lYdyabw/s4ThXwzItq/00aIIcqO0Rzl1xf1Hf9CKPGGJRvYpnmOP3Xi7pYkJkgd+twDuEqdxwiRv4vzSP8ssux3dp/N4RkRuyr6T1r5us6KQ+WAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAOLADc9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA257C4CEEC;
	Tue, 15 Apr 2025 02:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685566;
	bh=PQn6OeimQolU3wGoTb/bxlB0yG4NJSd5Q4MyaSlJeyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAOLADc98F4wRQxP38j7hllxw6z+oKU0P/qhhS0ykYZX5vUJxSJ1P0pMVP6GTg4sI
	 YLxezJtqqOE/jdpflIcxpZ89URJPHCzC94uXMSTwJ2E57oEoFAHeHK/wWCrQ1hPi84
	 E8MIdvAggc7p/tMtl0n3siIWbn4G8RR7pD+d07EBNKh7r8PAacl3FrLluyTDeirfmP
	 m9KUAk6zszj5ZwkHZhUM9fFzNHCB8+fBOytNjDBP5NZeqqqu38Roj4EBGr8l281rAK
	 zDQ/AnhNmE07F/bYVFnrfxJbANw/uUPit2QsWQ8IKFByrSfYRUO+f1f2AOcX9YdD2U
	 6wyO8wXmoJVDA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: remove max-speed = 1G for RGMII for ethernet
Date: Mon, 14 Apr 2025 21:52:39 -0500
Message-ID: <174468553408.331095.8173023900653725550.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
References: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 15:22:40 +0100, Russell King (Oracle) wrote:
> The RGMII interface is designed for speeds up to 1G. Phylink already
> imposes the design limits for MII interfaces, and additional
> specification is unnecessary. Therefore, we can remove this property
> without any effect.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: remove max-speed = 1G for RGMII for ethernet
      commit: 0d5da04d23c3b398595727a274887cb8ff1c06a3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

