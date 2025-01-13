Return-Path: <linux-arm-msm+bounces-44902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCEFA0C096
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 19:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138DF3A4A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 18:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E2F1BEF81;
	Mon, 13 Jan 2025 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnuilxLD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D41865E5;
	Mon, 13 Jan 2025 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736793505; cv=none; b=jZ6Afu1i0Gx2LKuZybG2nzun2k1TqQVEWWFkadmXXjJQf4XXpUXxlnA0Ph7yFoLEoObZ+5aXi2jB9QmYnCqhqrTBggcNUs1zO6og4D8qhsy90E0sdBZ+zWUer3Fsx3EtY/XylM0BpRcTd7cHhSkhou7Gmhw5vNyoBfNj0YhOFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736793505; c=relaxed/simple;
	bh=5J/IBxz8Z/k6WFcryDdFs/+RqAk40joH86YjsR9ymeM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=hIiIrniN+rP47VE8X7EL2cCKGMuh/J+uAfxT4D33dRBECmSsGC6tadQGz0l1e4Q0ApTqynRVt7s33czh2Sb1/pxj2Z2x/chxJhu3kO/adb/y2abenWmMbjGaCkuzaD8QG2eLieSIy2D9b6clqHxsTMHaBQgRqMGKAPRzessUmZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnuilxLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EFEC4CED6;
	Mon, 13 Jan 2025 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793504;
	bh=5J/IBxz8Z/k6WFcryDdFs/+RqAk40joH86YjsR9ymeM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MnuilxLDrXrymEHAZG0E23UA+U1JVHl1npqZZH1yTfqgPh4QvQwGnp6h8Z1du+2gv
	 CDosLDcokny5vbpdEEpfOAx+nNitETNOURs7HE3f14vmaI9Q+aD91DD5HRIEmEds38
	 dn431Z88WFcbWhGHf3AwS4UhhRvtuu3r/HL2YNXBDXVgjTOkzTlQ4GP3L4qqoe8iM4
	 kU/KwkRGurXUu/0xICdLasLcm3ebKQxdmuhRzKirMHEXysJshVyMTzRCsNwArXSo7r
	 chVPnokXaEVsR2WTY1FskEozuAwQ7rZyEiPY/W/XWY6edcAQLT4lI0GR1gONkZqK3/
	 x8ogU/YGbf+Mg==
Message-ID: <b0d029d67870bebefb607b8584dc36ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250111181938.395276-1-andersson@kernel.org>
References: <20250111181938.395276-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <quic_tdas@quicinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Gabor Juhos <j4g8y7@gmail.com>, Daniil Titov <daniilt971@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Dzmitry Sankouski <dsankouski@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Luo Jie <quic_luoj@quicinc.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Varadarajan Narayanan <quic_varada@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Anastasia Belova <abelova@astralinux.ru>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Richard Acayan <mailingradian@gmail.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 13 Jan 2025 10:38:22 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Bjorn Andersson (2025-01-11 10:19:37)
>=20
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.14
>=20
> for you to fetch changes up to 5e419033b5cb20f9150bfec15dc6cdf10049e654:
>=20
>   clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC (2025-0=
1-07 22:45:19 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

drivers/clk/qcom/gpucc-x1p42100.c:42:22: warning: decimal constant 23000000=
00 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 com=
pilers are very likely to produce unsigned long (and a warning) here
drivers/clk/qcom/dispcc-sm8750.c:79:22: warning: decimal constant 250000000=
0 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 comp=
ilers are very likely to produce unsigned long (and a warning) here
drivers/clk/qcom/camcc-x1e80100.c:47:22: warning: decimal constant 23000000=
00 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 com=
pilers are very likely to produce unsigned long (and a warning) here

