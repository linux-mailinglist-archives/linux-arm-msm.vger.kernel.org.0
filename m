Return-Path: <linux-arm-msm+bounces-69365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C1B2810C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 269283BA978
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 13:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B42303CAA;
	Fri, 15 Aug 2025 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="beQv9/Vl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A744301012;
	Fri, 15 Aug 2025 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755266178; cv=none; b=WFXKeaOMZc+BMNhwrWRPK1di+NStvTeioVMHjebpGHLqbUTG1CxoSqxo7DT8W8b8DQochwO9NE3DDKukX9Ucso1otRw68pQgCtzGUAs0U9aK601qrjxlgdvqX/9/ibDKaVkZ9mc6tDLJxDOMu0FdqWa4nDfelksK7ZnePo0tpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755266178; c=relaxed/simple;
	bh=7xgGUBhDpJ7vJUXt1k1FnSW8F5xQodmmjxLCdZderyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV7i64JdJ3tY8RROPz722e6C+RSJy4gd963Tvh9x7Md67/Oi4DTG+sMG5fE+gy8oH+cFrh0jYg/H3a5T2k3Pi3d8JSsPc/qDnpimSUeLWWdflXiJvY/vhe7qozWuf2jJ6hRnGh76aot22Op/eU9qDf9yFrwiDqKSUpJb9201xOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beQv9/Vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC94C4CEF0;
	Fri, 15 Aug 2025 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755266177;
	bh=7xgGUBhDpJ7vJUXt1k1FnSW8F5xQodmmjxLCdZderyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beQv9/Vld8lwC2zn3EuigwakuWTBrOO4jlLrkaXCjDpv30gZ/kQPMLLHsNKsZV+Ss
	 HuOF5KbYIrPI3LtjkFqNIEOhvkRhBLCxbySUVXeOftPwizOq12J5Bc3WSiIoawW1DV
	 hYKLDrw81aFuMNM93uT1Md6xR4XhqMUH7DnW4ql5W+JRonjXOCLnd80MeZXxUlYWHs
	 0jFCGQbbVFn7m1a5mRSH/QZJU4oKlTn5TORQ9lAlsawweL0orlAnDlB6XQKD3Ov/u5
	 D/VTRZj94pTgfBHebUdma7YVSnU4E0V73J8sVQFzxnIbdtpjhNT9Kn2fUWIJoV5xi3
	 kUbKZBJ3qF1rQ==
Date: Fri, 15 Aug 2025 08:56:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Violet <ghatto404@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, robh@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: document r0q board binding
Message-ID: <bnxq2bb7hhcrelm466oskqbqvnywkrur7yv4z7tkcxbngf3hoj@tjnpbvn2a3ns>
References: <20250615204438.1130213-1-ghatto404@gmail.com>
 <175503322852.231048.4441689312374680275.b4-ty@kernel.org>
 <3685D796-B3E5-49AE-BBEA-A9F04C1B6BAC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3685D796-B3E5-49AE-BBEA-A9F04C1B6BAC@gmail.com>

On Wed, Aug 13, 2025 at 11:13:00PM -0300, Violet wrote:
> 
> 
> On August 12, 2025 18:13:44 GMT-03:00, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >On Sun, 15 Jun 2025 20:44:37 +0000, Eric Gonçalves wrote:
> >> Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), based on the Snapdragon 8 Gen 1 SoC.
> >> 
> >> 
> >
> >Applied, thanks!
> >
> >[1/1] dt-bindings: arm: qcom: document r0q board binding
> >      commit: ebfe5797ac3e6e9fb56340b6b228d2747fdec912
> >[1/1] arm64: dts: qcom: add initial device tree for Samsung Galaxy S22
> >      commit: 46952305d2b64e9a2498c53046a832b51c93e5a8
> >
> >Best regards,
> Huh? I got comments on this DTS, why was it applied early?

I missed that there was newer versions of the series, with feedback.
Thanks for letting me know, I'll revert this version.

Looking forward to see the final version.

Thanks,
Bjorn

