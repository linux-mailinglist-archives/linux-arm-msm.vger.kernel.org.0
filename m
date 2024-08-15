Return-Path: <linux-arm-msm+bounces-28682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B25953BBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E2631C21FBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773B4158DDF;
	Thu, 15 Aug 2024 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/m3zLUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50014158DD2;
	Thu, 15 Aug 2024 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754473; cv=none; b=Gs18TgDNd7apqrP/wvqnhyyrJyYgwvNNFmuqgYAOORH+LVzw0uSSTzMO/TNyQpbL59VLqCk2TOuVpwePbI8EunfpAR7NaM40sNBQB/cWR+BU2kabwyMrr7H6Jl06jVIkR8DfUZbDRtRdTUaSNzB44AdO3+c3L9cDoMLuevF9hDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754473; c=relaxed/simple;
	bh=fFe48g2ka10FFhongUwFDyeM/bqBs//fChtbPZEsI2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASHEL18ufzu4H1/tHc/dWEZ0kBhf4j7rV8B7Xd8qUwCydbOzJt6jaro0LlYNKp9YWiI/1V4H0at6V3+qCK5AKa8mMIXFaZ5/USEJhANi1PxlqSaGE4AX8/CjGvc5K+WtsTZO233BWFoJn1MVJfxAOPVFGemQlCGWJKM/gyJycVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/m3zLUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEAAC4AF0B;
	Thu, 15 Aug 2024 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754473;
	bh=fFe48g2ka10FFhongUwFDyeM/bqBs//fChtbPZEsI2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/m3zLUCIyeyg4tb6ke1jBJahFq1AeJfCq3Bvt6IgYFi/Pjxf+2LhzYAORIt887ev
	 jUqPjjidjo0VUmzslyiFxgn534yBSuGA/e7kYKyTXiNKE4JWmHRdrzwy2Tozj/BXnZ
	 sTF7gmb091wW1LDn6S6JNAhKccBD35n5HBJzpMQ9Un0uJn9jmGDrrDbqxlFmLRiD8n
	 BNAXNNLI0buQyq5RHUwE5MmaiZYfzl/iXc41x2ASh+dIrD1xvPYGUs7JV09hjqI8KP
	 lWrHo2cQiTulfrsifrol3mPd7QeBx7DISFdXwR7fri/TMVYQNoPFlWzgvMdZVCY6C9
	 iNqqrfF/SA5YQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] More X1E bits
Date: Thu, 15 Aug 2024 15:40:28 -0500
Message-ID: <172375444813.1011236.12810451164544205080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716-topic-h_bits-v1-0-f6c5d3ff982c@linaro.org>
References: <20240716-topic-h_bits-v1-0-f6c5d3ff982c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jul 2024 12:35:02 +0200, Konrad Dybcio wrote:
> 


Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt
      commit: dfbe93f32c12f5628bd83303e10ba63621c259ae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

