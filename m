Return-Path: <linux-arm-msm+bounces-80042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA6C294A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 19:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82CB14EDCE2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 18:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB7B2E2F09;
	Sun,  2 Nov 2025 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpT3efb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7449B2E2DDA;
	Sun,  2 Nov 2025 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106793; cv=none; b=druVecMJog6bnsVZVP0BXC1NEV0rqBqeElNyQQ4FLlyFXY4zwajubOQ62osWW856LIDaU5oK1PfFQy1hCQO2VPrH+mHR33uyGXQekAaSQpqbkuzMMOBNo/Xd+k9QwqEvydT2V3w9vwHnhP9n91cz8xeyCMkRptGrZmZUdSBOZyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106793; c=relaxed/simple;
	bh=lWMvqmA7dRJSCZPnb3RdlM44s3Ozd1L7i9a1xotMPJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzBFBRY5PTZv4nQ2VXN9VxdxuqxKgL6DcOifAuFN418xxyP+80HZTbD158+HvUz9N7lQR2CAeILSS3TUp/RoGlX3ThcgB3BpUTntNJ1wok08lorOfWAzleoZaUjB8ODI9hkOxCH4VhgLgtEFoRJcmbFX2vApjV3kn0a4yLzypww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpT3efb+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344F3C116C6;
	Sun,  2 Nov 2025 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106793;
	bh=lWMvqmA7dRJSCZPnb3RdlM44s3Ozd1L7i9a1xotMPJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lpT3efb+TmcFHbmgLxu85M9YKsevuI9vP6AjWGFT8bZBp93DbOUl8J2Ra37NrVXzE
	 OlVG8nvncUjoVKtmH6aHtAuDZnQgNMO+ONjnBTL56qtpxYPMttBOXma4Qi6baSNMiv
	 l74CHWC5cnuPatjREnVWXA3GcJIZhvcKcZPTSpUNwttNrgwMzs58e+AdEZNOoAUn3e
	 BqBZeDFpSBQD6EY7Flmoxl7ikZhfv/WTm4Y74ajcVNg2ZIj4qJ7A2NwUW3qlGYONfJ
	 rvH+ahW+ABgX8gqzC3OhYF1n0Urgst5MQQb1TxH9xq95csGlwMOJl0Q82scA650IeF
	 aZNIuP4gmBMLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: tcsrcc-glymur: Update register offsets for clock refs
Date: Sun,  2 Nov 2025 12:09:50 -0600
Message-ID: <176210698635.937813.9857656198318701507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
References: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Oct 2025 15:32:25 +0530, Taniya Das wrote:
> Update the register offsets for all the clock ref branches to match the
> new address mapping in the TCSR subsystem.
> 
> 

Applied, thanks!

[1/1] clk: qcom: tcsrcc-glymur: Update register offsets for clock refs
      commit: a4aa1ceb89f5c0d27a55671d88699cf5eae7331b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

