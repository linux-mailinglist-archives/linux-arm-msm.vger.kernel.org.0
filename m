Return-Path: <linux-arm-msm+bounces-60700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24750AD2A32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 01:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CCC33A314D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049131FECC3;
	Mon,  9 Jun 2025 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXpkkqeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE531A5BA2;
	Mon,  9 Jun 2025 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510044; cv=none; b=fF69RNg2GyEUgE75ysjcsy9zdWB3Ae67TYPqn5gNE9KvtN/pvCcE2kc6yA9RBeIyHD2ektOHZBBU+wOL9cYR5xPQpRCuhGCqiX0Wz9vyDVMe/ZmQOeoPdHq2B856I6BsYfaLKQ9sffEZwT+i9bsbdSsr7viFYelXQ665gL6QXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510044; c=relaxed/simple;
	bh=0vE193A/wHZyTzDn9gzuWnoyy3hViOW8q63CEtcRwBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t85rfFl/u9wBPPj9SjLnPUXTnSskiuRpq7xN52BU5kGWnXCi7dyk2fpYIdaK3VRmBQQchUyv1umBhapHYoBfj72hi94aB0ppO/YHUCAnJeyuhSfTSNPAuIAlA4Ja3XYaUxUR6Mo8PodgzcLSi99eih6nteE6D86bAdgHCXEoOhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXpkkqeo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD92C4CEEB;
	Mon,  9 Jun 2025 23:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749510043;
	bh=0vE193A/wHZyTzDn9gzuWnoyy3hViOW8q63CEtcRwBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dXpkkqeo+wLGWozw/r4gfKyLADKqlpdNLBdiLWHn4g4UHBBKeBh95I7AVEGYE+Vyh
	 DHEY98V9BFx99/pcwOjWnYsgxgilzyLu/2hklEwxuGPCzprwb7uNniZebez5KBwdkG
	 BwD96ujmMkgqxmtYw0CAomJ1h+LI2tqz2pvS/0SzfPMhRzCJ6F626uxhuE4nUb4ZMf
	 r2dCBhm5PeqPtqnXlBmEBhtNjj0CF7x2japlk+kFXwbGqTdlLPZOCF/abdzmYzctRk
	 5gN+qpBSYFvtQSshYenfdzzB38ZUC9qRKSMXzVoOPj//2TxCc0d4CBrBXpJbMePlCd
	 jF1eFKT5MPlKw==
Date: Mon, 9 Jun 2025 16:00:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chris Lew <chris.lew@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Hemant Kumar
 <quic_hemantk@quicinc.com>, Maxim Kochetkov <fido_max@inbox.ru>, Loic
 Poulain <loic.poulain@oss.qualcomm.com>, Manivannan Sadhasivam
 <mani@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
Message-ID: <20250609160042.7a8940d7@kernel.org>
In-Reply-To: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Jun 2025 14:05:42 -0700 Chris Lew wrote:
> +	rc = qrtr_mhi_queue_rx(qdev);
> +	if (rc) {
> +		qrtr_endpoint_unregister(&qdev->ep);
> +		mhi_unprepare_from_transfer(mhi_dev);

is ignoring the rc here intentional? may be worth a comment

> +	}
> +
>  	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>  
>  	return 0;

Note that we return 0 here, not rc
-- 
pw-bot: cr

