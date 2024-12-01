Return-Path: <linux-arm-msm+bounces-39769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 635709DF696
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 18:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28AAC280FD5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 17:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369851D31A5;
	Sun,  1 Dec 2024 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aepSuJBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EA42B9BC;
	Sun,  1 Dec 2024 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733073491; cv=none; b=m06uOmAnqnRbXs6e55cJCP1W19owS3UxVjFjzJ3K3ukE/tPTsCQVmyTd9lwAbrZF/XJzowVGg2rwESc49Fa+cHRRVyDcJauMr8UEXLFGatLr+RL/oWgHSMrDGMAVXYvBRsbP0CicKpKAc+uT7fbCWZbaQ18bvqitD1H8Nty/6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733073491; c=relaxed/simple;
	bh=ixAb3G+gyaDihaREd6dxUYUL1vTc6ZznxSeuj77UxO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4sRUU3yl6JgxdPyE3EfvE8RBgGa9duXow3nafTR+Rb+axY7yjy8xKWYVWunQPfO9FuMAFJO2MM3MHvDmfULw8hJo0NQcyNY+jxg2uxM+cob7oGDSkWGrOiNtw1KxTgx/Hg/GtvdJ8noPO8R2FZKFYR4eytaSl+GePQv6+2Vyps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aepSuJBX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C228C4CED2;
	Sun,  1 Dec 2024 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733073490;
	bh=ixAb3G+gyaDihaREd6dxUYUL1vTc6ZznxSeuj77UxO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aepSuJBXnaOuxIUPeidI/zH1BKBte0CriE5xYsH7PTNlNxVRMnigSCaXDiZxBSQSH
	 MCdx3pf1SLbR5s0KqgB7EWe0GPy1aL7jvT36Zw8gms39ERd3YoDCExjsHCGrGJYcBS
	 9YiO6S8cYVofo55T20x8yJOSAYwtrciVppyYeHqNY43LIrdgWuytTdtrRLqOrFfxKu
	 8ZH26+QhxsUTOiSzepFj/Y+cFM7mv9cfLk1zp3V9L+mcYNYF/0ivn5smZq7zHdrcs+
	 vunvQF7H9pD7kvsEPEkmnYlIb6vHpb6tJP646ygg0xpQYvQl0hJnUPR0FMxDDsQUWZ
	 q24BIx8IX8/Xw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tHnaA-000000008OJ-3dmX;
	Sun, 01 Dec 2024 18:18:06 +0100
Date: Sun, 1 Dec 2024 18:18:06 +0100
From: Johan Hovold <johan@kernel.org>
To: regressions@lists.linux.dev
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mayank Rana <quic_mrana@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: fix MHI BAR mapping
Message-ID: <Z0yaTpOOml1VisXb@hovoldconsulting.com>
References: <20241201171120.31616-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241201171120.31616-1-johan+linaro@kernel.org>

[ Forgot to CC the regressions list ]

On Sun, Dec 01, 2024 at 06:11:20PM +0100, Johan Hovold wrote:
> A recent change converting the MHI pci_generic driver to use
> pcim_iomap_region() failed to update the BAR parameter which is an index
> rather than a mask.
> 
> This specifically broke the modem on machines like the Lenovo ThinkPad
> X13s and x1e80100 CRD:
> 
> 	mhi-pci-generic 0004:01:00.0: failed to map pci region: -22
> 	mhi-pci-generic 0004:01:00.0: probe with driver mhi-pci-generic failed with error -22
> 
> Fixes: bd23e836423e ("bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR")
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Mayank Rana <quic_mrana@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> The offending patch was marked as "Compile tested only", but that just
> makes you wonder *why* the patch was never tested...
> 
> 	https://lore.kernel.org/all/20241004023351.6946-1-manivannan.sadhasivam@linaro.org/
 
#regzbot ^introduced: bd23e836423e

Johan

