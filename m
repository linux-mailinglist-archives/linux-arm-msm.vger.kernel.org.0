Return-Path: <linux-arm-msm+bounces-54551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA640A90B01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 20:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15385A2F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 18:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F96A221576;
	Wed, 16 Apr 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVH68p0V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33421ABB0;
	Wed, 16 Apr 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827056; cv=none; b=h7Eh4hWaR1ZWstvK1igU05QkJzCT48sXwTRJ+l4ZjvuCTL8IOfgSThoNRJhrQjy7oaxW83L8dC/KnJ3EreYq9I1J+e/W4UmzHkzcCr5gjgRV2HDM79FZsPDycaYPmtL5Qep7j6qQK+/2DYzqm5gSQGAacMZvZ7ujnCr4lVy/s1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827056; c=relaxed/simple;
	bh=vZh3g5tnBCLLM/Z0GHCroziA4tVUB6U+QZ2RQctdI3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqN1P+5HISohp11x+CZ9dXQ6p4GfPU0MacBxbLpxbW2CFBJ7cqIwcol/C+l07tPBtPLKD3TJpAZEwFMc5bpMvn5xgoIs6LhTlqKFfySHMlyfWKDWerqRNEMqu2QKyT07wQtPF9Rp8PUmSfbVVqVSYqz8cOMpKUI6Rac8vKRNlEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVH68p0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05405C4CEE9;
	Wed, 16 Apr 2025 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827056;
	bh=vZh3g5tnBCLLM/Z0GHCroziA4tVUB6U+QZ2RQctdI3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fVH68p0VtZpPOQqQ9ieT7DUabCPZaXg7OPqOjGnOSe9WAu/QEeYqSZwYsFKgl7dbn
	 J4K6bU/9jnGU4782ukRT35ekvBXdY8D8KFPF1yX/fVuna2qZoOKKFHQ1XB0iUfer8V
	 CnmVZ+kC8i69FVpAGcMg+D7rIeMkxlLbCHXE/t/mTCZz3lGOmIlLhDGC+UmowzXBIQ
	 0IjLn8x4bMWts4BJDuvYm4UOtcyEDWOAbf7PbElA2b0NEDBmIiLNbusl46nrKiwB9u
	 glpJcds0YrLLg5h254zCyVoR4Et1evTmyHDDLiIxTmdt0juvyj6dwggkHmiAuZH/ur
	 vta4fjIW+fqEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v5 0/4] Update LPASS Audio clock driver for QCM6490 board
Date: Wed, 16 Apr 2025 13:10:45 -0500
Message-ID: <174482704422.446874.852481372761594404.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
References: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 15:04:53 +0530, Taniya Das wrote:
> This series updates the low pass audio clock controller driver for reset
> functionality. The patches are split from the below series.
> https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/
> 
> The QCM6490 board requires only the reset functionality from the LPASS
> subsystem. Thus separate out the driver probe to provide the same on the
> QCM6490 boards.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      commit: 9361ee93ac9d1b6730a65fc690e64cffaa41335e
[4/4] arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node
      commit: f716f5dcf5cc40a0e883513b93dfaf35c50e7ead

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

