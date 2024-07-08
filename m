Return-Path: <linux-arm-msm+bounces-25517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79D92A8CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED981C202E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B954F14900B;
	Mon,  8 Jul 2024 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOBXaOIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922271474A8;
	Mon,  8 Jul 2024 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720462464; cv=none; b=BXx+tnO2NbkRJmMaowLygK6ykicOukd+D3GrmtgCTY50Rh8sGRMHhU32Y8stg6D1Cx3fiXbou8bFq/enL+3dRgSxVpRASJCXHYCsTvop5NpjgBKsj9EUKy6ssfjTe27uksCKclpzuVdwFhll2eOvA+yAq2xSpmH7M/iX7wHY6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720462464; c=relaxed/simple;
	bh=XxmYGyGjID/BHhZeRJ8KegecLpcuJ3Co/NlmoLD4Lhc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tZGK3ZjBH04vulAEDixPl28Ewf6TA7XJeE1r8DEL72DwK//acaz4JX6ejf9fS0rLk44ZFqV7uquwnXW9QwQVDCNV/VmSyqH6uhUDiQJf8rISpDigpnL+4MQIxapMYrlvqDn65tLtmObcKzLTY9R8lzqiEG/vcyHxmUT3SIod8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOBXaOIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFD8C4AF0B;
	Mon,  8 Jul 2024 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720462464;
	bh=XxmYGyGjID/BHhZeRJ8KegecLpcuJ3Co/NlmoLD4Lhc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NOBXaOIraSeAMDOc8QifM2SSjJnwTd1cSKK+A4y1SmLpXG8B4S57btwIHWJvO+AHc
	 c/bYsResBbOHjJqPJDdCdIFbxfJXQLknKbhCFc33RmNgk6z54s0isIqtZKKkYrzXTf
	 g33ZjxLS5Hddo3ZMKMPLSCjV1UwXXdiTQX95lTfffZcGiyqnerJMIRjZ4kviNUX6z+
	 QQNAUyIIeQj7JSQjh3lk2Bd4a/1Bluu07ElfJefwm+CRILkAYkEB0ZC6JEm8y1wrxn
	 o4LAqClq16Q0Gy1XMyMPHGtw3077pt8qMrW3KOMUifFQ24hBTnCBRnn603qXLjskJG
	 chtomuv2e0LFw==
Message-ID: <abb79e2d18d9c6f17b987517d40e8388.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240706174425.19441-1-andersson@kernel.org>
References: <20240706174425.19441-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, Danila Tikhonov <danila@jiaxyga.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Chukun Pan <amadeus@jmu.edu.cn>, Elliot Berman <quic_eberman@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 11:14:21 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-07-06 10:44:24)
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.11
>=20
> for you to fetch changes up to f27e42c7d3ff8ddfc57273efd1e8642ea89bad90:
>=20
>   clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks (2024-07-01=
 22:28:05 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

