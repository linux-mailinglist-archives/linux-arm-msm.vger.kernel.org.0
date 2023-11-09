Return-Path: <linux-arm-msm+bounces-313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B477E6E80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 17:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1BF280E12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F0521A16;
	Thu,  9 Nov 2023 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrXilxCq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F85210EE;
	Thu,  9 Nov 2023 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504FEC433C7;
	Thu,  9 Nov 2023 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699546812;
	bh=6FnXrXpYVcgrn+bbbH/PHAi1F7snZalU5SnpXZiFEDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrXilxCqiLZp7Kdouyj71BlX1GTL6MbKv21Hg9FAyemrqs0Zh7DaTihBoDqQ1jWHI
	 qDel+m9CilRr86XVFUnkpkmZDeGhYfid/4nSi9+XtB6KoU1jLj+gfmaS86g4VILtWC
	 9FWaF223KuM1bDQrgip5h/m+0WirT04Tlot7WpmIULKPiktzZQMHrgxb+yUhTvMonv
	 0AeOgx2A1YnyJUDQAAAGHMs6yCNNCDWJRb26rVWAIW+5lcOuapcNa3MqSqPby6TrwV
	 McjDWCNGtyAaItfIkgOyqDjXRljb57ht6tYBmWK4iMIslGsriZazF8NOpt+iZuGDJP
	 0A1U3Re4FZKvg==
Date: Thu, 9 Nov 2023 21:49:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v3 0/2] bus: mhi: host: Add SDX75 support and its
 dependency
Message-ID: <20231109161958.GI3752@thinkpad>
References: <1699344890-87076-1-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699344890-87076-1-git-send-email-quic_qianyu@quicinc.com>

On Tue, Nov 07, 2023 at 04:14:48PM +0800, Qiang Yu wrote:
> This series add new configuration for Qualcomm SDX75 and new parameter
> ready_timeout_ms for waiting ready state.
> 

Applied to mhi-next!

- Mani

> v1->v2: Start with "bus: mhi: host:" for the cover letter subjects
> v2->v3: Use Qualcomm SDX75 in commit message of the cover letter
> 
> Qiang Yu (2):
>   bus: mhi: host: Add a separate timeout parameter for waiting ready
>   bus: mhi: host: pci_generic: Add SDX75 based modem support
> 
>  drivers/bus/mhi/host/init.c        |  1 +
>  drivers/bus/mhi/host/internal.h    |  2 +-
>  drivers/bus/mhi/host/main.c        |  5 +++--
>  drivers/bus/mhi/host/pci_generic.c | 22 ++++++++++++++++++++++
>  drivers/bus/mhi/host/pm.c          | 24 +++++++++++++++++-------
>  include/linux/mhi.h                |  4 ++++
>  6 files changed, 48 insertions(+), 10 deletions(-)
> 
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

