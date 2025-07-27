Return-Path: <linux-arm-msm+bounces-66776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A7B12DEE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 08:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF60F17450F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 06:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DD91A2541;
	Sun, 27 Jul 2025 06:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfbkF7yt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A57374C4;
	Sun, 27 Jul 2025 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753598934; cv=none; b=PyUe3TCqJHkllVVWSnyFDldKB7CHOhz+ehGmg6DXjQpbrXu4DLxgF9cIeTE9h0NYd1Mwjg7aewxa4950LMweOnGFJhD2YkuKCn/gIGZPY8HuaJYMdI2n5tgFhaMhKSX1coMp0mwP/cWYSysFf1p1EC+hDpyqNWyQ+5snDBmhMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753598934; c=relaxed/simple;
	bh=FPkM309Se8TKNOMQia+CHlwJ5P4QHlEg39teSfFx7MM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=G57IAxWSjx6ih3uqFku/F+Kmicob7BlMwRJQ94tc13B+xBHvLGX0hU30aTKtHa8Kjl4MLteHbuEPAgu77mDle859i0UqNWXmTn64hPapuol2d757ttX6ZkZofHCM08Hl35QUeQW3FhByH46XkX44mgi7W2C9j3lPtZzaPLCJNNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfbkF7yt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DBBC4CEEB;
	Sun, 27 Jul 2025 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753598932;
	bh=FPkM309Se8TKNOMQia+CHlwJ5P4QHlEg39teSfFx7MM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cfbkF7ytF1GoiRWGm2JGpC/kksNoGJL2BSC+NgXC3l/M8Px90XwJrYytn3GM9a/Kr
	 uzgBmksQu6wASS++VRi3LW9zhx3y00d9rG0M38+sEs6eg9+LFjPnYyAkUNuw91rWH0
	 X3KSsdZpFmlmwukilCLqz8ov3f7hOX4JT7WMaJBQynTKsjBxj4DG2Zx7aASdwuMGFc
	 r4mPlb8XkY00zInr2U3LJ4cMt/PdiFr/T0tGj/XoPGA2jkCPMYlhYJZscI3PehFbzc
	 LzxD2+U6N6qvp0VYODMYvMUBfy/pF/Ae/mnqBapkNPcCTjc1YPnWsG0hu/gXj5C/HD
	 5vo6pWntBDwzQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250727021756.657115-1-andersson@kernel.org>
References: <20250727021756.657115-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updated for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Brian Masney <bmasney@redhat.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, George Moussalem <george.moussalem@outlook.com>, Luo Jie <quic_luoj@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 26 Jul 2025 23:48:51 -0700
Message-ID: <175359893163.3513.9647317962157940113@lazor>
User-Agent: alot/0.11

Quoting Bjorn Andersson (2025-07-26 19:17:55)
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.17
>=20
> for you to fetch changes up to 45dd59885ca8d283f365774a82b9b785b65c8d37:
>=20
>   dt-bindings: clock: qcom,sm4450-dispcc: Reference qcom,gcc.yaml (2025-0=
7-19 22:42:28 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

