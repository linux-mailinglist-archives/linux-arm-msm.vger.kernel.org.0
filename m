Return-Path: <linux-arm-msm+bounces-13910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329A879142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 10:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6DD8B222BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 09:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D13E78294;
	Tue, 12 Mar 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuhLckdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E836078292;
	Tue, 12 Mar 2024 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710236584; cv=none; b=Xt3zohoUESbyu/5sEEx9jizK2GeQA8zBtIexV+oR3q5Le0OriT2gLIffzJM5MdVoU50tktcG14pHvYk9/fcEC4Gf3Lk8Gkz4uN3eUeTOpPCQPvnNKALrWB/G6Ki5zj545xIoObb7+KJ0B9dSkwVcfwodt8t0vqM+p6fgefD4Hco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710236584; c=relaxed/simple;
	bh=IT54KeeXwxFe5g/P+mO9wWqmdj8TAwCefx/2xL+66Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPRRWSyLVxUVSiWBBePJ6OH+Xc/Xhi1hOs9S++3S8CYZybd4ereGgqG8nYNVGsa+xWuF34VoJigrSvZ0iQj3el8I4qQYfNwGmIpbsQBrJok0cOJpgMCeoN7OFukfzJJRH4oQhnzki14TRGEZSm2PghnQnb/VEjS1O4hdngFhKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuhLckdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F18AC43390;
	Tue, 12 Mar 2024 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710236583;
	bh=IT54KeeXwxFe5g/P+mO9wWqmdj8TAwCefx/2xL+66Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuhLckdCMSCEAEtMTgy0kuBJUVE+VTprjc8nPZ7SxdWUFOyhSHgSgLBmHwjmdzJ6C
	 uVNh+8gr9SuIeQoVbmH1ji4T/D6DOp/7ToPkSWcPezsgxFM5m8fbLoxUPPp/4j60xw
	 E4SI55LLFg99IWhGePC+iBi6s/w3Y9goo+80KVUhZ2n40dhgvTlX2genDHLYCij+Hy
	 DRksS7OGesSRJTAEKhZxX3n/w5YpepFMvkouFKhVfyBvRssx6imoTb/xwhBoFKQdWT
	 CcWdqN3fZ1I95Jogc+KbjgoS6q77cx+CX/2fJH+XrXk5ahlqDnPlzTN5kj2RDur+eF
	 wepom7RPPUlJA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rjyf6-000000007Rz-3kb1;
	Tue, 12 Mar 2024 10:43:09 +0100
Date: Tue, 12 Mar 2024 10:43:08 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Message-ID: <ZfAjrFz9ST1L64pJ@hovoldconsulting.com>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
 <5219fa82-125c-4b8e-a6fa-e0960181a62f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5219fa82-125c-4b8e-a6fa-e0960181a62f@linaro.org>

On Tue, Mar 12, 2024 at 01:55:27AM +0100, Konrad Dybcio wrote:

> One suggestion I have is to use cleanup.h and scoped guards to
> save on some LoC

LoC is not the best metric for code quality, it really depends on if it
makes the code more readable or not. Often being explicit, so that it's
obvious what is going on, is preferred even if it adds a few more lines
(c.f. all the ways that people manage to use devres wrong).

After just skimming this patch, I don't see that there would be any
benefit from using scoped guards.

Johan

