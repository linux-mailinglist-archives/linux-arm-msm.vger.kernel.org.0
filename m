Return-Path: <linux-arm-msm+bounces-79022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBFC11BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A2356365A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1D63081D9;
	Mon, 27 Oct 2025 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4h/TiqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3FF2E092D;
	Mon, 27 Oct 2025 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604488; cv=none; b=pq2f1VCyJUnc88YqYphcjDjgyrl2C1QDWvqZfIHqoFX7BXuGMN95Sfr43g3yPHtDL4WmwaneczcgRMZsWTthdJPNHSag4aM8wjv9F4ALbMkEadLGiNxFWTOKTJpuwa9aisKaMFQV/ORR6HSslyLbzZvaCR4Rh/nRzB8w15x2p7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604488; c=relaxed/simple;
	bh=WVzoQ4T5tjNO2wwWWJJz9uek8sy6pYVxznCab4CF78s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vwq/qGbHrDkew+pWiMc/+rJTNSmW+q8/RhX+s9c63fSYh9emsbGtaj7v2vZzpPo4mqat5et0h9rfFBZ7nYuutLKuNa160vYgGysAajR5SztCna7+wlhWlqwd2hnzz15a/xPocOG8wkmkZj5JTQpLSSQ9ubKQlZp8N+fnq4qjNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4h/TiqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AACC4CEFB;
	Mon, 27 Oct 2025 22:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604487;
	bh=WVzoQ4T5tjNO2wwWWJJz9uek8sy6pYVxznCab4CF78s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q4h/TiqFD6LhMFp/+duK4Beh6Ympyrg3QLhOK0OReJQXZXf74li7ZJi/I0/Bo8p0b
	 bh6YvESerzmxlu01wNO4KP16m02DsdDR78AxKotyKK3Wpob4UFhKNnvRplqNY9kqLX
	 aMZ8K8OmcBhg/PEu5FvJQRJdWhKSH5sytc0bIKASU5YKEUKa+o7ecPyRENqbW9MDg2
	 CYaAiQDYPS7d+3rTsUnKedfUJzk3WenC/A2VDqNgtHQI3LI9XklcrmWa5u8vb9y7g1
	 qYWXimwAAqu071vw7pyEHrDI16p+vzE74I54Cy+C7WPNjmWWQ19otdDnAzV0dHvCM4
	 C4Od7L96ZH18w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Drop address and size cells from panel
Date: Mon, 27 Oct 2025 17:36:43 -0500
Message-ID: <176160465241.73268.10255088091286075326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
References: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Oct 2025 13:58:24 +0200, Guido Günther wrote:
> They're set in the parent to describe the panel's reg property already.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-shift-axolotl: Drop address and size cells from panel
      commit: 720ebcc3e6b46fe4e01f4ecf1a8a899af213e433

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

