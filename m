Return-Path: <linux-arm-msm+bounces-3984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D4E80A622
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3307C281351
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3981D225D0;
	Fri,  8 Dec 2023 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7IBMBxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96D20315;
	Fri,  8 Dec 2023 14:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E519C433A9;
	Fri,  8 Dec 2023 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047090;
	bh=wcbyHkeLmmTtwbMyq9TM9DIUmPz+UmC5BA0/+WGjbzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7IBMBxyVW8dkaGjdBic4E08DAH9fy/YbfGEH0ow81enP8ghl1ag7TOdF/X8Uxes0
	 r9wLtHMKc9EfBV0e6utwxI+zFaYyWUUURrS+Qk4eDdbRDtCnXFFMaSaphvGcGFZ1M2
	 usQ98I/t1vapEqhjtXGbwEe+CcLC8RcxZLU3s6zHfvsmiZShxlVNudqG9WA8n+Acvw
	 0vPdV3UKufjO1nviJEh8r3ygt5pgFKiVZBT5e7Q2iRIHsQfqnVmWCx4BNdDtS2Cs+W
	 YlavjxDVkPBpjZyP73zBeYzJd8km0YBa2Sq9xGHkSkiQqZ1umcAG+4IFZJkVetBB1v
	 mlJBLPMNKohAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
Date: Fri,  8 Dec 2023 06:55:37 -0800
Message-ID: <170204733626.342318.18184910305785324276.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122042814.4158076-1-quic_skakitap@quicinc.com>
References: <20231122042814.4158076-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Nov 2023 09:58:14 +0530, Satya Priya Kakitapalli wrote:
> Update the test_ctl_hi_val and test_ctl_hi1_val of gpu_cc_pll1
> as per latest HW recommendation.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
      commit: 6ebd9a4f8b8d2b35cf965a04849c4ba763722f13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

