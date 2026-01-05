Return-Path: <linux-arm-msm+bounces-87469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5FCF410F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B4F3102752
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121B3271E8;
	Mon,  5 Jan 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWg5S7EE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55053161A2;
	Mon,  5 Jan 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622084; cv=none; b=R8hDjcmOxYYAqtJzkse9h53j0G7cxto5xG4+ZTvsYydGFYPaZMGBMYHnWCxQi6/VykcVmcqIQK8qJJqgVvbLvwTa69aWADg90Nd8KIMjGL5/4RH3sTmYJdaBQDRHa7f2Wiailk9WD8UmCRj/sdVPB2UjHlo9kg1GzaZ9QttaP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622084; c=relaxed/simple;
	bh=KGXQDG+SAksdLPVy2hfCtD7PruAawfPy+wkPCS9Uxyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bV0M3WvU5Y2P65hbhY65JZXVv+5Y60vWjV7G0F+pFx2CpOiFtCznMCmF9VLt/KYhjoLwpXOioy3566F8C1p3A6YR+4huTK+4XBEmiN7inu1elcIC/4xkpuYp5R34RzOU4PfjB7aaWGv12wyUdNNyKeX+FxSlpj+K6xpEsU3hrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWg5S7EE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55262C19425;
	Mon,  5 Jan 2026 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622084;
	bh=KGXQDG+SAksdLPVy2hfCtD7PruAawfPy+wkPCS9Uxyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWg5S7EEUQbf1CKQ+T4J6KUwd+N4DJraw+E0FgimY8qbfvo6jt20ucQsMLIaoZmcC
	 8pIIHyl817JZJO8wBSbMcTPfUgufZhnzAAXxAsGAuNHowpkqMdwYamr/QIUqE/CPFW
	 GOIEX+DDNznhrdUW1Kt8OCp07JZeCa38GmJYgJN09SijrlFHb349fn8txW5iC8mR+Y
	 v7l9vqOtvsmkadPnEuzvtumbJb7aBnJ8RVj6TwP7uGW9DNPOF7XQGjUuBDCsCK3Rjl
	 NgS7yTb3xqFnZXPFDG8S4B+uZiown0IJ2kkPB13+lrjb7qtjoN8s84Ksa+uQC5QViH
	 QgSyMhtqv3lKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arch: arm64: dts: qcom: specify ZAP shaders if GPU is enabled
Date: Mon,  5 Jan 2026 08:07:16 -0600
Message-ID: <176762206378.2923194.15695184799038245974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
References: <20251213-zap-names-v1-0-c889af173911@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 13 Dec 2025 11:27:59 +0200, Dmitry Baryshkov wrote:
> Fix several cases when the board file enables GPU, but doesn't specify
> location of the ZAP firmware.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8150-hdk,mtp: specify ZAP firmware name
      commit: d43019ef200d567454a8f68e60a5b2df01d8c706
[2/2] arm64: dts: qcom: sm8250-hdk: specify ZAP firmware name
      commit: 95c121244a5d46435559bc74dbc7b5519394db08

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

