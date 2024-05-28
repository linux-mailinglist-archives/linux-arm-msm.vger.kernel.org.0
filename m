Return-Path: <linux-arm-msm+bounces-20700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E28D12EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2ECAB21EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9583D140363;
	Tue, 28 May 2024 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUdsMDIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DAE13E050;
	Tue, 28 May 2024 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867194; cv=none; b=Rln211YvIkUl98fIYfZ5vTK+ljdbFz4DvH2UjkqgckhFCfaFyrd+aD+VHlK+tjceRDhm/QV3wkby3+/R76eSJ2Q7rCDTKtaEIo22flQ+BfmNn3gumDj24bjEIwxwt9ylrfKV9nA8qHHT9NYUh41ztUweD5Y/D+tWVBN9OmvXlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867194; c=relaxed/simple;
	bh=2mqemxQ+Qk8ChDSwJX0gNmpRRAq4bKzYIBgw6PAefmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=En7mNMAv+tbCLpgiB5ue+66xVRaRkNS8tXSZndeVcaBDj698FAj6VwdsS6io8fVdz5lQJUlfD+GzaJE4GHjfHBCp6l9TC7s0KeYWyAaQtBjxDCZcwgii3/rUN428bcPfHCnprgEQwCJACLsP/U4jboMiOz5Cg0J+TIJsAOB9Ovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUdsMDIN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B95C4AF09;
	Tue, 28 May 2024 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867194;
	bh=2mqemxQ+Qk8ChDSwJX0gNmpRRAq4bKzYIBgw6PAefmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUdsMDINAHwVqWKuNezYB9nX3OthnxGpwmIvNpthXgbEHqfV7xnWS+Xa/YAzLmtl7
	 G8nG7Nl2MPuqvm83zQ2UGUNKXFms5HumQqdl6yoIaSQRNbAnFKpVF8RJmbgqZwuX2b
	 jzFBRQxEmj4mQgFlvRmW8lKZh8QmrqzneD+sd9EC+3VfznWhiJjPfpSMWccFi0n/AM
	 +JnH+hVQd3mZ0jvDoTtVJs13rhC/JALajTwlDUJlHdqkr9uy7uQZIaZlab3Xn11AjY
	 NZAcLSLNE22+fOUJdD7ntvEaRBstUj5lTde9DhXbSbagtCcqxoJw13XevIT8Pl1/No
	 lVQCfRnhHFcKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sm4450: Add cpufreq support
Date: Mon, 27 May 2024 22:32:33 -0500
Message-ID: <171686715154.523693.6573813091229179379.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240513093648.1746336-1-quic_tengfan@quicinc.com>
References: <20240513093648.1746336-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 May 2024 17:36:48 +0800, Tengfei Fan wrote:
> Qualcomm platforms making use of CPUFreq HW Engine (EPSS/OSM) supply
> clocks to the CPU cores. But this relationship is not represented in DTS
> so far.
> So let's make cpufreq node as the clock provider and CPU nodes as the
> consumers. The clock index for each CPU node is based on the frequency
> domain index.
> Also add a description of a SM4450 cpufreq-epss controller and references
> to it from CPU nodes.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm4450: Add cpufreq support
      commit: 15476ccd3dc6cea04048d159115c86a3d5042501

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

