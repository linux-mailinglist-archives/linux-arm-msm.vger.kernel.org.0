Return-Path: <linux-arm-msm+bounces-61659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE39ADE20D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC20718974C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2404D1FF60A;
	Wed, 18 Jun 2025 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnimLWix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81B1FECC3;
	Wed, 18 Jun 2025 04:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219775; cv=none; b=cdBQ7hgoUC4MLxI8YTDYpGiCfIV8xZhWbC48cRe9cidKQ5GSuuRP14wVErBZoEi56pE7zaUFV6b+EHp1hTmDESZFVnqbAXFLq6RBWXvo0nJQ+CR9v+7qEOMXVxVDKwO64g92d+x85D5c3y92Xo99LmikzisMQ1I42RsyDH7hJJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219775; c=relaxed/simple;
	bh=6z6qsViG25xbr25xa1kFixq0la1MvWdtTS0QTRiwFgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+ZlutFMOudM7dOYVz0mXfIyfBujdnOOpNTSaKiRTKKsK0/FEAGkQ+bU55H+fdBiUopDcTVrsvHW54dNB2o2dJsZMySsMwktnHRCkke9zO7pm3r3JWjvlTA9XFlzQd78FByhGa2Qwj+W0IY+fIP9P24OCChJQnsOT6l18z+Pwj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnimLWix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94827C4CEF2;
	Wed, 18 Jun 2025 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219774;
	bh=6z6qsViG25xbr25xa1kFixq0la1MvWdtTS0QTRiwFgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnimLWixUdYSz6uXfUR2DuM9UfY1U9FMk06r0eXaE6hlk6KmlH1+25j5wxK9NYG7a
	 ElLwEMa9nlEb38qImJhZeFZT+T4ky6hVVoi5HKl5a8cUOkRn34Gfd38HBNF3XlCn+s
	 P7ixeG6Cx4prMdIZD2Rv7ep3XfQFTkFcinAtcwV9rb8RFYP2pRO4lCjNVH6/CaDOjX
	 r7zss8ZuANlgz0s6HWTL32lS+ULXij2trkySXwAWQqSL1yiTY0ShR1Yv15lq7KJFWz
	 oWWmJt1VcB+AjUslPfKEch39ynb40sICeYG79oyq4v3VQh4Y2ju27YyC2SnddNz9nK
	 y19/+rrKHctyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	maud_spierings@hotmail.com
Subject: Re: (subset) [PATCH v5 0/1] X1E Asus Zenbook A14 support
Date: Tue, 17 Jun 2025 23:09:18 -0500
Message-ID: <175021976646.732077.10509920450300400020.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523131605.6624-1-alex.vinarskis@gmail.com>
References: <20250523131605.6624-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 23 May 2025 15:15:07 +0200, Aleksandrs Vinarskis wrote:
> As requested, 1/4 was merged to linux-next by USB maintainers.
> Resending 4/4 rebased on top of latest linux-next. 2/4, 3/4 already
> landed.
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
      commit: 6516961352a1ef39184a34690ff3cc06953f6fea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

