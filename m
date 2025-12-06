Return-Path: <linux-arm-msm+bounces-84550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D02CAA00B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E8863196FE2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 03:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5D529B8DB;
	Sat,  6 Dec 2025 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkCkgvZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27438299A8A;
	Sat,  6 Dec 2025 03:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993592; cv=none; b=QZ3c0LdM3ssvTN3/DE+fd2brTzuR7eDZoP0+KPbbLcoOiT0Su5EQGCPo6FCqIT+oPDziXLv5WLfxiOjSrANqbef5DuSim4Ra0RcZ5cat/Z9PccWTqKoss8rkhynpe7zByCUsmDhNzwcSTx4sZkXH3UxrC86gNLs8dBYKz3oSz+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993592; c=relaxed/simple;
	bh=Yp+h4dlCyljGscNsyg/vjo3+xpYcb64d7JYudiRzfp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1YWBkhLWB8oIqgF+WaBoaMOTZZJobp76a+4E5wQ6PTrPLfZuCXlkBen/DsH5qCTFY1IY0HprvIWRJzi5OAhZmWPJTYnFhkJqcpP7Jtc3uSyD9O9FcrB6a5Bhd1sRA0j1oSMwRrCavyF+VOfcpCI1vQ5PKK8nZ4ISM8X+blWFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkCkgvZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D93C116D0;
	Sat,  6 Dec 2025 03:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764993591;
	bh=Yp+h4dlCyljGscNsyg/vjo3+xpYcb64d7JYudiRzfp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkCkgvZydo552dqIhZSMUa22B6nbA4hWiZy/1qRlUooHHb9bDEQUns65d/CuvPx6B
	 VA5tP48awwY3zOtpJ+USU+Qtzv9nFK98FyxUZEwVu6Bj2nzIZIKloaITUAH5Oich2W
	 SQutnK07It7XpF8LnyHAz5GIdRVpAkZ40t50DRqu9N9U3OUJoHLHDg8aW6cEG6DgUO
	 +cikYW8et8GZRcaF5FPslwK27weGO8cflJbUNb0xxA3a5ABNVUXAdXIdjSYQStfauU
	 FqHFzh1TbqpnNbVRSu6Fra/mTuUArvnQXeXLyvBVwwuf2XJWhf7lGKlYnfiQtZ3ovM
	 UaZoIJ6+hR8ZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: qcom: sdm845-oneplus-enchilada: Specify panel name within the compatible
Date: Fri,  5 Dec 2025 22:06:05 -0600
Message-ID: <176499396482.224243.10120913853765639507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
References: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Dec 2025 11:41:24 +0100, David Heidelberg wrote:
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> New device-tree will work with old driver as expected, due to secondary
> compatible.
> 
> [...]

Applied, thanks!

[1/1] arm64: qcom: sdm845-oneplus-enchilada: Specify panel name within the compatible
      commit: d60e51cbae7e92c4a00cddb2750129094760da60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

