Return-Path: <linux-arm-msm+bounces-25436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5EF92958D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4D7FB21E61
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35291487DA;
	Sat,  6 Jul 2024 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PN3RuqpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7909D2C87C;
	Sat,  6 Jul 2024 22:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303305; cv=none; b=k/ooNsQmIMs6IGwE1WQ59kLbyOzT5Bo9DWB1d6Z0ySxn9tHas3APmhdqO2qrT8RKq8PX54HU6rYdzYy/oxu00kKjCinW47V7nvlccTaew82jnejR885anmElkWl2fTrFZDAsAEQGLx0p+dIyvmPXX3HyYRXYAn8o3pj+YdZnOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303305; c=relaxed/simple;
	bh=Wxhs/FChdJbbpCLabAn4tPi/l+AeKt6Cqi5c16sk6Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWDQFCfPmZUSLUlWPjAE56CboInx9le7rNnDR29e1L0NgQLZbQ39/LfdBAgGY/dm8hB7JaP1mBtV7Q8NjoNgBSBBdOcPTgjwByGYTsWlh2fR/qMAp2BAvFayp7bMRAa2ifRBt5h3QEzNMF3IDQK/VDV76PIqd4plXAcXLhyzF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PN3RuqpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C2EC2BD10;
	Sat,  6 Jul 2024 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303305;
	bh=Wxhs/FChdJbbpCLabAn4tPi/l+AeKt6Cqi5c16sk6Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PN3RuqpRWq77Kig04brWZNJpeyiefIo60XdIQ7ouLY0/BxRbqy5cyMBV3Z5m6PU7G
	 1AMuSlfl0lnH1i8N7et0yJ3mec7tHv+4OHuj7yrrnWTqCn8LX4lwBsA2LAO1n2mH1P
	 ATS+iH5E3ku8NmkDMy0L03qZMpfHzhKnN6BeOr2HgPdkwy5sTEXMmRqFZ2K4A8NPss
	 jhYmNYgbEJUbIo6zX/yolvYMyzIF9vlR/ue0LzpCwWVqGP7Umh0VPyL0RO1Ozaof+k
	 cmuphar5NWwxAAtXMc7XFfEpnWF7NljOrfLq916vL82ehiEdYuaz2PbJitOxbBch3K
	 L020Ln0RQZE2A==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Enable download mode register write
Date: Sat,  6 Jul 2024 17:01:27 -0500
Message-ID: <172030328810.28909.11670679440125324852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705143443.1491956-1-quic_mojha@quicinc.com>
References: <20240705143443.1491956-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jul 2024 20:04:43 +0530, Mukesh Ojha wrote:
> Enable download mode setting for sc7280 which can help collect
> ramdump for this SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Enable download mode register write
      commit: 134a4b2f3be287358542953c9540bee4296bf593

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

