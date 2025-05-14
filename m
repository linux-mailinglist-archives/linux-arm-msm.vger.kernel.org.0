Return-Path: <linux-arm-msm+bounces-57829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8196AB6A2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C9A4C1247
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A63727991C;
	Wed, 14 May 2025 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwZWjW0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B5279798;
	Wed, 14 May 2025 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222653; cv=none; b=Uje65LyWevIpEKnSxNid9nUS4h1x0CucEmENfadowf2jertcOBTOh8Cckx5xe9fA9xs+BGBJ8zYAVjDxW3kJmlZME19Xouf3+Y0M+uZjWNs40mRkR0kro3u3eAVWOM3gdot/q1B69cMmFIsHRPxxCbk5VuX8OXoGN/SnR/unlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222653; c=relaxed/simple;
	bh=tuM+4GBuky8rvhpUbkvytG6IgttQsqZkqThC8BUjoFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=isP7F8I43RDgNzuOCkf79ZAX7xl0oETm6Gw9J9BSSjb+jeqhWj1giMvXrFQvIxrE0AH7rH6wzB1WIUNvs1U3hs/lIqJUVGnOvFCubZUU97nEbOtEKCz9py8XkjiEUX1nnjkEhMalZrN6g08wwWVGcA2uWFRognKb04GxD9I/ySA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwZWjW0D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A0AC4CEE9;
	Wed, 14 May 2025 11:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222652;
	bh=tuM+4GBuky8rvhpUbkvytG6IgttQsqZkqThC8BUjoFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BwZWjW0DB2YWPwZbHRAz9qbLC8lObChDm6LbaejDE0itMn1QhvkDMt4XHNbR+rEcP
	 nwvw7o6snaVjPfjHJ74rDBW4S6TpJXnLcsgxxqoNiUsS3Y0HEj0fpBkP3wx1Isbzd4
	 82o2NkoN/QbQWBJXGBN7Rtud9EXnCZnTchRde8sSLpaTPqfduuHdiI8fXDcCUy2qaS
	 wW9TesQpo4auwYqMLvDHLWDwlOauFAajBUebYIym1VWG/WKVxYJ/QNpEBBhMgqNXGd
	 6if/rga1fg+64h0icT0d2Yb1rPfx5anEsyxjytAg0leihSu48jW+y482FDzkrka98S
	 sVi8D8+NJZgew==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Qiang Yu <quic_qianyu@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250429075440.19901-1-johan+linaro@kernel.org>
References: <20250429075440.19901-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
Message-Id: <174722265039.85510.16073616165341473080.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 29 Apr 2025 09:54:40 +0200, Johan Hovold wrote:
> The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
> one. This also avoids the follow warning at boot:
> 
> 	qcom-qmp-pcie-phy 1be0000.phy: supply vdda-qref not found, using dummy regulator
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
      commit: eb7a22f830f68997d76e660a02143c2bc72e7fb7

Best regards,
-- 
~Vinod



