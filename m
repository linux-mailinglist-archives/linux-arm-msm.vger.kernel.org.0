Return-Path: <linux-arm-msm+bounces-27644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CA944199
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F65A1F22AD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCFF101C4;
	Thu,  1 Aug 2024 03:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+t5D0Qm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B2D2F5;
	Thu,  1 Aug 2024 03:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482393; cv=none; b=VauGzqtqMbDjVuz8dhEbFbrYnjBvgjx4B/Kz+MfUq+YsjuNUlXAfkLWpitupgtlCZ+uU6a50JxRMGh+FD+D6xiZG/zMgMC1One1ohoCDd6QCvN1E1YEVlYEpcetQk1xK7jzb6ns1hFs/a4DzDI9C/KDe55UhlyYMM4AwgVIx3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482393; c=relaxed/simple;
	bh=j4qNjnFeaBxGuhlpqsnK2Dt/QWclDh6C1BYeV7o8GGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghyH0BNxOBd3kvnFgWRv4u+uvFE3TkT4ctmyURd6ZnvM15XzhK/w7wYykbqhaZGO2QLkdkgs1OLbutcW9vlzwCTIDJ/Dc5PQXXda4mq/AaPWLV+XUjV16UBxesHooeQkYuljFw+6J1fPWcLstGseCWIUz9JoVTKQUegjTm4D0ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+t5D0Qm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD9DC116B1;
	Thu,  1 Aug 2024 03:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482392;
	bh=j4qNjnFeaBxGuhlpqsnK2Dt/QWclDh6C1BYeV7o8GGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+t5D0Qmr5zV8JDJ4oYfPO+2/CsYEaIc4LGwiVwPGWv0veumfeGMY1+OOFFgAMMA7
	 icLneJqgivfGSP1TaAAH9UvlZ8cxhO6jBkuu9gk9y69Aou/8ECJK829aQj5ZeDhvwN
	 Igqoio9qj6o/wtgnMVsSQctKd1sDgc/1n8Zqb56yVQCtbXWWPZMVvnyLG10WHMyAJ5
	 t6Q4nli0o261nkZZmfPq2+Hyja9Du0vnTsUCUriwr9Mj13NTIgTscqKDCuApMnP36S
	 +DmmH2mzaxMuv/r4nRk/T6w57h425qv03xnOZRAOYpQJBKMD5VRz4MPKNzCIcdPWKB
	 RzCsnKQgP9csA==
From: Bjorn Andersson <andersson@kernel.org>
To: petr.vorel@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Reimelt <alexander.reimelt@posteo.de>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: Add basic support for LG H815
Date: Wed, 31 Jul 2024 22:19:37 -0500
Message-ID: <172248238592.319692.13778827618889612885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727201413.114317-1-alexander.reimelt@posteo.de>
References: <20240727201413.114317-1-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 27 Jul 2024 20:04:48 +0000, Alexander Reimelt wrote:
> Changes in v3:
> - use 0x0 consistently
> - pad to 8 digits
> - drop compatible = "framebuffer" because it's unused
> - drop chosen
> 
> Thanks again for your time.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add LG G4 (h815)
      commit: d2e577267cc29841d9f316ff65494d1892fed13c
[2/2] arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)
      commit: ed3c955cab3a9d5a9bce4756e4bd3390f9c23e1f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

