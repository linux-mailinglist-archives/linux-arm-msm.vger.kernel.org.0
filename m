Return-Path: <linux-arm-msm+bounces-8659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83683F2E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 03:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03F061F224B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 02:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2582363D9;
	Sun, 28 Jan 2024 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQfGGHfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0082610B;
	Sun, 28 Jan 2024 02:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706408253; cv=none; b=VJ/7HvpwbmIx+4mTSBayTnaq9sttewFraivXYrVDvYH6o2uCbSiUA5XEgCz1meqSnYr5UDJPy/0Cly7FgY1wGT1nLBt6gtOtIXWIDEZKHN19a8YDraQ5NwiU1AntWrK2WMK0/ZFl2/U/vBI9YcRki4fU2dkDcuXCHC9wv0df57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706408253; c=relaxed/simple;
	bh=iD1CPpXwvEfOSs+T8TQEMGHBoiifxZuVk/oWRMwKebM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFL6r8F3DWW9nAZ5z7pUJCGqUCCnTz8sz8izfw80fS5TUooffSikqt1Aytq3QV0pmk1LlsKWMC4ioL5k5Ql3EHrpK5MOKSlaCrYvH9+EM2TBu/L/jqqT3itz8mKJFlsO6XS038H1akDaYAbiiL5GL/MLQmqjw6tirZAB9XwF4/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQfGGHfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97945C433F1;
	Sun, 28 Jan 2024 02:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706408252;
	bh=iD1CPpXwvEfOSs+T8TQEMGHBoiifxZuVk/oWRMwKebM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQfGGHfyalJifMaGsKgc7AOGANZUw+ZInFEQOnk5Y4hBg/xB/w3KS/cmQM7bSQePY
	 H+fFLB9QMJptkn1C1mauicOM7roDXPD+cxgO/o0C5+P9gc2i/0X+2rfIQAzqNdLYKz
	 McHfyq8X1XK8OaBiXSqAV8FE9YG3DekZbtuvCr6Ee6GkD1vAH/w/NGBo2pbkct7zMB
	 B41j8QLDaft7J4ckHXJetSKkY52U80T/+RDp/ygLXu+mtk6qnRQbMPl/SUiqtAk4K1
	 L3JDkURS8bQbRgR7j9GxazEpRlPlfpaAas1f4lnZjgqYNUvPQZqLgZd31bUp0GOPM4
	 imTaKZ56GbHHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add missing interconnects to serial
Date: Sat, 27 Jan 2024 20:17:19 -0600
Message-ID: <170640822847.30820.7246520308284398083.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116-topic-8450serial-v1-1-b685e6a5ad78@linaro.org>
References: <20240116-topic-8450serial-v1-1-b685e6a5ad78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jan 2024 13:25:44 +0100, Konrad Dybcio wrote:
> The serial ports did not have their interconnect paths specified when
> they were first introduced. Fix that.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: Add missing interconnects to serial
      commit: 6e115b75b43bd12d4061e53c8ff175e387783d8a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

