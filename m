Return-Path: <linux-arm-msm+bounces-36003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0687D9B17F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 14:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E411F21E9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CDA1D47B3;
	Sat, 26 Oct 2024 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1Iyi4JU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6007D217F3B;
	Sat, 26 Oct 2024 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729945242; cv=none; b=eFL1c6rV6V057qG5J5bmxrQENxYPPMQvG+wxsdq5asyAdQA1De4qXkqjARMjaM2p1iG6ov7HYlbxH1Oa22ujBdNJRy9tiJ69HeQO36gIjLGgXQy+RfrQo4+zVhnFllcZBDOCaqsb9H0DMRQkK0vWyKiubqCMewskDojg1zclLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729945242; c=relaxed/simple;
	bh=DvlAjYDGtrp9FXcY39ZT7gQ+pnMtVpv/fmprTr15yVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2/ZMPj2mUG5C3dkbDm9b20PoiV2aEpXKqW513Fd6FzWUiZwukY8q75M6a8C9GGDJPSm90VyMcUQn3NzvA37/dihYlz0TPg98a1hiI82+EMXqVnKX+4XVBCxZDYzpOSGjaLuKpy6PlTeDCW++EFGrbEnciODmHqUX2EP+4E/Cvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1Iyi4JU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040BFC4CEC6;
	Sat, 26 Oct 2024 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945241;
	bh=DvlAjYDGtrp9FXcY39ZT7gQ+pnMtVpv/fmprTr15yVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1Iyi4JUpSXhvKWD7zT/lTiLfb5bq6gm/xgi6SARdAOgTH/tD/NJklZIDHrpw4E0a
	 QRYRZCeQZU1raB/5MytM0YZW4y3GClT1bCxkGLX8udtXc1X1xNAITRK6n6IncwodRG
	 6XNAYl0vHZQhWafvtabmkO4VnZlvcqRNg2Qt3JlOdYHSQ2Ti6UuWPDoNXKCxavHo7C
	 EKo4D+qyIcRdb2UI1/oaBBOscXcCCCZUldRfhYXUYhHCpo+yxWIygK4ONGmnsveZo4
	 EfEhgrEXHljd5iApPj/jtPxWhf30dMD6RrJmKD+5tjFb/na+GVBEH4dFkIE6oIf82b
	 0/DZ7th/jzk5Q==
Date: Sat, 26 Oct 2024 14:20:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Message-ID: <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>

On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
> QCS8300 has few additional clocks and minor differences. Hence, reuse
> SA8775P gpucc bindings and add additional clocks required for QCS8300.

IIUC, these clocks are not valid for SA8775p. How do we deal with such
cases for other Qualcomm SoCs?

Best regards,
Krzysztof


