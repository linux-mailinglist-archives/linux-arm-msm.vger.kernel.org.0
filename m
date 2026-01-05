Return-Path: <linux-arm-msm+bounces-87553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33676CF5573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE62A300D906
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3083446A7;
	Mon,  5 Jan 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gboUVI7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77883446A6;
	Mon,  5 Jan 2026 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640609; cv=none; b=dxz5uzEEc8s6+w+9zL6xuvGkxI0GsbrSEQmszYDF/rg6R7ufywb/UzNvg2fYxg66/kdR3Ruz8BBliyovljK+rjt1G913e/FglDCzwFDruwG/Me0DU7W0zyNeIpRlMFuMxT04hk2YEI9UxIriXJOnBy7D5KGML6xLho++af4VITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640609; c=relaxed/simple;
	bh=9AlG/QSPYR82Gb4qhJK2owW6SRXjSgbF8H20yKd6eLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThAhmNvEbVgFboxyhBrWRpILDH0FdaIYaWuU/2obd2tYs/NnzLsrB176G9rE4xko0CZLUMVYG+kEkXqKmEDWlvxJNSYvkZvaTspYmxDRSZOBj4Ex+lTt8PUQ4T5KmkXqGJ1PiqoDZVRAOxownQqcQE9Ba0b8DzooRqqCvWIfUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gboUVI7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E01DC116D0;
	Mon,  5 Jan 2026 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640608;
	bh=9AlG/QSPYR82Gb4qhJK2owW6SRXjSgbF8H20yKd6eLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gboUVI7oLp3boIUZZYjGWUa7fvWVnzwyW7JmGp3nuNvWtBGFDJGbv4nFT3yhsFxKn
	 R76eSpPb7w8TGBsBiEd0K8Eh4tt9V4P9kf80hchAapaKnd2eiSIB82DTJKPK5kjHsB
	 +GzjqjyZ6JSbd3Cf8zpj95xz0NFhn5otV7j6p1zXYMDctL4yNF/oMYSrHAf+bGUz88
	 2YacVt8/oOF6F+e84doPdfQs7Dq1xhu5xc1qJ3i7F3lp8M3k6UJHaWtWlBeM4R7/wz
	 B5B2IomEzY/57M5RNAa9XGt5EjtMNtaiU1ihUyXRt5V0S/jWYzCjqkprSBN+ESAzqf
	 Q029CMUImasCg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: rcg2: compute 2d using duty fraction directly
Date: Mon,  5 Jan 2026 13:16:27 -0600
Message-ID: <176764058399.2961867.4037408758770245058.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-duty_cycle_precision-v2-1-d1d466a6330a@oss.qualcomm.com>
References: <20260105-duty_cycle_precision-v2-1-d1d466a6330a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Jan 2026 16:09:50 +0530, Taniya Das wrote:
> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
> derives an intermediate percentage `duty_per = (num * 100) / den` and
> then computes:
> 
>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
> 
> This introduces integer truncation at the percentage step (division by
> `den`) and a redundant scaling by 100, which can reduce precision for
> large `den` and skew the final rounding.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: rcg2: compute 2d using duty fraction directly
      commit: d6205a1878dd4cc9664c4b4829b68a29c0426efc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

