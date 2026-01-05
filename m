Return-Path: <linux-arm-msm+bounces-87468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D1CF4109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E3BA30FD5E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47577318140;
	Mon,  5 Jan 2026 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bwn72LJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C727B340;
	Mon,  5 Jan 2026 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622083; cv=none; b=hVIaaXaxJFf69qX49VAmMWDghklqTvVu8ELfvQM5pMFImNXucsTkW8yjgDRmJH0jWpOP/Sw5wsZ0ofKGZUu4wqvwMkTIb+Ts8zsmG9aKusbukNqj3jUNIGToLW6m6RSVMe2hviBDTh4wjaiCF9yD+VxSTfqVxvmKwEhMiHQf3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622083; c=relaxed/simple;
	bh=bi86ofjhU/mHBq/m/0w31toaGLJU4PVhJwFISrEiBkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxRxatXw8sUmqD2mEXwWKKNhDzE9JcyvhlF9e/8HLjrc59H4ICFekC2f2cVVCwlumKE6O+mFhWXxn6svSaro6d68gpdwcuvLsf+FwC8t1JUQQF2BlTtEmlSeVL1VYrQRKyQ+r2V1OvQ8V7cyLmwHl9vOFzanZKlcExKSV7/c/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bwn72LJI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1FBC4AF09;
	Mon,  5 Jan 2026 14:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622082;
	bh=bi86ofjhU/mHBq/m/0w31toaGLJU4PVhJwFISrEiBkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bwn72LJI3FEUMdixE7dH60eJl29Fef+CyhD3PXFr7v05QTpGZbNKbykbMxtlu7Le6
	 Yapr/R1tIMMGr//IKLFwLO1ytOTONDaYRAVQKJEQ/noq50d4BwQRm5+X6pos6xbf99
	 rLavPdDhVwJyTRz7Ep2A87uOh8sF1li20gOyS1G6ojcqUzFcIj26qbKH8hrskqSWc7
	 UWcdeJ2MP7mu59MXqor1J30jdbDCZy3t8xYa7JwIm0cb0h1r2l0EQUckp4Q0lcjFZp
	 hdW2T5SYvY0hcXbXyKvi5iQ4vrqIxluqRkXespPcCNbI27O4cdfMRpv8/AINzv8Qrx
	 XH+OIE1jw6UlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Petr Hodina <phodina@protonmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	Casey Connolly <casey@connolly.tech>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Mon,  5 Jan 2026 08:07:15 -0600
Message-ID: <176762206382.2923194.3685391400254348366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 14 Dec 2025 15:51:16 +0100, David Heidelberg wrote:
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      commit: 3845bc888660a238920fdba2f85fe284f01fb95f
[8/8] arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL
      commit: a678adbf2d22edcb9078f8ad56706891a0ac9e80

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

