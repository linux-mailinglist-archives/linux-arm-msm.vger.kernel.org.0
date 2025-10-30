Return-Path: <linux-arm-msm+bounces-79713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFBC2129B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EE501A656FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4093683BD;
	Thu, 30 Oct 2025 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiuCEOt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36563683B6;
	Thu, 30 Oct 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841365; cv=none; b=fUNQPgYZRidHb8ysJcAALHNk1684uryXnlG1uk2vYFdcrhPPShtz7iyKuOarSTUwc+qvXpht4j7tCaZjWoja7ERdsfnIBdMaUH/rNGUlgb3R9NmdZTR1A/4NAiLZr0AFRAZKjRT0SapZBfpFlcE60U8od6GZceUrPsjYsZ6Snnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841365; c=relaxed/simple;
	bh=EQZAj2GMcVYoD5SLhB4WtzRfQrbee7MPNcE6HaYCKlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CFeNqO06nLPjH9cSrFVESrqjpBGj40NWd7FQyB536aDhjNsQR13xTGtyAL+7cy0pD0Xg7xQ5tR6z2IuBYBaQgPrX5mZ6Lf0xDdP5ohhTdgg1wRPq9NddayzRH+7PpKYFykSiLXxDQrojDl+fe4lmHKRzr7LvCco41dKBJ2X8y/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiuCEOt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F0EC4CEFB;
	Thu, 30 Oct 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841365;
	bh=EQZAj2GMcVYoD5SLhB4WtzRfQrbee7MPNcE6HaYCKlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BiuCEOt3QdfC7TxEnLCXm6Xn1uFXrQZ0cQ2BbjvJjUmhS7TSwUKS/+NDaERhgFTRW
	 a2EYsBHtN9p0ra87+2PwH7BY8Eos5yRRIraWntmgywXWTAsDXp3goCwaGrqi9OTaHS
	 bQsiqil81xb7+O6m3vZghRWLw99hQy+REEW7C0Qt506cBQNChBAC1hccIo5pfbbfAL
	 VhhnJr8f+yeheJ5EYTYLtznhCMYqWRPMM78C7MulFbwmf9lVWB51EV8/LCjm+rWAtb
	 +k3OskErTMCpeHBp4F+pRapqw09h+H83pQmTT+SDT8TfbYG/XoUYq7XodX8Bpfqcuq
	 zkD7zFI9PeDRg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robimarko@gmail.com,
	quic_gurus@quicinc.com,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document Glymur scm
Date: Thu, 30 Oct 2025 11:25:38 -0500
Message-ID: <176184154201.475875.5941007730959686549.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com>
References: <20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Sep 2025 19:47:38 +0530, Pankaj Patil wrote:
> Document the SCM compatible for Qualcomm Glymur SoC.
> Secure Channel Manager(SCM) is used to communicate
> with secure firmware.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: Document Glymur scm
      commit: 6d49c6ede81516121b7dbf840040775f8da9333f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

