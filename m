Return-Path: <linux-arm-msm+bounces-35513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C806F9ABCD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DC98B23A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A0A155A4E;
	Wed, 23 Oct 2024 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAXyaE1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FB5155A30;
	Wed, 23 Oct 2024 04:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656986; cv=none; b=Mw6GEbwKgCaMm4oVuLEzXZnRHvkNwfaa6mOElWe1H6bjdDPtI7cYts5pqv6mgkGHmQtVJLigtG541s96avR0lAVv0BhS6dGtGUGxKL+lZ9IjrrtaPm/3U1rQOpw4bKTLuRYSLa4qkHb09E1z6Q6ll26Lm4EeBycQwm2+o/JJYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656986; c=relaxed/simple;
	bh=AV28ao7EkD0FEGO0LqK55QI6h4qPslnvb6diIn7+b6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmRO0nPAt1wf2/pP2x2ibkXW5sXwr7GvkujnNmSmN0ML8mX2lH7T2WY/M899YDJwHRkJ2cvikz3WFxvOuQQoS7flUuz6uVyqlyNVrVJgdbBSY5Tjxj0ljNS4Id+WJKTCmBG9DSoYTes8p6q88OUmoWEVnEUvWzUivp69lzbHVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAXyaE1K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F554C4CEE7;
	Wed, 23 Oct 2024 04:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656985;
	bh=AV28ao7EkD0FEGO0LqK55QI6h4qPslnvb6diIn7+b6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAXyaE1Kp50D+q1loyNIaXm0vQN6PFbW5XAlt2LIjLUb8nMmg+FzeDHC3qBFDnvyX
	 BZhXFMwLCWI2+R5M/RBu38vXC2p5Ag+uyIlhU9XHd9QoYMdz39k/zqUVaYJjCbPSKb
	 rxAXVaxUXTC+RzdhvVo5dNffNNFNKXvqBdlzNqDNTkrLHc4M857h2/jIz0ia1Na+k4
	 w6HGWJLK8OaFUa28Uulvkexg/VWr2JDU2enqxxt2mgXTxxwptAaYCCknjYc39waxaE
	 bOogdQHrBsZR2G1B+68m72+uFaqZeCryGmOxtkeKxCmK09Rou5Fn3bvjJpURT6ODv6
	 SJJ8c1o3G18vQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manish Pandey <quic_mapa@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Add UFS nodes
Date: Tue, 22 Oct 2024 23:16:01 -0500
Message-ID: <172965696417.224417.6379593336280989214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241019063659.6324-1-quic_mapa@quicinc.com>
References: <20241019063659.6324-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Oct 2024 12:06:59 +0530, Manish Pandey wrote:
> Add UFS host controller and Phy nodes for Qualcomm qcm6490-idp board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-idp: Add UFS nodes
      commit: 5b9d9b910653c53e66c05b9c4dc863d0a1ee14de

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

