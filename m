Return-Path: <linux-arm-msm+bounces-43410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 195C99FCCF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839BF162FE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA311DF273;
	Thu, 26 Dec 2024 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6/C2C4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0171D4332;
	Thu, 26 Dec 2024 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237668; cv=none; b=mE1t3BmTdAJzI1E1prGGHz+ZX6nEB8GMqRCMCYVy3lSpmLYbshNm+Yex3KvpNiMk7HALhkM8c9eEIQXqjDSbu3kLDor93ty28d+W1B84RZPR9VCp9sqBu4xc5c7xSOMAA0a/WuPGf0+uKb8kKV+bVw+DKhv9I2PSoqw0UEyw+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237668; c=relaxed/simple;
	bh=EKX8CQK+FN1ekhUaKnzFVscZs31aUn6srbryd+66yOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Of/0bHLgeuxKTUc7MM0VEfBI3a3LCHUROp7/v/NKp7djVxTKUSh202UH8gtWeupQ/H80PUdofk6fCxQjm+9hheEcSg2WcKuCVc/ufxg4bMebtKj6HrHz9OJalm958MOb0ygNUWecBaEBVHKWjhMjBQ/4Imnsz1YC/CnNmAEW07k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6/C2C4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D77C4CEDC;
	Thu, 26 Dec 2024 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237668;
	bh=EKX8CQK+FN1ekhUaKnzFVscZs31aUn6srbryd+66yOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6/C2C4mpGwZLOf8oDQ92vz00s5LqV58/6XVHmx5mxvjKJTgg6bCQYKPfwLfrOoQp
	 xqnKGNoy7acdTqM+XtACtStYWtzfZscXCXWaB0NXdZTP5cxT7Wi8EBIrgNv0E0yceU
	 M0SdFe3e7+ljFaD0z38AdPAUUKjAdaPLwUUGsQbqxQG9hvGnpPVeOq5lr2A2+NNWJ3
	 gnbbqMXMqGW6OTYD9kisgvotFwuxSLQc5GXi3rLNPWrWcHCXE8Ayc3JFtooH0xDW2I
	 Xp+luAJc8RiduZw+yn0cIWCmaukpnzv16cyGhORU2QJlOTChXvtkff4+g3Il5asPbV
	 k30OWA5mWQ0cQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
Date: Thu, 26 Dec 2024 12:27:03 -0600
Message-ID: <173523761376.1412574.892326612734171327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220095048.248425-1-quic_skakitap@quicinc.com>
References: <20241220095048.248425-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Dec 2024 15:20:48 +0530, Satya Priya Kakitapalli wrote:
> Fix cmd_rcgr offset for blsp1_uart6_apps_clk_src on mdm9607 platform.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
      commit: 939c28ad2b8879920afea06fba5722ec8695ee7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

