Return-Path: <linux-arm-msm+bounces-24914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3D92487F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 21:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783B928BB58
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 19:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAEB1CE088;
	Tue,  2 Jul 2024 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSVbKhhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802371BB69E;
	Tue,  2 Jul 2024 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949210; cv=none; b=CfkwC0f1E5PEtZvUgh+DtKQoGZMXlFeJwhdQu5I3Ms/gOHgh3w59m4PdpS163t8l7TRPLAttdZ9TmyYey39u+pDJ/xDBPhjauDWm37KBy2HN+8r9vVECcyAmrN4Uz9qT2ae/x1KVV0H8DAklTgWhY+ay2wZ1QiJbLWExg8D0wUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949210; c=relaxed/simple;
	bh=oNVXfKnoKplLLDRR7PjDsvUKG4z+xriNkry7Rl9Njy8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=XzG4NSGbnbRr0xQ1By5HdQ8C2fG7nuqNrtoQiZfNYgC7qZphS8uV5XOZzpEo9bRaLpe9/GLvw99rROXChZLI08MfMvz4YRtfnNGrh/GwXU2trtYPHJf4QW2SHw2+m1Ft4+0hAPnSx+ZcbA39EIbhSH80geTiOhnUzARslPsL+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSVbKhhU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072B0C116B1;
	Tue,  2 Jul 2024 19:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719949210;
	bh=oNVXfKnoKplLLDRR7PjDsvUKG4z+xriNkry7Rl9Njy8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZSVbKhhU/4ElbxWVIoxf5ewdO577JZX66DTU/U8SakMUowNtWqonRKqUnPLIPAZGx
	 DyMdUAQRSCa/frWW/nU9L5nN8bgbg1BkkHeNX725nc0Cdkpct6XB2nmbapg0PEYHtG
	 V0i3GBbQ9cNOC6co3s1MMGSxquR0DgrzYvfFhFmWlkD3V/MSI98mOMHHdy1dLRvzbq
	 X5D608Yh4xsvZORRmAictUh1kx3xABYdmg/eDiX34dgmG2IEW4grhkMtQZk7wQU3lk
	 7CRkCMCJ2g0wqWgWYGFpWRyl2NyP+nIYyzq6y2qHpRYBN40unoiT/ds9/i90K3/Zhv
	 T3kZOB2FNzzCw==
Message-ID: <ff711e09ce5fe14a17e5e11340ee28c4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240702031909.341332-1-andersson@kernel.org>
References: <20240702031909.341332-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v6.10
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gabor Juhos <j4g8y7@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, Md Sadre Alam <quic_mdalam@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 02 Jul 2024 12:40:07 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-07-01 20:19:08)
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.10
>=20
> for you to fetch changes up to 72ceafb587a56e26c905472418c7dc2033c294d3:
>=20
>   clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag (2024-05-28 16:32:47=
 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

