Return-Path: <linux-arm-msm+bounces-2169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389337FAE8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 00:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7C91C20ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 23:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9335149F6F;
	Mon, 27 Nov 2023 23:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2RWegIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCF49F6D;
	Mon, 27 Nov 2023 23:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F130EC433C8;
	Mon, 27 Nov 2023 23:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701128715;
	bh=5NyhAgAnJED9vs5yJQyLZIgE4q88VxwoLIUkobS3I4I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=J2RWegIEJTLwURIvpx64vrZE5M5ajwQ4E/h4FVrrnFqIxocmYo8Er2r5BHO+4n2QI
	 4UUNf3BY49BWKSmTMK3lXdiT3mI6mJary8a72s0l3vjdRSThWp8ljvhYmytvYM4QCo
	 QlScTRK58aUSUJdfwqmpMMxUK90D+lhmVfYSpdU9GxTinHmRoglZcc6rzKRYyVp6Rg
	 dgGYJVlTrZfuUV8nq8+Vw3vlhk+8Qt29SwiLQPF5dCrFxZ4i+GB+WK1hf9xzXn324O
	 L/WUMQ88Zixoss7AigXGWCDgWKa8WErIv6j3W2xcchAdKTiU7WxRNnrZx+rkFy9H+P
	 Cqq/29Gii9mWQ==
Message-ID: <3c547faab0533196a06196ed3856fa75.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231107064545.13120-1-quic_jkona@quicinc.com>
References: <20231107064545.13120-1-quic_jkona@quicinc.com>
Subject: Re: [PATCH] clk: qcom: Fix SM_CAMCC_8550 dependencies
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 27 Nov 2023 15:45:12 -0800
User-Agent: alot/0.10

Quoting Jagadeesh Kona (2023-11-06 22:45:45)
> SM_GCC_8550 depends on ARM64 but it is selected by
> SM_CAMCC_8550, which should have the same dependencies
> as SM_GCC_8550 to avoid the below Kconfig warning reported
> by kernel test robot.
>=20
> WARNING: unmet direct dependencies detected for SM_GCC_8550
>   Depends on [n]: COMMON_CLK [=3Dy] && COMMON_CLK_QCOM [=3Dy] && (ARM64 |=
| COMPILE_TEST [=3Dn])
>   Selected by [y]:
>   - SM_CAMCC_8550 [=3Dy] && COMMON_CLK [=3Dy] && COMMON_CLK_QCOM [=3Dy]
>=20
> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controlle=
r driver for SM8550")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311062309.XugQH7AH-lkp@i=
ntel.com/
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Applied to clk-fixes

