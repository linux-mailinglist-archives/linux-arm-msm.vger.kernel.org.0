Return-Path: <linux-arm-msm+bounces-23514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23011911B24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3B31F2178F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FAB16DEA9;
	Fri, 21 Jun 2024 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMgH9NLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8416DEA2;
	Fri, 21 Jun 2024 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950305; cv=none; b=j4nVU16xGjz0Syl0n/8txFmNP+7ktOxwJ4BDDKStvn4i6+rXAZIS9wT3rkoL5YPqTa+oi7XTIzMMj1h/WxopFixufy5SpqBQ19xqKT9Gdm7E1VnjVQRxSu1w8ZEpl6Did5YPoMbh0gz94cRdIqTrk3vXcaqi5o/70OBCTUh1Yf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950305; c=relaxed/simple;
	bh=DeYqlfXV5PCkIiTjWckT5kb7Ag0arctocPyZOyxJzTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0ugwEUIKPB/xfiE8KuoZ02HI6QYMmpaCruIXQaBdxeTzUHRYKn5D/DWm4ZcoDQRReH5ofmYlzsmVrYWpxx9qMd3BPw07O1KJjutghbDf1UI6CuaiwPThkZU+35qBtQJR2ptAEDRAs9s3dKH6WyxVEf9n3FrwOURiSFM+qkv/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMgH9NLM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90026C4AF07;
	Fri, 21 Jun 2024 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950305;
	bh=DeYqlfXV5PCkIiTjWckT5kb7Ag0arctocPyZOyxJzTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMgH9NLMeNXl5hCURukcVZBBY5gDfBjuD+3T3vlkk+AthmNL1TTboELa8AV95Dm0A
	 izOusQCDoTDACJZI4NoLjqnaz7pS9gefG8ZBtrBnBTzk/SATghhTmaimxl6ao5t7P4
	 iJzi3EVLk/+V5SnGHGJ52Ka5JnC9UYZGwucTgwQpbcK42yD7e4CkqB8V6BicRJDxL4
	 XS8SJpFDVezoV8isn+QB8tZ7Msd1OGW7ij9eAISuhMMJtqLYO6rtWCh8eLGDwlnRaE
	 6i2KeEFmUSQ+E00lTcVdZsnkC0zDCQGK9KZkiTO0oyrUS9EcqpldiCrdOetCrDfkNu
	 rUkt9KUGOGAAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_mojha@quicinc.com
Subject: Re: [PATCH v2] arm64: defconfig: Enable secure QFPROM driver
Date: Fri, 21 Jun 2024 01:11:27 -0500
Message-ID: <171895028806.12506.8259478812930238190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620112716.1339-1-quic_kbajaj@quicinc.com>
References: <20240620112716.1339-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Jun 2024 16:57:16 +0530, Komal Bajaj wrote:
> Enable the secure QFPROM driver used by Qualcomm QDU1000
> platform to read the secure qfprom region allowing LLCC driver
> to get the DDR channel configuration.
> 
> Currently, LLCC is the only user of secure QFPROM, and hence
> setting CONFIG_NVMEM_QCOM_SEC_QFPROM as module to the convenience
> of LLCC module.
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: Enable secure QFPROM driver
      commit: 847ee7c314b88cc77e13cd91f87f50e36d108fdc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

