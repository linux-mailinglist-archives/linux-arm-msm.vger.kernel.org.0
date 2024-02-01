Return-Path: <linux-arm-msm+bounces-9421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E318462F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 22:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94F941C238C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 21:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21D03FB34;
	Thu,  1 Feb 2024 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nwnlre+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921540BE7;
	Thu,  1 Feb 2024 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824438; cv=none; b=qoo4S41Ia1KoLixGbcBTNYVteLS7h8oAgYjQi/155RIyXFmXejHyBZQoitb0Rpud2m3zaUZF/fGQQqwIpYdoE2YlRbCW0NkDrk4PtWfWfFxNR+Ttc9i4u8mPePy8ugI8DDs/7y/aP8ChbpBv+e120qCQ+Jo8Hk1QO18YqLH2e8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824438; c=relaxed/simple;
	bh=NfBaMGo6hB6jiaOjT6dHDiMLAmyyZIWuGxeXvuI2ZLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m4yucMneoirkyE4sNVplL0Q2pjFRZIgu9nxt5LiaIdS2+3iLuVasbIlysKtFCyFUJwrveoLwO4STLd8HP7tYQAosaB8JDSEbi4wMvlpjmt8bpeNlTOIeZ7UkEYhk0cIa4j+u1Qa3atSQo1d+SxRIFeS0RGXP84EvWFi34w5qysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nwnlre+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F995C43394;
	Thu,  1 Feb 2024 21:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706824438;
	bh=NfBaMGo6hB6jiaOjT6dHDiMLAmyyZIWuGxeXvuI2ZLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nwnlre+DQliyR3yDN43ku4GtCIpI7YzmXvm6g45VudCwhaFRbTJTlOL4Gk9f9D3BU
	 Do+CB9KNt6Djxnw0o72Dl8azMkRsUOhOgbc6tZtbNGilXucAH/KY1FcGUQJ2a3NIkA
	 TSybYWSzCEFhMG1yEmp4X3BcG3D3jWueOoDHJFJKgQGR8lGvnOkfBT/wEz0Iu+LaZL
	 LkCjw+bvEapC0DZB/AkFjvZ6mr4INpX2XXoxkMJwlQ2uAZtXEBDUK+NltUGGMP5c0l
	 u1HSGFB3bVVOcKkode3uzIBcGOzlDMUsaZidZSBk9sBP+NbiRNvvagNW2WYVYJ4ayF
	 cu5wI+ZNQZ9cg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] phy: qcom: qmp-usbc: enable SDM660 support
Date: Thu,  1 Feb 2024 15:53:48 -0600
Message-ID: <170682442872.248329.3260337490946339649.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
References: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jan 2024 03:10:54 +0200, Dmitry Baryshkov wrote:
> Enable support for the USB3 QMP PHY present on the QUalcomm SDM630 /
> SDM660 platforms.
> 
> Dependecies:
> - PHY-related changes of [1]
> - [2]
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sdm630: add USB QMP PHY support
      commit: bb5009a24ec3f2f2ec1e2ed7b8a5dcde9a9e28d9
[4/4] arm64: dts: qcom: sda660-ifc6560: enable USB 3.0 PHY
      commit: 319a12e7c399df4316f54f6cc83cd6cdffb4ec4a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

