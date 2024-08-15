Return-Path: <linux-arm-msm+bounces-28689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33653953BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4431286590
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A2715E5DF;
	Thu, 15 Aug 2024 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTDmxcAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870B15E5D0;
	Thu, 15 Aug 2024 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754482; cv=none; b=lUaqyZ30CYceaW1Ez42anCqjr3LBnSRyp9VUYsdXeHEDBLneE/vP+/6kHtPrxqd+vSmnj9W2LFWebJUAX+ZmcsLDDXnpZPlje2q+zQW4DfqmyY18Crg0ybp06KPwkwaHae67beV/0my6h8TXrM0aMFkR5xmd08jbdtYIJuZHHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754482; c=relaxed/simple;
	bh=zaTsFsy9OwY1RgQOeOJJjexd2HOZXjDgwKwrHMblD8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFKhuvHVewXggFNyDgOvv1JjvdIL3D6gQHukJQZKiY0th+ewFLd0lGDS1cM18wi5UdnbROuTTIJF3onJb2ZMH60F6YkaK6f52kLMiN6cDRCpc6jx+Ty9UPLno2/GmDFfVwPK4e+J3UPm/jr4HKhhbhr6+phHz0xwhkqd62+iads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTDmxcAf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8179C4AF0B;
	Thu, 15 Aug 2024 20:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754481;
	bh=zaTsFsy9OwY1RgQOeOJJjexd2HOZXjDgwKwrHMblD8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tTDmxcAfAP5CSuIBV+CEQgk+zFe7yRPEhKBqhH34U9qcGWDT3BNGykGc/L98evv8E
	 23NcR+77OzCo9EthTCU6uT8jYjNErRE/5hsIro9H6CSzYB62jMVnTOjUCCxGxQq7Vx
	 BAtVHDvbmNUZTaWVbQaq9PTyKTnqoB81c1scxyXx2glyOSYs322nqzeaX7bkDXaJTu
	 x/l5j5U9y6NkEMUGq/u85RoO877A/9TfEml/O7P5d3IJVSmy/6zS3BqMon5dYVu3dH
	 aDldOhFihrszBqvnwHAyb7RkeTg1428Vj7T+Z4l0tsVZK9rFU2Ku7Og5yL0JRZZm/W
	 5nsuZ8VbnymLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Dai <daidavid1@codeaurora.org>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-rpmh: Fix overflow in BCM vote
Date: Thu, 15 Aug 2024 15:40:35 -0500
Message-ID: <172375444832.1011236.2843073434242869815.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240809-clk-rpmh-bcm-vote-fix-v2-1-240c584b7ef9@quicinc.com>
References: <20240809-clk-rpmh-bcm-vote-fix-v2-1-240c584b7ef9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 Aug 2024 10:51:29 +0530, Imran Shaik wrote:
> Valid frequencies may result in BCM votes that exceed the max HW value.
> Set vote ceiling to BCM_TCS_CMD_VOTE_MASK to ensure the votes aren't
> truncated, which can result in lower frequencies than desired.
> 
> 

Applied, thanks!

[1/1] clk: qcom: clk-rpmh: Fix overflow in BCM vote
      commit: a4e5af27e6f6a8b0d14bc0d7eb04f4a6c7291586

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

