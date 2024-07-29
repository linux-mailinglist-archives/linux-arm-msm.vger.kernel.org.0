Return-Path: <linux-arm-msm+bounces-27180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBE93EC4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657681C2157A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8031013DBBB;
	Mon, 29 Jul 2024 03:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUuigub7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704113DB99;
	Mon, 29 Jul 2024 03:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225539; cv=none; b=qEUhDWlrcjAhY+PWmk/qAH7kdvIDF9yjQOmErlLZHTp9DxUuJbklAUbY3J5hLo0wr6Z7mErnhJ6qGkqgk6ZLhLj+iC7NTZByqHkU3TeLeAaWG2S9cyF0T5rkHZ9/UP8fpb8aoZK8H1dwNcvC+dbyM7kSWMpIKE6HSaeqXXwQgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225539; c=relaxed/simple;
	bh=o+7NscFlntH8IpheuGOfBNKanM/LsZ9nMHeTmUJjy2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ny723VHZ1Uz0OREE+Ex892RzSMxPIv79vdo4KgYpFWrw8Wgna4X8eiJzUa2UHGK0PUH/bFJqG2GFXhWq9J2cUDnB1G82AsGn0Ootd7rUGM4Eo9Xku8iNSB8VHxqfA3vCZa0Sbszy4g1srsTvpVm3K2/31PnyaLXSOnG0Lr3Ccnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUuigub7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18104C32786;
	Mon, 29 Jul 2024 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225539;
	bh=o+7NscFlntH8IpheuGOfBNKanM/LsZ9nMHeTmUJjy2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uUuigub70RLbT3x5M23CE9fZ9iqerrMNRa0hONePulsS1HtcIIwUQTCEKvc5eDkPj
	 4OmOzv7HKk1vYYHOq42jzWoilXV289Pay27W+eIn9DQqNd5iVZMCAwr5bMmLJGYC7m
	 M6r2eeNWBFwY2Kqf5lc4UXXKIETpjmq5W0okNiX/BsFhm2mXDJvyc9AIsyEvCGHbK8
	 2sAqpYTzSv5NZ55zi5C+FtmVxhsGmgV/jlgBHsgOGPUsY8YPrbMgB58Br7hTk35vTN
	 lzdpKcOHvFXzwKfyIMwm4aT0LbCYwKH72UW99zMLz0g9401bOWTg6yK5v2r1JVhVr0
	 HcDGCiw5qQWnw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Halaney <ahalaney@redhat.com>,
	kernel@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Add interconnects for ethernet
Date: Sun, 28 Jul 2024 22:58:24 -0500
Message-ID: <172222551298.175430.15440221416185805132.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709-icc_bw_voting_emac_dtsi-v2-1-a1e02c7099a5@quicinc.com>
References: <20240709-icc_bw_voting_emac_dtsi-v2-1-a1e02c7099a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Jul 2024 11:21:40 -0700, Sagar Cheluvegowda wrote:
> Define interconnect properties for ethernet hardware.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add interconnects for ethernet
      commit: e93230d0597a2736f1123cd7790a4e549f3049a8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

