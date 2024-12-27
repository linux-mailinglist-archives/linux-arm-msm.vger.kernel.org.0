Return-Path: <linux-arm-msm+bounces-43458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814179FD01B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ECAF1881F17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC9148310;
	Fri, 27 Dec 2024 04:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTzZ3oGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC3146A6F;
	Fri, 27 Dec 2024 04:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272937; cv=none; b=jAO6EIHm2gS7QIxCt9F/C4/tW6ntXcblpmips4jYvCMlNylWdYyOVMam6xc6aNbJNnx5NyjQjwF+61RTJ9kPYZmB3ACre8LTre/jDGx4njCOmiyaKCyRANiLa2dr3eB/CcO6HV6QL7pYGEuyWgUX9rq+PZRp7TUdSNe3g43qekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272937; c=relaxed/simple;
	bh=8dYvwoZdM9kEKmF3gLHCAl93AebpsaELnK3/Jl5uCG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=raqjWgWEoBNWEgjl9udLp8YSwU/suQA2h73OP8zsCA3cdmzK+9JBL2wLLTvufYUNIbC4n77F1Z4mabJavNDGnURew2s4TZs49tudAyaJxBszF/mrlX6iduLuJIq0+0pVEQESBauaG4gRxA9gU+ft2mEZeaIvXm/0lbcOZaVXUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTzZ3oGc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682E1C4CEDC;
	Fri, 27 Dec 2024 04:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272937;
	bh=8dYvwoZdM9kEKmF3gLHCAl93AebpsaELnK3/Jl5uCG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XTzZ3oGcL+RhyXG1vFqrD/wRh7vcQnQv5hJpvppts46pBz3Nr6xwYKmD6KKTAl69M
	 nK0h6fM9m253x9tAmNkZktlYzUI4syL+CJ0NaWAEhzpp9DXM2xK+muhm7Chn28GU+Q
	 4FLHZqAmU/adMF6grEDH19eyZDfLqZ1rLz2LG2rmJbFOWJltOcLMyXTJIL0oKbMJ3k
	 aUmO7dOLOrltw16EqrZijk0uvayEHggMaxP4ogBXQ6QaqFOzFLTpxY1eNBMZeuqi3N
	 8HfuTs1k37Q0rjdh+oZXlW5y2z1Or6dMIkign4LhD6mAnAo7PJPD+0vvUdKwc6neGB
	 +vxqXl6fcfe1A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add PMU support for QCS8300
Date: Thu, 26 Dec 2024 22:15:25 -0600
Message-ID: <173527291938.1467503.16375011886309003670.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241101-qcs8300_pmu-v1-1-3f3d744a3482@quicinc.com>
References: <20241101-qcs8300_pmu-v1-1-3f3d744a3482@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Nov 2024 14:44:46 +0800, Jingyi Wang wrote:
> Add Performance Monitoring Unit(PMU) nodes on the QCS8300 platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add PMU support for QCS8300
      commit: 09d8a3ef91f69f3d1275d5a615ce13526c183e69

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

