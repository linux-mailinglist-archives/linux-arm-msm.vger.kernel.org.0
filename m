Return-Path: <linux-arm-msm+bounces-72570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21445B48DE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6783A39E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE7D235BEE;
	Mon,  8 Sep 2025 12:45:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D22869E;
	Mon,  8 Sep 2025 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335505; cv=none; b=CqvXrzPeag7swMMg8DJLlhc9ilG2DNhsK5e7IFMKgd6fHCeH8iuOHoi8Fa1HJS9fALlPnR/QMYN0E4V3SUfAIAMEr9S2hK9CZtIERAJ+Co3Ws1yk5DfAXCj9trDP6YkqvOlLyZp86IulXldx1Ex/w28VscxXlLas76IJ9z+zMnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335505; c=relaxed/simple;
	bh=Lu5QZEP2zwlQOY4BDRZfXM3o9rUDtXsod8OqlRPE9TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1IUICNe2305wuPjH0+TxKcHh97Cgj5qy4DhsQQJ06LF7b39H1dBzkM3BVtvJ4NFw22mDeHlUR/L17FFKZ6lG4Rl0v8X52Jzinm+WTg4FgklpDIc2ZbE7eK+f6ujKdKhuhaIUqLjaWyG15GefxqSYhg51mgt4e0bNmhFAWXBLnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE21C4CEF1;
	Mon,  8 Sep 2025 12:45:00 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	quic_yabdulra@quicinc.com,
	chentao@kylinos.cn,
	quic_mattleun@quicinc.com,
	krishna.chundru@oss.qualcomm.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Xue <zxue@semtech.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	stable@vger.kernel.org,
	imocanu@semtech.com
Subject: Re: [PATCH v4] bus: mhi: host: Fix potential kernel panic by calling dev_err
Date: Mon,  8 Sep 2025 18:14:54 +0530
Message-ID: <175733544907.12153.12958855790578828716.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905174118.38512-1-zxue@semtech.com>
References: <20250905174118.38512-1-zxue@semtech.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Sep 2025 10:41:18 -0700, Adam Xue wrote:
> In mhi_init_irq_setup, the device pointer used for dev_err
> was not initialized. Use the pointer from mhi_cntrl instead.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: Fix potential kernel panic by calling dev_err
      commit: d0856a6dff57f95cc5d2d74e50880f01697d0cc4

I've saved time by adding the tags myself.

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

