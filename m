Return-Path: <linux-arm-msm+bounces-88354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E1D0DADE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDEFD300EDAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65C8224B05;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRRVJzhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5512C21C1;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072297; cv=none; b=ji+W8nF6S7TWYvKeEiXuwPFpHACE5BaAKUWrGZ9BmpNKVRlQA+mfsM5ltbeSKVx46AWwD3GSjsr1c+bYR+qSEjwB9e3zVR/a2bER+l/31wrPcoQkdJsgCK7+xn4PZl7CN3lPz9uc7I7T/DVkmec9g2dcpgOYqSsDJuSe+73JkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072297; c=relaxed/simple;
	bh=vkq1xxAjBhfylP1WJgLCI/vNSgDRoIBQn20BpVXR97I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgpnUnVGUr7+KGmygEs8tHLet0ou52+7R3e6T/OhaucKBzI+jYPM/z56PYYy5ZcUklSDxPdiQAQk19/bAjz7/6NMjczGPnXAYTXXeMIU2cYEEuY1kONbX0UIc9fLTv4hN3k0i8eks7AVBVOTWmCCmRAd4uB///h48ri1MgQMk08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRRVJzhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9324EC19423;
	Sat, 10 Jan 2026 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072297;
	bh=vkq1xxAjBhfylP1WJgLCI/vNSgDRoIBQn20BpVXR97I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRRVJzhmUrj6op6dXSexnzJuPfcCpsLiL5944f96/l5kxf1++ob3iO9vkm9Uk2CRo
	 pDN/gVAeLuI5aNZ3/TqjTfwkoi4gVZzdb3ki+0DC80EbwmwENH6hbATp039+Hq3ouT
	 stYmSZ1PeR9wj/w6SNbgL7MsdEaB20wCJC4in1viWYnZAsn97Ah98K4Q2AGIOS0Wcu
	 bgfpLnqNbdKhxu+UY9ZipCFl1KrRnPHcX96FanIIHp3Py1tqw3Oigl/wSxh4xYtT3Q
	 O0kpnnIK7sSmogd8+gHu3bYoh7uGDYOuLpuwL0RcKMN4SmVQPDOyOz4+McgKnfS9FB
	 kzPJzCAI916og==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications
Date: Sat, 10 Jan 2026 13:11:20 -0600
Message-ID: <176807228426.3708332.1600344876969337832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251027-topic-pg_altmode_usb4-v1-1-2931a3ecc146@oss.qualcomm.com>
References: <20251027-topic-pg_altmode_usb4-v1-1-2931a3ecc146@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Oct 2025 14:02:14 +0100, Konrad Dybcio wrote:
> Some compute SoCs support additional operation modes, extending the
> existing set of USB3/safe/DP-alt-mode.
> 
> The firmware performs all the necessary handshakes for
> us and there is no room for error on that level (i.e. the sequences
> will match what happens on Windows).
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications
      commit: 0539c5a6fdef1b274112638aa5aa722b1df5e711

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

