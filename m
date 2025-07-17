Return-Path: <linux-arm-msm+bounces-65363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB962B08401
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15D17A47E80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB572222C4;
	Thu, 17 Jul 2025 04:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrqfdcl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A17221299;
	Thu, 17 Jul 2025 04:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726697; cv=none; b=cyTPbfH88dHFSBclOv7IQjOJNnOOFKBLCwtdX40RK/MLV0vdtLQW9Ih/K3fp3gGorq9rfOrzzi2ZW0wIxWnNv3URzN/1s83Qwcu0p7WqwowdkO49cDFNUfIrnNLHwYnvFlrcUFPPV8SqUZ3aqkKqITi3+PjaQeGwLWdKJjTeDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726697; c=relaxed/simple;
	bh=DBEHOzSbgwlafMTRnvAvjMKgrotxwGEEwGpwL5BAcss=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdBuLkvAP57NJEzraAHgc7+jwJ6QaUJbJEmjj4erNRTlxKFMhONoZZOh2dLz5rabjNfTOQyI/am3IDMqgtN88wDuuPgF3vTeuWSYnPF/OgpnEySDyVft7u+AdG6JijwQnKQ70DVRswL1QBQLokRUPoZPGiaiGuCvmypVk9nr608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrqfdcl2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA50C4CEED;
	Thu, 17 Jul 2025 04:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726697;
	bh=DBEHOzSbgwlafMTRnvAvjMKgrotxwGEEwGpwL5BAcss=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jrqfdcl2SKsF0EyiCws7U2xTySuYhvLpIsFfpEn+8ZrDrLes9uPApnU8klJOZep3r
	 N1NPwFXWlK6BaSq4ReYx0fHs14mtlkz+YbH1iudawOgzzE5Dk790kxBHmaYWh+sVML
	 eB0SWtZfy+e8rA4yx+ZSTxecXQfSL6tTvhErXIeiU3Xr7fNEFjS+4kjllyWkr+8nVB
	 pGSN/6BwtIX9tsQw20bR62HizxJheBop+F6aqlJBmQEtCea7zXoCB+26ToVNPDb5E6
	 8CIn+WGWb2XsdRns21PtLieabXvUzg1QTVv4xHp9Lsv0NHji/yRmKkHxYDdtjE879e
	 v6pqkuEU5l9WQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
Date: Wed, 16 Jul 2025 23:31:09 -0500
Message-ID: <175272667106.130869.3486884871533384881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613194253.20080-1-peremen@gmail.com>
References: <20250613194253.20080-1-peremen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Jun 2025 21:42:53 +0200, Shinjo Park wrote:
> Use the same definition as pm8058.dtsi. Since vibrator is used only by
> some devices, disable it by default and let it be enabled explicitly.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: pm8921: add vibrator device node
      commit: f36e10fa6e1ed424058b2121c174e105e7c53f1d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

