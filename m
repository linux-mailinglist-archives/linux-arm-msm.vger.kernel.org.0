Return-Path: <linux-arm-msm+bounces-34916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175E9A3A14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E07FB2293C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062C21F473C;
	Fri, 18 Oct 2024 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIkUhydj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC878187858;
	Fri, 18 Oct 2024 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729244057; cv=none; b=QtQGqHXZUMZsgRiawqULKukVODRHZjqBs9BncmtaP4u1Mf6Oa/mdLUmybsEtRh2G24t1MjRBZust1xhssYdBEYLt6v32Lg3RnFVFKGeeiE+ntsIpEzJgVJysXwKyHxu+m3neiW46Gwx2RxdBAKb+1C816i4D4g2ETeaF45KPpOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729244057; c=relaxed/simple;
	bh=MItAABDoJIFBUaHXhvh1ZJeU9xyDwpo/xyOyjPrVUyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGB/4LiXKgn83Qu9X/MTHF5eHPFW3IVhcoUM2VXMgj9SLV7w5vleWPrf5HIteblIZDRn7zyZnZGIiY0/BjTuOUm30TU7T5/jnuxOCq1TN08glwrTEljSG7eChsmyeQXKm3+E4Wu/djmjx/48ffhaZr69Shj8ZG0Y2FJpRFOWX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIkUhydj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3EBC4CEC3;
	Fri, 18 Oct 2024 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729244057;
	bh=MItAABDoJIFBUaHXhvh1ZJeU9xyDwpo/xyOyjPrVUyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIkUhydjzJmCOlF2lhAXuCU/y5iwEpsF8KFj4TTlb4DPwJn+8Fgxc5SUU5kDC0i3f
	 xM/WYmCsx10aH92tqDZqP/QZH+dsqF1lJRbE0UM/o5wfAnUgM5cK42oNcZF/KCY8qT
	 0gXM6ksWY0sObqtiz6tQIfl8ebHpSHfuWRFJmq+RdzBYq9uq2NwdVQhGvl/6v/BC8U
	 LGvT8sOwsn5yoS0wQxSJNp67SkUqXJ8voJSNyfghMRssjtH057L5cC37SEmehCABqw
	 mPYKYZBuHyz9wEJjX+Vbnk8SXrZtcg7aC8LfBK7P/3cA/z2wqVHxLSJzzL2TY2MZpp
	 +WK+8V/Yj0Zvw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t1jNK-000000002Kw-36HI;
	Fri, 18 Oct 2024 11:34:26 +0200
Date: Fri, 18 Oct 2024 11:34:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts
 flags
Message-ID: <ZxIrosY6-bkEc6XT@hovoldconsulting.com>
References: <20241014-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-v1-1-241a68c02be7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-x1e80100-clk-gcc-fix-usb-mp-phy-gdsc-pwrsts-flags-v1-1-241a68c02be7@linaro.org>

On Mon, Oct 14, 2024 at 05:58:23PM +0300, Abel Vesa wrote:
> Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
> configuration on machine suspend. Currently, the QMP combo PHY driver
> doesn't reinitialise the HW on resume. Under such conditions, the USB
> SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
> RET_ON. This has been already done for USB 0 and 1 SS PHY GDSCs,
> Do this USB MP SS1 PHY GDSC config. The USB MP SS1 PHY GDSC already has
> it.

s/Do this/Do this also for the/ (or similar)

The last sentence was supposed to say "SS0".

> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Looks good otherwise:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

