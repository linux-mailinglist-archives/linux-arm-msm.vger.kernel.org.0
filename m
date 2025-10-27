Return-Path: <linux-arm-msm+bounces-78939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740EC0E419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C69FC19A2375
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926BE30CDA9;
	Mon, 27 Oct 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qew9c9jJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637B30CDA0;
	Mon, 27 Oct 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573999; cv=none; b=G1zobqkK8e48apuq7EFVmma7nloVQycO6ql0j9Nd1OgVG/QdsOTIvIJUZVjzbobtwJmO9ebf6Z2QpXBVMo0SlPuMPkg6ji3PUk2xpLLyyRAGqJMoLZ8uC9KcEQbo9KIzCMDrnjUjzJOg69N36ErgIAT79LxSCU2Isx4J6Dt+Y+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573999; c=relaxed/simple;
	bh=b/eAFThjMpzWZeJJoAe5hP8+7S7Q7G4nzKJj3iBtVNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lrNEE9eiyTmwasnr5ykSNsccUmWSvwTU/Efn2AryphVcsJDbBRHQrxz7WQUpT+sflElE4Aq147r5r27c/6dZEq54mOEN+70NcyD2CBahZy9SC1fKqzMEagzxURpEH235cBxTkR48CuKx4QHK4/U8eLTTcryTI4EGPyqPvc833WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qew9c9jJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5F7C116C6;
	Mon, 27 Oct 2025 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573999;
	bh=b/eAFThjMpzWZeJJoAe5hP8+7S7Q7G4nzKJj3iBtVNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qew9c9jJ7L+FLFBJMi97WLJPncTHOd2nMeIUkXid8gPeQPX10+yJWWsE37O63zDQl
	 a80q04U2MKNTDIVZZex6ZfVwHJ2ul/AZAV122L/J2mTuFsiLi+vqwrzuDMjX0FNt89
	 uGFaLaNPU0gfTTzjjbVMd9ANMLt14DoECvJXhRNcvvOesbKIu08RLQjwG5bqFPN0zk
	 Dp7dsANW9fSSPMsR6HGP+98NHtLUd0iI1T7Xmr+1lkyRBxU1S4FPQ82nMQjf/wlLLP
	 HJXt41sdCFidNCbi0KrkQdTAyMiPqzyn8RE0m3WJcEOpSlf8DHzuODy1emCBwTtKc8
	 MOI7+sce8nXlA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Kconfig fixes for QCOM clk drivers when targeting ARCH=arm
Date: Mon, 27 Oct 2025 09:09:13 -0500
Message-ID: <176157405453.8818.5432788260760736209.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Sep 2025 11:56:07 -0700, Nathan Chancellor wrote:
> This series resolves two new Kconfig warnings that I see in my test
> framework from an ARM configuration getting bumped to 6.17 and enabling
> these configurations in the process.
> 

Applied, thanks!

[1/2] clk: qcom: Fix SM_VIDEOCC_6350 dependencies
      commit: f0691a3f7558d33b5b4a900e8312613fbe4afb9d
[2/2] clk: qcom: Fix dependencies of QCS_{DISP,GPU,VIDEO}CC_615
      commit: 7ec1ba01ae37897f0ecf6ab0c980378cb8a2f388

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

