Return-Path: <linux-arm-msm+bounces-73306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E4B54A1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBBDD1CC55B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33402EA14A;
	Fri, 12 Sep 2025 10:42:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00582472B5;
	Fri, 12 Sep 2025 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673765; cv=none; b=Vf4SLw3hJg2ewanx2jFCF2eRjti/y1H8PSu8+PVVl938640YAs2SLTH6UvEfpDo071+XzDldyOgd/WhF/BMW3uJiDNnG0xre9XUwhZtTqPD7/8GDMhqM6tG0FUxE7GsmhGkWIoZy80pz5kFeREmilmqFVWmwHg3eabLfskv8ZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673765; c=relaxed/simple;
	bh=5VW5LhoeR1Q8KAH5Bdn7r5QUaHqPGmnXoJvqlv2BjWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ys/OEe6D4OghOOpdKJhe9I0Gbp9ZZVMutFV4Ow52CJvV/WYDBxPVQJ1AM41RMZ7WKVVLg62rRjsGhgpQbniYAkbNKkwS23+zZty16/Gs4EdxffiU1Ni3AzdyPU1FfwPJg0gk28gLIi3jKbc5DM9gVjq403EM7dlvf6TN99rtU+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABC7C4CEF1;
	Fri, 12 Sep 2025 10:42:41 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, 
 quic_akhvin@quicinc.com, quic_skananth@quicinc.com, 
 quic_vbadigan@quicinc.com, stable@vger.kernel.org, 
 Akhil Vinod <akhil.vinod@oss.qualcomm.com>
In-Reply-To: <20250910-final_chained-v3-1-ec77c9d88ace@oss.qualcomm.com>
References: <20250910-final_chained-v3-1-ec77c9d88ace@oss.qualcomm.com>
Subject: Re: [PATCH v3] bus: mhi: ep: Fix chained transfer handling in read
 path
Message-Id: <175767376186.19386.3016025814511034609.b4-ty@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 16:12:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 10 Sep 2025 18:11:09 +0530, Sumit Kumar wrote:
> The mhi_ep_read_channel function incorrectly assumes the End of Transfer
> (EOT) bit is received with the doorbell in chained transactions, causing
> it to advance mhi_chan->rd_offset beyond wr_offset during host-to-device
> transfers when EOT has not yet arrived, leading to access of unmapped host
> memory that causes IOMMU faults and processing of stale TREs.
> 
> Modify the loop condition to ensure mhi_queue is not empty, allowing the
> function to process only valid TREs up to the current write pointer to
> prevent premature reads and ensure safe traversal of chained TREs.
> Remove buf_left from the while loop condition to avoid exiting prematurely
> before reading the ring completely, and remove write_offset since it will
> always be zero because the new cache buffer is allocated every time.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: ep: Fix chained transfer handling in read path
      commit: f5225a34bd8f9f64eec37f6ae1461289aaa3eb86

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


