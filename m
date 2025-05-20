Return-Path: <linux-arm-msm+bounces-58578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245AABCD16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4DBD1BA0783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D4E25D219;
	Tue, 20 May 2025 02:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3wvgwix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561A25D213;
	Tue, 20 May 2025 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707323; cv=none; b=kEBRkleYRCQszwGaCTzLZUxXuAvQooJBvTVS8YKBR02NWm7UUQeiyC4sgtpBtMFfdbZM6YcGvPpFGr3VUw4HlSuJAQ9xdi1lX2A5Vdz2vjoJ15HNCu72E+8ovPJ4yTK/Aghf+0gHR/bwi5koeL5NoZSkWx8u0P2gU5h83b9WXn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707323; c=relaxed/simple;
	bh=VeqTMYzS0fD6tBXCT0uNUcjW1AXJroijsACmY04O3x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNeiyPCqx/0xk1Ie4TbqEKALCWXo44n7LLQDEzyt0Moa/MPo4PdzAheNQkUC5nCYcLOVVd+7EyaaGboQEJzNwELx917k6z9Z9z/9sN20nQT04GYqDyejWGARU0a6PS7gTRZj5iAvFyWhpBPa1dHvvkQB0qmC12+/vElx0I8RyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3wvgwix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C821EC4CEF2;
	Tue, 20 May 2025 02:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707322;
	bh=VeqTMYzS0fD6tBXCT0uNUcjW1AXJroijsACmY04O3x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s3wvgwixgGDvMfWDRz9AqLc2dZlchWeJBPrlNoyR3Dg4Mcy+sjHCP5Q6YAEpsERFF
	 Gy84B45c1vlAar9ZBgdsZ8BnhqkBdsGJDJ0G039P6Q8+C/Ys7nQpXmll5bcvSrMsnc
	 zQBkBnmNEVM4Eyg/ppsF0WjMu0K+Hp5klQ1IYjhVSIMIviMzhaWUHAIGUXHWAoP5xH
	 x+a8ID+nFKXlSSGGOmxwmRFW0u4auw+qTbvkjWhQVDBDmMsY3IabVjn8qXGvPfq2+m
	 KuuMNNxcBnGiZFlOW2VSzhedStEgRuADypN0FwqyQKqaSXEAEnhiZzIqErWYmbOW27
	 u16chZgPYpZ/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6] clk: qcom: Add support for Camera Clock Controller on QCS8300
Date: Mon, 19 May 2025 21:14:50 -0500
Message-ID: <174770727720.36693.4191377559244212305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327-qcs8300-mm-patches-v6-1-b3fbde2820a6@quicinc.com>
References: <20250327-qcs8300-mm-patches-v6-1-b3fbde2820a6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Mar 2025 15:32:27 +0530, Imran Shaik wrote:
> The QCS8300 Camera clock controller is a derivative of SA8775P, but has
> few additional clocks and offset differences. Hence, add support for
> QCS8300 Camera clock controller by extending the SA8775P CamCC.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Add support for Camera Clock Controller on QCS8300
      commit: 1003cea3c7764ae582302c395f82e1cf7e5cd8f6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

