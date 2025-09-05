Return-Path: <linux-arm-msm+bounces-72300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B0B45A18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B97E5A5F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990A135E4C9;
	Fri,  5 Sep 2025 14:09:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058635AAD0;
	Fri,  5 Sep 2025 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757081390; cv=none; b=TtgnwOnoyHBqghD+iKKjaTXgJlVA+t2Bcona3/qXMGh41EUCeZCmTOCd0viT2N8RlgI+hrRxDWGjan/JgX7HeyGABvsn10+RM+BaQoVAUjpYMOEFNWsDrVWsgewekxbPHs0jwBBKa7R4skxoVkrfMCtDzq6a9vV5LOy5NlVq1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757081390; c=relaxed/simple;
	bh=xu5Nr+8UfCtfhyGlQ0Wh9FKpeEGOR5FlhBEYIQzhn8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i7sXs3uGkfsG6bS2TK36X6XCfU6/j47VicUWUmsXZqKw7HWB6m3tER0ZyLVhiLaSwKetMYAVkj7cqH7Yj4Pu9omxbuGM4Vdpu3y114hICEqn5bTVx4jcbBk7+fb5UhVBnswsvlv5N088hm3FQzzpH8Yp13VQwh4WGp03Qar0R2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA98C4CEF1;
	Fri,  5 Sep 2025 14:09:48 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250819020013.122162-1-slark_xiao@163.com>
References: <20250819020013.122162-1-slark_xiao@163.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Use subsystem device ID
 PCI_ANY_ID for Foxconn T99W696 variants
Message-Id: <175708138791.17481.9536484022718763721.b4-ty@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 19:39:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 19 Aug 2025 10:00:13 +0800, Slark Xiao wrote:
> Since there are too many variants for Foxconn T99W696 SKU, and
> they share same settings. So we use PCI_ANY_ID as the subsystem
> device ID to match each possible settings.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Use subsystem device ID PCI_ANY_ID for Foxconn T99W696 variants
      commit: 376358bb9770e5313d22d8784511497096cdb75f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


