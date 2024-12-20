Return-Path: <linux-arm-msm+bounces-42934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B15AC9F8DC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E44B168013
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61281A3BAD;
	Fri, 20 Dec 2024 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt2fK1Fn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C71A0BD7;
	Fri, 20 Dec 2024 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682521; cv=none; b=P3A+rr8inLvU0s0NVtMW6/yeVsXz2XPCZzHBOWOAI1aN8bhVnpxtPlIhniYux+CkdW3LtTb0CvLDu5B5DQ1D7tm9IBqp9ebQId/eloUmqZJhvJ4o/Ryc50cki3CTIIl/1FaxiqqjhLR/Hj2U39we+tTyfiT8Nd+LT4Za9vtpSXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682521; c=relaxed/simple;
	bh=aeJUkoLT0R/CKgcZSzkosa2SpvGc8sse+HOk7Y8neZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXKOdrUu4ATBuXPoGGp9Voh2DNcfs1rdXRun9rFDd+iKfcla1maTxTNfI/Dy1xieylcy+ezOmKAklPCt/Q3iQG/8+gr8sbibo8JuHKi9pI4EVggCCxgW8lBc2j9enibgiw8ohxIvA/bz1kb/jD61SZSz7bmG//QfUEXq7FfQLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt2fK1Fn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CDFC4CECD;
	Fri, 20 Dec 2024 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734682520;
	bh=aeJUkoLT0R/CKgcZSzkosa2SpvGc8sse+HOk7Y8neZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt2fK1FnNNAr8kTZrcdIYPhBCHfHsXBhzN5tkd670TT8xNUhPpSgYnXW0FbkWYudT
	 DB3RPcthDPPcg1lI+pVqLy5jPW1xlMnwmSAGnqkrMdA7VUH7ZsudKGGgukVVVgGuws
	 gRE92zY9CzwNbGv9K3+vPFSwra/Tnjc/jasFLZNobZBugQcMAAu4xf8IXOokUtcBV+
	 YitDO51WcsFdNQfMpNreeC5j8g0PZZb+x2jTB96z1Sc/UK+Wm60w7lrPm0CMgJ3Jdu
	 7HwrmjdgKjej22ypNS0Y72fGZsfqBE/0vXbt99cN1QmOzKBG7kkE1Lty7rNaj9JfkI
	 RMH1EmrhVHxXw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tOYAP-000000000ZW-0kDr;
	Fri, 20 Dec 2024 09:15:25 +0100
Date: Fri, 20 Dec 2024 09:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Message-ID: <Z2Unnbj_umau4XSR@hovoldconsulting.com>
References: <20241219-topic-llcc_x1e_wrcache-v3-1-b9848d9c3d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-topic-llcc_x1e_wrcache-v3-1-b9848d9c3d63@oss.qualcomm.com>

On Thu, Dec 19, 2024 at 07:53:29PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Last Level Cache is split into many slices, each one of which can
> be toggled on or off.
> 
> Only certain slices are recommended to be turned on unconditionally,
> in order to reach optimal performance/latency/power levels.
> 
> Enable WRCACHE on X1 at boot, in accordance with internal
> recommendations.

Thanks for the update. Can you say something about what WRCACHE is used
for as well?

> No significant performance difference is expected.

This matches my findings (and it seems the slice has not been left
enabled by the boot firmware).

> Fixes: b3cf69a43502 ("soc: qcom: llcc: Add configuration data for X1E80100")
> Cc: stable@vger.kernel.org
> Reviewed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

