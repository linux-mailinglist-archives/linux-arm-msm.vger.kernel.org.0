Return-Path: <linux-arm-msm+bounces-27653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D39441C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC03F1C22493
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DA814A4D6;
	Thu,  1 Aug 2024 03:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C05vxnjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1DB14A4CC;
	Thu,  1 Aug 2024 03:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482404; cv=none; b=R9drNl9FESwxuLarDcfwrHTwPYhrUT92Nlwq7pgPLHp/gxIk/7pAfmhsAY7Bpti1XmUrXjEcJb7LNQAjT3ubXI0s9G1boDAopJDSyPip0VsjaitnLrRgsHWVyyfSJ3nKyZSi0P1mwHj+vBgFmzRotZjR24PglUXh6vXDDXJAqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482404; c=relaxed/simple;
	bh=8i2XmissC2+POstefFMFspx6ZpqiULOtxFanFk2OC10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gcbnYl2Hsi5Ubd3LREFh4p6cVNcBwfhSi2ZnZPG2RQnnthulLee7fk5cLQm/wErelqQAiehF/VtOcsQkD7/Q4WMUrmfZSjRd2bQe3yB/0p9nfM5pNqtLNXHc3Ap3tch7hikU78Yf2NDhli8fwdMwL31brUTWVlvZRgKzaV2sAZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C05vxnjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7CCC116B1;
	Thu,  1 Aug 2024 03:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482404;
	bh=8i2XmissC2+POstefFMFspx6ZpqiULOtxFanFk2OC10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C05vxnjBmVdlFrI15q7oTtRPaVyx1CX7OfwH1JOtX0r1NAp7CEY4i15Hkd056veLS
	 7Qj02etjuqRm0ZFjCQM5pc0UXXh+hEmcm9IBI+bq4PbSLh5nNLViu2EWMaEKtuXPKg
	 Xcc7ko/CAkohoUmnfwgJk2fjdPs/ZOx2P4ipiXYqIKLdvGPN2Zi3ypFzwnOeSKHXqZ
	 t94Snw6NqY8vwjNAaYfpx9ga+x2ymE9TE8j5LNynrKhuCIx+aLmupXwj30hcALhCF8
	 Q406UHIb9HXtKS6xl6Iafuh9xMWkC552G030rGzhUyMAVOvnDnamdhoIyDmYKAP+2o
	 dVP/FAOptpw0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Anton Bambura <jenneron@postmarketos.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	=?UTF-8?q?Adam=20S=C5=82abo=C5=84?= <asaillen@protonmail.com>
Subject: Re: [PATCH v3 0/3] Introduce msm8916/39 based Lenovo devices
Date: Wed, 31 Jul 2024 22:19:46 -0500
Message-ID: <172248238594.319692.570167570910701077.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
References: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jul 2024 21:38:46 +0500, Nikita Travkin wrote:
> Continuing the work of upstreaming the various msm8916 devices from the
> backlog, this series introduces few 8916 and 8939 Lenovo/Wingtech
> devices (where Wingtech is the ODM for these designs).
> 
> Included devices are:
> 
> - Lenovo A6000 (Wingtech WT86518)
> - Lenovo A6010 (Wingtech WT86528)
> - Lenovo Vibe K5 (Wingtech WT82918)
> - Lenovo Vibe K5 (HD) (Wingtech WT82918hd)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices
      commit: e3eaace51cb087ee3fdc463b5fd1053fe5539587
[2/3] arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010
      commit: bc5bf7b1ec49bb2c4c3b6ba7952e973a68320d1c
[3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices
      commit: 9a2ec63ae683b35fc52e6ae707c9d301e67eb973

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

