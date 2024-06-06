Return-Path: <linux-arm-msm+bounces-21848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95F8FDD60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8EB42828DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1AD1DFEF;
	Thu,  6 Jun 2024 03:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVWwocMj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E68B4F881;
	Thu,  6 Jun 2024 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644048; cv=none; b=dno3YUndPKS2d5CnEUctBWdMzl1R0jShi5HSbU349GL5TWKhNINo714lENl6uvwnlT8nP5Gbvx+JW10OHcYMsbYupa1yrKW1pU8ykwIB3uYNp9ii4vG16VeZqxD4wOli0RxjQbxLt1b6fbkYt1CqV/W/vVxrNoYCfOJM1hC8mPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644048; c=relaxed/simple;
	bh=zNUszWvCOgXvpwxz1JeZl+yQJ5SAD86EYk6vfECwDEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sbg6rmRTnP2A4o6b/WtMkmExacsnkQ2gPeYtMdGW6x3MEoSZOwbCLm93N9NXJhNY2Y0FHMPPiDe59fZUejq7OhdsrQNdCIrZLMoLHZk82gC50cz7DqFWqm1s1kdN1To+x2FCrWNt7LIqIeUSXR8womwYGIIKv7mRO16ppTcDm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVWwocMj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA86C4AF11;
	Thu,  6 Jun 2024 03:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644047;
	bh=zNUszWvCOgXvpwxz1JeZl+yQJ5SAD86EYk6vfECwDEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVWwocMjeZVDgXCZXpVYOTYk7awuFxAsG/yzYIyhO5GxhnFD32xtg+QmRMqu9vDcl
	 +YfbQ6KH2vooFfvly+Vi6Z+36nIISljgwlrjJ4vm38fwkYLBAyAc18Vp9g7fKZGWDB
	 TUw/jqvWpfRMXj0e3Dofvf7xg7PneoM469JWPZY1UCP4X4dTOIMdK0lfPcmTVL4xcp
	 V7a6P/XZoy4Al6fsA1tYW9Q9ZI2iWx29olPIrLasGeAUMhjZ4lKgidDnJalKvQVIXE
	 v/HeUvWSeubusQ/u9iXL4PESnp1hk/pnriby/ApLfD590nF03VhPiFKZXaKfzdTwkd
	 NC3YL5aYx84tA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] soc: qcom: spm: add missing MODULE_DESCRIPTION()
Date: Wed,  5 Jun 2024 22:20:34 -0500
Message-ID: <171764403329.730206.6359818468291968830.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>
References: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Jun 2024 17:09:34 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 warns:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
> 
> Add the missing MODULE_DESCRIPTION(), using the same description as
> the underlying QCOM_SPM Kconfig item.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: spm: add missing MODULE_DESCRIPTION()
      commit: 1b503fa221d144fbb11e2591378429566564a6b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

