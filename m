Return-Path: <linux-arm-msm+bounces-79056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304AC11CCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4C0B353AA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2126346E41;
	Mon, 27 Oct 2025 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpVT63zG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430D346A19;
	Mon, 27 Oct 2025 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604523; cv=none; b=CVdERm717GZs924HRc2t3x2jrxiRvuyiTATmBy8IOMtvAHOlRCTZt3+fy+NCdZ+Y6FMNvzhI1OYiPaZFM8UAlKLP47Go4ar1pMrjvOqLkcWM+ZYa766TbLkVvD6blmlj75YnLaR9wLQVBCvanPaCvRPRbsVwFLJMK0P7Tv98FZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604523; c=relaxed/simple;
	bh=LjN8+J0b0M8YXWv7gxcDCXfDlWj7Y9sL4bqhmidZdec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzWA0OABn27Ba2Fvf2vsIFwc/DrHfLacWhSqEA5Fs+h2BqrY3Ukz5JUoHVuz8dgF1kkU4da+yr7rsNTnNZTLgVR74E0sOXSryIBIQo4qhpBv6i56Cex1zVd1A/5barNQZBDoFioFcyzulmVbfCRnSz/NM7ANp10zqTjaHHiyCLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpVT63zG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C898C116C6;
	Mon, 27 Oct 2025 22:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604523;
	bh=LjN8+J0b0M8YXWv7gxcDCXfDlWj7Y9sL4bqhmidZdec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WpVT63zGnj+iV6a6XKAgYY/Oom+lgMD1dYJmxvr4YDuEd7Ly7EsVMQJYaZ6aqAD19
	 rv+3yFpbZ2NjfUt2zSPMV2VbMuB+tJEcAKXzSfp5oK/uiUuOAKRTajjNA5cQ8mJmL5
	 k8q3m+2qjFi+Y0WgGSJ/UM8UKbgUoiT9FgnjDIr6j92SmNNlpVnTBCJ5M0SPFfAFFS
	 L1uAbeJF5RJxe+ti5vADMOAz/FwcbK78d/tqVg2bp7peUnVkmTijMLEmpGlFKk1MAO
	 bNnhLEh2SsVrBLslp92uvF9tEpB26CBj5T+/LN08Jll/uasTWB+QVZAcmaVRY8uHae
	 PfIPQ68oVaNfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: set ufs as dma coherent
Date: Mon, 27 Oct 2025 17:37:16 -0500
Message-ID: <176160465206.73268.9315499672676137244.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007-topic-sm8650-upstream-ufs-dma-coherent-v1-1-f3cfeaee04ce@linaro.org>
References: <20251007-topic-sm8650-upstream-ufs-dma-coherent-v1-1-f3cfeaee04ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Oct 2025 20:53:44 +0200, Neil Armstrong wrote:
> The UFS device is ovbiously dma coherent like the other IOMMU devices
> like usb, mmc, ... let's fix this by adding the flag.
> 
> To be sure an extensive test has been performed to be sure it's
> safe, as downstream uses this flag for UFS as well.
> 
> As an experiment, I checked how the dma-coherent could impact
> the UFS bandwidth, and it happens the max bandwidth on cached
> write is slighly highter (up to 10%) while using less cpu time
> since cache sync/flush is skipped.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: set ufs as dma coherent
      commit: c2703c90161b45bca5b65f362adbae02ed71fcc1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

