Return-Path: <linux-arm-msm+bounces-29657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F17961590
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 19:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91CDA283BAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 17:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCB91D278B;
	Tue, 27 Aug 2024 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG1+/ls2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530D1D1739;
	Tue, 27 Aug 2024 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724780117; cv=none; b=Obhbn6Bct5ZHDADifhK6omSIH8UAGQZ7Bbk11h/5MHlOkU/z1kbWLJOV/NolD9hoe+QocUSG+Dc+abQzschV5LNI5sotjCexnEcEZ/bmvGjTcXuxbU2Id3fAiA3N832xKy8Eq0vrH23odBqKNe9rh/w98WUDIPIO6cXSeZSzrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724780117; c=relaxed/simple;
	bh=jQSxbLqrWUDFwGtBCc4nP2KIErVDnrXes1Ue+mjqQj4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=h6cpJcIvI08obmdH9OM7mrcO41JEUjylA3vOKApYVDJGP+GNCTKzt4pzKXLAhIDETvpmWM9eNiUFD2q048/bGYje1uXun71cpDzpWJbka5LowOqUCnYwQ5MnErjkkcaWOTpqesv+NNKaCQfF/H/widiHEkC1kfoo67JAmxPTERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG1+/ls2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C51C4DDE6;
	Tue, 27 Aug 2024 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724780117;
	bh=jQSxbLqrWUDFwGtBCc4nP2KIErVDnrXes1Ue+mjqQj4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VG1+/ls2aaWwDo8j2v4rpArAbzWN5hssIg0jtEH3CZzQsUQZz0dtdDv45Cm65RbWO
	 EW8J605FEAfVuU7nrLdgwgx0rE10GqNUhB0G1gPGB1Sprekg8NDyR+7DuTybF0hE3d
	 N2SL+iJBs1lHvhhPFs4ZKsYiXuVel4Lmr/OkcR3x1fKzxFrsi2JbiZUxs3M7hh0C00
	 F0NaiouqJlTae3DAtIRQ4LcFtMcsUcVfS8V7XRRXJ34DBQfDPf3QRLsjd/qn5yvcfb
	 ICcSOaNKHq6mJzQy/CeQN+PQMnxw8ueXvdK4pBqkA7cHfbS/jYVQJqIK4B3VMdoCL9
	 27eXIIXomCSFA==
Message-ID: <9ff2a53f64418595757f363aaa257e78.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240826150856.1647492-1-andersson@kernel.org>
References: <20240826150856.1647492-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, devi priya <quic_devipriy@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 27 Aug 2024 10:35:15 -0700
User-Agent: alot/0.10

Quoting Bjorn Andersson (2024-08-26 08:08:55)
>=20
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>=20
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.11
>=20
> for you to fetch changes up to 6357efe3abead68048729adf11a9363881657939:
>=20
>   clk: qcom: ipq9574: Update the alpha PLL type for GPLLs (2024-08-14 21:=
56:45 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

