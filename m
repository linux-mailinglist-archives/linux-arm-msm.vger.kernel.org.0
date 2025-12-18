Return-Path: <linux-arm-msm+bounces-85621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F207ACCA20D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8E2230036D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1593E221F12;
	Thu, 18 Dec 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtVeJcmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97804CB5B;
	Thu, 18 Dec 2025 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766027030; cv=none; b=U2bOrATGPXJhS/KBnMrERn4bUJQr9vslu9Qem1eTB+YBLfZKdKmI4D05m236++C2mxUZDs9qiS1aKEGe67cPqkmY1CsuB+Pn60p54qPuFLnOYhlugx9Ny0ClH/YgkSz83US6GVYL4q139AI9jzS9KimQBx4vhYr4DkigjFqiCSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766027030; c=relaxed/simple;
	bh=Z8wZk5rgr4d0YHZOf5dLcf+n3IwTzI+IaHFFdyXZvbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OSYYXe71Y1kCIqlUg+YR84eFLRxP/BLA2MXnshrVIg+trpCWXI/zDSsyvpMSZBLBLxFYvGc98au9vVdorwltRpUVu3FpxUXGS1N+pDEYaZR5/ZPqa0srZ3egJnG/2qTTBrrE1av8EBpiBq6yeI8hIAjRxH1GvRSp3byiR6elYwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtVeJcmC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F093DC4CEF5;
	Thu, 18 Dec 2025 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766027028;
	bh=Z8wZk5rgr4d0YHZOf5dLcf+n3IwTzI+IaHFFdyXZvbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtVeJcmC/ST0wfuLrZze3D8l0VQIYQfACBjDkpSfsN0ki/SOnDHAbOw2DBFK8uRNN
	 q0I6MG+QYwb9BJeKDSjPgGbUljuihnrxqpHoW2Mne9PUV6eHHZLEtaj6DmYAq0m0Ri
	 CcR2ygjgDL+S1Vhb32nSH1r3cZGvPabVoy+uWUwrbO2kT/12t1/9KPyyZaZXXIyHbD
	 9s62E1faqF3ecQBbiZIkv8zC5JLyCFiA1wmd0qkipkGiCmxqZ23fUi2qOgtdS5ay2U
	 Gkc6UDV/M2V+uoctCu+GDSYZLKZayod6TK1oEZjwNZ8UV02A3Bz34HPeD58RJw77xv
	 8jcAZ2m80cMAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 0/8] clk: qcom: gcc: Update the SDCC RCGs to use shared_floor_ops
Date: Wed, 17 Dec 2025 21:11:48 -0600
Message-ID: <176602747923.229487.16213456632068191124.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Nov 2025 23:27:35 +0530, Jagadeesh Kona wrote:
> This series updates the clock ops to clk_rcg2_shared_floor_ops
> for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75, Milos,
> X1E80100, QDU1000 and GLYMUR chipsets.
> 
> This change is required to ensure RCG is safely parked during
> disable and new parent configuration is programmed in hardware
> only when new parent is enabled, to avoid cases where RCG
> configuration fails to update and overclocking issues.
> 
> [...]

Applied, thanks!

[1/8] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      commit: 4c052c5df93d07e8aa2ce55680f95742f0a08e7a
[2/8] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      commit: 67d7fb1bbdd63eccb9ac6e483e502f88ca9a1e73
[3/8] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      commit: d1fd65ee5555dcfe4b33999b8950d6626cc28d12
[4/8] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      commit: 757ec77514e3e4b345517deef0f5a5152697238e
[5/8] clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
      commit: 113fb9649f0d89bfe71dc4e3d98cfc92fda0d73a
[6/8] clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
      commit: 988e585fa4d48faccc50a571b569c38ec3bf69c9
[7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
      commit: 0504b96f110f559e130523efeefc8d1d11530c8a
[8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops
      commit: e4dca3e567813cb49e8ffd3b33ec4c6f43c25d10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

