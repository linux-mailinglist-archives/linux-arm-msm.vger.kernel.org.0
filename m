Return-Path: <linux-arm-msm+bounces-34636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768429A143E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316F1282101
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE60217339;
	Wed, 16 Oct 2024 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSThATle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228E217331;
	Wed, 16 Oct 2024 20:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111360; cv=none; b=mv/Qv+ZY3fJYtS9uCmEDEfvXgPrcfurDeiJUAO+AkUS9u84Q5PEzZzO/6LXkbT+wYLHUTPsGlPrILPqc+yv+3+5KhJpUPvBXc/yvXl+EOUxQw3O9QyMp5g334YvhEkMVQOyKo63NOPGeFG0fVPRaaFaR1qoQIRwojJrYbG85kBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111360; c=relaxed/simple;
	bh=DCMMJYIjuc7ZMf37BzQj4eDjiOxpnIXPVQmAlKpEu3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DymrvT6vGrTsdCEGDt9gavpJDJ+I1HmyUGC8yRndhh++ceS27aedfMXrxZ/ov6dUKEWXExjjdFDPj2ST4b0asyauitlFTYPkEKN9kj0/o51L7h1LwWKy+bXKd53CCZ03mioklzT/sbtg/8p6mSBE7mghcmAnkraIK/fLaQXtIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSThATle; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1D2C4CEC5;
	Wed, 16 Oct 2024 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111359;
	bh=DCMMJYIjuc7ZMf37BzQj4eDjiOxpnIXPVQmAlKpEu3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSThATleAFfFW7KLsRn0iQxnpDK6LPyeeN+FQezJDT5f8PytTc/GPgvcJxK3esWO9
	 asyKnuWF6WaeGCEV+sFCSGWkX4RorT8QjHeXtrayKQeIm8RfHj100BrMtJGgYOSHom
	 Jqle8pw2zT1ONSHMe2olcq7dGMeonMWtsMS7CtvS8lhw1wwCzmj0fxqDekc9cwo9nZ
	 P3kRsgnQNbEMEpeMOmf/mzZ089uGl9efLArzFtQPDu9npvIo/xXdmY74Q0E25pkc1S
	 q0ag5nFNXLgejxuNBo4etWBWSipN1NUW1WYw+cdkjdX3HrGyWkzqbe5YMIwYhO46CG
	 R5jh3QH5wciww==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhishek Sahu <absahu@codeaurora.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3] clk: qcom: clk-alpha-pll: Fix pll post div mask when width is not set
Date: Wed, 16 Oct 2024 15:42:27 -0500
Message-ID: <172911112243.3304.17711997770230846339.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
References: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Oct 2024 22:51:58 +0200, Barnabás Czémán wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
> 
> 

Applied, thanks!

[1/1] clk: qcom: clk-alpha-pll: Fix pll post div mask when width is not set
      commit: e02bfea4d7ef587bb285ad5825da4e1973ac8263

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

