Return-Path: <linux-arm-msm+bounces-30376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEEB968043
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 09:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F58D1F24355
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 07:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2F15C140;
	Mon,  2 Sep 2024 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl9bI7la"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145952B9BB;
	Mon,  2 Sep 2024 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261341; cv=none; b=W3zIQfiNqTXDuVOAUJm/27nhI6lYQNqWbN57L7RC6dXloBH3N7FWy5yvHyd8xnjpNGFvDJpqY92miyF4wF1zocxPX+CgdZHeRrdheJz51z6k/VKBzl80Nso4a2Dr2cB0TkfMq6T0DAqPiQPficHj9C3J2U/q7NPFJu8gkviub+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261341; c=relaxed/simple;
	bh=iuyP/VtdtkkWVHV70diXCHx9wHxziitIWnxKSuMioec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUFpU5eEdQv4cd45iNlUgx0iPxvSLuYM0PhX5ityO3GNx1hMnW11ueLVSzBVYrer/yqsyCedeOo8HeWiYOIDDJ/efuc5/nHjCk+KdVsV+yuukA+14lvuPV+6f8kNriCfR7RpVC9IcyO6kAhkkca1OQeOD+AC7XtkVATITqldO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl9bI7la; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C370C4CEC8;
	Mon,  2 Sep 2024 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725261340;
	bh=iuyP/VtdtkkWVHV70diXCHx9wHxziitIWnxKSuMioec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fl9bI7laG+huLOya0/pqIrm5r9sMlJk/wFeo99ituF7Ixtn6vktyscjPaIAdeiyKX
	 igEbL+X5457xmhhB6Ue5Pz7I4M26uttNzUk8mHsYfDArf8OZve6N75tzLXIzi/yBk0
	 x96nOe86Jrdt0W5qstNCs4m0fthRtM95EhAQj3GlBLA2pKXvymBknV/XvbUcQv4YZf
	 dqzF0hfI8oHTDnAupKina/o3Vjhn3Ny78gQ37id4ceWmw3tRlt2eCs0gEJEbEQGdPS
	 uCH6wuveYemf5Z1xPreludpo6EbPnmA5fe0C4BiiPYZ/dmgnVEGRIXY4yGnByl4ict
	 K/feHI4uXrg6Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sl1I1-000000002L4-3CSm;
	Mon, 02 Sep 2024 09:15:53 +0200
Date: Mon, 2 Sep 2024 09:15:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
	linux-clk@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
Message-ID: <ZtVmKWTBtJiA53U0@hovoldconsulting.com>
References: <20240828171722.1251587-1-swboyd@chromium.org>
 <20240828171722.1251587-2-swboyd@chromium.org>
 <c1e35d3d-fa00-4453-aaa3-9f23a07acb4f@linaro.org>
 <CAE-0n51Ag1wpj0uUPVtMvgZJE2FF_FZkw+j=bRiAq3vYk=Y_Fw@mail.gmail.com>
 <CAE-0n53rNuyXcVcqTBSgbNzuJzCBkaHE21dPNkMTrs=BCTkmPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53rNuyXcVcqTBSgbNzuJzCBkaHE21dPNkMTrs=BCTkmPg@mail.gmail.com>

On Fri, Aug 30, 2024 at 03:29:22PM -0700, Stephen Boyd wrote:
> Quoting Stephen Boyd (2024-08-29 09:34:05)

> > It sounds like it's better to make the default always park at
> > registration time and special case the one or two places where that
> > isn't possible, i.e. USB because it has special rate requirements. So I
> > should just go back to v1 then and pile on the QUP patches.
> 
> I've done this now and I'll push out clk-fixes with the QUP patches.

I assumed you'd fix up all the other SoCs affected by this, but I only
saw fixes for sm8550, sm8650 and x1e80100 in your fixes branch.

Just sent a corresponding fix for sc8280xp, which I've confirmed also
needs this for QUP:

	https://lore.kernel.org/lkml/20240902070830.8535-1-johan+linaro@kernel.org/

But what about the sm8550 USB issue? Don't the other platforms also need
a corresponding fix (e.g. for when booting from USB)?

Johan

