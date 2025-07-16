Return-Path: <linux-arm-msm+bounces-65314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EFDB07E21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 21:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C321B1C41DA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EC02BCF4B;
	Wed, 16 Jul 2025 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAKIc92e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA22629E0E1;
	Wed, 16 Jul 2025 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694862; cv=none; b=Z7iY8KXuJN0FRz1JNa+Fs4U7wpNkVxTD42ibyUkocxyuuuiVO8GOIl3gd2HaK2CYWASGaehn1gv0lUIRtoJGX2xdNcYM/ajFGa5FsK/oD+HmazRqVgq/qd/ogdDzhnxFST1QklgdK8iReJz5sJ6lBS/ByB1U8bDosZyFL6DiLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694862; c=relaxed/simple;
	bh=s2JzVVS7U5z7zyKF+XcTDYMRk9TWCEeqCOXVJf18Ng8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n+ObFy7d/B/Dle2Y0CQJ4g7rupkDeCX6kClVP1Gbm3jOVeD3qq+evCt3tByzpWkKOOsvujRVUJxnb56AIxjJ2nuXlzQcD1hw3RT6egy7gAipTjtho3drU3WJk1K6omO7eigMeLqoRfevWULlzqre+0akZZh4a0lvJzR9cngQf5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAKIc92e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C935C4CEE7;
	Wed, 16 Jul 2025 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694861;
	bh=s2JzVVS7U5z7zyKF+XcTDYMRk9TWCEeqCOXVJf18Ng8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BAKIc92eEg7NTU5V3y0yyW1FwLoa3WTTqjho/JjJEIQjWVSOeOqchUkO2WeXajNY2
	 wO/OVDbX5/iaLW/rzJqPLXXDzKD34CovT+TdjIMofyalpRkc37CbjINBxR0hjxvA+q
	 5CtxTKm7VLa1WzWhcN2lBSxCgVx75+3iu8j6HrGwq+rfaU/GIgFeX+aFAZI2eb1Cza
	 hNnjK83b4Wz6NK+bnpYyMmK1PWXIL89yy0YBU9dwPIgp1ML8eQD+nePL5LqBVVPKSs
	 kNd8HVPjxsirHNrR1TuDrcCZVIfrl4x+cqLQVOlzAeAcECSeOgEV6hoG/seA35hRty
	 3ut/5IWLaBlwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dt-bindings: arm: qcom: document relationship between SM6150 and QCS615
Date: Wed, 16 Jul 2025 14:40:50 -0500
Message-ID: <175269485297.105136.18431816595936653418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
References: <20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Jun 2025 16:40:27 +0300, Dmitry Baryshkov wrote:
> QCS615 SoC is based on the earlier mobile chip SM6150. Add corresponding
> compatible string to follow established practice for IoT chips. Rename
> dtsi file accordingly.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: add qcom,sm6150 fallback compatible to QCS615
      commit: f4ef7e24e3bc718569420138cda86f5dee874c48
[2/2] arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi
      commit: c5e043aa81c6615781ee9ba3c64f77ba9f97f985

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

