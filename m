Return-Path: <linux-arm-msm+bounces-18205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCF8AD479
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 20:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774821C213DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 18:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEC71552E1;
	Mon, 22 Apr 2024 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bX88AI0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44915154C10;
	Mon, 22 Apr 2024 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713812377; cv=none; b=n2Vs93HeeKMmpWX+/Q/oDqKQJSfZ6dBbeyUg4fx9Ow5bU3LyjCMN1RwvrMkwqEUFeg7aGH20KA2MYhEexVT8ojwIHG2A8Lwt6ZTkk7JIWKZQzBF8GcON95JWmnpZFxh4V5Zqm8R8MMSwFO+T59UjEzTYFPTQlPTmsCT0gXo0+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713812377; c=relaxed/simple;
	bh=eGFdW3sldzR08VZu/MJcJfX2g/Wox3smD8F5MC8UyeI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=K9rWPY7++9KOzkm6QQyGzokFAord519FhhX6cBGMtNcSmywqlytb1MaybyCBwCX/vG3nQDGaLh/RKFRcLUUlHBefwV7SqkjG46Nep+PuO4km/XlHnoGulnmLboeCfg0heoS0Eu13Grx/JxtmNYpwTuQ+UAEchN3YF6k7PnNXl2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bX88AI0t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB078C113CC;
	Mon, 22 Apr 2024 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713812376;
	bh=eGFdW3sldzR08VZu/MJcJfX2g/Wox3smD8F5MC8UyeI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bX88AI0tK3/ReNpXkTH1n7VCIgLWocKKCTLwkUJPke5ONO8t6gfUVcRJ9zadYemIg
	 n6cpwTZcVJGfkPeVQMKjWBdqKszt9Raw46xATkFOOvigxDkUgiS01OZcnW/x+Iq8oP
	 L5Ih6Kgg6iGT5Uh7dMgajGx4d46owvfrW6WRbm/KSr9X7szwtFXYp4oio/cqlyNF21
	 UrcGCIqx/D5i7/ZFlL11ES8H9LY/5U1B1rwePmfc52H6l7uUtE7rYJSBXQs6kxmAIm
	 3v13V1/fl5IK7FyUAH1sCer8RbW4CWJlA7HlbFVcfdCpq+ojqzDbqK7VG5t38BJXJE
	 4DNkN/OYaOJ6g==
Message-ID: <048797d988e487f79f74370e1a390b42.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240420162801.1132878-1-andersson@kernel.org>
References: <20240420162801.1132878-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Adam Skladowski <a39.skl@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 22 Apr 2024 11:59:32 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-04-20 09:28:00)
>=20
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>=20
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.9
>=20
> for you to fetch changes up to 0d4ce2458cd7d1d66a5ee2f3c036592fb663d5bc:
>=20
>   clk: qcom: smd-rpm: Restore msm8976 num_clk (2024-04-02 22:49:07 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

