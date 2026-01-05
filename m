Return-Path: <linux-arm-msm+bounces-87476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72065CF4273
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E91893009D62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DF33358A9;
	Mon,  5 Jan 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJ0D66x0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B54298CC0;
	Mon,  5 Jan 2026 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622095; cv=none; b=OBGXDkcLvPV5g4kvEm2ZUsF5PdDGBHbvKMVqnPV8OHWRlVlwivGBjvyzF0uZ+iNNtuceEu4+S/vrcvjA/hx6Yj27HNkZCGn6uXH11yaBa6kgVAQTYmE9AeBV2AM4MxvEpIlN0Ex1+KDEZJBAd71nH+jFnph4NGo0wmF68Eh03WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622095; c=relaxed/simple;
	bh=Pr7MtfsGjVPx94HhciA2GM7h9cqVJaBkxXW+ZB6vBbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0Nn5NJF9vbTrs9YHDkhJRsKdxlqURgc2VRVzUgkiEkpUScP1/KdHsrwqPuafj4kwcwHRx4RBh+SuDsfMhrr9rtKYL8wxB52m1YBeYReIKgo6EwfBYv1jFi069IwjcdQlB/7Jjwu79iDzu9gT954CQogon1Jd7CemQkDyocBdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJ0D66x0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9712CC116D0;
	Mon,  5 Jan 2026 14:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622093;
	bh=Pr7MtfsGjVPx94HhciA2GM7h9cqVJaBkxXW+ZB6vBbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJ0D66x0E8hmvrphEDVyrWKHGkdisHLD9NiYpUCgaXjEl4W+wYEzCTcWLn1GQlTf7
	 qQSZR/+IYtKOY9DZMs0qjCx4wUBJvTEkKjkFy05XzASp8+exR/97FDdj1F4/zGRDrw
	 tS3+z/Epz7t5+raoxdH0aXSjWWL5WjDGo6E7Ry5cXQtNgO1XYQcdy33ZacTk2XNN2m
	 sawwZAVjkr7d4qFJl60vrTjqeYrZ065HrgYfZX+6NkZoxEs6VqpI9BCuU6enlP8FO/
	 TCjeSAKKBmLfiBWnageV7muK0Hr1qEBC2rqGdsWum0mVopBlErz+qf88Q6KANL+Kfr
	 lKfW7v/OvWdOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] qcom: SM8750: Enable CPUFreq support
Date: Mon,  5 Jan 2026 08:07:23 -0600
Message-ID: <176762206371.2923194.10999954368395112268.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Dec 2025 00:32:22 +0530, Jagadeesh Kona wrote:
> This series enables CPUFreq support on the SM8750 SoC
> using the SCMI perf protocol.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mailbox: qcom: Document SM8750 CPUCP mailbox controller
      commit: 65ce09d2f164a3d91b5802ecd0783aa2c9a208c0
[2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
      commit: deed369e067b8406714154a6678a3e3d9b1c1131

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

