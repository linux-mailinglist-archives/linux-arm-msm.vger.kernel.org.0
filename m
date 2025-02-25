Return-Path: <linux-arm-msm+bounces-49357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306DA44A0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEE511715A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA8819597F;
	Tue, 25 Feb 2025 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWbkWiYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C417E01B;
	Tue, 25 Feb 2025 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507497; cv=none; b=JywCl5EpV3FQ0nrC/F4UuLGfQ0ykG83oq73JVHIYbTcqmf9zByO8UnDM6Ig4zzm+ljAyybXR6Ywm9KQivITWkO2T75A3M/WtWq4WWQI8Ft0f0D1INrWivklZVgnKOKYDzHSQ3pnvJxNKvn5LYkhcDz41R+QuNoGdU1cttJuRXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507497; c=relaxed/simple;
	bh=Trsnq6+EbVLn8b9NHODgHEUPF0oaMrBMMuXwT3n4nT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMNuhsSPw9whpxMB6yP8OT5ryMm1cVWLOMxbvnEDuG4gZqinnn22wI0Cgw67SCA2ucN03I0GM9pfWXDeX4VfPI3jrCCrQmq/ph02/syljpBvelfRqZZx9qfPIwavnT7lPz3pCTKWvUDaKunjuAqg2x2OXAuFXrX/Drv16CeeZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWbkWiYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A97BC4CEDD;
	Tue, 25 Feb 2025 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507496;
	bh=Trsnq6+EbVLn8b9NHODgHEUPF0oaMrBMMuXwT3n4nT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWbkWiYQ6ui6LVKcz0c6hkFwlecKih/CM5cnfbLOdfiUUkELbPW9fmb8HlxDvqyIV
	 hWDco82P15zC/Lw7ndVlzg6S2tSkRlqsMcQ/AfIO7U24JFFzlJxcexi2orhxZMyMW4
	 DyR2B1ALRI64qjET4BLEnzNXA4ZPxq6joAZ+6A+SUSMwRP0I15uuoFV0mO/+k4Wc/3
	 b63MPk3X/Jx0zNbpf8UiL/nMA3+Y79jyufSww+arrn5CoeHF62+0x+1CTfxMSQLc+J
	 V5gFANmGCJZOvVqn0YynGEedkJKr4bX3OmW3acLQDZ5wt/sFyD3lVck/VUcBVq3Zof
	 S+pIH1x2Zk1hw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add the watchdog device
Date: Tue, 25 Feb 2025 12:18:01 -0600
Message-ID: <174050748688.199016.1631901115590146954.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212-x1e80100-add-watchdog-v2-1-a73897f0dad5@linaro.org>
References: <20250212-x1e80100-add-watchdog-v2-1-a73897f0dad5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Feb 2025 15:31:36 +0200, Abel Vesa wrote:
> The X Elite implements Server Base System Architecture (SBSA) specification
> compliant generic watchdog.
> 
> Describe it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add the watchdog device
      commit: 97e05bb2253db34fc0971e87f523a0f1d4cf14c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

