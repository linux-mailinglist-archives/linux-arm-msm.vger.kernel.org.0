Return-Path: <linux-arm-msm+bounces-20880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D48D2A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F275286729
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78A115B10D;
	Wed, 29 May 2024 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spPMwPRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761915AAD7;
	Wed, 29 May 2024 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948352; cv=none; b=Z5/i/BqDQd6BOHygaZesjmnNBWg74cU6PEeSCOIk8qTPZlGAkfV+lQdOITikPxWeOAzLDV0sxzqCEJU4pMSPAg7CI/IOyvjn0Vs157jsgLq9/XqZSQt0i47kpt36S+1DdT8zGyJb1JiA7zzaFVzrUlZNxpAzTFIoxPnVbSvLj1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948352; c=relaxed/simple;
	bh=tshLIKDQX0zUEL0G4rPCVqyXNQad4aHwxWiAd2HUP/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSLbvgd5s/Esa5NXJ+y33+0ZHUuKmS1qSMdCJ9bP1TrkgO35mNTWcYsjCxkUlplwpD/T+7v+f+oMA9w3XiqGR5PvZxcnaqRgxsapVaRPF6Sjn+clIEW43WxCCq1FwB6CMIfestBVKJfeqXWc7VNs0xSNeBSO9trcj4hHQWClFDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spPMwPRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86D7C32782;
	Wed, 29 May 2024 02:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948352;
	bh=tshLIKDQX0zUEL0G4rPCVqyXNQad4aHwxWiAd2HUP/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spPMwPRggwpE80SBC05KT7CcQelIEaFg5HbhWG2WRO9btBrx95aHWZ3kiGrKXxwSz
	 kC7qRLQbFwrJMTd0Z0ehYgHCwtZuK0mlP7tptB2GrOPonbwQuuu1snNUb8htzfRxZp
	 URTKwCGLH0AoDnxjjPLv9CexJKCU4GqbigUgoAbOpZZEVeG3IzSHht9qPZMPndVUec
	 AtwbeGSh4DWOpIMzei8fJy3+fYQlkngbP7Mwd78OTu/IgYdUpD1ZQ42G1PNQTNt6A1
	 d1Qlg+OP8KFRgi+z09gwbBb7ZT1h9RwN2RzC/tFvOoAQzbCGFvm4gFVjPzNUzuh6oH
	 /y2lXFcJTkIjA==
Date: Tue, 28 May 2024 19:10:34 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Richard Maina <quic_rmaina@quicinc.com>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
Message-ID: <i6fisxbgemwx7prani3zegkcnrll2w5gexcqllk4jqbmiazdz6@tcna7sfs5j63>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
 <20240524-hwspinlock-bust-v2-4-fb88fd17ca0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-hwspinlock-bust-v2-4-fb88fd17ca0b@quicinc.com>

On Fri, May 24, 2024 at 06:26:43PM -0700, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When remoteproc goes down unexpectedly this results in a state where any
> acquired hwspinlocks will remain locked possibly resulting in deadlock.
> In order to ensure all locks are freed we include a call to
> qcom_smem_bust_hwspin_lock_by_host() during remoteproc shutdown.
> 
> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned smem
> host_id. Remoteproc can pass this id to smem to try and bust the lock on
> remoteproc stop.
> 
> This edge case only occurs with q6v5_pas watchdog crashes. The error
> fatal case has handling to clear the hwspinlock before the error fatal
> interrupt is triggered.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

