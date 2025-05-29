Return-Path: <linux-arm-msm+bounces-59778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9AAC7911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 08:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E2E5011AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 06:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EB7255E20;
	Thu, 29 May 2025 06:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkQfSDMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED63B1AB;
	Thu, 29 May 2025 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748500513; cv=none; b=TloOrlQp1MMB2rty9elqBvkn/jttuUL80Sjpzgl+pLprI2rAF2hJvKSTJzNMgz22V+u3dgDE/bEDng56mr3747PF9Z3mnInO/sIxjP5etz2AjHk40z/52VFrfYWtcPP6jltpQywB/fVh2dYcM9BHPrtNb827f8iV1Kq8GpZbpH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748500513; c=relaxed/simple;
	bh=W59ukfJHiYDFA5z+8vL4wXL+O4w/xl5nJwOF60dMww0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uU6N1+CLuNTkZ8g+cg0n87F1u792TlUWgedLGO64USpAVEUuzfyKqprVmtxcoKjV38t/a32TyRX9ENHtM75b6/2PlaNV6t60SXfEScpT7TAdEw7zj9yQ8mEABsggzCf++3BCjTW+gcF/u/KKtI2tCkBL3Rb6Be4nXD20AZCJg1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkQfSDMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E0BC4CEE7;
	Thu, 29 May 2025 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748500512;
	bh=W59ukfJHiYDFA5z+8vL4wXL+O4w/xl5nJwOF60dMww0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gkQfSDMqKVC7lzSMyTe2DlmLz2CRaT1AEVdTBtsX2j3pwRDXi+Hn54Glm7/blj9Dr
	 vnBvqS5lAaxEW/wZ53BzH9+jW5w2xUTG33M7Y6RRHBGS84SBsuHwsdt1guo69Bgu6a
	 9uZ5uFi8pi/PSDR9Zd0PAfJWlWFtKWP6rFGZlXz2WUiFOEwhhkguPQSuempE5FyK2r
	 o5VjPD1r6Ug6P2hPmCuIh+oZ0WLVnhxfQm7MSP6yv2lCjeO4S3+eOcZ/R09YVaQaa7
	 NmriDfP0D54ARUnMwvBkd95AGY9SPP9T9b9t6es/lbn+udX4zkHfCKSTtM8wltc3dk
	 FqH/oZcX3VA0w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250524021610.18621-1-andersson@kernel.org>
References: <20250524021610.18621-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Wentao Liang <vulab@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 28 May 2025 23:35:11 -0700
Message-ID: <174850051136.12717.14153102591884762560@lazor>
User-Agent: alot/0.11

Quoting Bjorn Andersson (2025-05-23 19:16:09)
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.16
>=20
> for you to fetch changes up to 201bf08ba9e26eeb0a96ba3fd5c026f531b31aed:
>=20
>   clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks (2025-05-17 =
19:28:40 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

