Return-Path: <linux-arm-msm+bounces-28699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9596B953BF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CA701F26635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0526116D311;
	Thu, 15 Aug 2024 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZS/5E9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61316CD0D;
	Thu, 15 Aug 2024 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754493; cv=none; b=pKjXFQDCEAPMJoKCPBxzU8lXhKWt1GGGDo2Z8GcMxY2GksnUE4Mt2v0QzafKraSBska7yY4W5V4EG7tYlScLhUyqCfSKQHx1bal0tHWuJ1OFmwA9LiVPjcW1vqEq0vshIBn8QrTNDmeO/Rba1vSnURWqwpTZ8VXyMiAjI065WyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754493; c=relaxed/simple;
	bh=Fo84PgKbAolGzhQZHxrz8TjQTPL8PV3DulP4FyRfYCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKyOWdQgiSOi2KTipJ2Ti3PO8P2eRsKUlg53RWKok+fU0UF7UpxHSBz4O/0oXjji9WUiDSrF3wJ/LGtd02ii7G43tm8NXEAPXv/2KCRju7zIUveadg9WSSniqup0NJYP/td0zhXRh968KXWYrk63ooOVgNQjE9UYXzpaV5RRTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZS/5E9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F96C4AF10;
	Thu, 15 Aug 2024 20:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754493;
	bh=Fo84PgKbAolGzhQZHxrz8TjQTPL8PV3DulP4FyRfYCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZS/5E9vuHW0OXaEkMCWVbByVmjPVEQNNICJ2EB0VGbhWFUm/LN/WheLduzhZ3kPA
	 rDlkV5NZpbw8yVuhq21qCKklOwGbgmqRK5fuXDE+gRofoITTnBvaM0cGA0wP03PlMB
	 gKcSRR5Rwz3tpIFlJYNy8T/r28Ar2ioewa7oCfcuGjv33r80EWTWuKfvrYLJlft9fv
	 YrivAtnX28aM3v708Mk5yIL5rNVciru5Li2kJZEtDG9lCulNFPFGU6NQ85+HE4l7W8
	 4A9TE+11pyu5KB8aL8yuD2HKiRfrEyjkbFsw3YpQCW1eyFXnoiAxoKd4Pz5p5etsVn
	 gsifWd3uXVpUg==
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: Murali Nalajala <quic_mnalajal@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com,
	stable@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: [PATCH v2] firmware: qcom_scm: Mark get_wq_ctx() as atomic call
Date: Thu, 15 Aug 2024 15:40:45 -0500
Message-ID: <172375444792.1011236.7773567649654210206.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814223244.40081-1-quic_uchalich@quicinc.com>
References: <20240814223244.40081-1-quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 Aug 2024 15:32:44 -0700, Unnathi Chalicheemala wrote:
> Currently get_wq_ctx() is wrongly configured as a standard call. When two
> SMC calls are in sleep and one SMC wakes up, it calls get_wq_ctx() to
> resume the corresponding sleeping thread. But if get_wq_ctx() is
> interrupted, goes to sleep and another SMC call is waiting to be allocated
> a waitq context, it leads to a deadlock.
> 
> To avoid this get_wq_ctx() must be an atomic call and can't be a standard
> SMC call. Hence mark get_wq_ctx() as a fast call.
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom_scm: Mark get_wq_ctx() as atomic call
      commit: 9960085a3a82c58d3323c1c20b991db6045063b0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

