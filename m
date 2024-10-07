Return-Path: <linux-arm-msm+bounces-33389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F7D992F27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DDCFB24B04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E241D90A2;
	Mon,  7 Oct 2024 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vvhm3cVD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC801D8E12;
	Mon,  7 Oct 2024 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311180; cv=none; b=KQ4Ootge0bjZPETaE5Wbgai3FGlSDi+boPEIN4Rsb0dhZuKUBeM4gAaDtyheQInNaNjQZBFUpquNh7DVztMI05HwnzOg+LC8bEzoae5qmY585IPU9eQq+YNAS9pS3gOydmN5s++WWuksAb7kkUpVRXsSiPUpJE93HZIUSGopkIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311180; c=relaxed/simple;
	bh=KHAibUx7xBYiNzRK75fHVxrbbhosgLknR1DAGDwAGwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbLEEorJHlNRopmAfXcGX8Z7fM0Smo9Zm+ksgMM42PY6gB8l3GtGTF9r6gMUD00f3jllDFIUWPC8LN28dNj1x4xsChnIGn6eU3BuLgDJP+hqxp9dCCrPKvM4QbuOYPDdUNA9q5mbUypQ228GWTF8r6chVN5r+5mKiQrBgwhCCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vvhm3cVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F122C4CED2;
	Mon,  7 Oct 2024 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311179;
	bh=KHAibUx7xBYiNzRK75fHVxrbbhosgLknR1DAGDwAGwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vvhm3cVD2lu8GPHuLY2RvciOd4bOLwSx0drvFnsdenWL1YQew9jbBfrhEKpcYrV+u
	 rafNM53iK3oGI+tnhxRdHPaRJLiXFq9fz8dt/hS9q7a2zx/DbH4QH8VKpIVjSY3YHD
	 QpBkfpstipQZ8ZvFaDYBsbQOF1cHSd9hLTwL5kbKc+5Ep6nDpMreti/W4OYDu/4du2
	 npqDXhBNuPd1ua46lhl6e8EPok1n/7w0p4TdkMeNnyDWSHwvBSjh3dVVoFLJ7F9n+Y
	 XeuDi2d/6UATWPR+7kyGLz3JDfbO4sAxpWaUPMvUUb9v55DvSPZT0wzt6iGrfpikUR
	 LKxQRCxt+cucQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] Microsoft Surface Pro 9 5G support
Date: Mon,  7 Oct 2024 09:25:52 -0500
Message-ID: <172831116175.468342.4376919481343564567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908223505.21011-1-jerome.debretagne@gmail.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Sep 2024 00:35:00 +0200, Jérôme de Bretagne wrote:
> This series brings support for the SC8280XP-based Microsoft Surface
> Pro 9 5G.
> 
> 

Applied, thanks!

[1/5] dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
      commit: e221af165910b8967f7c2788c34826f332f2cc7e
[4/5] arm64: dts: qcom: sc8280xp: Add uart18
      commit: 1e70551123d014b3a1c4b85da54d247243750e7c
[5/5] arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G
      commit: f6231a2eefd430b8b8798911f023891ea51d1d09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

