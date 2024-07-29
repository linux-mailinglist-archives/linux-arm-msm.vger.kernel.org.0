Return-Path: <linux-arm-msm+bounces-27189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8E293EC67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F19282239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9465E145332;
	Mon, 29 Jul 2024 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D15UlbKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D414532A;
	Mon, 29 Jul 2024 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225548; cv=none; b=kieO8SHdWui6vtUAdj3deU7qRFoq/mSarFCMcw7J2iH7LbCN/QtKsifZF3oVxu9HU6dUDwVdascCRWir7nRoVT5Cq2wTshXcIexArosy3KKLo4jp0pr481KdRKVPQjhbZMn+D2waBvDzJmPWbqDmuHGq2syPRErK9AKnwx0OziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225548; c=relaxed/simple;
	bh=LSzhW820pd4iupGl9rs9YZKADthdpOlqn3O87nxlgE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LMd8424cE49Zwg2pko1LTNmJL9KYOgupKZIDFWNPZiQQWjqqr0WNTruQKWKT/tekXjTgXb5nLolEx+NKraSD2hAj/W3nvdlDzNs5AvFjG1Ue3RK/OqWyo/5itD6mQwV8chxFlLSgT3yextrxGB3kLiFSbUsfkzIY5aIqQEQRJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D15UlbKB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B24C32786;
	Mon, 29 Jul 2024 03:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225548;
	bh=LSzhW820pd4iupGl9rs9YZKADthdpOlqn3O87nxlgE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D15UlbKBRNu6fMdswVLyWZDUEWYh1esucksZ6jo/e8CxiSNE0KU8fN1QG6P8JLvON
	 IcvBzZSqvFJLCIL4Vo2cV/4csMf12bI3JNdxD2kzsTCxEubDo2d1pffr5Xn9ZKwiWE
	 QvKU7Ve/zH66kEcPE1FF4sbPdBXOt/yUxHxyuk8nYXotzWVcezdfqgHRy4/eEuAf45
	 vnWQIKMW7PO4UBmMEoZiJXDbwaYCDgAo5QQjLOMrrM6GNvTrHLSGoObn9PwQp/9IuC
	 qrEaH396EmdivkrDLT2F4ExbBUS9C9KBfmZqRbQ7gh0z1bCvMc/PbO8Qi6Y3OAGANm
	 1FBHoOhSlocrg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: Add LID switch
Date: Sun, 28 Jul 2024 22:58:33 -0500
Message-ID: <172222551297.175430.9346186776128991289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
References: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jul 2024 10:18:20 +0200, Stephan Gerhold wrote:
> Add gpio-keys for exposing the LID switch state, similar to
> sc8280xp-lenovo-thinkpad-x13s.dts. Only the GPIO number is different.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-crd: Add LID switch
      commit: 8d86550c2fc262c49a10a4a0e9837d8949f3578b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

