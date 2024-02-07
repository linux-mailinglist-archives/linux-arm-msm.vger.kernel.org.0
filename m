Return-Path: <linux-arm-msm+bounces-10062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C084C422
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 05:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E04282999
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 04:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC6F2E62B;
	Wed,  7 Feb 2024 04:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xz/0JLHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20AE3C08A;
	Wed,  7 Feb 2024 04:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281242; cv=none; b=gQmJvCF+0Xak1SyoV3qry0QAMuuSAiaSsDhncrGk+qRg16CTQQoRuutuHG2h1dzZZ2m2l/S9CbQROmVDBCMO6EhnJz3nmEVa0gpxwOlKY8J9FPp/x2/gpqJ4IlWp/T4MKFMfLGgKso3OvU9RFPwMmaCr3dq8nKqeHbWz1ivmid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281242; c=relaxed/simple;
	bh=7Hza4j++kZkh89ggGb5eb7llr4tXpgVVqNxV1OwDQfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1s8+Yx2cgNvFQq1oA3lClLchqEKIuJ4QOo2BaDYQiZpDj8ErNtQ4xg8V0L/J0wm6FUMBQzmONIFSWacSJc4OMyitkGykagp5tmXb/bi7JFfAudoMDrqZHOf7rPoddKtWPbcl9+eu3Pj29N5xpp+G2TufhsSdAqKHW744e94OLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xz/0JLHc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44CAC433B2;
	Wed,  7 Feb 2024 04:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707281242;
	bh=7Hza4j++kZkh89ggGb5eb7llr4tXpgVVqNxV1OwDQfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xz/0JLHcX93AA/gU2x033Y3eYKcn/E4HCekfLRDMYCyKA2/b7gFzm9wv+XTJWv10y
	 nMQIe4tmJeTuwt8yfuOwCZ6UVyvEgLUh3M8Cgo4duPf/A4w6YIkWYCWxXFg0TFkNKW
	 Ku99srwbNXhfCq1GvXhfAI8LIzahjbE2O5sAD/55HQ/GJeNun3yCyn2tG1teJ0oxAx
	 nhXjwhoxjKnIbIo/y6knOCrq3BdKYJbrLvEV85gTWXkEhV/wnYAdZNWLUDPMdiEo5E
	 w9GulIhx1U7yQo1qEHeC5q0mPaCtBHBCNZhGWir5QkAaIKWp1Bsi14PD8QgXPnwoy0
	 PZ2z0l5gDkicQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Ninad Naik <quic_ninanaik@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_psodagud@quicinc.com,
	quic_kprasan@quicinc.com,
	kernel@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
Date: Tue,  6 Feb 2024 22:46:39 -0600
Message-ID: <170728117664.479358.8135138797036658763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125055134.7015-1-quic_ninanaik@quicinc.com>
References: <20240125055134.7015-1-quic_ninanaik@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jan 2024 11:21:34 +0530, Ninad Naik wrote:
> New memory map layout changes (by Qualcomm firmware) have brought
> in updates to base addresses and/or size for different memory regions
> like cpcucp_fw, tz-stat, and also introduces new memory regions for
> resource manager firmware. The updated memory map also fixes existing
> issues pertaining to boot up failure while running memtest, thus
> improving stability.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
      commit: f9491ad2318d5c46383be91208620963e8cb13c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

