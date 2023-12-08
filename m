Return-Path: <linux-arm-msm+bounces-3835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616F8099DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA18C1F21159
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA88846B3;
	Fri,  8 Dec 2023 02:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC92HtPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD5D6FA7;
	Fri,  8 Dec 2023 02:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A71BC433CA;
	Fri,  8 Dec 2023 02:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004030;
	bh=9+KJFxdoKYDTu22BXc01HrvoWCaUK4XIkr5l2WnuW6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iC92HtPtScSiHFchv8KrH4YHKpyRfJSrBX1kSLBz3R78bWO8klHAxn81p+jHS9rKz
	 Odpn8A+f/tyvejbJamXVFjtRNohIx6wvCxJkIg2UWNk77upKs5yviCNcJ5pxF3Cjq9
	 IlQppEjYCbO4LeBw+cyK07XZpT6u3OCtLZ7vZJw001gCeKVhOsNos4NPeTd53gXW/0
	 gOcXK2ATlI7zZaQYepspWB7bTSGCKPD76M07AkDLp/buimJggotIeSmIrGSjyBfROx
	 8kwcnMZKQ/Tdu6oFB8VuQ8Me4UaWzbwk1wUR7spYVvl8vx/r7A/64CvkxIX06Rl8gV
	 h/Xz82fP/O9fQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steev Klimaszewski <steev@kali.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga: Add wakeup-sources
Date: Thu,  7 Dec 2023 18:57:54 -0800
Message-ID: <170200426917.2871025.5231620499105502810.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107-wakeup-source-v2-1-bf1562ef9367@kali.org>
References: <20231107-wakeup-source-v2-1-bf1562ef9367@kali.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 23:17:10 -0600, Steev Klimaszewski wrote:
> The keyboard and touchpad can be used to wake the machine
> up from sleep, so mark them as such in the dts file.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga: Add wakeup-sources
      commit: fdcc36cda04114878f6c752083669719a3995fce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

