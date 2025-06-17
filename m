Return-Path: <linux-arm-msm+bounces-61554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B27ADC5AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94C273A916C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C503290BB0;
	Tue, 17 Jun 2025 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frG4H7uC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A221156CA;
	Tue, 17 Jun 2025 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151224; cv=none; b=eDFEyp+8VxKJtLWIXZsl2qyvd4B0ePzam/6nTodDof9B0ZYtflVublQSkQyv65RAN/boGSz+tpf3EENotPH9wkX+hMzqQxaNLlL0siZcXQrjzsR70Izxkswx2R/Dxumrm8knaR0aN2hMbCm8kGKiU5x/4lqCqOEEP5ilN4kcQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151224; c=relaxed/simple;
	bh=QJLiXROGIvQwuM4ojw3rsLJXVIV36PkVK5wy0ON0z40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oXhppdjrslJcsp8694GVbj3QWMgUMMurmrmNDmeNfRQHGjp15yZJWVuINiJcgkt4HsFnKOjliXZCjlIoDwwSJeFNALWvB74ZpjCSz9z7uG4kynYP/earv88lkH9ltjQciLldYhVuXr07HehAC88D1GPVcI4PiPBTFBEyzZ7+Ck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frG4H7uC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB005C4CEE3;
	Tue, 17 Jun 2025 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151224;
	bh=QJLiXROGIvQwuM4ojw3rsLJXVIV36PkVK5wy0ON0z40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=frG4H7uCSOwmWaJmnoJUuQZkYR/x255EI54nMTZFtt2N+HyqznM/+vjPVWzEQtAVn
	 VIoUqJNR3BggMiiG/ERdKhKyJt6Kd+qBUNVmdrBXjy0TjozaS9xVXykrQGUQhjA8O2
	 L9p1y5JOkbDX/DH9mXIg906V1q3Ry/9FhhNMXan6xKQG8ZgnjnOW2SpRKrMKg0QVZm
	 vEqIZFOLYAQFx9JeZUeGJbICSsqejW3kMwn+sQ5J6YuaHbFPHheR9GUdTqxD1Jp83C
	 qi4DwdB/Cb9OxtaQ9xnoD7zRSpYNiXQmp+I5Wl3U42IZidlRF5FtKjKryU3WwJ5Yiq
	 uYb23jP2LH0OQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: johan+linaro@kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <mani@kernel.org>, Slark Xiao <slark_xiao@163.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606095019.383992-1-slark_xiao@163.com>
References: <20250606095019.383992-1-slark_xiao@163.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Change T99W515 to T99W640
Message-Id: <175015122147.21818.13498820747290372997.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 14:37:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 06 Jun 2025 17:50:19 +0800, Slark Xiao wrote:
> T99W515 is a LGA device but not a M.2 modem device.
> So correct this name in case a name mismatch issue.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Change T99W515 to T99W640
      commit: 105e6a6810bf1399a5f4eebec18bdf429648b733

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


