Return-Path: <linux-arm-msm+bounces-35504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E09369ABCB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E50CB23786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F392147C9B;
	Wed, 23 Oct 2024 04:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzlInHM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41840146D7F;
	Wed, 23 Oct 2024 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656976; cv=none; b=REyE8GzH9W0M/OcazBauf+bwBQDAsalDNckwTugxKXJ0YwXSOniXtH5yJTjnhneiptv+Gvc7zs52slumx3fG4/IlDKPQRgh/d2y6OEr2X5/4L40932Hm1+/shHYrUERfKe7PLNg7ppQ/ck6mUFhC4AvWD4SobC03SnO9b5P/nwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656976; c=relaxed/simple;
	bh=xj5YTUx/zOpTLWvM0SxYAe3tekJfh/RwWUwx2Huo6JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFQdm4EZsVHb/FPnCE1gpVPdRzE3e3vwkO53KnF9TESfvkrMyRNNaHxsaI7BBhkaQ/fr9FsvzgCZYuN2GfkFvS+69LXivGgGfbu7++EUOnL/3kOpPdgHROiL8hIy5GiDVRNBV9mz+9ltHTlXOW0tZetlwlf+HqerEf+xpZj+uLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzlInHM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4ADC4CEE8;
	Wed, 23 Oct 2024 04:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656974;
	bh=xj5YTUx/zOpTLWvM0SxYAe3tekJfh/RwWUwx2Huo6JU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XzlInHM1iodhU9PZr8meTQw4/It1rbDnpbi70eYiB6+wKs61WmNnYgU3sMNS9aXvu
	 DlIypPDQfTsmrbmV+RZzYG3CoIwproViExuwxkySOXVSEn3Tz4Qp+umPaUYHZAVvVf
	 BEOhbmBaMDfnMwHi9MXgrN8+obkD6dR/4y3GMN/HUw6iCO3bcGOG+vawKXf9NcQIKf
	 yyXogSv7YLGuXZ8s8f2IDz3gyM/XRGI650q7DE06Ami2GZ25tYGwWucZQp5FfRE6vS
	 4YqIB0zqDCwpQHHb3pDRPQv43dbg0H8TSCbOlOyCgH4mDguqWXcWVyBYdEc47V9uDf
	 lsAMf5hgNk9vQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Add SAR2130P compatible
Date: Tue, 22 Oct 2024 23:15:51 -0500
Message-ID: <172965696420.224417.6584490704850065811.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017-sar2130p-soc-v1-1-7f9c204710c3@linaro.org>
References: <20241017-sar2130p-soc-v1-1-7f9c204710c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Oct 2024 21:19:47 +0300, Dmitry Baryshkov wrote:
> Document compatible for the Always-On Subsystem on SAR2130P platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom,aoss-qmp: Add SAR2130P compatible
      commit: 25136f046b84dbbe3cb8945666a2ecae487ddf3f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

