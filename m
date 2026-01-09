Return-Path: <linux-arm-msm+bounces-88212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908DD07D66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFA430062DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFBB324B1C;
	Fri,  9 Jan 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKI+tUx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0757E309F0B;
	Fri,  9 Jan 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947358; cv=none; b=FpoEZDDhavWSZ/2lxZZgGh9imRW6BYAsLCs6W0rX5eIIaIdllT4b3kriskkvLS3fd+KZ1Vdz/bZbA5B32MREMmt+LE5+pzgpSFbhmah/7rDiY+DfoNnwH3vCZqtGJRu2B5QSYFpHvkq2KzkXrqjZ4y9L7k2pichM8Zc+38VggGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947358; c=relaxed/simple;
	bh=DR+6npnCyebeUSMfXW51qn4aIacFlfDSregQ/90gJPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFcK4bGqi9B4cvht8sJFXyBOY+c+LAtMlLdNsU3/MukFhWbXqPFStGiAwMwoVNchszm3WzfclcIU82KRZnsXoOQE6aeL80enyRWLWF5mCbznNTTH0NFQJKAPV6TMvJLaAQIwLFCHvbVNpaM4qwmp8Z8Y9SWQgCniap5GP8EZ6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKI+tUx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED464C4CEF1;
	Fri,  9 Jan 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947357;
	bh=DR+6npnCyebeUSMfXW51qn4aIacFlfDSregQ/90gJPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKI+tUx8m0cVPNA1oaU9tRMyNG0a0ud6MPpevi38CoynJJ4xJSSC7Hkx8tD42ZcO1
	 tXZ6KcT0HDZLTG1tBcWG60qhIz7T1Lh6BVDJgqTMvySppinQU1Eheq6MqBdBdBqU0L
	 ONeqqZ/fiwmWcbuREM2v3Jw+e0abRfs0lS8JfHw+eeVZc3rlWniubliRzOBVFc50aE
	 wp+d2zLOmT7QP8ktMLYLLTl3UkeSt1E9PPQFLU2scA+HDb7EbfLZSgyyNKU8br1cjo
	 s5IUFXy1WXahM+5eLdTNc5Yc08DkEvmHWTI9azKzP66s37ZTe66DXpoo5BNxMEi0G5
	 Kvt7u9JvrxX+Q==
Date: Fri, 9 Jan 2026 09:29:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
Message-ID: <20260109-viper-of-radical-correction-836d83@quoll>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>

On Thu, Jan 08, 2026 at 10:33:35PM -0600, Alexandru Gagniuc wrote:
> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> driver. This firmware is usually used to run ath11k firmware and enable
> wifi with chips such as QCN5024.
> 
> When submitting v1, I learned that the firmware can also be loaded by
> the trustzone firmware. Since TZ is not shipped with the kernel, it
> makes sense to have the option of a native init sequence, as not all
> devices come with the latest TZ firmware.
> 
> Qualcomm tries to assure us that the TZ firmware will always do the
> right thing (TM), but I am not fully convinced, and believe there is
> justification for a native remoteproc loader. Besides, this series
> has improvements to the existing code.
> 
> Changes since v1:
>  - Improve bindings following review feedback

This is not specific enough.

With such vague changelog you could at least make it easy for us to
compare with older version, but not:

$ b4 diff '20260109043352.3072933-1-mr.nuke.me@gmail.com'
Grabbing thread from lore.kernel.org/all/20260109043352.3072933-1-mr.nuke.me@gmail.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 10 messages in the thread
Could not find lower series to compare against.


Best regards,
Krzysztof


