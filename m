Return-Path: <linux-arm-msm+bounces-49360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FAA44A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A592C3B1BEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62621A5B92;
	Tue, 25 Feb 2025 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOM1xN8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE931A38E1;
	Tue, 25 Feb 2025 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507501; cv=none; b=HrM5uZXCENOzc1xvr+AfkLdIf1j1Oq+7QtXgSpEwFtqjE0mJIaVHJMotebwDZBW37oUXHz79LYpNhkzCHuTiq9pwmodABFVrSTL+6snEznoVvfh9viDQ2ZCEUpyM/xOTSCZkhJGcWc0dzFYBcmmHBwe+QGX8yt+YBa3a9Y+jxpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507501; c=relaxed/simple;
	bh=+cbF6hLk451vsFlZ3xYrmTeAvkjPBrdgFib2HzXZiKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9clRFIyZgIi/OF9aP8y3Uri6FbivBo54gGjh1hxoz1RBuGOKWtFuoLR63r0KVSANQ02TkwGgjQddYWaQ9F23QrZS4egDXu3Usa97hN226Y6BWV7/mxICnJHxwDEhCSqm7l4XmHckcI8/3Kp1T0Y/+3VPZSoDxCuvpaEvYKUmxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOM1xN8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A426EC4CEE7;
	Tue, 25 Feb 2025 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507501;
	bh=+cbF6hLk451vsFlZ3xYrmTeAvkjPBrdgFib2HzXZiKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LOM1xN8BY4Tj0nUI9j0mmI2ilR4J6vGtGNTUXq1t02sBxC9QxJaMVka+Zx4dmfxy0
	 /htswCANJi7mS0FgA3cuWE/3gY/1wCSILnJ/m45mdE9E+HTWOTbYG0t2I/ovNX+x3m
	 6Lq30M6No6M80hPOnBdczCf5lCC1eyvxEqKnhCyq6i9MvTRoUSD/DLInCk+90xl4yo
	 elcvB7hH+5meZZWlusjusMmdWZ4F9rKi9oZVt7yjZOcTeHbIAgIbo9AP2GWoGM6bUz
	 upmX/zfOfccRlnwIH4inT3Cozrou3Z794CvuM8PF7/wzpKsjl4vZbOBG5phxv04iY7
	 1TITxDaLxDKlg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Mark Kettenis <kettenis@openbsd.org>
Cc: johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
Date: Tue, 25 Feb 2025 12:18:04 -0600
Message-ID: <174050748693.199016.16397243214645123275.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250109205232.92336-1-kettenis@openbsd.org>
References: <20250109205232.92336-1-kettenis@openbsd.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Jan 2025 21:52:31 +0100, Mark Kettenis wrote:
> Make this USB controller consistent with the others on this platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
      commit: 45bd6ff900cfe5038e2718a900f153ded3fa5392

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

