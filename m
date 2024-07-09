Return-Path: <linux-arm-msm+bounces-25747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71092C44A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 22:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7151B28339C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 20:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79159180030;
	Tue,  9 Jul 2024 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRpSYZj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C217B02B;
	Tue,  9 Jul 2024 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720555462; cv=none; b=MEx2oemlO4RUO9d5rlncG9q7O7BPeu+zbV0SFiaQcWDPMkS74MV9u5oYEQ5IcN+2ntoihTGVca2otYnM60F5MZheQhCkHqo8XV/2Ene8cLqQs0ai8JFMiBxnpOI13/i1F8IT977Nyfu0XFLwxllJbmmuGkNNFe2IbEhr0RDb1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720555462; c=relaxed/simple;
	bh=VivZPAUiRi+d5hAMjwMhS1EPUevBrj95yio+3IfbWeY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=U+Y5dj/guDlad1WpUDJXi5f9cJjFuQu7WhTYnUORSw1OPwRNzg9BOgYR7ZyTVAWHGLXlD2hQqluhYP2R6L+J5KDaS7x4I40RzUPkAa0lDuBkMvmcJLHd/WeHtyrNGKNR2muH3Wra8fYPqlfklgjaHLDzcytOYV8egCGqhhBelPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRpSYZj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF770C3277B;
	Tue,  9 Jul 2024 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720555461;
	bh=VivZPAUiRi+d5hAMjwMhS1EPUevBrj95yio+3IfbWeY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tRpSYZj8XzA5guBziaKhb+RjnQzqkVKVeWAsUesZC9EK/BTxINNsT96OEVvJfzNnn
	 K0hv6RCEEpXmAcBCFwQjc2NyCxlobrQYFguZiWoDlzl5V1udPDrXBt+L85O2C1xumt
	 2hWoGGSuAd0mzCQkAAUTGh56oMx/b/JKHPE/drBHGlR0iD9aWqLfPQhQtik4E5oNXR
	 2pgT5hZjYB54QifJbZnraFw+AVc4IkEr52uDWKNhHW8c2NgBsZC3BZeILHYkp0sH2t
	 xx0E684YZGZCu1suPAa86EMVeGjffkw4b9z3vVpmtc5uRJK6e1dOacK4ai26qYjqWU
	 Kd7ASDoRrGAJQ==
Message-ID: <d831eb2d5b1e11c4d1196fbf448a028a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240709193927.4424-1-andersson@kernel.org>
References: <20240709193927.4424-1-andersson@kernel.org>
Subject: Re: [GIT PULL] A few more Qualcomm clk updates for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Varadarajan Narayanan <quic_varada@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, Chen Ni <nichen@iscas.ac.cn>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 09 Jul 2024 13:04:19 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-07-09 12:39:27)
>=20
> The following changes since commit f27e42c7d3ff8ddfc57273efd1e8642ea89bad=
90:
>=20
>   clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks (2024-07-01=
 22:28:05 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.11-2
>=20
> for you to fetch changes up to 23711cabe122ef55bcb2e5c3e3835b5a2a688fc0:
>=20
>   clk: qcom: ipq9574: Use icc-clk for enabling NoC related clocks (2024-0=
7-08 11:40:57 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

