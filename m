Return-Path: <linux-arm-msm+bounces-38268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F49D1EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 04:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73621F2239B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 03:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F327F14375D;
	Tue, 19 Nov 2024 03:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mwj0WlTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06D1863F;
	Tue, 19 Nov 2024 03:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731988047; cv=none; b=di46RzJoaNaZ4i1REc3dIdH/AdkZOEeguDqwCtRQn24/WRpf4OVlD9mwIyMjLAoXRKVUIrKYe15uhC1xSIulIU+g3xyN7O9gsOXOvf5jQRWGWvJ3FTMyQYIFiB0lv6OHpJCjaLnJ69+HiowZTpKitSZyS1jh1Qpgt0lzW3x0Ht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731988047; c=relaxed/simple;
	bh=RKLamRwBayIwDIcA2zlPwWfk0nYyiCevvGVdQc4QLko=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Mu1I3Li8L6KQsWGCE/Pev+ouk5wvn1UluMSjp/yyaREBvzh0tlLgOOVn7UbzlijURGzbZlTiwP2iyAR+dEARt2Mn2IYMMmusn11O90WJxYFuBwVw/5B08Nwk7Ou9ffAsk4gQbC12dcV8Kb1tA81EGAVqSjW7kmth9iMqH/hdyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mwj0WlTa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E8FC4CECF;
	Tue, 19 Nov 2024 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731988046;
	bh=RKLamRwBayIwDIcA2zlPwWfk0nYyiCevvGVdQc4QLko=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mwj0WlTaEgRMpDPDtyTSjZOeUQcjAwlai3euRxpBQC60iZWIwFkvZLfkkYog8Hinr
	 8oSF/VuT3hVS5mc2pxiP/FhekFtNtkMZlcqBIAxXPGOB+l/kAAv36f98R+d3mw8MPD
	 he6/XCTP65tMud2UizHNrSK4ngrQmwx275y1ErGrxCmo+JxefpVmYcqI0f+DmWCdZs
	 +yGG1C8jYh0/+iDsVa/Lz3NiWQEfV6+yx1BdD5pEeFsori/W1/dYGSaREdbrwEHDcC
	 LXfRDX9IuwWh+O/fWwp++CRXJWcy7JwAuVHQJomzOoydIYelUIuoguSbL5+cDdnofu
	 4xmioD0tsxWDg==
Message-ID: <943d74eeb9ef087832404a583f4f7d86.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241116163854.122610-1-andersson@kernel.org>
References: <20241116163854.122610-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Danila Tikhonov <danila@jiaxyga.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Johan Hovold <johan+linaro@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, Arnd Bergmann <arnd@arndb.de>, Devi Priya <quic_devipriy@quicinc.com>, Gabor Juhos <j4g8y7@gmail.com>, Jonathan Marek <jonathan@marek.ca>, Konrad Dybcio <quic_kdybcio@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 18 Nov 2024 19:47:24 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Bjorn Andersson (2024-11-16 08:38:53)
>=20
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.13
>=20
> for you to fetch changes up to f1f49cc505bc998d7c13e5a518d027419a21fbae:
>=20
>   clk: qcom: remove unused data from gcc-ipq5424.c (2024-11-11 21:57:38 -=
0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

