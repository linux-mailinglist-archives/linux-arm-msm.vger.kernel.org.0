Return-Path: <linux-arm-msm+bounces-42037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4079F0EB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B27283683
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7567E1E376E;
	Fri, 13 Dec 2024 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hU+vdX6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD81E0DD9;
	Fri, 13 Dec 2024 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098998; cv=none; b=OzeGafOyxlJCTsfxyUaRe3YjcFSA2OT3yD8MzyIyErHpPgU1qWNye0oq87u9BLq9yA1sxMb2eXTiXizCuvG5PKmUdpKIkcM1YTWA3qCcaPbW/o1W/xU0/K9d43FjNHaH3vuvXhiuIxhOkMb+KIThLuXGtELc6w275SqEoiheJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098998; c=relaxed/simple;
	bh=IRH1stBRUakiJjpQaxFYp0Z7EC9QfLCaQVhvqTN/voQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0OlYfTqdQvI4RUZ06z9s8l5M18UH0yAF6peW9AqCDhWG/xn02dtwMyQqEJq1+YjWTMcFvX5b+FqrCNa3BnFKgTjAXaN4pf2GbdXUs/lq11ybj5PyfNyIILXOCBvfkPmXQw1Qzg8pDxiNQz0QeJFQu5cz8BwANsbrKKtC4ZqeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hU+vdX6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B709BC4CED0;
	Fri, 13 Dec 2024 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734098997;
	bh=IRH1stBRUakiJjpQaxFYp0Z7EC9QfLCaQVhvqTN/voQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hU+vdX6D+sU5+MT+kCnnemUemI0nxmIs0SflS4vVPU1v261pl1xE1fA/l91BO7e5v
	 yHev6cMNljHp34j+zG5U7cvnACCVYjmksL/MUySdGAaoDQFJYS1FXjZMxl7u38bAIZ
	 YX/pjUwDrv8GZ+uXpXR1Z783DQc9Jx/sMupQjQvcmpfZ9NAdmBkjD/Uw9zRfiz70e1
	 P3f1WLvrTvaIR7A0ScjVxTG4HYhnInAyDuRRV8WqnC1Z6k6N+80Qt6+ra4fgJr4bAE
	 HbX5pEssFXfFamZOBfbxa/728+uEaIqQe1O0sQMdA5wAMN//KhFOGOJ1E9wxD8Jd7h
	 15zKBAD313Jlw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tM6Mj-000000006xl-2dVW;
	Fri, 13 Dec 2024 15:10:02 +0100
Date: Fri, 13 Dec 2024 15:10:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Message-ID: <Z1xAOQWFy2J7zbdC@hovoldconsulting.com>
References: <20241212-topic-llcc_x1e_wrcache-v2-1-e44d3058d06c@oss.qualcomm.com>
 <Z1vzddhyrnwq7Sl_@hovoldconsulting.com>
 <40bdbb34-94a5-4500-a660-57a530f066c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40bdbb34-94a5-4500-a660-57a530f066c8@oss.qualcomm.com>

On Fri, Dec 13, 2024 at 01:24:24PM +0100, Konrad Dybcio wrote:
> On 13.12.2024 9:42 AM, Johan Hovold wrote:
> > On Thu, Dec 12, 2024 at 05:32:24PM +0100, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Do so in accordance with the internal recommendations.
> > 
> > Your commit message is still incomplete as it does not really say
> > anything about what this patch does, why this is needed or what the
> > implications are if not merging this patch.
> 
> I'm not sure I can say much more here..

If you don't know what this slice is used for or what impact enabling it
has then saying so in the commit message is also useful information.

But you should be able to provide some background for reviewers, stable
maintainers, other devs, posterity, ...

> > How would one determine that this patch is a valid candidate for
> > backporting, for example.
> 
> "suboptimal hw presets"

I'm sure the patch is correct, but spell something out in the commit
message.

Johan

