Return-Path: <linux-arm-msm+bounces-52413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A81A6E738
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 00:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B285172749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 23:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDC11F03E6;
	Mon, 24 Mar 2025 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtxInX6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268D199EA2;
	Mon, 24 Mar 2025 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742859359; cv=none; b=jTf9Y/dPUriGH44jIuVarWQyaeD6anlloTfSLzlLeOghs44kDJJRLE1RDqEwNodjUxLrOyj2AEu3BV2DakGlHRIDsU4VaUc8iHyR0sZ+3H8Btfat9lhyDKeTsQOWWywaVbhF94Ge8/M1RFe+hw+osOZRt5i/YXIExRwaK/z+0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742859359; c=relaxed/simple;
	bh=Rg0bhVS7IXPeDUaqm6jbmcJoYDANFRraWn+5Ga0k1X0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=iqrtDwAIpTVqFku1kAO28K79u8kaNKmjnlixWHgQoPoTp38Vqj2to25lu0FE6WAOAwoUof8pqQaAEXtixEFx9vT8bPfHB4vydvtWj32GsSMbn2XtBqdrYYlIHQL0tP9IfLnkBlCSVqiO9Yj2wlFMN2pKHmBko1/wAwHzUXt1X/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtxInX6y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8727EC4CEDD;
	Mon, 24 Mar 2025 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742859358;
	bh=Rg0bhVS7IXPeDUaqm6jbmcJoYDANFRraWn+5Ga0k1X0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZtxInX6yQsCPOx57XwUDwrJN69cDO7Lt9T41YjfV4VNQPRBLyucbLttuvCe4KPALu
	 WBqyIz5pQRbjrwTq9fUG3+fX2yv0rltUdaDhT8hIp/gGfrinKFEgGSberA4J67hWqd
	 rehYjqNsFZzo/ZgjZDeFXTa7mj9jDCkwQPn5q4A0M3M3JiTUhS6XhQF+DJVyvZjQp6
	 lOYR3bEkeraKmYXrBlyNi/WpclKCTepgwCAGBGOT42LTisTGMewROxOYbGaLBLhJ8j
	 3S1WoX9H0iVECSyEDYWp9A9uAzs5rdkPuLvfAwH45Z1U9AYMfZifXoxGvgQtQtSOth
	 5UI4DFUZRNinw==
Message-ID: <756e17f75d314afc8ce68b727fe2b115@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250322133453.2723879-1-andersson@kernel.org>
References: <20250322133453.2723879-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Imran Shaik <quic_imrashai@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Devi Priya <quic_devipriy@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Alexey Minnekhanov <alexeymin@postmarketos.org>, Daniil Titov <daniilt971@gmail.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Ajit Pandey <quic_ajipan@quicinc.com>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Jordan Crouse <jorcrous@amazon.com>, Karl Chan <exxxxkc@getgoogleoff.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 24 Mar 2025 16:35:56 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Bjorn Andersson (2025-03-22 06:34:50)
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.15
>=20
> for you to fetch changes up to 9bf3684e0f7e65298ff844fd81e6dc5105c67354:
>=20
>   clk: qcom: Add NSS clock Controller driver for IPQ9574 (2025-03-17 10:1=
1:45 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

