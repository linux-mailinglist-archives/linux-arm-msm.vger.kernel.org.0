Return-Path: <linux-arm-msm+bounces-6328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92D82257E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 00:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12091C217F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 23:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9061774B;
	Tue,  2 Jan 2024 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYvx8/RO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FC1773F;
	Tue,  2 Jan 2024 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF96C433C7;
	Tue,  2 Jan 2024 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704238242;
	bh=yHQMbbCMfdmOdZwNywEUJRpRywJN3uD2vdfBpqT2ICg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GYvx8/ROn6w5OELZ8KQvSXmbPdfWDi7o9pbMoK+e1/1I19a7ScOxChOlkfS/skaAZ
	 vzUn0g1kX2M2LVCwOQ/0JxsaMXaQ2WrcvUOvI/tDbiTRV/nubAMNTYd2LOvFg1pVUC
	 zCK3xGqf2E7D6o/6jYQeBEvSs7HXflCTmAzV4DufTNlUm57919u/qT9XW6wV8FvkqW
	 ZgC3wAnmCwX24afglblmdbgwgzQD8JQCjM3GRxT2lEXZiLJ3lfMWbtJvleWSUoifSs
	 3Uqi0GIWm5pVJTdtFtphCG3GezxxCTGYIPIaRTT0yN1stCYFUHvnLkKYABFYu7kqVh
	 gQmXNDt0uuN6g==
Message-ID: <44ef74fb81ec3a16cec2b1197eb826f4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231231041115.3263074-1-andersson@kernel.org>
References: <20231231041115.3263074-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.8
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Dan Carpenter <dan.carpenter@linaro.org>, Robert Marko <robimarko@gmail.com>, Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 02 Jan 2024 15:30:40 -0800
User-Agent: alot/0.10

Quoting Bjorn Andersson (2023-12-30 20:11:14)
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.8
>=20
> for you to fetch changes up to 757d1ca14f94e4e00777491dcab0b4abee18f9bf:
>=20
>   clk: qcom: dispcc-sm8650: Add test_ctl parameters to PLL config (2023-1=
2-19 14:12:41 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

